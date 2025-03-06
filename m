Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D02A54E68
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B5010E9D8;
	Thu,  6 Mar 2025 14:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eVOQ1vtw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B1110E9D8;
 Thu,  6 Mar 2025 14:57:52 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2fc92215d15so193090a91.1; 
 Thu, 06 Mar 2025 06:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741273072; x=1741877872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ukUCWGxvoTM5xaocQvMdv9IPv4xm083YArvGDeKyolg=;
 b=eVOQ1vtwTj3zGz4/4lUor4O7ilGZsYX1JQ26AAwi2IV793cG3SkGcWRkQuH8aMdnBY
 CcrMku0JqHLkiwpPn/HfsXavSvuZjmDu9Su7JcdNJBpTWpV+5Xu9Q0tc/zO7dCsWmBtY
 Q9sKjxzl8NKIrq68TBC+xLJo5JLJFawLgSbbP742T4Q+SEeXbj92AoPUTfmII+6N0kD8
 bDKTKFKYaBG6WftvzaLeC0FRPYGKZN0QxqZCQJizzi0Qpe3/l1+rJovO9sTPhTEi0aCX
 zGzWNAIwSV3ZxwZeWRSdXnM2EURcK04gpRwkc+gVHmu6QxDKPiKlMBvE7P4+2/7qQi+b
 pDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741273072; x=1741877872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ukUCWGxvoTM5xaocQvMdv9IPv4xm083YArvGDeKyolg=;
 b=fq1b7JYkrFwNjC9iwYuYPogiL+kaatu+SPIrM2JQIOnrgy5cuK5V8iLY7EPP9QnIsE
 0rvCxe068CVNbEvu73+Bjzj8p3jrLwK8QaFo6RaoAr1NLVyShEuiTm8U3Rr6Z3sbGlGh
 OxhWQToT6BWvQjXlisQR2YGjMB6pyd+wAwJsm+aixLuAWvaHqNcKGOLUHm2Q0kyN5VN3
 IcV2Ak+zqTB0908gdJZGkRpO0uCbU2XizTIATbBW6DZPiC7yg5HoCPgTpoRDMA79xJvS
 5KF84LC6BNKiS4LZXd1X9xmnQcZcrPaIk9RF8OaiJiBFiaPaRgnFcld1sozGS1LK7Oqo
 /j5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8Zlcv//YA5b00lpxrg0nTUI+2oxbcZL2cICijKQ5tVp8WKEXsyz3VEb/Ft/LGx8rk6J3Bt9EFAF2v@lists.freedesktop.org,
 AJvYcCVulN5KjIC/FYn7BKWyFkn7LWQ+Rdsa/gWMuuickt6pEO1oueJupRlR2zKj7e2wG+7WqTW7iyhG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwHWXjV8XD1nPnEfJAnj7edu7PmSZUlyK49QKA9RDWS3+TsMre
 CkxB0lwD/+Kti5E+NFb1BUxEKQcqbeXWSF3RMxiKJxl21RosIfTc+hUp0+n/hgHqcuFrgwM/u1g
 rkjGMuMtBENOFiqoBiAOAdC6nbY4=
X-Gm-Gg: ASbGncvswyhoI6P3+5lj97tlgDsnjrZwOHDJMCDfkoMW6+QEHI7xiEHuC64J/hudlOY
 1xmJeJnzIdyL8mRJNb/9k6A6TUPFHraZfLKYlVlU8gZYPYcnGL0KPIO67BPBjFTLkWDgbEg6KfW
 LWN0gSyg0DL7QWzn1717Dy1FbAmA==
X-Google-Smtp-Source: AGHT+IFFvTkNxjyxH3OhwMrPOCnoGirYk4RRPl4wpFL3uc4YUYEn6uPwllrEZdOoh/5mgKss4M3aXC3fAJNdB6X8MJk=
X-Received: by 2002:a17:90b:17c1:b0:2fe:a747:935a with SMTP id
 98e67ed59e1d1-2ff49815d68mr37955a91.4.1741273072132; Thu, 06 Mar 2025
 06:57:52 -0800 (PST)
MIME-Version: 1.0
References: <20250306075148.2382-1-vulab@iscas.ac.cn>
In-Reply-To: <20250306075148.2382-1-vulab@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 6 Mar 2025 09:57:40 -0500
X-Gm-Features: AQ5f1JobaKMBHvrjKb5uUx8V2l7PIiJtkP8GoC3q6xiyWznC0Pev0Zr1rfxKQPA
Message-ID: <CADnq5_OAvMKvSZUVA1ktk5Oc7Huu+Jx-0WbSGA_r+fZ+jQDE5g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: handle amdgpu_cgs_create_device() errors
 in amd_powerplay_create()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: kenneth.feng@amd.com, christian.koenig@amd.com, alexander.deucher@amd.com, 
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, 
 Jun.Ma2@amd.com, lijo.lazar@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Applied.  Thanks

On Thu, Mar 6, 2025 at 2:52=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wro=
te:
>
> Add error handling to propagate amdgpu_cgs_create_device() failures
> to the caller. When amdgpu_cgs_create_device() fails, release hwmgr
> and return -ENOMEM to prevent null pointer dereference.
>
> [v1]->[v2]: Change error code from -EINVAL to -ENOMEM. Free hwmgr.
>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/g=
pu/drm/amd/pm/powerplay/amd_powerplay.c
> index 26624a716fc6..f8434158a402 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> @@ -51,6 +51,11 @@ static int amd_powerplay_create(struct amdgpu_device *=
adev)
>         hwmgr->adev =3D adev;
>         hwmgr->not_vf =3D !amdgpu_sriov_vf(adev);
>         hwmgr->device =3D amdgpu_cgs_create_device(adev);
> +       if (!hwmgr->device) {
> +               kfree(hwmgr);
> +               return -ENOMEM;
> +       }
> +
>         mutex_init(&hwmgr->msg_lock);
>         hwmgr->chip_family =3D adev->family;
>         hwmgr->chip_id =3D adev->asic_type;
> --
> 2.42.0.windows.2
>
