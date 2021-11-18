Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15353455591
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 08:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A697E6EC9C;
	Thu, 18 Nov 2021 07:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 389 seconds by postgrey-1.36 at gabe;
 Thu, 18 Nov 2021 01:33:57 UTC
Received: from smtphy.263.net (syd-smtp02.263.net [13.237.61.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED926E15D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 01:33:57 +0000 (UTC)
Received: from smtp.263.net (unknown [211.157.147.163])
 by smtphy.263.net (Postfix) with ESMTPS id 903B61200AF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:27:26 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.183])
 by smtp.263.net (Postfix) with ESMTP id A4705204
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:27:21 +0800 (CST)
Received: from localhost (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id 66A10779;
 Thu, 18 Nov 2021 09:27:18 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.93] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P11048T139933688260352S1637198830607739_; 
 Thu, 18 Nov 2021 09:27:14 +0800 (CST)
X-IP-DOMAINF: 1
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: andy.yan@rock-chips.com
X-RCPT-COUNT: 12
X-LOCAL-RCPT-COUNT: 2
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-UNIQUE-TAG: <8a96bdeaec7a0268badde3c4ba993496>
X-System-Flag: 0
Subject: Re: [PATCH v1 00/12] drm/rockchip: RK356x VOP2 support
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
From: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <3bbf42f3-bd9c-ed66-e421-8d78fbeb22ad@rock-chips.com>
Date: Thu, 18 Nov 2021 09:27:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211117143347.314294-1-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Thu, 18 Nov 2021 07:28:27 +0000
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 =?UTF-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha Hauer,

On 2021/11/17 下午10:33, Sascha Hauer wrote:
> This series adds initial graphics support for the Rockchip RK356[68]
> SoCs.  Graphics support is based around the VOP2 controller which
> replaces the VOP controller found on earlier Rockchip SoCs. The driver
> has been tested with HDMI support included in this series and MIPI-DSI
> which is not included because it needs some more work. The driver is
> taken from the downstream Rockchip kernel

Yes, you do know this is from Rockchip kernel.

Could you point me out where is the information about original author  
in your commit?

>   and heavily polished, most non
> standard features have been removed for now.

I don't agree with this, we do believe you have do some clean up to meet 
the requirement

of upstream, but all the framework and feature implement are from 
Rockchip engineer,

we have made a great effort to make everything work which block us to 
upstream this driver for now.


NAK for this series.


- Kever



