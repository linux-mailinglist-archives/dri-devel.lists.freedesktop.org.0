Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711E18BE6ED
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAD910FF6D;
	Tue,  7 May 2024 15:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b2/T+o14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B95510FF6D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:06:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CABA1CE139C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0883FC4AF18
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715094377;
 bh=FIKFA7yIDY3Vv6kykK6nyLmumWnwZ12blZs7LHr+8Z4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b2/T+o14zTAEW+5MF6mjbhsqGITAGsVF03MUTq9tJ2OGdYRqX1S2+FtoLbOEWlt7b
 N/q1ZkjSdzf0ZuZSETSFmfMzIsx33NvFARdMUyEgj1PE/rbHLngfYestskXxYJeSX0
 zZn7poo6qOl48jLrCnI1V/3/8eDsm561WIg3z5HzVAUHI2by7dYC6EQ0xoDjh3QQsi
 gVZRcD4ryEF+lymOQmBlRclryvK6s9F0n1hK/iH3+TqGA86nyDC/Dv7KSJ6GCzA7H8
 XcMLYpZXwGTq8C6Sf8g1jsgVXLoKA5DGqs7M9Ln6a8owc7vZT2jHi+rvoQeHAjQaUw
 qMG6X/zR6NzGw==
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51aa6a8e49aso4450574e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 08:06:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXKZxf8L9X8OGzszK3Idmnm9wVaA0G/8T7Z2btFsOKfEshX8jUHuhYis2z/Vs27pAgGCC5H7NW3n+fWy0T4HqYPEG3peV+kfwReFoQA4scZ
X-Gm-Message-State: AOJu0YwacxU2a8nB69yPmvNxg4DxbPFO6jqoOl7JTLhFcv+RKINPNpu0
 Ol4HuGaMdEEX5ihglP9IfR3gIFPiDTm6B1DvtZbRhyVQECORzETH0TZR0VTvfQY+rbpTUFKnacj
 5AzUcuUWPRzYiL9HPXytJZRGoIIQ=
X-Google-Smtp-Source: AGHT+IGi2Ze1cU8iTauu91g9xmtR9VwCxj74pDrEPxd34mYdxqnK8o9fiXwYyBTuoDsfyFtVLR1v0FFtMiKWONWyozk=
X-Received: by 2002:a05:6512:25a:b0:51f:1e8e:f7d5 with SMTP id
 b26-20020a056512025a00b0051f1e8ef7d5mr8209879lfo.35.1715094375772; Tue, 07
 May 2024 08:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAG-UpRQ5Dp4sO2CBTiOpBtjZoRj4U2rNxAwSbari+VcqvayuSQ@mail.gmail.com>
In-Reply-To: <CAG-UpRQ5Dp4sO2CBTiOpBtjZoRj4U2rNxAwSbari+VcqvayuSQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 8 May 2024 00:05:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNASSrB_L7VbS1z3O6QuMf0nti1hGJVwip7RRF_-=jn2OHw@mail.gmail.com>
Message-ID: <CAK7LNASSrB_L7VbS1z3O6QuMf0nti1hGJVwip7RRF_-=jn2OHw@mail.gmail.com>
Subject: Re: A link error related to DRM and fbdev
To: Henry Wu <triangletrap12@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: linux-kbuild@vger.kernel.org, gregkh@linuxfoundation.org
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

Fw: DRM list

On Mon, May 6, 2024 at 2:53=E2=80=AFPM Henry Wu <triangletrap12@gmail.com> =
wrote:
>
> Hi, all.
>
> I found a link error related to DRM and fbdev on branch linux-5.15.y
> (tag v5.15.157). It has same phenomenon with
> https://lore.kernel.org/all/202303150232.MBonYhiv-lkp@intel.com/.
>
> I tried to investigate this issue and found that build will fail if
> CONFIG_FB=3Dm and it will succeed if CONFIG_FB=3Dy.
>
> [user@localhost linux]$ cat .config | grep
> 'CONFIG_DRM_KMS\|CONFIG_FB\b\|FBDEV_EMUL'
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_FBDEV_EMULATION=3Dy
> CONFIG_FB=3Dm
> [user@localhost linux]$
>
> I'm not familiar with kbuild. Can anyone troubleshoot it further? You
> can find .config from attachment.


I do not have time to take a look at every build error,
but somebody in the DRM list may help you.



--=20
Best Regards
Masahiro Yamada
