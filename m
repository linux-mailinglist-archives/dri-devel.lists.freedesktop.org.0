Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2454BB53F12
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 01:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38A910E137;
	Thu, 11 Sep 2025 23:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cXeAQAB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C418310E137
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 23:25:27 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-24456ce0b96so15728955ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 16:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757633123; x=1758237923;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EQ0GHbXIsWeyBVWwhfEHNEV31kOGUvvbWv9Soahz7IQ=;
 b=cXeAQAB9ROV/zs1HG7X7HPxhYb1r0qloZSPtN2DPTriwp0XPmLntGQmMQHk2JC0HOf
 /mg6lh7OQSQlB3YQhYmTKFoXCq2f1Av/GmFBofRphfzydn5X7tjrhmvFyb2FBsSD6EpJ
 mxmbTLzT7fp73TREect0iSs1Ve2wrZSZfiOO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757633123; x=1758237923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EQ0GHbXIsWeyBVWwhfEHNEV31kOGUvvbWv9Soahz7IQ=;
 b=jCWWXj80V3+JDyRtafAqzQRuQAr+hRTXAc9v2ohixIJNdYGgMFTcSR9d6oUxY8NSm2
 9iSalK3Ayj/fe05RO6A1qCi8OoNPQL/QgM0Sp2Bayg+zUgFbrgAG5exx8o/2lKt6GPIx
 5MFCcpFjju+9RUDe1SQQTpg0aRG0RKHVRUKH2UgWu9XRW74imJXocNQVsu95RJiJn8Wb
 ofGzoEMSyW8l3p3mn58zGUI+H8VgzgiqqKL5wEqu4dADaXlr8HPWyzVQqqJweSSmjg+g
 7KIkeDIlQwr/+PRQSJ2p6GPcSxf46Qym/h9IZlNWy1Z5C4HUiK2aW/SWKbfSxWgTPThI
 ylDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvi2Or4qnZ8sz+ma7DjC9RayRSYMGv7WbiQ1DQ9o5LnRBDSgAJ1LbP81MfremjmNsxFqf8MfF82y4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3agmKYCdCS0yo7arQnNhPKjOzSbMXryHJSB0MxXOet1Uog+pd
 jrZ2VrgmPlwXod2357mHu8y3OOEL3oPxkN+D//L+eCtbxqeAmDlJTZjLqedy5z7LQiOKG3k8kqV
 Omy8=
X-Gm-Gg: ASbGncvzBSsVedZYxFAz2HAvCc2mKDUpZlu0K4IUL3rtEmSxuppjagns1DBv7ROyS3r
 +CaV6BHUTsf8t+1da3QRAtcsAwPuevn/OuJ3At8paWsoESdOpBLSHpj81fATvr/fW941ipJpkRA
 Ta1EbcbIkYX+KZYdlhppw0yldnfdqQu0d5r2Oh9TtnL091yAfOYHG2Pa6F86JHviR/kqUtc6Hv6
 qssbe/ylf9thDWGu4uo0Bvi5vFJAPL+VNsILysc8X8p+dmgD6SOw5CxLNMGI+IJFpmcQ6M9/+aW
 s1uDs6TnT8VTb3MdW+azKjP5FNDK7L2872916CAcIC7/oRE1LQfqFsDUAWteTnUFqvoZZOy6f8m
 lgmTUFv//5Ryug0NqY6qD2cCdN4fmac17KzOi863yBvUvxcnLsk7qs8qW2M/skyez6A==
X-Google-Smtp-Source: AGHT+IFtf7cl8loht8VDgq1Y2bWGbOq3msni1q3q6e88P0dWN4+CXfkGHIWMAeXgRxAId/kNg7t3xQ==
X-Received: by 2002:a17:902:a9c4:b0:251:a3b3:1572 with SMTP id
 d9443c01a7336-25babf0a953mr36034945ad.9.1757633123309; 
 Thu, 11 Sep 2025 16:25:23 -0700 (PDT)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com.
 [209.85.215.175]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3a84a772sm29221615ad.70.2025.09.11.16.25.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 16:25:20 -0700 (PDT)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b47052620a6so1627689a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 16:25:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW68dtej6tmhKAsODuK1ooatQXMef5m+AlqLl9rnNsxUWNXTVFEbXvbS6EX6c0hO3hJf3f4xQutP4o=@lists.freedesktop.org
X-Received: by 2002:a17:902:a718:b0:25c:4d67:4deb with SMTP id
 d9443c01a7336-25d2ab3e054mr7308115ad.8.1757633119650; Thu, 11 Sep 2025
 16:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=Um5NKHFZJJkC6eC0rnea0xSPeWVpK91PwGcrRjri28NA@mail.gmail.com>
 <20250911183928.2627172-1-john.ripple@keysight.com>
