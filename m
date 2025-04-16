Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CFFA90D99
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 23:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E7110E9C7;
	Wed, 16 Apr 2025 21:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Y687mNuf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD26010E9C7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 21:11:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53GLAmXI2904667
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Apr 2025 16:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1744837849;
 bh=tqakgNlZ84w8iKwVRF23JdzLTghtrOjfwzo11hlvjNQ=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Y687mNufG8IE3V7Hunc6199++j4H7mapK0Dmj2SXh7dzV/qMpM7ZzvjektCsMOO1K
 VGvHNFpEaKHZjOKgVmZpvfJOTOF5Yyism1Jc7SWYh4s+dQ3VetJESJJXG93dNwBYII
 BjgvHper+SpOzSNcjz0Cf9rfdZcmZINkWiIfRcXQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53GLAm47023492
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Apr 2025 16:10:48 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 16:10:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 16:10:48 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [10.24.72.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53GLAiqE014870;
 Wed, 16 Apr 2025 16:10:45 -0500
Message-ID: <d6e864d9-53ea-44d3-832c-55a6e58ac6d3@ti.com>
Date: Thu, 17 Apr 2025 02:40:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Add necessary DSI flags
To: Doug Anderson <dianders@chromium.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>
References: <20250411092307.238398-1-j-choudhary@ti.com>
 <CAD=FV=Vkj_YnmYnDF3K+eYZ5M4fFPgGdmryHS8ijZOLZWbt6ZA@mail.gmail.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <CAD=FV=Vkj_YnmYnDF3K+eYZ5M4fFPgGdmryHS8ijZOLZWbt6ZA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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

Hello Doug,

On 13/04/25 07:22, Doug Anderson wrote:
> Hi,
> 
> On Fri, Apr 11, 2025 at 2:23 AM Jayesh Choudhary <j-choudhary@ti.com> wrote:
>>
>> Enable NO_EOT and SYNC flags for DSI to use VIDEO_SYNC_PULSE_MODE
>> with EOT disabled.
> 
> Any chance you could add some details to this commit message? Your
> subject says that these flags are "necessary", but people have been
> using this driver successfully for many years now. Why did these flags
> suddenly become necessary and why were things working before?
> 
> I'm not saying that we shouldn't use these flags, just trying to
> understand. I actually don't know a ton about these details in MIPI,
> so it would help me :-).
> 

Definitely.
I will add more details for the commit message.

For more context here, I was working with cadence dsi driver for TI
SoCs. So to be more accurate, this is required for CDNS_DSI

I observed other bridges like lt-9211, where I have seen such flags
being set for dsi-controller by vendors.

> 
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> index f72675766e01..8e9a7eb927da 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> @@ -707,7 +707,8 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
>>          /* TODO: setting to 4 MIPI lanes always for now */
>>          dsi->lanes = 4;
>>          dsi->format = MIPI_DSI_FMT_RGB888;
>> -       dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
>> +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
>> +                         MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> 
> FWIW, I can confirm that on my board the screen still seems to light
> up after this change. ...so I'd be OK w/
> 
> Tested-by: Douglas Anderson <dianders@chromium.org>
> 
> ...before giving a Reviewed-by I'd want a description that helps me
> understand it better.

> 
> -Doug
