Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BC74452BE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 13:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713D86E4B6;
	Thu,  4 Nov 2021 12:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DCE6E043
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 12:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636027899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4AdwkaPbMWXGax5KA2rt+Gqe0a1WXxhr6YwLEgt8I0=;
 b=C3VUCnNtf4NjXY1bex83lzkdcINlY9aPqJz4YhHOy2Mjz9Ll2lWe2r4aDhrpKBKWYy93oX
 aYT+cHAQLp3XunBb9rPaOFbmEBI/1TBR5ilhO1Dt/apfxjzednz688LDauiqPYc4dq3rhP
 OEh3vNeItl7RCw2jItqq+vpHJBPIixc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-GMjtin6lMwu7lwPwPoaP_g-1; Thu, 04 Nov 2021 08:11:38 -0400
X-MC-Unique: GMjtin6lMwu7lwPwPoaP_g-1
Received: by mail-wr1-f72.google.com with SMTP id
 z5-20020a5d6405000000b00182083d7d2aso956640wru.13
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 05:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D4AdwkaPbMWXGax5KA2rt+Gqe0a1WXxhr6YwLEgt8I0=;
 b=VFoGm/IrZtCnYm3BpKl7aM+FmAS6YvdM8cU+Qqyx0CrQjEAAG5NqrgnPxcjRoUzBSp
 +EaeeEk2//1Tg9J2B0pKuree8L4kSb3P3jmTHPqYA9+yG4lJqere4QD5ClW25iwI40gg
 WAtmLB8ahfWlcsetgKjQCBA6vjrIJZ9Jr0V5dYvsYLUe0DKx9xsFGuwUaCD9t+Qam182
 3ZLluzehzQbgdMlevpJVKxSAB3WjcDcPpGo7C8pz03uJtbhNJ9ceSaYpon8RzU4e2qo7
 LcuKBpksWIyiH7/YxH5JOqY6iLAGv0XWtVZIUqlJu2J5XysGOjWHISeZZkZ8vcfengLv
 3cnA==
X-Gm-Message-State: AOAM532QcRoWWGjl6d32WJy4SPJKhDPfvuUA0vF+/OJdO6H1gkpHdjRG
 0mDdiSb7ttetWZr+znysjUAhlDQMwruVagjId690H92zcMG09mPFE5p7YHrJkgNcZmHe82l1UR8
 Kibey1RNWzJmYjynORuHI8qqPitnC
X-Received: by 2002:adf:df0b:: with SMTP id y11mr39858300wrl.181.1636027897551; 
 Thu, 04 Nov 2021 05:11:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqjM2sqm4+v2bQK0eMMRayg/y3fRlX2oxxNi5kHRob7ai2dH72Yu+LW42MTv2MDIAJ+D0ErQ==
X-Received: by 2002:adf:df0b:: with SMTP id y11mr39858269wrl.181.1636027897338; 
 Thu, 04 Nov 2021 05:11:37 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id h13sm5041912wrx.82.2021.11.04.05.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 05:11:36 -0700 (PDT)
Message-ID: <394db9f5-79f1-495c-f0a8-fac3af5f8e25@redhat.com>
Date: Thu, 4 Nov 2021 13:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RESEND PATCH 4/5] drm: Add a drm_drv_enabled() helper function
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20211103123206.1041442-1-javierm@redhat.com>
 <87o871bbmb.fsf@intel.com> <54aedf5a-34b1-15f6-47f1-39815b3832ae@suse.de>
 <87bl30b2h3.fsf@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <87bl30b2h3.fsf@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>,
 Neal Gompa <ngompa13@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Jani,

On 11/4/21 12:10, Jani Nikula wrote:
> On Wed, 03 Nov 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 03.11.21 um 14:41 schrieb Jani Nikula:
>>> On Wed, 03 Nov 2021, Javier Martinez Canillas <javierm@redhat.com> wrote:
>>>> DRM drivers can use this to determine whether they can be enabled or not.
>>>>
>>>> For now it's just a wrapper around drm_modeset_disabled() but having the
>>>> indirection level will allow to add other conditions besides "nomodeset".
>>>>
>>>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>>>
>>> Can't see i915 trivially using this due to the drm_driver
>>> parameter. Please let's not merge helpers like this without actual
>>> users.
>>
>> Can you explain?
>>
>> This would be called on the top of the PCI probe function. The parameter 
>> would allow to decide on a per-driver base (e.g., to ignore generic 
>> drivers).
> 
> Where and how exactly? This is why we need to see the patch using the
> function. A patch is worth a thousand words. ;)
>

Thomas suggested to squash patches #4 and #5 so I'll do that when posting v2.
 
> See current vgacon_text_force() usage in i915/i915_module.c. It happens
> way before anything related to pci or drm driver. Why bother with the
> complicated setup and teardown of stuff if you can bail out earlier?
>

Yes, most drivers use vgacon_text_force() in their module init callback.

The ones that do in their probe function are drivers that don't have a
module init/exit but just use the module_platform_driver() macro.

I won't modify that and will keep the bail in the same place that the
drivers already do. I hope to have time and post a new revision today.

> 
> BR,
> Jani.
> 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

