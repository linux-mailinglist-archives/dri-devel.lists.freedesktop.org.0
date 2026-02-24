Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKyPBmqenWnwQgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:49:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD98118736A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBCE10E573;
	Tue, 24 Feb 2026 12:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="c+9PGmeh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDAF10E571;
 Tue, 24 Feb 2026 12:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lgRj+PvRp1UaG2eBynbboe2inSxywCBp8JRjTLzMfuM=; b=c+9PGmeh41aCtTP6Shd8wC6Vbl
 wkotkBT0Uhk2cSYOaOhMmcALFUlEKAzVvOJk7kyJqAZ7N4szeUELvyFSxTLgHzZg69Vlg1L0cCWLH
 pCRl60b+oz7iNehi/PZ7jA9YCiH8gqJELHuEj1/RwH0dPE5C1FO1ywZGTH/qh4SwGWYWEbbBsYw4P
 iVXHboc6PEw6BGXXFXqNQItUw4CTRPG+lPVeBefc859+R84aEB7uNDH6nAlV9gHOr8Bz9ZV07eAZ/
 WdaPjIAxd3mARwHo7jA8W19xITYS8cBM1RkKHrQKrh+jPmT/5198K3rItkVFzV/ygzxxanKbE8WSZ
 sjp3ryHQ==;
Received: from [186.208.68.119] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vurqv-004l81-3W; Tue, 24 Feb 2026 13:49:25 +0100
Message-ID: <b6f267f4-812f-441b-939d-1ff24fd3406e@igalia.com>
Date: Tue, 24 Feb 2026 09:49:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/drm_edid: ignore continuous frequency support for
 VRR
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, mario.limonciello@amd.com, alexander.deucher@amd.com,
 alex.hung@amd.com, Ivan Sergeev <ivan8215145640@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Jani Nikula <jani.nikula@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Mario Limonciello <superm1@kernel.org>, dri-devel@lists.freedesktop.org
References: <20260223203528.213275-1-mwen@igalia.com>
 <aZ1YE6dcEfTMwly1@intel.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <aZ1YE6dcEfTMwly1@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,amd.com,mailbox.org,lists.freedesktop.org,intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.454];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: BD98118736A
X-Rspamd-Action: no action



On 24/02/2026 04:49, Ville Syrjälä wrote:
> On Mon, Feb 23, 2026 at 05:29:46PM -0300, Melissa Wen wrote:
>> Display can be VRR capable even if its EDID doesn't contain the
>> Continuous Frequency flag. On the other hand, continuous frequency
>> support is expected for smooth VRR and ensures better compatibility with
>> VRR tehcnologies. As the lack of this flag can result in unexpected
>> issues like tearing, get monitor range even without the guarantee of
>> continuous frequency but add a debug message for unexpected results.
>>
>> CC: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> CC: Jani Nikula <jani.nikula@intel.com>
>> CC: Harry Wentland <harry.wentland@amd.com>
>> CC: Mario Limonciello <superm1@kernel.org>
>> CC: Alex Hung <alex.hung@amd.com>
>> Reported-by: Ivan Sergeev <ivan8215145640@gmail.com>
>> Fixes: 0159f88a ("drm/amd/display: remove redundant freesync parser for DP")
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>
>> Hello,
>>
>> After replacing the AMD driver-specific parser for VRR with the drm_edid
>> implementation, monitors without the continuous frequency flag in their
>> EDID stopped obtaining the monitor range because the DRM common code
>> considers them incompatible with VRR if they don't advertise support to
>> continuous frequencies. This differs from the original driver-specific
>> parser of AMD, that only checked EDID version, EDID_DETAIL_MONITOR_RANGE
>> and DRM_EDID_RANGE_LIMITS_ONLY_FLAG to determine the VRR range, so
>> switching to DRM common code caused a regression (reported by Ivan).
>>
>> The commit ca2582c66b930 `drm/edid: Parse only the VRR range for
>> continuous frequency displays` [1] introduced the Continuous Frequency
>> flag condition. While it was created to avoid issues related to
>> non-continuous refresh rates, it looks very restrictive to drivers that
>> want to deal with VRR capable monitor even without the guarantee of
>> continuous frequencies. I propose relaxing this restriction and adding a
>> debug message if anyone experiences problems related to the lack of
>> continuous frequency support.
> AFAIK without the continuous frequency bit the monitor isn't guaranteed
> to support all the refresh rates between min/max. So is this monitor
> trying to tell us that you are allowed to change the vtotal dynamically
> between the various explicit timings declared in the EDID but not between
> any other other timings?
>
> Or is it just a buggy EDID that needs quirking?

Looks like a buggy EDID. From decoded EDID I understand it supports all
refresh rates between 48Hz/75Hz (very small range anyway), without the
continuous freq flag in Features:

```
   EDID Structure Version & Revision: 1.4
   Vendor & Product Identification:
     Manufacturer: SKG
     Model: 10003
     Made in: week 25 of 2023
   Basic Display Parameters & Features:
     Digital display
     Bits per primary color channel: 10
     DisplayPort interface
     Maximum image size: 60 cm x 33 cm
     Gamma: 2.20
     DPMS levels: Off
     Supported color formats: RGB 4:4:4, YCrCb 4:4:4, YCrCb 4:2:2
     First detailed timing includes the native pixel format and 
preferred refresh rate
   Color Characteristics:

[...]

Detailed Timing Descriptors:
[...]
    Display Range Limits: Monitor ranges (Bare Limits): 48-75 Hz V, 
223-223 kHz H, max dotclock 400 MHz
[...]

Vendor-Specific Data Block (AMD), OUI 00-00-1A:
Version: 2.1
Minimum Refresh Rate: 48 Hz
Maximum Refresh Rate: 75 Hz
[...]
```

The reporter shared the EDID here:
- 
https://lore.kernel.org/amd-gfx/CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com/

Melissa

>
>> Maybe I'm missing something, so I would like to hear your opinions.
>>
>> Obs.: In addition to the display kernel developers who have already
>> worked with this code, I am sending copies to some compositor developers
>> who may have an opinion on it.
>>
>> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ca2582c66b930
>>
>> Thanks in advance,
>>
>> Melissa
>>
>>
>>   drivers/gpu/drm/drm_edid.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index ff432ac6b569..8ebd1c17d78a 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -6517,7 +6517,9 @@ static void drm_get_monitor_range(struct drm_connector *connector,
>>   		return;
>>   
>>   	if (!(drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ))
>> -		return;
>> +		drm_dbg_kms(connector->dev,
>> +			    "[CONNECTOR:%d:%s] Display doesn't support continuous frequencies\n",
>> +			    connector->base.id, connector->name);
>>   
>>   	drm_for_each_detailed_block(drm_edid, get_monitor_range, &closure);
>>   
>> -- 
>> 2.51.0

