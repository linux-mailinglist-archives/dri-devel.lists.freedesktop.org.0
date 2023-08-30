Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D31F78D668
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D7410E4D0;
	Wed, 30 Aug 2023 14:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F14B10E4D0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:11:58 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5735282d713so3024248eaf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693404717; x=1694009517; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QkS0efXVCy8VZ5VmSKwsFXPwQqBxWGJyzZuacJMQHs0=;
 b=PJa8lG3YVGbPcA64wxLWzsEYNLVk5UWbg6da8KEsEuUGCmtEd41NnKzd+gLAbNHBXS
 K3e4xXl9xwDuO86W2tYgIAFNNuGPgYDIFGOGzq4xHp0ZX2oP3jP/nqWmB40EN7kZGdd9
 WMH8EWTrnKCPRFQYEaXe0Q7gSgDkT2+KteXnwfNG0mSl8iUFoTLtTVsRxLB3mmFahW/W
 DfFZg3FfgFX3yTcN3y0gujDOx/nb0G2oP8WX88w3ISfhjLp8gYjc6mqz4XxkZgsRP+uG
 7DtrThBHp8gn3tjuJkkRBcPm7BphZZDa1oqET8/wcvFGgsHnln996JaezJJ7MJtJYsw5
 Vrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693404717; x=1694009517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QkS0efXVCy8VZ5VmSKwsFXPwQqBxWGJyzZuacJMQHs0=;
 b=KIBnEpzsSnS8nNzWmp50R7P5fZkPcYsrpwvWdXQ221qHP8knt4KLp7GbakU6y+5jQ1
 KsNr0cJRQrSm/54DTHe74jjZ4DkU1hO67Zb7oKGPnuv/uTsTVHYbGfalKSMLTDmWkmHH
 HvwNaCviPTZKw52gDz8HFj+DkmKZglsy/uUMiehJxfRtAM/UO6FABhNihxqYyelMZmL6
 f1LtT83TfSlkWefojjp2ktK3xKXC2oqXeOl9T5vtc0udEZ7/U9gSxuwPCa3pMxf62l0h
 eI2LgH4nvZVZEybGgaacx2V9elBFFvHJFCxDWeApYxRrr7gh54qojhid3cZzHrHtguPs
 WlyQ==
X-Gm-Message-State: AOJu0Yzcp+Y/1m2DUpAzSn137t8ovhnzzNUbZ8C4JK7QHlwLmSGZFbVv
 PcdHmIuEllnXcRuYDUq6i8DWgdlfl9ayjAq5xrI=
X-Google-Smtp-Source: AGHT+IGbT74tfz3VyfVut6ethLJwLvDm6Tl7JSJUbcDNwD+fiygq/r9pK7Rbz0oaYOoffpJo/r8wDHC3auZoXajOIhc=
X-Received: by 2002:a4a:d213:0:b0:570:be00:5e14 with SMTP id
 c19-20020a4ad213000000b00570be005e14mr2163595oos.8.1693404717504; Wed, 30 Aug
 2023 07:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693386602.git.pstanner@redhat.com>
 <46f667e154393a930a97d2218d8e90286d93a062.1693386602.git.pstanner@redhat.com>
In-Reply-To: <46f667e154393a930a97d2218d8e90286d93a062.1693386602.git.pstanner@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Aug 2023 17:11:21 +0300
Message-ID: <CAHp75VfkzV-=XuEZwipYzfHNu4EXuwzbu6vfEKh1Uueseo2=wA@mail.gmail.com>
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

On Wed, Aug 30, 2023 at 4:46=E2=80=AFPM Philipp Stanner <pstanner@redhat.co=
m> wrote:
>
> Currently, user array duplications are sometimes done without an
> overflow check. Sometimes the checks are done manually; sometimes the
> array size is calculated with array_size() and sometimes by calculating
> n * size directly in code.
>
> Introduce wrappers for arrays for memdup_user() and vmemdup_user() to
> provide a standardized and safe way for duplicating user arrays.
>
> This is both for new code as well as replacing usage of (v)memdup_user()
> in existing code that uses, e.g., n * size to calculate array sizes.

...

> --- a/include/linux/string.h
> +++ b/include/linux/string.h

I'm wondering if this has no side-effects as string.h/string.c IIRC is
used also for early stages where some of the APIs are not available.

> @@ -6,6 +6,8 @@
>  #include <linux/types.h>       /* for size_t */
>  #include <linux/stddef.h>      /* for NULL */
>  #include <linux/errno.h>       /* for E2BIG */
> +#include <linux/overflow.h>    /* for check_mul_overflow() */
> +#include <linux/err.h>         /* for ERR_PTR() */

Can we preserve order (to some extent)?

>  #include <linux/stdarg.h>
>  #include <uapi/linux/string.h>

...

> +/**
> + * memdup_array_user - duplicate array from user space

> + *

Do we need this blank line?

> + * @src: source address in user space
> + * @n: number of array members to copy
> + * @size: size of one array member
> + *
> + * Return: an ERR_PTR() on failure.  Result is physically
> + * contiguous, to be freed by kfree().
> + */

...

> +/**
> + * vmemdup_array_user - duplicate array from user space

> + *

Redundant?

> + * @src: source address in user space
> + * @n: number of array members to copy
> + * @size: size of one array member
> + *
> + * Return: an ERR_PTR() on failure.  Result may be not
> + * physically contiguous.  Use kvfree() to free.
> + */

--=20
With Best Regards,
Andy Shevchenko
