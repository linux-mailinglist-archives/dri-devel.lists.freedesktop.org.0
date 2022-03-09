Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103104D2FA3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D7810E7A9;
	Wed,  9 Mar 2022 13:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE63B10E7A9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:03:24 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id c7so1614937qka.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:03:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=12vkeayAZrB46KbYGTQzYxqSQYZ5jeg6ghfEwNKBKIY=;
 b=r1A9FiwHD9v3aVlA4fNPzO55BwMEmTyVVZaitBmx147xwv8LhsoKMwKticBPPRbhJD
 E/wLpK3NAdQEbxdY8QUQDcDCmbvScNKa6OJ5O0HTo4Y7EwwdCEqGyECwdtgnIsO09Efr
 yefPCksosGRWFHUGECfy5Piso8X0/K297AfYq5wiMk8e9x54nUR31srKDKi/ZDxerXVx
 Jni+Xx8OE6zxDVU3kgOp41IAog1Set9mTm7jHdoCNUo9K867WnwykToHpkxKOlUd3PQu
 6caFl4sLHu3mrBMK2zqr05gkEzwQYv3S3ocQasCI9j2IqSnhnx59hjYu0pAsZoRV19WK
 SfMQ==
X-Gm-Message-State: AOAM530ON/mf/7jxdRoXoaa0ULYDnvroY+Fto9K3SqKOYVMV0GqxV/5Y
 YaNxQ1dBWPxRSNeQztI53Pg+ZjhKcNlfhg==
X-Google-Smtp-Source: ABdhPJyW+QoqBVjX6QuV7H6p1w1ZJ9K8CYY+zq2gxblbiZN40NZF2X4lagdqSxtbmeSHMnmTWRGuDQ==
X-Received: by 2002:a05:620a:4691:b0:67d:1e53:f46e with SMTP id
 bq17-20020a05620a469100b0067d1e53f46emr4491788qkb.247.1646831003538; 
 Wed, 09 Mar 2022 05:03:23 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05622a13c700b002de9f3894c2sm1273592qtk.50.2022.03.09.05.03.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 05:03:23 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id u10so4151784ybd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:03:23 -0800 (PST)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr16792727ywb.132.1646830616881; Wed, 09
 Mar 2022 04:56:56 -0800 (PST)
MIME-Version: 1.0
References: <20220214133710.3278506-1-javierm@redhat.com>
 <20220214133710.3278506-4-javierm@redhat.com>
 <CAMuHMdU+29x4ZHLAiPiReyLKw_VYBCCLw0bCoQmw9s6sQ4Bxcw@mail.gmail.com>
 <fd6ec463-f46d-0813-5d87-a00c07739e01@redhat.com>
In-Reply-To: <fd6ec463-f46d-0813-5d87-a00c07739e01@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Mar 2022 13:56:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUVWKee+Wm=EP49=5TAgqodPsMjkC2MHUfnyBDF_zt_Zg@mail.gmail.com>
Message-ID: <CAMuHMdUVWKee+Wm=EP49=5TAgqodPsMjkC2MHUfnyBDF_zt_Zg@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Wed, Mar 9, 2022 at 1:14 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 3/8/22 17:30, Geert Uytterhoeven wrote:
> > Unfortunately a regression was introduced since your v3: printed
> > text is mirrored upside-down. I.e. "E" is rendered correctly, but "L"
> > turns into "=CE=93" (Greek Gamma).
> > I suspect something went wrong with the display initialization
> > sequence.
> >
>
> Could you please try Chen-Yu's fix for the COM scan direction mask ?
>
> https://lists.freedesktop.org/archives/dri-devel/2022-March/345915.html
>
> I made a mistake when converting to use the GENMASK() and FIELD_PREP()
> macros in v4 as suggested by Andy. The SSD130X_SET_COM_SCAN_DIR_MASK
> wasn't correct which would explain the output to be vertically flipped.

Thanks, confirmed fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
