Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81534A1B5BF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 13:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F048910E0D1;
	Fri, 24 Jan 2025 12:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FM+DpaIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EEF10E0D1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737721464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQWmIWCaFq18gJrNcFaeOJ+F0FCBUpu2wDcAD64YXAg=;
 b=FM+DpaImETbaEr+uFKzfvMts/cVPjvb5fP0LM8Q5Qqqu2m3Pu8zPGox6WaIWozBRA8Htlg
 bcbh3skUqxgn9v+WPdNX4p5/MDd3OvM/Jw7FURiM7DTbZjl+FjJti+SXijMeSSxYhpZLhp
 Pbfp2Wd1MI3upPQyOJWwklvycrBMAHs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-6mg303qkPZmnaymVGG7WRg-1; Fri, 24 Jan 2025 07:24:21 -0500
X-MC-Unique: 6mg303qkPZmnaymVGG7WRg-1
X-Mimecast-MFC-AGG-ID: 6mg303qkPZmnaymVGG7WRg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38c24ac3706so1672138f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 04:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737721460; x=1738326260;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GQWmIWCaFq18gJrNcFaeOJ+F0FCBUpu2wDcAD64YXAg=;
 b=ER46r3N36aJXeYBlwWGUiNEgRfzpjPVMPnvuvMHmFzdsNd2ahABpUxNL2MUL0cKp0C
 wHEKaMajlYvy7lNOJfgYtqcmzzAItRZpKEy8CwwHWqc4iLuNToIeUWgfz1PzuEqKUIe4
 7qj8w0E08EaBzMgqcFqELTe//qd2oPgWaYytT4PdnPaHKqKNrr6RLEr8MxP69/p6gwpR
 JOblue4ORyMtoNrr2WALxn5aYKCV7I6zVPC98eUif3wGsbANaqi4mQr7A231La2sd2Bt
 yTppTzsZr2pYcsMB5OEg1dTzgqryVLuY8oR8fuUG9P/lTch4opA7BHebwN1eCk8naWqU
 ATGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq5l+yCkRpL8AHYck2FD2/kbHVLu1JySL1+lO3wPZLnupR/xliu13Ta/nDclNZigk6hj4CWF/ESBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTzGPue7nQfj0BkuVMbDn5WoW6BLdVTLlg4NDM0RT+bguTHF36
 lpbwRyv3xVIr05vGH317SOxPY+FXAnj6nBT9vSdIPaavLJpDJHOf72S+sIr2//CZPcxGEB2KmXl
 DUx+Nsp9d0P0LkZ6XNFzGBIU9VGEkxF1CV3+b+YbD9QBjPyLPXN0GYwFqb8+H0c7fWg==
X-Gm-Gg: ASbGncumtY9rZ0Ht1vSLWguFCCnNBZI0L0hkTqzADx98yLmEP98zNFSYT6JgTZC5px5
 iwiQlietey07/wq7rX95OPE4cVzKeW4oQgKgsBdzLmvyAU2wAKRYPBG/zKFBB25wCpz5bJGIfEK
 p55SCKp86ELBON5drFr2czSirQ6Q8PH1fIrlDCUYcZ49UO12sEEJhLtSrqvQtehqbOp6XXjIFjk
 5DE5mlCsD1R/2mSVze0WJZsY9H1IkOx2LCISUtBepg6z6RWHKAPo8GoKEmBkQcpeWSfmdp67iJ1
 fBebi1bsBghCHtL/ifF3E0a4g/09P6iP3A==
X-Received: by 2002:a5d:47a3:0:b0:38a:a11e:7af6 with SMTP id
 ffacd0b85a97d-38bf5677cf5mr29518719f8f.6.1737721459764; 
 Fri, 24 Jan 2025 04:24:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/5HNM8TRWD7IQYRCLR2g3moZ9PABCcaXiPJ9VE6GME5l21Kh6MX/Zb44zb9PLB3G1hYJOBA==
