Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5B2475A2A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 14:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2B510EB6A;
	Wed, 15 Dec 2021 13:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155E010EB6A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 13:59:37 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so24906779oto.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 05:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=jzXbIP5FciFwRo+uwKbSYKwE5J1uKZwuclMd+bHXm4Q=;
 b=VW9meFnnbW+6LhQXBCYPKpSaQzDRpNnMKRUZyG7F83OPWZ35MX+n4Qr4fgwTmrF0rT
 6m9gcUNEEMjaYdGTbOnKqtEMFoY5B3WNGnlDW3U0KtLtgyFCfwQx1vmr/m4U05GTZcem
 5UtzSKqy2kFGXp/gUJ7EmPzPtoqMTDqIfQC/YvzVxo/LQ5kHKwkxE3jp5njcEelUv1kT
 OG+iBv9RmWkUa5GARhS9NinLIasDgB8d9//7XMhh28GcjR8UhN7IY/fuvUBNap7Xo/3W
 A+5v1+o116FlmWcud/nkiz8Y/GbQz/SNhtUr8kF1JFXv/F8gm1ythiT2qQn13y9snEdY
 fydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=jzXbIP5FciFwRo+uwKbSYKwE5J1uKZwuclMd+bHXm4Q=;
 b=kIaVaMFUEDQjfgkOyuZ8eQ5uaq5G+tjPMS5ETOdGIerl+CK8VzNydnfIn34Kcefrz4
 yQjRTYvtlf/f3NFfnjrQr2P2opoqPuAKUi2BKtVJBy+YG1Ij7vT1ePOdRD2qC+9ZmXTA
 MgfzmahT7bRtsWUvd2Y0VWALJOQG6jMQTbVpp/R29lpnXCt5C3yRxR5ickxUj2SLBclb
 YyhH8t8peR3JDwbo2c8iZDqq/1fqtz+1nhBuGa2XzDPD2WW2JWgPBY+lOCFAI0+8h3Qo
 CoRTUPabunFXpac8pjiwmz4Q6HE+32YM63Ov5ECz+Aqxu8K4m254DcMrf0CsF/LJLtN7
 ezVg==
X-Gm-Message-State: AOAM530Dw7QdMKGbzYSAZHbb0AWMm90AS3jx2rOOXgRg3rkwkrZ0Blb+
 pJEPl62XKSjWMbLSHRLJ6SUJD9OM1k0w+lOiSDnJPg==
X-Google-Smtp-Source: ABdhPJw9vbo3GtL3umP4JTbk/hUjj33zlRQI9PHcpEYiz1E8UmKBHQI5Lfz+6KJ2nWa6o7LDr4U/YQDOVfofOzqmx08=
X-Received: by 2002:a05:6830:200d:: with SMTP id
 e13mr9181654otp.109.1639576776133; 
 Wed, 15 Dec 2021 05:59:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 07:59:35 -0600
MIME-Version: 1.0
In-Reply-To: <CAJMQK-gGE78qZoR92d8OH6_vTzBR5ry04nKGS22Dw48vAo7+AA@mail.gmail.com>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
 <CAJMQK-gGE78qZoR92d8OH6_vTzBR5ry04nKGS22Dw48vAo7+AA@mail.gmail.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Wed, 15 Dec 2021 07:59:35 -0600
Message-ID: <CABnWg9tAMLWtPK1QjiqKyNgNhdqDDSc2fyAAmS3rzLQBwvT8SA@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

Quoting Hsin-Yi Wang (2021-12-09 07:29:30)
> On Wed, Nov 10, 2021 at 9:08 PM Guillaume Ranquet <granquet@baylibre.com> wrote:
> >
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> >
> > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC and a
> > according phy driver mediatek-dp-phy.
> >
> > It supports both functional units on the mt8195, the embedded
> > DisplayPort as well as the external DisplayPort units. It offers
> > hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> > to 4 lanes.
> >
> > The driver creates a child device for the phy. The child device will
> > never exist without the parent being active. As they are sharing a
> > register range, the parent passes a regmap pointer to the child so that
> > both can work with the same register range. The phy driver sets device
> > data that is read by the parent to get the phy device that can be used
> > to control the phy properties.
> >
> > This driver is based on an initial version by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> >
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
>
>
> <snip>
>
> > +static int mtk_dp_probe(struct platform_device *pdev)
> > +{
> > +       struct mtk_dp *mtk_dp;
> > +       struct device *dev = &pdev->dev;
> > +       int ret;
> > +       int irq_num = 0;
> > +       struct drm_panel *panel = NULL;
> > +
> > +       mtk_dp = devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
> > +       if (!mtk_dp)
> > +               return -ENOMEM;
> > +
> > +       mtk_dp->dev = dev;
> > +
> > +       irq_num = platform_get_irq(pdev, 0);
> > +       if (irq_num < 0) {
> > +               dev_err(dev, "failed to request dp irq resource\n");
> > +               return -EPROBE_DEFER;
> > +       }
> > +
> > +       ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel,
> > +                                         &mtk_dp->next_bridge);
> > +       if (ret == -ENODEV) {
> > +               dev_info(
> > +                       dev,
> > +                       "No panel connected in devicetree, continuing as external DP\n");
> > +               mtk_dp->next_bridge = NULL;
> > +       } else if (ret) {
> > +               dev_err(dev, "Failed to find panel or bridge: %d\n", ret);
>
> Hi,
>
> We're seeing
> [    0.424599] mediatek-drm-dp 1c500000.edp_tx: Failed to find panel
> or bridge: -517
>
> It's probably better to use dev_err_probe here.
>
> Thanks

Good suggestion, it will be in v7.

Thanks for your review,
Guillaume.
>
> > +               return ret;
> > +       }
> > +
> > +       if (panel) {
> > +               mtk_dp->next_bridge = devm_drm_panel_bridge_add(dev, panel);
> > +               if (IS_ERR(mtk_dp->next_bridge)) {
> > +                       ret = PTR_ERR(mtk_dp->next_bridge);
> > +                       dev_err(dev, "Failed to create bridge: %d\n", ret);
> > +                       return -EPROBE_DEFER;
> > +               }
> > +       }
>
>
> <snip>
>
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
