Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5096AB106D
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 12:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DF910EA09;
	Fri,  9 May 2025 10:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PcWz3Xjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5A310EA09
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 10:22:07 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30f30200b51so21118301fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746786125; x=1747390925;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lEKN1jbgilqN3iHLAzkRRI/T6QIJDoiiG8dqLEcN47U=;
 b=PcWz3XjcHzE0AWZSHl8fnPk93FAXFO6Gu/pKlDQNx1xMhzmOFvtK0COuKgXf6dWzvS
 8ve3m4KACw0B3PiGU1yLUFwDV2q8P0uy/BNDC51v9T3cLXaKoynqxbqTlhCySNj9IUNM
 Lh7qOZyDAVC6wuyRqcdtynANG6QRkLQNY4lN/x9y/RBWVzMcRt/rSNapbvExti8p4End
 c/Moq10MSuRh1TN/wOJNHTE2s1xyZOtnWkbqywriMvL/hNkBYGP1jKHU3xCZotitqFKX
 pVNEtE+SLCG/9Hm+tk7qQuLOj2xYWjd6sgTJ/IONNH09wunep4wjihxsYzfyFPYymxn7
 zFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746786125; x=1747390925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lEKN1jbgilqN3iHLAzkRRI/T6QIJDoiiG8dqLEcN47U=;
 b=oDqLj9i01CSjgoc3CeE/lpBJAXg0e3TFBVHr3R/8YlSss0A4reBJL4WK+fir74shzh
 bSrQKP055JYadA02tUY2qb2YRVGCGmzJeAbFJBfq0p6jLjVKrNzr1D6xccKcofwhWnNt
 tQ+kkQjcFlnVb27N1KqgGUYRVkNBeya0IxIUwa39pb5bHB7dy1+wMbx/Bmcts+8P9PqM
 kvwcCQEghBkjjOwbery5TlRBmKZ9alghCMQoiEIT67MUIQCXKQfIlE5/fTEml5ivLe7n
 PWPPMpgvV9vxb8xH9VpoZGDNBdpzYvfrEwR6mW1NQfOujjFUiHYThn/SI3XPE5z4l44o
 SiiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeQr4UTigylk3j7hLUqOWVfsrMdeQelsmvo2avEnkcntU/23BpDhstExWqS3j5lfvAPivbkTV5gnc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3EibAtpXyu5yWw/wYfv8PyrIP6tuG6Wxo8aXy1VgTyYKlwDta
 FPMpxz2n5WMjdXm8Jcx9zdOVzIZm/3yh3cZrvJmeu+VCB1q4xEtgR5zD1asgJGVUc4Bpg9HhVAi
 Kmf4r3EYxNlhcVrY2Ufrx1INUoWHy08FjL7GFgQ==
X-Gm-Gg: ASbGncvCGuiXcDA3wb3kwLKVu+/0D29S6C7294nEkSs5622WTMLhEUO/eqTY1QAZeJe
 qNtvORJhEH6NlmZHtd91AGeZUh3d84Kqu6pFucMKX4LRHPO5XMAX7hEeTvRNBEenbrL6gHY8RST
 PYJKPU8FE6EXOWD1uWJ6THLGZRrbf/fb/mrm0nU/Np+YIyYcVHGeh95A==
X-Google-Smtp-Source: AGHT+IFFnckVfV38yiKm/0tyz56i3avYrl46Y9age8QQDJkz0vCUqheVLftkCKucDo9t25Jxqs4Ykbmgz1ik3/urSi8=
X-Received: by 2002:a05:651c:2211:b0:30c:15b:1268 with SMTP id
 38308e7fff4ca-326c457e7cbmr11457661fa.15.1746786125175; Fri, 09 May 2025
 03:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250508130612.82270-1-markus.burri@mt.com>
In-Reply-To: <20250508130612.82270-1-markus.burri@mt.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 9 May 2025 12:21:53 +0200
X-Gm-Features: AX0GCFvERxh0VC7uLRRore07epYkHtQUe6fy6V21pIoKxIz0HhJctMM3W0tAElY
Message-ID: <CAMRc=MczDhGpxwbGCUoUxGm19dqNH2FzXVrbXewy7yMP=SEieA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Fix potential out-of-bounds error in some drivers
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 "Oliver O'Halloran" <oohall@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, 
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Nuno Sa <nuno.sa@analog.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org, 
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
 linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
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

On Thu, May 8, 2025 at 3:06=E2=80=AFPM Markus Burri <markus.burri@mt.com> w=
rote:
>
> Several drivers are using debugfs and follow the same pattern.
>
> A buffer is created on the stack with a limited size to copy the given da=
ta
> from user space. The copy is performed using simple_write_to_buffer.
> This function limits the input according to the specified buffer size, bu=
t
> it does not write a string terminator if the buffer is truncated.
> Therefore, the driver adds this zero terminator afterward.
> Unfortunately, the original buffer size is used as an index, which can le=
ad
> to an out-of-bounds error.
>
> This patch set fixes this issue in all the drivers I have detected so far=
.
> The fix is to return an error in case of an unexpectedly long buffer bein=
g
> received and to use the effective written size for the zero terminator fo=
r
> consistency.
>
> Changes in V4:
> * Revert the decrement of accepted size by one character
> * Added patches for drivers with the same pattern
>
> Changes in V3:
> * Decrement accepted size by one character according to feedback
>
> Changes in V2:
> * Use effective written size as index instead of original size
>
> ---
> [V3] https://lore.kernel.org/lkml/20250505203830.5117-1-markus.burri@mt.c=
om/
> [V2] https://lore.kernel.org/lkml/20250505045346.29647-1-markus.burri@mt.=
com/
> [V1] https://lore.kernel.org/lkml/20250501063240.25295-1-markus.burri@mt.=
com/
>
> Markus Burri (6):
>   iio: backend: fix out-of-bound write
>   accel/ivpu: Use effective buffer size for zero terminator
>   iio: fix potential out-of-bound write
>   gpio: fix potential out-of-bound write
>   powerpc/eeh: fix potential OoB
>   powerpc/eeh-powernv: fix potential OoB
>

Please, don't send this as a series, it makes absolutely no sense.
These patches - other than fixing similar issues - are completely
unrelated.

Bartosz
