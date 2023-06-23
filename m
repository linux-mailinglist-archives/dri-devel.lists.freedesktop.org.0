Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BD773B986
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 16:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD6D10E05D;
	Fri, 23 Jun 2023 14:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB20410E05D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 14:11:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A816BBC;
 Fri, 23 Jun 2023 16:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687529473;
 bh=jQQPex0JN1l1oytGq9J9iPOt/7O03Da8iTuVVVrJVjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p6a/KVdwUBsX7j45+54zvz/a16B7/9oMSwCJPzWDA5VWTna29TEN/VwZBzAn98P3q
 o02i4kJAGjsaN7v10alIkCrZfp4z8CFgtlGI+0X7AOSDZwnTLeDSN5IO5CMCpSou0Q
 KN/Pmd8y/3CCrG0wZBi+hI6OTZMWDuYmW2XdiaAw=
Date: Fri, 23 Jun 2023 17:11:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 3/4] drm: Remove references to removed transitional
 helpers
Message-ID: <20230623141149.GD2112@pendragon.ideasonboard.com>
References: <cover.1686318012.git.geert+renesas@glider.be>
 <8f5e13f8f2d12daab9e7f06bba88dc547a4db695.1686318012.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f5e13f8f2d12daab9e7f06bba88dc547a4db695.1686318012.git.geert+renesas@glider.be>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jyri Sarha <jyri.sarha@iki.fi>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Fri, Jun 09, 2023 at 03:44:29PM +0200, Geert Uytterhoeven wrote:
