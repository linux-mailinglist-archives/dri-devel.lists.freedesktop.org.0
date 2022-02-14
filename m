Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4254B4506
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 09:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BCE10E1C7;
	Mon, 14 Feb 2022 08:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FC310E1FC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644829048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69HvyvUIhOkkZrR25T0A4ak3h9jrAFSNcZowRzKJYOE=;
 b=S+8esS/sO8zKkBRL9PTA+HE1LGGv0nZFBSFSSwTogQ6JAmOuHsycMbyFO3/IJhoc7CqdWg
 Dve8vOC5kAHRTyg+RjZI3LtfcJiPVSZE9ycK4IClp3qNjeRn+KkJeO7uvuYjif6d7Dhb61
 HUTvl/HRjBaltMXKcHhqnrt1Tq0es+g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-qyHfF4oSOja6sV3IY6dBzg-1; Mon, 14 Feb 2022 03:57:25 -0500
X-MC-Unique: qyHfF4oSOja6sV3IY6dBzg-1
Received: by mail-wr1-f69.google.com with SMTP id
 j8-20020adfc688000000b001e3322ced69so6633413wrg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 00:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=69HvyvUIhOkkZrR25T0A4ak3h9jrAFSNcZowRzKJYOE=;
 b=RXzi/84WGfN4jxMnwlz1v47Wl9bbVmLbWro5M8jZh81Ek4NmtaX/415IukZAek6eAx
 eFeW2lunJK6GHmMCPH1130VxVIpSVZcctPfztRGOQpFlkapH3mS12qlRjcedeer83N/w
 NjVruHWK6kGUwwO4OLVZP6ePJGcicuCSI/n89r34TPB2OuUKKKyp0xDwPEfms5sbHlag
 x+Tmw5aPAOQhmoAFBCQCYbpeTdKGB84+1gJHskUOuriduYAAagiP7ODmL2/CU37IH16T
 xrCGZtJRosOG5TO++PAnxRoRQRS0dM3oktvX87/qWOvX+MUE/4dKas/xPeryb3aq7VRe
 R6Ig==
X-Gm-Message-State: AOAM532EjDvbmXVuzMtv61MonI92kRzRbRcGkycfFUQ5cRtlUFwpQrKV
 dVzRYYzeh05IiPIUBWSnF898RCD8K7ne5uWbqufD5NqiZyTzhV35xrVqHUJrQiX4bTjkZofBf1Z
 Tg5s1q6pYhkCMOBEqAW80eO/8xkMO
X-Received: by 2002:a05:600c:501f:: with SMTP id
 n31mr10133004wmr.141.1644829044200; 
 Mon, 14 Feb 2022 00:57:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLJdMQROn0HBjGMEca6+PzxDVdcjo/+C+qxpaxDMr5SR2UrWB2rcNzjEWlQvJ11E6dtoU4Jw==
X-Received: by 2002:a05:600c:501f:: with SMTP id
 n31mr10132993wmr.141.1644829043953; 
 Mon, 14 Feb 2022 00:57:23 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id l20sm11561086wmq.22.2022.02.14.00.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 00:57:23 -0800 (PST)
Message-ID: <e50211b1-08fa-de09-8948-664493423c33@redhat.com>
Date: Mon, 14 Feb 2022 09:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 2/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_mono_reversed()
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220211143358.3112958-1-javierm@redhat.com>
 <20220211143358.3112958-3-javierm@redhat.com>
 <CAMuHMdUeqXs2PeV9s8+edPpOGodRT=it3g+fOTB7DuTuW2J9ZA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdUeqXs2PeV9s8+edPpOGodRT=it3g+fOTB7DuTuW2J9ZA@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

Thanks for your feedback.

On 2/12/22 16:54, Geert Uytterhoeven wrote:

[snip]

>> +
>> +               for (i = start; i < end; i++) {
>> +                       unsigned int x = xb * 8 + i;
>> +
>> +                       byte >>= 1;
>> +                       if (src[x] >> 7)
>> +                               byte |= BIT(7);
>> +               }
> 
>     x = xb * 8;
>     for (i = start; i < end; i++) {
>             byte >>= 1;
>             byte |= src[x + i] & BIT(7);
>     }
> 

I think the original version from Noralf is easier to read and understand.

It makes explicit that the bit is set if the grayscale value is >= 128.

[snip]

>> +void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *vaddr,
>> +                                     const struct drm_framebuffer *fb, const struct drm_rect *clip)
>> +{

[snip]

>> +       u8 *mono = dst, *gray8;
>> +       u32 *src32;

[snip]

>> +        *
>> +        * Allocate a buffer to be used for both copying from the cma
>> +        * memory and to store the intermediate grayscale line pixels.
>> +        */
>> +       src32 = kmalloc(len_src32 + linepixels, GFP_KERNEL);
>> +       if (!src32)
>> +               return;
>> +
>> +       gray8 = (u8 *)src32 + len_src32;
> 
> The cast can be removed if src32 is changed to "void *".
> For symmetry, gray8 and mono can be changed to "void *", too.
>

Yes, but these being "u32 *" and "u8 *" also express that the source buffer
contains 32-bit XRGB8888 pixels, the intermediate buffer a 8-bit grayscale
pixel format and the destination buffer a 8-bit packed reversed monochrome.

Using "void *" for these would make that less clear when reading the code IMO.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

