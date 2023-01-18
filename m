Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAAB671405
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 07:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA9210E694;
	Wed, 18 Jan 2023 06:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7B710E1D8;
 Wed, 18 Jan 2023 06:27:33 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id mg12so8419286ejc.5;
 Tue, 17 Jan 2023 22:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DFPBaw2GhHR2WYd0zk94IWQjOp2RprR7MZd4JApk9PM=;
 b=TlITOaIBr0kaWJ5qkhlMU7eGMIIi+AL5cfqzTfh7MUPhei6md1u/ccZtR3FYo2krjh
 CbGfoIjHvoMCfMu3I9PXgY93NIHAI0TeeWqJ8DQ2sIOScfMRCIy8vagQQdWvyuZdy0U4
 kqM36IMSVpftnSvTEyi+rMN+YhdALUzy5/j4cGxa2syrvFSLjSTm33LtWNSFS5hXMNRH
 4snTYroRcZfxcZN+uH6ToZGen1C0+4geivtq9U+KfFFRltNKqyKq2v3hxikbdcIw/Fp6
 xU06qSB9T6Uo37X2SyGM78iUxxqOt10AGRIXI0bnHofWaCIahA7sb4ApDeep3Yff3Lkf
 KFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DFPBaw2GhHR2WYd0zk94IWQjOp2RprR7MZd4JApk9PM=;
 b=6UT8bl5ceVwqZcukqPRvsVns2bcdHAo0hWq2sZPTRRcwBME+lGOSSW89vig/Rw7C9o
 7DK78/FPfdij/TQwjVYeSYC04M1RjIuK1Ri1oi7kSosqbI6GHfWJqDmQKWjkceLIDTAY
 6zYDZAFaeZHSGH5bCb40sU0DCSsDdif/tBIMzYiOMvrlgRem34XFDvUHPuvtwRqXV6iH
 DKvOiyOO8O5C331r23G2Yu8pA+1WpUoHf//mGxNEyvJWRaDN0AZYHAStVMxCXgAZWsmq
 9FR+jx1SywNPC29I2tCkI1Mfiuizv4Ayc/4r0tInluyQn0rWE36gg+H90olrJU+QBVCw
 iB6Q==
X-Gm-Message-State: AFqh2kr6ZKJW5QkVizQB5SzT55Clnde8/IqXx4XC9bt9o4+rtDUldL5T
 HounVbdyqO5d7UfAvl+K1Jc=
X-Google-Smtp-Source: AMrXdXuatJOZsjoYuJ5ZkpntjNuPQ3+xgQgxsyjiEvrd6Gi+C1lACxLAP3Q54iLOXIhgC17jfIESGw==
X-Received: by 2002:a17:907:7e9c:b0:86e:2c11:9bca with SMTP id
 qb28-20020a1709077e9c00b0086e2c119bcamr7247015ejc.30.1674023252232; 
 Tue, 17 Jan 2023 22:27:32 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:d3a3:981b:3e23:8647?
 ([2a02:908:1256:79a0:d3a3:981b:3e23:8647])
 by smtp.gmail.com with ESMTPSA id
 kr12-20020a1709079a0c00b0084d44553af9sm12045740ejc.215.2023.01.17.22.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 22:27:31 -0800 (PST)
Message-ID: <bf60d3dc-1d6b-4f74-79f2-878cd61ba3bd@gmail.com>
Date: Wed, 18 Jan 2023 07:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] drm_print: Remove deprecated
 DRM_DEBUG_KMS_RATELIMITED()
Content-Language: en-US
To: "Das, Nirmoy" <nirmoy.das@intel.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20230117180417.21066-1-nirmoy.das@intel.com>
 <20230117180417.21066-2-nirmoy.das@intel.com>
 <CADnq5_NY9B4dtswNzowG_KrPuSSFdtpsonY_7wNhtzW0G7uJXQ@mail.gmail.com>
 <982599d1-2480-72ff-1515-425b2693e3b5@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <982599d1-2480-72ff-1515-425b2693e3b5@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 17.01.23 um 19:12 schrieb Das, Nirmoy:
> Hi Alex,
>
> On 1/17/2023 7:06 PM, Alex Deucher wrote:
>> On Tue, Jan 17, 2023 at 1:05 PM Nirmoy Das <nirmoy.das@intel.com> wrote:
>>> There are no current users of DRM_DEBUG_KMS_RATELIMITED()
>>> so remove it.
>>>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>> Series is:
>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>
>> Feel free to take the patches through whatever tree you want.
>
>
> Please help me with this, I don't have committer rights for any tree.

Going to push that into drm-misc-next later today.

Thanks,
Christian.

>
>
> Nirmoy
>
>
>>
>> Alex
>>
>>> ---
>>>   include/drm/drm_print.h | 3 ---
>>>   1 file changed, 3 deletions(-)
>>>
>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>>> index a44fb7ef257f..c3753da97c4e 100644
>>> --- a/include/drm/drm_print.h
>>> +++ b/include/drm/drm_print.h
>>> @@ -605,9 +605,6 @@ void __drm_err(const char *format, ...);
>>>   #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
>>>          __DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
>>>
>>> -/* NOTE: this is deprecated in favor of 
>>> drm_dbg_kms_ratelimited(NULL, ...). */
>>> -#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) 
>>> drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
>>> -
>>>   /*
>>>    * struct drm_device based WARNs
>>>    *
>>> -- 
>>> 2.39.0
>>>

