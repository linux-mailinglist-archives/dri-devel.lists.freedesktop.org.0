Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF56C421F51
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 09:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417D86E30C;
	Tue,  5 Oct 2021 07:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6B76E30C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 07:16:36 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 s198-20020a1ca9cf000000b0030d6986ea9fso2096973wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 00:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CXY/HEJbVlXKwfPIEz9oTXRR73+zLVHYdLUDT3KYBYI=;
 b=mgu2vwTmGuRsaMFialQpSYafE/THN5LhwWwrUIgB6VIOzqMDcfTSTE47Cqcx5ShySG
 +vTs3z+SNhUUIKt9da009SoNWw4514ifoiFlMLHfEpUYwDXVILBCJnelP1WX0WD71bWN
 wlh/QdWLnejFp5Q4o+2JwUHIkJTWcPgeE8ZLwrEWx6zW2ZGTIIjF0ybqw6yv0kcgiR51
 7aqjkc3Ke51QmFAnBQXivl/w5tEo1LVeAtrKnhea2GjjPuhGzbnA2Ou6sfNYpDx0fko1
 BEXYum/1h7KP7s2mZXJF+4KfRXTaOnABMw7sm7PzA6uVoa5/dPAgVa/2n2ha4EJkkR7e
 fyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CXY/HEJbVlXKwfPIEz9oTXRR73+zLVHYdLUDT3KYBYI=;
 b=AyCo4JDCGfe8nUwyPdOTgmjzWY/4CEognsBuNZ8eMuoOLs4wc0hAL5bZMD5egaCoAX
 5Vbk2FNU5QLzBpg+JJbruB3b/MbJK9OgptePzkUCTC66dO04Ma0NecVwvOgT/HRyZxmC
 fJH9YO99KGqFedxSpZw3C4G2k2JIOqguemEt8sHdtkfxUU9nfpfXwUHnG7R5EvPeGqhg
 XCwaNCJxeEQZ8ypAbv4IiyeNVaX64AQTCqu3dAtai4aCi84fJS3THp2U2Sc1+wh9dfVz
 DTSBx0rDy+Mit5J0mwcspyg9NreaooqaDQN1GeVVJuQx02eIR3WGOW420tbj11T5r50C
 C0Ow==
X-Gm-Message-State: AOAM532BqcBWgbgv3ssx0ssmxPUHnQuQAPimQ0VIQRh3YcqVj6ejvqIt
 w+gNLwm1Fgj6/+cm4aSiPx2aKA==
X-Google-Smtp-Source: ABdhPJzaUsAGcej6QzdUPEhfKWYYSe1/l0cFZEWN/ELzTVU1K5vN2jMbP58homcEWk4eLuwawKN0Kg==
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr1683990wme.3.1633418194608; 
 Tue, 05 Oct 2021 00:16:34 -0700 (PDT)
Received: from blmsp (dynamic-046-114-035-189.46.114.pool.telefonica.de.
 [46.114.35.189])
 by smtp.gmail.com with ESMTPSA id q18sm892688wmc.7.2021.10.05.00.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 00:16:34 -0700 (PDT)
Date: Tue, 5 Oct 2021 09:16:32 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 6/6] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20211005071632.impnpix5f26xxxii@blmsp>
References: <20211001094443.2770169-1-msp@baylibre.com>
 <20211001094443.2770169-7-msp@baylibre.com>
 <CAAOTY_-+T-wRCH2yw2XSm=ZbaBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAAOTY_-+T-wRCH2yw2XSm=ZbaBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com>
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

Hi Chun-Kuang,

On Sat, Oct 02, 2021 at 12:16:26AM +0800, Chun-Kuang Hu wrote:
> Hi, Markus:
> [...]
> >
> >  drivers/gpu/drm/mediatek/Kconfig       |    7 +
> >  drivers/gpu/drm/mediatek/Makefile      |    2 +
> >  drivers/gpu/drm/mediatek/mtk_dp.c      | 2825 ++++++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  535 +++++
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c |    1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h |    1 +
> >  drivers/phy/mediatek/Kconfig           |    8 +
> >  drivers/phy/mediatek/Makefile          |    1 +
> >  drivers/phy/mediatek/phy-mtk-dp.c      |  218 ++
> 
> Separate the phy driver to another patch because phy driver would go
> into different maintainer's tree.

Oh of course. Thank you. I fixed it for the next version.

Best,
Markus
