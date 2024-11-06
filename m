Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7718C9BF19D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 16:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EEC10E71B;
	Wed,  6 Nov 2024 15:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ALLHtcUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAA410E715;
 Wed,  6 Nov 2024 15:28:11 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2e2d1b7bd57so691459a91.1; 
 Wed, 06 Nov 2024 07:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730906891; x=1731511691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aiAwPg/dN01XsDKcD/hhNuHEhhgaqX4CxxQ2uu8RZq0=;
 b=ALLHtcUdgoNP33vG2PG0/lqk+gGZ6aOa71hCht9gNSJLnAu1S5Teyr2lSX+V3cA5r+
 64vmLFBk/Y1NV5qZrh66iWQ87eDJOOKvlaT1C5vzIQJr+IlCXouWyya8y70ANhkaUSkF
 t5B6UsM7J9YepQ7xgzV5xHg0MlyHOU/3oz9u6mFKunJGytKRRXYF8f7OxRfe3xm98Ny2
 M7xq2jc/guLPTgn7WgTq9N0kdN12AG6emvl8rGdtlH2ya1/c1CBM+T0IXo739jnTcOVT
 iMAYrxWa7+DIqaJB3nRVK4TagN5YQzoXwodb6snmQAKCuHkppnPvuUANgJRmyAuWt6ZY
 UeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730906891; x=1731511691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aiAwPg/dN01XsDKcD/hhNuHEhhgaqX4CxxQ2uu8RZq0=;
 b=UCUXGn5YWXlDzbkaxYPTEGhcVy9ydE79gp/SfIJDOWVFUjqC2IZYtfc1n/9kWwWvMp
 0unQ2p++UD7uIScL0IJ/wJrGjpoJGAO5logXr351nb35VDzOqhSO1+mrVdqB6fedAy+S
 LvZyXI0P7r71zHOvY5HZ4lN9CQRPXm/cu18reuxQ6Eg4qdcerHmVKzuVYuJkDyIRvbR5
 DBu+Jqrqh8IuUJrYdBD2aX6YSeSri9BlkIE06ZSkn+BZHa/3zDkQdMSKsoLnhyCUVEhq
 V+uNT/Ev+kdce9XgYFDV10HHHKrUmKI6QXywx+4jSKXRhXnwdzlYmsGd4sknmaaMFHTa
 nAEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnP4O66lEBnhXTeFckXtLHPi5DKhdVBh6HOhj7gbHhE3MHy7WnZrVg7iy75x0YENlkn5ZXYrwx@lists.freedesktop.org,
 AJvYcCVgcBorQbRU5VDk9MPkAf2sHVRXIhX1d31jNiQZvRsO+sdQuyYysCRJEs/KCL3nsov6xxcoJPaJw74I@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwclDnt7C0SNVA4i07zBA+ZpB0C8ehbOg8fnDL86bzrR7qBTWAs
 xJaqQYYimIcJn4ng4TfrdMfma4F6R1XIiYwwynDVA7DbnzU16q4z0jDDQSx5mQIU9ftFT1Xds4K
 E4KYEULw/SFE6scDZ0W/gON/rlzk=
X-Google-Smtp-Source: AGHT+IG58L8HgQRHpeAKNtWFRdkUYwUsikvjZcJw4/75VbeI8S+hZusMEj43cQ7YI5XM+9OlGuX4GGmLXuCrNR/h61A=
X-Received: by 2002:a17:90a:1549:b0:2e3:1af7:6ead with SMTP id
 98e67ed59e1d1-2e8f11a9c22mr19824833a91.5.1730906891202; Wed, 06 Nov 2024
 07:28:11 -0800 (PST)
MIME-Version: 1.0
References: <20241105140256.2465614-1-quzicheng@huawei.com>
 <20241105140256.2465614-3-quzicheng@huawei.com>
In-Reply-To: <20241105140256.2465614-3-quzicheng@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Nov 2024 10:27:59 -0500
Message-ID: <CADnq5_Nh8zQ2PE-vAd6BkKGho58DzdjBxEYv3Q1br9AuNyZesg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Fix incorrect power gating
 configuration for DOMAIN11
To: Zicheng Qu <quzicheng@huawei.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, Alvin.Lee2@amd.com, 
 chiahsuan.chung@amd.com, alex.hung@amd.com, wenjing.liu@amd.com, 
 Dillon.Varone@amd.com, george.shen@amd.com, mwen@igalia.com, yi-lchen@amd.com, 
 martin.leung@amd.com, yongqiang.sun@amd.com, tony.cheng@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, tanghui20@huawei.com, zhangqiao22@huawei.com, 
 judy.chenhui@huawei.com
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

On Wed, Nov 6, 2024 at 3:24=E2=80=AFAM Zicheng Qu <quzicheng@huawei.com> wr=
ote:
>
> The current implementation incorrectly updates DOMAIN11_PG_CONFIG with
> DOMAIN9_POWER_FORCEON, which is not the intended behavior. This patch
> corrects the power gating configuration by updating DOMAIN11_PG_CONFIG
> with DOMAIN11_POWER_FORCEON, preventing potential issues related to
> power management.

The bitfield is the same for both so there is no functional change.
This is just a cosmetic change to use the right bitfield macro.

Alex

>
> Fixes: 46825fcfbe16 ("drm/amd/display: avoid power gate domains that does=
n't exist")
> Signed-off-by: Zicheng Qu <quzicheng@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/dr=
ivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> index 67a77274d813..bc21eb0b2760 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> @@ -327,7 +327,7 @@ void dcn20_enable_power_gating_plane(
>         if (REG(DOMAIN9_PG_CONFIG))
>                 REG_UPDATE(DOMAIN9_PG_CONFIG, DOMAIN9_POWER_FORCEON, forc=
e_on);
>         if (REG(DOMAIN11_PG_CONFIG))
> -               REG_UPDATE(DOMAIN11_PG_CONFIG, DOMAIN9_POWER_FORCEON, for=
ce_on);
> +               REG_UPDATE(DOMAIN11_PG_CONFIG, DOMAIN11_POWER_FORCEON, fo=
rce_on);
>
>         /* DCS0/1/2/3/4/5 */
>         REG_UPDATE(DOMAIN16_PG_CONFIG, DOMAIN16_POWER_FORCEON, force_on);
> --
> 2.34.1
>
