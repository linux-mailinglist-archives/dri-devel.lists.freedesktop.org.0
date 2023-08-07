Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E11C772B3B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C012989F1B;
	Mon,  7 Aug 2023 16:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D17910E2DE;
 Mon,  7 Aug 2023 16:40:00 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1a28de15c8aso3585572fac.2; 
 Mon, 07 Aug 2023 09:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426400; x=1692031200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GF3Lr/DH212oz0lCEyjQCKmiNVG2MspdIl8pBQl0rIA=;
 b=WdYrITzlxccrOy5/lKmsTwjw3lg46asLWh8CjyG+F/RL43pyNd3yUtGdXWX6p/y4P/
 V2TLwuyx3WiBUpp4/spOQuhSYS7Ey1/kfmu8HxwAbIzpOUXvjAu/ujL9QM7WkHA5/VU/
 Uv8tB4zvTsVy0MxjVXrcow1RG4Z7eJVtQOFu8hyOQZbyn98aWnk6IAk9EdCpchMTEtg4
 YrSD5uIs/dWyH3W+ba9+kbSDpZorSxRR1rjAJvkrOkta15LdkQiy7D6Q2XXLvaoe9tAH
 BMqO5AxkCCBKwCiBwYOjgDKgyyHc6qRI2BTDmxNuyNAlB4zx9K1kU9a5d1G4I9HLlcMW
 mYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426400; x=1692031200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GF3Lr/DH212oz0lCEyjQCKmiNVG2MspdIl8pBQl0rIA=;
 b=LI4H/od2pOkGtbFw7NDJedWtNW9yDnqVwg9rIYS/SL/QomqD8l33gDIFsb7GQ3CJPE
 kyljaYmov+4KZRmY5eJUBLksjh9Tt311qscOCuPH+8OY2Dr9EzfYjRUSUR3mjECa8lmA
 xt87T2DoyQitGBHEfFWflK8lhF6COGjKhvwEUJ7jRcZhcTV5zWZ9MP/EEvh28gobmJk2
 xDJjYSB/i5t+sBlFHOBZ1CA72p5ZQE3MfjH5YWUtinwuNRszvIYnHOQ9uLdXeb4y+Ncx
 mYnUyk0A864IxlYnQIav789MgyKYtWKwyKGvbSyrm3IH3il/J2ywI+LHQG+6/Cq7t5RJ
 Uukw==
X-Gm-Message-State: AOJu0YwNHfaLn8eG3H7f1L5cilSKSWwhgx0KqEbRTo+ElDaqeybvieu7
 e6q3MAmhHrNQEtWDudBqNK3z9nj960dpPbs2uuM=
X-Google-Smtp-Source: AGHT+IGCQqS+Pvn6RsP9VGxE9d5ecNUtpobC74sSBj7QNadpN0c4h6dDSEZYWBMzhGuvsohcoMM5WplDRFHYBclcvx0=
X-Received: by 2002:a05:6871:204:b0:1b3:f370:79c7 with SMTP id
 t4-20020a056871020400b001b3f37079c7mr12163060oad.37.1691426399683; Mon, 07
 Aug 2023 09:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230801090237.7011-1-sunran001@208suo.com>
In-Reply-To: <20230801090237.7011-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:39:48 -0400
Message-ID: <CADnq5_OBvgLKvcfCgdOCHWxFB=uA=1Oaf_Fpu+YZKwNvj1FcVA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Clean up errors in pptable_v1_0.h
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 5:02=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h
> index b0ac4d121adc..7a31cfa5e7fb 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h
> @@ -419,8 +419,7 @@ typedef struct _ATOM_Fiji_PowerTune_Table {
>         USHORT usReserved;
>  } ATOM_Fiji_PowerTune_Table;
>
> -typedef struct _ATOM_Polaris_PowerTune_Table
> -{
> +typedef struct _ATOM_Polaris_PowerTune_Table {
>      UCHAR  ucRevId;
>      USHORT usTDP;
>      USHORT usConfigurableTDP;
> --
> 2.17.1
>
