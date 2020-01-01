Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 442CE12DEF9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 14:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE9689B45;
	Wed,  1 Jan 2020 13:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318BB89B45
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577883876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+sMHv/NXk5vFIFavisCvSHG1HZuRuVWu182Z71fT3c=;
 b=R7VbXfAYG177/zoKiEabRKojzh1/YSXDGOwwrdx4QyWTje47roUBrJKRSSLZnNLd2NFhZm
 2aZ7OXBpmHO/vp8wXSZPntF6BJKsbJRPFC9nxYipgLO4HZjwMK9RoZJCz5uEb7eJVL6ajc
 Rj27q7+N6hA50YqAgHF/eudbYuyhJGY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-Zod5kOYrNFukPg0hPWWRCQ-1; Wed, 01 Jan 2020 08:04:31 -0500
Received: by mail-wm1-f72.google.com with SMTP id f25so406220wmb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2020 05:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3+sMHv/NXk5vFIFavisCvSHG1HZuRuVWu182Z71fT3c=;
 b=jt5gbHOs60hhQsYAQj1fg58O8JgCrZBKwKSWUWp/KYcAZMJKYfq95KoRapakfSEaUq
 eSj8ZpxA4BJ4iCWKLgfPRZLCsSIMZd+k/0qSlxm2ktE37d6pcG0Dji/3348YzzwnOyT1
 9wpOlEUl8jCK8xKyna9G/UPzaa+SsLxpJXWefkhLPyfS4SlxdleOWyYy+3yn+cImwngU
 CacThimTpVuXrq0K/Yp8QI4S1IIUryFBKewSdtNs8LluZtUCBAgf817tcfFX6LM8OV5S
 W4xNXZzv9blR0Oc7yij/0EV74UftW+2pajAEFXlqUKEJZ28QutM4m18/hE5tbtccmfDV
 VM5g==
X-Gm-Message-State: APjAAAXV6KrgKmmZmx8a0370kUMxs08aosjxWkl/vHbKi9NRnop82zk+
 J88H8c1fTwtpY+x1lIw/sWIin4L1HHckgQRN/hRaHAfD05bGPpluO4h3Qn/6onV+ZcTRQyfilPy
 FUuWWVuAFptbtdhnZ+sFE/655/tvq
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr9015310wmg.154.1577883870767; 
 Wed, 01 Jan 2020 05:04:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwzUL1zteKyNuYPDFOsoKQUmzTGSQ9O1XlOn5f8lHIeW+Vbx3bAgicNtKYD8muQPcI6uTqNAg==
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr9015274wmg.154.1577883870445; 
 Wed, 01 Jan 2020 05:04:30 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id m7sm5349302wma.39.2020.01.01.05.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jan 2020 05:04:29 -0800 (PST)
Subject: Re: [PATCH v2 1/5] pinctrl: Allow modules to use
 pinctrl_[un]register_mappings
To: Linus Walleij <linus.walleij@linaro.org>
References: <20191216205122.1850923-1-hdegoede@redhat.com>
 <20191216205122.1850923-2-hdegoede@redhat.com>
 <CACRpkdaXFSJVkWJGzsVcvbUA9gpgP0Vbkwf1H-HWw8s35R9XYQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <458597d4-5f81-90f5-7f14-aa634e87ddbd@redhat.com>
Date: Wed, 1 Jan 2020 14:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdaXFSJVkWJGzsVcvbUA9gpgP0Vbkwf1H-HWw8s35R9XYQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: Zod5kOYrNFukPg0hPWWRCQ-1
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 30-12-2019 14:31, Linus Walleij wrote:
> On Mon, Dec 16, 2019 at 9:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Currently only the drivers/pinctrl/devicetree.c code allows registering
>> pinctrl-mappings which may later be unregistered, all other mappings
>> are assumed to be permanent.
>>
>> Non-dt platforms may also want to register pinctrl mappings from code which
>> is build as a module, which requires being able to unregister the mapping
>> when the module is unloaded to avoid dangling pointers.
>>
>> To allow unregistering the mappings the devicetree code uses 2 internal
>> functions: pinctrl_register_map and pinctrl_unregister_map.
>>
>> pinctrl_register_map allows the devicetree code to tell the core to
>> not memdup the mappings as it retains ownership of them and
>> pinctrl_unregister_map does the unregistering, note this only works
>> when the mappings where not memdupped.
>>
>> The only code relying on the memdup/shallow-copy done by
>> pinctrl_register_mappings is arch/arm/mach-u300/core.c this commit
>> replaces the __initdata with const, so that the shallow-copy is no
>> longer necessary.
>>
>> After that we can get rid of the internal pinctrl_unregister_map function
>> and just use pinctrl_register_mappings directly everywhere.
>>
>> This commit also renames pinctrl_unregister_map to
>> pinctrl_unregister_mappings so that its naming matches its
>> pinctrl_register_mappings counter-part and exports it.
>>
>> Together these 2 changes will allow non-dt platform code to
>> register pinctrl-mappings from modules without breaking things on
>> module unload (as they can now unregister the mapping on unload).
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> This v2 works fine for me, I applied it to this immutable branch in the
> pinctrl tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-pinctrl-unreg-mappings
> 
> And pulled that into the pinctrl "devel" branch for v5.6.
> 
> Please pull this immutable branch into the Intel DRM tree and apply
> the rest of the stuff on top!

Great, thank you!

Regards,

Hans

p.s.

Happy New year everyone.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
