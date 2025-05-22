Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566B8AC0AEB
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 13:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEBA10EC8D;
	Thu, 22 May 2025 11:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=goosey.org header.i=@goosey.org header.b="ek5nlY9F";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="0L/mvnmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 326 seconds by postgrey-1.36 at gabe;
 Thu, 22 May 2025 11:57:48 UTC
Received: from e240-11.smtp-out.eu-north-1.amazonses.com
 (e240-11.smtp-out.eu-north-1.amazonses.com [23.251.240.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5790310E8B4;
 Thu, 22 May 2025 11:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1747914735;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
 bh=a94gsEAsCnfPohT3Dirpbg/CsPKjVyzG+N92zufE/98=;
 b=ek5nlY9FSydHDmVIjqRiBtiDg1cEzkxISX/iSPnZ8EibYFvBwpIXl0P6jwGyRHOZ
 5jdQ/yagtJOoiObfChZYwIjgHh8rv94/jKgcXqPHeM2Q4z7PECpfvI97DQ6bEeLaF/J
 /Qg5Z0BmC5k2sWepMuucpoV9hGdmbR2lM7WN0+l/U4yyd2gA6NKNa9bwYFJwGYPFY0O
 TuBpTIYWa6mVlQ1Hxdy1S6+nJ1OJqFx7dihDDbO+uGKTG+RwMB2kOKn1FiveQHb/0G2
 P8cZ7nOHsVZ7f6FAbus90sK9LkXk+FV7qdRFvYx9CLP92UVaxYoxETg7dqBc1enqQxc
 pNHNXcuUPg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1747914735;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=a94gsEAsCnfPohT3Dirpbg/CsPKjVyzG+N92zufE/98=;
 b=0L/mvnmVeXfc8/dR5MmoWUyO0pql4c4lT2UD3BNxA+Prdmt1gm0POpuepo8TUopn
 w6/saDzSbSGQbO/SNvAUlSyq+swR5+8tb3er1tcWk6GyHT1PRYCdnZAH0vFdCkbx6h6
 w/elcc8raF7NzsMWmdyirEhoGZkflpQwKtgacdxo=
X-Forwarded-Encrypted: i=1;
 AJvYcCW4QMlqUvOIAJ4eAlDBtp4N+rAVHd5trXjjXRjVjvPUfHheICwYiR/qTGxs0zHiwEneAdXteDCiJ2Mj@lists.freedesktop.org,
 AJvYcCWGKWStMxDDnxm2FRDgKgGOAXyFqxkq0TjfaIQDkHtVD5lI91XU2EJk0ujbNprOZczsOaKYq3NR@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7n5tylg0TL0zd4ACcNG1nyhgJ7noYSc8Bsq/0hDVRwbtwqSys
 OQZ99bXPQzF3mWOW6A3FeDR5R2zZe+9lYrQEuCeyMOBzSi4YBIna0ibBRqRnEOCk5jsor8owyxw
 z0a2aU0Wz3cNhgIXEULu8iVeboMZzK40=
X-Google-Smtp-Source: AGHT+IE4COxC5PiGZ2qupl6t28kzAg6H9+4RqMEF9FyHEZhG03MW70ocaglKsaoebWcoU0xj/ubFS6KsKuyvo1EJFeg=
X-Received: by 2002:a17:903:1988:b0:21b:d2b6:ca7f with SMTP id
 d9443c01a7336-231de3ada46mr321310655ad.32.1747914732961; Thu, 22 May 2025
 04:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <CABH-8xdaDFjWyQ40Nyo59Gm5kD3Qi5hh76o-uam1yC3wNtJNqQ@mail.gmail.com>
In-Reply-To: <CABH-8xdaDFjWyQ40Nyo59Gm5kD3Qi5hh76o-uam1yC3wNtJNqQ@mail.gmail.com>
From: Ozgur Kara <ozgur@goosey.org>
Date: Thu, 22 May 2025 11:52:15 +0000
X-Gmail-Original-Message-ID: <CADvZ6ErsEk5qBh1dB1gtcmrj07pfzcULufq6gbW8G-Umh+Q1WQ@mail.gmail.com>
X-Gm-Features: AX0GCFvMKTmNoWdUbzrWG929aFreiTOUr6QiJdt7bMGQah8DUGyB8un3XET6rjU
Message-ID: <01100196f7d63f4a-eac8a7c0-8064-48a0-a279-5e99147191cf-000000@eu-north-1.amazonses.com>
Subject: Re: Regression: RX 470 fails to boot with amdgpu.dpm=1 on kernel 6.7+
To: =?UTF-8?Q?Durmu=C5=9F?= <dozaltay@gmail.com>
Cc: linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Tao Zhou <tao.zhou1@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Yan Zhen <yanzhen@vivo.com>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.22-23.251.240.11
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

Durmu=C5=9F <dozaltay@gmail.com>, 22 May 2025 Per, 14:27 tarihinde =C5=9Fun=
u yazd=C4=B1:
>
> Hello,
>

Hello,

did you get a message in dmesg from kernel, for example an error like this?

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1106268

The dmesg command will give you an output maybe journalctl output or
mesa (glxinfo) output would also be sufficient because we need to know
which upstream it is affected by.
and thanks for report.

Note: because there are two similar errors i added the necessary
maintainers for upstream.

Regards

Ozgur

> I'm experiencing a critical issue on my system with an AMD RX 470 GPU.
> When booting with recent kernel versions (6.7.x or newer), the system
> fails to boot properly unless I explicitly disable Dynamic Power
> Management (DPM) via the `amdgpu.dpm=3D0` kernel parameter.
>
> When DPM is enabled (`amdgpu.dpm=3D1` or omitted, since it's the
> default), the system either freezes during early boot or fails to
> initialize the display. However, using the LTS kernel (6.6.x),
> everything works as expected with DPM enabled.
>
> This seems to be a regression introduced in kernel 6.7 or later, and
> it specifically affects older GCN4 (Polaris) GPUs like the RX 470.
> Disabling DPM allows the system to boot, but significantly reduces GPU
> performance.
>
> Things I=E2=80=99ve tried:
> - Confirmed that the latest `linux-firmware` is installed.
> - Verified correct firmware files exist under `/lib/firmware/amdgpu/`.
> - Tested multiple kernels (mainline and LTS).
> - Using Mesa with ACO (Radeon open driver stack).
> - System boots fine with LTS kernel (6.6.x) + DPM enabled.
>
> System info:
> - GPU: AMD RX 470 (GCN 4 / Polaris)
> - Distro: Arch Linux
> - Kernel (working): linux-lts 6.6.x
> - Kernel (broken): 6.7.x and newer (currently tested on 6.14.6)
>
> Thanks in advance,
> Durmus Ozaltay
>
>
>
