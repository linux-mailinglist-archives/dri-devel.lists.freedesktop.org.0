Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EEA32FCF1
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 20:58:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915966E53C;
	Sat,  6 Mar 2021 19:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4686E53C
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Mar 2021 19:58:16 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id x7so1116723pfi.7
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Mar 2021 11:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vrwdJhhYtSH9wQZ5EXhp7heMqxOYZiFZDSvmiyJutDA=;
 b=nCKRbw/nVbdTQe/cGITkoZegHxdqcpuN8MgWE3Z89USIhfzEGXmEoECV1SABvrBMWw
 YSLbAtHr97912GRJxwDrmqOt5hsEzLw1HLIrzX1b43jQXfR9mWzNTCDjJJm1FDy61x2k
 eX4SubxrkwF5b6Xoza37mNZPdIFjqG/lpH4LwYOjxVFDMcPbgC+n06aZDwLWVhwT9uX+
 ryb5RGZMkwxnyuVYAUTwvL71oRm/kgo8NDsY36+S95VeqGBEWdxs/YQhn9xVLw8ICxvb
 pfLaz+TEfvVzsYe/OHPd3gIZq+n95tAJleyDChzGif4vUO4Z2HvN5R6upjCB7oGs88tc
 D9hQ==
X-Gm-Message-State: AOAM533QApknc5xjTC653zcx1Eujj/KtCYnupkGeM5See62TVUSeFp83
 upWYeVkCe5UoAXuOmTlgGw==
X-Google-Smtp-Source: ABdhPJyIkD3xwASyiv2hONK661jHJeeDgt+7b9ZQTNaf1Ja9t99WvD8XURjwe4kk7/XbL2T2N/XhCA==
X-Received: by 2002:a62:b50d:0:b029:1ed:c0d:3778 with SMTP id
 y13-20020a62b50d0000b02901ed0c0d3778mr14784437pfe.72.1615060696520; 
 Sat, 06 Mar 2021 11:58:16 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id t6sm775470pjs.26.2021.03.06.11.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 11:58:15 -0800 (PST)
Received: (nullmailer pid 1121697 invoked by uid 1000);
 Sat, 06 Mar 2021 19:58:08 -0000
Date: Sat, 6 Mar 2021 11:58:08 -0800
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv1 4/6] dt-bindings: arm: fsl: add GE B1x5pv2 boards
Message-ID: <20210306195808.GA1121640@robh.at.kernel.org>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-5-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222171247.97609-5-sebastian.reichel@collabora.com>
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
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Feb 2021 18:12:45 +0100, Sebastian Reichel wrote:
> Document the compatible for GE B1x5pv2 boards.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
