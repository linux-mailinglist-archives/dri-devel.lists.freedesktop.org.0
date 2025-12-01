Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B37C95AB6
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 04:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B48C10E03D;
	Mon,  1 Dec 2025 03:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gf6yPULd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD4810E03D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 03:51:46 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8b25ed53fcbso527486885a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 19:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764561106; x=1765165906; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VPDvjmWmstCZs403kLYZUcqozaowRwzBovq4hKgB4II=;
 b=Gf6yPULdbwiYJEfzesk7pII4oXtyPO4g+cAbd+6A9EZWXm9wSupyjhzbItuvF97dPG
 0q1RFoJpxMcTa2JqPh3YIzsBUeng2diVEQVckacjjuW0oBbVkUsY0bFN8hUO0DdS3Mpm
 NSamOZiyx2zfpPfK0PpI/G1rTQXnh4UguEUvFCTKZsAEW9OzOTi1yOMiDNsqc8X8TadD
 8PayWSB48HJ6G6GkVSwZ/qVI14gSl+/poiRLlmHd6Po+82JNGfSVq8ao3PjwVDHE1RTg
 O1KOy6z3oIjfgPoxYLBTBHaU9m69Xykxdo5CMT4jwjQeKt9OTaQrWe8/u62YLCN0rT2m
 J4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764561106; x=1765165906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VPDvjmWmstCZs403kLYZUcqozaowRwzBovq4hKgB4II=;
 b=HP4OEi+wka05g92IYeKtvP3INxGqN9QL8A9m/UxoitFFvCMVcaBvM1ofaSLpJnjoQo
 cqBpTuemg0F0fmhvCNqKQxMlyLg7wyvTR2CCWyw/F3UwzbxFhE7HM0unefbh87zu8YM6
 wuVNiy4sqO21xyvbimoy3QrourmGbU9x1e5+N11HxpnOpf2fjYJEq/QriRDcp3fdxvH2
 dPvqhBumm6y/icHMkWLUujJfvCzrMQDgf3OkWkXshy7L5u2QX75ucaI+zSANichg6Dp4
 14npG8Q/4gf6S4D33c4ce2g5Am1ExxS7h4zWUXkVSqkkx8u4O5hr2jUHktfmWPiAnxCp
 a4EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaTl+dpih/dYwMTytz6UH/LcTH1m18rIdY37c0U5uQwiBWb2/Iv2CHylh91yPLgSTngCj+t/EsQ3M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw868qK4WKfHDk6vqzn3deKAbTgzCm4zB7FSiLCUe33BsdLqYgt
 blZFX9le6jzGAR7JodcA3jl6LqmLfMcFXaQCFOtFvtO4RZGMf+kVBPUoUeu0SrVOwJHhUrP2o8p
 8TZJMYrk7efBHtOqx221ZqxZFdvDFZk4=
X-Gm-Gg: ASbGncv3w8hGvlKkWoUuDl/XCEg7dQa4m3Pzq04aR6ni3+4lx4L40qb/x+8SvxHNtbb
 cHKyk34KbTWK/MgURvinaE35GvsBOKGVDbg8HzAPrbkguGQBqAJZotR/i25vKgltcJWOLtLbeVZ
 EDpPTsa/qUuZgQ6CbFF4aKQ1qqjx9U46gpClZPbbmQBQE8UcGwYTx6c6lyd9psjExyvJcEjp8DZ
 plVMx/4+PlILImM7tONUjBshxNf8aNxrmRbfwsHuprLRCjYxne42jceADPPm1M8LarJ9w==
X-Google-Smtp-Source: AGHT+IENLrKf8ZvtsbVdSEdOPpi7r72ocwGWKSGb+wdCtQSjh0/U4/sVoF8VaRnzcYtDaessP8NKZiHFHWiHIPIqohs=
X-Received: by 2002:a05:620a:f13:b0:8b2:e069:6911 with SMTP id
 af79cd13be357-8b33d4cac8cmr4497623885a.59.1764561105765; Sun, 30 Nov 2025
 19:51:45 -0800 (PST)
