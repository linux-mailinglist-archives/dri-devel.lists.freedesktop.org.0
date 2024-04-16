Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820CA8A6493
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 09:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9D51121EC;
	Tue, 16 Apr 2024 07:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=kernel-space.org header.i=@kernel-space.org header.b="i0nuTixv";
	dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b="uo+wJEes";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel-space.org (mail.kernel-space.org [195.201.34.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81F61121EC;
 Tue, 16 Apr 2024 07:12:12 +0000 (UTC)
Received: from kernel-space.org (localhost [127.0.0.1])
 by kernel-space.org (OpenSMTPD) with ESMTP id 1430f1f4;
 Tue, 16 Apr 2024 07:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=kernel-space.org; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=s1; bh=Z1
 w+s6NRCqBouvDYy468IO5XF1k=; b=i0nuTixvHpj1jO0WSSgxVSl86770LLozqR
 327Oj7va8azyT1JuAr8gw7qSbTeE3A6EelzxguZ6MkFCntbAKiu4LefGSCyXGPgN
 e1Ojo7rRpDT1B3D3WOh+0ec0dHHLG4V7JSPXeXzGRXSv19LEyFBA5fsw77akV8Ic
 Tnh/vQjAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=kernel-space.org; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; q=dns; s=s1; b=
 KjqttlfkmUXEBtGmMgiNaZ8QPt4dmGy5aUjF782xPCJiSQZaOJCqmZSv6xjOjO74
 nDjc1kylD0jKXH+edwmNfzNMJGnEQSqJNIgnMyHistwMVa1Aq6VuTYBQGagSlmFw
 AWn+avopIZkAHsGgmQ6W3iMeEQFUKgNFV8+rd/bhjxM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
 s=s1; t=1713251528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P551zbXwnZHBx5Hdorr+Ec/G4PT8Gcb0Z0W5EN8YaPg=;
 b=uo+wJEesR03TcKwiL4uraxjEeeS+DLHAzPhjxqI8q9pq5N+mHfN3CcAcOglamhE8imFNet
 C0Fpe1uPh0YFTmlFstCCiM20uNm2FWn1fWCdv/pXeujovjbpsz2pJAktMXTm975BbsWOzp
 c+kWfUp7UHlT10wj1PHIZj31ltduQ5Q=
Received: from [192.168.0.2] (host-79-50-77-159.retail.telecomitalia.it
 [79.50.77.159])
 by kernel-space.org (OpenSMTPD) with ESMTPSA id 3749a753
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 16 Apr 2024 07:12:08 +0000 (UTC)
Message-ID: <3933b628-c715-403b-a44e-4bcf95c6a217@kernel-space.org>
Date: Tue, 16 Apr 2024 09:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/nouveau/disp: add backlight for ada lovelace
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, kherbst@redhat.com, dakr@redhat.com
References: <20240412194901.1596-1-angelo@kernel-space.org>
 <c25eef55a661cc87e4dc70b672e6a205d4b5a490.camel@redhat.com>
Content-Language: en-US
From: Angelo Dureghello <angelo@kernel-space.org>
In-Reply-To: <c25eef55a661cc87e4dc70b672e6a205d4b5a490.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Lyude,

thanks a lot for your reply,

On 15/04/24 6:54 PM, Lyude Paul wrote:
> Hm. Could you share some logs with drm.debug=0x116? I'm a bit confused
> because I would have thought that we were already probing for eDP
> backlights seeing as I added support for them at one point?
>
> (I hope this isn't the point I learn I actually forgot to add support
> for them :P)
>
i am attaching 2 dmesg logs with drm.debug=0x116, with these 2 patches
applied to mainstream, and without them.

https://pastecode.io/s/fyjkky6y
https://pastecode.io/s/gdf8v3e3


Note, this laptop (Lenovo Legion 5 Pro 16ARX8) has 2 video cards,
amd (cpu built-in), and additional nvidia, it can work in "switchable"
mode, where amndgpu backlight works, and in discrete mode (as now),
using only nvidia gpu.

Main issue is that in nouveau_backlight.c
nouveau_backlight_init() is actually not considering ADA LOVELACE in
the main switch/case. So execution falls back to acpi backlight,
that for this laptop does not work at all (tried vendor, native,
video). Tested also nvidia-wmi-ec-backlight, the module does not
even get loaded. Only solution i found is this patchset.


> On Fri, 2024-04-12 at 21:49 +0200, Angelo Dureghello wrote:
>> Add working backlight for "ada lovelace" missing case.
>>
>> The nvif method is actually not working for this chipset so
>> used the drm apis. Also, by dpcd, drm layer is calculating a
>> max brightness of 255, but to get a real correct max brightnes
>> the maximum must be multiplied by a factor of 16.
>>
>> Tested to work properly in Legion Lenovo Pro 5
>>
>> Lenovo Legion 5 Pro 16ARX8
>> Bios ver LPCN49WW
>> 	 LPEC49WW
>> SN PF4T63AZ
>> Nvidia RTX4060 MaxQ/Mobile rev a1 (ADA LOVELACE AD107M)
>> AMD Ryzen 9 7945HX + Radeon
>>
>> and wayland.
>>
>> ---
>> Changes for v2:
>> - add some comments
>> - remove x16 multiplication (hack)
>> - remove forgot debug printk
>>
>> Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_backlight.c | 54
>> +++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> index d47442125fa1..7b7306d18ad7 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> @@ -286,6 +286,56 @@ nv50_backlight_init(struct nouveau_backlight
>> *bl,
>>   	return 0;
>>   }
>>   
>> +static int
>> +nv19x_backlight_init(struct nouveau_backlight *bl,
>> +		     struct nouveau_connector *nv_conn,
>> +		     struct nouveau_encoder *nv_encoder,
>> +		     struct backlight_properties *props,
>> +		     const struct backlight_ops **ops)
>> +{
>> +	int ret;
>> +	u16 current_level;
>> +	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
>> +	u8 current_mode;
>> +	struct nouveau_drm *drm = nouveau_drm(nv_encoder-
>>> base.base.dev);
>> +
>> +	/*
>> +	 * nvif functions, so also nvif_outp_bl_get, are not working
>> with this
>> +	 * connector (return -22), using only drm layer.
>> +	 */
>> +	if (nv_conn->type == DCB_CONNECTOR_eDP) {
>> +
>> +		ret = drm_dp_dpcd_read(&nv_conn->aux,
>> DP_EDP_DPCD_REV, edp_dpcd,
>> +				       EDP_DISPLAY_CTL_CAP_SIZE);
>> +		if (ret < 0)
>> +			return ret;
>> +		if (!drm_edp_backlight_supported(edp_dpcd))
>> +			return -ENODEV;
>> +
>> +		ret = drm_edp_backlight_init(&nv_conn->aux, &bl-
>>> edp_info, 0, edp_dpcd,
>> +					 &current_level,
>> &current_mode);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ret = drm_edp_backlight_enable(&nv_conn->aux, &bl-
>>> edp_info, current_level);
>> +		if (ret < 0) {
>> +			NV_ERROR(drm, "Failed to enable backlight on
>> %s: %d\n",
>> +				 nv_conn->base.name, ret);
>> +			return ret;
>> +		}
>> +
>> +		*ops = &nv50_edp_bl_ops;
>> +
>> +		props->max_brightness = bl->edp_info.max;
>> +		props->brightness = current_level;
>> +		bl->uses_dpcd = true;
>> +
>> +		return 0;
>> +	}
>> +
>> +	return -ENODEV;
>> +}
>> +
>>   int
>>   nouveau_backlight_init(struct drm_connector *connector)
>>   {
>> @@ -332,6 +382,10 @@ nouveau_backlight_init(struct drm_connector
>> *connector)
>>   		ret = nv50_backlight_init(bl,
>> nouveau_connector(connector),
>>   					  nv_encoder, &props, &ops);
>>   		break;
>> +	case NV_DEVICE_INFO_V0_ADA:
>> +		ret = nv19x_backlight_init(bl,
>> nouveau_connector(connector),
>> +					   nv_encoder, &props,
>> &ops);
>> +		break;
>>   	default:
>>   		ret = 0;
>>   		goto fail_alloc;
> Regards,
> angelo
