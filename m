Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD60168FC6
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBAE6E950;
	Sat, 22 Feb 2020 15:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954386E950
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:33:10 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id a22so4735425oid.13
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 07:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=raUZ/2hfPO8bNJbDFXIT/WaeYZwEeGfSJaqGsxzHHqw=;
 b=CDLuYCNGfywnqI0aQ7YKJQX48qEwyHSBcdHfqlhk1g7TVHW4vzdqEh09QtWGeBhDPg
 AfUNmBVNrpK6o5dyDiNjjfye6ozPS4lY3h+wqoymNw3zfqHHNDiEmyin4AyGTbXv2Qn4
 lZMk8ZgUDNdH5s89rDXwT/5Li7bxRXdIlHqsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=raUZ/2hfPO8bNJbDFXIT/WaeYZwEeGfSJaqGsxzHHqw=;
 b=e8LyzApuuMXebCxivrW8TlK48Db/S5EoYPAEND7W1/2YmQ0tW+O59podsyLdHV91AC
 NTzx9AzcTKDDSQGJ5I49RrUY5nYL52H/6+ss1TbXIjLOoAcJQgIeyUUDlBqmDQ13BRAp
 i09Wbo0ySdfN2efAEhKXotdxIkY2ZO4j+8MBHkn7pK51mnyjrV2fi6UZU/83R98dQXVG
 ueEPNHrLNPkQYGt6nth5IpxcraoQHat+pHZ6/v8ShJIWmaKBLW9z4bt8QumWN2EJRpSh
 SsUK3QFpOi3qZAcwZ4c287iYJo8D1qNDD7DhZ6iOVg1UOmHY+5OlrKjPcwt5sx15Zl2b
 HEuA==
X-Gm-Message-State: APjAAAXYguQWSaR7wHW0JjbTdVWcI67VIklwxPimDjJJPc/mlHy1URDx
 x4lxxpZ5ha4tLcDy4pH/hrG3bbpU6yIemlHu5j9LVw==
X-Google-Smtp-Source: APXvYqycqpH9vQnATYNjcM/frIZ1e2MohJVEZk4ExLz+5Lizp2yRZDbTUNzZASEVlrVNpJ3WcDWwqyqHMEAVb6T311U=
X-Received: by 2002:aca:2407:: with SMTP id n7mr6616808oic.14.1582385589728;
 Sat, 22 Feb 2020 07:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
 <20200222150106.22919-7-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20200222150106.22919-7-laurent.pinchart@ideasonboard.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 22 Feb 2020 16:32:58 +0100
Message-ID: <CAKMK7uFywa2GRrEb3zaZ+NtgH+HKLwwdJ_WofJW4qzyZQaSysg@mail.gmail.com>
Subject: Re: [PATCH v7 06/54] drm/bridge: Improve overview documentation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 22, 2020 at 4:01 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Clean up the drm_bridge overview documentation, and expand the
> operations documentation to provide more details on API usage.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/gpu/drm-kms-helpers.rst |  6 +--
>  drivers/gpu/drm/drm_bridge.c          | 76 ++++++++++++++++++++-------
>  2 files changed, 60 insertions(+), 22 deletions(-)
>
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 9668a7fe2408..fe155c6ae175 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -139,11 +139,11 @@ Overview
>  .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
>     :doc: overview
>
> -Default bridge callback sequence
> ---------------------------------
> +Bridge Operations
> +-----------------
>
>  .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> -   :doc: bridge callbacks
> +   :doc: bridge operations
>
>
>  Bridge Helper Reference
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 68ab933ee430..5f55a9e17a7c 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -39,25 +39,36 @@
>   * encoder chain.
>   *
>   * A bridge is always attached to a single &drm_encoder at a time, but can be
> - * either connected to it directly, or through an intermediate bridge::
> + * either connected to it directly, or through a chain of bridges::
>   *
> - *     encoder ---> bridge B ---> bridge A
> + *     [ CRTC ---> ] Encoder ---> Bridge A ---> Bridge B
>   *
> - * Here, the output of the encoder feeds to bridge B, and that furthers feeds to
> - * bridge A.
> + * Here, the output of the encoder feeds to bridge A, and that furthers feeds to
> + * bridge B. Bridge chains can be arbitrarily long, and shall be fully linear:
> + * Chaining multiple bridges to the output of a bridge, or the same bridge to
> + * the output of different bridges, is not supported.
>   *
> - * The driver using the bridge is responsible to make the associations between
> - * the encoder and bridges. Once these links are made, the bridges will
> - * participate along with encoder functions to perform mode_set/enable/disable
> - * through the ops provided in &drm_bridge_funcs.
> + * Display drivers are responsible for linking encoders with the first bridge
> + * in the chains. This is done by acquiring the appropriate bridge with
> + * of_drm_find_bridge() or drm_of_find_panel_or_bridge(), or creating it for a
> + * panel with drm_panel_bridge_add_typed() (or the managed version
> + * devm_drm_panel_bridge_add_typed()). Once acquired, the bridge shall be
> + * attached to the encoder with a call to drm_bridge_attach().
>   *
> - * drm_bridge, like drm_panel, aren't drm_mode_object entities like planes,
> + * Bridges are responsible for linking themselves with the next bridge in the
> + * chain, if any. This is done the same way as for encoders, with the call to
> + * drm_bridge_attach() occurring in the &drm_bridge_funcs.attach operation.
> + *
> + * Once these links are created, the bridges will automatically participate
> + * along with encoder functions to perform mode setting, enable and disable
> + * through the corresponding operations provided in &drm_bridge_funcs. This
> + * requires no intervention from display drivers.

