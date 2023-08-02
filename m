Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD176D56D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 19:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1408110E55B;
	Wed,  2 Aug 2023 17:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C7410E55D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 17:34:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D230186888;
 Wed,  2 Aug 2023 19:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1690997645;
 bh=+erSwR1kI2VsxeBHyUbhbJ+iIvqk1xZClSlMSAoe4jE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Yhlg2BqMWqKrL5rO+jv3TGHbzvTCIxSOxH9HTw0t8PdJUUI9UqZgQiorQcrWiXsIr
 NJXjYf8UbaOlquXkW79e+aorq+fmHpZyRPS7NzaY+9Tc9du5+MNb+n5YsleiavOu0B
 U7WXwu900pkadUWMFOowL2XfYv496zZkXm4ctCLslBzINvfzifUG2rMLpzwiwDtPrd
 3cGhPTfAogt5AKSggGpnYtLVDFtOQpLNn6W20mcJTUKPm17VkhvCyuixVSoY/+45Vl
 spaidkxTvQGzJ3xz9Oz3r/wLz9vXBhdbHy5fIbf8czbsJnObjPbZb6rbnE0MNbdPPP
 raPyhPCpa3lrQ==
Message-ID: <92992f9c-fae0-f1b3-16e7-09ad3e711561@denx.de>
Date: Wed, 2 Aug 2023 19:31:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
Content-Language: en-US
To: neil.armstrong@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
 <6cd079a4-2f5b-0169-cbaf-b59a72f1b32b@denx.de>
 <084ca94e-d694-878e-0646-f4c89043cd28@denx.de>
 <c2644543-2e81-3351-ee1e-76f5f32c4ac5@linaro.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <c2644543-2e81-3351-ee1e-76f5f32c4ac5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/23 14:37, Neil Armstrong wrote:
> On 02/08/2023 14:28, Marek Vasut wrote:
>> On 8/2/23 14:07, Marek Vasut wrote:
>>> On 8/2/23 10:52, Neil Armstrong wrote:
>>>> This reverts commit [1] to fix display regression on the Dragonboard 
>>>> 845c
>>>> (SDM845) devboard.
>>>>
>>>> There's a mismatch on the real action of the following flags:
>>>> - MIPI_DSI_MODE_VIDEO_NO_HSA
>>>> - MIPI_DSI_MODE_VIDEO_NO_HFP
>>>> - MIPI_DSI_MODE_VIDEO_NO_HBP
>>>> which leads to a non-working display on qcom platforms.
>>>>
>>>> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA 
>>>> and EOT packet")
>>>>
>>>> Cc: Marek Vasut <marex@denx.de>
>>>> Cc: Robert Foss <rfoss@kernel.org>
>>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA 
>>>> and EOT packet")
>>>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
>>>> Link: 
>>>> https://lore.kernel.org/r/CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com/
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>> This breaks LT9611 operation on i.MX8M Mini/Nano/Plus, so, NAK.
>>>
>>> I am currently using this LT9611 with Linux 6.1.y
>>
>> Correction, 6.1.y only with the DSIM patches backported.
> 
> Well you'll need to keep [1] backported on your downstream branch,
> this revert won't propagate to v6.1 stable anyway.

I will still have a problem with those MX8M boards during my development 
on linux-next, so that isn't helping.

>>> in production and this is not acceptable. I also believe the correct 
>>> fix is on the MSM side, not on the LT9611 driver side, since MSM 
>>> incorrectly implements these flags.
>>
> 
> Since [1] breaks Qcom boards on v6.5, and [1] was added for v6.5 to make 
> the bridge work
> on i.MX8M Mini/Nano/Plus, it's not acceptable either to keep it for the 
> v6.5 release.

So, we need to find a solution which works for both, I proposed one already.
