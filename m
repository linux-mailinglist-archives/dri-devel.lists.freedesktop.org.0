Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1167EADFDD7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 08:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7741710E9B1;
	Thu, 19 Jun 2025 06:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N+sXej6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282B310E9B1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 06:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750315351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HrAK3Pb88d2mMW8Ubsq+AvQbXCBrspP+wLLZy4buj1s=;
 b=N+sXej6Ztb53kCkF0NpcdDQ6wzADYf0zfkeAqQ3Fnxn/Erf83SACoQFXYpoSmn0iBnJ2OC
 8DXIhSLhyP4SS2cjGvBxfTEKiuEvdB9/Lw4FoLJzOLNhcnrxz+ga25Tk7bFo9zcWrDGX4s
 WApN9ivtusuWCtcUwAjokNhbX7hNqWY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-H_DWkM3AM6KQZBaOjB3PiQ-1; Thu, 19 Jun 2025 02:42:28 -0400
X-MC-Unique: H_DWkM3AM6KQZBaOjB3PiQ-1
X-Mimecast-MFC-AGG-ID: H_DWkM3AM6KQZBaOjB3PiQ_1750315347
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a579058758so181383f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 23:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750315347; x=1750920147;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HrAK3Pb88d2mMW8Ubsq+AvQbXCBrspP+wLLZy4buj1s=;
 b=Kb5yTK+MJfFT7ehPM4irBSfQ6SZSS+yuVwsUm2XdyV9UBSopEVHoR/pxAOZ3Ukj6bm
 HOJKcluAkwKdkkvnHgHuM0EXdz+jrpudlt2TK8JupDVLgPh/wF4UKiwnf8fInX+WJYXK
 dVsZeIy8vPYosI4gbheMS64//09gLX4WNkXowWiaUeiGlc21C4BpTdN/xRACZ0ey6KpA
 9YWQApYPGI8vctP/BWaEgo1hVwBKE245QZThY3T4Uhl/qTSXUZl5LxFFesxTxa5yKmYw
 QqwBXGoKPJJIGa+UeqKtpSHJEVow47rqJRVql7T5sQlUzmIm3U+FtXWJtav2QfgFFARa
 Om6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLiBMQj/k4c/mgWsEg1VrAgUP9fXM8nXzUqumayHIESs3+scsLnt6YijC2mcyx9j7dhoWR+Bhzpb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5x26Dr8gAPHPlr2LhCixOiANwk2zFIIEMSJQOTKQhHjMq5OhH
 EzRwPzSTRovUxBJv3EuR3hcoKG5Yyn/iI5uRnY9JNi3NZ0pJBD2t2kQiUp0U7M6GAy3ENOwphew
 De72Xy0DIkGA56529wi3HItxhqzS23fRJBLR5uORIF17ta3+QdJAFt0AFRjQULh8dalbCJw==
X-Gm-Gg: ASbGncukHEVIaz/TiILu8cxWCykGeXdlw7vSqGw6s5ZKxyMbGBloNOMX9GEEfVlhGa8
 dJsM22OduCHC+WpfQEkcv7DmSQtnHg6OoVSevIZG+5yBtwLYEo3s9UBzElwcwU/U/cxixSvn45L
 X8ff5XZFAZzzMv28b511BECtzrphMiwofPAC32uX+5y6/cmVEmTnrWHR7eicHRcAqET9g8jK8BB
 TE53Pfd/57mHXI3jXfz5hggtMplsu0K9yPsv/1G1WHeb3NhU63ciUCnko/Agn7FmDzKt/YJsf7o
 AGsuMNNjcPmRstgdQffNFJCQh047
X-Received: by 2002:a5d:584d:0:b0:3a3:64fb:304d with SMTP id
 ffacd0b85a97d-3a5723990f6mr15208322f8f.12.1750315346741; 
 Wed, 18 Jun 2025 23:42:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpLtHsZYwk8UooadQvsmdpZxfBCgj7PE/RcSNtM8uxppV7BUokDO7d5f9znti0cXjt6rGs2Q==
