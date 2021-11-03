Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06DE444873
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 19:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C5073FC4;
	Wed,  3 Nov 2021 18:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49A673FC1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 18:41:49 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id br39so3275263qkb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 11:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dpvDlm9XG8BS9PEwVCaoyGjqhg0IBvpzlPNBIoaOPaM=;
 b=eXZG8MISuWzt96PJRto8A4LUkXC8mhgmpVb8UjFEGTPyqdrvgpNngZrfZRlBzS+VTt
 X5J/Wer1qNgu4c/E7ahAefMJtIxyBeXozNSxnT5avIMU3r9bP0KiSNIIVFzcXVXxA/2o
 gbPK7LVoMv2ah+HqlzxY+i60WJnPr1ydecu9dj4HY1a2ZDYjJ54oE1VWMXgYnO8ZGSUQ
 GbcwlqgzDh2fgdKA19VDWPCECKVmnCWGWMcZA9g1Qp1DvNjWMMmRxrcniMFSH2MEz0+t
 X/aWLgNuU+sJup/55lKgcMTQwjrfGxXqBD6oHx1C0O6zgL08Fncvqf8mQt7N8Ni6pp7H
 gTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dpvDlm9XG8BS9PEwVCaoyGjqhg0IBvpzlPNBIoaOPaM=;
 b=XdSQUAQQmjCd2aTgP/SaR8WPedJU7PXBOOhtD4zuP1rzt+oNAukPc3yYrwn7kD+o+p
 zXln8TGt3DqyU1YVmeiRgwC40pBaWJrEaK3HH2INEgrPEVyaEVgITzOGU4nZOMwbNCgA
 RJ3MmIStcqM4rVs+BpWuK208+2MGDe6s559opzt/wKycb4yHXARQ4qsiG5/iAvzlaT3b
 jiKl30bmbr46/cvx7osZ9TnmR1xKy5qHzAoJgH7coS5WBrpWlR/d2dFFYIwqZu3pE2vw
 LZPZk3/G0AkB25b4ZoVU1yAWCS1W/Qa5Kk5/rlso/spKyiSSfWpUB8jJUfQy/QMUryEd
 lTag==
X-Gm-Message-State: AOAM5333KkVUYEfje7L8SIqhZ7T1O6FeFA1eNXbSDYjvxuDrBA2bwUHY
 gSIfj8iB3Zi7FqYrwtER2hoKmXcwhM8=
X-Google-Smtp-Source: ABdhPJzytvcj1XuVyKElMuJtptr+9yhjS9y6XH9OC5uTwhhluW5G0pVoLt3NR6s7F+E0DlDkTWyqHw==
X-Received: by 2002:a05:620a:40c4:: with SMTP id
 g4mr30121124qko.14.1635964908773; 
 Wed, 03 Nov 2021 11:41:48 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f5:66c6:188e:4e49:90d2:b722?
 ([2804:431:c7f5:66c6:188e:4e49:90d2:b722])
 by smtp.gmail.com with ESMTPSA id bs33sm1946798qkb.130.2021.11.03.11.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 11:41:48 -0700 (PDT)
Subject: Re: [PATCH v2 5/8] drm: drm_atomic_helper: Add a new helper to deal
 with the writeback connector validation
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com
References: <20211026113409.7242-1-igormtorrente@gmail.com>
 <20211026113409.7242-6-igormtorrente@gmail.com>
 <8adbff15-3ba6-317f-e50e-cc7a8eaf25d1@collabora.com>
 <85ac57d9-b02d-3698-e1b1-67ccdf012f09@gmail.com>
 <6d4c3ce1-705c-8f00-8ec6-2992baa8cb26@collabora.com>
 <2e52c729-d448-fae6-5bc1-90146b0747b9@suse.de>
