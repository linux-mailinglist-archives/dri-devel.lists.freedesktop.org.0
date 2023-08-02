Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3676D56B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 19:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B562C10E55A;
	Wed,  2 Aug 2023 17:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61DC10E559
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 17:34:03 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D294886863;
 Wed,  2 Aug 2023 19:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1690997642;
 bh=5SVSATqR9X+QGwFAD+ody3ENAQjB+Ws+LryjglXK6GQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jgoIiR97HYJ3Esx98FNE1iCDcOKogg8kvLIls7BRwweGczvkuV52H+MBoDwNl7zT1
 nvu0U6TwbvRjfonfTmMKO16zHGlg9V8ne7FdJJCBd8zwnl2rSEVx1qh+d3VYpm9tHD
 bau87T4OFkWTwEka97rD+8NlPehdgmUK43Ly89N7MHRcuaNkuBNFIs+LpNPV5mGzMq
 vKPKeET3W8AqHmU1uofgeysmSlcEMdvEl3JP9THe1T7WFDdKjzqsLxrlrq7o/rxIiO
 rcjYKSaM8xo/xs3UAohyT1omgsT7Hfu5jwvIcIxkj6ycvoPcQNFz2vDI0jy66ID07K
 9bxtkgYXFYrjA==
Message-ID: <a2a5fa44-90d5-d104-2268-29a14a27b514@denx.de>
Date: Wed, 2 Aug 2023 19:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
 <6cd079a4-2f5b-0169-cbaf-b59a72f1b32b@denx.de>
 <6f96cd11-5055-ab36-74e3-20a45c0d8b40@linaro.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <6f96cd11-5055-ab36-74e3-20a45c0d8b40@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Amit Pundir <amit.pundir@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/23 15:16, Dmitry Baryshkov wrote:
> On 02/08/2023 15:07, Marek Vasut wrote:
>> On 8/2/23 10:52, Neil Armstrong wrote:
>>> This reverts commit [1] to fix display regression on the Dragonboard 
>>> 845c
>>> (SDM845) devboard.
>>>
>>> There's a mismatch on the real action of the following flags:
>>> - MIPI_DSI_MODE_VIDEO_NO_HSA
>>> - MIPI_DSI_MODE_VIDEO_NO_HFP
>>> - MIPI_DSI_MODE_VIDEO_NO_HBP
>>> which leads to a non-working display on qcom platforms.
>>>
>>> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA 
>>> and EOT packet")
>>>
>>> Cc: Marek Vasut <marex@denx.de>
>>> Cc: Robert Foss <rfoss@kernel.org>
>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA 
>>> and EOT packet")
>>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
>>> Link: 
>>> https://lore.kernel.org/r/CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com/
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> This breaks LT9611 operation on i.MX8M Mini/Nano/Plus, so, NAK.
>>
>> I am currently using this LT9611 with Linux 6.1.y in production and 
>> this is not acceptable. I also believe the correct fix is on the MSM 
>> side, not on the LT9611 driver side, since MSM incorrectly implements 
>> these flags.
> 
> There is no indication that MSM gets these flags wrong.
> 
> Let me quote the DSI 1.3 (I think Abhinav already quoted DSI 1.2).
> 
> Chapter 8.11.1 Transmission Packet Sequences:
> 
> ========
> If a peripheral timing specification for HBP or HFP minimum period is 
> zero, the corresponding Blanking
> Packet may be omitted. If the HBP or HFP maximum period is zero, the 
> corresponding blanking packet
> shall be omitted.
> ========
> 
> Next, chapter 8.11.2 Non-Burst Mode with Sync Pulses
> 
> ======
> Normally, periods shown as HSA (Horizontal Sync Active), HBP (Horizontal 
> Back Porch) and HFP
> (Horizontal Front Porch) are filled by Blanking Packets, with lengths 
> (including packet overhead)
> calculated to match the period specified by the peripheral’s data sheet. 
> Alternatively, if there is sufficient
> time to transition from HS to LP mode and back again, a timed interval 
> in LP mode may substitute for a
> Blanking Packet, thus saving power. During HSA, HBP and HFP periods, the 
> bus should stay in the LP-11
> state.
> ========
> 
> So, by the spec, sending the HSA / HBP / HFP as blanking packets should 
> always be accepted (and it is the default mode). Switching to LP-11 
> should be permitted if there is a sufficient time to switch to LP-11 and 
> back. Not sending the packets is only possible if the peripheral 
> (lt9611) says so.
> 
> We already know that lt9611 breaks if we try switching to LP-11 during 
> this period. We know that the there is a requirement time for the HSA / 
> HBP / HFP, because the HDMI monitor needs them. Thus, I can only 
> emphasise that the behaviour before the offending patch was correct.
> 
> Last, but not least, breaking the in-kernel platform for the out-of-tree 
> peripheral doesn't sound correct.

Except the MX8M support is all in-tree now, so please drop the 
"out-of-tree" argument. That I am using 6.1.y on those platforms in 
production makes no difference.

> I can only propose the following steps:
> 
> 1. land the revert to unbreak existing users.

That's just trading breaking one set of users for breaking another set 
of users.

> 2. Marek to propose and land the DT bindings & driver change that will 
> enable the workaround for the particular platform (i.MX8m).

Since I have no access to the QCOM hardware or datasheet, can you have a 
look at the NXP.com MX8M M/N/P datasheets (those are available) and 
compare their behavior with the QCOM behavior ? I assume you do have the 
QCOM datasheets available.