X-Received: by 2002:a5d:584d:0:b0:3a3:64fb:304d with SMTP id
 ffacd0b85a97d-3a5723990f6mr15208307f8f.12.1750315346354; 
 Wed, 18 Jun 2025 23:42:26 -0700 (PDT)
Received: from [192.168.190.158] ([37.167.112.85])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a7e980sm18260812f8f.41.2025.06.18.23.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 23:42:25 -0700 (PDT)
Message-ID: <d8055c38-a802-4f9d-bc36-56f6c55099d7@redhat.com>
Date: Thu, 19 Jun 2025 08:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-next] drm/bochs: Add support for drm_panic
To: Ryosuke Yasuoka <ryasuoka@redhat.com>
Cc: kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250613132023.106946-1-ryasuoka@redhat.com>
 <30f0ea0c-d8fb-461e-86ab-6e7677beac3c@redhat.com>
 <CAHpthZqfzOXfxzv7OTaLK0x_qro1sHKOHqPeFxwNA4_5FYQrRw@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAHpthZqfzOXfxzv7OTaLK0x_qro1sHKOHqPeFxwNA4_5FYQrRw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H3GZ1XfssjKjzwDhE272BBo4kt4Rpkg7VWNgqjVPXHY_1750315347
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 19/06/2025 08:37, Ryosuke Yasuoka wrote:
> On Thu, Jun 19, 2025 at 3:12 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> On 13/06/2025 15:20, Ryosuke Yasuoka wrote:
>>> Add drm_panic moudle for bochs drm so that panic screen can be displayed
>>> on panic.
>>
>> Thanks for the patch, it's simple and looks good to me.
>>
>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>>
>> If no objections, I will push it next Monday.
>>
>> Best regards,
>>
>> --
>>
>> Jocelyn
> 
> Thank you Jocelyn for reviewing my patch.
> Now I found a typo in the commit message; moudle -> module.

No need to send a v2 for that, I will fix it before pushing the patch.

Thanks,

-- 

Jocelyn

> 
> Let me fix it in v2.
> 
> Ryosuke
> 
>>>
>>> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
>>> ---
>>>    drivers/gpu/drm/tiny/bochs.c | 19 +++++++++++++++++++
>>>    1 file changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
>>> index 8706763af8fb..ed42ad5c4927 100644
>>> --- a/drivers/gpu/drm/tiny/bochs.c
>>> +++ b/drivers/gpu/drm/tiny/bochs.c
>>> @@ -19,6 +19,7 @@
>>>    #include <drm/drm_gem_shmem_helper.h>
>>>    #include <drm/drm_managed.h>
>>>    #include <drm/drm_module.h>
>>> +#include <drm/drm_panic.h>
>>>    #include <drm/drm_plane_helper.h>
>>>    #include <drm/drm_probe_helper.h>
>>>
>>> @@ -469,10 +470,28 @@ static void bochs_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>>        bochs_hw_setformat(bochs, fb->format);
>>>    }
>>>
>>> +static int bochs_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
>>> +                                                       struct drm_scanout_buffer *sb)
>>> +{
>>> +     struct bochs_device *bochs = to_bochs_device(plane->dev);
>>> +     struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(bochs->fb_map);
>>> +
>>> +     if (plane->state && plane->state->fb) {
>>> +             sb->format = plane->state->fb->format;
>>> +             sb->width = plane->state->fb->width;
>>> +             sb->height = plane->state->fb->height;
>>> +             sb->pitch[0] = plane->state->fb->pitches[0];
>>> +             sb->map[0] = map;
>>> +             return 0;
>>> +     }
>>> +     return -ENODEV;
>>> +}
>>> +
>>>    static const struct drm_plane_helper_funcs bochs_primary_plane_helper_funcs = {
>>>        DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>>>        .atomic_check = bochs_primary_plane_helper_atomic_check,
>>>        .atomic_update = bochs_primary_plane_helper_atomic_update,
>>> +     .get_scanout_buffer = bochs_primary_plane_helper_get_scanout_buffer,
>>>    };
>>>
>>>    static const struct drm_plane_funcs bochs_primary_plane_funcs = {
>>>
>>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>>
> 