MIME-Version: 1.0
References: <a878e155-4a20-4a6e-8a9d-783117d4fe8c@intel.com>
In-Reply-To: <a878e155-4a20-4a6e-8a9d-783117d4fe8c@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 1 Dec 2025 13:51:34 +1000
X-Gm-Features: AWmQ_bkH-fNa5-FuUvil5JWTOME_pdvqsUrVTWPYxV7f62JXP55q-R1vHsO4NLM
Message-ID: <CAPM=9tx4ASiN8VB6OUvOEzwOPaXO0tM4-q4ZaQRKmtdoTTRF3Q@mail.gmail.com>
Subject: Re: [git pull] accel/habanalabs: Gaudi3 support and updates for v6.19
To: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
Cc: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, "Elbaz, Koby" <koby.elbaz@intel.com>
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

On Mon, 1 Dec 2025 at 11:04, Sinyuk, Konstantin
<konstantin.sinyuk@intel.com> wrote:
>
> Hi Dave, Sima,
>
> We are excited to continue the upstreaming of the accel/habanalabs driver=
.
> While maintaining the momentum with Gaudi2 fixes, we now introduce Gaudi3=
 support,
> covering the development work done during the 2021-2024 period.
>
> This tag contains habanalabs driver changes for v6.19, continuing the pre=
vious
> upstream work from tags/drm-habanalabs-next-2025-05-25. It includes impro=
vements
> in debug and visibility, general code cleanups, and the finalization of G=
audi3
> support, closing remaining gaps relative to Gaudi2. This is backed by
> foundational features such as the MMU v3 architecture, ODP (On-Demand Pag=
ing),
> and enhanced security infrastructure.

As per https://www.kernel.org/doc/html/latest/gpu/introduction.html

"All feature work must be in the linux-next tree by the -rc6 release
of the current release cycle, otherwise they must be postponed and
can=E2=80=99t reach the next merge window. All patches must have landed in =
the
drm-next tree by latest -rc7, but if your branch is not in linux-next
then this must have happened by -rc6 already."

This is new hardware support so I was seeing how nice I was feeling,
but there were a few messy bits on initial review, so probably will
have to wait for 6.20.

>  .clang-format                                      |    179 +-

I've no idea who owns .clang-format, but changes to it should not be
happening via here, it looks like it regresses and changes a bunch of
stuff unrelated to this.

diff --git a/drivers/accel/habanalabs/Makefile
b/drivers/accel/habanalabs/Makefile
index 98510cdd5066..58c51f03858d 100644
--- a/drivers/accel/habanalabs/Makefile
+++ b/drivers/accel/habanalabs/Makefile
@@ -3,11 +3,16 @@
 # Makefile for HabanaLabs AI accelerators driver
index 98510cdd5066..58c51f03858d 100644
--- a/drivers/accel/habanalabs/Makefile
+++ b/drivers/accel/habanalabs/Makefile
@@ -3,11 +3,16 @@
 # Makefile for HabanaLabs AI accelerators driver
 #

+CONFIG_DRM_ACCEL_HABANALABS :=3D m

that seems suspect at best?

+ifdef OFED_PATH
+KBUILD_EXTRA_SYMBOLS :=3D $(OFED_PATH)/Module.symvers
+endif
???

        timeout =3D flags & HL_CS_FLAGS_CUSTOM_TIMEOUT
-                       ? secs_to_jiffies(args->in.timeout)
+                       ? msecs_to_jiffies(args->in.timeout * 1000)
                        : hpriv->hdev->timeout_jiffies;

There appears to be a bunch of reverts of upstream developed patches,

78cf56f8832a932ade20b8340a029ace14ac0e98
Author: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
Date:   Tue Feb 25 20:17:17 2025 +0000

    accel/habanalabs: convert timeouts to secs_to_jiffies()

Please re-review this and make sure you aren't rewinding upstream work
that never made it to your internal development tree.

Dave.
