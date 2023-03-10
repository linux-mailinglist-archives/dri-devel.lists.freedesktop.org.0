Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCB46B554C
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 00:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DF510E0CF;
	Fri, 10 Mar 2023 23:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE77310E0CF
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 23:05:57 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id g27so3082259ybe.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 15:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678489557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t1C5EaEX7RUXtbYsmEPMYf2+exssIXAhNPil5rJCHJc=;
 b=OzwRskF5Ih0lo0aILi+OoqYAwUlYwBG7zxkn3rbE69pckwIlvzquTfLYEFlP/lFB/q
 l0UepLZ2GlDrPh9DVI0tpvnKrTnSjtpOhOHGLcwFYeL7bxKMpMvb+nyF/Q3JHk2fjxys
 TbjJzP9lA5zBq21Jm7TguAabdqZpMqQTM9JTUlAkTtcIkxDcH9AdSL+V05EQO/RjmqDD
 YeUloj6KhxaVi7w9EWDEAGsvsjP9V60yRM9YThmwFbh2c+V7xVCgUte+7fEfiu3dq7/u
 yai9qCn/Cv+Sd0SDtFv2nB/yc5RQrJfTGqDH0VOAMcxtxin/75P1ktR+vz8Z2r4cGf2K
 WqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678489557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t1C5EaEX7RUXtbYsmEPMYf2+exssIXAhNPil5rJCHJc=;
 b=rTkk4KS/KaehdQ4Gof7d5LHLBOsotzN+DjhJN+2d9wRvvoMVU872TofETHq27B0tVy
 XH7SkyXByj5jST4BCu+VmAjeo5MOvj7b1I+XiMvN0a4RsFh6IKIx7iIKD2w4yC2zpl7/
 Qc/D3zk/7PySeL/miOIZOtJ/jTE3t8hPkr1xlW7YU2hx7a34ddsTvV00Wx23FM45XGbt
 IlOCCjA6TrQwAU7imrQKKWko7jEWjmftaDOM41tZvCglNXe1wt+xgLTYeC/TSt5b9/Hq
 e0gsMilr776pxMYmaO2JN+EE3aoT2XvqErfnvytgss9+cJay7ToL8fUlw3oHWm/N49xX
 TJsg==
X-Gm-Message-State: AO0yUKUa1w64wY3jlqHCrx0rqrh3NXzRSt29IKb7HeuUsksHiQcjdm1M
 d1R9ojyniupIKpmGIs8KDu3xHsNMzROUbcPRYcOVQg==
X-Google-Smtp-Source: AK7set/AXp8Coh32VeUVTutEizxPtbjJjz8lfxc31hn8uCQNy5KsUkfh9dktBb0fy9LNuoIzjVmbhAj73BsC0vyUcO8=
X-Received: by 2002:a5b:386:0:b0:b0a:7108:71e9 with SMTP id
 k6-20020a5b0386000000b00b0a710871e9mr2427934ybp.4.1678489556799; Fri, 10 Mar
 2023 15:05:56 -0800 (PST)
MIME-Version: 1.0
References: <20230310110542.6649-1-lujianhua000@gmail.com>
 <87mt4k95zp.fsf@intel.com>
 <ZAsgd4zsgbvWT0U0@Gentoo> <87bkl090ia.fsf@intel.com>
In-Reply-To: <87bkl090ia.fsf@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Mar 2023 00:05:44 +0100
Message-ID: <CACRpkdYwu5XKDcowggDMM0pSjuKdAJnZ8F92OdDyEWP7HJUC-A@mail.gmail.com>
Subject: Re: [PATCH] drm/mipi-dsi: Add a mipi_dual_dsi_dcs_write_seq() macro
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jianhua Lu <lujianhua000@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht,
 Thomas Zimmermann <tzimmermann@suse.de>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(CC Javier)

On Fri, Mar 10, 2023 at 2:52=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:

> >> > +          for (i =3D 0; i < ARRAY_SIZE(dsi); i++)                  =
  \
> >> > +                  mipi_dsi_dcs_write_seq(dsi[i], cmd, seq);        =
\
> >>
> >> This ignores errors.
> > mipi_dsi_dcs_write_seq is also a macro, contains error checks in the bo=
dy block.
>
> Ugh, I think it's pretty scary to hide control flow like return
> statements in macros like this.

The macros are written like this because:

#define mipi_dsi_generic_write_seq(dsi, seq...)
(...)
                static const u8 d[] =3D { seq };

Array of bytes

                ret =3D mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));

So we can use use ARRAY_SIZE() in the macro and pass in any
arbitrary sequence, e.g.

mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);

Any function-esque definitions will (as in your example) require a
length to be passed in so it would become:

mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01, 2);

And if you grep mipi_dsi_generic_write_seq | wc -l you find all the
245 opportunities to get that last len wrong and cause an out-of-bounds
bug.

I think this macro is the lesser evil for this reason, also it saves code
that you otherwise have to do manually, and one should never put
a person to do a machine's job.

Any suggestions to rewrite the macro using varargs welcome.
I think it is not very easy to do without the preprocessor.

Yours,
Linus Walleij