> The transitional helpers were removed a long time ago, but some
> references stuck.  Remove them.
> 
> Fixes: 21ebe615c16994f3 ("drm: Remove transitional helpers")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v2:
>   - Drop "first part" in drivers/gpu/drm/drm_plane_helper.c.
> ---
>  drivers/gpu/drm/drm_plane_helper.c       | 12 +-----
>  include/drm/drm_crtc.h                   |  5 ---
>  include/drm/drm_modeset_helper_vtables.h | 48 +++++++++++-------------
>  3 files changed, 23 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index c91e454eba097942..5e95089676ff81ed 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -40,8 +40,8 @@
>  /**
>   * DOC: overview
>   *
> - * This helper library has two parts. The first part has support to implement
> - * primary plane support on top of the normal CRTC configuration interface.
> + * This helper library contains helpers to implement primary plane support on
> + * top of the normal CRTC configuration interface.
>   * Since the legacy &drm_mode_config_funcs.set_config interface ties the primary
>   * plane together with the CRTC state this does not allow userspace to disable
>   * the primary plane itself. The default primary plane only expose XRBG8888 and
> @@ -51,14 +51,6 @@
>   * planes, and newly merged drivers must not rely upon these transitional
>   * helpers.
>   *
> - * The second part also implements transitional helpers which allow drivers to
> - * gradually switch to the atomic helper infrastructure for plane updates. Once
> - * that switch is complete drivers shouldn't use these any longer, instead using
> - * the proper legacy implementations for update and disable plane hooks provided
> - * by the atomic helpers.
> - *
> - * Again drivers are strongly urged to switch to the new interfaces.
> - *
>   * The plane helpers share the function table structures with other helpers,
>   * specifically also the atomic helpers. See &struct drm_plane_helper_funcs for
>   * the details.
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 8e1cbc75143ef216..8b48a1974da3143c 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -77,11 +77,6 @@ struct drm_plane_helper_funcs;
>   * intended to indicate whether a full modeset is needed, rather than strictly
>   * describing what has changed in a commit. See also:
>   * drm_atomic_crtc_needs_modeset()
> - *
> - * WARNING: Transitional helpers (like drm_helper_crtc_mode_set() or
> - * drm_helper_crtc_mode_set_base()) do not maintain many of the derived control
> - * state like @plane_mask so drivers not converted over to atomic helpers should
> - * not rely on these being accurate!
>   */
>  struct drm_crtc_state {
>  	/** @crtc: backpointer to the CRTC */
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index 965faf082a6d1acb..e3c3ac615909474b 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -59,8 +59,8 @@ enum mode_set_atomic {
>  /**
>   * struct drm_crtc_helper_funcs - helper operations for CRTCs
>   *
> - * These hooks are used by the legacy CRTC helpers, the transitional plane
> - * helpers and the new atomic modesetting helpers.
> + * These hooks are used by the legacy CRTC helpers and the new atomic
> + * modesetting helpers.
>   */
>  struct drm_crtc_helper_funcs {
>  	/**
> @@ -216,9 +216,7 @@ struct drm_crtc_helper_funcs {
>  	 *
>  	 * This callback is used to update the display mode of a CRTC without
>  	 * changing anything of the primary plane configuration. This fits the
> -	 * requirement of atomic and hence is used by the atomic helpers. It is
> -	 * also used by the transitional plane helpers to implement a
> -	 * @mode_set hook in drm_helper_crtc_mode_set().
> +	 * requirement of atomic and hence is used by the atomic helpers.
>  	 *
>  	 * Note that the display pipe is completely off when this function is
>  	 * called. Atomic drivers which need hardware to be running before they
> @@ -333,8 +331,8 @@ struct drm_crtc_helper_funcs {
>  	 * all updated. Again the recommendation is to just call check helpers
>  	 * until a maximal configuration is reached.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional.
>  	 *
>  	 * NOTE:
>  	 *
> @@ -373,8 +371,8 @@ struct drm_crtc_helper_funcs {
>  	 * has picked. See drm_atomic_helper_commit_planes() for a discussion of
>  	 * the tradeoffs and variants of plane commit helpers.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional.
>  	 */
>  	void (*atomic_begin)(struct drm_crtc *crtc,
>  			     struct drm_atomic_state *state);
> @@ -397,8 +395,8 @@ struct drm_crtc_helper_funcs {
>  	 * has picked. See drm_atomic_helper_commit_planes() for a discussion of
>  	 * the tradeoffs and variants of plane commit helpers.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional.
>  	 */
>  	void (*atomic_flush)(struct drm_crtc *crtc,
>  			     struct drm_atomic_state *state);
> @@ -507,8 +505,8 @@ static inline void drm_crtc_helper_add(struct drm_crtc *crtc,
>  /**
>   * struct drm_encoder_helper_funcs - helper operations for encoders
>   *
> - * These hooks are used by the legacy CRTC helpers, the transitional plane
> - * helpers and the new atomic modesetting helpers.
> + * These hooks are used by the legacy CRTC helpers and the new atomic
> + * modesetting helpers.
>   */
>  struct drm_encoder_helper_funcs {
>  	/**
> @@ -1185,8 +1183,7 @@ static inline void drm_connector_helper_add(struct drm_connector *connector,
>  /**
>   * struct drm_plane_helper_funcs - helper operations for planes
>   *
> - * These functions are used by the atomic helpers and by the transitional plane
> - * helpers.
> + * These functions are used by the atomic helpers.
>   */
>  struct drm_plane_helper_funcs {
>  	/**
> @@ -1221,9 +1218,8 @@ struct drm_plane_helper_funcs {
>  	 * The helpers will call @cleanup_fb with matching arguments for every
>  	 * successful call to this hook.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional. See @begin_fb_access
> -	 * for preparing per-commit resources.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional. See @begin_fb_access for preparing per-commit resources.
>  	 *
>  	 * RETURNS:
>  	 *
> @@ -1240,8 +1236,8 @@ struct drm_plane_helper_funcs {
>  	 * This hook is called to clean up any resources allocated for the given
>  	 * framebuffer and plane configuration in @prepare_fb.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional.
>  	 */
>  	void (*cleanup_fb)(struct drm_plane *plane,
>  			   struct drm_plane_state *old_state);
> @@ -1295,8 +1291,8 @@ struct drm_plane_helper_funcs {
>  	 * all updated. Again the recommendation is to just call check helpers
>  	 * until a maximal configuration is reached.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional.
>  	 *
>  	 * NOTE:
>  	 *
> @@ -1326,8 +1322,7 @@ struct drm_plane_helper_funcs {
>  	 * has picked. See drm_atomic_helper_commit_planes() for a discussion of
>  	 * the tradeoffs and variants of plane commit helpers.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional.
> +	 * This callback is used by the atomic modeset helpers, but it is optional.
>  	 */
>  	void (*atomic_update)(struct drm_plane *plane,
>  			      struct drm_atomic_state *state);
> @@ -1376,9 +1371,8 @@ struct drm_plane_helper_funcs {
>  	 * has picked. See drm_atomic_helper_commit_planes() for a discussion of
>  	 * the tradeoffs and variants of plane commit helpers.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional. It's intended to
> -	 * reverse the effects of @atomic_enable.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional. It's intended to reverse the effects of @atomic_enable.
>  	 */
>  	void (*atomic_disable)(struct drm_plane *plane,
>  			       struct drm_atomic_state *state);

-- 
Regards,

Laurent Pinchart
