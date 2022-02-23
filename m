Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD74C18A7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 17:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BE110EAD5;
	Wed, 23 Feb 2022 16:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DDE10EAD5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645634095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=clONYmZ5X2qlfrfzJXRhqvS1L3/caQ4kzeJBK6mGohk=;
 b=ercBwKn+MFV+8vGY1W14XWigiUxu3lmI55faiI5FSDPo/OBqeFHtVzp+AEl2MfahEbsauw
 yqThiG67o+oR5AfU+Y7Vyl9DZrmbYRoBTQAmhkZwK7W+bGgG7KE0BU45RGL/B6y8eJw/v4
 bcGWHzuUuHKkZdy1FQZJpinOs/Ci5Rg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-9igd3oTlNeqnmfDdsysWVA-1; Wed, 23 Feb 2022 11:34:54 -0500
X-MC-Unique: 9igd3oTlNeqnmfDdsysWVA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v17-20020adfa1d1000000b001ed9d151569so1662047wrv.21
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 08:34:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=clONYmZ5X2qlfrfzJXRhqvS1L3/caQ4kzeJBK6mGohk=;
 b=BKBu5vMmYLTDz0qW0nyTaXkq+5wLgP1/IZ64HmZZb/bDINhUaelxH3vYpXVQ6wb1Uc
 LKHMuHF38IswyXmlE9BTmCqovCkDWSDBaKlGnMkochCJpdslmftXah2jEnKHYaK+om/T
 12UamZ0w32eY1QHx28H4rziiBV1OZD4molYhTTQ3ACCw08UNZZcOtgYDMpZZal8I7sQK
 KGkHbxlGl2c9C8ipzKYJW1r5s30q/TEBe7oBsWpEo3talwvCTdif7mapCW14Sb80CCLj
 zK4x6WrAYHKZL+s9FnS0q7JiHErWx3fVWVSq2i58K4XPXFolZblloZXG0uTVHO9b8VnO
 4J2Q==
X-Gm-Message-State: AOAM533JsHcIdq1boMMKoVszucn00Znm1DQZIOv87K7YcXnDGct82Hgr
 0KoGqqyjty3FlLzFiGMR+PCi7JEraPxoeOV625UTbTDwms7tYzTV6Mj+84ZinvgnEv/P2nxAlQq
 hpdwI9ZD1Nbjl3F9Ux5IrQFK5sX+u
X-Received: by 2002:adf:e544:0:b0:1ed:b6d5:d26b with SMTP id
 z4-20020adfe544000000b001edb6d5d26bmr327982wrm.634.1645634093140; 
 Wed, 23 Feb 2022 08:34:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBzj3eVsLKn39DYPTvyzPcJE9MCfAnVshf1YYTW2KZMiRN8LC5w3bIaIsgJsQ3ygOVbXPktQ==
X-Received: by 2002:adf:e544:0:b0:1ed:b6d5:d26b with SMTP id
 z4-20020adfe544000000b001edb6d5d26bmr327942wrm.634.1645634092830; 
 Wed, 23 Feb 2022 08:34:52 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id a1sm40095wrf.42.2022.02.23.08.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 08:34:52 -0800 (PST)
Message-ID: <33b80f9c-d54a-5471-a58b-7a783a7a9e5b@redhat.com>
Date: Wed, 23 Feb 2022 17:34:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] simplefb: Enable boot time VESA graphic mode selection.
To: Michal Suchanek <msuchanek@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
References: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
 <20220218160436.23211-1-msuchanek@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220218160436.23211-1-msuchanek@suse.de>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Herrmann <dh.herrmann@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Simon Trimmer <simont@opensource.cirrus.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-video@atrey.karlin.mff.cuni.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Michal,

On 2/18/22 17:04, Michal Suchanek wrote:
> Since switch to simplefb/simpledrm VESA graphic modes are no longer
> available with legacy BIOS.
>

Maybe you can mention that is the "vga=" kernel command line parameter
since that may be more evident to people reading the commit message ?
 
> The x86 realmode boot code enables the VESA graphic modes when option
> FB_BOOT_VESA_SUPPORT is enabled.
> 
> To enable use of VESA modes with simplefb in legacy BIOS boot mode drop

I think you meant "VESA modes with the sysfb driver" ? or something like
that since otherwise it seems that you meant to use it with the simplefb
(drivers/video/fbdev/simplefb.c) fbdev driver, which doesn't support the
"vga=" param as far as I understand (it just uses whatever was setup).

The name sysfb_simplefb is really horrible, because it is too confusing
and probably we should change it at some point...

Patch itself looks good to me though.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