X-Received: by 2002:a5d:47a3:0:b0:38a:a11e:7af6 with SMTP id
 ffacd0b85a97d-38bf5677cf5mr29518705f8f.6.1737721459341; 
 Fri, 24 Jan 2025 04:24:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176538sm2497178f8f.8.2025.01.24.04.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 04:24:18 -0800 (PST)
Message-ID: <dd7717fc-090c-4294-b59d-e37a1b75cd7b@redhat.com>
Date: Fri, 24 Jan 2025 13:24:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Fix default resolution on BMC when DP is not
 connected
To: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie
 <airlied@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20250124084546.2094575-1-jfalempe@redhat.com>
 <1230848e-d83a-49f2-9d1a-de97b5edc1a4@suse.de>
 <31c6ddbe-f412-400f-951f-c2ccdad6e889@redhat.com>
 <795573c8-1bb9-44f9-851a-62a67cbb3fa6@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <795573c8-1bb9-44f9-851a-62a67cbb3fa6@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oV43bOm75zIa-KZ54BEVdhy_67f2Md88YQuFdohouiY_1737721460
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 24/01/2025 13:16, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 24.01.25 um 11:04 schrieb Jocelyn Falempe:
>> On 24/01/2025 10:22, Thomas Zimmermann wrote:
>>> Hi Jocelyn
>>>
>>>
>>> Am 24.01.25 um 09:45 schrieb Jocelyn Falempe:
>>>> The physical_status of ast_dp is not reliable, as it reports as
>>>> connected even when no monitor is connected.
>>>
>>> This status comes from VGACRDF, which is undocumented unfortunately. 
>>> So IDK the exact semantics. Do you know if the other case can also 
>>> happen where a connected monitor is not reported?
>>
>> Previously, astdp_is_connected() also checked for ASTDP_LINK_SUCCESS
>> https://elixir.bootlin.com/linux/v6.10.14/source/drivers/gpu/drm/ast/ 
>> ast_dp.c#L16
>>
>> which used to work more reliably, se maybe I can add it back?
> 
> That's a bit of a complicated issue. Protocol-wise Link Training runs 
> only after HPD, EDID and DPCD. A nice overview is at
> 
> https://www.ti.com/content/dam/videos/external-videos/en- 
> us/8/3816841626001/6275649988001.mp4/subassets/understanding-dp-link- 
> training-presentation-quiz.pdf

Thanks, I don't know much about the internal of DP protocol, but I 
though reading a register is faster than the whole EDID.
> 
> Link training is only to be done at atomic_enable or _check time. I 
> specifically asked about this back then.
> 
> But having said that, ast doesn't really do Link Training; it just reads 
> a bit from the VBIOS, which does it automatically. So it likely doesn't 
> matter for ast. So yeah, maybe add it back if that works. Plus a comment 
> that HPD alone is unreliable. I think this shoudl go into stable as well.

ok, thanks a lot, I will send a v2 with this.

Best regards,

-- 

Jocelyn

