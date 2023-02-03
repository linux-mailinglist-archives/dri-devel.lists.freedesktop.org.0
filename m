Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73FC68A006
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 18:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FB210E12F;
	Fri,  3 Feb 2023 17:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 501 seconds by postgrey-1.36 at gabe;
 Fri, 03 Feb 2023 17:13:29 UTC
Received: from xvfrqvdb.outbound-mail.sendgrid.net
 (xvfrqvdb.outbound-mail.sendgrid.net [168.245.72.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A65010E12F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 17:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=mime-version:subject:references:from:in-reply-to:to:cc:content-type:
 content-transfer-encoding:cc:content-type:from:subject:to;
 s=s1; bh=tgnffy1kLdc2rjXQ3zkCmWRoKKxovZ0GRL3XLjt079Y=;
 b=VmrNUX/0+SDIR1GZWNvOr5o2TV/73C9H1WXUhLrWQCrZjrl8EJDMd/lpYTI0oxYB6tAb
 SfmrQVkGJDzZOvK35wyt61BiDF7eCPLFZy98ZNaCysN0Dmcx2yz2JoQ11tGd1edVWYdfCd
 h8GOr1TK6lvORO3I7Epkj4CgrXwz2/pOEMkc/HwjmUblg0pejdGAZFo+6r7e22feINxf+u
 5IMqNlAieaNyup/wGvZ/aVwZ6eibeb/2dP3s1sMNsTOmDJIwjhL89DVzFBKVkdvA1rvolk
 1rH4A42MqXOKA+SXYpi0ur4WbKeTt50JIXpoY4YJ1rRCx8Au7zsy/QmvwbzL7hzw==
Received: by filterdrecv-6b9548745c-6wb9t with SMTP id
 filterdrecv-6b9548745c-6wb9t-1-63DD3CA1-2D
 2023-02-03 16:56:01.672165427 +0000 UTC m=+6716871.650146100
Received: from [192.168.1.50] (unknown) by geopod-ismtpd-1-0 (SG) with ESMTP
 id EyEL--W5SfqdBEXeFMRuxg Fri, 03 Feb 2023 16:56:01.309 +0000 (UTC)
Message-ID: <4a8f98c6-4de0-06ff-9711-5d85fc6f91f9@kwiboo.se>
Date: Fri, 03 Feb 2023 16:56:01 +0000 (UTC)
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/3] drm/rockchip: dw_hdmi: Add 4k@30 support
References: <20230118132213.2911418-1-s.hauer@pengutronix.de>
 <20230131080928.GG23347@pengutronix.de>
 <3C4B67628F8D73D6+63ea74ac-b8a2-45b1-5f92-8c7868906687@radxa.com>
 <20230203130943.GX13319@pengutronix.de>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20230203130943.GX13319@pengutronix.de>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h0KimEuIF=2FjO+XcZ2?=
 =?us-ascii?Q?lcfeQNZ9tFeyNj4LUPJiEj8ONG6wnLZUd+vtfk1?=
 =?us-ascii?Q?F4vMzDmlIyVB=2F02jdZ1XQeWyyfDLm=2FGi5fHHauv?=
 =?us-ascii?Q?SJZ2Mhu3eCVab+OcDWzAgTnEpNq2jwdbyqhz7Fw?=
 =?us-ascii?Q?2e2uJ7MePxoA5CcWYYC+JhLnEc=2FpNq8QWIfJXS=2F?=
 =?us-ascii?Q?kk2WRepTF9Prh6ifDotbw=3D=3D?=
To: Sascha Hauer <s.hauer@pengutronix.de>, FUKAUMI Naoki <naoki@radxa.com>
X-Entity-ID: P7KYpSJvGCELWjBME/J5tg==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
Cc: Dan Johansen <strit@manjaro.org>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On 2023-02-03 14:09, Sascha Hauer wrote:
> Hi,
> 
> On Wed, Feb 01, 2023 at 09:23:56AM +0900, FUKAUMI Naoki wrote:
>> hi,
>>
>> I'm trying this patch series with 6.1.x kernel. it works fine on rk356x
>> based boards (ROCK 3), but it has a problem on rk3399 boards (ROCK 4).
>>
>> on rk3399 with this patch, I can see large noise area (about one third right
>> side of the screen) at 4k@30. 1080p works fine as same as before.
>>
>> can someone reproduce this problem on rk3399?
> 
> I have a RK339 board here, I can try to reproduce this next week. Of
> course I have no idea what the issue might be, in the downstream Kernel
> I can't find anything that is handled specially for the RK3399.
> 
> What might be worth checking is the VOP clock rate. Does the VOP clock
> in /sys/kernel/debug/clk/clk_summary (I don't know which one it is
> though) match the pixelclock?
> 
> If nothing else helps I can change the code to only allow the higher
> resolutions on RK3568 where we know it works.

This series only seem to pick up part of the dw-hdmi related changes that
originates from an old chromium 4.4 kernel. Maybe that is the reason
this cause issues on other SoCs?

I have very recently resumed kernel coding after being away for the last
2-3 years and was planning on resuming work on a HDMI 2.0 series based on
old work at [1], [2] and [3]. Those patches never got any traction last
time around, maybe there is more interest now, seeing this series :-)

I was planning on basing such series on top of this, but seeing how this
seem to have issues on other SoCs I am not sure how to proceed.

With the patches at [3] (and related patches) HDMI 2.0 modes (4K@60hz)
is possible with at least RK3288, RK3328, RK3399 and RK3568 SoCs.
However, those patches needs to be cleaned up a bit before they will
hit the mailing list.

[1] https://lore.kernel.org/all/20200108210740.28769-1-jonas@kwiboo.se/
[2] https://lore.kernel.org/all/20200922205933.5540-1-jonas@kwiboo.se/
[3] https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Rockchip/patches/linux/default/linux-1000-drm-rockchip.patch

Regards,
Jonas

> 
> Sascha
> 
>>
>> --
>> FUKAUMI Naoki
>>
>> On 1/31/23 17:09, Sascha Hauer wrote:
>>> Heiko, Sandy,
>>>
>>> Ok to apply these patches?
>>>
>>> Sascha
>>>
>>> On Wed, Jan 18, 2023 at 02:22:10PM +0100, Sascha Hauer wrote:
>>>> It's been some time since I last sent this series. This version fixes
>>>> a regression Dan Johansen reported. The reason turned out to be simple,
>>>> I used the YUV420 register values instead of the RGB ones.
>>>>
>>>> I realized that we cannot achieve several modes offered by my monitor
>>>> as these require pixelclocks that are slightly below the standard
>>>> pixelclocks. As these are lower than the standard clock rates the PLL
>>>> driver offers the clk driver falls back to a way lower frequency
>>>> which results in something the monitor can't display, so this series
>>>> now contains a patch to discard these unachievable modes.
>>>>
>>>> Sascha
>>>>
>>>> Changes since v2:
>>>> - Use correct register values for mpll_cfg
>>>> - Add patch to discard modes we cannot achieve
>>>>
>>>> Changes since v1:
>>>> - Allow non standard clock rates only on Synopsys phy as suggested by
>>>>    Robin Murphy
>>>>
>>>> Sascha Hauer (3):
>>>>    drm/rockchip: dw_hdmi: relax mode_valid hook
>>>>    drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
>>>>    drm/rockchip: dw_hdmi: discard modes with unachievable pixelclocks
>>>>
>>>>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 40 ++++++++++++++++-----
>>>>   1 file changed, 32 insertions(+), 8 deletions(-)
>>>>
>>>> -- 
>>>> 2.30.2
>>>>
>>>>
>>>
>>
>>
> 

