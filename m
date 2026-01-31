Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEDELNTHfWmMTgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 10:13:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1A8C154C
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 10:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D16310E08B;
	Sat, 31 Jan 2026 09:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="MsYKqwhs";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="MsYKqwhs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1007 seconds by postgrey-1.36 at gabe;
 Sat, 31 Jan 2026 09:13:50 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09CB10E08B
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 09:13:50 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=iu3kshl9/WY0tgauyrmyToMwOoDlheo00SRw9y/3eA8=;
 b=MsYKqwhsEK8aqPF14KqCc1LMZdsv+HVuSPaAjfLPSHpYLpPyRLih+t9OBQWprlShWgoblxTgC
 M4M1ZPqHPLRcdzmgBTf2vKa6JReAUE32uclGvHgf0RDfYchcfBCJT7jo4XIDkvnSYl/2y6PsqQf
 V+H8kRCf29vxuUaNV+5Vt6A=
Received: from canpmsgout07.his.huawei.com (unknown [172.19.92.160])
 by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f36Dl6vnGz1BG0g
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 16:56:23 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=iu3kshl9/WY0tgauyrmyToMwOoDlheo00SRw9y/3eA8=;
 b=MsYKqwhsEK8aqPF14KqCc1LMZdsv+HVuSPaAjfLPSHpYLpPyRLih+t9OBQWprlShWgoblxTgC
 M4M1ZPqHPLRcdzmgBTf2vKa6JReAUE32uclGvHgf0RDfYchcfBCJT7jo4XIDkvnSYl/2y6PsqQf
 V+H8kRCf29vxuUaNV+5Vt6A=
Received: from mail.maildlp.com (unknown [172.19.162.92])
 by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f369M3pXSzLlSk;
 Sat, 31 Jan 2026 16:53:27 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id A379A40562;
 Sat, 31 Jan 2026 16:56:56 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 31 Jan 2026 16:56:56 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 31 Jan 2026 16:56:55 +0800
Message-ID: <404cdfef-233a-445b-8fbd-166dfeb2485b@huawei.com>
Date: Sat, 31 Jan 2026 16:56:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 drm-dp 9/9] drm/hisilicon/hibmc: Add vga connector
 detect functions
To: Thomas Zimmermann <tzimmermann@suse.de>, <xinliang.liu@linaro.org>,
 <tiantao6@hisilicon.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
 <shaojijie@huawei.com>, <jani.nikula@linux.intel.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>,
 <helin52@h-partners.com>
References: <20250331074212.3370287-1-shiyongbang@huawei.com>
 <20250331074212.3370287-10-shiyongbang@huawei.com>
 <0eb5c509-2724-4c57-87ad-74e4270d5a5a@suse.de>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <0eb5c509-2724-4c57-87ad-74e4270d5a5a@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100007.china.huawei.com (7.202.195.175)
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,linaro.org,hisilicon.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:xinliang.liu@linaro.org,m:tiantao6@hisilicon.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:daniel@ffwll.ch,m:kong.kongxinwei@hisilicon.com,m:liangjian010@huawei.com,m:chenjianmin@huawei.com,m:lidongming5@huawei.com,m:libaihan@huawei.com,m:shenjian15@huawei.com,m:shaojijie@huawei.com,m:jani.nikula@linux.intel.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:shiyongbang@huawei.com,m:helin52@h-partners.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,huawei.com:dkim,huawei.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[shiyongbang@huawei.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shiyongbang@huawei.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B1A8C154C
X-Rspamd-Action: no action


> Hi
>
> Am 31.03.25 um 09:42 schrieb Yongbang Shi:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> Because the connected VGA connector would make driver can't get the
>> userspace call, adding detect_ctx in vga connector to make HPD active
>> userspace.
>>
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c 
>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> index 05e19ea4c9f9..e8a527ede854 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> @@ -60,6 +60,7 @@ static void hibmc_connector_destroy(struct 
>> drm_connector *connector)
>>   static const struct drm_connector_helper_funcs
>>       hibmc_connector_helper_funcs = {
>>       .get_modes = hibmc_connector_get_modes,
>> +    .detect_ctx = drm_connector_helper_detect_from_ddc,
>
> This change exposed a bug in the hibmc DDC support.
>
> Calling drm_connector_helper_detect_from_ddc() does not work 
> correctly. The i2c transfer never receives the monitor's EDID because 
> of an internal error. It fails with -ENXIO.  The error originates at 
> [1]. Th values of ret and nak_ok are both 0 when that happens.
>
> As a result, the VGA connector is always marked as disconnected.
>
> To fix this, maybe something else has to be enabled first. There seems 
> quite a bit of power management in hibmc_crtc_atomic_enable(). Maybe 
> some of that has to be done before the i2c transfer as well?
>
> Best regards
> Thomas
>
>
> [1] 
> https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/i2c/algos/i2c-algo-bit.c#L514 
>

Hi Zimmermann，

Thanks for raising this issue. This problem arises due to the
hardware link in the forward-generational product don't support
for detecting VGA connections.

In prior versions, the `.detect_ctx` callback function was not
implemented, resulting in VGA connections being detected by default.
However, this patch requires detecting VGA connections via the
hardware link, causing the VGA connection to be marked as
"disconnected" continuously.

We have already developed a solution for this issue, and the
new patch is currently being prepared for release. Your report
has reminded us to focus on ensuring that this patch can fully
resolve the problem in the previous generation products.

We appreciate your feedback and will continue to monitor the
situation closely to ensure a smooth resolution.

Thanks,
Lin He.


>>   };
>>     static const struct drm_connector_funcs hibmc_connector_funcs = {
>> @@ -127,5 +128,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
>>         drm_connector_attach_encoder(connector, encoder);
>>   +    connector->polled = DRM_CONNECTOR_POLL_CONNECT | 
>> DRM_CONNECTOR_POLL_DISCONNECT;
>> +
>>       return 0;
>>   }
>
