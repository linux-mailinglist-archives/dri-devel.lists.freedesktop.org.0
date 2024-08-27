Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A029617C2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 21:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BA010E40C;
	Tue, 27 Aug 2024 19:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="RTZ+VO4E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta038.useast.a.cloudfilter.net
 (omta038.useast.a.cloudfilter.net [44.202.169.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9816010E40A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 19:09:50 +0000 (UTC)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
 by cmsmtp with ESMTPS
 id iwc4sG4zeg2lzj1Zdsp0mi; Tue, 27 Aug 2024 19:09:49 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id j1ZcswKQNzIkAj1Zds9PJe; Tue, 27 Aug 2024 19:09:49 +0000
X-Authority-Analysis: v=2.4 cv=fP0/34ae c=1 sm=1 tr=0 ts=66ce247d
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=frY+GlAHrI6frpeK1MvySw==:17
 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=Oxluwhmp6ld3uWlGNnkA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5JZFmEEhU0UCbr2plbMpHOf5fhdfzfk/fS6XDm2beLk=; b=RTZ+VO4E54YAFXBis0O/nkgeD4
 vBNHhkiSEg8EkMDsoZGceB3t80ydoOZOc8D+0mG6lihVYVhzjAfz5KKnxuWJCtrUGrs3OOEL2k5HQ
 KKVNuj+tQvQsOCtSfd5nc0EPqpdrZcg9y2PkyWjwicaMxFCYIoQLzKCBdLd6njnDi9+0t96l5uSR6
 V6RKSu0SqYDpxao7RefLsBT+ZUWavtN4LQ7dVRjIDdKjmpqXFCumab0Z6x0G+0YeWCBlf1gRULKOg
 8NjcKNjM0+DNGHRlNIG7sfwRz1cZjXp78JV3Z+ITDq0WNDffFK2sVQcTMHJEoIwgd5BQCoCnd6JOY
 KnbkUGYQ==;
Received: from [201.172.173.139] (port=47538 helo=[192.168.15.5])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1sj1Zc-002X62-0C;
 Tue, 27 Aug 2024 14:09:48 -0500
Message-ID: <2065d0f6-660e-4647-95b4-8d1a9a7eaefe@embeddedor.com>
Date: Tue, 27 Aug 2024 13:09:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau: Avoid -Wflex-array-member-not-at-end
 warning
To: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <ZsZLFS1CsHkKjw+C@elsanto> <202408221011.82876DA0C4@keescook>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202408221011.82876DA0C4@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.173.139
X-Source-L: No
X-Exim-ID: 1sj1Zc-002X62-0C
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.5]) [201.172.173.139]:47538
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLhC/vubxxxk7nNpe6bPHaDAYKRfNYKUZQP7S7vFhkiGfhLWpqnQtEr/UWQCmu/KJlC3ByTPFKGasTwfSL8RqzUSel4KUipagD1g7qmBmeLN7ZEjicNh
 1CvRoySZTxervO0/Yy71Rky8hEgXr8Dvfit0+z1vevD1gQK2O8y47iwVWaavGNs59/iYlO/Zvv/zbIcdL1jy7+PLnUtFtMzrCB8lY3NoSUpzm9uC/1TeHFOr
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



On 22/08/24 11:27, Kees Cook wrote:
> On Wed, Aug 21, 2024 at 02:16:21PM -0600, Gustavo A. R. Silva wrote:
>> Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
>> a flexible structure where the size of the flexible-array member
>> is known at compile-time, and refactor the rest of the code,
>> accordingly.
>>
>> So, with this, fix the following warning:
>>
>> drivers/gpu/drm/nouveau/dispnv50/disp.c:779:47: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>   drivers/gpu/drm/nouveau/dispnv50/disp.c | 20 +++++++++-----------
>>   1 file changed, 9 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> index eed579a6c858..ddddc69640be 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> @@ -774,11 +774,9 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
>>   	struct drm_hdmi_info *hdmi = &nv_connector->base.display_info.hdmi;
>>   	union hdmi_infoframe infoframe = { 0 };
>>   	const u8 rekey = 56; /* binary driver, and tegra, constant */
>> +	DEFINE_RAW_FLEX(struct nvif_outp_infoframe_v0, args, data, 17);
>> +	const u8 data_len = 17; /* same length as in DEFINE_RAW_FLEX above. */
> 
> To avoid repeating the open-coded "17", this could either be a define:
> 
> nv50_hdmi_enable(...)
> {
> ...
> #define data_len	17
> 	DEFINE_RAW_FLEX(struct nvif_outp_infoframe_v0, args, data, data_len);
> ...rest of function...
> #undef data_len
> }
> 
> or an ungainly but compile-time calculated value that exposes some
> DEFINE_FLEX internals:
> 
> 	const u8 data_len = (sizeof(args_u) - sizeof(*args)) / sizeof(*args->data);

Yeah, I actually thought of something more like just __struct_size(args) - sizeof(*args),
as the flex array member is `__u8 data[]`.

> 
> (Maybe a helper is needed for that?)
> 
> #define STACK_FLEX_COUNT(name, member)	\
> 	((sizeof(name##_u) = sizeof(*(name))) / sizeof(*(name)->member))

I don't like this `sizeof(name##_u)` part as it is detached from the DEFINE_RAW_FLEX()
internals. Probably use `__struct_size(args)` instead, as in the example above.

> 
>> @@ -815,29 +813,29 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
>>   		return;
>>   
>>   	/* AVI InfoFrame. */
>> -	args.infoframe.version = 0;
>> -	args.infoframe.head = nv_crtc->index;
>> +	args->version = 0;
>> +	args->head = nv_crtc->index;
> 
> The stack variable (was before and is again) already zero-initialized,
> so the "= 0" line shouldn't be needed.
> 
> But neither of these comments are show-stoppers, IMO.
> 
> Reviewed-by: Kees Cook <kees@kernel.org>
> 

Thanks!

--
Gustavo
