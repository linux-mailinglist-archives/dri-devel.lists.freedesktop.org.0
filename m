Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E5866E53C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 18:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8ED10E2F8;
	Tue, 17 Jan 2023 17:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7B710E2F6;
 Tue, 17 Jan 2023 17:49:09 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1322d768ba7so32747173fac.5; 
 Tue, 17 Jan 2023 09:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3IRpyyYPuy/T1yHp91eCFbNS7Z39U29nLeJi2+9mVaQ=;
 b=LtERcKSMIhRjVPbyjcmevUczPGIo+tsCUE3sx5bTb68nfIINxuMH56qQ2RBQZ1s5r8
 IQ+u81l8o7ZEKRHpJfplj/J+UYMaA70gvsCQ3p68ehI3mTxJaWsX03yDkkEo0qaSWh8t
 4i+ApTKG3/mP0d5lIi/+ZnDgoH5VrB5bChxY1XJlV7jXxtRCjCeNxQHTxJUThwXiY+mV
 22cCHJpNYn9IiHFZ2mXr1nwxTCo6hLP1HKeM4xkWYs/8qfqwqJPBmp9zlXdXcSLahP8l
 lOYEZu41JBgRWYxwgu6f0kSP0wR3o2Ja34LZRrFZeFE0LcL6a4b5alwVhy21WajNlkFr
 8xUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3IRpyyYPuy/T1yHp91eCFbNS7Z39U29nLeJi2+9mVaQ=;
 b=iHEuh4J1bwfHz1vRlL1JBY0yr+Ltz+fQ2f2rHrAfH56o9IARVLzwVtIuhESz+lvMIr
 zr8P105HbrsOVZQPmh7D2iiGWLuE2D8wVTFesEz4fUXmJEizw3TI/1COPyGMkfGZtHMU
 BHV4BqkKmfzb3klfAWh513s0DhdJFnxc0mz9fcroSQiSSK0lcpSulDVIy8e+9clB6+RF
 ei51suQdA21AscVWLTqRlkvox8/TLH2GOkYiYF1TAnes2KbZHZhaQE75+3mjopRWkI/i
 j6eBHJpYA9YezaMXuaxlrZVRg7dc+AL+xjOzlZCnWkjjZhytIM7LHK8+09Sd66vzo91j
 Qq1A==
X-Gm-Message-State: AFqh2krdSpuVyl7yLrT5mG66T+IovY6KgRFg3NZ3wILCjRt2hQD/j8J6
 IrlaxeSoTiK4qHROGmkXoRj1C99LCjgIN6f/H7hICfwj
X-Google-Smtp-Source: AMrXdXs0EZ2mhCZw5d9xrf4NoQfBb37Ezrrrw5ZW+Q2djAo7cNP03pLtOHd91anloQI6ZKG+IjHzlNUOa1xx4iYedck=
X-Received: by 2002:a05:6870:7a18:b0:15f:5509:9a0d with SMTP id
 hf24-20020a0568707a1800b0015f55099a0dmr369436oab.46.1673977748942; Tue, 17
 Jan 2023 09:49:08 -0800 (PST)
MIME-Version: 1.0
References: <20230117174447.21870-1-nirmoy.das@intel.com>
In-Reply-To: <20230117174447.21870-1-nirmoy.das@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Jan 2023 12:48:57 -0500
Message-ID: <CADnq5_P-vC9zfEPUk7LwPWuS1s+e4nqZtEqWf2mo0BfnVwYqJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/radeon: Do not use deprecated drm log API
To: Nirmoy Das <nirmoy.das@intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 12:45 PM Nirmoy Das <nirmoy.das@intel.com> wrote:
>
> Replace deprecated DRM_DEBUG_KMS_RATELIMITED() and DRM_ERROR()
> with proper APIs.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/radeon/radeon_dp_auxch.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_dp_auxch.c b/drivers/gpu/drm/r=
adeon/radeon_dp_auxch.c
> index 69379b95146e..76ce66efb5f8 100644
> --- a/drivers/gpu/drm/radeon/radeon_dp_auxch.c
> +++ b/drivers/gpu/drm/radeon/radeon_dp_auxch.c
> @@ -158,7 +158,7 @@ radeon_dp_aux_transfer_native(struct drm_dp_aux *aux,=
 struct drm_dp_aux_msg *msg
>         } while (retry_count++ < 1000);
>
>         if (retry_count >=3D 1000) {
> -               DRM_ERROR("auxch hw never signalled completion, error %08=
x\n", tmp);
> +               pr_err("auxch hw never signalled completion, error %08x\n=
", tmp);

Please use dev_err() instead so we get device identification on error
messages.  Makes it much easier when you have multiple GPUs in a
system.

Alex

>                 ret =3D -EIO;
>                 goto done;
>         }
> @@ -168,8 +168,7 @@ radeon_dp_aux_transfer_native(struct drm_dp_aux *aux,=
 struct drm_dp_aux_msg *msg
>                 goto done;
>         }
>         if (tmp & AUX_RX_ERROR_FLAGS) {
> -               DRM_DEBUG_KMS_RATELIMITED("dp_aux_ch flags not zero: %08x=
\n",
> -                                         tmp);
> +               drm_dbg_kms_ratelimited(dev, "dp_aux_ch flags not zero: %=
08x\n", tmp);
>                 ret =3D -EIO;
>                 goto done;
>         }
> --
> 2.39.0
>
