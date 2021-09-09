Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A85940517E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D566E842;
	Thu,  9 Sep 2021 12:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDEA6E842
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 12:45:33 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z4so2384506wrr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oYMbDn4U1+4evJCYYQyxBxoVUEu/0Aanoqc2NTU0X78=;
 b=jSyEr1e/ouH5V5fqUxa9TzSs8hVLwfNnhbQvAL0IRYRrVhrztimtIpDlwAjnGOr8Dj
 9ti7W5mhfsd4kzR5vQLdRSps7Ib424Uep62OVqgt4PN+E9ZLQnx5XW5rhGVRsVmJoyMZ
 BBum1IuLfiM3TE6hGYzM2gnE+X4k/x2x1OKkBVM3HJplyPUSoP+F+T3DZGaxXy58T4pF
 ji9wde3AXxJ6AE8MviX5YQ6/GQBYQtF+kw6molxOlkmNni3DQ+xRFp8GceozypDxtHVu
 8VkDIRYS/mR8BKCTumOPmzw8TytDMFoeWDyjUG/8RUlHWsq8rqkGXBePk/7WCUEGJ651
 9gbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oYMbDn4U1+4evJCYYQyxBxoVUEu/0Aanoqc2NTU0X78=;
 b=uGCnhHmd8wf2skQDfsE3MgTadR+uSgiI8yh10PMDlsuL87i9Cjoaai4gIAg7atZdqA
 NFw87yMIm1t+zLL6KW0A8f0cBP5qhSN7IJ68n4m4GErpgwOMHmJ0+Orp1Htlq9VsjCKc
 zHaYR0doaXf/IGErPhH/Rw9xoUiIGKZQ2hfN4YnH6WokrmlTpd4K2r/WX1T6rMqNAmuG
 gIPRfAEZGZv8O0r0yQa/0QFTX8zKm0cTu9vtVvjcPrHetw8203lezVpZpMV60XztUOnn
 NqD5K+jWu2Qpd3LTr1Q93n3io/VWPAlgFNQ2OoVVgua2vmTBI/4cOtmihMZnMfZlq52M
 x9tQ==
X-Gm-Message-State: AOAM533pXeqcuFQ5sGozufn3OXCXO3sFrjbo/pBf2l338Mo4QuOyxKSy
 bM4jIZPqMmUAzteLcMcguuZtKQ==
X-Google-Smtp-Source: ABdhPJwfTKkMnQv69MeTaIcop8vh+adsmpIsEsvpqG9ZfCBFMbL515LBbo71hVU8IIcY2Fj9WdtYeg==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr3414618wrn.261.1631191531743; 
 Thu, 09 Sep 2021 05:45:31 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id o12sm1532287wmr.2.2021.09.09.05.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 05:45:31 -0700 (PDT)
Date: Thu, 9 Sep 2021 14:45:30 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 6/6] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20210909124530.dthpwbhzsmxp6xfl@blmsp>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-7-msp@baylibre.com>
 <YTZ8eds/IgpW/RBL@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YTZ8eds/IgpW/RBL@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, Sep 06, 2021 at 10:39:21PM +0200, Sam Ravnborg wrote:
> Hi Markus,
> 
> On Mon, Sep 06, 2021 at 09:35:29PM +0200, Markus Schneider-Pargmann wrote:
> > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> > 
> > It supports both functional units on the mt8195, the embedded
> > DisplayPort as well as the external DisplayPort units. It offers
> > hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> > to 4 lanes.
> > 
> > This driver is based on an initial version by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> > 
> > Notes:
> >     Changes RFC -> v1:
> >     - Removed unused register definitions.
> >     - Replaced workqueue with threaded irq.
> >     - Removed connector code.
> >     - Move to atomic_* drm functions.
> >     - General cleanups of the code.
> >     - Remove unused select GENERIC_PHY.
> > 
> >  drivers/gpu/drm/mediatek/Kconfig      |    6 +
> >  drivers/gpu/drm/mediatek/Makefile     |    2 +
> >  drivers/gpu/drm/mediatek/mtk_dp.c     | 2881 +++++++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  580 +++++
> >  4 files changed, 3469 insertions(+)
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> > 
> 
> 
> > +
> > +static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
> > +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_reset = drm_atomic_helper_bridge_reset,
> > +	.attach = mtk_dp_bridge_attach,
> > +	.detach = mtk_dp_bridge_detach,
> > +	.pre_enable = mtk_dp_bridge_pre_enable,
> Use the atomic variant here as pre_enable is deprecated.
> 
> > +	.atomic_enable = mtk_dp_bridge_atomic_enable,
> > +	.atomic_disable = mtk_dp_bridge_atomic_disable,
> > +	.post_disable = mtk_dp_bridge_post_disable,
> Use the atomic variant here as .post_disable is deprecated.

Thanks, I got rid of both pre_enable and post_disable as well now.

> 
> > +	.get_edid = mtk_dp_get_edid,
> > +	.detect = mtk_dp_bdg_detect,
> > +};
> 
> Everything else I skimmed looked fine. But it was a quick skim so..

Thanks for taking the time to have a look.

Best,
Markus
