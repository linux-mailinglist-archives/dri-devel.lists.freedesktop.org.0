Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA16E7B2C50
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 08:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143A610E0DB;
	Fri, 29 Sep 2023 06:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7C610E0DB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 06:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LCi/ItBrB8zfDtQmLpPOOCv/1aH15m0ACf4f4ismWMA=; b=Y0p3BmRxnIL4oamQDY08WEL/Td
 LyHo0ilqm9//HZCXNzZALac3DTvPUNg980so7dSiBEeI+ORdMBWp6H2rQWUIH+4EmHUHxw1w0pIaq
 YRScQvwSVJWyvyFpDvgmDv/gV4IepHm24oX8+WH/FG1RJOCg3l3yGasd8/W8KPIq5N6kg3tJf7PKJ
 nj3zfFmaDC5sDkJ6E3lzZEfJZxJundIFYc4MFATO8vaKfSPCmK87Wlx9lVwebHiZTpz+PVtzBO3Gm
 DBr/ExFd0AYUvJSf+VlM0kS4TeiF3GX8xPuMCAf8wA4jN+16ahw3XdZntT8MkIMUiX6ZZtNab6vYt
 uYeCINlA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qm71Q-009XiP-EM
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 08:30:44 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1qm71O-007UV1-AI; Fri, 29 Sep 2023 08:30:44 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.96)
 (envelope-from <itoral@igalia.com>) id 1qm71O-004N01-0L;
 Fri, 29 Sep 2023 08:30:42 +0200
MIME-Version: 1.0
Date: Fri, 29 Sep 2023 06:30:42 +0000
From: itoral <itoral@igalia.com>
To: Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH 2/3] drm/v3d: update UAPI to match user-space for V3D 7.x
In-Reply-To: <d01bd636-1cd4-1adc-208c-f92f10ce4a34@igalia.com>
References: <20230928114532.167854-1-itoral@igalia.com>
 <20230928114532.167854-3-itoral@igalia.com>
 <d01bd636-1cd4-1adc-208c-f92f10ce4a34@igalia.com>
Message-ID: <19eb6f26c4f560a8ab3fcba7e74c1230@igalia.com>
X-Sender: itoral@igalia.com
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-28 15:05, Maira Canal wrote:
> Hi Iago,
> 
> On 9/28/23 08:45, Iago Toral Quiroga wrote:
>> V3D t.x takes a new parameter to configure TFU jobs that needs
> 
> I believe t.x should be 7.x.
> 
>> to be provided by user space.
> 
> As I mentioned before, please, add your s-o-b.
> 
>> ---
>>   include/uapi/drm/v3d_drm.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>> 
>> diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
>> index 3dfc0af8756a..1a7d7a689de3 100644
>> --- a/include/uapi/drm/v3d_drm.h
>> +++ b/include/uapi/drm/v3d_drm.h
>> @@ -319,6 +319,11 @@ struct drm_v3d_submit_tfu {
>>     	/* Pointer to an array of ioctl extensions*/
>>   	__u64 extensions;
>> +
>> +	struct {
>> +		__u32 ioc;
>> +		__u32 pad;
>> +	} v71;
> 
> Is there any possibility that the name of the struct could be more
> meaningful?

The v71 stands for the hardware version where this field was introduced,
so I am not sure how much more meaningful we can make it :)

The idea for this was to pack version-specific fields into structs named
vXX so that you can quickly tell in which version specific fields
started being relevant directly from the code without having to look for
documentation elsewhere. I don't have a better alternative for the name,
since the point is to make the version explicit, but I am open to
suggestions if you have any.

Of course, we can also get rid of the struct if you prefer that, but
then we should document explicitly that this field only applies to v71
hardware and we would lose the explicit versioning when accessing the
field from the code (unless we decide to add the v71 as a prefix or
suffix in the ioc field, but that is kind of the same thing).

Iago

> 
> Best Regards,
> - Maíra
> 
>>   };
>>     /* Submits a compute shader for dispatch.  This job will block on any
