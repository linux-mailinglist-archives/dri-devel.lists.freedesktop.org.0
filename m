Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4493BB7F57D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 15:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661B810E1CE;
	Wed, 17 Sep 2025 13:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="OB6i/5+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA6C10E1CE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 13:33:31 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HDX5O5257011;
 Wed, 17 Sep 2025 08:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1758115985;
 bh=4ugsa4/0/nBs7/nCN/iRlWhAr+2bZP9S4rlwvOe5Q2A=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=OB6i/5+QsDKnmnj3ap9ZCMLNpSVKaL7RSlQgmutQ3CYFjSWZ/z9Mzsmd9/5gimdUw
 svfSGkss6wnpDN6eVbi9yRGXsH6UiCZ71odkSPINc5ws6UB70inTbHjx0SsaJfWKwi
 UhWQzfyJTsWIrrKcnS7/PN/zWiHZU46/K1n8Vvb4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HDX4QS1573544
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 17 Sep 2025 08:33:04 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 08:33:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 08:33:04 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HDWxAn3413902;
 Wed, 17 Sep 2025 08:32:59 -0500
Message-ID: <a0df1c72-2571-4791-ac66-07f9b3431ff6@ti.com>
Date: Wed, 17 Sep 2025 19:02:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] drm/tidss: oldi: Add property to identify OLDI
 supported VP
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <h-shenoy@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <aradhya.bhatia@linux.dev>
References: <20250911110715.2873596-1-s-jain1@ti.com>
 <20250911110715.2873596-2-s-jain1@ti.com>
 <a306a386-bbd9-408c-b76d-0ecebc1f32ae@ideasonboard.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <a306a386-bbd9-408c-b76d-0ecebc1f32ae@ideasonboard.com>
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

Hi Tomi,

On 9/16/25 17:10, Tomi Valkeinen wrote:
> Hi,
> 
> On 11/09/2025 14:07, Swamil Jain wrote:
>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>
>> TIDSS should know which VP has OLDI output to avoid calling clock
>> functions for that VP as those are controlled by oldi driver. Add a
>> property "is_ext_vp_clk" to "tidss_device" structure for that. Mark it
>> 'true' in tidss_oldi_init() and 'false' in tidss_oldi_deinit().
>>
>> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
> 
> What bug does this fix? It's just adding a new field which it sets to
> true/false...

Please take a look: 
https://lore.kernel.org/all/a0489fea-8c06-4c89-a530-8be691f4705d@ti.com/

Should we remove the tag?
Or, else, please suggest a better way to describe the issue mentioned in 
above link.

Regards,
Swamil
> 
>   Tomi
> 
>> Tested-by: Michael Walle <mwalle@kernel.org>
>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_drv.h  | 2 ++
>>   drivers/gpu/drm/tidss/tidss_oldi.c | 2 ++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
>> index 84454a4855d1..e1c1f41d8b4b 100644
>> --- a/drivers/gpu/drm/tidss/tidss_drv.h
>> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
>> @@ -24,6 +24,8 @@ struct tidss_device {
>>   
>>   	const struct dispc_features *feat;
>>   	struct dispc_device *dispc;
>> +	bool is_ext_vp_clk[TIDSS_MAX_PORTS];
>> +
>>   
>>   	unsigned int num_crtcs;
>>   	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
>> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
>> index 7688251beba2..7ecbb2c3d0a2 100644
>> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
>> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
>> @@ -430,6 +430,7 @@ void tidss_oldi_deinit(struct tidss_device *tidss)
>>   	for (int i = 0; i < tidss->num_oldis; i++) {
>>   		if (tidss->oldis[i]) {
>>   			drm_bridge_remove(&tidss->oldis[i]->bridge);
>> +			tidss->is_ext_vp_clk[tidss->oldis[i]->parent_vp] = false;
>>   			tidss->oldis[i] = NULL;
>>   		}
>>   	}
>> @@ -580,6 +581,7 @@ int tidss_oldi_init(struct tidss_device *tidss)
>>   		oldi->bridge.timings = &default_tidss_oldi_timings;
>>   
>>   		tidss->oldis[tidss->num_oldis++] = oldi;
>> +		tidss->is_ext_vp_clk[oldi->parent_vp] = true;
>>   		oldi->tidss = tidss;
>>   
>>   		drm_bridge_add(&oldi->bridge);
> 

