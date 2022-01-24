Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9A6499D33
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 23:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F12F10E20A;
	Mon, 24 Jan 2022 22:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB0D10E20A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 22:18:18 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 g15-20020a9d6b0f000000b005a062b0dc12so2838387otp.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 14:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3A0mFpw9X5Al6G1YVf966MuP2BURvQXoIQMkwAWRx9s=;
 b=UeNFh9IqYvOvfe2ZlCrICPSEfckaAsNzxcIUXnqdK+kVpOPPbPcraJTd8qi/BrN40G
 eQJJwJ/wPh+Ie7YC6jIUoA08lM3jH000I7HB1kTzRsUdn57Yyn8yjIq/6hn0ozb6AD7A
 NuKvuyRzdttelvo5sVDnG+VD1egHuRResSCOJqtH9CxwO8vSVh1/yzhyMEpSjWmlOgsI
 lYQIRjGPcUjcR5WQNAcUM7bdVp9MW7Ko1xqnruKwsp2fmvNUJOewVR9VEVJYG2h1F+/z
 JWi9Km//Kf4Q30DIFKng5sqs7UM1azGI0ik1S20mcS+f24qMgZKhKFyQIbcuD6UiR7wX
 2x5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3A0mFpw9X5Al6G1YVf966MuP2BURvQXoIQMkwAWRx9s=;
 b=PcxNZ02zcbnX1dN/ob5t84uHloFhGjNKKjshgz8ZKJ91VbakKqOvlSggcnG4PoQPqX
 a1eWDPIzjzzdPtXroAs1dOMViECFYBiXiDGITaRkDJDm03qdgiEQTPxmDWryrGrlHzf0
 wd1Q9EklfRiArPCwTrJycEbpO4NsVMgQB75565HW1XeF/ua4ITELVzCAA5/pRP4/wuoe
 I8Mz/wvS6x+1ukm52PlZGYwpf3xejsqEUpAwxlcRwS0WkMGtMCIzDgBFjWgatr3pUvMg
 WrIRid0OM+cG5XDKtVz3lkjo2RCldQhhdyThpH/QXPL5hD87v2qatiFHLM2nlqZvXajd
 f2fA==
X-Gm-Message-State: AOAM531fv9+7sg38PqbUxSNcPokUWFn9q/OGJwAPIjdbVaqB1+gKm6Q+
 p3MNuizDfpcm1HrveKjYE82ayxPWLTLzlnQebWs=
X-Google-Smtp-Source: ABdhPJxfilrDFgO4kgwlfcHYwiywdkC4/eMksd07D7A7q91TVr2GW0qYURohKTmkkry921a9gHYPqK6yMOJpa3Lj5gw=
X-Received: by 2002:a05:6830:1d90:: with SMTP id
 y16mr13168993oti.200.1643062697993; 
 Mon, 24 Jan 2022 14:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
 <20220124221633.952374-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20220124221633.952374-1-daniel.vetter@ffwll.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jan 2022 17:18:07 -0500
Message-ID: <CADnq5_MqousgCfGsctBF-ek2hJj4m6sL83JSja6gLTXb9ETuKA@mail.gmail.com>
Subject: Re: [PATCH] drm/docs: Document where the C8 color lut is stored
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 5:16 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> Also add notes that for atomic drivers it's really somewhere else and
> no longer in struct drm_crtc.
>
> Maybe we should put a bigger warning here that this is confusing,
> since the pixel format is a plane property, but the GAMMA_LUT property
> is on the crtc. But I think we can fix this if/when someone finds a
> need for a per-plane CLUT, since I'm not sure such hw even exists. I'm
> also not sure whether even hardware with a CLUT and a full color
> correction pipeline with degamm/cgm/gamma exists.
>
> Motivated by comments from Geert that we have a gap here.
>
> v2: More names for color luts (Laurent).
>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_color_mgmt.c |  4 ++++
>  include/drm/drm_crtc.h           | 10 ++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color=
_mgmt.c
> index bb14f488c8f6..9079fbe21d2f 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -82,6 +82,10 @@
>   *     driver boot-up state too. Drivers can access this blob through
>   *     &drm_crtc_state.gamma_lut.
>   *
> + *     Note that for mostly historical reasons stemming from Xorg herita=
ge,
> + *     this is also used to store the color map (also sometimes color lu=
t, CLUT
> + *     or color palette) for indexed formats like DRM_FORMAT_C8.
> + *
>   * =E2=80=9CGAMMA_LUT_SIZE=E2=80=9D:
>   *     Unsigned range property to give the size of the lookup table to b=
e set
>   *     on the GAMMA_LUT property (the size depends on the underlying har=
dware).
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 4d01b4d89775..a70baea0636c 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -285,6 +285,10 @@ struct drm_crtc_state {
>          * Lookup table for converting pixel data after the color convers=
ion
>          * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (if n=
ot
>          * NULL) is an array of &struct drm_color_lut.
> +        *
> +        * Note that for mostly historical reasons stemming from Xorg her=
itage,
> +        * this is also used to store the color map (also sometimes color=
 lut,
> +        * CLUT or color palette) for indexed formats like DRM_FORMAT_C8.
>          */
>         struct drm_property_blob *gamma_lut;
>
> @@ -1075,12 +1079,18 @@ struct drm_crtc {
>         /**
>          * @gamma_size: Size of legacy gamma ramp reported to userspace. =
Set up
>          * by calling drm_mode_crtc_set_gamma_size().
> +        *
> +        * Note that atomic drivers need to instead use
> +        * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
>          */
>         uint32_t gamma_size;
>
>         /**
>          * @gamma_store: Gamma ramp values used by the legacy SETGAMMA an=
d
>          * GETGAMMA IOCTls. Set up by calling drm_mode_crtc_set_gamma_siz=
e().
> +        *
> +        * Note that atomic drivers need to instead use
> +        * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
>          */
>         uint16_t *gamma_store;
>
> --
> 2.33.0
>
