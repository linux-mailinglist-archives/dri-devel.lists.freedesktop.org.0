Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 595A1390564
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B577E6EA5C;
	Tue, 25 May 2021 15:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28436EA5C;
 Tue, 25 May 2021 15:27:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r12so32697092wrp.1;
 Tue, 25 May 2021 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vkFvv3CzrHWV88Bg6LMmfW28f+X/tT4dXGrYj80i8K0=;
 b=Ma7kN/pl4nRYQBlat0fUJFqhzxY8Il5jMgW6M67rG4H96AzSwDMB7vsixt58a4MtHM
 Jtb2WwZ5a+0QvD3PEbqGmghXE6MfPW0vq0qFYycpQjINIVaQ21EGUoO99JMKjM4C9/rX
 dh7UCr6fS8VhE6uzN1OJi6m5a+/bW28OmUrJy9dUagiwxeziIU4CBvWJEJoAr5apnAIp
 NW7Zaf5BzTIOWpAPKyzXV3F6New9/quuEKi7KeUh/iFaU4OJ/WKzUwIi2iCABpeOHl4d
 srdu/KuSBNWFtOX/tF81JsXRNkxba0VV7OlM4pa1iiy9mikmxu/GmZaOqtJ3Rw+D697g
 IYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vkFvv3CzrHWV88Bg6LMmfW28f+X/tT4dXGrYj80i8K0=;
 b=rxzoKuSmbrrQVW1mhNmDP6rPZsDWvPwSXcb3nX/fDg5aQAtOz3BTKiRtAvP+vJD+NH
 FDDwsb1aWI5asL7BEnvNld8cwK7bxrjuoLYpGBBeoMsa6TP5j0j5zHkOdsjBO/oKacix
 KBVMWXqpd9g2UMJnujlRmZtvx4wFXSCFHSAeAKYHCed1VgwyrLWWCaWBVpf2fhwxsw5g
 CfIpATshLQxjfP5SxKxuIG8R3ALYuN1GbReQStx9zPr+5Fcdi7tE2qratqiI99DDJp4I
 rj4cU31B9c+eVD10uCZS28U+evz9t+z29eIiLWkhHTcoKch98NqbdHPX/IVFWVHy3BI1
 +CCQ==
X-Gm-Message-State: AOAM531Bbb5Ijl47hurswR+J3IxoB9NKYhL7HJjfEtsKLMWB/fh3oVRh
 DyULSILzeTsDR12wnuik+tU=
X-Google-Smtp-Source: ABdhPJxoQwt+Q1anHnE5jDYcuMOOCY9PaaA++i5KJHu8rDqsY8JBovHEjkl3h0rOqGut8VQWukXLbw==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr27182261wrh.270.1621956447461; 
 Tue, 25 May 2021 08:27:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1?
 ([2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1])
 by smtp.gmail.com with ESMTPSA id d3sm16421430wrs.41.2021.05.25.08.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 08:27:27 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: remove unreachable code
To: Alex Deucher <alexdeucher@gmail.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
References: <1621853213-55876-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <CADnq5_N3WkoYHcn8b1-qZ23+t=E9xxV5fV_1Lwqck6x2dUPqmA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <950d5d2a-c01f-35d4-0933-04cae2c4984d@gmail.com>
Date: Tue, 25 May 2021 17:27:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_N3WkoYHcn8b1-qZ23+t=E9xxV5fV_1Lwqck6x2dUPqmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.05.21 um 20:48 schrieb Alex Deucher:
> Applied.  Thanks!

Ok, that's unfortunate.

IIRC we added the code because of a different compiler warning.

Christian.

>
> Alex
>
> On Mon, May 24, 2021 at 6:47 AM Jiapeng Chong
> <jiapeng.chong@linux.alibaba.com> wrote:
>> In the function amdgpu_uvd_cs_msg(), every branch in the switch
>> statement will have a return, so the code below the switch statement
>> will not be executed.
>>
>> Eliminate the follow smatch warning:
>>
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:845 amdgpu_uvd_cs_msg() warn:
>> ignoring unreachable code.
>>
>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> index 82f0542..375b346 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>> @@ -842,8 +842,6 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
>>                  DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
>>                  return -EINVAL;
>>          }
>> -       BUG();
>> -       return -EINVAL;
>>   }
>>
>>   /**
>> --
>> 1.8.3.1
>>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

