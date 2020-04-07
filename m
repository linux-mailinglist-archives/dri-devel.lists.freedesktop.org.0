Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 661CC1A13D4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 20:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CF56E8D2;
	Tue,  7 Apr 2020 18:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EDE6E8D1;
 Tue,  7 Apr 2020 18:37:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id ADA8280536;
 Tue,  7 Apr 2020 20:37:55 +0200 (CEST)
Date: Tue, 7 Apr 2020 20:37:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 05/17] drm: Shrink {width,height}_mm to u16
Message-ID: <20200407183754.GE6356@ravnborg.org>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403204008.14864-6-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=QX4gbG5DAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=88VlXw9QcKJzDa0I9OEA:9
 a=wPNLvfGTeEIA:10 a=AbAUZ8qAyYyZVLSsDulk:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 11:39:56PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Instead of supporting ~2000km wide displayes let's limit ourselves
> to ~65m. That seems plenty big enough to me.
> =

> Even with EDID_QUIRK_DETAILED_IN_CM EDIDs seem to be limited to
> 10*0xfff which fits into the 16 bits.
> =

> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  include/drm/drm_modes.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index 8b05f3705d0e..3625e3681488 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -330,7 +330,7 @@ struct drm_display_mode {
>  	 * Addressable size of the output in mm, projectors should set this to
>  	 * 0.
>  	 */
> -	int width_mm;
> +	u16 width_mm;
>  =

>  	/**
>  	 * @height_mm:
> @@ -338,7 +338,7 @@ struct drm_display_mode {
>  	 * Addressable size of the output in mm, projectors should set this to
>  	 * 0.
>  	 */
> -	int height_mm;
> +	u16 height_mm;
>  =

>  	/**
>  	 * @crtc_clock:
> -- =

> 2.24.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
