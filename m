Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B096C2FA4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 11:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F9810E16D;
	Tue, 21 Mar 2023 10:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE1110E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679396232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zqnl8wQGkLiGVC6dJ6lbU4N/jWveuXj8HiSg6kq/INM=;
 b=Rna5j9O8ZO0OPuTWG5OgPdlrWRQK2WkJu2zUqCL13c9eWrjUEwqEVw5Pnf+4wtFwB3u98s
 rK5NDbFKFkeXk4Ae7sLbkcIGGVqL+othCwK/f43MnsT7gQB1u0WmCWxvahqdQexZbq5+jW
 GpBatQwCiQrgo+u0vk63jFrihlCu8ZU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-v50cg3KJPC2X1Wt_n_yeBQ-1; Tue, 21 Mar 2023 06:57:11 -0400
X-MC-Unique: v50cg3KJPC2X1Wt_n_yeBQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 p36-20020a056402502400b004bb926a3d54so21229356eda.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 03:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679396230;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zqnl8wQGkLiGVC6dJ6lbU4N/jWveuXj8HiSg6kq/INM=;
 b=TmzeJiWT0niwTtOGh31s3hcnygBwspYGMqg88z6p6L/BMC5Tl31mOycLApAgpWkI8m
 +mHdJGivVTRVvy9NU4un4tin605sFhSvzuaKymFJx5elCIFLBZI4GUPGXL5ZbzEveLQD
 1yAB/wWbH6+hY7LKjqC0+jdfyyM7Kx4mIRx470Dp/eWlzMyC25v+tez7mt5Vr/PEO5s5
 SmeMqBVk4Lb6cOC7/9a86rcz3a8V6e+3b85fWj5cx929GSgnAaQQA9ttHGXTiv4mcwmH
 Y5Id6hcWLojSKH8FM6FzSi1dmXLOQSnCRGT+yIRem+SjVtYTyC8UN8gTMo78kGwEz+vh
 o8ZA==
X-Gm-Message-State: AO0yUKW2PPnvQhw+MUIPcdFFIfzLHZWGBIzZNfVaLZ0tEcO4jsjoJCWK
 gKK+5PNW5e/qpP8/orZoWWdi7+NxVbeEc8u43qA75vPl00NGK/q5E3jVLG/h7Ujck7FkMUHn/6q
 OSbGKR8bPfHiaGj8TRMTM5citfRky
X-Received: by 2002:a17:906:f854:b0:885:fee4:69ee with SMTP id
 ks20-20020a170906f85400b00885fee469eemr2342692ejb.59.1679396230280; 
 Tue, 21 Mar 2023 03:57:10 -0700 (PDT)
X-Google-Smtp-Source: AK7set9QF6Ol8o+2z8X5ZC66BTA+r6FBdwEBgqqJBo6vYBoIWuPL8noa9SI1j36GGusRGp0m9f7JBA==
X-Received: by 2002:a17:906:f854:b0:885:fee4:69ee with SMTP id
 ks20-20020a170906f85400b00885fee469eemr2342685ejb.59.1679396230051; 
 Tue, 21 Mar 2023 03:57:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 rh26-20020a17090720fa00b00930ba362216sm5715590ejb.176.2023.03.21.03.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 03:57:09 -0700 (PDT)
Message-ID: <4bca4928-87d4-18ac-7ea2-25c68462422c@redhat.com>
Date: Tue, 21 Mar 2023 11:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Lenovo Yoga
 Book X90F
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230301095218.28457-1-hdegoede@redhat.com>
 <87mt4glkxd.fsf@minerva.mail-host-address-is-not-set>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87mt4glkxd.fsf@minerva.mail-host-address-is-not-set>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/13/23 16:39, Javier Martinez Canillas wrote:
> Hans de Goede <hdegoede@redhat.com> writes:
> 
> Hello Hans,
> 
>> Like the Windows Lenovo Yoga Book X91F/L the Android Lenovo Yoga Book
>> X90F/L has a portrait 1200x1920 screen used in landscape mode,
>> add a quirk for this.
>>
>> When the quirk for the X91F/L was initially added it was written to
>> also apply to the X90F/L but this does not work because the Android
>> version of the Yoga Book uses completely different DMI strings.
>> Also adjust the X91F/L quirk to reflect that it only applies to
>> the X91F/L models.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
> 
> Patch looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks, I have pushed this to drm-misc-fixes now.

Regards,

Hans

