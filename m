Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F061187AAEB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 17:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DBE10E58C;
	Wed, 13 Mar 2024 16:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MYvwac/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9620810E58C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 16:08:20 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-5d81b08d6f2so4765388a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 09:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710346100; x=1710950900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P6ULIWkqwYtQwHi0nH3X4LEjPNLviw6dhHiCy7dWpr8=;
 b=MYvwac/Cf4mcQyJzjiIMnYn+Ycmui6WFuXUS6y1Lyg+XAlPViTuewnUzL6oiYjtReg
 7G7fqz1CSOZT1qyjtkbt+QWWCHFnAnw0VIHpe8l+LEe1PFTGw9XeCwc0CyE/krFAhHG/
 3pILStzZaGIo5tu3zQazlUpgmM9YoMLil69Uw59SW/ek2pZvPR9UBfWW28bHBxFCgWPd
 LaQsoH8dPqaRFl3WbPuj6b0l1vW46FIfrazhH5c2v59174Cikq45LrTtc2JdyqUIdRCQ
 WKDYnVZO1G2sMq4jDwSF76VdklrifV2ZmF9GpzYTXkQehCT5lcfupSQzdNN9QD3bsR/L
 oecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710346100; x=1710950900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P6ULIWkqwYtQwHi0nH3X4LEjPNLviw6dhHiCy7dWpr8=;
 b=CQgpm9RGSUiiqDRoG5n8oKw0FYw1l7QFAyT/XnPOjiavWu8GeVbf525BA8dI+N6aBR
 zPdkR/pdnE2r4NlnEQtQOyjRiKh+Q9Ri2el03IRfpiRAsp7TZShHlJ994tTepko78aeN
 GnaHl58n30Phf9vw82j+9ZXlPtVvNEexb0/PH918pPjAjjRzxhfUhkEGr2lROED9vr3b
 UjhV29iFxrZaMhOLwjw/3Ovj0WwihSipQDVJdDARzJ6E9lUWiaBoayRCbI3rrUnDgJa3
 h+8itRG3BGWW2gH+YS7GO5VYm5W9MPIvbRRiE670WQWrOhPVAdkY0xTtiuYWxEgM6Ei7
 OTEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ5UPPD3LVaJ4uNT/DWtKoM3CcSyW3Hrs0pA89gaNBWQdAhOAPc5LCvF856B38BIKHIDb+iEm+SlsCIZbhbvAAng1uXzKItGfePu6MC3xS
X-Gm-Message-State: AOJu0Yza/NBu7NNwhKG5/qhfGPEWUc2s1F6pnE6/066tK8cQDe1rLpX/
 8LVm/Tm+s4xW3arlYEae3nqbWSJQx9wSurP6MWl3JWzDHtfLRRSpJm6Wn5eBui/8yuMGieH6+T5
 DRYgm0dph2t/9qAzG1PnsFJszxVg=
X-Google-Smtp-Source: AGHT+IFw4NlwXdq8k5AaP0t6MV8Oqx6Tr91pjx5TGQukQAekNWRrB6XIh8BPrzA3MuN0QBTfxmlK7KxNwQu9LllcLBE=
X-Received: by 2002:a17:90a:a008:b0:29b:bbde:8f19 with SMTP id
 q8-20020a17090aa00800b0029bbbde8f19mr3568139pjp.33.1710346099732; Wed, 13 Mar
 2024 09:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-2-tzimmermann@suse.de>
In-Reply-To: <20240313154857.12949-2-tzimmermann@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 Mar 2024 17:08:08 +0100
Message-ID: <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
To: Thomas Zimmermann <tzimmermann@suse.de>, Andy Shevchenko <andy@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
 deller@gmx.de, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, Robin van der Gracht <robin@protonic.nl>, 
 Miguel Ojeda <ojeda@kernel.org>
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

Hi Thomas,

Thanks for this!

Cc'ing Andy and Geert -- the new maintainer and reviewer.

Also, a couple quick notes below since I am here...

On Wed, Mar 13, 2024 at 4:49=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Replace the use of struct backlight_properties.fb_blank with a
> call to backlight_get_brightness(). The helper implement the same
> logic as the driver's function.

It is not exactly the same logic since `backlight_is_blank` accounts
for `BL_CORE_SUSPENDED`.

> -       int brightness =3D bl->props.brightness;
> +       int brightness =3D backlight_get_brightness(bl);

This can be `const` now (or even removed and have the call embedded below).

Cheers,
Miguel
