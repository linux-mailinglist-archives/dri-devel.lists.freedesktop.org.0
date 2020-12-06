Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECD52D0C29
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EC789D89;
	Mon,  7 Dec 2020 08:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9552E6E030
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 05:18:46 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CpZTZ5M3qz78Jf;
 Sun,  6 Dec 2020 13:18:10 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.9) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Sun, 6 Dec 2020
 13:18:34 +0800
Subject: Re: [PATCH 1/1] dt-bindings: eliminate yamllint warnings
To: Mark Brown <broonie@kernel.org>
References: <20201204024226.1222-1-thunder.leizhen@huawei.com>
 <20201204024226.1222-2-thunder.leizhen@huawei.com>
 <20201204174135.GC4558@sirena.org.uk>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <323edb53-71a7-ba81-17b9-704ae3e7a7a1@huawei.com>
Date: Sun, 6 Dec 2020 13:18:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201204174135.GC4558@sirena.org.uk>
Content-Language: en-US
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: Ricardo
 Ribalda <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-clk <linux-clk@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, alsa-devel <alsa-devel@alsa-project.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2020/12/5 1:41, Mark Brown wrote:
> On Fri, Dec 04, 2020 at 10:42:26AM +0800, Zhen Lei wrote:
>> All warnings are related only to "wrong indentation", except one:
>> Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:4:1: \
>> [error] missing document start "---" (document-start)
> 
> It would make life easier (and be more normal practice) to split this up
> by driver/subsystem and send a bunch of separate patches to the relevant
> maintainers, this makes it much easier to review and handle things.

Okay, I'll split this patch and send them separately. I'm not going to mark
the new patches as v2 to save trouble.

> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
