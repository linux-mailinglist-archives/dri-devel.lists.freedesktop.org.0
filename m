Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E5FAA0EBD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 16:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7BD10E4A7;
	Tue, 29 Apr 2025 14:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RV6Fo6Pn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1938 seconds by postgrey-1.36 at gabe;
 Tue, 29 Apr 2025 14:28:03 UTC
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CFE10E4DD;
 Tue, 29 Apr 2025 14:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UxJe9PzKrKIYs/Hyxyd4qmS6r+QCAJE3Jx5c9/ARI78=; b=RV6Fo6PnXBii0bCKrwTtzzaAMF
 Jn2XO0XbuyLaOJV/pLOUq/S9uFe94/kMVtYB+1qXPHXwi80siYCAAISWC4ybEeOYU9nevmMzN7chJ
 8Tu3FOZZq/k/CCIBmCH5plsBbpQQB0lSUnYDNyzDeEtEpwIp8veHoOMu8lSswp7eZQI5Tu5ipP+1o
 V7k0uaJRcdpcYt/F/c6b2QUFhaItBOp3a6gs8QoS8WJIxZ8pJ5TPRdSwbPkNvfQuyhaWXtGWfICZb
 aiHYefKqv51ywi3YtkQIa9iG+Qycnl5fHV0UWuSckgv7jIw7je7yvzlUlNKxQo1PoYJKbTUEEDsum
 6jed92jA==;
Received: from [189.6.35.67] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u9lQX-000LmM-U3; Tue, 29 Apr 2025 15:55:33 +0200
Message-ID: <93eb1aa2-31b9-4d99-baac-8e698241830a@igalia.com>
Date: Tue, 29 Apr 2025 10:55:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amd/display: Hardware cursor changes color
 when switched to software cursor"
To: Shengyu Qu <wiagn233@outlook.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Michel Daenzer <michel.daenzer@mailbox.org>, Alex Hung
 <alex.hung@amd.com>, Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 Nevenko Stupar <Nevenko.Stupar@amd.com>, Roman Li <roman.li@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250422150427.59679-1-mwen@igalia.com>
 <TYCPR01MB8437276B8FDCA38DFB06B42198812@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <TYCPR01MB8437276B8FDCA38DFB06B42198812@TYCPR01MB8437.jpnprd01.prod.outlook.com>
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



On 28/04/2025 06:21, Shengyu Qu wrote:
> Hi,
>
> Personally I prefer we always disable cursor HW degamma, and this is 
> what color pipeline patch series have done for cursor plane(actually 
> all colorops are disabled on cursor plane and its background plane). 
> Since cursor plane shares colorops with cursor's background plane.

Hi Shengyu,

This feature isn't related to under-discussion plane color mgmt, neither 
the current atomic CRTC color properties, where this cursor degamma is 
always disable. It's only needed for DRM legacy gamma because of the 
implict sRGB done by AMD display driver for this property.

Best Regards,

Melissa

>
> Also, degamma a sRGB image with sRGB curve is not a good choice, or we 
> have to fake screen TRC to sRGB curve while the screen actually is 
> calibrated to power 2.2 curve.
>
> Best regards,
> Shengyu
>
> 在 2025/4/22 22:58, Melissa Wen 写道:
>> This reverts commit 272e6aab14bbf98d7a06b2b1cd6308a02d4a10a1.
>>
>> Applying degamma curve to the cursor by default breaks Linux userspace
>> expectation.
>>
>> On Linux, AMD display manager enables cursor degamma ROM just for
>> implict sRGB on HW versions where degamma is split into two blocks:
>> degamma ROM for pre-defined TFs and `gamma correction` for user/custom
>> curves, and degamma ROM settings doesn't apply to cursor plane.
>>
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1513
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2803
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4144
>> Reported-by: Michel Dänzer <michel.daenzer@mailbox.org>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>
>> Hi,
>>
>> I suspect there is a conflict of interest between OSes here, because
>> this is not the first time this mechanism has been removed from the
>> DC shared-code and after reintroduced [1].
>>
>> I'd suggest that other OSes set the `dc_cursor_attributes
>> attribute_flags.bits.ENABLE_CURSOR_DEGAMMA` to true by default, rather
>> than removing the mechanism that is valid for the Linux driver. Similar
>> to what the Linux AMD DM does for the implicit sRGB [2][3], but in their
>> case, they just need to initialize with 1.
>>
>> Finally, thanks Michel for pointing this issue out to me and noticing
>> the similarity to previous solution.
>>
>> [1] https://gitlab.freedesktop.org/agd5f/linux/-/commit/d9fbd64e8e317
>> [2] https://gitlab.freedesktop.org/agd5f/linux/-/commit/857b835f
>> [3] https://gitlab.freedesktop.org/agd5f/linux/-/commit/66eba12a
>>
>> Best Regards,
>>
>> Melissa
>>
>>   drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git 
>> a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c 
>> b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c
>> index 1236e0f9a256..712aff7e17f7 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c
>> @@ -120,10 +120,11 @@ void dpp401_set_cursor_attributes(
>>       enum dc_cursor_color_format color_format = 
>> cursor_attributes->color_format;
>>       int cur_rom_en = 0;
>>   -    // DCN4 should always do Cursor degamma for Cursor Color modes
>>       if (color_format == CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA ||
>>           color_format == CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA) {
>> -        cur_rom_en = 1;
>> +        if 
>> (cursor_attributes->attribute_flags.bits.ENABLE_CURSOR_DEGAMMA) {
>> +            cur_rom_en = 1;
>> +        }
>>       }
>>         REG_UPDATE_3(CURSOR0_CONTROL,
>

