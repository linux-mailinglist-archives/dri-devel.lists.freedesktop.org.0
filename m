Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0F74D2A75
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 09:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D651C10E928;
	Wed,  9 Mar 2022 08:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F4110E914
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 08:18:18 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nRrWQ-0000mv-AP; Wed, 09 Mar 2022 09:18:14 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nRrWM-0007ek-O8; Wed, 09 Mar 2022 09:18:10 +0100
Date: Wed, 9 Mar 2022 09:18:10 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: "zhangqing@rock-chips.com" <zhangqing@rock-chips.com>
Subject: Re: Re: [PATCH v7 10/24] drm/rockchip: dw_hdmi: Add support for hclk
Message-ID: <20220309081810.GH405@pengutronix.de>
References: <78207d97-b5a1-9792-8ec9-11fcf2e00370@gmail.com>
 <90c61299-f02c-607b-4734-7134852ef0a6@arm.com>
 <20220225131154.GE19585@pengutronix.de>
 <20220228141921.GN19585@pengutronix.de>
 <5184ecf2-8734-3121-cbbc-5dcfcf0d02f8@arm.com>
 <20220302112528.GV19585@pengutronix.de>
 <20220304142235.GL22780@pengutronix.de>
 <9ea0134e-aac7-60e1-5c58-ae31b4e1c422@collabora.com>
 <035f2dfd-bf35-abca-32bf-2be85cc88f8a@rock-chips.com>
 <20220309094139198367142@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220309094139198367142@rock-chips.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:57:51 up 88 days, 16:43, 82 users,  load average: 0.00, 0.03, 0.08
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: huangtao <huangtao@rock-chips.com>, devicetree <devicetree@vger.kernel.org>,
 =?utf-8?B?5pON55Ge5p2w?= <algea.cao@rock-chips.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 pgwipeout <pgwipeout@gmail.com>, hjc <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?5p2o5Yev?= <Kever.yang@rock-chips.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?utf-8?B?5byg5pm0?= <elaine.zhang@rock-chips.com>,
 =?utf-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
 Dmitry Osipenko <digetx@gmail.com>, "robin.murphy" <robin.murphy@arm.com>,
 kernel <kernel@pengutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Elaine,

On Wed, Mar 09, 2022 at 09:41:39AM +0800, zhangqing@rock-chips.com wrote:
>    hi，all：
>    Let me explain the clock dependency：
>    From the clock tree, pclk_vo0 and hclk_vo0 are completely independent
>    clocks with different parent clocks and different clock frequencies。
>    But the niu path is :
>    pclk_vo is dependent on hclk_vo, and the pclk_vo niu goes through  hclk_vo
>    niu.

Thanks, this is the information we are looking for. What is "NIU" btw?
I think this is even documented in the Reference Manual. With the right
pointer I just found:

> A part of niu clocks have a dependence on another niu clock in order to
> sharing the internal bus. When these clocks are in use, another niu
> clock must be opened, and cannot be gated.  These clocks and the special
> clock on which they are relied are as following:
>
> Clocks which have dependency     The clock which can not be gated
> -----------------------------------------------------------------
> ...
> pclk_vo_niu, hclk_vo_s_niu       hclk_vo_niu
> ...



>    The clock tree and NIU bus paths are designed independently
>    So there are three solutions to this problem:
>    1. DTS adds a reference to Hclk while referencing Pclk.
>    2, The dependent clock is always on, such as HCLK_VO0, but this is not
>    friendly for the system power.
>    3. Create a non-clock-tree reference. Clk-link, for example, we have an
>    implementation in our internal branch, but Upstream is not sure how to
>    push it.

I thought about something similar. That would help us here and on i.MX
we have a similar situation: We have one bit that switches multiple
clocks. That as well cannot be designed properly in the clock framework
currently, but could be modelled with a concept of linked clocks.

Doing this sounds like quite a bit of work and discussion though, I
don't really like having this as a dependency to mainline the VOP2
driver. I vote for 1. in that case, we could still ignore the hclk in
dts later when we have linked clocks.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
