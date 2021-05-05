Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F432374BA1
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 01:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A5A6EC79;
	Wed,  5 May 2021 23:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845C06EC79
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 23:01:01 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id u16so3745761oiu.7
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 16:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XnP8SPohUuOUrcF5CvnUQpW+7Amf898SU0gjNiJgV3k=;
 b=aQ2mc2Vvuzm2NWNZN2iLOICGeDdmjEq/57BRKZ8f3bNw0pJZdwoXX28ac9kcgdXKBb
 GeYgxV5eLP1JUgpiCqZTmZaJ/qhlaGl1k4N6xVwDQM7hT8zuK54QGquRZILMfoyiPn9w
 bFeYjiqeKooAsoKpJ98cmC5M63EmY9jHYD1BJxkDzWPStJRaVUPSvh4iTLvW/Ui+Xk2A
 0gFbdy9/8BjYleM1DwUkLyUVc8cRcbAAaVYDucALlwJ38ZRRBJPIUDPFo1bH0j92fasR
 0t6Z0QEc1NGy1aAToKeAslloNAv6sgyNJKtefdbCT+w/VwsLmrc3WkD3lxS+RfhahJpr
 RGTQ==
X-Gm-Message-State: AOAM533/1DvOK0Acb9yJxOqmaWncGe5cLvpsNHUrgtgK45ID99oVS1TG
 oyhLeaH6WD+rHvA4NxoNsw==
X-Google-Smtp-Source: ABdhPJy83Puha7n6Ax2Emr94H3gEDoAwjFI7ehiaGvyyZXu6y2E6RKtqEpMdVrTxovKDHLwWEbBcpg==
X-Received: by 2002:aca:2813:: with SMTP id 19mr8842971oix.23.1620255660629;
 Wed, 05 May 2021 16:01:00 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r14sm217795oth.3.2021.05.05.16.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 16:00:59 -0700 (PDT)
Received: (nullmailer pid 3001129 invoked by uid 1000);
 Wed, 05 May 2021 23:00:57 -0000
Date: Wed, 5 May 2021 18:00:57 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 1/5] rtc: m41t80: add support for fixed clock
Message-ID: <20210505230057.GA3001067@robh.at.kernel.org>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428222953.235280-2-sebastian.reichel@collabora.com>
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
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Apr 2021 00:29:49 +0200, Sebastian Reichel wrote:
> Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> modules SQW clock output defaults to 32768 Hz. This behaviour is
> used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> the clock is disabled and all i.MX6 functionality depending on
> the 32 KHz clock has undefined behaviour. For example when using
> the hardware watchdog the system will likely do arbitrary reboots.
> 
> Referencing the m41t62 directly results in a deadlock. The kernel
> will see, that i.MX6 system clock needs the RTC clock and do probe
> deferral. But the i.MX6 I2C module never becomes usable without the
> i.MX6 CKIL clock and thus the RTC's clock will not be probed. So
> from the kernel's perspective this is a chicken-and-egg problem.
> 
> Technically everything is fine by not touching anything, since
> the RTC clock correctly enables the clock on reset (i.e. on
> battery backup power loss) and also the bootloader enables it
> in case an something (e.g. an unpatched kernel) disabled this
> incorrectly.
> 
> A workaround for this issue is describing the square wave pin
> as fixed-clock, which is registered early and basically how
> this pin is used on the i.MX6.
> 
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-m41t80.txt |  9 +++++++++
>  drivers/rtc/rtc-m41t80.c                             | 12 ++++++++++++
>  2 files changed, 21 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
