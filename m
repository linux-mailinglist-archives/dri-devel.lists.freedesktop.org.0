Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057EFA1B342
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 11:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF9410E93F;
	Fri, 24 Jan 2025 10:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="b4HQvfS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A7310E008
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 10:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737713086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llo/fO5rXv8VRLKNzP6dFGk+HKId6735eBSRXMHOn3M=;
 b=b4HQvfS+MrXTwt4Uerqc6Bw5lvQK297nJLQ7+5rjKdZMseEb/0uwmTozLhvMcADSYzGdln
 MvpgyBiqd7o3AWeRGXzV5WNIkmVvpiOqThBLMIDQHNYEZosytpJTvWlSM0Vl6Ia2kCVlfW
 4Qo/nJlkgLxRd5v4Dm12Ub48bzY6X80=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-c4rPCC3WNDGvBqnCInBRfQ-1; Fri, 24 Jan 2025 05:04:44 -0500
X-MC-Unique: c4rPCC3WNDGvBqnCInBRfQ-1
X-Mimecast-MFC-AGG-ID: c4rPCC3WNDGvBqnCInBRfQ
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38629a685fdso696859f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 02:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737713083; x=1738317883;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=llo/fO5rXv8VRLKNzP6dFGk+HKId6735eBSRXMHOn3M=;
 b=tW39it3eYDYyh6yueHJIxMmgThU1nlsbEXDt9thmP4Fe7fjB2pO9reNjbGMF2TPjGa
 idYiD/alT/XBxvkgGGX32yp67PY3xHVGW3zPdg+1rBv4oDQc2FDfygWnAs3PAgC2ZTou
 E9jQZx7t7HVC2oGLDrgL1yrkK6j8tURn2tDae8D4aqOWd/W/QwFMQbAjOyjlWq3iUVNo
 yaCvsm5SjHUDo3I1eH9X8Jnn1wHQDpnFlUU9RaUya7o9OVtvnL0ywk61CkZYVso/zBGI
 ga5FjvT+Iw0fyj5rGHNK1JUdIo7SmQSicxKB12izHE9hfomgSF3iOS0MgZvWiaONB2wI
 3DVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLXN/2Qk/5t2bax6Q6nFRA2kWEZH/qXq3qovPgSO7Tqfn2HBSJV0ygSISUodnejEUANI6y+BsRMbE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaB8le+Ry2xokeaZgxe+E/Olkzgwnd0L5iWr/OXotORztDgg+a
 MtA5/OyHE0s/iB/PwjlXAMRRMm6Oc0g6Dh0TzxZFXjYVtvL4Jp1bmg/jpJz9q+sK9TD+QQ7M9vv
 C7T7806NKio61ajNGnaZl4lrMrmTHI9zohh7byOWag66xfNwjvDEvv3Wf7tRamv3B0+7a4hm20Q
 ==
X-Gm-Gg: ASbGnctUdJBnJNxDPnh07NnXdbv82OsD93hxqkTqr+PY1o08UhpqYCDgqsvyQCoATDr
 pyYUDvdzHWin7dOnhs1/x4scvE50J7Nj4r9p+9Fp1H43CQXY4yGrtwEajjr80qASoDnqhuj4+R2
 7WLlEP8LmzC39kWRs0l8VC0bc83k5VaIzD47/UDgBrE4MBA1S6n8adIgjwBYEPBsaKRMdKQBkSU
 rmrZTJydTcvaYVg4ezo2TffkWUABvzHj2rIxoNnLYAbzi4tUy3bCE10mpL+16cwlZF+HgCZwP9s
 994kqo6kTDSxCUX66FHDK0SSf5/6+rsPMg==
X-Received: by 2002:adf:f402:0:b0:385:f7a3:fea6 with SMTP id
 ffacd0b85a97d-38bf56628f0mr22166024f8f.13.1737713083133; 
 Fri, 24 Jan 2025 02:04:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvVJ3yXhz1UYJBB5xl+iqmlG5pF+3wRY4LGJ5AWvyNn2pvgN7rG7ROm9vlDrxHA1nJlapLHw==
X-Received: by 2002:adf:f402:0:b0:385:f7a3:fea6 with SMTP id
 ffacd0b85a97d-38bf56628f0mr22165983f8f.13.1737713082644; 
 Fri, 24 Jan 2025 02:04:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb057sm2218053f8f.62.2025.01.24.02.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 02:04:41 -0800 (PST)
Message-ID: <31c6ddbe-f412-400f-951f-c2ccdad6e889@redhat.com>
Date: Fri, 24 Jan 2025 11:04:40 +0100
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
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <1230848e-d83a-49f2-9d1a-de97b5edc1a4@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nxCKpPTHgVOl49SA9fM41LEqSCZ5y3CPUO144RZztw8_1737713083
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

On 24/01/2025 10:22, Thomas Zimmermann wrote:
> Hi Jocelyn
> 
> 
> Am 24.01.25 um 09:45 schrieb Jocelyn Falempe:
>> The physical_status of ast_dp is not reliable, as it reports as
>> connected even when no monitor is connected.
> 
> This status comes from VGACRDF, which is undocumented unfortunately. So 
> IDK the exact semantics. Do you know if the other case can also happen 
> where a connected monitor is not reported?

Previously, astdp_is_connected() also checked for ASTDP_LINK_SUCCESS
https://elixir.bootlin.com/linux/v6.10.14/source/drivers/gpu/drm/ast/ast_dp.c#L16

