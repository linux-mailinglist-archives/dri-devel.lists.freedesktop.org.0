Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0B1120717
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 14:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4688D6E500;
	Mon, 16 Dec 2019 13:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69E16E529
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576502730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uRdDoSIR5AtO5m9cdoh24W2ysjI5Q/CXritZrr/9PAw=;
 b=fCNqMrJZPdP3HYb3HZu+81uAQyJNJFZAxZgK37lz0VdRCzdWH7+NIRFPKLCOIqi9q9aeCz
 5ORbtduwya1f4bArXrYzFnZHa9o7AYsPWkss/u39zZqxzDpMgB9TYCF4tKsTmGsVAYJXZa
 ycEYBzpEhToe6k2OPFzwdxy5819SyGY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-X66953_uMmudI2aS6qhk5w-1; Mon, 16 Dec 2019 08:25:28 -0500
Received: by mail-wm1-f70.google.com with SMTP id m133so1017248wmf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 05:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uRdDoSIR5AtO5m9cdoh24W2ysjI5Q/CXritZrr/9PAw=;
 b=pIXnGWlYqbCvpbRuCZE9V01vW0BpSvG7grakVF6zVCCDlODGqnFFG0JXpBxCe48bhe
 R3A3ImVzbGY9NbTfUrEWhiqtOWUSbg/2vUFDxu5QWg06PupEbayhurH122wVWBuyAZfc
 4xHl6Pe9OCG7SOtcLAgIZX+Yn6QYGyktAzS5uDdPUhKCAf7Zt134hm1sGI0R2veDCD3Y
 /OofAdrRuAzvPk97tLmpocZwoU8SyhQ/TKEWIQRynUs/XeG7s0pGAjbyMiyis4J+9FuL
 fAUztex+dKMuQ4rECDWos45/LaFbv3qlOUyzPMiAYY7enYUNruw8OEbSuvmGd1+TOTpa
 Rdew==
X-Gm-Message-State: APjAAAVqJN8stawDPzgnHFqXMvY6sYgrpS2YpyXxFX0bbLNQJr4Rdp14
 qLJqj0CmmTbdSKtj1F3tXlhOelLwXb38yODIccuskd1dnV+oEdTNVpGY1T0yIXq3IyUKIB9xDB4
 alinG2J0jyK3mKGehelwF6B5frooq
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr29618639wrv.197.1576502727646; 
 Mon, 16 Dec 2019 05:25:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4OV/uMjHjWFkzOaNCoPh9pj0FgIpenm2MmRU4IcHuC2XwF2EWIH1IgvkhnbCC8jhwu7H/vw==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr29618624wrv.197.1576502727472; 
 Mon, 16 Dec 2019 05:25:27 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id m3sm21622971wrs.53.2019.12.16.05.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 05:25:26 -0800 (PST)
Subject: Re: [PATCH 0/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs from VBT
To: Linus Walleij <linus.walleij@linaro.org>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <CACRpkdarJ5chDfgc5F=ntzG1pw7kchtzp0Upp+OH9CH6WLnvXw@mail.gmail.com>
 <1474a983-3e22-d59b-255a-edd3a41f0967@redhat.com>
 <CACRpkdaYgpY=Anem00tPS=HPCD5XUrfWmWjvPkszggnHCpgK2Q@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <970de91d-5678-1771-3816-bdff8e7e336f@redhat.com>
Date: Mon, 16 Dec 2019 14:25:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdaYgpY=Anem00tPS=HPCD5XUrfWmWjvPkszggnHCpgK2Q@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: X66953_uMmudI2aS6qhk5w-1
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lee Jones <lee.jones@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 16-12-2019 13:16, Linus Walleij wrote:
> On Mon, Dec 16, 2019 at 12:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Ugh, taking one last look at the "pinctrl: Export pinctrl_unregister_mappings"
>> patch it is no good, sorry.
> 
> Ooops!
> 
>> Linus, can you please drop this from your -next ?
> 
> Sure, done.
> 
>> So I see 2 options:
>> 1) Add an orig_map member to maps_node and use that in the comparison,
>> this is IMHO somewhat ugly
>>
>> 2) Add a new pinctrl_register_mappings_no_dup helper and document in
>> pinctrl_unregister_mappings kdoc that it can only be used together
>> with the no_dup variant.
>>
>> I believe that 2 is by far the best option. Linus do you agree or
>> do you have any other suggestions?
> 
> What about (3) look for all calls to pinctrl_register_mappings()
> in the kernel.
> 
> Hey it is 2 places in total:
> arch/arm/mach-u300/core.c:      pinctrl_register_mappings(u300_pinmux_map,
> drivers/pinctrl/cirrus/pinctrl-madera-core.c:           ret =
> pinctrl_register_mappings(pdata->gpio_configs,
> 
> Delete  __initdata from the u300 table, the other one seems
> safe. Fold this into your patch.
> 
> Go with the original idea.

That indeed sounds like a cleaner solution I will prepare a new version of
the patch (and this series for the i915 CI) with this approach.

Thanks & Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
