Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C454B4380B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 12:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDA210E9E0;
	Thu,  4 Sep 2025 10:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HpGfQ1Kz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB0A10E1AB;
 Thu,  4 Sep 2025 10:10:42 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-327f87275d4so939894a91.1; 
 Thu, 04 Sep 2025 03:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756980642; x=1757585442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mzz9fRqkvT5uX5MoAuPEzgbckQvhFxni4jRgfGvmtgU=;
 b=HpGfQ1KzndybC0qKqiUJJ9sRMIEKdx28RaDfDOgM9Ue3INmwv085VuDHzvpTrtFePk
 Je6uUaOlo5u1IeQfiAiQ+PXhHK9MAu9MB6lma9cx620uxbK0Vz4jTnrPE0POsTE2boab
 Anur5PzZgS69MbTKPWUq6ZbQ9BUpJkUXifzmndzBT/btPdAl9r711DgP7Z1z2VDjzM1d
 /Ea/qQqsUzXZtkYx/Z8SiRfdznWTP1xvNLuuxpys/RDbbmfomd5ldlVFv8QyXvT6YMgR
 hPtQQwe24qOcLmPeErQLoM2IGRTrmh788Ir3gEcv1g4sZHinDkXs3JTrgWLqCKuTmbnS
 aWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756980642; x=1757585442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mzz9fRqkvT5uX5MoAuPEzgbckQvhFxni4jRgfGvmtgU=;
 b=wYcOZtTWFzcxnzWC+I1cfPEj5+ATfIHfe4fMNTMD/4JFwf0qXmFiq8bjgYiq0t5Vkd
 P2FHmik9nVzwqIgtBHKK64sXu4dWMktyT12RJifvmuyq1V6ezp6IdoBx6TF2ECLNcy92
 Ua3RFx0Nq8qbwfOhuGCr6YW+AGH5q0OkmNHa+XMfpiBWcrxjLh2DSGJeF/F2t8RbNR+l
 L8VvY3Fyy6N4csEBvDxwDSKrsjEGQT/UE/LIpTG7jiBGKKCIvbZIQ2GzH2hiqcLClQOr
 mVhz7phKblkiiFm6KhxbhCBALQmvIrS32UaAIEgjgVJ4OZNtthZanWA26IsuUD24NuXR
 AvBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7fOla08oQ5zY45eTkavuAWGNQKFODgxk5hWbsS+foY1BI/UoxZhxH/NcsaRM1bsGj0614Ks08ew==@lists.freedesktop.org,
 AJvYcCXFExC82Ls2nPtTisi1VUGV4x2CRWcz3dl/nzu9nZ8l8shIjSnKAP5sOIfP0JvwLa276Bb5SmXRnpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywg4WP5PG1DNk87Pct2WGXJmtwgwb3Gyt8ORgYK8uKSbOhiaPs3
 46+8SpIjFulZHQs67N0IVloUsyKNLOih7fGz0da45LbSLjwPhIDeL8Fw0p817n79GVGvWk7KEm6
 i+YDi8IIpz9zdxpwlj/3B2zCurZ7MlTQ=
X-Gm-Gg: ASbGncvSbmS1HflSTsrrb92X1hBF5ptkYmkUdmswrL06HZM1JW71iPw5IiCrR2EBC3T
 q1gxk5DUSH+rCq2qJTWlwxVx2Bw8UBB9jEMnN5cjYQUD7a14eNj1P/AfrEHz60eoGDiNAuIrK6D
 fPli3wEtp91nM9t07dlnbOjoYQf5heIEMFTRQQoxjG6ManyV525lOHgF5LqTfKu2osaGp3Dh0FF
 ly0Lgfua4SJhLR/
X-Google-Smtp-Source: AGHT+IEcr6S5zr86X7JbbP5sYJWvgrw9FGbOqdwNbxj9i0AU+TbarxyEOKi8uBCwkBmAEckqzOKfKywVq1s6p5aN8Pk=
X-Received: by 2002:a17:90b:2252:b0:327:edde:609e with SMTP id
 98e67ed59e1d1-3281543caffmr28305888a91.12.1756980641893; Thu, 04 Sep 2025
 03:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250904002924.2bc63b73@minigeek.lan>
In-Reply-To: <20250904002924.2bc63b73@minigeek.lan>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 4 Sep 2025 12:10:30 +0200
X-Gm-Features: Ac12FXy-UNDQKQzOziQWMNs3hr0MwNpnD0zv9eFEeEfrnSbWD3LfsO0NbySuusI
Message-ID: <CAH9NwWepSZnBP7tot9it_bDEbSC14PrMePz+fBtHfHz4ikLDYA@mail.gmail.com>
Subject: Re: drm/etnaviv: detecting disabled Vivante GPU?
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, 
 linux-sunxi <linux-sunxi@lists.linux.dev>
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

Hi

>
> the Allwinner A523/A527/T527 family of SoCs feature a Vivante
> "VIP9000"(?) NPU, though it seems to be disabled on many SKUs.
> See https://linux-sunxi.org/A523#Family_of_sun55iw3 for a table, the
> row labelled "NPU" indicates which model has the IP. We suspect it's
> all the same die, with the NPU selectively fused off on some packages.
>
> Board vendors seem to use multiple SKUs of the SoC on the same board,
> so it's hard to say which particular board has the NPU or not. We
> figured that on unsupported SoCs all the NPU registers read as 0,
> though, so were wondering if that could be considered as a bail-out
> check for the driver?
> At the moment I get this, on a SoC with a disabled NPU:
> [    1.677612] etnaviv etnaviv: bound 7122000.npu (ops gpu_ops)
> [    1.683849] etnaviv-gpu 7122000.npu: model: GC0, revision: 0
> [    1.690020] etnaviv-gpu 7122000.npu: Unknown GPU model
> [    1.696145] [drm] Initialized etnaviv 1.4.0 for etnaviv on minor 0
> [    1.953053] etnaviv-gpu 7122000.npu: GPU not yet idle, mask: 0x0000000=
0
>
> Chen-Yu got this on his board featuring the NPU:
>     etnaviv-gpu 7122000.npu: model: GC9000, revision: 9003
>
> If I get the code correctly, then etnaviv_gpu_init() correctly detects
> the "unsupported" GPU model, and returns -ENXIO, but load_gpu() in
> etnaviv_drv.c then somewhat ignores this, since it keeps looking for more
> GPUs, and fails to notice that *none* showed up:
> /sys/kernel/debug/dri/etnaviv/gpu is empty in my case.
>

Looks fine to me - no wrong behavior.

> Quick questions:
> - Is reading 0 from VIVS_HI_CHIP_IDENTITY (or any other of the ID
>   registers) an invalid ID, so we can use that to detect those disabled
>   NPUs? If not, can any other register used to check this? The whole
>   block seems to be RAZ/WI when the NPU is disabled.
>
> - Would it be acceptable to change the logic to error out of the
>   driver's init or probe routine when no GPU/NPU has been found, at
>   best with a proper error message? As it stands at the moment, the
>   driver is loaded, but of course nothing is usable, so it keeps
>   confusing users.
>

From an application standpoint, it=E2=80=99s not confusing since there is n=
o etnaviv
device to interact with. The user might wonder about the kernel messages,
but that=E2=80=99s actually caused by an incorrect device tree. If the SoC =
doesn=E2=80=99t
have an NPU, it shouldn=E2=80=99t be enabled in the DTS.

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
