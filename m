Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E565CFB3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 10:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101F210E093;
	Wed,  4 Jan 2023 09:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5524910E093;
 Wed,  4 Jan 2023 09:37:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id bs20so30241668wrb.3;
 Wed, 04 Jan 2023 01:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TnVvBp5CvE66t59orsQS+M89VsfZfBWG2ITuei4MwH4=;
 b=p022zXGl7ys+VouK511OJhJu3no9rVMMieW8eJHrFxf2Z3tYJyBf7LKext5MgWIkjT
 LUHcOGdYze9CNWtax3Q+27HGwn9DEWEdyOHCb8sggooOavU5CRsjJqnp/xyqLec0IUOw
 0iw/k0X9iD5zSR1Sv+TMSCwwby/aLF15xrVM5o2hK1fdtMFEliSvtRIc+EuuufhAISuI
 uAAXnwracH9HTxBWGb2ovPwfzUmEdCOHd9L+rSHD88TTQBd28+4lC3b/BfvKKxfQPRv3
 XzaWNtP0IT9h9FImutfBoqAvcC9pFQ0mQyhEVmEzSRSejt1zBalgpkzdh9jkPgWOEKS6
 scbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TnVvBp5CvE66t59orsQS+M89VsfZfBWG2ITuei4MwH4=;
 b=ny+3IWbsYe221pOGB96UiJ13b7NmGzLP5S3BnZdKIvpzHktyRrvMqorDoNiTFSD9fm
 cdLTO79+Lp+D0Bo2im0jzCUwrxKbTuE0PU3AiX9AQylnE5r0HRb/GwjzZVgq3DKYSYx4
 /FzSIrVj87GM3Dm8cw+yr52+7yj648QjImH+nJwZoxkMm7NR+gjHk8bPZxIO50Ev48Ro
 TupBvL4oZN5Cn9C4EMqL3884fmLlex/aAQ9sjIBaFbIN7tjByOQg79TG5PG60i0sr+Hk
 A5f90aD9RcrbVbn2icCM9F0Tj2iGxXpCLjYUiXV5upVyebSl/ckKODZprTYzNdL9XCUf
 pftQ==
X-Gm-Message-State: AFqh2kp7H5RwjbtFxh38+y8lc980zrYuCxUOSpvlsRQ6klQSPycGGwaV
 AIdBSWSjyYVTdeWBt6JvwQY=
X-Google-Smtp-Source: AMrXdXvU/enDDNHVuc8zxYqzqJ57ugDBT89W+Gset7WCKuRiRY6jIh5WsIW7wCb5Z9zmhCX6Ed1AAA==
X-Received: by 2002:a5d:6808:0:b0:272:3a86:29c1 with SMTP id
 w8-20020a5d6808000000b002723a8629c1mr26678451wru.16.1672825054733; 
 Wed, 04 Jan 2023 01:37:34 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfe90e000000b002365730eae8sm33500867wrm.55.2023.01.04.01.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 01:37:34 -0800 (PST)
Message-ID: <a8ed4887-e4f9-7e5e-3fe7-430d3814cc2b@gmail.com>
Date: Wed, 4 Jan 2023 10:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 05/27] drm/amd: Add a new helper for loading/validating
 microcode
Content-Language: en-US
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20230103221852.22813-1-mario.limonciello@amd.com>
 <20230103221852.22813-6-mario.limonciello@amd.com>
 <151bb1ab-8b2b-afaf-2976-5f60b756c4ca@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <151bb1ab-8b2b-afaf-2976-5f60b756c4ca@amd.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.01.23 um 05:53 schrieb Lazar, Lijo:
>
>
> On 1/4/2023 3:48 AM, Mario Limonciello wrote:
>> All microcode runs a basic validation after it's been loaded. Each
>> IP block as part of init will run both.
>>
>> Introduce a wrapper for request_firmware and amdgpu_ucode_validate.
>> This wrapper will also remap any error codes from request_firmware
>> to -ENODEV.  This is so that early_init will fail if firmware couldn't
>> be loaded instead of the IP block being disabled.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v3-v4:
>>   * New patch
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 24 +++++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |  1 +
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>> index eafcddce58d3..8c4a7b09e344 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>> @@ -1312,3 +1312,27 @@ void amdgpu_ucode_ip_version_decode(struct 
>> amdgpu_device *adev, int block_type,
>>         snprintf(ucode_prefix, len, "%s_%d_%d_%d", ip_name, maj, min, 
>> rev);
>>   }
>> +
>> +/*
>> + * amdgpu_ucode_load - Load and validate amdgpu microcode
>> + *
>> + * @adev: amdgpu device
>> + * @fw: pointer to load firmware to
>> + * @fw_name: firmware to load
>> + *
>> + * This is a helper that will use request_firmware and 
>> amdgpu_ucode_validate
>> + * to load and run basic validation on firmware. If the load fails, 
>> remap
>> + * the error code to -ENODEV, so that early_init functions will fail 
>> to load.
>> + */
>> +int amdgpu_ucode_load(struct amdgpu_device *adev, const struct 
>> firmware **fw, char *fw_name)
>
> 'load' also takes a different meaning of loading firmware to ASIC. 
> Maybe keep it as 'get' and keep another corresponding common 'put' for 
> release_firmware?

get/put are usually used for reference counting, how about sticking with 
request/release instead? That's used by the underlying functionality as 
well IIRC.

Christian.

>
> Thanks,
> Lijo
>
>> +{
>> +    int err = request_firmware(fw, fw_name, adev->dev);
>> +
>> +    if (err)
>> +        return -ENODEV;
>> +    err = amdgpu_ucode_validate(*fw);
>> +    if (err)
>> +        dev_dbg(adev->dev, "\"%s\" failed to validate\n", fw_name);
>> +
>> +    return err;
>> +}
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
>> index 552e06929229..b9139fb44506 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
>> @@ -544,6 +544,7 @@ void amdgpu_ucode_print_sdma_hdr(const struct 
>> common_firmware_header *hdr);
>>   void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header 
>> *hdr);
>>   void amdgpu_ucode_print_gpu_info_hdr(const struct 
>> common_firmware_header *hdr);
>>   int amdgpu_ucode_validate(const struct firmware *fw);
>> +int amdgpu_ucode_load(struct amdgpu_device *adev, const struct 
>> firmware **fw, char *fw_name);
>>   bool amdgpu_ucode_hdr_version(union amdgpu_firmware_header *hdr,
>>                   uint16_t hdr_major, uint16_t hdr_minor);

