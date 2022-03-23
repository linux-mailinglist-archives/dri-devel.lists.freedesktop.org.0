Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8BC4E52D6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 14:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEEA10E6D0;
	Wed, 23 Mar 2022 13:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B87E10E6D0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 13:11:53 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-dacc470e03so1608224fac.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 06:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=K4W6Y+CN8/9SzAkq0QdFDjJP1aWJA1yahZp6GBIYFME=;
 b=BjDRsj4EQ83q/AaR60Nh6YW5gLxfMHUlkcnSHp/F16MPqRWcFEpisG2VAvY2/PgeTO
 fLrjoh5BNwcjGY+FlLkrQGISSy7OoyBRXgqjIkdP6BCVwAWOUT8/b7Ch22F60GCpVqod
 P3whyDIHs9tDq+iUlIcFFgEUNASEuRqFuptwwhAaGENvaT/RHGA5YG9WGz5jvInm961V
 Kvv2PHZtXFNU9TJVx0qXXhFOa/ODHVfllL4H1oRtTZbhOf+EDoW1pws7nRC+q34lyDog
 cN0RpwdIgf1qUf0poQBS5rivht8Qmpst17iWzayNQl0uEKIiMCAN0Z3m3ADg0v6ljjK/
 U/TQ==
X-Gm-Message-State: AOAM532W5T3skEDiGg0rAYN1s7l54ro3sM5KG1HIOeIiSL/r7LOlQt70
 8Dk5+5GWBw7AJdZJgaS4uQ==
X-Google-Smtp-Source: ABdhPJztrzqDz7pcATE6tXz438YRHf0Hzhlaxp7/q1WkwDhYorMA3clcu/PDqYYjVk/H2NNtrB4Z6Q==
X-Received: by 2002:a05:6870:4411:b0:de:6c37:43b4 with SMTP id
 u17-20020a056870441100b000de6c3743b4mr2172391oah.25.1648041112279; 
 Wed, 23 Mar 2022 06:11:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t17-20020a9d7f91000000b005c925454e6fsm9996868otp.69.2022.03.23.06.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:11:51 -0700 (PDT)
Received: (nullmailer pid 3935370 invoked by uid 1000);
 Wed, 23 Mar 2022 13:11:49 -0000
Date: Wed, 23 Mar 2022 08:11:49 -0500
From: Rob Herring <robh@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v11 7/7] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <YjsclWsqGX3JrknM@robh.at.kernel.org>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-8-15330273260@189.cn>
 <Yjo2R5LQrRICr7dC@robh.at.kernel.org>
 <9ea4d326-ad5f-4f2c-1609-4ca772699d1b@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ea4d326-ad5f-4f2c-1609-4ca772699d1b@189.cn>
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

On Wed, Mar 23, 2022 at 12:12:43PM +0800, Sui Jingfeng wrote:
> 
> On 2022/3/23 04:49, Rob Herring wrote:
> > > +/*
> > > + * mainly for dc in ls7a1000 which have builtin gpio emulated i2c
> > > + *
> > > + * @index : output channel index, 0 for DVO0, 1 for DVO1
> > > + */
> > > +struct lsdc_i2c *lsdc_create_i2c_chan(struct device *dev, void *base, unsigned int index)
> > > +{
> > > +	char compat[32] = {0};
> > > +	unsigned int udelay = 5;
> > > +	unsigned int timeout = 2200;
> > > +	int nr = -1;
> > > +	struct i2c_adapter *adapter;
> > > +	struct lsdc_i2c *li2c;
> > > +	struct device_node *i2c_np;
> > > +	int ret;
> > > +
> > > +	li2c = devm_kzalloc(dev, sizeof(*li2c), GFP_KERNEL);
> > > +	if (!li2c)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	li2c->index = index;
> > > +	li2c->dev = dev;
> > > +
> > > +	if (index == 0) {
> > > +		li2c->sda = 0x01;
> > > +		li2c->scl = 0x02;
> > > +	} else if (index == 1) {
> > > +		li2c->sda = 0x04;
> > > +		li2c->scl = 0x08;
> > Just require this to be in DT rather than having some default.
> > 
> By design,  I am try very hard to let the code NOT fully  DT dependent. DT is nice , easy to learn and use.
> But kernel side developer plan to follow UEFI + ACPI Specification on LS3A5000 + LS7A1000 platform. See [1]
> There will no DT support then, provide a convention support  make the driver more flexible. I want the
> driver works with minimal requirement. The driver just works on simple boards by put the following dc device
> node in arch/mips/dts/loongson/loongson64g_4core_ls7a.dts,

Pick DT or ACPI for the platform, not both. We don't need to have both 
in the kernel to support.

Rob
