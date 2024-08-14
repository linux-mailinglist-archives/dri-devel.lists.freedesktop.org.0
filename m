Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45734951B12
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 14:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928C110E46A;
	Wed, 14 Aug 2024 12:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I9YxmqzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E87D10E46A;
 Wed, 14 Aug 2024 12:45:18 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a7aa212c1c9so784703566b.2; 
 Wed, 14 Aug 2024 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723639516; x=1724244316; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXiJ6h0vBhMAdw5LUn2BvsS0+bvRUr9R1B0J7lshEqk=;
 b=I9YxmqzBBfpoBkUeMQhThce95XpdUJAp/0pCKHrWJDxshWnBW7xHLr7DB2rBRSdIWY
 KZXVZCK/Rs6K55/ncEfzLbdhxQXibCYV7nZ/E3xdCoz0iyewA1o5O3tfZQj9Lc74bz8R
 Crq2DtWpfBP/kX4G1FgtFJerK48cTc1T/tOUeWW3uLrOVILvN5xFZ2zmfY39nW5rBKHv
 NIzzvuBQh1e0TqM4vAX5CEbXfCR0j+g50g/70XvAFLj6U/dXvqS3XOwhy3kk2ELeZnXF
 SLYnNAuKhfLOLMoBkFrvEYUNitYwG5SknjLwRx7j8E0zRVruBZM9lWHnLy50DgVXf4gI
 HDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723639516; x=1724244316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gXiJ6h0vBhMAdw5LUn2BvsS0+bvRUr9R1B0J7lshEqk=;
 b=fbMQU1f53M0z4D09YV1Q33CsNhhE90suCv/L0Jeouq4FC5cYveEtxmYE27/3JxuQFY
 sUhpA53QQAZvcI1YwVWynOJXslwnioGy+Eis+5whxN+9Zsm3gSxYRBlgd9CvcO2gbP7o
 3V0bbbSSXh4qibdBacLqklOqwRsxjyYZJNOsduDp+2XDlrgwKmwS2XOxuAHoUSrG/Evc
 edgHuuA88CgfhNMxZ2AIrTz7d8nbdGU2UaTxLx35NbE3ZHbjz1phXlaswzg7X9GE8Yoj
 vLgkDZhPSjNLkmJ7D+nVZylO+sBiNHnCUS4i1XvHtOjlIN+6cbY0dPMU9wzEyo61rQT/
 YaKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHmNPeUHaazinjotbKXcamcmAjG1NzuqIkcRPK8oNBon21Eeoi8dfE93iWmnm9kRsOs0WLAPAi4r71Rfib4RTMKS3kKQudnsEN4GzjL0l0Zd2UaHru02Xp3D6Hi4QvdOYCoyQFpYNohWLvup/Mz6+u
X-Gm-Message-State: AOJu0Yzpf20ru8k/cfO3Bx9sKBjIxFD5QazTQ1N9l2gTUSPQynODlhwt
 A2UQVx/g3EAxIpsVZA9Z6UsYOt7GdlLvZk+0e7jGD3zfi+bYYSqr31v9BfNDdM+KMBMQFGcmtwM
 06LSl5z5m/H9VY2ToV9qUmGVPaCTLf2oF6l4=
X-Google-Smtp-Source: AGHT+IGZr2QwBx3fGlXSkOaUCnb4hbIxI+4OY6LAlhqkkpfUF/4fww8rKMqhp3vT4LPNsuQUeuvbRSxihSq1GVd5UOU=
X-Received: by 2002:a17:907:d5a2:b0:a7a:9a78:4b59 with SMTP id
 a640c23a62f3a-a8366d4146bmr182304366b.23.1723639516109; Wed, 14 Aug 2024
 05:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240814100035.3100852-1-jani.nikula@intel.com>
In-Reply-To: <20240814100035.3100852-1-jani.nikula@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 14 Aug 2024 15:44:40 +0300
Message-ID: <CAHp75VciLg3KjeSAeEQyc1xa7o1cjoc5oEjYcGCK_MuSzmAWiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] string: add mem_is_zero() helper to check if
 memory area is all zeros
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, Kees Cook <keescook@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>
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

On Wed, Aug 14, 2024 at 1:00=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> Almost two thirds of the memchr_inv() usages check if the memory area is
> all zeros, with no interest in where in the buffer the first non-zero
> byte is located. Checking for !memchr_inv(s, 0, n) is also not very
> intuitive or discoverable. Add an explicit mem_is_zero() helper for this
> use case.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

...

>  void *memchr_inv(const void *s, int c, size_t n);

I would group them here, or move the above.

>  char *strreplace(char *str, char old, char new);
>
> +/**
> + * mem_is_zero - Check if an area of memory is all 0's.
> + * @s: The memory area
> + * @n: The size of the area
> + *
> + * Return: True if the area of memory is all 0's.
> + */
> +static inline bool mem_is_zero(const void *s, size_t n)
> +{
> +       return !memchr_inv(s, 0, n);
> +}

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
