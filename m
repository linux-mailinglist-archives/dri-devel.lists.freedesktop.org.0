Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF309887CF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 17:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B61C10ECCE;
	Fri, 27 Sep 2024 15:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K6X/jfL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5717610ECCC;
 Fri, 27 Sep 2024 15:01:11 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5c5bca59416so2385754a12.1; 
 Fri, 27 Sep 2024 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727449270; x=1728054070; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eFJ6F1BxryQ8+onawS+5pO7WAZHzFPHliMYOCtlDU9M=;
 b=K6X/jfL0FB+R1IGCGIVTriiCnZTdZ2lqwbxA2wVp5J1V77mFDezdqigoT7l1csRNkk
 pTJXIK9CoodaHse5TrNNfSRKoj4gIBiLi+RiwYlM5eTLF7Q36oKr084eEmLAxCVCfylu
 z3l4uRxTcyzThM7qTDMmFzzLJvwod6ZaGKBpDxwXlDTg2z9lFYpTmXE7eJffDEpZngUi
 NwrG/y8vkqT8br/phc5Mxr5yRxsq6cgXgmgLjNuGCCxF5LsxnetbcdQ4fY3ZY3L5AIvi
 hTTE5be5DIaoDzlc6EtPfDTGab2IA2F+O5/W4WhA+4dEIycEjuRkrjBgkDRsSNjpCkKW
 hdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727449270; x=1728054070;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eFJ6F1BxryQ8+onawS+5pO7WAZHzFPHliMYOCtlDU9M=;
 b=EBLCx5dA5JJdiKCWes4wSK+8fBD9CB70gtbx/DodwXv5PCh5HJ22V1ARkW+6BcMT4G
 tBg9qscbOGMXVh5Rwxi70RwKDWr1mZGB91537tYIWVyeU3EzIrE+9NM6qS0uQPyGZQHb
 IjDe0HpCra6B5gVwsuunTDyYbZJKyiaCF/bnQQ74EAjUVx0t6UvIHXBUcpmR1O6q/eD7
 LL0QIOjj7TZ/pJ/ZVABc2FT0hYBnGIil/Ue3AA5VDvA2IV1bQcu3GMk1CJ1jDvqzoSkh
 6OtWdV9EP+U3qLap5pEOShSiKKNpl2VgITdZRaHl4T8BgUjzIQrS8zS5NGn6th7Egaxo
 IUhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+UGRCweCD+wBvmEmSVkxE0vae8tuT33G17yJ1fSLgFEJTrROUrqY1dnHq/MyrU0xVbPaxI7Xl9fyf@lists.freedesktop.org,
 AJvYcCXN6NvRG40eXJ4VBEuBQmSyXO+RfRCDENupNdK1rjqespjC7D4cxNU+TR25Xqqqv7IE3UTmrmP0rQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPWKsdwSSrhkK1f3GrVR2GG7EIzjaLF7TEgZe98h2z6lkqVdjq
 S8k8C0Ls9mmrROfICfdPpyTqoFRnuJI6CMzxjrHv5nDXLLa5yIw1
X-Google-Smtp-Source: AGHT+IHKBc1xhpTKxrBrf5NeabF0ioO0uKvJ7fvnEiaSivm5sB5H360qY7iS9UkiZwuz+APpUEm1ww==
X-Received: by 2002:a05:6402:390a:b0:5c7:1f16:7f77 with SMTP id
 4fb4d7f45d1cf-5c882602d68mr2391698a12.27.1727449268937; 
 Fri, 27 Sep 2024 08:01:08 -0700 (PDT)
Received: from [192.168.1.17] (host-87-19-160-215.retail.telecomitalia.it.
 [87.19.160.215]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c882493f55sm1215805a12.91.2024.09.27.08.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2024 08:01:08 -0700 (PDT)
Message-ID: <8805a597-813e-49e5-82da-69ad15249601@gmail.com>
Date: Fri, 27 Sep 2024 17:01:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
 <20240926-preemption-a750-t-v6-4-7b6e1ef3648f@gmail.com>
 <CACu1E7HEZztQ3bctuVdrwLCVY2oJ_01AyeKdwCuuB6gmsPurpg@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CACu1E7HEZztQ3bctuVdrwLCVY2oJ_01AyeKdwCuuB6gmsPurpg@mail.gmail.com>
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

On 9/27/24 1:57 PM, Connor Abbott wrote:
> In the future, the right thing to do is open a mesa MR with just the
> register changes and then copy the file from mesa once it's merged,
> because all of the XML files are supposed to flow from mesa to keep
> mesa and the kernel in sync. I've opened a mesa MR [1] based on this
> that will hopefully get quickly acked and merged.
> 
> Connor

Sure I'll keep that in mind, thanks!

> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31422
> 
> On Thu, Sep 26, 2024 at 10:17 PM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
>> Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
>> index 2dfe6913ab4f52449b76c2f75b2d101c08115d16..fd31d1d7a11eef7f38dcc2975dc1034f6b7a2e41 100644
>> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
>> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
>> @@ -1337,7 +1337,12 @@ to upconvert to 32b float internally?
>>                  <reg32 offset="0x0" name="REG" type="a6x_cp_protect"/>
>>          </array>
>>
>> -       <reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL"/>
>> +       <reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL">
>> +               <bitfield name="STOP" pos="0" type="boolean"/>
> 
> This bit isn't set to 1 when it's stopped, it's set to
> 
>> +               <bitfield name="LEVEL" low="6" high="7"/>
>> +               <bitfield name="USES_GMEM" pos="8" type="boolean"/>
>> +               <bitfield name="SKIP_SAVE_RESTORE" pos="9" type="boolean"/>
>> +       </reg32>
>>          <reg64 offset="0x08A1" name="CP_CONTEXT_SWITCH_SMMU_INFO"/>
>>          <reg64 offset="0x08A3" name="CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR"/>
>>          <reg64 offset="0x08A5" name="CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR"/>
>>
>> --
>> 2.46.1
>>


Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>
