Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1278F230A37
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 14:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A32A6E28E;
	Tue, 28 Jul 2020 12:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8426E290
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 12:32:41 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l2so7560648wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nmyno9CIxd/+eR+0JKHQRxoaOxegsT0ZP95p/Ej5zhc=;
 b=MCP5bleaKYrlAN1Lt4mDE2kQD8VpsyxWB+Hndi9o1BryiarY15foTB/dA1WicT9wLG
 7etihHMIFMAjmm9cqjfTg4hf4wLJ1pMwAXUI58wJ1I6oMBZ5QAtdDgRv3AlfANEvusOs
 fAkrJs6xv7vNJ1Qve1vNBPxs96Pap0ztLSYnSvC37Lz4/vEwT+k0LbRpOvwKZi00m3lZ
 eHsX1fA1Md9ybVcg5++BzaK+w2dbMvger7ga6u5/3WndtHO46QNDctwduobrcIdcnL04
 9vLNlFo6RLte5WHWiHF+rhUQawdhq9VCT2dsDrEdC/NRhiYq0U8JMyhl+03UOHEW8vGJ
 KN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nmyno9CIxd/+eR+0JKHQRxoaOxegsT0ZP95p/Ej5zhc=;
 b=owAsW7+vRdWpkbAJGkKOzuFU+SkMm6UiXhiPhvCiKeQbARqUbd49kVQpBzpGDtTrzv
 6Bv8BDlPc2uvDu8Fu2TYY0W13bSuj/7SxSGroydvDsM2fh1q3XOis+v5LKcMcI1LdrEL
 mJ1fD79Ljhgi1TRVor2OxQ+Ft1t3HjRL7mMGTN/rWnW+BtJlG7+/uXTQyGCJ+NJZhXt/
 NZYE822fmlCzNTuuMDg+V+/C5jSvmGBdJ0Szh7us4D0fdfvDj8PZn/TakBZR6iLs4mmN
 0LIO8Gp5UQeV4hojIlW8hSEfuwhI7mTsGBQK12LdnGTYUQaLvAO5UBXVYt4GKkjZRXSf
 Dd2g==
X-Gm-Message-State: AOAM533O6YWmMiKZrptQIihTDGyfuGxQ5DuVSOCq3+96XdBYR7osfZhP
 I9GegTrEzdzY4SsSUAPLyQkVhu3uMhQD0opNsxQQVQ==
X-Google-Smtp-Source: ABdhPJyv9CCzW7zYuKRzEQvuf9ZaMdt+mIXn+QTeMAahyGfeWLb6vZtQBtj8lQ4/s+nClbbntdq9WWfdIK3um6CrEIg=
X-Received: by 2002:a5d:6681:: with SMTP id l1mr23678224wru.47.1595939559697; 
 Tue, 28 Jul 2020 05:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <0fc40024f73b3bc6d9eba0b47da217ed130c3374.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <0fc40024f73b3bc6d9eba0b47da217ed130c3374.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 13:32:22 +0100
Message-ID: <CAPY8ntAWq_3=K_=zHVRmBqgA-ZKMbjKwrWvg+Y6FtSjBjc_DvA@mail.gmail.com>
Subject: Re: [PATCH v4 47/78] drm/vc4: hdmi: Retrieve the vc4_hdmi at unbind
 using our device
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
> The unbind function needs to retrieve a vc4_hdmi structure pointer through
> the struct device that we're given since we want to support multiple HDMI
> controllers.
>
> However, our optional ASoC support doesn't make that trivial since it will
> overwrite the device drvdata if we use it, but obviously won't if we don't
> use it.
>
> Let's make sure the fields are at the proper offset to be able to cast
> between the snd_soc_card structure and the vc4_hdmi structure
> transparently so we can support both cases.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 24 +++++++++++++++++++++++-
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  4 ++--
>  2 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 09b297a1b39d..7cd1394c10fa 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1200,6 +1200,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         if (!vc4_hdmi)
>                 return -ENOMEM;
>
> +       dev_set_drvdata(dev, vc4_hdmi);
>         encoder = &vc4_hdmi->encoder.base.base;
>         vc4_hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
>         vc4_hdmi->pdev = pdev;
> @@ -1362,7 +1363,28 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
>  {
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct vc4_dev *vc4 = drm->dev_private;
> -       struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
> +       struct vc4_hdmi *vc4_hdmi;
> +
> +       /*
> +        * ASoC makes it a bit hard to retrieve a pointer to the
> +        * vc4_hdmi structure. Registering the card will overwrite our
> +        * device drvdata with a pointer to the snd_soc_card structure,
> +        * which can then be used to retrieve whatever drvdata we want
> +        * to associate.
> +        *
> +        * However, that doesn't fly in the case where we wouldn't
> +        * register an ASoC card (because of an old DT that is missing
> +        * the dmas properties for example), then the card isn't
> +        * registered and the device drvdata wouldn't be set.
> +        *
> +        * We can deal with both cases by making sure a snd_soc_card
> +        * pointer and a vc4_hdmi structure are pointing to the same
> +        * memory address, so we can treat them indistinctly without any
> +        * issue.
> +        */
> +       BUILD_BUG_ON(offsetof(struct vc4_hdmi_audio, card) != 0);
> +       BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) != 0);
> +       vc4_hdmi = dev_get_drvdata(dev);
>
>         cec_unregister_adapter(vc4_hdmi->cec_adap);
>         vc4_hdmi_connector_destroy(&vc4_hdmi->connector.base);
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 749a807cd1f3..d43462789450 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -53,13 +53,13 @@ struct vc4_hdmi_audio {
>
>  /* General HDMI hardware state. */
>  struct vc4_hdmi {
> +       struct vc4_hdmi_audio audio;
> +
>         struct platform_device *pdev;
>
>         struct vc4_hdmi_encoder encoder;
>         struct vc4_hdmi_connector connector;
>
> -       struct vc4_hdmi_audio audio;
> -
>         struct i2c_adapter *ddc;
>         void __iomem *hdmicore_regs;
>         void __iomem *hd_regs;
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
