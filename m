Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943379F92BE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 14:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F20810E383;
	Fri, 20 Dec 2024 13:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aqO5Z1JS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B3A10E383
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 13:02:10 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-6ef4b6719d1so16437417b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 05:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734699729; x=1735304529;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fu02/Fmh4ZbtCqxR5/+0fGOTzDcq8jLPwYadQJ7QU4I=;
 b=aqO5Z1JSKkyz/dX21Wjb933QDZfFTmxN4gvFCd4FrPSrVIfGjm5R4QyR2i1BzDWn2E
 uIKmJyTielX7dlgftfegAuAL6xP8Co+sYcsRg+UbVH4vPr6VaLsUIP+QxCh48w+9CUvR
 tDQFRN3g+sTHR5ie3UGcM2j1nluJphmoSj+t7yvCITpm5JMo7XE1pSXdGScxK+lbjhvL
 tn3Sh19/fOJjO63YMp5CMZ3lM02RQ15I0YWStGYbEB123R872/Af0cr86LKaaoKMpcQc
 gimKw/HeHyCjd4qHWNtdDedBfAMJ16ct2JJjwmskl/EMWNCV7jOU+3mjK6OxfBk8tNL8
 lVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734699729; x=1735304529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fu02/Fmh4ZbtCqxR5/+0fGOTzDcq8jLPwYadQJ7QU4I=;
 b=KSwDW7vZtzP6NrbxKrlfztb8tIVX7i8HPrUq3shFDCb2SeOKWGSEQLKWQnHxsod/sd
 Jkk3C3N5YFhPjUWs0stnS41zb/8UxVlJD1QdxC1qiVxxt19DA75o+cMyGSKWIr3cEnns
 fyD5GT0ctE7I4fd+e1EiwouF8GF7fwz9pLGxEDVKIRkewKN+2DkpvRySmki2VFhMZ05e
 G2+dLK+u7SP/jrTw1DpRrj7FknbZDJ4JlOspRSbfNf5OB2a9skLlagegRt/hE9P209M+
 nEjE9bhhCk5WQsG+A0xOQfpXtz5BLj6axO+tIb2BrBmT+pLSc23FOuaS1odSPhWUGtYS
 IhoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrOixvfoG76ruGFULvQlIeX2XBK2j0PMpcIU24ISe1MMtGuAWHxb7Vqjkvy2XtT2Pn7OIKPQSJ4m8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFiIR0m9W8tO1SWYEzNXcvOo41d6Q/EfHKbUxguaH4YmowrnIq
 OcjNJ24dItJWWeITxnQ1/H3nBlmYKLDqxRRy4984vvuDenM6m8LiNfYKLm3BQbAr0f8rZ/3QAVx
 UT+LJIcUWDcpRrc4UdJUR6TAOGrLgjNgn9DTe3Q==
X-Gm-Gg: ASbGncugGbSCTDL6Z5jiUQmi7c6hlXXQDyFfIQtYyI2kAJ3wxoLZ1Ae4GowAaQr6NKR
 g3aqg0NL+A88jyYUwIl6CWR7oOGl3xzWsqLgbsQ==
X-Google-Smtp-Source: AGHT+IFzQLWMZQE/IRCrzQuJ49iVkiuSr8lSUXTeAQq7Q5a0dorvlXsI8IoArLc+t/qm0OgPgCykCrt4mTj6yv3UQxo=
X-Received: by 2002:a05:690c:368f:b0:6ef:60db:5e8d with SMTP id
 00721157ae682-6f3f80d626dmr17834807b3.4.1734699729509; Fri, 20 Dec 2024
 05:02:09 -0800 (PST)
MIME-Version: 1.0
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
 <CACRpkdaB9kqcjmhaXd5RxpYvqdSVMZkj0wHAtEgdqDs03+wzJg@mail.gmail.com>
In-Reply-To: <CACRpkdaB9kqcjmhaXd5RxpYvqdSVMZkj0wHAtEgdqDs03+wzJg@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 13:01:51 +0000
Message-ID: <CAPY8ntBJqukSJs7VUXvUFAsiKqNWknL8VjgtQG_VAEmw576EPQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names
 property
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Eric Anholt <eric@anholt.net>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Wahren <wahrenst@gmx.net>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org
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

Hi Linus

On Fri, 20 Dec 2024 at 12:50, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Thu, Dec 12, 2024 at 7:36=E2=80=AFPM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
>
> > gpio-line-names is a generic property that can be supported by any
> > GPIO controller, so permit it through the binding.
> >
> > It is permitted to have a variable number of GPIOs per node based
> > on brcm,gpio-bank-widths, so define an arbitrary maximum number of
> > items based on current users.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you.

> Perhaps Bartosz can just apply this one patch separately?

I believe he already has, but commented against the cover letter
rather than this patch -
https://lore.kernel.org/linux-arm-kernel/173434013318.38429.808413721248542=
013.b4-ty@linaro.org/

  Dave

> Yours,
> Linus Walleij
