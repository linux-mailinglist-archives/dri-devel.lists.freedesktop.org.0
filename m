Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D6CB2F8DE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B827510E97C;
	Thu, 21 Aug 2025 12:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iU6zrAlU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3A710E97C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 12:52:45 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-246163711caso577005ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 05:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755780765; x=1756385565; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5NFJHJToPY5c0jfPG6MrwrcNdfj7hp17HoGeXCaC+Y=;
 b=iU6zrAlUmJJSXks6TV+tA/Gi128BwkjUTbBJiQmRPceNtRgTWJBL+HyAEp4WrIiCb7
 aUwVxJNZ5d1vnuImkmdeAH+x9lq/DuJCNMfV+X6zmxS1Knn5UPQPW0SsG8xVZYD6i8rc
 xTIFcSHTPdCaff1qmvDCwKBfRxlb3b5EN8cpjsZUYOyPsW15VogiQxupL/nc/1r0JXi4
 qKhEZcg1oXdeSpk+kWRbRmkR0AVa44XYJef9/+dinMEPHx6WA7hH65pWDyILYGzvA4YS
 K7LYDOSxNlUxiFamR3A2RMDMgaPS5mP3NNYZ/dnYiscDqAm9dqB9zYAVO+NLOvdlERHW
 4IEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755780765; x=1756385565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5NFJHJToPY5c0jfPG6MrwrcNdfj7hp17HoGeXCaC+Y=;
 b=ufp6pzOuG4FBU4N/BKeU1e8R2/12e0QNMW52lZsyWlWwDkwW7Pl77Ed4hnU4TPzoKU
 bbW44/s0jKzRs3o6GBs/jrvB9avhXJ539AYVGNjdyIyDQpQ0GVjANwWjPsObaE4l6ItZ
 MBzrJOk9Qx9FNm95iZjE2kQmsT9o2Ur0OmYreWWsWO621T2SUoMJ/L4p0lZXi9ZZ8U+X
 Bj9kK57RHFXwTp1l3NQvQ9cR+lo0InELJIS/HMZshIruKdz2bN06FeNFG2s9HurhV7ce
 ARoNeZaWJTwMkqxxvWfA63d6OUREyjbySCwoNlOPfWfflTeRxsABErBMDCBAW/H1+vzN
 VtiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5HbHZaIsfTJ2YFkjtotWDs41pfufhVxeVeYxDtaYVrVcUfju1WiuQKcOBF6HaEEM8B0xkfAbdzXM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUYDkj8J9vcEKS3FJ2Ev84CFGtIU578t4OMODXL52/lk3gskn2
 SCWt3dtFGmwwqMOD393nnXOdmLBdWOOaJisjLygBiEzjWnSY/yo5/vWsMoMqcKThRPee9pZvb54
 G+mzSha41pjW4yOwITlQUmDG9BACtRhs=
X-Gm-Gg: ASbGnctm55cv5I7z0FJJ5OQ+26gNRKyI+oyZpndyywcLUja17OO9DWPdDuSHEn0Mps5
 SRmTK2icK/8CIC3Q/TMS0i+tfkRcFNGwziSIJLgwSY9HNzfNhRUNvj98WdCW6P/g9PnoLhDAAPg
 p3ebDvWTfjEbt8erqBYzHyF0i3Wu1gMr0RqVA1BOO/TOdUEyaWyCkR8WEbadm13nC6q00rtJtQO
 T8Delo=
X-Google-Smtp-Source: AGHT+IE1R9pueAdp5VMLQpWl5CC+yKc4/2DL/OI76SVE9etO8cB6WdqmjzEBP8sVRhoWzSGG4UVBbmPvRTfJRCqssdY=
X-Received: by 2002:a17:903:610:b0:240:764e:afab with SMTP id
 d9443c01a7336-245ff89cafdmr13185205ad.6.1755780764612; Thu, 21 Aug 2025
 05:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250820233817.4050006-1-lizhi.hou@amd.com>
In-Reply-To: <20250820233817.4050006-1-lizhi.hou@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Aug 2025 08:52:32 -0400
X-Gm-Features: Ac12FXwhzdJf225YIiSFvoai9KNyKZln0etB11o5p81pX9w3DGHzvfztlQg-ZAE
Message-ID: <CADnq5_NjpN79sWt9t9Zw2u=OkzpGOfMqjhUxSyyLNaFesdjObw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: accel: amdxdna: Update compiler information
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: ogabbay@kernel.org, quic_jhugo@quicinc.com, 
 jacek.lawrynowicz@linux.intel.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com, 
 mario.limonciello@amd.com
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

On Wed, Aug 20, 2025 at 8:03=E2=80=AFPM Lizhi Hou <lizhi.hou@amd.com> wrote=
:
>
> The compiler information is outdated. Update it to the latest.
>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  Documentation/accel/amdxdna/amdnpu.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/accel/amdxdna/amdnpu.rst b/Documentation/accel=
/amdxdna/amdnpu.rst
> index fbe0a7585345..42e54904f9a8 100644
> --- a/Documentation/accel/amdxdna/amdnpu.rst
> +++ b/Documentation/accel/amdxdna/amdnpu.rst
> @@ -223,13 +223,13 @@ Userspace components
>  Compiler
>  --------
>
> -Peano is an LLVM based open-source compiler for AMD XDNA Array compute t=
ile
> -available at:
> +Peano is an LLVM based open-source single core compiler for AMD XDNA Arr=
ay
> +compute tile. Peano is available at:
>  https://github.com/Xilinx/llvm-aie
>
> -The open-source IREE compiler supports graph compilation of ML models fo=
r AMD
> -NPU and uses Peano underneath. It is available at:
> -https://github.com/nod-ai/iree-amd-aie
> +IRON is an open-source array compiler for AMD XDNA Array based NPU which=
 uses
> +Peano underneath. IRON is available at:
> +https://github.com/Xilinx/mlir-aie
>
>  Usermode Driver (UMD)
>  ---------------------
> --
> 2.34.1
>
