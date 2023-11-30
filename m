Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B4A7FF7CB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 18:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312C410E73E;
	Thu, 30 Nov 2023 17:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA4810E73E;
 Thu, 30 Nov 2023 17:12:20 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1fadf44de33so86878fac.2; 
 Thu, 30 Nov 2023 09:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701364340; x=1701969140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VaaBtEflyA6x6ruzKE5d6vUTqZ4Td7RnZNZ2C5AvoOU=;
 b=jbecc2Aed5JCbBYBjugSK4fHEV2Mtoftsx01OOHo5lm7i0IdLQigQxGbwZd1A2NbmQ
 IZaUIjTnnlM3fUcH6c9GCoqPw/kxXkaHwJLsCqAl+ZID+Y2xyTRC346r9rTE0Rgp6A3O
 bHcXhbOK+4WPbUxf9YEj4H0pb5+trdxeS/MnANS1hUqT36sHAoX38HNXaP1uUVx8OYQB
 KLSVWis3KvKH5B2Gou+TZRh3V0NAjH+EFEleA0bCWcLXvDUfRODq2hI1j8rJ9a4G49cY
 3L3SszmsQVzw8rpzT7z0HneQ6IrpmduNoM6JAqxmvVgDCVrKKX7kA8dLqTSOlpNnGvCS
 BbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701364340; x=1701969140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VaaBtEflyA6x6ruzKE5d6vUTqZ4Td7RnZNZ2C5AvoOU=;
 b=bp7/Qf1eld72OUGEk34wH50xbu2yrolaq3Jxk2ebtaiEfV7BA1EwfouTkozd75UpRp
 smY9qUoIHzBaXbZowukGJ1hnsXZCJoyJD0nBHMM6ZGPyxDtYYfyKnqCEXTAlI5jf6gDe
 dG2ajcXbgLMMzgbk6t8PNF9hMY/JCZSEjjouMfvs5NtF+NR+lm0yyviip6wXXsPGlZ1l
 a0R6gZF944b1mVPPeW7FSoVoU/QBED5iYJ9yg75oPPjVA+9YJmOdI1Wget15WXobESkg
 tPvnFAU6BiHirn+YmH78mjCIMc4VFw8iHP+o3oMkJmIzSdocwdy4Jh48G50KMbW3cdSe
 HmXQ==
X-Gm-Message-State: AOJu0YwvxJdkjO3Dl6mfQ273lwgM66rvmT2d2mVzt+YMQXjCcd1JO+56
 CNAjDZHeD+lXzr4UdIRsA5QnZvCWeUw1+pVSMBE=
X-Google-Smtp-Source: AGHT+IHjQP5KfWwohtlFpHuAMVKuCCScyyPSUQ+E7t1/fWX2KSsB9czShnT/buF2h8V7udAhaVLIo/wLJ80NX1wFl+s=
X-Received: by 2002:a05:6870:781b:b0:1fa:1ca3:ced5 with SMTP id
 hb27-20020a056870781b00b001fa1ca3ced5mr25898056oab.4.1701364340063; Thu, 30
 Nov 2023 09:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20230808180416.7567-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20230808180416.7567-1-n.zhandarovich@fintech.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Nov 2023 12:12:08 -0500
Message-ID: <CADnq5_OYYRmDKk1QGSCc+G5JwswycVF4EHcSPV_D0anTZadCjg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: check return value of radeon_ring_lock()
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
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
Cc: lvc-project@linuxtesting.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 8, 2023 at 2:08=E2=80=AFPM Nikita Zhandarovich
<n.zhandarovich@fintech.ru> wrote:
>
> In the unlikely event of radeon_ring_lock() failing, its errno return
> value should be processed. This patch checks said return value and
> prints a debug message in case of an error.
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>
> Fixes: 48c0c902e2e6 ("drm/radeon/kms: add support for CP setup on SI")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>  drivers/gpu/drm/radeon/si.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
> index 8d5e4b25609d..df1b2ebc37c2 100644
> --- a/drivers/gpu/drm/radeon/si.c
> +++ b/drivers/gpu/drm/radeon/si.c
> @@ -3611,6 +3611,10 @@ static int si_cp_start(struct radeon_device *rdev)
>         for (i =3D RADEON_RING_TYPE_GFX_INDEX; i <=3D CAYMAN_RING_TYPE_CP=
2_INDEX; ++i) {
>                 ring =3D &rdev->ring[i];
>                 r =3D radeon_ring_lock(rdev, ring, 2);
> +               if (r) {
> +                       DRM_ERROR("radeon: cp failed to lock ring (%d).\n=
", r);
> +                       return r;
> +               }
>
>                 /* clear the compute context state */
>                 radeon_ring_write(ring, PACKET3_COMPUTE(PACKET3_CLEAR_STA=
TE, 0));
> --
> 2.25.1
>
