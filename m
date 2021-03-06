Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301AF32FCE8
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 20:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237F76E530;
	Sat,  6 Mar 2021 19:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2430A6E530
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Mar 2021 19:57:36 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id w34so2643178pga.8
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Mar 2021 11:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KQqY8QPhXFTEar+Ux6aNIB5JucD1ppbDhSjCP3APe8w=;
 b=btU8R0t9u1bt2ej2fMNawasS5MCaq12jCpT2jB+LxFIZ/JjrBC1epL8TTgIsuz/c8w
 Cfcu/091cvoxAVa7FXrue99sxmgkrw2NwZ0GgqMJCgI9muHb6fhonjteGivFgUW91acZ
 USQ7Ld26jkanyRjq6V0Y/mfjWb19YUSeygmpK0ZzwblalbaKSHxYmZrAc6sxRL9P7vA4
 kp0gr72Rj8ZzIGGC63Pfn4luicKOL1FXSuzz9WvWNnuGVpMwQ3BSEstQFOUsOg5zsz1w
 2gx9mk1HPcfQTvuHK/3e/jtxMfZvyNOOzk8Kpe/MSpaWfdyVvG04F57aOKdFvJfFX6cY
 tjow==
X-Gm-Message-State: AOAM530ONbPFHdqZK0umb8JRJOqjzCcs1FrShTtt+hDrgVfSTNxKeC4+
 srbJeEvC5FDC9UugsrI9uQ==
X-Google-Smtp-Source: ABdhPJz1DsAX/KAMSJdNpzi8tpKb/zdwy3rRKYSV+TEJqGpEzjIoWXc/yGtoSU2EN0X4DhjrSEfd1g==
X-Received: by 2002:a05:6a00:1693:b029:1ec:b0af:d1d with SMTP id
 k19-20020a056a001693b02901ecb0af0d1dmr14493676pfc.42.1615060655654; 
 Sat, 06 Mar 2021 11:57:35 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id k64sm6295171pga.52.2021.03.06.11.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 11:57:34 -0800 (PST)
Received: (nullmailer pid 1119603 invoked by uid 1000);
 Sat, 06 Mar 2021 19:56:45 -0000
Date: Sat, 6 Mar 2021 11:56:45 -0800
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCHv1 1/6] rtc: m41t80: add support for protected clock
Message-ID: <20210306195645.GA1112592@robh.at.kernel.org>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-2-sebastian.reichel@collabora.com>
 <YDQgLTPE0E+/1Cwv@piout.net> <YDQhgkftoW4J9AtY@piout.net>
 <20210223012657.bbp5u65nw4tpcjgd@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210223012657.bbp5u65nw4tpcjgd@earth.universe>
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 02:26:57AM +0100, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Feb 22, 2021 at 10:26:26PM +0100, Alexandre Belloni wrote:
> > On 22/02/2021 22:20:47+0100, Alexandre Belloni wrote:
> > > On 22/02/2021 18:12:42+0100, Sebastian Reichel wrote:
> > > > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > > > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > > > used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> > > > the clock is disabled and all i.MX6 functionality depending on
> > > > the 32 KHz clock has undefined behaviour. On systems using hardware
> > > > watchdog it seems to likely trigger a lot earlier than configured.
> > > > 
> > > > The proper solution would be to describe this dependency in DT,
> > > > but that will result in a deadlock. The kernel will see, that
> > > > i.MX6 system clock needs the RTC clock and do probe deferral.
> > > > But the i.MX6 I2C module never becomes usable without the i.MX6
> > > > CKIL clock and thus the RTC's clock will not be probed. So from
> > > > the kernel's perspective this is a chicken-and-egg problem.
> > > > 
> > > 
> > > Reading the previous paragraph, I was going to suggest describing the
> > > dependency and wondering whether this would cause a circular dependency.
> > > I guess this will keep being an issue for clocks on an I2C or SPI bus...
> 
> Yes, it is a circular dependency on this particular system on
> module. It only works because the RTC enables the clock by
> default. The i.MX6 CKIL is expected to be always enabled.

I think you should describe the circular clocking and then provide a way 
to break the dependency. It's a somewhat common issue.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