From: Igor Torrente <igormtorrente@gmail.com>
Message-ID: <3efa551d-5d2e-608a-ef8e-3427c5285e70@gmail.com>
Date: Wed, 3 Nov 2021 15:41:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2e52c729-d448-fae6-5bc1-90146b0747b9@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: airlied@linux.ie, hamohammed.sa@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 11/3/21 12:37 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.11.21 um 16:11 schrieb Leandro Ribeiro:
>> Hi,
>>
>> On 11/3/21 12:03, Igor Torrente wrote:
>>> Hi Leandro,
>>>
>>> On 10/28/21 6:38 PM, Leandro Ribeiro wrote:
>>>> Hi,
>>>>
>>>> On 10/26/21 08:34, Igor Torrente wrote:
>>>>> Add a helper function to validate the connector configuration receive in
>>>>> the encoder atomic_check by the drivers.
>>>>>
>>>>> So the drivers don't need do these common validations themselves.
>>>>>
>>>>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>>>>> ---
>>>>> V2: Move the format verification to a new helper at the
>>>>> drm_atomic_helper.c
>>>>>        (Thomas Zimmermann).
>>>>> ---
>>>>>     drivers/gpu/drm/drm_atomic_helper.c   | 47 +++++++++++++++++++++++++++
>>>>>     drivers/gpu/drm/vkms/vkms_writeback.c |  9 +++--
>>>>>     include/drm/drm_atomic_helper.h       |  3 ++
>>>>>     3 files changed, 54 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c
>>>>> b/drivers/gpu/drm/drm_atomic_helper.c
>>>>> index 2c0c6ec92820..c2653b9824b5 100644
>>>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>>>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>>>>> @@ -766,6 +766,53 @@ drm_atomic_helper_check_modeset(struct
>>>>> drm_device *dev,
>>>>>     }
>>>>>     EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>>>>>     +/**
>>>>> + * drm_atomic_helper_check_wb_connector_state() - Check writeback
>>>>> encoder state
>>>>> + * @encoder: encoder state to check
>>>>> + * @conn_state: connector state to check
>>>>> + *
>>>>> + * Checks if the wriback connector state is valid, and returns a
> 
> 'writeback'
> 
> 'an error'
> 
>>>>> erros if it
> 
> 'error'
> 
>>>>> + * isn't.
>>>>> + *
>>>>> + * RETURNS:
>>>>> + * Zero for success or -errno
>>>>> + */
>>>>> +int
>>>>> +drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
>>>>> +                     struct drm_connector_state *conn_state)
>>>>> +{
>>>>> +    struct drm_writeback_job *wb_job = conn_state->writeback_job;
>>>>> +    struct drm_property_blob *pixel_format_blob;
>>>>> +    bool format_supported = false;
>>>>> +    struct drm_framebuffer *fb;
>>>>> +    int i, n_formats;
> 
> Just 'nformats'.
> 
> Please make both variables 'size_t'.

I Will correct all these minor issues.

> 
> 
>>>>> +    u32 *formats;
>>>>> +
>>>>> +    if (!wb_job || !wb_job->fb)
>>>>> +        return 0;
>>>>
>>>> I think that this should be removed and that this functions should
>>>> assume that (wb_job && wb_job->fb) == true.
>>>
>>> Ok.
> 
> In regular atomic check for planes, there can be planes with no attached
> framebuffer. Helpers handle this situation. [1] I don't know if this is
> possible in writeback code, but for consistency, it would make sense to
> keep this test here. Not sure though.

@Leandro, do you know if it is possible to have a wb_job without a fb
attached?

> 
>>>
>>>>
>>>> Actually, it's weird to have conn_state as argument and only use it to
>>>> get the wb_job. Instead, this function could receive wb_job directly.
>>>
>>> In the Thomas review of v1, he said that maybe other things could be
>>> tested in this helper. I'm not sure what these additional checks could
>>> be, so I tried to design the function signature expecting more things
>>> to be added after his review.
>>>
>>> As you can see, the helper is receiving the `drm_encoder` and doing
>>> nothing with it.
>>>
>>> If we, eventually, don't find anything else that this helper can do, I
>>> will revert to something very similar (if not equal) to your proposal.
>>> I just want to wait for Thomas's review first.
>>>
>>
>> Sure, that makes sense.
> 
> We had many helper functions for atomic modesetting that took various
> arguments for whatever they required. Extending such a function with new
> functionality/arguments required required touching many drivers and made
> the parameter list hard to read. At some point, Maxime went through most
> of the code and unified it all to pass full state > So please keep the connector state. I think it's how we do things ATM.to the helpers.
> 
> So please keep the connector state. I think it's how we do things ATM.

OK, I will keep then.

> 
>>
>> Thanks,
>> Leandro Ribeiro
>>
>>>>
>>>> Of course, its name/description would have to change.
>>>>
>>>>> +
>>>>> +    pixel_format_blob = wb_job->connector->pixel_formats_blob_ptr;
>>>>> +    n_formats = pixel_format_blob->length / sizeof(u32);
>>>>> +    formats = pixel_format_blob->data;
>>>>> +    fb = wb_job->fb;
>>>>> +
>>>>> +    for (i = 0; i < n_formats; i++) {
>>>>> +        if (fb->format->format == formats[i]) {
>>>>> +            format_supported = true;
>>>>> +            break;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    if (!format_supported) {
>>>>> +        DRM_DEBUG_KMS("Invalid pixel format %p4cc\n",
>>>>> +                  &fb->format->format);
> 
> Please use drm_dgb_kms() instead. There's a 100-character-per-line
> limit. The comment probably fits onto a single line.(?)


I will improve that. This code came from the vkms, which follows the 80
chars limit. If I'm not mistaken.

> 
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>
>>>> If you do this, you can get rid of the format_supported flag:
>>>>
>>>>       for(...) {
>>>>           if (fb->format->format == formats[i])
>>>>               return 0;
>>>>       }
>>>>
>>>>
>>>>       DRM_DEBUG_KMS(...);
>>>>       return -EINVAL;
>>>>
>>>
>>> Indeed. Thanks!
> 
> Yes, that looks nicer.
> 
>>>
>>>> Thanks,
>>>> Leandro Ribeiro
>>>>
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
>>>>> +
>>>>>     /**
>>>>>      * drm_atomic_helper_check_plane_state() - Check plane state for
>>>>> validity
>>>>>      * @plane_state: plane state to check
>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c
>>>>> b/drivers/gpu/drm/vkms/vkms_writeback.c
>>>>> index 32734cdbf6c2..42f3396c523a 100644
>>>>> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
>>>>> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
>>>>> @@ -30,6 +30,7 @@ static int vkms_wb_encoder_atomic_check(struct
>>>>> drm_encoder *encoder,
>>>>>     {
>>>>>         struct drm_framebuffer *fb;
>>>>>         const struct drm_display_mode *mode = &crtc_state->mode;
>>>>> +    int ret;
>>>>>           if (!conn_state->writeback_job ||
>>>>> !conn_state->writeback_job->fb)
>>>>>             return 0;
>>>>> @@ -41,11 +42,9 @@ static int vkms_wb_encoder_atomic_check(struct
>>>>> drm_encoder *encoder,
>>>>>             return -EINVAL;
>>>>>         }
>>>>>     -    if (fb->format->format != vkms_wb_formats[0]) {
>>>>> -        DRM_DEBUG_KMS("Invalid pixel format %p4cc\n",
>>>>> -                  &fb->format->format);
>>>>> -        return -EINVAL;
>>>>> -    }
>>>>> +    ret = drm_atomic_helper_check_wb_encoder_state(encoder,
>>>>> conn_state);
>>>>> +    if (ret < 0)
>>>>> +        return ret;
> 
> We usually use just 'if (ret)' for such test. No need for a less-than.

I will change that.

> 
> Best regards
> Thomas
> 
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic_helper.c#L809
> 
>>>>>           return 0;
>>>>>     }
>>>>> diff --git a/include/drm/drm_atomic_helper.h
>>>>> b/include/drm/drm_atomic_helper.h
>>>>> index 4045e2507e11..3fbf695da60f 100644
>>>>> --- a/include/drm/drm_atomic_helper.h
>>>>> +++ b/include/drm/drm_atomic_helper.h
>>>>> @@ -40,6 +40,9 @@ struct drm_private_state;
>>>>>       int drm_atomic_helper_check_modeset(struct drm_device *dev,
>>>>>                     struct drm_atomic_state *state);
>>>>> +int
>>>>> +drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
>>>>> +                     struct drm_connector_state *conn_state);
>>>>>     int drm_atomic_helper_check_plane_state(struct drm_plane_state
>>>>> *plane_state,
>>>>>                         const struct drm_crtc_state *crtc_state,
>>>>>                         int min_scale,
>>>>>
>>>
>>> Thanks,
>>> ---
>>> Igor M. A. Torrente
> 

Thanks,
---
Igor M. A. Torrente
