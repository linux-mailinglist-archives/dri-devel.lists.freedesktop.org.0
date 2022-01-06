Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D82448642D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 13:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5927810E6A7;
	Thu,  6 Jan 2022 12:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B83510E6A7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 12:16:10 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so8237055pjf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 04:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ezhOL9IQmLkdhn7bT2hYUZscONiXzj3Zulc4AqaqV74=;
 b=VWuYcofoSfJWAV4N8jaIG1D93UCOzzLF4pnjMZckQdHuwfgaz+x204qWdN4QF4YoRD
 jjXdv6nQCa0cdQvhgmsH706TQG5JQqC2UipfolVHtapLb6VJ6mjx3mvAMAvJ9Ooi5nB6
 CRsCNuUmRVJtehrSnmYuebPoAmJSgHGuYmCNi47cAYBd27WmmUPIrHfBja4EQVUVAYvE
 xHEMWdoc093Hihp5ksbATTC/pSlSafiFyvDCnDXh1YrfV/2OCzLMdP60JaQ0C2aNaVkj
 tim9w33+IK49XDuWb+ftGMo9xZMAsOF+xNjlHqYS+VRwvF0me3YYKY1Vt79vdnY/4VeR
 RXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ezhOL9IQmLkdhn7bT2hYUZscONiXzj3Zulc4AqaqV74=;
 b=u3W1OYKY7UnA5x9HrqUCHrB3VE7uEyWGUvqnI+OwsCm1sGqsNE6XRBFuUgCndif9rw
 f7QqVqD2lxuUUfI1Pmuz6gB7uaXGs8vRe/qHw5gksweHFCkm0TwInhZrvYVSSd3dzmsa
 D3RTgNqMp8FJsMShKS29MfBdCSpH1LfJYaCRGZnuJx8PCQ5iE/hSOifsjQj2XV01BZFM
 FgwAltZ/7yIURtWmK9b/Hi8sPi0ADnOZK0gkEtqwM1ZQGYrIBJZc73rlMsL7XSm+tldp
 PXZCOB5Q5s17J62/9iT/FXE4pYyeRVxheAYSjh4rNvWOLm6UgrB1Sfu+srDyZKve19UC
 LNaA==
X-Gm-Message-State: AOAM5320IZq1g44t5DmI/Hf4TcHCtG2eDOHdIrguno4hhay4TfTb82nH
 GSp2qwI40kfegZJ3DDT10Lg=
X-Google-Smtp-Source: ABdhPJzV2qd7Kyc2ZIOHuzuuD3AFWMO67x7jgDMNj2Z9+hCizMBZuXOekzZfGXgf9RDEl+VUGs7ztA==
X-Received: by 2002:a17:90b:4f4a:: with SMTP id
 pj10mr9731709pjb.112.1641471369839; 
 Thu, 06 Jan 2022 04:16:09 -0800 (PST)
Received: from 8345e2a12d0c ([159.226.95.43])
 by smtp.gmail.com with ESMTPSA id b5sm2401828pfm.155.2022.01.06.04.16.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jan 2022 04:16:09 -0800 (PST)
Date: Thu, 6 Jan 2022 12:16:05 +0000
From: Miaoqian Lin <linmq006@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH] phy: mediatek: Fix missing check in mtk_mipi_tx_probe
Message-ID: <20220106121524.GA25165@8345e2a12d0c>
References: <20211224082103.7658-1-linmq006@gmail.com>
 <CAAOTY_-7-BrnkPk_5V5y20F6fX3X8Vm0tcYAA=1DNCnxjvNF8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAOTY_-7-BrnkPk_5V5y20F6fX3X8Vm0tcYAA=1DNCnxjvNF8A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-phy@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Chun-Kuang:

On Fri, Dec 31, 2021 at 12:31:33AM +0800, Chun-Kuang Hu wrote:
> > diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > index 28ad9403c441..67b005d5b9e3 100644
> > --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > @@ -146,6 +146,8 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
> >                 return -ENOMEM;
> >
> >         mipi_tx->driver_data = of_device_get_match_data(dev);
> > +       if (!mipi_tx->driver_data)
> 
> I'm confused. mtk_mipi_tx_probe() is called because this device node's
> compatible match one in mtk_mipi_tx_match[]. So I think the return
> value of of_device_get_match_data(dev) would not be NULL. If this is
> true, this checking is redundant.
>
I think your are right, this checking is redundant. Thanks for your
reply.

Regards,
Miaoqian.
