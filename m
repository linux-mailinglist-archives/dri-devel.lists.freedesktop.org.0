Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 818A94B82DC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 09:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FF110E78A;
	Wed, 16 Feb 2022 08:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170C310E539
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 19:47:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id EFACD1F449B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644954435;
 bh=+YgXqeJrHqFTrBc7nNza8mpO7pm7+pfwAsDkpv4pNz4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SJT/cT3z6Oe736iCsABTRHAx3R4tCsz4+nHv/JuPm2Tyam52yfDfimh7Fkbkq35o1
 gRzGvnKshiDDh/pKdrvLN65+axpJpsmLgSW5f23ssBu5fijvipN0az1xRnCPP6hebK
 WAnVn8hkJ6kHt593SC2RwsQd1U+YhkQuBxjjt2GnCkHugOQMD+viIhSwBAUR/oeb0W
 jw77yFZZCXl5DxHGa10V83rGNUb/hi9fh0/iuIMfY8C+LUDsqsrDqQpVTSz9HdXmNl
 geWqU/3Y49qoQslpA+JLGD588bIf77WSzLGRnfK9Ke6CCjFIkDPzXk70TS0vnGScF3
 QDnTJvZdpFFRA==
Message-ID: <60b8830b-4c26-3b21-9ec4-ae8998f3ccb7@collabora.com>
Date: Tue, 15 Feb 2022 22:47:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 22/23] drm: rockchip: Add VOP2 driver
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-23-s.hauer@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220209095350.2104049-23-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Feb 2022 08:23:45 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


09.02.2022 12:53, Sascha Hauer пишет:
> +		np = of_graph_get_remote_node(dev->of_node, i, -1);
> +		if (!np) {
> +			printk("%s: No remote for vp%d\n", __func__, i);

drm_dbg
