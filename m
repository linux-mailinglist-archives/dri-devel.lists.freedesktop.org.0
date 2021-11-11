Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9A544CE78
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 01:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D396E808;
	Thu, 11 Nov 2021 00:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CC56E7D0;
 Thu, 11 Nov 2021 00:44:54 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id 131so10831702ybc.7;
 Wed, 10 Nov 2021 16:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IHdiYL3cxbXW8DXukBSNbWzFXQ2ZTphPzz8jNMSG7ZQ=;
 b=NCjewzkAS/Dj9WlEgcC3RwThqJGhwzDK1mNb1NL5C+OvoIYncN+6twY715xEyI/uip
 K/qMtE0XX1v57zHOwEnro/qqlqJD/xKe3BmWAuyRz6QwGV8n/IX1QSPYs/6OygoGv1pm
 rEW1Y3uKldvbMOW5j86UH/8JwULuavsxKaLCC+B7A+ztsLBOEYUB6zjP8DHnJzEZFR4K
 WDkt+4naB2xcFnIwu5upBnugulgq4qvmPonyMRSVLrRbam7JkqP+YxK9vt0oHc14Hn/C
 dbW0zn7QZ6EtaOTP5XgxHb1grGJoeofbofig0DmemMFB7EXfSmgN7suJ1zwKp1bS/1R3
 j50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IHdiYL3cxbXW8DXukBSNbWzFXQ2ZTphPzz8jNMSG7ZQ=;
 b=PWyrVt+qANda3jSHSg8ABRwG3XLprsSucftRi3r82FHe0fsLidNAgYBYGU6dJBv8Lg
 RRq6i6CSlueWU86TUbB4hQhhgq/U7UC7SsOl3fB4GhG34ErLIZHLQkxh+z1ise/Hl3h6
 QVLK8vD4mC3a7x+RfchLZowSKwpEuccM9/2MJpfb46YUKGpr+RDxzwBcDfDp1wMtD5HB
 WZD1SSmlmnwKTzVnT3RWl7CAxONOnWWNqROlVy12fqqsWl0WgNtd0y04GlcIWdGgdzSa
 /nOZuXyx6yIzDkbEKZGi175uaP43B462ZktBO0gEOVXkozlWRbGKSifajiAQsU0NvRcN
 1vzg==
X-Gm-Message-State: AOAM533ri6alMCxbOW/xV0GirIEABCERQCEVJaf+WC4o4U6Qb62wr0yG
 D6lrb4P7UUbINx3P8J8mIZeS10/IpHY/dK8m8wztR2Qn
X-Google-Smtp-Source: ABdhPJxgh3OoKFM+M16mfvYqKrgCbb/5rvFgVv3xP2gLxSKknm8Wys0gSGTp3Z+8AC/x+zly3AH2TB1yTaR4tm4tCXs=
X-Received: by 2002:a05:6902:100b:: with SMTP id
 w11mr4157868ybt.64.1636591493569; 
 Wed, 10 Nov 2021 16:44:53 -0800 (PST)
MIME-Version: 1.0
References: <e9a4a58a-0500-50f6-58cc-938a253cedeb@xs4all.nl>
In-Reply-To: <e9a4a58a-0500-50f6-58cc-938a253cedeb@xs4all.nl>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 11 Nov 2021 10:44:42 +1000
Message-ID: <CACAvsv7sMo_VLjWXdPNaxeLdJL5EMnHsRN=nt32wbTK3KhWaAg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: set RGB quantization range to FULL
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Nov 2021 at 01:58, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> The nouveau driver outputs full range RGB, but the AVI InfoFrame just says
> 'Default' instead of 'Full'.
>
> Call drm_hdmi_avi_infoframe_quant_range to fill in the quantization field of
> the AVI InfoFrame correctly. Now displays that advertise RGB Selectable
> Quantization Range in their EDID will understand that full range is transmitted
> by the HDMI output. This is consistent to how the Nvidia's driver behaves.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index d7b9f7f8c9e3..b05c01927fe6 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -852,6 +852,9 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
>         ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame.avi,
>                                                        &nv_connector->base, mode);
>         if (!ret) {
> +               drm_hdmi_avi_infoframe_quant_range(&avi_frame.avi,
> +                                                  &nv_connector->base, mode,
> +                                                  HDMI_QUANTIZATION_RANGE_FULL);
>                 /* We have an AVI InfoFrame, populate it to the display */
>                 args.pwr.avi_infoframe_length
>                         = hdmi_infoframe_pack(&avi_frame, args.infoframes, 17);
