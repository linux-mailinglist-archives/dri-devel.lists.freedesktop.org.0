Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016C0A9C7F3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 13:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426FD10E94C;
	Fri, 25 Apr 2025 11:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="a9kNzEvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E0F10E953
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 11:43:04 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PBgpx42161029
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Apr 2025 06:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1745581371;
 bh=Xg1TDbnGBT45TsQLveYgPvI8nkU7nz8IjV2kP3QKEos=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=a9kNzEvUu0HqH5D7EoHl2vFxXU5EhMC5C2szo5LXz+UCXzJO8eoqDBVSH/nm/79qJ
 xzq34CsP/P8W9MCJ7oVNGEfCSllCUVrqfw1hZ7CRz33oYIUc26OGW0aeppYFPuf8/1
 Smy3higbS07sGEATmRjOCWatsVF/cwyleLaqMTYs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PBgpLh032816
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Apr 2025 06:42:51 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 06:42:49 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 06:42:50 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [10.24.72.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PBgjXu100581;
 Fri, 25 Apr 2025 06:42:46 -0500
Message-ID: <31c5956f-eda9-4084-b080-1192ce1a8192@ti.com>
Date: Fri, 25 Apr 2025 17:12:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/bridge: ti-sn65dsi86: Enable HPD functionality
To: Krzysztof Kozlowski <krzk@kernel.org>, <dianders@chromium.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ideasonboard.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>
References: <20250424105432.255309-1-j-choudhary@ti.com>
 <f0966aa4-0945-425e-9d89-370eafe13ac1@kernel.org>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <f0966aa4-0945-425e-9d89-370eafe13ac1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hello Krzysztof,

On 25/04/25 11:04, Krzysztof Kozlowski wrote:
> On 24/04/2025 12:54, Jayesh Choudhary wrote:
>> For TI SoC J784S4, the display pipeline looks like:
>> TIDSS -> CDNS-DSI -> SN65DSI86 -> DisplayConnector -> DisplaySink
>> This requires HPD to detect connection form the connector.
>> By default, the HPD is disabled for eDP. So enable it conditionally
>> based on a new flag 'keep-hpd' as mentioned in the comments in the
>> driver.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>
>> Hello All,
>>
>> Sending this RFC patch to get some thoughts on hpd for sn65dsi86.
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
> </form letter>
> 
> (But if intention was not to get review, then of course it is fine)
> 


I might have have taken unwarranted liberty while sending this patch
thinking that it was an RFC PATCH.
I was looking for comments from bridge driver maintainers to see
if this was correct approach or not. It was not ready for bindings
review yet.
This was misjudgement from my end.
(DO-NOT-MERGE tag should have been there I guess..)

I will adhere to proper flow for RFCs as well from here on.

Will resend this properly.

Thanks.
-Jayesh