This is not quite correct, since this fully automatic behaviour only
happens if you're using the drm_atomic_helper_modeset_disables and
drm_atomic_helper_modeset_enables functions. If you roll your own
(which is totally fine, that's why atomic helpers are modular), you
need to call the relevant bridge functions yourself. I think would be
good to clarify that and add links to the relevant bridge functions in
a sentence here too. At least the bridge chain functions involved in
this modeset stuff. Also, probe side only happens if you use
drm_atomic_helper_check_modeset(), good to mention that too and the
set of relevant bridge chain helpers for ti.

> + * &drm_bridge, like &drm_panel, aren't &drm_mode_object entities like planes,
>   * CRTCs, encoders or connectors and hence are not visible to userspace. They
>   * just provide additional hooks to get the desired output at the end of the
>   * encoder chain.
>   *
> - * Bridges can also be chained up using the &drm_bridge.chain_node field.
> - *
>   * Both legacy CRTC helpers and the new atomic modeset helpers support bridges.
>   */
>
> @@ -212,14 +223,41 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>  }
>
>  /**
> - * DOC: bridge callbacks
> - *
> - * The &drm_bridge_funcs ops are populated by the bridge driver. The DRM
> - * internals (atomic and CRTC helpers) use the helpers defined in drm_bridge.c
> - * These helpers call a specific &drm_bridge_funcs op for all the bridges
> - * during encoder configuration.
> - *
> - * For detailed specification of the bridge callbacks see &drm_bridge_funcs.
> + * DOC: bridge operations
> + *
> + * Bridge drivers expose operations through the &drm_bridge_funcs structure.
> + * The DRM internals (atomic and CRTC helpers) use the helpers defined in
> + * drm_bridge.c to call bridge operations. Those operations are divided in
> + * two big categories to support different parts of the bridge usage.
> + *
> + * - The encoder-related operations support control of the bridges in the
> + *   chain, and are roughly counterparts to the &drm_encoder_helper_funcs
> + *   operations. They are used by the legacy CRTC and the atomic modeset
> + *   helpers to perform mode validation, fixup and setting, and enable and
> + *   disable the bridge automatically.
> + *
> + *   The enable and disable operations are split in
> + *   &drm_bridge_funcs.pre_enable, &drm_bridge_funcs.enable,
> + *   &drm_bridge_funcs.disable and &drm_bridge_funcs.post_disable to provide
> + *   finer-grained control.
> + *
> + *   Bridge drivers may implement the legacy version of those operations, or
> + *   the atomic version (prefixed with atomic\_), in which case they shall also
> + *   implement the atomic state bookkeeping operations
> + *   (&drm_bridge_funcs.atomic_duplicate_state,
> + *   &drm_bridge_funcs.atomic_destroy_state and &drm_bridge_funcs.reset).
> + *   Mixing atomic and non-atomic versions of the operations is not supported.
> + *
> + * - The bus format negotiation operations
> + *   &drm_bridge_funcs.atomic_get_output_bus_fmts and
> + *   &drm_bridge_funcs.atomic_get_input_bus_fmts allow bridge drivers to
> + *   negotiate the formats transmitted between bridges in the chain when
> + *   multiple formats are supported. Negotiation for formats is performed
> + *   transparently for display drivers by the atomic modeset helpers. Only
> + *   atomic versions of those operations exist, bridge drivers that need to
> + *   implement them shall thus also implement the atomic version of the
> + *   encoder-related operations. This feature is not supported by the legacy
> + *   CRTC helpers.
>   */

With the one gap/slight incorrectness addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks a lot for keeping our docs relevant!

Cheers, Daniel

>
>  /**
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
