Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BEBA9C915
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 14:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAEF10E051;
	Fri, 25 Apr 2025 12:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aIz2nker";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B645C10E051
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1m0QkahAYTEbtoc4TCDgf0iLRM1ea0JIVgYaARqiX/8=; b=aIz2nkerHbR5XnEUK5pwGIZ32c
 GUqVh+xQfr3RrJvlrLXpNJm8hPU9LLAjoKU2Jw5Ojl91rTrzdQ2zeluwiBvV0KuW3c2TE+z04caoG
 G8AhLHm2xzR2EQ1k9/xNPjZNU1TyxC+jQB1xPsS6SaK5BFNTPmYUBp5LG/6GBtMNXs5Cv7VsWFWyM
 heFlNrXlbf/MwkgjHzugurXRBTuSLcNDCQO8kr6sQNhkZ/b2ome0q3130z8Q3D1hJqomEc0WrFzYS
 qUByzjuO86RXCXGiyk+CLcxA1qclTc4//man9pk2tXHpxrWltk2EEQrBJz4HvcGtBcOpdTQ4liVoC
 7OF+JwVQ==;
Received: from [77.26.4.178] (helo=[192.168.50.63])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u8IMe-008KKy-0Z; Fri, 25 Apr 2025 14:41:08 +0200
Message-ID: <987e372b-6c47-4324-b05b-4ccd77a9a95e@igalia.com>
Date: Fri, 25 Apr 2025 14:40:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/v3d: client ranges from axi_ids are different
 with V3D 7.1
Content-Language: en-US
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250409155504.1093400-2-jmcasanova@igalia.com>
 <20250409155504.1093400-3-jmcasanova@igalia.com>
 <efbd7d18-1cd2-4eb9-b504-c4a75370843a@igalia.com>
From: Chema Casanova <jmcasanova@igalia.com>
Organization: Igalia
In-Reply-To: <efbd7d18-1cd2-4eb9-b504-c4a75370843a@igalia.com>
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

El 10/4/25 a las 14:40, Maíra Canal escribió:
> Hi Chema,
>
> On 09/04/25 12:55, Jose Maria Casanova Crespo wrote:
>> The client mask has been reduced from 8 bits on V3D 4.1 to 7 bits
>> on V3d 7.1, so the ranges for each client are not compatible.
>
> s/V3d/V3D
>
Fixed.
>>
>> A new CSD client can now report MMU errors on 7.1
>
> How about "On V3D 7.1, the CSD client can also report MMU errors.
> Therefore, add its AXI ID to the IDs list."?
>
> Note that a commit message should use the imperative mood:
>
> "Describe your changes in imperative mood, e.g. “make xyzzy do frotz”
> instead of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to
> do frotz”, as if you are giving orders to the codebase to change its
> behaviour." [1]
>
> I miss such imperative description in this commit message.
>
I tried for v2.
>
> Also, you could add a "Fixes:" tag pointing to the commit that
> introduced V3D 7.1. This will allow this commit to go to the stable
> trees.
>
> [1] https://docs.kernel.org/process/submitting-patches.html
I already included the fixes tag for v2. Initially, I had doubts because
as I thought that the fix was not critical, as at the end was only
affecting to debug message.
>
>>
>> Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_irq.c | 21 ++++++++++++++++++++-
>>   1 file changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c 
>> b/drivers/gpu/drm/v3d/v3d_irq.c
>> index 1810743ea7b8..0cc1c7e5b412 100644
>> --- a/drivers/gpu/drm/v3d/v3d_irq.c
>> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
>> @@ -199,12 +199,31 @@ v3d_hub_irq(int irq, void *arg)
>>               {0xA0, 0xA1, "TFU"},
>>               {0xC0, 0xE0, "MMU"},
>>               {0xE0, 0xE1, "GMP"},
>> +        }, v3d71_axi_ids[] = {
>> +            {0x00, 0x30, "L2T"},
>> +            {0x30, 0x38, "CLE"},
>> +            {0x38, 0x39, "PTB"},
>> +            {0x39, 0x3A, "PSE"},
>> +            {0x3A, 0x3B, "CSD"},
>> +            {0x40, 0x60, "TLB"},
>> +            {0x60, 0x70, "MMU"},
>> +            {0x7C, 0x7E, "TFU"},
>> +            {0x7F, 0x80, "GMP"},
>>           };
>>           const char *client = "?";
>>             V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL));
>>   -        if (v3d->ver >= V3D_GEN_41) {
>> +        if (v3d->ver >= V3D_GEN_71) {
>> +            axi_id = axi_id & 0x7F;
>> +            for (size_t i = 0; i < ARRAY_SIZE(v3d71_axi_ids); i++) {
>> +                if (axi_id >= v3d71_axi_ids[i].begin &&
>> +                    axi_id < v3d71_axi_ids[i].end) {
>> +                    client = v3d71_axi_ids[i].client;
>> +                    break;
>> +                }
>> +            }
>
> What do you think about assigning v3d71_axi_ids or v3d41_axi_ids to an 
> temporary variable and move this loop below? Something like,
>
> if (v3d->ver >= V3D_GEN_71) {
>     axi_id = axi_id & 0x7F;
>     v3d_axi_ids = v3d71_axi_ids;
> } else if ... {
>     ...
> }
>
> for (size_t i = 0; i < ARRAY_SIZE(v3d_axi_ids); i++) {
>     if (axi_id >= v3d_axi_ids[i].begin
>         && axi_id < v3d_axi_ids[i].end) {
>         client = v3d_axi_ids[i].client;
>         break;
>     }
> }
After checking with Maíra we agree that was simpler the original
approach, as we would need to include an extra of the number
of elements in the arrays as ARRAY_SIZE and the compiler would
need to thread the size of the arrays as dynamic.

Kind regards,
Chema Casanova
