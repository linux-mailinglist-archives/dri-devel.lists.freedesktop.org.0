Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF03ACBC5E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 22:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA9610E589;
	Mon,  2 Jun 2025 20:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gFWQNj3j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B2310E589
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 20:37:32 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-601f278369bso10202510a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748896650; x=1749501450; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQ4HWERFvpSkN8fGQnxpF4piNxSncvt1TtjfZIpZmnM=;
 b=gFWQNj3jfvWa4MQ5HvJi4oZf3iR9h3VqJus9a6EbeQc+kuzww93BCcdjjbhcNvG6rv
 j1h0tDYezDv43MD6JUWG92TbnTnmA1UbBdL4TB6kS7ciBuiM98M8uplj2l+LTMUNG/FY
 RV2a7pgLcjtAtalSO37tJci0fAcU1/rGuXGibve+b9B53JJD4lUIDrlc1YKzkPysZupr
 itGyBm7zY2tZ6SYt1jkU6KalV6xeVY5cK1G4rLX5FRHWVeeu71mSJZX1OOt3XfWtrJMT
 2PjpHOzjISmQ6kdJhs70YLZx8hbvHqkVaCC4JwYCTEoqfltLTFsZ265XfJ6ZoarfMhJS
 l32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748896651; x=1749501451;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yQ4HWERFvpSkN8fGQnxpF4piNxSncvt1TtjfZIpZmnM=;
 b=NTC9PDNPGB3DsjCLX8euRX33NfmzyDVwFp3QQAOOxSg9bO5Rh87yietKBB0zGyavPr
 wxKaU76Q0AjTM6vfHfJQ95PPySAfeRRM0htAnMuD8mBZ+FoKSq/XMvQweGkSusJv0wWh
 /7jaQ18AtgyeryQZTk5XszIydUyOT7bCq889lOEZ+mYxj2Fp0r7seQoyuC1CRfoRddK+
 6OAKHXrTQDmC+F56Q5tLhNna6OOCzJwSdJVJaKPy9xT2Y+IiZkJPvOpwGlzq31KWEPwu
 etCvFAugr9qZYwbPNsjVhwhKt5I47oKE7LDYa8VhmLiZ/SNcHcdHneXRgNRr+kcRI216
 EziQ==
X-Gm-Message-State: AOJu0YyjB0uiIZmy2b22JehFyHyTvf4s7s3JX5qBFp+wNXlGEASva9KF
 /vcKwQvGA5p/VX/3oX9EdiwFFJ8SyNI5KDMHkNKEpUwWmFD3myCxVkObjsDIyDf0o3Ei6j9Jd8h
 l0BtLBXNGOjX/2AfUaqEvLRC+KQDmj/8=
X-Gm-Gg: ASbGncs8GDA8un9ncKxj5ZLlfX0WKVHEFtUJz6OnmWgL19rq/tbVG1ZtI0eN0ns7Dyt
 q0VBMMjV1usgOJ3U/MAu6kIMcdlpVbxpmGdPYqBnJvbJQYnOtxJ6/zRuvYM9QszkApT+WmSu7EB
 g27anrRE04D4F9A1ehQ/6UvqAGigeE5nahXvlk/cfcgw==
X-Google-Smtp-Source: AGHT+IF+NUb3hn01gHtw3++HDKEXHIeen2ouGP6mNEiqV4lDWgohZ6Pe/De/43YCZGXW+QGHVumR5njq1uy6hL+96yo=
X-Received: by 2002:a17:907:9801:b0:ad1:e4e9:6b4f with SMTP id
 a640c23a62f3a-adb322b2c9cmr1367807666b.36.1748896650458; Mon, 02 Jun 2025
 13:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tx++LWvKMfS556+CDcw-bWxf6vD6JtiwpAjspuc7Qeh_A@mail.gmail.com>
 <c2571f57-3be4-4f8a-b442-b8f01dc5979f@amd.com>
In-Reply-To: <c2571f57-3be4-4f8a-b442-b8f01dc5979f@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 3 Jun 2025 06:37:17 +1000
X-Gm-Features: AX0GCFtZYuk5yBP26PHeXz6JUvASz4I2lH5hFCCE8B_PANVu-62vvzIDjlFowII
Message-ID: <CAPM=9ty3STCUsa=a06RzNvHD+SbTONPVqpA9UEp6=tgt9+fYHg@mail.gmail.com>
Subject: Re: ttm vs aarch64 mappings
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Will Deacon <will@kernel.org>
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

On Mon, 2 Jun 2025 at 21:51, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> On 6/1/25 22:50, Dave Airlie wrote:
> > Hey,
> >
> > I've been playing a bit with nouveau on aarch64, and I noticed ttm
> > translates ttm_uncached into pgprot_noncached which uses
> > MT_DEVICE_nGnRnE. This is of course a device mapping which isn't
> > appropriate for memory.
> >
> > For main memory we should be using pgprot_dmacoherent which translates
> > to MT_NORMAL_NC,
> > pgprot_writecombine also translates to MT_NORMAL_NC.
> >
> > Now I'm not sure anything gets this wrong right now, (except maybe
> > nouveau), but I'm wondering would adding a ttm_uncached_ram caching
> > type and rename ttm_uncached to ttm_uncached_device, if that would be
> > a good idea?
>
> Let me ask the other way around: Why is nouveau still using ttm_uncached =
with system memory?
>
> IIRC there are only two use cases for ttm_uncached: >15year old AGP syste=
ms which for some reason can't handle write combine and MMIO BARs.
>
> E.g. for amdgpu the doorbells and HDP remapping are mapped with ttm_uncac=
hed these days but nothing else.

Well I'm not 100% sure what is valid here for nouveau to be doing.

There are three types of aarch64 deployments from NVIDIA,
1. dGPU in an aarch64
2. tegra where the interconnect isn't PCIe
3. Grace Hopper where there is NVlink or some such between the CPU and
GPU and in theory everything is coherent.

I've been trying to get the last one working a bit better (but I've
given up for now). On these systems there are a bunch of things we'd
normally place in VRAM but due to other reasons we now have to place
in GTT. On ARM64 NVIDIA seems to force uncached mappings for these
particular shared memory regions. Nouveau also has a similar path in
place for tegra systems, where nouveau_sgdma.c picks ttm_uncached,
then we end up vmap'ing that page to map it into the kernel side. The
vmap changes that to pgprot_noncached which to me is the wrong thing.
It doesn't seem right to pick ttm_writecombined here, though that
might just work, hence why I suggested adding ttm_uncached_ram.

>
> > Has anyone else come across this problem with TTM on aarch64? or
> > understand if I'm missing something.
>
> If I'm not completely mistaken both pgprot_dmacoherent and pgprot_writeco=
mbine map to MT_NORMAL_NC because there is no such thing as uncached system=
 memory without write combining on aarch64.
>
> I mean why would you want to do this except for getting the MMIO write or=
dering right? Avoiding write memory barriers?

I'm not 100% sure why tegra does it in the first place, I suspect
working around lack of knowledge on what is correct and just hey this
works, so move on.

Dave.
