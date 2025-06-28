Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C16AECA24
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 21:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDFB10E1D9;
	Sat, 28 Jun 2025 19:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ggJx8scz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E2910E14F
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 19:58:58 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-adb2bb25105so141013866b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 12:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751140737; x=1751745537; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aCn/x9JPsOm33ynQom2R0U43CTIFPTCUTDASBrS4OXI=;
 b=ggJx8sczFqptPkB/MdK6PCXb+uWmAj5CK61ZnYDsaWJslT4KSO9MtwldMSrRb7QDE3
 PQO4emtbJdgQ8FMnQvRMo0MKkLEWvLthyJFwRTOhAvA5rQeKhjcjnaVFXhns17YQS4wd
 UzxW+sm3ejZMNV28wCvcn5xmnnGQcW7XNTiXWaobtIO+VW+DDKDYX7zVx3RcQtXU1CvJ
 NZtiA4q2iqI4uPkoW/QdY1XGH42Klkx5dHcrZyIAqx7m29ck8d6wKuosob74KvTVOVZW
 X8dPPZs8xbs0e/cZsZKAY2CO/DhGIW1/N9kXrSV3aIx+WZbhZtGAatTK2byOQz+b3PCt
 58YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751140737; x=1751745537;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aCn/x9JPsOm33ynQom2R0U43CTIFPTCUTDASBrS4OXI=;
 b=W4EAafu6YpNM4+uyXbtXZkj/R0l5RMjKb4fvWfrZMySBOmJC7lguXte+fe6WUsOAob
 /bWBwJDY8ZsExUbuXsZcXPohWy0zyTN/6FWwD73+1Dcw/NPDQTkLJBV+vd6B9S/55h2i
 J9QydWGfT8mpDZ94hSdbp/iTX0kCEM90m8qLivc3c6j0cQ20mgta584InNqrwNVQpY/z
 uwE4LUrcAm0du7YneOfopF/HgqIh0p5TwxZVHkg0DJbB/Sb1De6e37jruFR3XCmRkyri
 y/B/dRgqOVOd4o1ij3Hk8w47mY67aIWVSulT8DbRT8dZVFv3zMukg8ziLpS+xwcElvWf
 WvgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ2yihOI+pAmvjNjfavqi6/r6u9WmhisnMsrTWX7KjiwRsrcoCzcgXOidnM/eWNhty6BQbhUFkyxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT1OzewkHXzXhCVq0at/2qWCe/mJ70su8dIwnlyUgqsQ5RWd21
 yrFVwfUb0UHe3l/BsAqYHMszpUbk5DHBwrRPoe+Yt2MVO8mGT1yTfp6q6cSKM7GxYYFUS9EUuKG
 xqkKia5JoV0sgTONBiQTW2zbnCKHgvt0=
X-Gm-Gg: ASbGncvqG83kbOr236ANuWrxR1mCDVWt0ge+R5sdlbE7zhVn09LiuCw0ZN88zcDqyF2
 HHSRUakw322lOWDh+gYkwrnI89tRjM6OpqpIiuvFDWmQ7wAsZkdQnhepxK9WQAfNW3p9EJ1rmlk
 mOE6Uwmr4TyAy0xVd8B1Z1SOZ4Z+NydkSViXsYAYfMCJM=
X-Google-Smtp-Source: AGHT+IFZBR8kfJGqRmjGfZ/IXkon+9o2g1PGlOtiW+bEm/EExm5FRtNH3McMm2rCL6PA4ZVg+vgD7F1bxOQqfxd3U4I=
X-Received: by 2002:a17:907:fdca:b0:ae3:6744:3675 with SMTP id
 a640c23a62f3a-ae367443a67mr510956766b.48.1751140736917; Sat, 28 Jun 2025
 12:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751086324.git.abdun.nihaal@gmail.com>
 <62320323049c72b6e3fda6fa7a55e080b29491e8.1751086324.git.abdun.nihaal@gmail.com>
In-Reply-To: <62320323049c72b6e3fda6fa7a55e080b29491e8.1751086324.git.abdun.nihaal@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 28 Jun 2025 22:58:20 +0300
X-Gm-Features: Ac12FXz962GwXR5F2ZukYapM3EMaS4H-TNlh4C4kBY22Qq3L7dSM227zM9FUxAg
Message-ID: <CAHp75VeSYesZuJ-NEfEAvaRepEUtdLmxGrYmthD1YkSg-bsK_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, dan.carpenter@linaro.org, gregkh@linuxfoundation.org, 
 lorenzo.stoakes@oracle.com, tzimmermann@suse.de, riyandhiman14@gmail.com, 
 willy@infradead.org, notro@tronnes.org, thomas.petazzoni@free-electrons.com, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
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

On Sat, Jun 28, 2025 at 7:59=E2=80=AFAM Abdun Nihaal <abdun.nihaal@gmail.co=
m> wrote:
>
> The error handling in fbtft_framebuffer_alloc() mixes managed allocation
> and plain allocation, and performs error handling in an order different
> from the order in fbtft_framebuffer_release().
>
> Fix them by moving vmem allocation closer to where it is used, and using
> plain kzalloc() for txbuf allocation.

...

> +       struct fbtft_par *par =3D info->par;
> +
> +       if (par->txbuf.len > 0)

Do we really need this check? If txbuf.buf is kept NULL (please, check
this), the kfree() is NULL-aware.

> +               kfree(par->txbuf.buf);
>         fb_deferred_io_cleanup(info);
>         vfree(info->screen_buffer);
>         framebuffer_release(info);


--=20
With Best Regards,
Andy Shevchenko
