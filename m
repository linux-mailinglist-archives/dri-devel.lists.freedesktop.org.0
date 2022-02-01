Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5A54A5978
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 10:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1120110E4C0;
	Tue,  1 Feb 2022 09:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FE110E4AA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 09:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643708947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgw5tIdcmG3vshG+0+gBxrtdGFyTyK1rBRl6JhXtTTs=;
 b=jDHrKLYoOVxrDiMVB0C1CGZx0xUGi8jziJTRfHAb7Tv2v38f2HtSFZH6zV+HJBFaEwD1LP
 NKa6DEo+5GWSuCuotXmdWzeqsXKgnERspsy9VSRdfm48CvW3mN6DT3Y/tnj576kFRDTCX7
 q6n6jmvv92qky/FUlVWtFSQE71zHuT8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-kfciIdofOlS2OcE5GHag5g-1; Tue, 01 Feb 2022 04:49:06 -0500
X-MC-Unique: kfciIdofOlS2OcE5GHag5g-1
Received: by mail-wm1-f70.google.com with SMTP id
 v190-20020a1cacc7000000b0034657bb6a66so3534628wme.6
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 01:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tgw5tIdcmG3vshG+0+gBxrtdGFyTyK1rBRl6JhXtTTs=;
 b=Ln98SdjgJwG1W3Zgv7kQk/KlBef0Z1AO6J0gpIv3ggGQ35/SLYG3atZ8w1Eg8+FaU3
 qgwzxKE7KDmoIgdHRJ1BtUkk6DWOoIbd7J2zbJuEhG2T5VlsHzWz54hJAMx68k2J8Bge
 N8yGaXywEtn38YQbyKy7bPk0TZxr4xaUiemGCnfEFN6uh3CDUz4YYVDtny+IfcNYg47H
 XaNnQar6wu4jXsfpSKvIJdzSWhhbvNl/DIE6oU4VL8bYhDRc596vCP3EGX8qt+n2FXh9
 imJR023PLObs5GXdsJ7s4RB++AIaJn6QZjJ7K6/1UOiT+NisUDl6CS9UZZ+9Kd+lHNhv
 mnYQ==
X-Gm-Message-State: AOAM530/7hpME2ZPOjnjNzw55mRXyAUY3edPlSUF6QcD8GT2T2+Ur7qA
 aJMGQVTau7ekXA4Mz6nJX5rJvAvjbII0qUO/1pzBhFrobEHacY/gFcaGq+kx2Y2iKtuVtqXJVjz
 ELLt6nyaf/LGqv08UMjXdv2f0jBqU
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr1026418wms.192.1643708945623; 
 Tue, 01 Feb 2022 01:49:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhdmeA5uA8GuAXm+vPaWNlMLqtSa4TRUAHzW7ciPujCzAtcTIso4F/n2y/BPseeK89sy1Vtw==
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr1026395wms.192.1643708945346; 
 Tue, 01 Feb 2022 01:49:05 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id n10sm17584320wrf.96.2022.02.01.01.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 01:49:04 -0800 (PST)
Message-ID: <b0788b3d-9c77-0e96-0969-380d21663909@redhat.com>
Date: Tue, 1 Feb 2022 10:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Simon Ser <contact@emersion.fr>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <tIMIWqepcZGntnez-1ss4Kn4K8btXnzDRL7EWd19-745WK90YIC19E_4di9RNvB3gtx-PzWEjBEGQLPNJE_x0T1yyyaWFCoFcCiG4StR9RU=@emersion.fr>
 <wuXPJN-K-rvjoV51c4EBmTBScov8rcJTPoYmlfHe04_-4wD1khVxo9HnUsP7UFd5m4AkzGSw2hXe_c77jbSRhjEJ0JZIYwuvuIkcv_KsR-Y=@emersion.fr>
 <CAMuHMdXKZ=BkvVqdpiNPNJgxm9SzQ3Z0n4SqV2-4oPRveybd6g@mail.gmail.com>
 <qmhzv6kqs6QdAOP3bNB39glOpc8eeJ6flgjfjcaBniT-shDKZkxo5uB71weGOUKxPE6dq_WBhtHmY5vMmuYwqMoHgtMWnX0ESE5R1Y5g5F8=@emersion.fr>
 <CAKMK7uGPuhrDf8fdDgfuPt5rzO30Rm54T7GvWb203NRbVoVDgw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAKMK7uGPuhrDf8fdDgfuPt5rzO30Rm54T7GvWb203NRbVoVDgw@mail.gmail.com>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/22 09:38, Daniel Vetter wrote:
> On Tue, Feb 1, 2022 at 9:34 AM Simon Ser <contact@emersion.fr> wrote:
>>
>> On Tuesday, February 1st, 2022 at 09:26, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>
>>> What's the story with the Rn formats?
>>>
>>> The comments say "n bpp Red", while this is a monochrome (even
>>> inverted) display?
>>
>> I don't think the color matters that much. "Red" was picked just because it was
>> an arbitrary color, to make the difference with e.g. C8. Or am I mistaken?
> 
> The red comes from gl, where with shaders it really doesn't matter
> what meaning you attach to channels, but really just how many you
> have. So 2-channel formats are called RxGx, 3-channel RxGxBx,
> 4-channel RxGxBxAx and single-channel Rx. And we use drm_fourcc for
> interop in general, hence why these exist.
> 
> We should probably make a comment that this really isn't a red channel
> when used for display it's a greyscale/intensity format. Aside from
> that documentation gap I think reusing Rx formats for
> greyscale/intensity for display makes perfect sense.
> -Daniel

To sump up the conversation in the #dri-devel channel, these drivers
should support the following formats:

1) Dx (Daniel suggested that for darkness, but inverted mono)
2) Rx (single-channel for grayscale)
3) RxGxBxAx (4-channel fake 32-bpp truecolor)

The format preference will be in that order, so if user-space is able
to use Dx then there won't be a need for any conversion and just the
native format will be used.

If using Rx then only a Rx -> Dx conversion will happen and the last
format will require the less performant RxGxBxAx -> Rx -> Dx path.

But we still need RxGxBxAx as a fallback for compatibility with the
existing user-space, so all this could be done as a follow-up as an
optimization and shouldn't block monochromatic panel drivers IMO.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