which used to work more reliably, se maybe I can add it back?

> 
>> This makes the default
>> BMC resolution to be 640x480 for remote access.
>> So consider that if there is no edid, no monitor is connected, and
>> add the BMC 1024x768 default resolution.
>> I've debugged this regression on ast_dp, but as dp501 is similar, I
>> fixed both in this patch.
>>
>> This regression was likely introduced by commit 2281475168d2
>> ("drm/ast: astdp: Perform link training during atomic_enable")
>> But I fixed it in the BMC get_modes handling.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Fixes: bbad0090b9f4 ("drm/ast: astdp: Transparently handle BMC support")
>> ---
>>   drivers/gpu/drm/ast/ast_dp.c    | 14 +++++++-------
>>   drivers/gpu/drm/ast/ast_dp501.c | 14 +++++++-------
>>   2 files changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
>> index 0e282b7b167c..6c8ea95a2230 100644
>> --- a/drivers/gpu/drm/ast/ast_dp.c
>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>> @@ -361,19 +361,19 @@ static const struct drm_encoder_helper_funcs 
>> ast_astdp_encoder_helper_funcs = {
>>   static int ast_astdp_connector_helper_get_modes(struct drm_connector 
>> *connector)
> 
> I don't think this is the right place to fix the problem. The field 
> physical_status should always contain the correct physical status. So 
> the fix should go into ast_dp_connector_helper_detect_ctx(). There's [1] 
> something like

If a DP monitor is connected, but the EDID is not readable, defaulting 
to 1024x768 is still a good choice.

The default to 640x480 is only to comply with the DP specification, but 
in practice some DP monitors doesn't support 640x480.
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=e7c254d75d16b75abf1958095fd34e2ecdc0d645

> 
>    if (ast_dp_status_is_connected(ast))
>      status = connected
> 
> and that's where it should read the EDID without updating the 
> connector's EDID property. Example code:
> 
>    if (ast_dp_status_is_connected(ast)) {
>      edid = drm_edid_read_custom(/* like in get_modes */)
>      if (drm_edid_valid(edid))
>        status = connected
>      drm_edid_free(edid)
>    }
> 
> The EDID test could also go into _is_connected() directly. A comment 
> about false positives from VGACRDF might make sense as well.
> 
> [1] https://elixir.bootlin.com/linux/v6.12.6/source/drivers/gpu/drm/ast/ 
> ast_dp.c#L397
> 
>>   {
>>       struct ast_connector *ast_connector = to_ast_connector(connector);
>> +    struct ast_device *ast = to_ast_device(connector->dev);
>> +    const struct drm_edid *drm_edid = NULL;
>>       int count;
>> -    if (ast_connector->physical_status == connector_status_connected) {
>> -        struct ast_device *ast = to_ast_device(connector->dev);
>> -        const struct drm_edid *drm_edid;
>> -
>> +    if (ast_connector->physical_status == connector_status_connected)
>>           drm_edid = drm_edid_read_custom(connector, 
>> ast_astdp_read_edid_block, ast);
>> -        drm_edid_connector_update(connector, drm_edid);
>> +
>> +    drm_edid_connector_update(connector, drm_edid);
>> +
>> +    if (drm_edid) {
>>           count = drm_edid_connector_add_modes(connector);
>>           drm_edid_free(drm_edid);
>>       } else {
>> -        drm_edid_connector_update(connector, NULL);
>> -
>>           /*
>>            * There's no EDID data without a connected monitor. Set BMC-
>>            * compatible modes in this case. The XGA default resolution
>> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ 
>> ast_dp501.c
>> index 9e19d8c17730..c92db65e3f20 100644
>> --- a/drivers/gpu/drm/ast/ast_dp501.c
>> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> 
> I'd rather leave this out. The detection works differently for DP501.

ast_dp501_is_connected() hasn't changed, so yes I can drop this part.

Best regards,

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
>> @@ -504,19 +504,19 @@ static const struct drm_encoder_helper_funcs 
>> ast_dp501_encoder_helper_funcs = {
>>   static int ast_dp501_connector_helper_get_modes(struct drm_connector 
>> *connector)
>>   {
>>       struct ast_connector *ast_connector = to_ast_connector(connector);
>> +    struct ast_device *ast = to_ast_device(connector->dev);
>> +    const struct drm_edid *drm_edid = NULL;
>>       int count;
>> -    if (ast_connector->physical_status == connector_status_connected) {
>> -        struct ast_device *ast = to_ast_device(connector->dev);
>> -        const struct drm_edid *drm_edid;
>> -
>> +    if (ast_connector->physical_status == connector_status_connected)
>>           drm_edid = drm_edid_read_custom(connector, 
>> ast_dp512_read_edid_block, ast);
>> -        drm_edid_connector_update(connector, drm_edid);
>> +
>> +    drm_edid_connector_update(connector, drm_edid);
>> +
>> +    if (drm_edid) {
>>           count = drm_edid_connector_add_modes(connector);
>>           drm_edid_free(drm_edid);
>>       } else {
>> -        drm_edid_connector_update(connector, NULL);
>> -
>>           /*
>>            * There's no EDID data without a connected monitor. Set BMC-
>>            * compatible modes in this case. The XGA default resolution
>>
>> base-commit: 798047e63ac970f105c49c22e6d44df901c486b2
> 

