Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB39523090B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 13:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD276E283;
	Tue, 28 Jul 2020 11:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7113E6E283
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 11:40:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r2so12881332wrs.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 04:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TarT8FJy4xxh1Gu95tM1MOrQBSTLu+L0cNKerMl6tuM=;
 b=BIlUz2QYxFWzzF/PGXouifAVShEdvViFuBcAvy11rSq1/UB3TPjN7cDoyPiYLXMGbE
 wMbfEszWmq6MQz43NGegaGCTgKkNGFFlEd8U7O868CP4tprwvtl5q9N3//jweqWAoxxc
 ViHZhLSVULlg1K/JYXV3GQJnuOpvZ5ihctOpovBbCRV+fC2WP5VRqheKMrgizTs8AaEm
 TKpDzIjehfn+zwRq/MR79ctzf0Bpb6beoozBqRgNhS1l1GCds1QqS4WVVolNx+gvcyUk
 p5KoK5+g+A4xIfsgxbPDcFl5QtWVgix3eV/Y5LTJ9A/Od5o+TRrdAyC2L/e9YgXNazw7
 XlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TarT8FJy4xxh1Gu95tM1MOrQBSTLu+L0cNKerMl6tuM=;
 b=piLFg8Em02xIiPl74tY2otyDUo0DEjzjhcBeOnl3XCWBCEf09gQCZeqwMu6lVSAlYj
 bZcxkx2T2+uhrK66wKvgkYP3fPubmkvHCJjNjdLD174UMANHIyizQXfE8Tt7cFABhjhp
 ZIOQxSRlQJi+P+yKzJ7JXGRRQQDwijSF3X2SZJMhEvXQHX9kZM96NP/eIjeqKc2A2pHO
 2pNEZvlepNDgWo4QMoUdZWTFggBueDECgeFwUvrbLz3C1GOyTOKN1xJcThFshXcw//ed
 uA6w1lpUEEXjj5LBjJztmkuPA70rGYSe+PQOOTbKDmTHVv34MCe1nR0LRgPOveIAecfU
 df8Q==
X-Gm-Message-State: AOAM532p9DM7YKNl0ehrKxWXFZvXeHjJ3vT/vaB1wuHAOWVECbE2oNKL
 o1LtpJQWKPDZ/wT/ZSzrJo5VKCpcXIud9iWWuxeuqg==
X-Google-Smtp-Source: ABdhPJyAsLE0Fke7ELR7oeZm8VYO8/GGUEGfQKuUxFj/9hE+upxSUPAEcs2CfEI7Hs0Jh3gu2ANZ6pBVtbr+FcTlaC4=
X-Received: by 2002:a5d:6681:: with SMTP id l1mr23497356wru.47.1595936441188; 
 Tue, 28 Jul 2020 04:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <dd3c4cdda7252e9d40bdbef236d9aaa93af512c5.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <dd3c4cdda7252e9d40bdbef236d9aaa93af512c5.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 12:40:23 +0100
Message-ID: <CAPY8ntARSJHkUvkTs19jk2JFf9qpxuGMaSRCtmO-dcphvDeu=A@mail.gmail.com>
Subject: Re: [PATCH v4 30/78] drm/vc4: crtc: Clear the PixelValve FIFO on
 disable
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
> In order to avoid a stale pixel getting stuck on mode change or a disable
> / enable cycle, we need to make sure to flush the PV FIFO on disable.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 7b178d67187f..13fe0e370fb3 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -408,8 +408,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
>         if (vc4_encoder->post_crtc_disable)
>                 vc4_encoder->post_crtc_disable(encoder);
>
> -       CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) & ~PV_CONTROL_EN);
> -
> +       vc4_crtc_pixelvalve_reset(crtc);
>         vc4_hvs_atomic_disable(crtc, old_state);
>
>         if (vc4_encoder->post_crtc_powerdown)
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
