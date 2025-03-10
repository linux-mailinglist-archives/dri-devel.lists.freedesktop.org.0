Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D4BA598FC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 16:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539CE10E2E4;
	Mon, 10 Mar 2025 15:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nraPrw7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD4710E2A8;
 Mon, 10 Mar 2025 15:03:50 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2ff611f2ed1so1178040a91.0; 
 Mon, 10 Mar 2025 08:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741619030; x=1742223830; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XCZ7+q9PYpMdvI9LsnDStpXywHOjjRsLA5+sW6O9TXk=;
 b=nraPrw7Ruaovdqe818CtMZBnxZxMHuxENsrGaw3gIVreHhlQu7pg+hfkCnvgt5Uo5W
 BnVBBgYM6lllUYjAZJg+ze2MTa6sTdfhQU7tOxYHDlaRDRryJZoPuT+K0DhS5XOucPxn
 DMyaUUzqYhIn30/vaL2CG1QZo9rmrgwNuxHDvejsa53NKJm93bNq/mKWqUbsTCC56TEA
 tEVBM1en/y+yZFwei2txgibjRkunDWs1E8h9xZboPmXZlTIINhCxFM+dOmbtj35GAsDi
 HMKYJxSmu2prZ+/zmLg+/TssalQgKY8D44Mlc0AV8I8NDhyG3Gvc1P9aQtNH/E61/ovA
 xIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741619030; x=1742223830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XCZ7+q9PYpMdvI9LsnDStpXywHOjjRsLA5+sW6O9TXk=;
 b=gXq/05Fq0L8IwdCZ3TXR7rDb2GFcMJJdZUaDaSlv5PMmnkRqJYGF9Py+gaYz1cGIIm
 m5LJtAtpT3KHpUF1wHB7ZG8y6+heXpoI9S8B9r9TH4/sYktDSdyd9Yc0DSaUsH5DNhDp
 pXde+FGo4m6OtA6TA/V9ahC6m7AHfusTKFx0uMHQ55Jb82f/FuojeycQDvhqFRr0u+WU
 Ula4jV/O9ESRbKYx84HYcDx9//H6une0OGVWIaohAPXB6870MPzePrdk5xy8xZmUAJaN
 kViBqIislXBINEAD9fiCykVvf8GCSdLDxa6X5azyz7oWWCBOJ1j261a/zhEb6hOu+t04
 rLSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlSkdcoU2Ja5yE166PKqlDHx3RfJyUL5NtYUwOlotXobQ3EjGV9NBAblHFWsYC8jHrVaTpb02ZcMGP@lists.freedesktop.org,
 AJvYcCVDIWqbC3qzS2o+AwroNRp/h9cKoFAq9++4pCNaanuSMS4htMiW1Qi6TPHIcsa9rLV3T+g9coFL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWSwIeWZ7tONOwXA4I5zl+lYxCEBSE8JIQod96KICjMDeh78vD
 8Fnx7VUUTo98wL2ioTLx4UmNANCFEWX/J/apQJY/sI+p3ljXZq8juKS6GkuvcDyQ4i+pUDw1kFX
 piM2RaxNGFOhaGNbkyFi1H4d7eSQ=
X-Gm-Gg: ASbGncsSF0y4JvEAWtD8AfLFQ/b2FChcRCXyZ6rPQenMewqVSp9XgDEnIV0v2V89WFj
 LPHgl7mB21oyWGA1dSWnkOuKg8GiA5odrjCFmZ0r9NmybpOJKy+avoOrbv3Cy1acWzQrAAKQn8x
 uq9iIAtxSIC5LlxQ6Od9n6pjQQ1Q==
X-Google-Smtp-Source: AGHT+IFMUfkkxyv4DFg5N8sru2ilACJrDgnRxjOU1nRv0P7Z1KHYBcYqmTsNdwlU/vhI/3zGhCpvcSCgAR6M0BtdUvY=
X-Received: by 2002:a17:90b:4a4f:b0:2fe:b2ea:30f0 with SMTP id
 98e67ed59e1d1-300a575a10cmr5731794a91.4.1741619029744; Mon, 10 Mar 2025
 08:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <2503b45f-751e-4b50-96fd-8dad33821c40@stanley.mountain>
In-Reply-To: <2503b45f-751e-4b50-96fd-8dad33821c40@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Mar 2025 11:03:38 -0400
X-Gm-Features: AQ5f1JpmwP1VV7tLkk-a9qxkXnTTzKMtdLoBQrX-kuLocNBhJ8LElGmugPOqQio
Message-ID: <CADnq5_NJnn0QxmsKMXnimRLDAkN7LD4u7sJOZq7OzSL54yrjUQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Use tabs for indenting in
 amdgpu_sdma_reset_engine()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Tim Huang <tim.huang@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Le Ma <le.ma@amd.com>, 
 Yang Wang <kevinyang.wang@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

Thanks for the patch, but someone already fixed this.  Thanks!

Alex

On Mon, Mar 10, 2025 at 6:47=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> This line has a seven space indent instead of a tab.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_sdma.c
> index 39669f8788a7..3a4cef896018 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> @@ -621,5 +621,5 @@ int amdgpu_sdma_reset_engine(struct amdgpu_device *ad=
ev, uint32_t instance_id, b
>         if (suspend_user_queues)
>                 amdgpu_amdkfd_resume(adev, false);
>
> -       return ret;
> +       return ret;
>  }
> --
> 2.47.2
>
