Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F5598F334
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 17:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA54510E899;
	Thu,  3 Oct 2024 15:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k/gEipf4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DAB10E886;
 Thu,  3 Oct 2024 15:50:48 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2e0c2e42b75so188886a91.1; 
 Thu, 03 Oct 2024 08:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727970648; x=1728575448; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mtxb42Q1qe9YfoINf5NVixHUoVaN2GEgv6CoMOeI4wo=;
 b=k/gEipf4UJyjWJ8Q/05Gnxn+dta3fPEaqrOLeNNOKjCV9+Zn3lutGcIBOvizlPvRF4
 TxTe7CRxxYSrr8iZsa4q9ySRcrmKDPhfuqwANMftOGg+/gQhwP0uk5k8BV33QFRzP3tQ
 8CAJqmFp92wgv/ILhw2P7OZGbZE8sszNBWt/j0eYCBjdgbyeCjnxh5Op4Mx5WMVXTt5B
 GZ7Rq+HopPAn6n8tyJ3mmiCHzwiVFjTQPDpfyOib12B6GVm5nu3LlKK6K2KmPo37+SkX
 ka1iMOkOeThpFnLSKf2pcXfHKupxPT2GHFjOSqiO41vQHEMjk1pVTeCjaRKTPx6fwjo3
 Z1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727970648; x=1728575448;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mtxb42Q1qe9YfoINf5NVixHUoVaN2GEgv6CoMOeI4wo=;
 b=jf7AAOQQpjVYhTbjI+m3fZ+BlwhejGFBNMDZfHbKL4efbf9eJpPYezvMqeEORFif95
 i5pWJd3kSI/nt4VZn59WlAOyvZXjQzs4M1hH4qWIQdlfGYtQPnFmAqAS1AcFSxb2IkP6
 AM1DcgtcGAlUM9N2WD0kzuFEANt9PiYh2JVymzE3cAXSJBCNUokIl9MxsOJe3DVpviiN
 kK3dNIJfD9VpLbVVgIZBKTgni/cZEb071+aDHiBA3lkrMaGZlEZ369sMd1oBWU0dYqFN
 lES3FGNXtcxW9sWPH0MFuOlv5WXa/pQL4odJqMJ40c88WclUw21mmN3bBSDwZqpkN0fF
 XOGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD+zMWs4xWoBaOOweXI7IhjoElTUYcptDOpHv8QH2DvxB9uE/J9B/eN6znfz1xydrVg+v+t6p2I3q/@lists.freedesktop.org,
 AJvYcCXrOfe9HJP4eKK7d8orU6TrBe8mIWzIEPA26BdIGfSwsHiZ1Qp0LATYxxFnm0j1ZFV6bM/WtI8M@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygovzvGdhrANfsA5ElIk/22Y/ZITSGjCgpuJgMqoNIMcwWgLML
 ooQE3bXL9kbRwdUvZvX4JWhnEzuwJeN0zHkG/BSb3LzSp9Laedv9NF/iowhcxHYXntZek9uoaf9
 txnHhIEQ/AGzAYLBtIg2evH1VrTQ=
X-Google-Smtp-Source: AGHT+IERCnPM4MQcQ2AN8Pl0VihX0SJfs1pDf/Gnb8YhO0xYeHdvEeK5QCNZBFF6yBg0SncKfgH13EW7JwU9L/mU2zw=
X-Received: by 2002:a17:90a:ec0d:b0:2e0:9147:7dc1 with SMTP id
 98e67ed59e1d1-2e184993a92mr3552688a91.6.1727970648102; Thu, 03 Oct 2024
 08:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241003143640.14932-1-hdegoede@redhat.com>
In-Reply-To: <20241003143640.14932-1-hdegoede@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 3 Oct 2024 11:50:35 -0400
Message-ID: <CADnq5_O3oaA1r7911kfx-zohYEvGCBw1eDTXrX2+RH+XuGnnXw@mail.gmail.com>
Subject: Re: [PATCH 6.12 regression fix 0/2] drm/radeon regression fixes
To: Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

Wu Hoi Pok and Christian have fixes pending for these.

Alex

On Thu, Oct 3, 2024 at 10:53=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> My main workstation still uses a good old R7 250E card. After dogfooding
> 6.12-rc1 my system would first hang at boot and after fixing that GDM wou=
ld
> not show.
>
> After identifying the problematic commits I have gone for the easy soluti=
on
> of reverting both, which was straight forward in both cases.
>
> Both patches have a stacktrace in their commit message and I'm willing to
> try other ways of fixing things.
>
> Regards,
>
> Hans
>
>
> Hans de Goede (2):
>   drm/radeon: Revert: "remove load callback from kms_driver"
>   drm/radeon: Revert: "use GEM references instead of TTMs"
>
>  drivers/gpu/drm/radeon/radeon_drv.c    | 5 +----
>  drivers/gpu/drm/radeon/radeon_gem.c    | 2 +-
>  drivers/gpu/drm/radeon/radeon_object.c | 7 +++++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> --
> 2.46.2
>
