Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA604E6441
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 14:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF3E10E915;
	Thu, 24 Mar 2022 13:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57DF10E915
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 13:42:50 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id r8so4918317oib.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 06:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=k0XLE9bSSftZDbfLEu3mqCg9VES7NclFvpk1DiwzsCU=;
 b=fSvX8N/AwXtXiKZh3habH1B6yG5N/8DG1QUa0YkVzOxcGTB677jEriUC19394QJn4n
 q28IZTp/6eAMDcW6Z5+2LMrNUxpEnzktKdr0a/W+QwyJWnYOnilpjn5KqjYBz4d+TKQ8
 p/T4HgKbc4DvYtEIDMjHaeaRIGqgfSLHDT6zccGzvJavm3uNQo/tPApfnQ/IEfim8hFR
 IT644/6njFw6Xf68bLRpHn+qvrhHTY0lihRcDQMcOdq08gG/hBtiSJhRufpaQzNxbej7
 nzzO+gYfX/xelX30wWCRpTmv1Ir86FRL3ujPQIE2iGn4f1OFSINTsmGztUCJAxcXudTo
 nNXg==
X-Gm-Message-State: AOAM531/b0D9R7uvHGZoGYhN4ihmc2aiMDw3x5te7WEtz9Tzqy6NEpmg
 Rxf8HIbABczqzBu5Bb++fA==
X-Google-Smtp-Source: ABdhPJzqqN+FJJDwdKcMMRgy5goFaR/Q6upsH/doVxugr8UxtoUj4bHD6zeF85BdW4NQ+asO8xTuOw==
X-Received: by 2002:a05:6808:208b:b0:2d3:a5cc:540 with SMTP id
 s11-20020a056808208b00b002d3a5cc0540mr2700275oiw.41.1648129369806; 
 Thu, 24 Mar 2022 06:42:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05680811d000b002d72ec3a921sm1463006oiv.21.2022.03.24.06.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 06:42:48 -0700 (PDT)
Received: (nullmailer pid 1940986 invoked by uid 1000);
 Thu, 24 Mar 2022 13:42:47 -0000
Date: Thu, 24 Mar 2022 08:42:47 -0500
From: Rob Herring <robh@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v11 7/7] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <Yjx1V1Lx0bAtgsCp@robh.at.kernel.org>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-8-15330273260@189.cn>
 <Yjo2R5LQrRICr7dC@robh.at.kernel.org>
 <33766d08-bd88-2234-0f85-5926e4256dfb@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33766d08-bd88-2234-0f85-5926e4256dfb@189.cn>
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 09:39:49AM +0800, Sui Jingfeng wrote:
> 
> On 2022/3/23 04:49, Rob Herring wrote:
> > On Tue, Mar 22, 2022 at 12:29:16AM +0800, Sui Jingfeng wrote:
> > > From: suijingfeng <suijingfeng@loongson.cn>
> > > 
> > > There is a display controller in loongson's LS2K1000 SoC and LS7A1000
> > > bridge chip, the display controller is a PCI device in those chips. It
> > > has two display pipes but with only one hardware cursor. Each way has
> > > a DVO interface which provide RGB888 signals, vertical & horizontal
> > > synchronisations, data enable and the pixel clock. Each CRTC is able to
> > > scanout from 1920x1080 resolution at 60Hz, the maxmium resolution is
> > > 2048x2048 according to the hardware spec. Loongson display controllers
> > > are simple which require scanout buffers to be physically contiguous.

[...]

> > > +			val |= mask;
> > > +		else
> > > +			val &= ~mask;
> > > +		writeb(val, li2c->dat_reg);
> > Shouldn't you set the data register low first and then change the
> > direction? Otherwise, you may be driving high for a moment. However, if
> > high is always done by setting the direction as input, why write the
> > data register each time? I'm assuming whatever is written to the dat_reg
> > is maintained regardless of pin state.
> > 
> When the pin is input, i am not sure value written to it will be preserved.
> 
> I'm worry about it get flushed by the external input value.
> 
> Because the output data register is same with the input data register(
> offset is  0x1650).
> 
> The hardware designer do not provided a  separation.

Usually for GPIO data registers the read value is current pin state 
regardless of direction and the written value is what to drive as an 
output. But your h/w could be different.


> > > +
> > > +		/* Optional properties which made the driver more flexible */
> > > +		of_property_read_u32(i2c_np, "udelay", &udelay);
> > > +		of_property_read_u32(i2c_np, "timeout", &timeout);
> > These aren't documented. Do you really need them in DT?
> 
> Yes, in very rare case:
> 
> When debugging, sometimes one way I2C works, another way I2C not on specific
> board.

This is not specific to you, so why do you solve it in a way that only 
works for you? If you want to add tuning parameters to the i2c bit 
algorithm, why don't you do so in a way that works for all users? I'm 
sure the I2C maintainer and others have some opinion on this, but 
they'll never see it hidden away in some display driver.


> and you want to see what will happen if you change it from 5 to 2.
> 
> modify device tree is enough, have to recompile the kernel and driver
> modules every time.

Modifying the DT is not the easiest way to debug either.


> It is optional through.

Lots of properties are optional, what's your point?


> Please do not ask me to document such a easy thing,

Everything must be documented. There's nothing more to discuss.


> DT itself is a documention, human readable,  it already speak for itself.

It is machine readable too. Undocumented properties generate warnings 
now.

Rob
