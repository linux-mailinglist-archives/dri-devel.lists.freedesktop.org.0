Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBA149CFE4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 17:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E9A10E396;
	Wed, 26 Jan 2022 16:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F014010E48F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 16:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643215274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0DxxciFenyllyTJBJcdnpCFKm70eO0yRbePPZj5G/aE=;
 b=D+Rl7gNbOSyZwW/8JJSaN3SykVh0DhZPgU8c0d9/O59X1qMnRiytZTgbhm5yHQ7YGNA7Qz
 AT61shcHQD2GQZwRXKzi7CZBywEyzGvXk3WMOZsWmYMUF1Z3BWfziqx+/XBkoZEnN4xWP4
 4Qc5kdW/Qhe1Fvj94RggT3QHUDzIT7I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-t2u0HS9iMcmJqz6Je4SWpg-1; Wed, 26 Jan 2022 11:41:11 -0500
X-MC-Unique: t2u0HS9iMcmJqz6Je4SWpg-1
Received: by mail-ej1-f71.google.com with SMTP id
 k16-20020a17090632d000b006ae1cdb0f07so5139582ejk.16
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 08:41:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0DxxciFenyllyTJBJcdnpCFKm70eO0yRbePPZj5G/aE=;
 b=CRSrF6/4GLBbt8KPcHT1lasc/yR0/uJ84cYwHdDIPy/Vs2GjgE/8kOyP59w74q/Lwe
 +mn1H7hVO7qGMIQUoLlHAppvqjl61KXFs5AwH9u1D7uJBn9n95QEsX4rwgZGO0NLgFAr
 oy24ET3h+PHCckxu6b6GZEA0v5WRcZwcKmMslMyD8BxH8ZMlRCPr2ZSynowvIUcREhTh
 aIrvJ8XeWP6JCXOIxeN653EWwdvEwvlZzASkoLY2mFl84tasBdPNW/Vj9iQlf43iwlse
 XdqaTGROc6LG0F78wmT+iAprbEPWQBp73s/JqjztNN3b2ULFLj6jh3y0MT1F7dHycQvC
 jTyg==
X-Gm-Message-State: AOAM530veuKwicDZPrN+e9qA9pvAUPSsgTWly8hXLcvSdT++/Sw0Krcm
 OFPwn5jz/K0fGyvb6ml6Ucs/jXZ2MeFHgzl4umae7dF9HXrQS2jNtFlVtKtJ5cjfvDuylXR+OKn
 EHx5/XXjLma5ArrGLowO5HgnpBdmn
X-Received: by 2002:a05:6402:114e:: with SMTP id
 g14mr25372290edw.401.1643215270232; 
 Wed, 26 Jan 2022 08:41:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLudT2x12DJguI526J9ikIwHvlqs1R6BWdUsSibS1KsV0Im0ZA7bvfbLwzSynPRwjQzuVFuA==
X-Received: by 2002:a05:6402:114e:: with SMTP id
 g14mr25372268edw.401.1643215270023; 
 Wed, 26 Jan 2022 08:41:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id j2sm7630091ejc.223.2022.01.26.08.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 08:41:09 -0800 (PST)
Message-ID: <049ccc3a-8628-3e90-a4f4-137a286b6dce@redhat.com>
Date: Wed, 26 Jan 2022 17:41:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: acpi_get_devices() crash when acpi_disabled==true (was [PATCH v2]
 drm/privacy-screen: honor acpi=off in detect_thinkpad_privacy_screen)
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20220123091004.763775-1-ztong0001@gmail.com>
 <6a0233cd-d931-8a36-3b9e-08b774cec7b0@redhat.com>
 <CAJZ5v0h51v9fFrJRuaFpSn7J2UEHndEj0f3zpmw=RvgsvAhtvw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0h51v9fFrJRuaFpSn7J2UEHndEj0f3zpmw=RvgsvAhtvw@mail.gmail.com>
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
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Tong Zhang <ztong0001@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-acpi <linux-acpi@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/26/22 16:54, Rafael J. Wysocki wrote:
> On Wed, Jan 26, 2022 at 2:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> On 1/23/22 10:10, Tong Zhang wrote:
>>> when acpi=off is provided in bootarg, kernel crash with
>>>
>>> [    1.252739] BUG: kernel NULL pointer dereference, address: 0000000000000018
>>> [    1.258308] Call Trace:
>>> [    1.258490]  ? acpi_walk_namespace+0x147/0x147
>>> [    1.258770]  acpi_get_devices+0xe4/0x137
>>> [    1.258921]  ? drm_core_init+0xc0/0xc0 [drm]
>>> [    1.259108]  detect_thinkpad_privacy_screen+0x5e/0xa8 [drm]
>>> [    1.259337]  drm_privacy_screen_lookup_init+0xe/0xe85 [drm]
>>>
>>> The reason is that acpi_walk_namespace expects acpi related stuff
>>> initialized but in fact it wouldn't when acpi is set to off. In this case
>>> we should honor acpi=off in detect_thinkpad_privacy_screen().
>>>
>>> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
>>
>> Thank you for catching this and thank you for your patch. I was about to merge
>> this, but then I realized that this might not be the best way to fix this.
>>
>> A quick grep shows 10 acpi_get_devices() calls outside of drivers/acpi,
>> and at a first glance about half of those are missing an acpi_disabled
>> check. IMHO it would be better to simply add an acpi_disabled check to
>> acpi_get_devices() itself.
>>
>> Rafael, do you agree ?
> 
> Yes, I do.

Did you see my follow-up that that is not going to work because
acpi_get_devices() is an acpica function ?

Regards,

Hans


 
>>> ---
>>> v2: fix typo in previous commit -- my keyboard is eating letters
>>>
>>>  drivers/gpu/drm/drm_privacy_screen_x86.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
>>> index a2cafb294ca6..e7aa74ad0b24 100644
>>> --- a/drivers/gpu/drm/drm_privacy_screen_x86.c
>>> +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
>>> @@ -33,6 +33,9 @@ static bool __init detect_thinkpad_privacy_screen(void)
>>>       unsigned long long output;
>>>       acpi_status status;
>>>
>>> +     if (acpi_disabled)
>>> +             return false;
>>> +
>>>       /* Get embedded-controller handle */
>>>       status = acpi_get_devices("PNP0C09", acpi_set_handle, NULL, &ec_handle);
>>>       if (ACPI_FAILURE(status) || !ec_handle)
>>
> 

