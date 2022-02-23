Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A764C1B01
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 19:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD5110E3AF;
	Wed, 23 Feb 2022 18:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D92E10E3AF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 18:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645641300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypIs7bkNYvlEnOXn/O+REGsfb4DaXi/zE6H2OQf1oCs=;
 b=cy4JSxBDdDfPM7KwtHSJ5r4b02KLDG3otxXobM8IFST83UqM+5TKhT5R0xuu7751Ve10yN
 OpaK4UBbTjL7Ni5x6P0rN/0HqGouNzWv/xJlUSwxrlyb75L8UkE9coBjVDC1aMG5gtaJWq
 ttnywj4/vsmojHHtXWA4ZVKMiIsUXkQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-nt9QXij_PS-Dj-Q1HaA5tg-1; Wed, 23 Feb 2022 13:34:59 -0500
X-MC-Unique: nt9QXij_PS-Dj-Q1HaA5tg-1
Received: by mail-wr1-f70.google.com with SMTP id
 e1-20020adfa741000000b001e2e74c3d4eso10519623wrd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:34:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ypIs7bkNYvlEnOXn/O+REGsfb4DaXi/zE6H2OQf1oCs=;
 b=jX7Gvn5E/N4eKSbcHibkhRoueHetBk+j1HEQypgI/9xW+IP6LGZNdkgYvU86VK+hcY
 rQhD4elhyEalIHj1uEHES5nDa+/D4xqKkXpnrCMxhw9jk6aaqpeI5LSXmdkCa19L9Pu4
 MrSOK3GIDGy/Ncsq8kyz+uv/pxU9UEtbCNPIw225///V5MPCghSr3SD+HlaIG39XxVQz
 X8OecWbxI1smbp8eVQtUPnu/0etuHoHldAbWK83KbObR2a/R/CnFldkZXQHXn0AkRfm+
 HUEemoiCzJDsqKEA5Vz2hFQQCjsGpsWKHz/9LAh581FIqrU53JcVIapkX2VihI6tebGi
 hm5A==
X-Gm-Message-State: AOAM533ydn9jz03d/Tv6cRKPGCMrwkob2lynmKV3lt7B1f0s9rsNZAb/
 0LreGhTo4AHWkVNpz0bPkHAZ6YPeginrjBmDvcirTT6Ik7DBT9HckDSqqj5FU+8fwjtkZsQJluS
 49+14Rzw8aocqMB+yZeXtrt6zDcPa
X-Received: by 2002:a05:600c:1e84:b0:380:d32d:6add with SMTP id
 be4-20020a05600c1e8400b00380d32d6addmr779449wmb.21.1645641297939; 
 Wed, 23 Feb 2022 10:34:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTHgN+Rdge2lsZegxKPa8wLCjjbMqeVpYlQilsAJnylW5S2vTRVysSyPJI9A+AOG/fZzzhQg==
X-Received: by 2002:a05:600c:1e84:b0:380:d32d:6add with SMTP id
 be4-20020a05600c1e8400b00380d32d6addmr779436wmb.21.1645641297738; 
 Wed, 23 Feb 2022 10:34:57 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id e7sm294678wrg.44.2022.02.23.10.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 10:34:57 -0800 (PST)
Message-ID: <1f13e6f2-a87c-83ac-7119-8632c8c8ac8e@redhat.com>
Date: Wed, 23 Feb 2022 19:34:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] simplefb: Enable boot time VESA graphic mode selection.
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
 <20220218160436.23211-1-msuchanek@suse.de>
 <33b80f9c-d54a-5471-a58b-7a783a7a9e5b@redhat.com>
 <20220223164528.GE3113@kunlun.suse.cz>
 <f832a836-b6ee-ffc5-6f83-86c9ba475400@redhat.com>
 <20220223171235.GF3113@kunlun.suse.cz>
 <a9df1753-8e3b-55bb-2dab-9e7aeaa52a8d@redhat.com>
 <20220223182341.GG3113@kunlun.suse.cz>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220223182341.GG3113@kunlun.suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, David Herrmann <dh.herrmann@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Simon Trimmer <simont@opensource.cirrus.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-video@atrey.karlin.mff.cuni.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/23/22 19:23, Michal Suchánek wrote:

[snip]

>> My point about the subject line remains thought, I would use something like:
>>
>> firmware: sysfb: Enable boot time VESA graphic mode selection for simplefb
> 
> I see where the confusion comes from.
>

Yeah. And just to clarify, the "simplefb" in the subject line I proposed
was about the sysfb simplefb and not the fbdev simplefb :)
 
> The efifb (and probably vesafb) has implicit unstated dependency on
> sysfb. So the drivers that select BOOT_VESA_SUPPORT should instead
> depend on SYSFB, and then SYSFB can select BOOT_VESA_SUPPORT, and it
> will look much saner.
>

That indeed would be much nicer. And I agree with you that there's an
implicit dependency that should be made explicit since SYSFB is what
registers the "efi-framebuffer" or "vesa-framebuffer" if SYSFB_SIMPLEFB
is not enabled.

Should SYSFB should only select BOOT_VESA_SUPPORT if x86 ? I know that
in practice shouldn't matter because BOOT_VESA_SUPPORT is under x86 but
I guess is more correct if that's the case.

And I think that FB_SIMPLE should depend on SYSFB_SIMPLEFB if !OF (since
a "simple-framebuffer" platform device could be registered by OF if a
Device Tree node with compatible "simple-framebuffer" exists).

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat

