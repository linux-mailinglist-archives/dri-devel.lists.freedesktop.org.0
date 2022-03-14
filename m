Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67BF4D8675
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 15:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA8110E2BF;
	Mon, 14 Mar 2022 14:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E4410E2BF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 14:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647266868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1n9imp/roVGFW+MJg7Js2iXDtKYDylDPOOBQLufwOMo=;
 b=Ib7Pdsjf9S4oNapcCrEYDvb9D+sgnXAUpoPBex98vP0pq+qX/rUUst20SGJKrSmL+SBYnh
 6/A3zMb9MSxgkmNe8+N1yO9TZhX9ABkLiAtNdcAfZL2rpOJdaOrmFv9jjgG6wnliAJmLET
 yhcikAupQIvbLDXRtM06kaTDOJPwsGM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-rozsBg4PMq-gfNp5cOY_xg-1; Mon, 14 Mar 2022 10:07:47 -0400
X-MC-Unique: rozsBg4PMq-gfNp5cOY_xg-1
Received: by mail-wr1-f72.google.com with SMTP id
 l10-20020a05600012ca00b001f1e4669c98so4380959wrx.23
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 07:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1n9imp/roVGFW+MJg7Js2iXDtKYDylDPOOBQLufwOMo=;
 b=oaXJ250Q3RcfmM8A7kOqIRmvsyBwPhvpO/I5EC4lRwXb9i61QmJxgcRGRDet5qTqgu
 Kpu6sjWvbY1WhcVafSeFwR6ewlLwBbDCGVvQ8m57IT6UBX40MUlP95SS1Ulgp4cm0yKs
 ACrXtGAiLiG8vbTTueLH62vBNQLn3O0idi2AHsdlyIKfrPw9tmCR5uREMGdUUhjzjIGr
 99EDavIYts6C5E0auSl6QVmK34GVqI0F2+4A78woqT3tbteis8aRiV099OnYSY3uuq8f
 YQ4JFmkB+xBcJF8kqMYACBZ34xuUrPcn3dLBnM+mWieas+i3fnoowHiW1fZZmnz8XC/b
 0PaA==
X-Gm-Message-State: AOAM530XDkeOXozCPSyuKkf6w8ACQmbqniW8iNA4aiGkGUT2CD4XLmCH
 a6FLOny4Dqr4EfHkToTamJQyo0OjeuZYeTP9MoDK6r2H4sR1QYsbh4FYul1bJYQwr7BISibpMlS
 g2HCnXfAAu8ecaBQL3PyNNm8JNTHa
X-Received: by 2002:a5d:6daf:0:b0:203:8214:ae65 with SMTP id
 u15-20020a5d6daf000000b002038214ae65mr16784123wrs.145.1647266866162; 
 Mon, 14 Mar 2022 07:07:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUmZKMWpb2vbN6Fu8O0zteEWAjmmY/DHvyxw4A1qQVFF+i6VWRfQ9qS5Kjt/nNczT10/+Vzw==
X-Received: by 2002:a5d:6daf:0:b0:203:8214:ae65 with SMTP id
 u15-20020a5d6daf000000b002038214ae65mr16784102wrs.145.1647266865920; 
 Mon, 14 Mar 2022 07:07:45 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c214a00b00389bcc75559sm15441665wml.27.2022.03.14.07.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 07:07:45 -0700 (PDT)
Message-ID: <9b8bbc6a-e499-99c7-8fe6-95c4256ef61d@redhat.com>
Date: Mon, 14 Mar 2022 15:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/4] drm/format-helper: Add drm_fb_gray8_to_mono_reversed()
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-3-javierm@redhat.com>
 <CAMuHMdWPQrErbMZ4wJPgROY7XOnKGvimNFg8JpiyuWqz2a3Gzw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdWPQrErbMZ4wJPgROY7XOnKGvimNFg8JpiyuWqz2a3Gzw@mail.gmail.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 3/14/22 14:40, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Mon, Jan 31, 2022 at 9:12 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Add support to convert 8-bit grayscale to reversed monochrome for drivers
>> that control monochromatic displays, that only have 1 bit per pixel depth.
>>
>> This helper function was based on repaper_gray8_to_mono_reversed() from
>> the drivers/gpu/drm/tiny/repaper.c driver.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
>> --- a/drivers/gpu/drm/drm_format_helper.c
>> +++ b/drivers/gpu/drm/drm_format_helper.c
>> @@ -584,3 +584,38 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
>>         return -EINVAL;
>>  }
>>  EXPORT_SYMBOL(drm_fb_blit_toio);
>> +
>> +/**
>> + * drm_fb_gray8_to_mono_reversed - Convert grayscale to reversed monochrome
>> + * @dst: reversed monochrome destination buffer
> 
> What's the meaning of "reversed"?

Originally I took this helper from the repaper driver and it was called
repaper_gray8_to_mono_reversed(), so the naming just got carried over.

> During the last few days, I've been balancing between (a) "reverse
> video" and (b) "reverse bit order", but none of them seems to be true.
>
> (a) The code maps 0-127 to 0 and 8-255 to 1, which just reduces from
>     256 to 2 grayscale levels, without inversion. The result is also
>     white-on-black on my ssd130x OLED.
> (b) On little-endian, the CFB drawops use little-endian bit order,
>     which is what ends up in "byte" in the code below.
>

As far as I understand is (a) from the options since the repaper display
uses black-on-white. But as you pointed out the ssd130x OLEDs instead do
white-on-black.

I should had probably just name the helper drm_fb_gray8_to_monochrome()
or maybe drm_fb_gray8_to_gray1() ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

