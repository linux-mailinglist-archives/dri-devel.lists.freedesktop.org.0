Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C792A89A289
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 18:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C90410E86E;
	Fri,  5 Apr 2024 16:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="DvATwmVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7EBB410E782;
 Fri,  5 Apr 2024 16:30:15 +0000 (UTC)
Received: from [100.64.217.16] (unknown [20.29.225.195])
 by linux.microsoft.com (Postfix) with ESMTPSA id 6099820E98B9;
 Fri,  5 Apr 2024 09:30:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6099820E98B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1712334614;
 bh=w130JaeBPpS+L9M4QU8ZQXXwRcANcq5ZUO69X1bKRmU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DvATwmVZCnu2mWeOkHNjSOn3NP+uGroDac1iSpu2wd+v3d//PQw85B2Bdx0Po6Lvd
 ZjMGVuaZ73P4XTz+rG7byN35W0KUrpl5gZ3alXfZ8frHGqOGX4PxPO84VA9eudZIJk
 732o/mFjv1LuWV0m4a0o7Gs9Fy/VV5ERgAzWEo3E=
Message-ID: <e6b04b76-c695-47b4-9432-f2316e174585@linux.microsoft.com>
Date: Fri, 5 Apr 2024 09:30:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 13/14] drm/nouveau: Make I2C terminology more inclusive
To: Danilo Krummrich <dakr@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-14-eahariha@linux.microsoft.com>
 <4dc6fb16-3d85-4a7f-85f9-ed249da0df1a@redhat.com>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <4dc6fb16-3d85-4a7f-85f9-ed249da0df1a@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/5/2024 9:15 AM, Danilo Krummrich wrote:
> Hi Easwar,
> 
> On 3/29/24 18:00, Easwar Hariharan wrote:
>> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
>> with more appropriate terms. Inspired by and following on to Wolfram's
>> series to fix drivers/i2c/[1], fix the terminology for users of
>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>> in the specification.
>>
>> Compile tested, no functionality changes intended
>>
>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>> ---
>>   drivers/gpu/drm/nouveau/dispnv04/dfp.c             | 14 +++++++-------
>>   .../gpu/drm/nouveau/include/nvkm/subdev/bios/dcb.h |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_bios.c             |  4 ++--
>>   3 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
>> index d5b129dc623b..65b791006b19 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
>> @@ -149,7 +149,7 @@ void nv04_dfp_update_fp_control(struct drm_encoder *encoder, int mode)
>>       }
>>   }
>>   -static struct drm_encoder *get_tmds_slave(struct drm_encoder *encoder)
>> +static struct drm_encoder *get_tmds_client(struct drm_encoder *encoder)
>>   {
>>       struct drm_device *dev = encoder->dev;
>>       struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
>> @@ -172,7 +172,7 @@ static struct drm_encoder *get_tmds_slave(struct drm_encoder *encoder)
>>           struct dcb_output *slave_dcb = nouveau_encoder(slave)->dcb;
>>             if (slave_dcb->type == DCB_OUTPUT_TMDS && get_slave_funcs(slave) &&
>> -            slave_dcb->tmdsconf.slave_addr == dcb->tmdsconf.slave_addr)
>> +            slave_dcb->tmdsconf.client_addr == dcb->tmdsconf.client_addr)
>>               return slave;
> 
> While, personally, I think master/slave was well suiting for the device relationship
> on those busses, I think that if we change it up to conform with the change in
> specification, we should make sure to update drivers consistently.
> 
> We should make sure to also change the names of the sourrounding structures and variable
> names, otherwise we just make this code harder to read.
> 
> - Danilo
> 

Thanks for the review, and for the appetite to go further! So we are on the same page, you would prefer
renaming to controller/target like the feedback on other drm drivers (i915, gma500, radeon)?

Thanks,
Easwar

