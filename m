Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE6B9327AC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 15:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6838910E6FA;
	Tue, 16 Jul 2024 13:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="HJjna7IP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B429010E6FA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 13:40:16 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6b5dd7cd945so28004176d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1721137215; x=1721742015; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzddLqE5sbJXB4ZLkKSMkOisLHuczB5WDxgyMvz+RuM=;
 b=HJjna7IPUe9a68OI1PjUuPZ5ntlXVN3wbFs3+8ubgfqbD2/8ugfzoDUanmrDdZoxZ4
 ovRT15ZBthwBvR1nFDhOcCFDVt3/CE2HPnYLnQsWUPtsacNwslOtmWqIPa90vmfCO9JZ
 PRI0kYXiGrhGdOWCiFK+EZRmqfwyfDAAZfXsQwA9tAmmvNg5RdzEi2qzpZss3z1f5qto
 kLy6IhkwsveA8+Va0eBYLUryNhxB1qHG5ZoV+/C1WFNhxoTqPnNK2nlzlCKDQxTTxvM0
 7eYVnko642jAqbo/9ohVbEesKD3p5z8F/YojVuO3DMXBjWLSI4MWrb0qYDrk+d1plHl4
 gC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721137215; x=1721742015;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZzddLqE5sbJXB4ZLkKSMkOisLHuczB5WDxgyMvz+RuM=;
 b=a8HgUu9cm4mIC3ZR+q2OTe2BZDSgET/UFR3k+Qd2pD7P+iZJQauEyEARlmCImk4jM6
 WmoU2hmcgEDeS3IeJ2SV2f+m87StGVci0xJhbuWPghyrA10sHSuz5POjitJViIJoI4BJ
 45nt53mwjZzO/BJ5u19p4tO5i+KDTcBLSGq5Dj68HOmpqkoH3PLqetY6lY81bVaEFuGi
 DtBZRWiVp1X6PTREPJTRZeJSu7uvWZcMGIbUBcZdS34ma+9cMlBdBgc+IsvXlMn9PO5Y
 xOwCOy+tgG6N/zIU9M0pt61/xJn89vzjpl++rinFAJIKHe2D8yRQFSfz2nDc9SWnYBS2
 kW3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcrZ5DAwieOfhc/+pgp5f6PUUnPNtHTma4xPBwQ00agWDM5zxMJZzCvrKwAvkmLvTKM3iT91NljQHXDzH3Gw20O2UgoPRk3zOLgmSLTmXb
X-Gm-Message-State: AOJu0YxcBViaYr8jWFEHXBtm3klxr4rLK0wCeNhOy2jAKElXuB26375g
 2Uyy+o1IZHluazADGYfZd4IkVSCGDfheyyNTAkMmZyxcfYaLhSYociKBV8saYnY=
X-Google-Smtp-Source: AGHT+IFrKlyzzJnVHLLxNmw34TVxVG87O64wpA44pESjU6PrkfeOnqAxIZcSzyXzUUspO+reEwe3BQ==
X-Received: by 2002:a05:6214:5290:b0:6b0:7f36:8ae3 with SMTP id
 6a1803df08f44-6b77f54230emr22415396d6.32.1721137215461; 
 Tue, 16 Jul 2024 06:40:15 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b7733ee169sm19763146d6.26.2024.07.16.06.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 06:40:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sTiPd-009Qyg-QU;
 Tue, 16 Jul 2024 10:40:13 -0300
Date: Tue, 16 Jul 2024 10:40:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Leon Romanovsky <leon@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Message-ID: <20240716134013.GF14050@ziepe.ca>
References: <20240613191828.GJ4966@unreal>
 <fbb34afa-8a38-4124-9384-9b858ce2c4e5@habana.ai>
 <20240617190429.GB4025@unreal>
 <461bf44e-fd2f-4c8b-bc41-48d48e5a7fcb@habana.ai>
 <20240618125842.GG4025@unreal>
 <b4bda963-7026-4037-83e6-de74728569bd@habana.ai>
 <20240619105219.GO4025@unreal>
 <a5554266-55b7-4e96-b226-b686b8a6af89@habana.ai>
 <20240712130856.GB14050@ziepe.ca>
 <2c767517-e24c-416b-9083-d3a220ffc14c@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c767517-e24c-416b-9083-d3a220ffc14c@habana.ai>
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

On Sun, Jul 14, 2024 at 10:18:12AM +0000, Omer Shpigelman wrote:
> On 7/12/24 16:08, Jason Gunthorpe wrote:
> > [You don't often get email from jgg@ziepe.ca. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > On Fri, Jun 28, 2024 at 10:24:32AM +0000, Omer Shpigelman wrote:
> > 
> >> We need the core driver to access the IB driver (and to the ETH driver as
> >> well). As you wrote, we can't use exported symbols from our IB driver nor
> >> rely on function pointers, but what about providing the core driver an ops
> >> structure? meaning exporting a register function from the core driver that
> >> should be called by the IB driver during auxiliary device probe.
> >> Something like:
> >>
> >> int hbl_cn_register_ib_aux_dev(struct auxiliary_device *adev,
> >>                              struct hbl_ib_ops *ops)
> >> {
> >> ...
> >> }
> >> EXPORT_SYMBOL(hbl_cn_register_ib_aux_dev);
> > 
> > Definately do not do some kind of double-register like this.
> > 
> > The auxiliary_device scheme can already be extended to provide ops for
> > each sub device.
> > 
> > Like
> > 
> > struct habana_driver {
> >    struct auxiliary_driver base;
> >    const struct habana_ops *ops;
> > };
> > 
> > If the ops are justified or not is a different question.
> > 
> 
> Well, I suggested this double-register option because I got a comment that
> the design pattern of embedded ops structure shouldn't be used.
> So I'm confused now...

Yeah, don't stick ops in random places, but the device_driver is the
right place.

> I'll look into the option of using notifier chains in this case, although
> as I saw it, the notifier chains are more suitable for broadcast updates
> where the updater is not necessarily aware of the identity nor the number
> of the subscribers. 

Yes, that is right.

Jason
