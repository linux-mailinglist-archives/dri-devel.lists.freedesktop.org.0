Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C538C9E0DC9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 22:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AA410E841;
	Mon,  2 Dec 2024 21:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GewdL3OG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2A310E1A1;
 Mon,  2 Dec 2024 21:26:13 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2ee67ed00deso467111a91.0; 
 Mon, 02 Dec 2024 13:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733174772; x=1733779572; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2XejICzXArLFcIiyqAnjcmXvCQg/37urb3NpURPZ9s=;
 b=GewdL3OGooQJq1LKDdn2rrly0GQJ042b56/INYBq4IpvT9f3Hr6BUHgkzLAP+vH0F/
 zhzzy1mO7QfhR5iCdHrNLcVY4PTR+tvuQcrxUc00tHkU1vaULwdLkkZn7J7SKbQ0so9C
 eBp2+EA1fWBzz99jKgcTBNmM2vtAfSwZ/SW+3553j7ehZyn0E5J25lmrSSZdixkHJwtC
 2ocuy6Lyj5GULDvJl8NiEgPlM+kX3zFdlLlqRHcNMFj7ijAY6RbkHB9rBV8lMhkiycZL
 7bdF12xRdiQeSkFpOH1Lm3AZ0rG5QLsWc40wE86zHClvxaGeuBueZmCWmzaDRRoKTVyF
 IiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733174772; x=1733779572;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r2XejICzXArLFcIiyqAnjcmXvCQg/37urb3NpURPZ9s=;
 b=AFFbI6a7tyl1sDhyXI0g3Mmb66rdfqOnD2/yVwXXrrelXFkKSL4v67fryZFBOCgYoL
 uQwIfnzhLt/p0I29cUJH4jvf9cGYleEtaXcB/t10K+iyYG5W7Nx336o8UGHKKhEs+uJk
 7gZvNI2JKRgGXLkzo6m3U8vlh5jq8r6vbg/4ffeIMLKpzKFvPnUw4a26kQz0H3IPtObu
 HtmVc4Md5I+vF1XsBLhycGiOPOz3i16mVvOk5rNTX5LtLyTgUCfIA32joOk64XX5Jtwd
 4deEdbY8snOdvZP4rVyCSMxuaBT5mvL1Ry2tcSZOjCuHMVgbuvGDUL+1NibNFpvrqxbw
 tAWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvl27QA36Qbh83EanUVCAWMmP4atWAd7Hl27ZJtxNOspx7l/9YLBHE3OUHNZ/fmFnvwb2LcywTwPS3@lists.freedesktop.org,
 AJvYcCWjIkYRgUF3V9Nsd1ubjJPuSuGDM9Y++Q2u/s6IDr5QqAo5FSI5vLY0yxhIVva0qJXAlLzkUDOM@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6+tlRXyqI2FdKbH9xUWZMQJPkbLhCkecQLeLR1jQn4DRLP7mX
 1500N7LOqBoQI4PqpLWUpa3CDh5cYQZgvZuZxjWa/T8iquE/TUqjKJ31X+I0T97I6n7T14Ylyht
 ELKHl5jYI/4b+DY8Ogk5pBjlDmHk=
X-Gm-Gg: ASbGncuxTrvh0cQW3UDFjXQtsqk0M1i0fXNa/HpB5PBbnZQ1t04G0bFfFZob1pB9oyn
 7UL1sWXYgsZLyodw0JhB9wQZ0ZGpjZKk=
X-Google-Smtp-Source: AGHT+IEXlg13b3ifBskkGZwkW8PNP/lLn1940BLZpT4v8S4oGQtGrOYide0iHSNd5F3UBGsaESmbS8Zb3m9xuMOOjqk=
X-Received: by 2002:a17:90b:4c10:b0:2ee:3fa7:ef23 with SMTP id
 98e67ed59e1d1-2ef01288ba7mr20504a91.8.1733174772464; Mon, 02 Dec 2024
 13:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20241202080043.5343-1-sid@itb.spb.ru>
In-Reply-To: <20241202080043.5343-1-sid@itb.spb.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Dec 2024 16:26:01 -0500
Message-ID: <CADnq5_PTvhr=Wz2OBPthKwM3nsshfq0679VoN-pqPk1H+dZtJQ@mail.gmail.com>
Subject: Re: [PATCH] drm: amd: Fix potential NULL pointer dereference in
 atomctrl_get_smc_sclk_range_table
To: Ivan Stepchenko <sid@itb.spb.ru>
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Tim Huang <Tim.Huang@amd.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Alexander Richards <electrodeyt@gmail.com>, 
 Samasth Norway Ananda <samasth.norway.ananda@oracle.com>,
 Jesse Zhang <jesse.zhang@amd.com>, 
 Rex Zhu <Rex.Zhu@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, lvc-project@linuxtesting.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Mon, Dec 2, 2024 at 3:27=E2=80=AFAM Ivan Stepchenko <sid@itb.spb.ru> wro=
te:
>
> The function atomctrl_get_smc_sclk_range_table() does not check the retur=
n
> value of smu_atom_get_data_table(). If smu_atom_get_data_table() fails to
> retrieve SMU_Info table, it returns NULL which is later dereferenced.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>

In practice this should never happen as this code only gets called on
polaris chips and the vbios data table will always be present on those
chips.  That said, I've applied it to align with the logic for other
functions in this file.

Thanks,

Alex

> Fixes: a23eefa2f461 ("drm/amd/powerplay: enable dpm for baffin.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ivan Stepchenko <sid@itb.spb.ru>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> index fe24219c3bf4..4bd92fd782be 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> @@ -992,6 +992,8 @@ int atomctrl_get_smc_sclk_range_table(struct pp_hwmgr=
 *hwmgr, struct pp_atom_ctr
>                         GetIndexIntoMasterTable(DATA, SMU_Info),
>                         &size, &frev, &crev);
>
> +       if (!psmu_info)
> +               return -EINVAL;
>
>         for (i =3D 0; i < psmu_info->ucSclkEntryNum; i++) {
>                 table->entry[i].ucVco_setting =3D psmu_info->asSclkFcwRan=
geEntry[i].ucVco_setting;
> --
> 2.34.1
>
