Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EFF7BCF04
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 17:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E6610E19B;
	Sun,  8 Oct 2023 15:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF59010E19A;
 Sun,  8 Oct 2023 15:04:49 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-690d2441b95so2727816b3a.1; 
 Sun, 08 Oct 2023 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696777489; x=1697382289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OODJSi/tm/FeIBQkuc3CaKDuP+abCdAu1wDZTk5E+qw=;
 b=VJNkCw3FRIg8BNpae3977irgyA8j1yWVAVwjHHyC60kACzkO2fhvxOKGcn3Ijxp+6F
 8z4VE0b9yRDCKbVBAAhRi7K/m5PawGHkxFAv3gotHHr5ARsKbDHDcc8I0aqBJT8CTVLG
 3MTHzlOT3I1oPeRpO+EWt/OzWyS0XFG6qSFQdBrZM1+dHlPkO45FS1GFSYhZrxYUoqUm
 6wWmaQJAhOkyKb5IefkKhygICuS6KUKMPAGuSwbjGyRsNIcHOKuALthAf/svgrSkwhAk
 7m90Aab3LWxCwWODHg9onFcAHJqMVRADpM+n2xlVUHY0bdjpkMtIz77j4KfHG9iKQW9J
 BFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696777489; x=1697382289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OODJSi/tm/FeIBQkuc3CaKDuP+abCdAu1wDZTk5E+qw=;
 b=ZUSlwza6aSeQtxNTaB4HefFnetrHYkZJtk2y7mwOs9UvKAXutNsDV228QVmrkBzy2E
 1IUkUlkvwrOE7ejDco3xSMCeWBjJkhN64Zgd9zjBrA3MNU2lMVOJmrw2m5ci3j7z2LVD
 XPgc5K6g2DpVBVr+/HgAWgHzP9FBByoGzzckiKakmoDUad2vFHBtj6KmTbi2OE0ybNOS
 d8cPullPHpFsiPr68YemreR8A2d4JeCPv6Eas8S/Lhg0P2UxjAsphiRGAnb+D44OhLtR
 wCe4CthaLQFNu0oh8MQii9NiOZFfNtSTOtu+Y52w8aXWO59nTdRQTlRtAHOCs9jQ4ZDo
 gZEw==
X-Gm-Message-State: AOJu0YyjaX3jhkiCXthx8DqIp0yuC9xp9hz4DeYnWLXI5VeDxshvbE7p
 HBtg+mJTTtWnkjaTdBBVAp4=
X-Google-Smtp-Source: AGHT+IE3CKNjYCAYtwrxHuUCXAV5njlEKEioE9M3TVpjD3g61WbLxxKm+dC2wlUOFCS4rn6AFkIj6Q==
X-Received: by 2002:a05:6a00:99c:b0:690:fd48:1aa4 with SMTP id
 u28-20020a056a00099c00b00690fd481aa4mr14991631pfg.0.1696777489181; 
 Sun, 08 Oct 2023 08:04:49 -0700 (PDT)
Received: from [192.168.1.13] ([27.5.160.191])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a6552cb000000b00578afd8e012sm5745698pgp.92.2023.10.08.08.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Oct 2023 08:04:48 -0700 (PDT)
Message-ID: <1d0ab3e1-915a-4dcc-bc7b-86dd7cae2ea1@gmail.com>
Date: Sun, 8 Oct 2023 20:34:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: fix kernel-doc warning
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
References: <20231008070618.20640-1-bragathemanick0908@gmail.com>
 <ZSK4eNUPYIqPF3fM@debian.me>
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
In-Reply-To: <ZSK4eNUPYIqPF3fM@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/10/23 19:37, Randy Dunlap wrote:
> Hi,
>
> On 10/8/23 00:06, Bragatheswaran Manickavel wrote:
>> Identified below document warning in latest linux-next.
>> ./include/uapi/drm/nouveau_drm.h:49: warning: Cannot understand
>> * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX: on line 49 - I thought it was a doc line
>>
>> Also, on running checkpatch.pl to nouveau_drm.h identified
>> few more warnings/errors and fixing them in this patch
>>
>> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
>> ---
>>   include/uapi/drm/nouveau_drm.h | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
>> index eaf9f248619f..a523ca5aa865 100644
>> --- a/include/uapi/drm/nouveau_drm.h
>> +++ b/include/uapi/drm/nouveau_drm.h
>> @@ -46,7 +46,7 @@ extern "C" {
>>   #define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
>>   
>>   /**
>> - * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
>> + * NOUVEAU_GETPARAM_EXEC_PUSH_MAX:
> Yes, this does quieten the kernel-doc warning, but the produced html output
> is not correct.
>
> I had sent a patch for this but it was incomplete (missing full commit message).
> I have just sent a v2:
>    https://lore.kernel.org/lkml/20231008140231.17921-1-rdunlap@infradead.org/
Okay, Thanks Randy

On 08/10/23 19:41, Bagas Sanjaya wrote:
> On Sun, Oct 08, 2023 at 12:36:18PM +0530, Bragatheswaran Manickavel wrote:
>> @@ -458,15 +458,15 @@ struct drm_nouveau_svm_bind {
>>   
>>   #define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
>>   #define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
>> -#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
>> +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
>>   
>>   #define DRM_IOCTL_NOUVEAU_SVM_INIT           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_INIT, struct drm_nouveau_svm_init)
>>   #define DRM_IOCTL_NOUVEAU_SVM_BIND           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_BIND, struct drm_nouveau_svm_bind)
>>   
>>   #define DRM_IOCTL_NOUVEAU_GEM_NEW            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_NEW, struct drm_nouveau_gem_new)
>>   #define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF        DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF, struct drm_nouveau_gem_pushbuf)
>> -#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
>> -#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
>> +#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
>> +#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
>>   #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
>>   
>>   #define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
> Can you please split checkpatch fix above into separate patch
Hi Bagas,
Sure, will do that and send it as new patch.


Thanks,
Bragathe


