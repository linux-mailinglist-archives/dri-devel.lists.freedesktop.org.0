Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE29ACE8BB9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 06:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976D310E813;
	Tue, 30 Dec 2025 05:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ws/tLkyV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0BC10E813
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 05:48:36 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-5dfc6be7df3so3531251137.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767073715; x=1767678515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Io2ywk5egcCouRJ+jUh5kFNImLPSJfA7UhLYpX0iGxI=;
 b=Ws/tLkyV4NX46QAn8rH2++z1dWxtd21Zjo2YTktpOQ/33BVjcHwC9c1glg/CjORlRi
 lVax82zjWKoNlg1IZ12aKwn5MH16965gfZnMRYXAEN4IqEXP8QHb4GLekD03GPb5tFi0
 XvGK+XnPKKmmQLoKyicR1i9xVUhONDOW/P6qe46LynBr3COTRgvOJ8RYI+T6r0CM9x7u
 eCd1vHzjIUL+WKoeRCGAqve5m/JVjegf3mB3msoawi9zSyQ5Ts+z0CKgG9qi9qf7hsvh
 8vbC1wCgcj19LgDNqeHyBKyEoATpOC5eevWss7okc4puP8MV0JGV0IxBrrVPTK5aFZbM
 huEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767073715; x=1767678515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Io2ywk5egcCouRJ+jUh5kFNImLPSJfA7UhLYpX0iGxI=;
 b=syeY3HSDA/n0ZUH/hyb/GVCALAJl56nh8wOVGDCVSH1U/rN/fxdhVO0d0jG41c6zDC
 tDyjv58W/PXEGEoBteoTS1k/lmFHaJVTLVMMdta4RTtIRQwHuo8fKMAcVi6ZMyTi4PVk
 xyzSISu3kV+1AXV7FOg/ex+65sS91wn+sOKQDehSYteRZynm4xzzjOzQKQDb39G/42ff
 nGqp4OSNgD8HQQx5zXZK5QrdIOkbNNztlTvM8ESMm8G6CLmHi/3lr2bFKxiDRvATF3V9
 Ml3EmxPI30yJ7A5apVvROCc8pUXL9jImS2FYQULExkXB+r7xOeDCxDzu5sAM0R6uc0th
 a6yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5DN4snw6l/nN2k+lMVe6+GeC2rcmDvAJt5wxk/6DEy/97r0zxCfoFWEvWi4OjYiLbbQySqE28jtc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyz0dOwKZeMCctXWffd65/JeiUvoUGg//6Ewyz6jmqaYvsC8SlQ
 wncR/4LGiCEfihOzMCo33znaepEOzcfflVpfJFexTq8OL1GTRUSDk8ine/CEULPZFZ9B40ytey0
 cWe7YmJUliwORNUf2/c2Du7diszd5xF8=
X-Gm-Gg: AY/fxX7A8ITT0lImh7FwNzrh3KBqsVlvTfQxrUuLDh7RtAjnE19CHkBRFLSNedoJ7F2
 dl9jJx/TfJupM3b64S08Yog/RfqARC8gia+Vq0AIawu+wgBNiP/UrhIMt76uWdSA0bydEo5hRoL
 Rr2UD3sFtP3VhTnEwE8W3CQFi6v6/dITreNUHpnWs/TVFLLayqaMVltQ+1vijuH4b0tlTEuuKGt
 6PKgGVfO/bD515acIWVRgXn5cX2PwSVlcc3x+WsKF4a/hrCtys/VU53/eDjEf0SkDEK8Q==
X-Google-Smtp-Source: AGHT+IGcn7ngK1Vl7ZEBA+uwHaBbyq/LtaGbWOTh1TF7kp4rDbVZJDT5LgJQCOziJh0geZNQCW6ZGjhSrLMHLeIwNHg=
X-Received: by 2002:a05:6102:568d:b0:5d6:155c:33aa with SMTP id
 ada2fe7eead31-5eb1a663165mr9947765137.16.1767073715290; Mon, 29 Dec 2025
 21:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20251104112923.143408-1-marco.crivellari@suse.com>
 <CAAofZF4OJi5eEfjhE12RWi6wDU+A9Rghsd2721SxZR4AC08sYg@mail.gmail.com>
In-Reply-To: <CAAofZF4OJi5eEfjhE12RWi6wDU+A9Rghsd2721SxZR4AC08sYg@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 30 Dec 2025 14:47:59 +0900
X-Gm-Features: AQt7F2pUL_-MfhVXCOS419JhBeqjx_drkdULdJgcsbrWyUHU3_jdpuTD8pVkzYY
Message-ID: <CAAQKjZPVi1KHuS4p6G2uAeKMAg=PEbECj7DHW7OYNYLG-S9hmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: replace use of system_wq with
 system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
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

Hi,

Sorry for late reply. Merged.

Thanks,
Inki Dae

2025=EB=85=84 12=EC=9B=94 25=EC=9D=BC (=EB=AA=A9) AM 12:01, Marco Crivellar=
i <marco.crivellari@suse.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Tue, Nov 4, 2025 at 12:29=E2=80=AFPM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> > [...]
> > ---
> >  drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Gentle ping.
>
> Thanks!
>
> --
>
> Marco Crivellari
>
> L3 Support Engineer
>
