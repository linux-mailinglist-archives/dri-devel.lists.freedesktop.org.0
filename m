Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1238E23089A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 13:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12446E26C;
	Tue, 28 Jul 2020 11:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194BE6E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 11:25:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r2so12837375wrs.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 04:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=01W6bDMMr/9SeqGNAca6mqzfZvjZHQBkuzzpt+5sERc=;
 b=BFhBYAblS2kS48Qsdd8d02m5F9TXV37ymz7H00YDmaAEGVoVo8qIPLYY0UjfGymCAb
 IGC4u6E+FaDCX2UG1DFEWdezGB4HLfkskioBHmDLE0eNEL9crb2QqmOSuOAkCnQQRqqj
 rJbPYAe/5RDLRTNq/EyxF8NR5rhQv3f3X1T8We2ulAi3EDXCV6DjRkwdtY/DxscKFgWh
 QVkAvZa76E2nMsHqw5QtylHxdrFpK8dI2qJn5KpJfiFMpPcnPsHEHPXkqmJplEPLRIGg
 dU2cZrm6iJW+EATyj4dd9/yfNa+j3YQvJEBtF9dpcbVvSKQiooJqMkk8brUC5PaB7iCK
 rx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=01W6bDMMr/9SeqGNAca6mqzfZvjZHQBkuzzpt+5sERc=;
 b=p129opMuAFOQBaDK7EKKbfZwF1+vCCAUH2O+0VIVeDjZE8XZ4CntvF8e62KZMsaeZ+
 ct2NE0Gl9jO2QPzfyFIAdwBZVfSBLnZZXYFapSfScnfoJmYPH4GEq4gceMtPec6AtaHk
 8hRNoZeGroqvVpby1ZcJhigxADDi503I1GRStsvORB18GiJuWinlSOxTzJPsOaK9B+vM
 vPs5N5By4qjkSor//nksGMbEHVcOUHTOv9I/9NekrmMs0sF8lsDPW8rQQkxORbhcH0ci
 PnV3FvLt6dNfXCReCm3FZIy+duGKh+njo4NXgQSGn094T4Ag8OycJ3p8xS6qrIcqgrnd
 nXbQ==
X-Gm-Message-State: AOAM531hXKVweMo5Bbe+FVA1/xJ9PhUZkUwxwq+PcnGR2rVMqzlVtSkL
 rDV1X+8K9IVuHhZJz0lWhMFa9OEj8a+Uo50jjztfsg==
X-Google-Smtp-Source: ABdhPJyW96+nJG/qGUJ5CLd6oUoQmnituQIg/MeTxa60UlVUr5zPOJnzE9jCKFnkSxX5KeQi//ytGNtBOAOj/9zBu2U=
X-Received: by 2002:a5d:5383:: with SMTP id d3mr17563956wrv.42.1595935522766; 
 Tue, 28 Jul 2020 04:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <5fadf9256d130d447e3c66a0c86ceeba05c47fa4.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <5fadf9256d130d447e3c66a0c86ceeba05c47fa4.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 12:25:07 +0100
Message-ID: <CAPY8ntA-Ywzk6usF0cgTLZ_YtAP3FD1RM9duJTu1A7+sP=DUjw@mail.gmail.com>
Subject: Re: [PATCH v4 28/78] drm/vc4: encoder: Add finer-grained encoder
 callbacks
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
>
> In the BCM2711, the setup of the HVS, pixelvalve and HDMI controller
> requires very precise ordering and timing that the regular atomic callbacks
> don't provide. Let's add new callbacks on top of the regular ones to be
> able to split the configuration as needed.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_drv.h  |  7 +++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index b7b0e19e2fe1..d0b326e1df0a 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -389,6 +389,8 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
>  {
>         struct drm_device *dev = crtc->dev;
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> +       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
> +       struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
>         int ret;
>
>         require_hvs_enabled(dev);
> @@ -401,10 +403,16 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
>         ret = wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
>         WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
>
> +       if (vc4_encoder->post_crtc_disable)
> +               vc4_encoder->post_crtc_disable(encoder);
> +
>         CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) & ~PV_CONTROL_EN);
>
>         vc4_hvs_atomic_disable(crtc, old_state);
>
> +       if (vc4_encoder->post_crtc_powerdown)
> +               vc4_encoder->post_crtc_powerdown(encoder);
> +
>         /*
>          * Make sure we issue a vblank event after disabling the CRTC if
>          * someone was waiting it.
> @@ -424,6 +432,8 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
>  {
>         struct drm_device *dev = crtc->dev;
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> +       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
> +       struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
>
>         require_hvs_enabled(dev);
>
> @@ -434,15 +444,24 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
>
>         vc4_hvs_atomic_enable(crtc, old_state);
>
> +       if (vc4_encoder->pre_crtc_configure)
> +               vc4_encoder->pre_crtc_configure(encoder);
> +
>         vc4_crtc_config_pv(crtc);
>
>         CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
>
> +       if (vc4_encoder->pre_crtc_enable)
> +               vc4_encoder->pre_crtc_enable(encoder);
> +
>         /* When feeding the transposer block the pixelvalve is unneeded and
>          * should not be enabled.
>          */
>         CRTC_WRITE(PV_V_CONTROL,
>                    CRTC_READ(PV_V_CONTROL) | PV_VCONTROL_VIDEN);
> +
> +       if (vc4_encoder->post_crtc_enable)
> +               vc4_encoder->post_crtc_enable(encoder);
>  }
>
>  static enum drm_mode_status vc4_crtc_mode_valid(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index dfcc684f5d28..251fcc35530c 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -439,6 +439,13 @@ struct vc4_encoder {
>         struct drm_encoder base;
>         enum vc4_encoder_type type;
>         u32 clock_select;
> +
> +       void (*pre_crtc_configure)(struct drm_encoder *encoder);
> +       void (*pre_crtc_enable)(struct drm_encoder *encoder);
> +       void (*post_crtc_enable)(struct drm_encoder *encoder);
> +
> +       void (*post_crtc_disable)(struct drm_encoder *encoder);
> +       void (*post_crtc_powerdown)(struct drm_encoder *encoder);
>  };
>
>  static inline struct vc4_encoder *
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
