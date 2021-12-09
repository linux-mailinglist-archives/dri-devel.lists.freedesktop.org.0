Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7FB46EEF6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF8410E1D4;
	Thu,  9 Dec 2021 16:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5770689FF6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 12:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639052883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCUALssbY0oxqy20XeNiM0IZqaDHE6HLbBTKKFbR5aM=;
 b=ZTusAF6R62hh9jyVs8XDPVrks6DlnKWLJXg/PpEqNksIf+ZQyPEGuXy5LMAg/otyKLuca+
 84IhVUQ9/2AgWMPJHoSGUw8hnrRWGGNiD1/Tftr3dFVXaHxdBPcb4/ghlJFJY4+3cClqnd
 4Inlnt4xi/j2KeOMF5nGjyPpYcWAeIc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-f8qglkK2Npar6DhvbGmLUA-1; Thu, 09 Dec 2021 07:28:02 -0500
X-MC-Unique: f8qglkK2Npar6DhvbGmLUA-1
Received: by mail-wm1-f69.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso4814625wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 04:28:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kCUALssbY0oxqy20XeNiM0IZqaDHE6HLbBTKKFbR5aM=;
 b=UsCKkWZjeqi3QQDDYad5KPZqw1YPe5UUfEnWjs1u7q+2ZH58vCdQq6qw6nn4lHH7VV
 kI4nFgfZycgHIxt9C3Rk5G8HKUZEZ++0jBdJLT1g4jl0MzpTH16x2OYRgmeIpZpPE9qM
 LyH151uXTB0KefokjQLsTypKxzbvNdd1MkaE2qtSd4+08GDbC8Itl75GDAe4p4UJc/aZ
 XKU+yZoofJ0F84ajaqyjIevuHaqjg0l2cP6wRIK0Hos9OmpXLeXHwHo0ILhcOw1Qn6gt
 v9+L5lZeCEJqz1ZTs/MmB9XZNItBGQIqgVvw1r4dmLAj9ybrMeB6G6tYrPIpSYzg7TAR
 SMDw==
X-Gm-Message-State: AOAM530fmBc/t0LRvKGWPLoBkoneUPxQ82m8a9Buz4BQKqU3gdVXZPXY
 CQ2RqYpks49BTrVCuEshOqF0E4csZTP+N14WLeTE74xVSC62IVxCpxIRk0JZjbcR5+EQxyyBbpu
 doWioxB5s8fu8X1EDZFTnOaDGdmdA
X-Received: by 2002:a1c:770e:: with SMTP id t14mr6760496wmi.173.1639052881411; 
 Thu, 09 Dec 2021 04:28:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyL2h9N0KGbtDzZwoPUZ5+FGiLDImgFcG7uRNO/NF0d9BGrzMDui9+5mHA0hYe5k4W8nm+zlQ==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr6760456wmi.173.1639052881165; 
 Thu, 09 Dec 2021 04:28:01 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m20sm9483469wmq.11.2021.12.09.04.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 04:28:00 -0800 (PST)
Message-ID: <408dd9d0-22bb-f5de-b578-9fd20df89a98@redhat.com>
Date: Thu, 9 Dec 2021 13:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] Revert "drm/fb-helper: improve DRM fbdev emulation
 device names"
To: Johannes Stezenbach <js@sig21.net>
References: <20211020165740.3011927-1-javierm@redhat.com>
 <Yath6T5ET17GbkI7@sig21.net>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yath6T5ET17GbkI7@sig21.net>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Johannes,

Sorry for the late response. I was on holidays for a week and just came back.

On 12/4/21 13:41, Johannes Stezenbach wrote:
> Hi,
> 
> On Wed, Oct 20, 2021 at 06:57:40PM +0200, Javier Martinez Canillas wrote:
>> This reverts commit b3484d2b03e4c940a9598aa841a52d69729c582a.
>>
>> That change attempted to improve the DRM drivers fbdev emulation device
>> names to avoid having confusing names like "simpledrmdrmfb" in /proc/fb.
>>
>> But unfortunately, there are user-space programs such as pm-utils that
>> match against the fbdev names and so broke after the mentioned commit.
>>
>> Since the names in /proc/fb are used by tools that consider it an uAPI,
>> let's restore the old names even when this lead to silly names like the
>> one mentioned above.
> 
> I would like to ask about the fate of this patch. It doesn't
> seem to have been picked up by anyone, does it?
>

Thanks for the reminder. I've just pushed this to the drm-misc-fixes branch.
 
> 
> Thanks,
> Johannes
> 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

