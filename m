Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314635409D9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 20:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459CA10F107;
	Tue,  7 Jun 2022 18:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B6010F107
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:15:26 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id c2so24036615edf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 11:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lANEaRZF8RNlGQuEjAUuCnlc1k8UC96t1LkjmMu7vvs=;
 b=gsCc3TvjLneSHG/GMjspzmVXJk8TNOJ8UT6qlP4EOH6kvkrxzAaJXttxEyf4ZD8SkL
 s66S60CaayzPMN6BMjs/lZf1xjYPrMCmXs/KcnpQvQqJSX5JOHaqjVzqpx2cYgAk8b0W
 8E+vMj04FOfMjKT2XIjjIVYWclACVZJqmBOTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lANEaRZF8RNlGQuEjAUuCnlc1k8UC96t1LkjmMu7vvs=;
 b=vEn7SdHdWvxRa7uSGdmVMHzDglkduW+N5WAYe0kx8zH4quM3A1q95aIwFS6D+2P563
 s3g7iV/cv2uoPuDjMRrQ56sdF+dsx9XynF3sP6WYc6D4S8iSFsNTlwgHlMvNuG/RHcb+
 WB9s2vsqfeyX6kS+E7rTVuLQZ11y886raM+6GHBvDexR5jY3PIrORGBwUvm81kqFVz13
 Qw4crzsshIo9jNGDq0RXiizRLl54yLMSt0GJXuXpTxIHN/DQE8kDL7bu9DSuhVwQbKh+
 nlWD0nvlKg2zZXrouZKf0rwC31Z/4nb3tUW7EDmyqAkvTgvAIOLVgQ/fsrZIgy+n/aC4
 mmCQ==
X-Gm-Message-State: AOAM532VzhM5vQQGXcLTP3BLJiPhaMJ0PQ0oxH8naue129eyTqN0mxkp
 Fmaof+4G8zsyU9xQZF+WU2Z9rDF0H8RM01GLdbk=
X-Google-Smtp-Source: ABdhPJxg0wfd9RwxJ2wtKFDXi3WzaRSkzK8Q0pNJppjIIFwfBZeJ3/W6mKH3BTVdOD5qtZjOpx6gcQ==
X-Received: by 2002:a05:6402:524c:b0:42e:320:bfbc with SMTP id
 t12-20020a056402524c00b0042e0320bfbcmr35393848edd.65.1654625725024; 
 Tue, 07 Jun 2022 11:15:25 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 x9-20020a1709064a8900b006f3ef214e2csm8185699eju.146.2022.06.07.11.15.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 11:15:23 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso4162240wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 11:15:23 -0700 (PDT)
X-Received: by 2002:a05:600c:42c6:b0:39c:4bfd:a4a9 with SMTP id
 j6-20020a05600c42c600b0039c4bfda4a9mr15814099wme.8.1654625723046; Tue, 07 Jun
 2022 11:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw62EZfAm0PbiOPmMrpfR98QMFTWGEQcA34G4ap4xxNkA@mail.gmail.com>
 <CAMuHMdXb5-gOVRsQx6tDqjQMD9cC-p=o56VuF2cBPWyMFRgHMA@mail.gmail.com>
In-Reply-To: <CAMuHMdXb5-gOVRsQx6tDqjQMD9cC-p=o56VuF2cBPWyMFRgHMA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Jun 2022 11:15:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgcv_YewP0rgwR1+gj3YF-7Jz8WPVzDgndx0DVMVKzV=Q@mail.gmail.com>
Message-ID: <CAHk-=wgcv_YewP0rgwR1+gj3YF-7Jz8WPVzDgndx0DVMVKzV=Q@mail.gmail.com>
Subject: Re: [git pull] drm for 5.19-rc1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 7, 2022 at 3:23 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> These header files are heavy users of large constants lacking the "U"
> suffix e.g.:
>
>     #define NB_ADAPTER_ID__SUBSYSTEM_ID_MASK 0xFFFF0000L

As Andreas says, this is not undefined behavior.

A hexadecimal integer constant will always get a type that fits the
actual value. So on a 32-bit architecture, because 0xFFFF0000 doesn't
fit in 'long', it will automatically become 'unsigned long'.

Now, a C compiler might still warn about such implicit type
conversions, but I'd be a bit surprised if any version of gcc actually
would do that, because this behavior for hex constants is *very*
traditional, and very common.

It's also true that the type of the constant - but not the value -
will be different on 32-bit and 64-bit architectures (ie on 64-bit, it
will be plain "long" and never extended to "unsigned long", because
the hex value obviously fits just fine).

I don't see any normal situation where that really matters, since any
normal use will have the same result.

The case you point to at

  https://lore.kernel.org/r/CAK8P3a0QrihBR_2FQ7uZ5w2JmLjv7czfrrarCMmJOhvNdJ3p9g@mail.gmail.com

is very different, because the constant "1" is always just a plain
signed "int". So when you do "(1 << 31)", that is now a signed integer
with the top bit set, and so it will have an actual negative value,
and that can cause various problems (when right-shifted, or when
compared to other values).

But hexadecimal constants can be signed types, but they never have
negative values.

                 Linus
