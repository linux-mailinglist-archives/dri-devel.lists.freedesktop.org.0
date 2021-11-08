Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF072447FE2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 13:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3686E0C6;
	Mon,  8 Nov 2021 12:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA7E6E0AA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 12:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636376059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFXqlwY3MOW61Iy5t5GDa7bdxm1Y6ZhUyYK2YPVZvAI=;
 b=e9J7nEicDVm0p3AzR3nbEuc+Xsy37/bFa7JoYQiy4aExEWNFV00XpNymrKDq7HdJn0G0JA
 ZgKg8JuMnLcLO6iL1GoCVGA/LGZ1vLC2t62A/I/lz3Z4829O4gTjXHNvmx1I/AlIpvHN20
 XigePSptLtiMeQGBBtjcpEvtsEH2300=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-wXcPPW3OP7m6M7A3opP30A-1; Mon, 08 Nov 2021 07:54:16 -0500
X-MC-Unique: wXcPPW3OP7m6M7A3opP30A-1
Received: by mail-wr1-f71.google.com with SMTP id
 c4-20020adfed84000000b00185ca4eba36so3996670wro.21
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 04:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EFXqlwY3MOW61Iy5t5GDa7bdxm1Y6ZhUyYK2YPVZvAI=;
 b=Fe+nIhTV2jTiwmVJddkP7FoHOTPze60HNQESTAMSyCIZi/yamb37uqt+jMnE8HmvAS
 M939XWApBTsYBExVpNuzAEEN8A7Huaypms04Iy8oBdqrkPS2H6ykCjviB05fN9m1QvqV
 JPFFdqB/8OzwAag8kUjGoURVflOkeWQn6Rkq+bTnp5SUE3Tyxbl75YlABUD/d8e1LXFC
 tP/P2I8jX8KMNlxLu2IfpiT/bml8kj5EPkXg7PV90HtJVKiRv1OUeyh02LKNf/jmRIxl
 rAaivMfrw/BAmpYOdM5ghSDPii8VJ5Xb9yaxI38XyCcm7/KPfFvJ5tQc+ZGLCSIB2GiP
 MzPA==
X-Gm-Message-State: AOAM533y0hK1JkVERmlh1bNCi4QKVEu10z8jc0I5kYOkHwLcMkL9pyET
 u3LpMvLicHQK0TnK8GDKeEBeC/6WDFjKZZ/nyw4e+1JUofhmZDJUILIR+89KyTZOuxpEqORIERv
 dD1wHD80eeAsFVDsxlbrWOUxZva3s
X-Received: by 2002:a7b:cd03:: with SMTP id f3mr50838585wmj.16.1636376055505; 
 Mon, 08 Nov 2021 04:54:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmqDlXtLEwAqWdRiXbSgRWUzhJtq4A3VbDkcMqhE2d089skY95iOLrHAVYiMf3G4b4ArNl7w==
X-Received: by 2002:a7b:cd03:: with SMTP id f3mr50838558wmj.16.1636376055266; 
 Mon, 08 Nov 2021 04:54:15 -0800 (PST)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id c5sm13509067wrd.13.2021.11.08.04.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 04:54:15 -0800 (PST)
Message-ID: <7047ccc5-0927-f304-4d60-181d61344f8b@redhat.com>
Date: Mon, 8 Nov 2021 13:54:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20211108121544.776590-1-javierm@redhat.com>
 <509f58a5-5276-5608-e3ba-4694956f6c50@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <509f58a5-5276-5608-e3ba-4694956f6c50@suse.de>
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
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 11/8/21 13:50, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.11.21 um 13:15 schrieb Javier Martinez Canillas:
>> There is a lot of historical baggage on this parameter. It is defined in
>> the vgacon driver as nomodeset, but its set function is called text_mode()
>> and the value queried with a function named vgacon_text_force().
>>
>> All this implies that it's about forcing text mode for VGA, yet it is not
>> used in neither vgacon nor other console driver. The only users for these
>> are DRM drivers, that check for the vgacon_text_force() return value to
>> determine whether the driver should be loaded or not.
>>
>> That makes it quite confusing to read the code, because the variables and
>> function names don't reflect what they actually do and also are not in the
>> same subsystem as the drivers that make use of them.
>>
>> This patch-set attempts to cleanup the code by moving the nomodseset param
>> to the DRM subsystem and do some renaming to make their intention clearer.
>>
>> This is a v3 of the patches, that address issues pointed out by Jani Nikula
>> in v2: https://lkml.org/lkml/2021/11/4/594
>>
>> Patch #1 and #2 are just trivial cleanups.
>>
>> Patch #3 moves the nomodeset boot option to the DRM subsystem and renames
>> the variables and functions names.
>>
>> Patch #4 removes the relationship between the nomodeset parameter and the
>> CONFIG_VGA_CONSOLE Kconfig symbol.
> 
> On patches 1 to 4
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Thanks!
 
>>
>> Patch #5 adds nomodeset to the kernel parameters documentation.
>>
>> Patch #6 improves the message when nomodeset is enabled to make it more
>> accurate and less sensational.
> 
> See my comments on these patches.
>

Yes, agreed with your feedback on these. I'll improve it when posting a v4.

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat

