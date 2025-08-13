Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A491EB249F4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 14:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0497B10E709;
	Wed, 13 Aug 2025 12:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VuL3S83B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA1610E707;
 Wed, 13 Aug 2025 12:58:10 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-24286ed4505so12155565ad.3; 
 Wed, 13 Aug 2025 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755089890; x=1755694690; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhZ15xnNJ8Bsb5/U+nfBs12IH7lId86EXWsj3N0wAEw=;
 b=VuL3S83B5HrQW2zbCeMRVrEjwL9O1Px0H5M7NuI90DU/r6mY2fsZt6uFns8TQMp6me
 eOPesgrgdxA1sGvMbWYHHvlnjZW6rcQbSk6i+ID/mBoLvAR6zas6NxMoWSBdRBFV0Rx/
 caWGj0TExctWXowwDEap7QHClgf/IIk3uiET4LfrFGGinirbkl8mVX2dhkg+sjht0QTi
 U9kQbDHUtGSL7WyFQyjjO3FXEqOi4DHtJNSLpwVFw04URlpapO9mBPGGFev1Y37+Yd6h
 HQQcxx4rMQSqT9E3Nth1Tbtlq1WKkU2F4DwlnG8x6G7EzpzOrOrMVjNhYDcppzrWldtf
 b4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755089890; x=1755694690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yhZ15xnNJ8Bsb5/U+nfBs12IH7lId86EXWsj3N0wAEw=;
 b=LaRzsLWhPNMTxsTPqGtcznbsC8EjcuUEN/lUl71qhE5aC4upr5Rsqo6Zmco0M4TT7p
 r7SDQw3D+TjI9/VY+Hxz/tW6zKm5iUP/AL+9sODgSbfKasdVFfyo/UxCj41D4ziva+41
 tTBBhcXaBKH5BcNmqu73ztlHkS8KDxW/CsqPq0mZo5g8ubO6MYAb/ngYPuwisg6Ig6CJ
 6vxbc89RVe3vxYHdIVmlttf4FjQqFdORzH8kdoaZPaOG9HgAw/2GeYgI617l/KI6IRDW
 Y8BFvSn2VZ7GPcdrMLej0ztdJbYY+4noxXx0QyhLnuuPoJOJniM57t9ib+ZAkBVyNcQV
 1BZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPXz/IdwZ4hiYJHb6fvtVeASFd6QSNl4XdXvlF684G+GUI4Xsdoa2jXMG+K4M3yHXW8fn2yRsM@lists.freedesktop.org,
 AJvYcCWXDWPAB6qTMYLmUyvqhaqah1mXx3Em5N8NI0lZzgHYSEsDo1eozCYIXmWixMXBO7fCCrcmMmPTxyZC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAmhoj1KDiSGagYxjLflMv3uX2ZRT1DQQDvEbZoS1rcjBZiz5C
 I6vpAlPMwA4xhseOi6DoYtI8zA+2/wBCAdBZNcnogiokHJy7+IJSG4mtJkMENMo2woC6VJ9YI3A
 7UFTlJb8Pud4+uZcKiZfMYyTIpCjTjRs=
X-Gm-Gg: ASbGncsvzdxDAE3qXoh2aO94s67PeC6vHWaETNB8J3CBW92rZsn+YNAa67p4/7Gkijp
 4x8GCuyVFirfAtaoxzCQIogi92OWdg+F6swQ/bq0yDnj57fayya95iU2Y2aRcUHsQyqOUwC7tPV
 oCn1iy/8Y/1/AohtovvA6yrk2KhNSneGqGgxmIfI0py1FyHmweeg1lbfPfj3aH5qJYx5RY2dSmq
 v4GUUhfsTiI66NCKQ==
X-Google-Smtp-Source: AGHT+IHxKxef7KDAWgS57IBEethaxaid8oH0xBLj3YbbIW+PZKZlovPj9KRyOv5FJHyzY2EunVMbuo8q9l8uWKWf3Bg=
X-Received: by 2002:a17:902:d487:b0:240:280a:5443 with SMTP id
 d9443c01a7336-2430d0fb768mr20500475ad.3.1755089889907; Wed, 13 Aug 2025
 05:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <Z678TNhCbTk363Tw@kspp>
 <864c7dd5-0deb-4adb-a1cf-c8a809514d7e@embeddedor.com>
 <217b00f5-d03d-4624-9ba9-d838199ef7b9@embeddedor.com>
 <CADnq5_M5Jv4A5CXAKY2Qd-dhrfmecnauRtVY_ghSsut7i=KNww@mail.gmail.com>
 <d07b4edc-6048-4c10-b8ac-dcccd5a932d3@embeddedor.com>
 <d43dac3e-122d-4c16-9c1e-760eac91b8da@embeddedor.com>
In-Reply-To: <d43dac3e-122d-4c16-9c1e-760eac91b8da@embeddedor.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Aug 2025 08:57:58 -0400
X-Gm-Features: Ac12FXwFErwxayzzgdklN7bkoaoY4WArV4IyBD4hoWJZTycIfvcToKy2nH1H0nY
Message-ID: <CADnq5_Mqa2HWWKrAYTAfjdvEQTMUeB1MBnhtRxJZjXLWcz1nmg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/pm: Avoid multiple
 -Wflex-array-member-not-at-end warnings
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kenneth Feng <kenneth.feng@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
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

On Wed, Aug 13, 2025 at 1:12=E2=80=AFAM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> Hi!
>
> On 22/04/25 23:58, Gustavo A. R. Silva wrote:
> >
> >
> > On 16/04/25 09:04, Alex Deucher wrote:
> >> Can you resend, I can't seem to find the original emails.
> >> Additionally, all of the NISLANDS structures are unused in amdgpu, so
> >> those could be removed.
>
> I'm taking a look at this, and it seems that those NISLANDS structs are a=
ctually
> needed in amdgpu code. For instance, `struct si_power_info` contains a me=
mber
> of the type of `struct ni_power_info`, and this latter struct contains a
> member of the type of `NISLANDS_SMC_STATETABLE`, thus `NISLANDS_SMC_SWSTA=
TE`
> and `NISLANDS_SMC_HW_PERFORMANCE_LEVEL` are needed, and so on.
>
> So, it seems that all those structs should stay. What do you think?

They are not used for programming the hardware.  They were just
inherited from radeon.  All of the NI SMC stuff can be dropped.

Alex

>
> Thanks!
> -Gustavo
