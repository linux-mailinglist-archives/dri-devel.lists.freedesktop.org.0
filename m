Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9608388143C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 16:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C0110E4A7;
	Wed, 20 Mar 2024 15:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OWIRHQ3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4808710E4A7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 15:12:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CA81ACE1151
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 15:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A200C433C7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710947552;
 bh=4AyrmOxFklxpxTNZvkXz21tMOl1guR2HYpVS1elvNH0=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=OWIRHQ3i0ZmATeop2wGQqVXyXt993PGs22gSfHFvXtZU6NsN62p1EJpfObvFc7aQb
 KejSKt+o1RHEjfEoPHjpEqJVtNtlAxEOtKNZpCM/wYelVOhPFAsjSA3Os0alkPOJFP
 oLBn/E5Merg+wfJ6cX/LRWkCOnKpCGhVYPpOAGsom+y3NAuHZWukc5gj6/DCUvHiG3
 2rUAan9x9eROm6qEGvkUEo3bDWTMfD9SNGjsKyPvtAUIyko0OqDsAz/4xT8x58wt74
 7HcsRg8AjJGImLd4PtLHbVkBvryJuTiKnXDygsPoMH9x4w0y/HyHOxU8OJfYGFn0KO
 bBqqNMqIYsiUQ==
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so5505950a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 08:12:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVnaGgV8wr8tcObrhsWrq1JXMX9SQaOJz/9Edi64Cmu4CNCAEuOc/mvGWybsbV7otUK/dRlff57ecB4i4IreIX4gMxGYc/PoRWZfDR2lcL7
X-Gm-Message-State: AOJu0YxcTbY3hpJZBDMm26glKWoNRJPJDZ4Iyn50kJ8eIWr3pwDyz/5e
 GVWPNBb67NQiVU60veP8wiUtrvq4bTskqpweUhABHHL2qJWoRxUi3vPl/c6RJazX0vmC/6gZT4a
 IYQyjLSx27lgM50nj0dZi0ezyYco=
X-Google-Smtp-Source: AGHT+IEKWvvdAdeJauSgZxmese4I1sFioz67ZqmnyiOFtTXyOEuVe6S3aLO1cMHiRS14bIGbKBQ8t0NpIvybO0NWvAo=
X-Received: by 2002:a17:90a:4d83:b0:29d:faf2:43d with SMTP id
 m3-20020a17090a4d8300b0029dfaf2043dmr2605484pjh.21.1710947551619; Wed, 20 Mar
 2024 08:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <39ad88fa-449a-4aa9-ac6a-902d8d531984@notapiano>
In-Reply-To: <39ad88fa-449a-4aa9-ac6a-902d8d531984@notapiano>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 20 Mar 2024 23:12:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v64UBSAiGGWH4iGLGoFJ6wrif8itL-yC2+Vk5rU1U9CfsA@mail.gmail.com>
Message-ID: <CAGb2v64UBSAiGGWH4iGLGoFJ6wrif8itL-yC2+Vk5rU1U9CfsA@mail.gmail.com>
Subject: Re: Missing commits from drm-misc-next on linux-next
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 kernel@collabora.com
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 20, 2024 at 11:07=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Hi,
>
> I noticed that there are some commits from drm-misc-next [1] that haven't=
 been
> added to the for-linux-next [2] branch, and consequently haven't made the=
ir way
> into linux-next.
>
> Namely, commit bf0390e2c95b ("drm/panel: add samsung s6e3fa7 panel driver=
") and
> commit 2689b33b8864 ("dt-bindings: display: panel-simple-dsi: add s6e3fa7
> ams559nk06 compat") which have been applied almost a month ago [3].
>
> I noticed because running 'make dtbs_check' on today's next is showing ne=
w
> warnings, but with these commits applied there shouldn't be any warning.
>
> Could you please take a look? I'm guessing a merge was forgotten somewher=
e along
> the line on the for-linux-next branch.

for-linux-next splits from drm-misc-next due to patch acceptance cut off
at around -rc6. Instead of not accepting / merging patches after -rc6,
drm-misc simply lets drm-misc-next continue, while fixes for -next
content go into for-linux-next. It's a bit complicated but the alternative
would be to ask everyone to stop merging patches in.


ChenYu

> Thanks,
> N=C3=ADcolas
>
> [1] https://cgit.freedesktop.org/drm/drm-misc/log/?h=3Ddrm-misc-next
> [2] https://cgit.freedesktop.org/drm/drm-misc/log/?h=3Dfor-linux-next
> [3] https://lore.kernel.org/all/170919678300.2018319.4183838499915522690.=
b4-ty@linaro.org/
