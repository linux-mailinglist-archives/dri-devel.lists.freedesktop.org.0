Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82946ACF475
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 18:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B5E10E2B2;
	Thu,  5 Jun 2025 16:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="XYymoCap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BC410E2B2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 16:36:39 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6facf4d8e9eso13656566d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1749141398; x=1749746198;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/AMED1uCKw6PLorZVcAc+las3T70VIL6/pCq2JraOc=;
 b=XYymoCapLV/VjGfEQFRUUmbVE1KbGXaI29p809KwdVS4CG9/YsFpHyvmERFPDBHH6D
 QIDY6pZYoOkQFPeJ4GAoHNqw14AA+x05k5WhnQ/PKW3EIujHUP/5ZIOjdga30xOE97zN
 9FSrYuS+i6kMuDzecwY+9t3dnwxcoyqxoN91+mHdPttpOSufJ8NEJEMT/vDnhBgl/AIe
 2/ITaVmMrgUgY/96nboPANYzn4lOrdlIjHS56+NgfgNCwL4CKgmEFByqMWvV9v2O5PdE
 hnjK9ROffcFckI6y7v6d9UM/Lp3EPfFQPtdaTRqCci6fr3CnrjBqoGfm4gSscnvsSOD7
 kpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749141398; x=1749746198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m/AMED1uCKw6PLorZVcAc+las3T70VIL6/pCq2JraOc=;
 b=Ec560U/PbDPgFSh/Vo+KW8I7rXp52eqUAfFlbMmCegR6BiJffueWaG/BWbwkn8Ubir
 10ZFBcaol/3SZRFQQ5kLVlV1YK4Mxx8XStf+5MT5wPwnGnpDc4ID3x0UeEpG/m1Ynccm
 bKsJyGuPnd0eohW3r59OCiOzV2BKeKHJsiM6AwEQINXPZklDVooGdZ8PV3c6PUVuJXvg
 hrGAJ4QOLhTZ/rKUv7G8xAMSOFpbCvguEaYHa67PzgZRdC2dpZ0Kom1I2PThJfTjApNS
 i/CY2FwuULsyn8Htxd7q2zsqRiOZXFTYDyiLc/vYS9igtPL1TOi07ESgC51SbNdN8fJk
 xlOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPZ6KaQLOXRWouyudA+VzKehXdDPcg2EMHNxUaI/+9yA0gegPzC6/hkyrdQK2bRgO4gNVKaNAipww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQT2wa89t+3X0rnFfpVsuqEwOigFngvvVt/8odWyMGgZw12ImB
 1sit/yX4pRRUAMEP3JxdQPHCBhMOPgjaizxxO9+jT7vyTN1sH1yyhbZPfl1vZdkI5919ZGMnbJC
 yYXdEnqjoWOT6TopcvUvDU7pRDKSWiIn+eKvIQleSDg==
X-Gm-Gg: ASbGncsnicsg3uaTUMfFum6EeU/j7vOwcixUYzq0BYn7pODpJHR3iR0btN55lZ9xJ4/
 kHjOEzNFkk0UVigWVKCxLi0RjtXKpqIJVE+Pv52A/7h3xsQEMEptpkvwVPLtUWPaCO/Fc8V3twp
 EX2O4ALEWLuF6VJmPCBhkEnTCg7DrYT3o=
X-Google-Smtp-Source: AGHT+IH/vUqInLnUsBsqIxZVLljlV2JNq6TLN0zeIbDOndYPLtFZP9dtkbRS+wnOk9zZ8yyAo/Oy9zg7yUbo3S0v9LM=
X-Received: by 2002:ad4:5dc8:0:b0:6f8:8fdf:f460 with SMTP id
 6a1803df08f44-6fb08f4d0a5mr2148076d6.9.1749141397948; Thu, 05 Jun 2025
 09:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
 <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
 <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
 <3a8e1101-469b-4686-b160-6fdb1737a636@arm.com>
 <CAAObsKCjv=K7Dk=QD+MAqwWUNyw_pCh2Eqij3Qwx1jzKoKg4zw@mail.gmail.com>
In-Reply-To: <CAAObsKCjv=K7Dk=QD+MAqwWUNyw_pCh2Eqij3Qwx1jzKoKg4zw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Jun 2025 17:36:26 +0100
X-Gm-Features: AX0GCFsF7cxglaKZSX8Koz---6tL_CI5LfT0LL-n_NzmXSV0kUJg5xHMCVro-r4
Message-ID: <CAPj87rOggG6_wNHvv55onxcw00UxASUJYK2pmdkc+oUmYFyp2w@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
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

On Thu, 5 Jun 2025 at 17:32, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> On Thu, Jun 5, 2025 at 3:37=E2=80=AFPM Robin Murphy <robin.murphy@arm.com=
> wrote:
> > It should only need a single IOMMU domain per DRM client, so no faffing
> > about replicating mappings. iommu_paging_domain_alloc() does need *an*
> > appropriate target device so it can identify the right IOMMU driver, bu=
t
> > that in itself doesn't preclude attaching other devices to the resultin=
g
> > domain as well as (or even instead of) the nominal one. In general, not
> > all IOMMU drivers support cross-instance attach so it may fail with
> > -EINVAL, and *that*'s when you might need to fall back to allocating
> > multiple per-instance domains - but as I say since this is a
> > Rockchip-specific driver where the IOMMU *is* intended to support this
> > already, you don't need to bother.
>
> Ok, I did just that and it's working great in my testing:
>
> I create a domain when the client opens the DRM connection and map all
> its BOs to it. Then when a job is about to start, I detach whatever
> domain was attached to the core's group and attach that client's
> domain.
>
> Will send a v7 with it in a couple of days.

Awesome, thanks so much for that Tomeu!

Cheers,
Daniel