In-Reply-To: <20250911183928.2627172-1-john.ripple@keysight.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 11 Sep 2025 16:25:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WkbQeCaqHL3A3RzW9GhiLvkrZEbfLUFwfnx4LJQbUcWg@mail.gmail.com>
X-Gm-Features: Ac12FXy63C8f384F06Eg0_IkDCI5Cy8rcVbdBJeLpkWpw7PimcBa37NPwqPo22c
Message-ID: <CAD=FV=WkbQeCaqHL3A3RzW9GhiLvkrZEbfLUFwfnx4LJQbUcWg@mail.gmail.com>
Subject: Re: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
To: John Ripple <john.ripple@keysight.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 andrzej.hajda@intel.com, blake.vermeer@keysight.com, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 matt_laubhan@keysight.com, mripard@kernel.org, neil.armstrong@linaro.org, 
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Sep 11, 2025 at 11:39=E2=80=AFAM John Ripple <john.ripple@keysight.=
com> wrote:
>
> Hi,
>
> >...and you don't need to check for "dev" being NULL because there's no
> >way "hpd_enabled" could be true with "dev" being NULL. At least this
> >is my assumption that the core DRM framework won't detach a bridge
> >while HPD is enabled. If nothing else, I guess you could call
> >ti_sn_bridge_hpd_disable() from ti_sn_bridge_detach()
>
> I don't think ti_sn_bridge_hpd_disable() needs to be in
> ti_sn_brdige_detach(). The DRM framework should run the disable for hpd
> before detaching the device. I haven't seen any issues with it so far.

Sure, that's fine with me. So I guess the result is to just remove the
check for the drm_dev being NULL.


> >> @@ -1971,6 +2075,28 @@ static int ti_sn65dsi86_probe(struct i2c_client=
 *client)
> >>         if (strncmp(id_buf, "68ISD   ", ARRAY_SIZE(id_buf)))
> >>                 return dev_err_probe(dev, -EOPNOTSUPP, "unsupported de=
vice >id\n");
> >>
> >> +       if (client->irq) {
> >> +               ret =3D devm_request_threaded_irq(pdata->dev, client->=
irq, NULL,
> >> +                                               ti_sn_bridge_interrupt=
,
> >> +                                               IRQF_TRIGGER_RISING |
> >> +                                               IRQF_TRIGGER_FALLING |
> >> +                                               IRQF_ONESHOT,
> >> +                                               "ti_sn65dsi86", pdata)=
;
> >> +
> >> +               if (ret) {
> >> +                       return dev_err_probe(dev, ret,
> >> +                                            "failed to request interr=
upt\n");
> >> +               }
> >> +
> >> +               /*
> >> +                * Cleaning status register at probe is needed because=
 if the >irq is
> >> +                * already high, the rising/falling condition will nev=
er occur
> >> +                */
> >> +               ret =3D regmap_write(pdata->regmap, SN_IRQ_STATUS_REG,=
 0xFF);
> >> +               if (ret)
> >> +                       pr_warn("Failed to clear IRQ initial state: %d=
\n", >ret);
> >
> >Actually, wait. Why do you want "rising" and "falling". Isn't this a
> >level-triggered interrupt? Then you also don't need this bogus clear
> >of interrupts here...
>
> I changed it out for a high level interrupt and it looks fine. The IRQ
> line off the check also seems to only send one pulse for about 1.09 ms
> when the IRQ is toggled, so I think its doing a level interrupt since
> 1 KHz is way slower than the refclk. For 0xE0 the documentation also
> says "the IRQ output is driven high to communicate IRQ events" so I
> think you're correct.
>
> >...and also, I seem to recall it's usually better to not specify a
> >type here and rely on the type in the device tree. I seem to remember
> >there being some weird corner cases (maybe around remove / reprobe or
> >maybe about deferred probes?) if an interrupt type is specified in
> >both code and device tree and those types don't match...
>
> I couldn't find anything about this and all the other drivers in
> drivers/gpu-drm/bridge that use the devm_request_threaded_irq just
> directly set the irq type. I couldn't find any that read in the device
> tree for it. The display-connector.c general driver also seems to just
> set the type directly. Do you have an example where this is used?
>
> The tisn65dsi86 chip also shouldn't be changing how it does its
> interrupts, so having the hardcoded high interrupt in the driver seems
> like it would be fine.

Yeah, it's probably fine and I won't yell too much if you want to just
set HIGH in the driver. I think the one argument for letting the
device tree specify this is that you could conceivably imagine a
hardware design where this signal needs to be inverted at the board
level. In that case the board could specify "level low". That's kind
of a stretch.

Let me see if I can find an example of the problems with specifying
the interrupt level, though. Hmmm, I found one old patch that removed
setting the type from source code here:

https://lore.kernel.org/all/20200310154358.39367-2-swboyd@chromium.org/

Interestingly enough that patch also suggested not hardcoding a name
and using dev_name(), which is also probably a reasonable thing to do.

...but that patch didn't actually talk about any problems being
solved. It's possible that whatever problems were there are no longer
there, but I at least found some stack overflow question that sounded
like the problems I remember when the code and DT mismatched [1],
where someone mentioned:

> do you know why if I use request_irq() or devm_request_irq() for an
> SPI device (for which spi_drv_probe does almost the same as
> i2c_device_probe does), then after unloading the module and of
> course doing free_irq or even explicitly calling devm_free_irq,
> and then trying to load the same module again, I get an
> "irq: type mismatch, failed to map hwirq..." message?

As I said, maybe the problem is fixed now, but at the same time there
is something nice about the interrupt type only being specified in one
place. ...and IIRC the device tree validator gets upset if you don't
specify the interrupt type there, so removing it from the source code
seems nice...

[1] https://stackoverflow.com/questions/40011799/mapping-device-tree-interr=
upt-flags-to-devm-request-irq


-Doug
