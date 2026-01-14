Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA42D1BFE8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33B510E370;
	Wed, 14 Jan 2026 01:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="Cg3L0u0h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 530 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jan 2026 01:52:38 UTC
Received: from smtp-usa2.onexmail.com (smtp-usa2.onexmail.com [35.173.142.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D680E10E370
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1768355548;
 bh=JtDaMTrCVYTenPyLUxDxSKCKTU8w9pk7EHSNHOX9HKM=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=Cg3L0u0hboIF4wstkHorc3g5jr+YuKOCscxlx/2J8OilxdjLhfWju8HXw6VgG5Kyd
 jwGNk5lHlRyXnGzZJrmSatWHU1QVCY2RafGCt6FrQa5ioutVvXud6mCTtCqGh/FbO7
 BcRY60Ub2aAxE6jU/nrxOoDc48yj9ZIxFv6WOsK4=
X-QQ-mid: esmtpgz12t1768354962tdb7ab234
X-QQ-Originating-IP: C3zBYr1GJh9vpI3rU4BSSw305QsfwgZ2bJEwtEh/f9c=
Received: from [172.16.12.51] ( [58.22.7.114]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 14 Jan 2026 09:42:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7794570359675995168
Message-ID: <C5D30204B8186D5B+5f2f87f2-3fff-403e-a439-847fda61e2d8@airkyi.com>
Date: Wed, 14 Jan 2026 09:42:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add DisplayPort support for rk3576
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Andy Yan <andyshrk@163.com>, heiko@sntech.de,
 dmitry.baryshkov@oss.qualcomm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
 mripard@kernel.org, hjc@rock-chips.com, robh@kernel.org,
 tzimmermann@suse.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
References: <20260109080054.228671-1-andyshrk@163.com> <aWa8mvBkTrKhZBFo@venus>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <aWa8mvBkTrKhZBFo@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MDqtQ4jGWXAGzSwxoNjzr4ylGj8sv4UG3Hmp2c6q6H49+wTLWkvy9OXT
 62UujZZ7yzrs/XXoTuoJdGf8z7TrLBEh7IBZjvdpN3zQ/XGvEPjOC+1fChrmk3NfFuPAkT/
 jyLmVAVffJtvJ3WoWydYt81ToKWsjDIxkPVAA9wEevKZlstHSJ5INPH5mKdQAinU1kb5idA
 XGYzZrmUaHKq+nQ5kaUbTuRQz2fNGuhTy02GYPXy6bvBa2Mp6KXG3a10o4MN7apn+3dwMkp
 2SL7aK9iVQnl6ePVq4RP2AqftHf0GmbNLckkmJh9mof3kr9UCqEXU3ZC2J9YO2LbRcbXSNx
 +aj3OCmfNj5E7lIqllwfHYyjOgmjI7GIxefd+LgS8a5vO60U6IUh+X1bqeol91zquzzFCgp
 kaZu+wnudqF3mGPf3wHRW0JCgB6LS3aUZJTh9+ZVfTP+eaeSJcJhZrsFgNXrGpp7o0t6SRF
 qyxoHta47riBNvVKHSYfjxKRoMhj9AVpvAThu452HuDBMO0Q/UtgnpU1raKDt6TlVkaYGdE
 Ak8i5H6YygCF0tN99w7kglui/VwHOOKjt9qlzAkfIwM8IIyHO6og076UAOHqP2gPnTSsvgy
 +VNgBeXyGSfLm5MQtEbsLrBOJf+TkMrb074tPSdcv/86VaH370Uoyi8OPF5OYqfzc5jEZ9C
 AZJGPkAlDjw+5x4YY3t3LcXzKivmfLyDMve2UEIc4S6aFtprHm7Cj2WlOYFhRonV5X/RBqf
 jK+B2vGHwZSu+iUN/pyRbQc8nGSJ33CFZjA5MrwR8A6beJkkFe4Rngpq+jo0RMBElUiZeOT
 rNDqlb51+KEPfTjDGu7B2e/m3AO32NhmEQeMexolmsu/EArjMZ61ultvtct2kFcJQCLkhPg
 Ha0h53hOEMs6U8G0kBQ5s9X0TL5nL2MZNMG+IJ9DygHPOX5F91PcJTtDB9nDjYofdGIMxWH
 NgvENirkLjEGTDuepE6iSrlnMO+BLM6z17UlMDaw9/JeT9m+oHUjfF8t5
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
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

Hi Sebastian,

On 1/14/2026 5:51 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Jan 09, 2026 at 04:00:43PM +0800, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> The DisplayPort found on RK3576 is very similar to that of RK3588,
>> but work in qual pixel mode and support for MST.
>>
>> This patch series aims to add basic display output, not include
>> audio and MST, which will be the work for the next stage.
>>
>> Only test with 2 lane standard DP port output now.
> 
> This is a nice minimal series :) I got it working to some degree on
> the RK3576 Sige5 USB-C port. The display connection detection is
> _very_ unstable, but that part is handled by the TypeC Port Manager
> and unrelated to the DP controller (and already an issue on the RK3588
> based Rock 5B). IF the display is detected (i.e. USB-C side worked
> properly), the DP controller managed to do proper output too. Thus
> I believe this should be merged. I plan to look into the TCPM issues
> in the meantime.

Based on experience with other platforms, I suspect that some HPD events
are not being properly propagated to the DP driver. This might be worth 
looking into.

-- 
Best, 
Chaoyi

