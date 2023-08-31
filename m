Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F52A78EE5B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 15:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902C710E194;
	Thu, 31 Aug 2023 13:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C4510E0D3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 13:16:54 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a9b41ffe12so470935b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 06:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693487814; x=1694092614; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rvjEwhjKTzM24zTtto0X2hNb/4jBUMlTIyxRYyU31F8=;
 b=Cpw0EVnX9zxdwCJjk+r/SObVRmFCB7UHx/zZz3wogKTbQ6+4eebFvNm8bke86xCJJj
 mC3XB+e0hjiHTTr8XzVUJdMUYkllzDQSijx/e71F9PCARi4Kz8e7/t4UDhWqlWaJLIY/
 +y4K8Q6JiXu2hLo2wKJahuQAVQLFuMGlUYu7tUcVUqP8NfuhAK6WIscElEYg/J/nH7ll
 14eAUeww54dE9ye5Ot7vXoCZzkD/VunEiWpaKN9u1y9y0McA9GtDaX3SuVhBLtdix9Bs
 RNOx+tFaZ4EsiaPui34KwkGtX29czNDU+UXUIHaNav0c6Lt0J5AhFd5u6cEFM9l2D59A
 dZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693487814; x=1694092614;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rvjEwhjKTzM24zTtto0X2hNb/4jBUMlTIyxRYyU31F8=;
 b=HNoEmYpY3zRxJdO9Lt8KuksxbKR15cIqhOqwTrTR5rk1UP77Kq9lS6mly/XzVWrs6D
 eaVECmX4wuL0PepmPW/OJY0TyrptNE/F2FAzEJs7FoTeWmolOEDEIYo6iKpvMcyscXlf
 Iv96QIWIaDIMvFmsh7DOzkQoOj/JG/Q7FeAX13uqNiKtTALFcEYhysfHd8mCe3iFgu25
 boJKO7ZLjIMO0XzOm/VKd1C6cuXJ+t79rblrxKolloE7YChrNGSEgzmaCXQHORVd52fq
 GO/7bMrpLgSRWfkvJsSwohWBuYX7//mozqws3Bm7Wy+PxuiagsNIgCmAr5VAdclS279j
 nLYg==
X-Gm-Message-State: AOJu0YxVCbia9X+dkKqsCmtF9ZQzkMBccGQM/OTqDhbuZRBi9GVHI5/C
 YL+kOpNA58VKbUAYHDkt5ZQxZFP1dQGQrBJQzAU=
X-Google-Smtp-Source: AGHT+IE2FhmXyXLAGk+I6c1o0xIfxttEXs+4SdO383eHQBc9YsKQBViTBEroy3HH+mR8crJU8XS0nKNDFuN6ocnrv+8=
X-Received: by 2002:a05:6808:b:b0:3a3:91f8:d3da with SMTP id
 u11-20020a056808000b00b003a391f8d3damr5224234oic.13.1693487814147; Thu, 31
 Aug 2023 06:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693386602.git.pstanner@redhat.com>
 <46f667e154393a930a97d2218d8e90286d93a062.1693386602.git.pstanner@redhat.com>
 <CAHp75VfkzV-=XuEZwipYzfHNu4EXuwzbu6vfEKh1Uueseo2=wA@mail.gmail.com>
 <94b893ef37fe0cc0bcc52e8b54c62be3853a7bbb.camel@redhat.com>
In-Reply-To: <94b893ef37fe0cc0bcc52e8b54c62be3853a7bbb.camel@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 31 Aug 2023 16:16:17 +0300
Message-ID: <CAHp75VcNyE9uJu8-v2eVWRdZ3-nm2r-kdxE-naQB4VN6zxPFxg@mail.gmail.com>
Subject: Re: [PATCH 1/5] string.h: add array-wrappers for (v)memdup_user()
To: Philipp Stanner <pstanner@redhat.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Siddh Raman Pant <code@siddh.me>, Kees Cook <keescook@chromium.org>,
 kexec@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 David Disseldorp <ddiss@suse.de>, Nick Alcock <nick.alcock@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 3:22=E2=80=AFPM Philipp Stanner <pstanner@redhat.co=
m> wrote:
> On Wed, 2023-08-30 at 17:11 +0300, Andy Shevchenko wrote:
> > On Wed, Aug 30, 2023 at 4:46=E2=80=AFPM Philipp Stanner <pstanner@redha=
t.com>
> > wrote:

...

> > I'm wondering if this has no side-effects as string.h/string.c IIRC
> > is used also for early stages where some of the APIs are not available.
>
> I forgot to address this point in my previous reply.
>
> Who's going to decide whether this is a problem or not?
>
> My personal guess is that this is unlikely to be a problem because
>
>    A. either (v)memdup_user() is available, in which case
>       (v)memdup_array_user() will always work =E2=80=93
>    B. or (v)memdup_user() is not available, which would cause the code
>       that currently uses (v)memdup_user() for copying arrays to fail
>       anyways.

It also uses something from overflow.h. I don't remember if that
header was ever been used in early stage modules (like
boot/decompressor).

--=20
With Best Regards,
Andy Shevchenko