> 
> Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during 
> atomic_enable")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.12+
> 
>>
>>>
>>>> This makes the default
>>>> BMC resolution to be 640x480 for remote access.
>>>> So consider that if there is no edid, no monitor is connected, and
>>>> add the BMC 1024x768 default resolution.
>>>> I've debugged this regression on ast_dp, but as dp501 is similar, I
>>>> fixed both in this patch.
>>>>
>>>> This regression was likely introduced by commit 2281475168d2
>>>> ("drm/ast: astdp: Perform link training during atomic_enable")
>>>> But I fixed it in the BMC get_modes handling.
>>>>
>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>> Fixes: bbad0090b9f4 ("drm/ast: astdp: Transparently handle BMC 
>>>> support")
>>>> ---
>>>>   drivers/gpu/drm/ast/ast_dp.c    | 14 +++++++-------
>>>>   drivers/gpu/drm/ast/ast_dp501.c | 14 +++++++-------
>>>>   2 files changed, 14 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ 
>>>> ast_dp.c
>>>> index 0e282b7b167c..6c8ea95a2230 100644
>>>> --- a/drivers/gpu/drm/ast/ast_dp.c
>>>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>>>> @@ -361,19 +361,19 @@ static const struct drm_encoder_helper_funcs 
>>>> ast_astdp_encoder_helper_funcs = {
>>>>   static int ast_astdp_connector_helper_get_modes(struct 
>>>> drm_connector *connector)
>>>
>>> I don't think this is the right place to fix the problem. The field 
>>> physical_status should always contain the correct physical status. So 
>>> the fix should go into ast_dp_connector_helper_detect_ctx(). There's 
>>> [1] something like
>>
>> If a DP monitor is connected, but the EDID is not readable, defaulting 
>> to 1024x768 is still a good choice.
> 
> If the EDID is not readable, we should assume that no monitor is 
> connected. For this case, ast already sets 1024x768 to optimize for the 
> BMC.
> 
>>
>> The default to 640x480 is only to comply with the DP specification, 
>> but in practice some DP monitors doesn't support 640x480.
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/ 
>> commit/?id=e7c254d75d16b75abf1958095fd34e2ecdc0d645
> 
> If the defaults don't work for a certain system, users can force other 
> resolutions via the kernel's command line. This is definitely not 
> something that DRM drivers should address.
> 
> Best regards
> Thomas
> 
>>
>>>
>>>    if (ast_dp_status_is_connected(ast))
>>>      status = connected
>>>
>>> and that's where it should read the EDID without updating the 
>>> connector's EDID property. Example code:
>>>
>>>    if (ast_dp_status_is_connected(ast)) {
>>>      edid = drm_edid_read_custom(/* like in get_modes */)
>>>      if (drm_edid_valid(edid))
>>>        status = connected
>>>      drm_edid_free(edid)
>>>    }
>>>
>>> The EDID test could also go into _is_connected() directly. A comment 
>>> about false positives from VGACRDF might make sense as well.
>>>
>>> [1] https://elixir.bootlin.com/linux/v6.12.6/source/drivers/gpu/drm/ 
>>> ast/ ast_dp.c#L397
>>>
>>>>   {
>>>>       struct ast_connector *ast_connector = 
>>>> to_ast_connector(connector);
>>>> +    struct ast_device *ast = to_ast_device(connector->dev);
>>>> +    const struct drm_edid *drm_edid = NULL;
>>>>       int count;
>>>> -    if (ast_connector->physical_status == 
>>>> connector_status_connected) {
>>>> -        struct ast_device *ast = to_ast_device(connector->dev);
>>>> -        const struct drm_edid *drm_edid;
>>>> -
>>>> +    if (ast_connector->physical_status == connector_status_connected)
>>>>           drm_edid = drm_edid_read_custom(connector, 
>>>> ast_astdp_read_edid_block, ast);
>>>> -        drm_edid_connector_update(connector, drm_edid);
>>>> +
>>>> +    drm_edid_connector_update(connector, drm_edid);
>>>> +
>>>> +    if (drm_edid) {
>>>>           count = drm_edid_connector_add_modes(connector);
>>>>           drm_edid_free(drm_edid);
>>>>       } else {
>>>> -        drm_edid_connector_update(connector, NULL);
>>>> -
>>>>           /*
>>>>            * There's no EDID data without a connected monitor. Set BMC-
>>>>            * compatible modes in this case. The XGA default resolution
>>>> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ 
>>>> ast_dp501.c
>>>> index 9e19d8c17730..c92db65e3f20 100644
>>>> --- a/drivers/gpu/drm/ast/ast_dp501.c
>>>> +++ b/drivers/gpu/drm/ast/ast_dp501.c
>>>
>>> I'd rather leave this out. The detection works differently for DP501.
>>
>> ast_dp501_is_connected() hasn't changed, so yes I can drop this part.
>>
>> Best regards,
>>
> 

