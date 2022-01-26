Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D3149CC44
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 15:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C67D10E520;
	Wed, 26 Jan 2022 14:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C90010E520
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643207121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ky8vEonCzy59ChEvPze7eMC2KWb2sPsqeiyNVeL7FTo=;
 b=VmweHd0C527hLFQ8ngq1DwsLRMTKXLnlAOwwYq6d4GMj/HhZmOh/wHe4H4Zy7QFx1+hnSI
 o1QlWkTZJOHqe3xrp75+3McQ0L3pYMgO/ezUwu+Nj7JVNM9vmE5qDrnuyj9R91JZStDf4Q
 puB2roiuNLtgjOVN9EtSXoXx1ON5nX8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306--Eo9tjfpM0W8JPXFsy4fJg-1; Wed, 26 Jan 2022 09:25:20 -0500
X-MC-Unique: -Eo9tjfpM0W8JPXFsy4fJg-1
Received: by mail-ej1-f72.google.com with SMTP id
 lb14-20020a170907784e00b006aa178894fcso4951193ejc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 06:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=Ky8vEonCzy59ChEvPze7eMC2KWb2sPsqeiyNVeL7FTo=;
 b=jHKP6MRGYIXpbN2rbY/A3XweqdbPc8R3afE8tDNPrDVYH54jNcduz5/jTf5iRa4Es7
 03oexnmETb8gCGjJyOgl5mSgWHZ23+envIex88fCLXPy4I+wuYzOgC0rIWXfLObiwvFF
 zt9ce3KfmDApf9B5mH0E3wlUaDLLYGuh+VER5DEaotqLDzQtk9OptuLOAjOtHhU3ERkn
 8A7Gx1Ms368cdRMbhtUUSdMgUl3Pbt3FHxye2Yh0NFXJWXkP7Ln0Y7Ew+H/4yCYmTVNh
 g+diuS/VVUEMvJUtt3HUOH3du1VdR1Jsm9+h2R8Lzttn9dWAxYFD0Uy858D29ydUxVT9
 Ts5w==
X-Gm-Message-State: AOAM532sGK1lM7roz2IEbKWvokHvEmbh5CSJOA0vt5LcmgewjgqUaPTv
 D1uJvaZ1NOPzMRyXpWbOwTD/xRnOS96zL9y5lW/YwErjHN8ajP5Vh6ggX/MfNqPCScsTu5IBux7
 95Racd1J6nBM57O6AGw6gU//6PxRi
X-Received: by 2002:a17:906:2a0c:: with SMTP id
 j12mr19869842eje.698.1643207118873; 
 Wed, 26 Jan 2022 06:25:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMUS00fgoM+sQ7aylyugJWpU3ODkJTGoVcDRj4PWJcfLzReiK1FTAo+L0EYzAGI2DFmUZn2A==
X-Received: by 2002:a17:906:2a0c:: with SMTP id
 j12mr19869832eje.698.1643207118696; 
 Wed, 26 Jan 2022 06:25:18 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id v3sm9195954edy.21.2022.01.26.06.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 06:25:18 -0800 (PST)
Message-ID: <7926e4b4-f443-4601-2fbf-80af82363d12@redhat.com>
Date: Wed, 26 Jan 2022 15:25:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: acpi_get_devices() crash when acpi_disabled==true (was [PATCH v2]
 drm/privacy-screen: honor acpi=off in detect_thinkpad_privacy_screen)
From: Hans de Goede <hdegoede@redhat.com>
To: Tong Zhang <ztong0001@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-acpi <linux-acpi@vger.kernel.org>
References: <20220123091004.763775-1-ztong0001@gmail.com>
 <6a0233cd-d931-8a36-3b9e-08b774cec7b0@redhat.com>
In-Reply-To: <6a0233cd-d931-8a36-3b9e-08b774cec7b0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/26/22 14:47, Hans de Goede wrote:
> Hi All,
> 
> On 1/23/22 10:10, Tong Zhang wrote:
>> when acpi=off is provided in bootarg, kernel crash with
>>
>> [    1.252739] BUG: kernel NULL pointer dereference, address: 0000000000000018
>> [    1.258308] Call Trace:
>> [    1.258490]  ? acpi_walk_namespace+0x147/0x147
>> [    1.258770]  acpi_get_devices+0xe4/0x137
>> [    1.258921]  ? drm_core_init+0xc0/0xc0 [drm]
>> [    1.259108]  detect_thinkpad_privacy_screen+0x5e/0xa8 [drm]
>> [    1.259337]  drm_privacy_screen_lookup_init+0xe/0xe85 [drm]
>>
>> The reason is that acpi_walk_namespace expects acpi related stuff
>> initialized but in fact it wouldn't when acpi is set to off. In this case
>> we should honor acpi=off in detect_thinkpad_privacy_screen().
>>
>> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> 
> Thank you for catching this and thank you for your patch. I was about to merge
> this, but then I realized that this might not be the best way to fix this.
> 
> A quick grep shows 10 acpi_get_devices() calls outside of drivers/acpi,
> and at a first glance about half of those are missing an acpi_disabled
> check. IMHO it would be better to simply add an acpi_disabled check to
> acpi_get_devices() itself.
> 
> Rafael, do you agree ?

Never mind I just saw that acpi_get_devices() is part of acpica, where
as the acpi_disabled flag is not. So callers need to check acpi_disabled
before calling acpi_get_devices().

I'll go and push this patch to drm-misc-fixes now.

Regards,

Hans


>> ---
>> v2: fix typo in previous commit -- my keyboard is eating letters 
>>
>>  drivers/gpu/drm/drm_privacy_screen_x86.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
>> index a2cafb294ca6..e7aa74ad0b24 100644
>> --- a/drivers/gpu/drm/drm_privacy_screen_x86.c
>> +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
>> @@ -33,6 +33,9 @@ static bool __init detect_thinkpad_privacy_screen(void)
>>  	unsigned long long output;
>>  	acpi_status status;
>>  
>> +	if (acpi_disabled)
>> +		return false;
>> +
>>  	/* Get embedded-controller handle */
>>  	status = acpi_get_devices("PNP0C09", acpi_set_handle, NULL, &ec_handle);
>>  	if (ACPI_FAILURE(status) || !ec_handle)

