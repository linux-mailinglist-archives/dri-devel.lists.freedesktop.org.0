Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8542507133
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF2410EF00;
	Tue, 19 Apr 2022 14:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA65A10EED2;
 Tue, 19 Apr 2022 14:59:20 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e2afb80550so17798428fac.1; 
 Tue, 19 Apr 2022 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=txu5qF77kz021syUspWnSzVq95Qu7gMs2hI1GWgdN0g=;
 b=BDcVCy0mQEGbuXPpCkJme82wpCfSVxCgreSd1AQrcG8cDczRdYp6fo63Zl1UesunPw
 U+7T3oBEdXRDpEg2KWIKa7WShBAA+F6PTR1cIET+TL7hiJpdY5dcimQKuRMq/tT/LXan
 JqOlL1xYoi4+pfxn//1yfmGhfJKw41MR5D28CjSMGWBLL6EcSv7cebg4hlEdqKKDrDKl
 lHBIoE3gp2GlIZeRx8yEJThzNHeVJblMX9/2Dmo0yQ+3xRfcDzAErd6DCNTAISNfsAFw
 II1R2VA/PxqGjA52stjrt2fjgMj1ZAZmf2WHvwt8D3qOCAIPe6DyOldDy9ZLlQGvH95K
 /5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=txu5qF77kz021syUspWnSzVq95Qu7gMs2hI1GWgdN0g=;
 b=kolq5eAbxDxgUE8OU622KPqjHK8uMhLalQnvxsNFgIDV9FSapnUNyIZIgGVA/0MLMZ
 CwGZtCBIKs8aCCkEDo9ptjJ3MEta5AcHeWEjEeXmQunQzKqvg3T2FGmS6r6mAtRn41O9
 4UOAHdDIHOU/oDRBMiuU7Eb1haFXlRrwgVK9LBwzrINxDWmUSJhq0irVrJORcN0MTX8i
 HaYA4DEQ9UuIlrpEKmmM+iH53rJ/UioorVMcwukewEKFcRf5nQtHwMj7WXhug0ffxBPs
 4RKQrphlogVIDVtcF9Ra3B8FeCPgG3afY5Mh2oVBzzDvt5Md9rz7TlUKekWlM4VgFSWE
 0/1Q==
X-Gm-Message-State: AOAM531SX6UvnsBQiv9yZFcC2i5ivRQdnQzB43Vrm01PYJQNfsMQsKgZ
 cmyW0pAkvhW7VfGEE6Y/ZmQ2T6BMPsUx4AfQZA8=
X-Google-Smtp-Source: ABdhPJwkeTzLw742f1pLT1h5HcgounlwYPVNsuzflB54s8eFTAPlS5s6EXzaHdH41CdsZRH5FTve/PqKvS145BOY6YE=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr8077760oaa.200.1650380360073; Tue, 19
 Apr 2022 07:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220415195027.305019-1-tales.aparecida@gmail.com>
 <20220415195027.305019-2-tales.aparecida@gmail.com>
In-Reply-To: <20220415195027.305019-2-tales.aparecida@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 19 Apr 2022 10:59:09 -0400
Message-ID: <CADnq5_O9rV+42=7Lyy7dAwVZkBoxJgmwn0oavzN1pVBmKFLfcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation/gpu: Add entries to amdgpu glossary
To: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, andrealmeid@riseup.net,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series with minor fix to capitalize the U in Compute Unit.  Thanks!

Alex

On Fri, Apr 15, 2022 at 3:52 PM Tales Lelo da Aparecida
<tales.aparecida@gmail.com> wrote:
>
> Add missing acronyms to the amdgppu glossary.
>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/1939#note_1309737
> Signed-off-by: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
> ---
>  Documentation/gpu/amdgpu/amdgpu-glossary.rst | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> index 859dcec6c6f9..48829d097f40 100644
> --- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> @@ -8,12 +8,19 @@ we have a dedicated glossary for Display Core at
>
>  .. glossary::
>
> +    active_cu_number
> +      The number of CUs that are active on the system.  The number of active
> +      CUs may be less than SE * SH * CU depending on the board configuration.
> +
>      CP
>        Command Processor
>
>      CPLIB
>        Content Protection Library
>
> +    CU
> +      Compute unit
> +
>      DFS
>        Digital Frequency Synthesizer
>
> @@ -74,6 +81,12 @@ we have a dedicated glossary for Display Core at
>      SDMA
>        System DMA
>
> +    SE
> +      Shader Engine
> +
> +    SH
> +      SHader array
> +
>      SMU
>        System Management Unit
>
> --
> 2.35.1
>
