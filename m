Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7855DC3864C
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 00:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA56C10E35C;
	Wed,  5 Nov 2025 23:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H99/wWL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D02810E35C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 23:45:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4AFA244AD2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 23:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A909C116D0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 23:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762386356;
 bh=kmlw6NJFheSDcopMkyos4Z17yXYv5U4n7W4OWmXt4sM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=H99/wWL4ywwfvfthpM3NszId1H2YuUeo6zvkhZOeAySAW/5NchyHwxXRqllmwqz1i
 cmpMNS36gxbTBAo3HiKCb0N26fMYN0atZ08VSjczy6nrxohi+obc+O3GmKqLXd2gKF
 dX8uCb3Is8c2q30XccOYmcLkuewxiTbWbxNa+tSHXZw4mwbqloRVNlNYrpIGNzy8yi
 qnIedvz019BYMe6iRxJ2uXU5W+OuwtqUze5WopHlMYgy0xhiPiypmaNCGUSFrqWt8s
 lgxaA3xcsFvHj+cFdGKqTdW6qk38/Lc96g56Fh3zSCORpaNY31VLUsFEuZ1xVb55OW
 cpkbONV1TKRsg==
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b9a6ff216faso262974a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 15:45:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWAxN+3yPMFhOB0eDwFjbe3RiVjdrk5j2Anz+KaI7byoi5m1FFLbhxC284FPkdcOTvI9HXWhaug/3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ9XMK/WzAmv7s6JguPmLuCjvwqZZRKqQkW2jvQ1RMAHyAdYWQ
 MHUallUpjZD2nP5yTiKA88GJA0wRn65lQ45m0Cat4PryaeTuVCGqB4yph0nEHf4SBq1a2uxECIL
 nl8Xb0hLL5TEAl1Gtqi5k1QrtjID2Gw==
X-Google-Smtp-Source: AGHT+IE5EO4UpE8S0+YO1+WGotybDTqSJIt+1Z2T6glgMpYBqoAX7IdmXZPLPEmNGHkEgbnaXMCloII3b/yhWYPJdxU=
X-Received: by 2002:a05:6a20:3d8e:b0:34f:28f7:ed79 with SMTP id
 adf61e73a8af0-34f83f04a23mr6525532637.19.1762386355745; Wed, 05 Nov 2025
 15:45:55 -0800 (PST)
MIME-Version: 1.0
References: <20251105151443.3909-1-chunkuang.hu@kernel.org>
In-Reply-To: <20251105151443.3909-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 5 Nov 2025 23:45:43 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-=fAta1rHe=4P+vDwuG46hHJ4Fn1TR-fxT_94bw6ggLA@mail.gmail.com>
X-Gm-Features: AWmQ_bn-Dqm0KiWoV_ruhiTNsTDA36HWqkX0RUySrxeI1IZE3ad0qjUgj-CvtTc
Message-ID: <CAAOTY_-=fAta1rHe=4P+vDwuG46hHJ4Fn1TR-fxT_94bw6ggLA@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm fixes - 20251105
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Simona Vetter <simona@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, 
 "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
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

Hi, Sima:

Sorry. I don't know you have changed name.

Regards,
Chun-Kuang.

Chun-Kuang Hu <chunkuang.hu@kernel.org> =E6=96=BC 2025=E5=B9=B411=E6=9C=885=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:14=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi, Dave & Daniel:
>
> This includes:
> 1. Disable AFBC support on Mediatek DRM driver
> 2. Add pm_runtime support for GCE power control
>
> Regards,
> Chun-Kuang.
>
> The following changes since commit 926d002e6d7e2f1fd5c1b53cf6208153ee7d38=
0d:
>
>   drm/mediatek: Fix device use-after-free on unbind (2025-10-28 14:56:16 =
+0000)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git =
tags/mediatek-drm-fixes-20251105
>
> for you to fetch changes up to afcfb6c8474d9e750880aaa77952cc588f859613:
>
>   drm/mediatek: Add pm_runtime support for GCE power control (2025-11-01 =
14:14:56 +0000)
>
> ----------------------------------------------------------------
> Mediatek DRM Fixes - 20251105
>
> 1. Disable AFBC support on Mediatek DRM driver
> 2. Add pm_runtime support for GCE power control
>
> ----------------------------------------------------------------
> Ariel D'Alessandro (1):
>       drm/mediatek: Disable AFBC support on Mediatek DRM driver
>
> Jason-JH Lin (1):
>       drm/mediatek: Add pm_runtime support for GCE power control
>
>  drivers/gpu/drm/mediatek/mtk_crtc.c  |  7 +++++++
>  drivers/gpu/drm/mediatek/mtk_plane.c | 24 +-----------------------
>  2 files changed, 8 insertions(+), 23 deletions(-)
