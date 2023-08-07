Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319DB772C05
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265CC10E317;
	Mon,  7 Aug 2023 17:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2742310E317;
 Mon,  7 Aug 2023 17:06:34 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1bb75afeee3so3507434fac.0; 
 Mon, 07 Aug 2023 10:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427993; x=1692032793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rLDScHjDjgU2dNICfgHVvNlYK9Try5et+YRqhYmFBk8=;
 b=PmPoOrMbUmYQQrA9L1loL6tAuljo1As/0pfzu0hEDaxMvt9Up4xwA33Y93eVRpgMYh
 OoAOjU5mtSvy6MLa9AdD2J5m1XbKuA0yUb/xekLsq2iDcstvbRf8CTkDVhfxMgXZXExo
 jDux+z+pyp/XqhHuvG5rTxfcPAQfPInoEg4qeS5hXPUQHiQMyT750PO/d1+bdEXrWlB5
 i6ghH+VSnlxra+4x1pDlWCSh8Rx+COJOBgSztGbrDdBSP7P9lbvg7V1jO8IjxpSt7NcA
 eYg+OMcJzB91+vXBNbh26ajkbc/giHF6rWT8Ulxlqdk5qmZBpS8OVJlxRG7xjMmtpbmt
 f24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427993; x=1692032793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rLDScHjDjgU2dNICfgHVvNlYK9Try5et+YRqhYmFBk8=;
 b=HjpBdZmOme+y5luVM/yYVLEVGLmL+JC6CJ+rLzvfgNbroguQ0aBaIePSQA49qNefSd
 foxe6sBJOoU0lJnBxV90PIfwoGQyOAT0cFZyKfKDT5aIpBGZ8nI8WoIJ2EGpWpdURXJ5
 xzm0b2o5kkmey7p4dpe1V49T97V5pPLaCpxbg1nytIgNZNDbXyE8tEK1QcyUaNlHTWrP
 Sj3CHFogDVRz9gZ7RHNfiXW6noFmZWCy3cFUM7QJtUc3roxXBVYXo0vhKBVoFU9D25By
 abLfbzqndXs3P0veuuNnVPJfEiby8xDhw4pCRx9OtlHUXdB8P9FDBMNDnxxUSpsbCbYA
 bMEw==
X-Gm-Message-State: AOJu0YwMg0XhXdCNlykOqaPGIOwsl4c1DLpC+ChFqZ5bMU9e4RSLB6fX
 hr0z+RjoVFpOHp/qrv9f21tb1pi4vrcmAY+09AhNhjYd
X-Google-Smtp-Source: AGHT+IHSB9fXVJNJdhoJJavHP9tjCE+HR0p7P5SqCVY6Q+IWYe9oFwSsU+jpVUt5xWFSSMteVs2tYnZYP3RYLRswnwE=
X-Received: by 2002:a05:6870:8a14:b0:1bb:75af:37b5 with SMTP id
 p20-20020a0568708a1400b001bb75af37b5mr10976138oaq.10.1691427993175; Mon, 07
 Aug 2023 10:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230802023955.10014-1-sunran001@208suo.com>
In-Reply-To: <20230802023955.10014-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:06:22 -0400
Message-ID: <CADnq5_OK0VXCNpA-aix2hCvBJ04R1FXhem+Q0eGpvtWu9kna=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clean up errors in color_gamma.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 10:40=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: trailing whitespace
> ERROR: else should follow close brace '}'
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/display/modules/color/color_gamma.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/dr=
ivers/gpu/drm/amd/display/modules/color/color_gamma.c
> index 67a062af3ab0..ff8e5708735d 100644
> --- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> +++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> @@ -359,7 +359,7 @@ static struct fixed31_32 translate_from_linear_space(
>                 scratch_1 =3D dc_fixpt_add(one, args->a3);
>                 /* In the first region (first 16 points) and in the
>                  * region delimited by START/END we calculate with
> -                * full precision to avoid error accumulation.
> +                * full precision to avoid error accumulation.
>                  */
>                 if ((cal_buffer->buffer_index >=3D PRECISE_LUT_REGION_STA=
RT &&
>                         cal_buffer->buffer_index <=3D PRECISE_LUT_REGION_=
END) ||
> @@ -379,8 +379,7 @@ static struct fixed31_32 translate_from_linear_space(
>                 scratch_1 =3D dc_fixpt_sub(scratch_1, args->a2);
>
>                 return scratch_1;
> -       }
> -       else
> +       } else
>                 return dc_fixpt_mul(args->arg, args->a1);
>  }
>
> --
> 2.17.1
>
