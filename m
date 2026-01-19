Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8E9D3A9F6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE10A10E449;
	Mon, 19 Jan 2026 13:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FIBeWyfF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC03910E449
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 13:10:24 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b8707005183so718425966b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 05:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768828223; x=1769433023; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1MPZnZ8koQKv01vcxXzQIb9F3ndZB6UBQVxaX9WgFU=;
 b=FIBeWyfF6/jLLM8GPgRh6wxIyOcxneSRCQyk+IrSNhIlwF701mbXhLRbm/CtHplS8Y
 9wm/5rF9C/4gLo7pblLScTzifAga3jMpHwaGxEe+mhv7asWEJKLeXyx4cKsHYiqgFiac
 2B4I/CTBdqNlhZ+UJHmN+mIYJrSNkJ88PotuJOk5RkIIaHM5KD2h2wuBGsKacaFW37Hg
 fszWhn/onq2ffnGTQKTa1GppJ/NaHHCpRsRjTaL2XJZC/dZoEQ+nqmRkM27Ny5MtvEKs
 oZy6I+TOWuLjh6njP8Ca0rvlHByAdN12MDAcYR3t3R12J3/ElNUFhyPCP4VN4SfPJY0Z
 TwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768828223; x=1769433023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K1MPZnZ8koQKv01vcxXzQIb9F3ndZB6UBQVxaX9WgFU=;
 b=wQ7YbKaCmZ6ljB73JLkQSI8BpHvmTbjOPlDfGFkwXcurrvD7faNcnSp0IyTGJ0ighb
 fKlsa8PqZCJtm3Hg+5Vc1fEr6Cen9Xv6KfbYfIYJc1L7h8d7aAs6qIZa3qN4QDeJxlAI
 DohMWOAcok/CaRdHPriZ5ISmYdpc1x3DVcSkulBqIAtAqN57f5FkXF4KUfnQ8ES9txL2
 ef2+NElgzBNXvMUNwxBbhDYiz8QSe4Zikktjcbn/lBwfviQ0ggQGIhGDpw2S65YHHWRM
 u7t+vG1oGP7fR2LyTWUQnEJ2OmmRLGXskIbNxZ3SeJNPPKFa6uYlBoSTE9tZHW2O8FyW
 BK1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU41xck6vQW8JHbcZLOe6/FPhge9PRVaGEnf0un9gXjgbVCbncaYzwcCXMntCsMwIOq2mpRAd9wQtY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfujI5yKSwcOh9t03tBb7KGkKDkD6MW/iqSO20Lo4EaH0QO0aS
 zEgU2tN2jds/GG9T0/rCQOfZannJxDRsGBpBQ9Y06qVyWuL5qa6sXK/XN8ubM+M+XMu2WuQMQa8
 Lm8t811C0USWmyJ3TXWacexWxudeHUAGjnuw+Gk5DWQ==
X-Gm-Gg: AY/fxX4Z/CLVrWgVxLZuH1doWZu4vkuSH0uNLRO6kOYae8G9pONucwRIBcZTAG+u79h
 OQgaOzSLHsmNpiCCIB7OM8ptQL++k8m1kLtXtK3DhPly8PQ4x+1mZ0jydFAzHJuH15OartSnNWt
 IcvonAw4U+t2mul+bwLutkCFdiUwtJ4qUhrPTve9rZ0EE+7TTqPrcMuGVwWJrIDCdIEPru87kQI
 6TD57sXUdU+OlGpu3fKeJWe2GEgYcB/1scXr61wEcCinPvebuBDFWpyPzAigPupGIa4Na69j/5e
 rXl2x3T7DhlpPSIezJZxYZN5zEk=
X-Received: by 2002:a17:907:9713:b0:b76:f090:777b with SMTP id
 a640c23a62f3a-b8792f683f7mr935886366b.22.1768828223465; Mon, 19 Jan 2026
 05:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
 <20260116-dmabuf-heap-system-memcg-v3-1-ecc6b62cc446@redhat.com>
 <CABdmKX1ZCkF2N1Esi6Uo=jK=soXZe_eWhSSxHtMTcRWs-ZUYog@mail.gmail.com>
 <c3d66415-0e2e-4945-917f-4c47f16bf743@amd.com>
In-Reply-To: <c3d66415-0e2e-4945-917f-4c47f16bf743@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Mon, 19 Jan 2026 18:40:12 +0530
X-Gm-Features: AZwV_QiZpslj_Ee2HW4MjCooEBtBdxf_RatAeMZm3MxIfz-ec0_Zxj32USNQwfc
Message-ID: <CAO_48GE5F=_8s8vJfOy0x-FQj++=BZ_rf1yiNa3hyFj+aUzLLA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dma-buf: heaps: add parameter to account
 allocations using cgroup
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, Eric Chanudet <echanude@redhat.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, Maxime Ripard <mripard@redhat.com>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
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

Hi Christian,

On Mon, 19 Jan 2026 at 15:19, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 1/16/26 23:36, T.J. Mercier wrote:
> > On Fri, Jan 16, 2026 at 12:06=E2=80=AFPM Eric Chanudet <echanude@redhat=
.com> wrote:
> >>
> >> Add a parameter to enable dma-buf heaps allocation accounting using
> >> cgroup for heaps that implement it. It is disabled by default as doing
> >> so incurs caveats based on how memcg currently accounts for shared
> >> buffers.
> >>
> >> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> >
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
LGTM as well.
>
> Should I push that into drm-misc-next or does anybody else has commit acc=
ess?
>
I will push it to drm-misc-next tonight. Thanks for your review!
> Regards,
> Christian.

Best,
Sumit.
