Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1331A39D07
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 14:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3040C10E6BD;
	Tue, 18 Feb 2025 13:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S3oBlvT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7EE10E6C6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 13:11:41 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-439846bc7eeso13203015e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 05:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739884299; x=1740489099; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Gxz57Ja5je6U2ZTaisSqkmyjkSmHJX/va3lMls+skk=;
 b=S3oBlvT/JcO25gZ8i2OZkhuYhpTAPDeTcFvX5h1UPU2s/q1XVsOltJsnDfTRoMDODb
 bDNKWd6ln5ni5j8/lOBiMj9f4qM+07lKoNzogfaA10AHf0yZ9hGaHV2ABKaj/WU1ligQ
 uR7nfl0/d5/AIaJqRLQmkW4XsPkbQOIAZ33LICy5MWRpf0k8EyXLLO8kvPRKzn28n3VL
 jvpkyGz5O5Zw6W6CN+hBScFSvsZMawzvV8BYoJw/g6iTVHjGR1+pzNXjC2Nz6d+YELtA
 t/uM8hxxpCc8WXj1TRkWDMOjK1+kGc2ija6xmBaCG98lzGUBKuj+qIAKQJRa5Upn+WgH
 CjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739884299; x=1740489099;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Gxz57Ja5je6U2ZTaisSqkmyjkSmHJX/va3lMls+skk=;
 b=sZ2gwXEW2wcits8268Rp1bMTW+0B3gjymebWteMpOFYXDI4pHMKmuJG+WvajkxDW2D
 l5vTPW0FH6uHFy6TqWvzYIZ/5XGDuNcm92yMZpUu7K+9zT7Kv+FVRiwosNTPjoe9lA6K
 ss+tHLmgteEY0xW9GnkGewHsG/vY1l4DegV4WrMHTZI1O0Q66ixzpvrtGDuMaf/dZS5x
 SmBhS/TwjgvmQVj8t5dKx3zF/YdI4F0KosnnSJ90JtgZ0DyEDlqLWIWaVRHZFb/X0DC4
 AJA/lJQiJTdVAeLfoiAJHOXaAdLPWMZzwvQDZjO+eIWo4vmmop2/6eXxIXevCOnwHBjI
 ba2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0YzKy8/FLcwYxjZUr7rxd5eZEv7w4TsujaQ8OKNnxN81ugXAFLI94Js6l0woaANYGXCr/HSQMcMU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn8Ia0wb/Usu/mmWpWXAVBJgFtMgF8/PiJtcHzO3dnSuNogyL6
 Xk+DDumR3rGxlih397BlMV5OlDzk48XRJWGPa+buJlxykhlZBShKVpdHIsK95DY1fgSRupJWfhx
 uHognWBjv1zaG+PkXpSQWyFIQ91A=
X-Gm-Gg: ASbGnctyvhgSpGVcYRZ+D4v9RpIPNX5Scup+VVS59VJd1RtlRIg0icMRvRpW78UqFRc
 RyruqV4NT+itGeFY3RXX5ZRu0u2Jk3Lc54Ua64ueU2/HX2mMc5KBj1FrhUTveIpRXCTf3gfpqJA
 ==
X-Google-Smtp-Source: AGHT+IGTuZJNQwMJ21Zt/iwu+Lwt8FGFWYP/uZLJHHppf6TYhsiA73LzqKrd96Z1UlFBGMruWLJon5RgYuny/0jUXqk=
X-Received: by 2002:a5d:64e6:0:b0:38d:e15e:17e9 with SMTP id
 ffacd0b85a97d-38f33f5344bmr15197897f8f.35.1739884299381; Tue, 18 Feb 2025
 05:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20250217140910.108175-1-clamor95@gmail.com>
 <c19bd9b3-86c4-4f1a-beb9-b6aed32b3ef5@suse.de>
 <CAPVz0n0WG1Q51SONb4fmkzi4q7Q0sZ_aKSLrLnGboNNya6nO+Q@mail.gmail.com>
 <871pvvqu0i.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <871pvvqu0i.fsf@minerva.mail-host-address-is-not-set>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 18 Feb 2025 15:11:27 +0200
X-Gm-Features: AWEUYZmfbcsOHj-xZvsCFi1MGPu06qG3yvCK-zcho_dMe2UGKIBGPZimeQMuN30
Message-ID: <CAPVz0n1MdCccD5gHK0Z-mMHJ4Erf59_pBSU3+Jenmfr92Fky9g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

=D0=B2=D1=82, 18 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 15:09 Javi=
er Martinez Canillas <javierm@redhat.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Svyatoslav Ryhel <clamor95@gmail.com> writes:
>
> > =D0=B2=D1=82, 18 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 14:36 =
Thomas Zimmermann <tzimmermann@suse.de> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> (cc'ing Javier)
> >>
> >> Hi
> >>
> >> Am 17.02.25 um 15:09 schrieb Svyatoslav Ryhel:
> >> > Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P8=
80
> >> > and LG Optimus Vu P895
> >>
> >> There's a driver for Solomon 13xx displays in drm/solomon. Did you che=
ck
> >> that this new driver isn't just an extension of the existing code?
> >>
> >
> > Definitely no, ssd2825 is a RGB to DSI bridge in a pure form. While
> > 13xx as you have said are display controllers family.
> >
>
> Exactly. Both chips are from the same vendor (Solomon Systech [0]) and my
> guess is that the SSD prefix means "Solomon Systech Device" or something
> like that.
>
> [0]: https://www.solomon-systech.com
>

You are correct, vendor is the same, I have not denied that, but the
this device is not related to product drivers which already exist in
the Linux Kernel.

> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>
