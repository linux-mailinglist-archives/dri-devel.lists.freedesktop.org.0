Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F51B0B312
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 03:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3D510E105;
	Sun, 20 Jul 2025 01:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JAcCtHYs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A7410E105
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 01:13:12 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-7196cb401d4so6019887b3.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 18:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752973992; x=1753578792; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qFEhPN5VIreuUIeJZxHGUtVS5WrAHG54xoLttPQ9js=;
 b=JAcCtHYsMU2jYRn0C1Y0X0g2T4AqhkWkDHSgGhLiy+CFUA5kyKySU4qIzhaxrOdYO8
 FU4aTmh05yAalwDVtJa1thp+k6VwOyWChTjOwPHVyRct1FelQF64LjHPA9cOlicgpYrx
 ScM8DGRMPqTYgMhuHE1cc0XMJjBWMhzKuEkXMrn7Gt6wCNf8tp3eqHKIMWizGJpVmBaJ
 ws+ne0jg1lA+4X8RlxQXfPrxqEfqD4n+hQJ7n1zKV4zajjBvvwkFmL8LAWz/iHqMue8v
 t2Vc7xzev/FxHuYsydxKrNXhdhXLnbJefHbfW4AQVoheRWdfto7u9NhLIw++1WGsh0Ri
 ATtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752973992; x=1753578792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qFEhPN5VIreuUIeJZxHGUtVS5WrAHG54xoLttPQ9js=;
 b=Ro2CyGEDa460T69siKPWmTFeV1S48iKWlyJ0WjLte5iXkuK5maWc9SxFQx6nObwI/Q
 wlp1G2TUDhDO97k8YXt8Oyfg9SKtm8wiN6ZL82b9fIA4ky5jKYPjpQL0HVK1qO5iuFJe
 92LZYXtmg2Myv2MZG8YXrlYkyG8Fy0GyWjWCqo6KNLKYfMeXx94XkYYLKwCagGcMCR7C
 Bzd7mhadZrIZ8EMlholYikzZd1sBMxypl35Y1Ed5VbA4iiaYo8BU1bu3pmLAtOG+RRvu
 4f2etlvXt8cNU/HwIct6uvtJDxBXINWq0XRJYBL+3xJmM/Bin2kDI7NuT2dJD581Y5nH
 rqfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPtWUNVhin8ExIY1UpTivXP3T0lK6JqofMkVuFNVkZrlatOEbpjXzG0nNlL4u3RWddAe66TQgq6ig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCsb4HzTotyXwK3qnbFa5I5cSQYuz5bdmzvMidpumxqkQ5YKEI
 XAEBCFkwweg7pJPFoKvpd0ufZ28hh/hn+G9q68fIk7sTeZETrxG/9j1ZhP+35IQkpwTwEwCWP/y
 oWvHZu0Dkj9tudp+bkjlI/mjr3wc2pWM=
X-Gm-Gg: ASbGnct3dfzXp2UYszj9WLTNpiWbolQUVuSta6vGHpt92mM7cZwk5v1x/AyvPf8gO8j
 nwSdQCEO9jO9Me+Ocj7uXXcsOWPJ6mvcxKFgBL6+MtmYxY0PYJY65X5RtqxXf0mkrhnaH+mMpMD
 VYpBgVf5+W5WE++TCKe8RAK2L7UQVXXL5AdZT9k8cXh8p2Z4ox+vVkwcbv8EKejTwmajIE6+NwL
 SPzhhI=
X-Google-Smtp-Source: AGHT+IG2sbHcr2XjMkZ101kqHgU69/mylWczYFamTwY1x9FdIIUlbsGjpwjbNdGpZntRfHQUrk4/nh8/EUAZOmwoDyw=
X-Received: by 2002:a05:690c:4883:b0:702:52af:7168 with SMTP id
 00721157ae682-71836c271abmr246856567b3.2.1752973991801; Sat, 19 Jul 2025
 18:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250720000146.1405060-1-olvaffe@gmail.com>
 <0198AAC0-2F53-4A20-A869-9D720A086818@collabora.com>
In-Reply-To: <0198AAC0-2F53-4A20-A869-9D720A086818@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sat, 19 Jul 2025 18:13:00 -0700
X-Gm-Features: Ac12FXyzRH1tJUxlfF1GbrPLiqDGvY7BJ12poIhR_GK4IC5q2ZjK-rXjqJhIFmI
Message-ID: <CAPaKu7QVEXp5Zsp2mNW+_wnci4O_UAienba0gNvXK_8iykwZCg@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm/panthor: add devcoredump support
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Sat, Jul 19, 2025 at 5:41=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Chia-I Wu :)
>
> > On 19 Jul 2025, at 21:01, Chia-I Wu <olvaffe@gmail.com> wrote:
> >
> > This series adds devcoredump support to panthor.
> >
> > This is written from scratch and is not based on the prior work[1]. The
> > main differences are
>
> I wonder why this was started from scratch? IIRC, that work stopped, amon=
g
> other things, because we were not sure about what exactly to include in t=
he
> dump. I don't think it warranted a completely new implementation, IMHO.
As noted in the listed differences, this impl triggers coredumps in
more places (e.g., mmu faults), captures lower-level hw regs,
separates capturing and processing, and outputs in text format.  It
turns out there is little code that can be inherited from the prior
work.

It also does not support dumping successful jobs.

>
> Do you plan to work on the userspace part as well?
Yes, there is a very early tool in
https://gitlab.freedesktop.org/panfrost/linux/-/issues/44.  There is
also a sample dump that shows the raw dump, the decoded one, and the
decoded ringbufs / cmdbufs.

>
> -- Daniel
>
