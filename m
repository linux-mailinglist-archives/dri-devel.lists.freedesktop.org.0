Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A844E9E0A7C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 18:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C7310E110;
	Mon,  2 Dec 2024 17:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CS6BG1VU";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="iezFok7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Mon, 02 Dec 2024 17:56:28 UTC
Received: from a7-42.smtp-out.eu-west-1.amazonses.com
 (a7-42.smtp-out.eu-west-1.amazonses.com [54.240.7.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE9010E110
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 17:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1733161757;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=2xnQmXby1RnaLSG1YeOAcmdH5qaeFqLVGukq5+J0BgY=;
 b=CS6BG1VU4omB+jC2xDOleFQIs19PFaoClqX/k6DoiGoZHdF8Bk/FzvNtfJEWnlhV
 nyYyReC4+uC5qa8gRZbqJ79tZZoTo9HIrKkYefd1YAJ5tmNg1FuABMHNqBXdmfkg++j
 oNry+CzwIxQ4ZmschP0tuWh8pgSV04uxzShYwJ8NwdjAnzkGadEQLsVwARGAEx788fA
 6ID3EVgQToceaCtRR5zsWUFyObAHIcP5+UHcwlGH9GHDh9g5DuwJtTCJS9bBoBZMP1W
 1j+tjhEmXpq8xoaI7DYp2GLP0C2It5KIbUN5SV+Tmgu0K1GcBVZsTmZCYVo7GGti8G2
 Nyr7izQYTA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1733161757;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=2xnQmXby1RnaLSG1YeOAcmdH5qaeFqLVGukq5+J0BgY=;
 b=iezFok7ImPp6fFvZ0b79I4+mXRK5+fdue8gYS765eRPob7OpxHrse4h5CsjrX7RC
 0is/6pB+VRv7yZyqHVjG7n32DM4Pc6LUAMFO0pTAWOOG7falMKqg1ufqOmHiGcb+RDT
 CIiuPYlM05+rWBus7VGoHz8XuYP2hiRPFA/eQ59M=
Message-ID: <01020193887dac72-b1fb6a4d-17fd-4efe-bd62-d914c6d119b2-000000@eu-west-1.amazonses.com>
Date: Mon, 2 Dec 2024 17:49:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/connector: Allow clearing hdr infoframe
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, mripard@kernel.org, kernel@collabora.com
References: <20241129213801.617864-1-derek.foreman@collabora.com>
 <wsiaadwjc3txltrj4ygtshebwscfxcytmdafrhp6uhkwdl3dvf@zy52jv6g6enm>
Content-Language: en-US
From: Derek Foreman <derek.foreman@collabora.com>
In-Reply-To: <wsiaadwjc3txltrj4ygtshebwscfxcytmdafrhp6uhkwdl3dvf@zy52jv6g6enm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.12.02-54.240.7.42
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

On 2024-11-29 17:40, Dmitry Baryshkov wrote:
> On Fri, Nov 29, 2024 at 03:38:01PM -0600, Derek Foreman wrote:
>> When a display isn't presenting HDR content, the infoframe shouldn't be
>> present at all. Currently if we set the HDR_OUTPUT_METADATA blob, we'll
>> set a Dynamic Range and Mastering (DRM) infoframe. If we remove that
>> blob later, the DRM infoframe will linger in its previous state, when
>> we expect it to clear.
>>
>> Disable the infoframe when no output metadata is present to prevent
>> this from happening.
>>
>> Fixes: f378b77227bc4 ("drm/connector: hdmi: Add Infoframes generation")
>> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
>> ---
>>   drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 ++
>>   1 file changed, 2 insertions(+)
> The fix is fine, however please consider extending it to other infoframe
> types. Clear infoframe->set in the beginning of the corresponding
> function.

I thought that might be the case, but the other infoframes looked like 
they would only be cleared if there was an error, where the DRM 
infoframe was the only one that must be intentionally cleared.

I wasn't certain if it was better to leave a stale infoframe in the 
highly unlikely case that creating the new one caused an error, or to 
have the infoframe disappear entirely.

I'll make a new patch to replace this one, and include AVI, SPD, and 
VSIF infoframes this time.

Thanks,
Derek

>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> index feb7a3a75981..1cc4b49b1013 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> @@ -398,6 +398,8 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
>>   		&infoframe->data.drm;
>>   	int ret;
>>   
>> +	infoframe->set = false;
>> +
>>   	if (connector->max_bpc < 10)
>>   		return 0;
>>   
>> -- 
>> 2.45.2
>>
