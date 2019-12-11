Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDE911BA7E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 18:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712136EB9D;
	Wed, 11 Dec 2019 17:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2626EB9E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 17:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576085929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y12wlbSvkuEx6hrDq4ife4K7ITZLnh8SGNBP1jLgnxg=;
 b=SjS0b9/Mf8Rf78nuz3uj9ZrjqVj6/90UXiOKyLg/s3PDbebTWBYfDOb8/vXLAstDEtO5tl
 0oZGLC/Kgcj6fV8bvYQlig+UKo8iHOoZxTRqRXxyA6yQ2dAcQ7EKr/4kP+PhylUvI51m/B
 kZWp3zCb/p0RjZDtiMNGHldIY2T1lWk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-9M1DoxU0NgSby6j5wNJZ9g-1; Wed, 11 Dec 2019 12:32:39 -0500
Received: by mail-wr1-f71.google.com with SMTP id z10so10626028wrt.21
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 09:32:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y12wlbSvkuEx6hrDq4ife4K7ITZLnh8SGNBP1jLgnxg=;
 b=GwfqiFDLXY1PRopOWTMRwX/DHm3NQeWouQOct1dzkAtC46V6M0GpeYvyI01T5AhPQ1
 BLOV1MgNi3Rul6ocqKlsJSGOfOHildlJgDQ/C9tl/zcTgr+XEw6k9Uzj1nBOhQ4b35Om
 iL5TWcjIBUS1xwQB88Y7G5/+oObz48+adk2AG7gkoKz9s+zYqgHWS9VdcoQDSUHxZrBE
 miXiSaFZbK6SW6C4tOjADjXncGiKKeu0QW30kYV9ORmXM80Xw22hKZggLCF7VFo3RHkY
 QCA4y8iU5MyiKK/vWVL4sJUgCWgUfNPPdvGVH52VJPZ9GbE6PwTQEb3aBqgYq+JFLNFf
 qyVA==
X-Gm-Message-State: APjAAAVwCsiAwv8Dq5/M+IgEPehCVJ7nSvQcznG9sWzCWMNDgeY6t3mv
 vF81ucVA32rmP3xvZXmUYS/n1DpCUWi0GNxJcbHPnKATpMQWsmhwhhN0/pMHNy+084B8UJIQhhu
 +EVENsueUFNNQnZpALA3FmRY8MIJs
X-Received: by 2002:adf:df90:: with SMTP id z16mr1036609wrl.273.1576085558005; 
 Wed, 11 Dec 2019 09:32:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqyJNDISSzLaekbps4PPe/Y5SFMhSF7OjIT8TamyAaUOOzgveUOLSuGFFwaNrhfYHhJrY6DB/A==
X-Received: by 2002:adf:df90:: with SMTP id z16mr1036575wrl.273.1576085557720; 
 Wed, 11 Dec 2019 09:32:37 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id o185sm2736280wmb.40.2019.12.11.09.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 09:32:37 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/i915/vlv_dsi: Control panel and backlight enable
 GPIOs on BYT
To: Linus Walleij <linus.walleij@linaro.org>
References: <20191129185836.2789-1-hdegoede@redhat.com>
 <20191129185836.2789-3-hdegoede@redhat.com>
 <CACRpkdbRb-LF2tNN-ueo=tKuJc+u4B7Y20+BCyqnN7wYbm8y7Q@mail.gmail.com>
 <87wobfj65b.fsf@intel.com> <47c36b75-bc30-502b-7f8d-035cf2348fc4@redhat.com>
 <CACRpkdaJGZsJpYu3cgQCeWuJD1y9CQyzuk_VYfGfAT8WC=_1VA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <4bc1d1ac-b3c7-4ea5-9150-bc1b9cffb963@redhat.com>
Date: Wed, 11 Dec 2019 18:32:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdaJGZsJpYu3cgQCeWuJD1y9CQyzuk_VYfGfAT8WC=_1VA@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: 9M1DoxU0NgSby6j5wNJZ9g-1
X-Mimecast-Spam-Score: 0
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
Cc: ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11-12-2019 01:24, Linus Walleij wrote:
> On Mon, Dec 2, 2019 at 4:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> There is only one problem, currently is is not possible to
>> unregister a mapping added with pinctrl_register_mappings
>> and the i915 driver is typically a module which can be unloaded
>> and I believe actually is unloaded as part of the i915 CI.
>>
>> pinctrl_register_mappings copies the passed in mapping, but
>> it is a shallow copy, so it contains pointers to the modules
>> const segment and we do not want to re-add another copy of
>> the mapping when the module loads a second time.
>>
>> Fixing this is easy though, there already is a pinctrl_unregister_map()
>> function, we just need to export it so that the i915 driver can
>> remove the mapping when it is unbound.
>>
>> Linus would exporting this function be ok with you?
> 
> Yep!
> 
>> Linus, question what is the purpose of the "dupping" / shallow
>> copying of the argument passed to pinctrl_register_map ?
> 
> The initial commit contained this comment later removed:
> 
> +       /*
> +        * Make a copy of the map array - string pointers will end up in the
> +        * kernel const section anyway so these do not need to be deep copied.
> +        */
> 
> The use was to free up memory for platforms using boardfiles
> with a gazillion variants and huge pin control tables, so these
> could be marked  __initdata and discarded after boot.
> As the strings would anyway stay around we didn't need to
> deep copy.
> 
> See for example in arch/arm/mach-u300/core.c
> static struct pinctrl_map __initdata u300_pinmux_map[]
> 
>> Since
>> it is shallow the mem for any pointers contained within there need
>> to be kept around by the caller, so why not let the caller keep
>> the pinctrl_map struct itself around too?
> 
> So the strings will be kept around because the kernel can't get
> rid of strings. (Yeah it is silly, should haven been fixed ages
> ago, but not by me, haha :)
> 
>> If we are going to export pinctrl_unregister_map() we need to make it
>> do the right thing for dupped maps too, we can just store the dup flag
>> in struct pinctrl_maps. So this is easy, but I wonder if we cannot
>> get rid of the dupping all together ?
> 
> Maybe ... I don't know. What do you think? I suppose you could
> make u300 crash if you do that.

I've prepared a patch which makes pinctrl_register_mappings remember
if the mapping is dupped or not (store the dup value in struct pinctrl_maps);
and which modifies pinctrl_unregister_map() to do the right thing
depending on the stored dup value.

I still need to test the new series and then I will post it.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
