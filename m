Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F07894D302A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1F810EB30;
	Wed,  9 Mar 2022 13:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B57D10EB2A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646833405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNwPCyT8wmbEfZK8P/i6Q32UvGlt9pDVFx+4Sf2sAjk=;
 b=AyaFMgPDjF7TztGL/md6DUZLlPXReEVG7Ae7SjFrPqt2WajvjhMdPTq5jmgPypudLyuqVU
 UdxB7lHU5ROxV6DokKFxY1KKpp9a10w/Q8ZZzhIgAiBieOlELGkTmQzTyABmkuFqZNmOjK
 qDNeb2vHI223kDcXsTrurUFEjSwL860=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-6oqCexLIMA62g9fjw-zxiQ-1; Wed, 09 Mar 2022 08:43:23 -0500
X-MC-Unique: 6oqCexLIMA62g9fjw-zxiQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 d8-20020a05600c34c800b0037e3cd6225eso806657wmq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DNwPCyT8wmbEfZK8P/i6Q32UvGlt9pDVFx+4Sf2sAjk=;
 b=qPgWSt1CFZXmt8gYzMg4LFcXMSIy11WyA2mfFfqCDfa19PJhd6YzDh+cA7WbF3FIIT
 BT6RdI4xRsD8a5bMOEprmPB5VNctfShHFNRudAc5v/wh7fZ4AXQzbEvVlmmIpHW7Pbaz
 zezXPkiXi7FUnG2uKkb/VrUbxyB48qA1jQ1xOYtwQ3vzILeHfHUDtq1B4a8Bilk+oy2L
 nWflmBXl7qhFnQHqquy4g1Nac2GXl09pO+HCfeuKhGl8cwO9jdKX0+U5ZyKDFCnVEQEs
 xZyP7Zhj52X7Jo+NbTpLdM5X49AVG+QRpkTiB9DHAnzjWli+popW9gdygL1vUThF2X/R
 K1eA==
X-Gm-Message-State: AOAM530E5XVxB5mQFf8LMx7KJWNhpC3Tqu2O7U9NOcbw0mpLTOCOMCfp
 ZBmAVt+CSW1lgvMU8QRg9iWD7kyPlfKKi7ioPx5Fp2LDtmBHDIZmD4RlTv6fgRzEysyZYcKn4z2
 sHD2SNnsE2rJdzx0r7VxcUOmQt+nW
X-Received: by 2002:a7b:c8c2:0:b0:389:9746:847c with SMTP id
 f2-20020a7bc8c2000000b003899746847cmr7696212wml.156.1646833402439; 
 Wed, 09 Mar 2022 05:43:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSJ8Ywl1f4YowLEemqy29qqclDeVGuf5169bKODTz+Q+zNq8dX3nn3Xb5FN4RwNdJP8Nhbdw==
X-Received: by 2002:a7b:c8c2:0:b0:389:9746:847c with SMTP id
 f2-20020a7bc8c2000000b003899746847cmr7696194wml.156.1646833402233; 
 Wed, 09 Mar 2022 05:43:22 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 p11-20020adf9d8b000000b001f063deef80sm1653234wre.86.2022.03.09.05.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 05:43:19 -0800 (PST)
Message-ID: <bbb4f088-e6f8-52b6-c673-6e30583cbe57@redhat.com>
Date: Wed, 9 Mar 2022 14:43:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220214133710.3278506-1-javierm@redhat.com>
 <20220214133710.3278506-4-javierm@redhat.com>
 <CAMuHMdU+29x4ZHLAiPiReyLKw_VYBCCLw0bCoQmw9s6sQ4Bxcw@mail.gmail.com>
 <fd6ec463-f46d-0813-5d87-a00c07739e01@redhat.com>
 <CAMuHMdUVWKee+Wm=EP49=5TAgqodPsMjkC2MHUfnyBDF_zt_Zg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdUVWKee+Wm=EP49=5TAgqodPsMjkC2MHUfnyBDF_zt_Zg@mail.gmail.com>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 3/9/22 13:56, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Wed, Mar 9, 2022 at 1:14 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> On 3/8/22 17:30, Geert Uytterhoeven wrote:
>>> Unfortunately a regression was introduced since your v3: printed
>>> text is mirrored upside-down. I.e. "E" is rendered correctly, but "L"
>>> turns into "Γ" (Greek Gamma).
>>> I suspect something went wrong with the display initialization
>>> sequence.
>>>
>>
>> Could you please try Chen-Yu's fix for the COM scan direction mask ?
>>
>> https://lists.freedesktop.org/archives/dri-devel/2022-March/345915.html
>>
>> I made a mistake when converting to use the GENMASK() and FIELD_PREP()
>> macros in v4 as suggested by Andy. The SSD130X_SET_COM_SCAN_DIR_MASK
>> wasn't correct which would explain the output to be vertically flipped.
> 
> Thanks, confirmed fixed.
> 

Great, thanks a lot for testing and the confirmation!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

