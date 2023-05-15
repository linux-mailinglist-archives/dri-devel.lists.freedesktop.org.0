Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3656703095
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 16:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDC210E204;
	Mon, 15 May 2023 14:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFDD10E204
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 14:52:08 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f420618d5bso63589155e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 07:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684162326; x=1686754326; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I6PGsaxxe+r0/tgEPfoiZneEqJdU4NADxCmDaQhFL68=;
 b=QBUPDu0mnTKpIi/wGbo9UgpiCqziYGcMj3hQWPNefHgGAfqJ8lVJErWsufoP7gVWl/
 MuKN4tEX1pZzLr340OCucG7rs4ehSVdPZ56+kGhAkPSHTFEanh+UOGRKxl0frSuERoQi
 znFDPcNKbBBfN9G+5GNepJLzQ0wZAO8nLN1JBJsH87VkOTZzGqNF3dV7QfkvbFQbWwzC
 8JItnIfYJ0m+YlLGiaXwATFgD5y70Nki5rbnME2c/ITNCpP6jTEfV2/BTzQHtJXbr5Ix
 ZLYZvkgxPg66jjZAKiLqfZ7H0BYHkg7RRJ+3Kpz8v/kkce6/YnkPjUmtUNTBVfQ11JjK
 kiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684162326; x=1686754326;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I6PGsaxxe+r0/tgEPfoiZneEqJdU4NADxCmDaQhFL68=;
 b=kjYJ9xJsdMlrAZekn1sbcYlq40H2ErCPH+iKwDYg5EDeAUL2z9cJeI4H4RiqyHmlIJ
 /9/4dSX/8DH3rWKtIVuOijs6dSI2lSN7QFSO0uNXQI8oAohys0j2pXnCL6MY5V/T2FYS
 +Ak4aXeGIwb28TGQmLw+kw3rYYUXitC/5wF5xofekzojaSoum4Kdw2pMDeHL2wzuelso
 n7nWASz/wJsVbtbHhixbeiXPrzooq43YED6BuSaMdH4rC9gerXHDldFNDSzjeFIv7H20
 s2ztdVAQVy3tBYPcO7wP7MRM98oCQJunhpC6QhMGeOQQmwys88UH/PMYr9HJWMzdrUwG
 qwDw==
X-Gm-Message-State: AC+VfDw9IAHgUFZcKC94716vlNgQch0PEoGCFyKiIoP7dFUF+x2sNY8V
 HxxEq23Uqd0jvGctBbziIXDWoQ==
X-Google-Smtp-Source: ACHHUZ5PnVTE8/BjOvD4cpmnU1SfNcpaeP+ththsz81R4NjZ9b8l1B6aIXxY1tdG8cXWxh3+7kD4ow==
X-Received: by 2002:a1c:f310:0:b0:3f1:74bd:bc22 with SMTP id
 q16-20020a1cf310000000b003f174bdbc22mr22887492wmq.6.1684162326437; 
 Mon, 15 May 2023 07:52:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003f4e47c6504sm14774860wmg.21.2023.05.15.07.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:52:05 -0700 (PDT)
Date: Mon, 15 May 2023 16:52:05 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Message-ID: <jx2ndeoli3ozjiydygwclrpqmwftgf2gv4kfr6dyclf2cyh4hk@fnhvqeef5w4f>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-3-jstephan@baylibre.com>
 <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
 <ynrvqt24hjgng25r2xa3hxj35cvgotx7sdfrbqfjcvj3foegmr@4lqhen5yu6fh>
 <85500bcc-c5e8-8ce2-edea-233de86c2d35@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85500bcc-c5e8-8ce2-edea-233de86c2d35@collabora.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, chunkuang.hu@kernel.org,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 04:22:38PM +0200, AngeloGioacchino Del Regno wrote:
> Il 15/05/23 15:36, Julien Stephan ha scritto:
> > On Mon, May 15, 2023 at 02:22:52PM +0200, AngeloGioacchino Del Regno wrote:
> > > Il 15/05/23 11:05, Julien Stephan ha scritto:
> >   ..snip..
> > > > +	port->is_cdphy = of_property_read_bool(dev->of_node, "mediatek,is_cdphy");
> > >
> > > This driver doesn't support C-PHY mode, so you either add support for that, or in
> > > my opinion you should simply refuse to probe it, as it is *dysfunctional* for the
> > > unsupported case (and might even introduce unstabilities).
> > >
> > > 	/* At the moment, only D-PHY mode is supported */
> > > 	if (!port->is_cdphy)
> > > 		return -EINVAL;
> > >
> > > Also, please don't use underscores for devicetree properties: "mediatek,is-cdphy"
> > > is fine.
> > >
> > Hi Angelo,
> > You are right this driver does not support C-PHY mode, but some of the
> > PHYs themselves support BOTH C-PHY AND D-PHY. The idea of `is_cdphy` variable
> > is to know if the CSI port supports BOTH C-PHY AND D-PHY or only DPHY.
> > For example mt8365 has 2 PHYs: CSI0 and CSI1. CSI1 support only D-PHY,
> > while CSI0 can be configured in C-PHY or D-PHY. Registers for CD-PHY and
> > D-PHY are almost identical, except that CD-PHY compatible has some extra
> > bitfields to configure properly the mode and the lanes (because supporting
> > trios for CD-PHY).
> > If C-PHY support is eventually added into the driver, I think we will need
> > another variable such as `mode` to know the mode. I was also thinking
> > of adding a phy argument to determine if the mode is C-PHY or D-PHY.
> >
> > So here, I don't want to stop the probe if `is_cdphy` variable is set to
> > true. Does it make sense ?
> >
>
> Comments in the code convinced me that the other PHYs providing only C or D PHY
> support weren't compatible at all with this driver.
>
> I got it now - but at this point can you please add a comment in the code actually
> clarifying that this driver supports both PHYs providing *only* D-PHY and ones
> providing selectable C-or-D PHY?
>
> That clarified, it would not make sense to stop probing if it's not a CDPHY because
> as you said there might be a D-only PHY that would be actually supported here.
>
> Regards,
> Angelo
>
>
Ok, I will add a comment in the code to make it more clear.

Regards
Julien
