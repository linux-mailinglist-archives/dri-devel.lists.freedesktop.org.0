Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A841B86D2E3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 20:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9BA10E5A0;
	Thu, 29 Feb 2024 19:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i1kKTX/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FFF10E47C;
 Thu, 29 Feb 2024 19:12:53 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-29b02e5c54cso942165a91.1; 
 Thu, 29 Feb 2024 11:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709233972; x=1709838772; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Px+JyXf4tLpdcNsZuGtIfGj/dsN60RYAYJbqilYoB+8=;
 b=i1kKTX/9mGvufT35/92q/b2+LRTk/GP8YC50VobBn8vpH2TKQ28KCM7+2Jb6Y+f6oR
 yrm+0JMtMJCHkVNeabIRBsGYAuJRZg5TG1CnfeHUCuxweK3NpiZ9PPQs7ReQN8uGdjQO
 h4ZAqxif7U1A/HlTXiOw5AyQtt2I+I4/KS/0LDC81qcvVC8WdgVGQS8XVsBQvvHCzJqs
 1J4+zO1sohvF1qhce3R8ryosXfRxbVxTsQ1NuGIl2H7nSPutBXunUZjyClJtN96eMDzw
 mojfJ0nB8kzG0Lrp8pwmefR/cWD3gZyjSOR+/U1PLansMb4v32B0LHcRCws4mZs7cCnG
 mpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709233972; x=1709838772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Px+JyXf4tLpdcNsZuGtIfGj/dsN60RYAYJbqilYoB+8=;
 b=DsSbHZgQR4nerNAGwJcVrMVhz4//Pk9o8QcVYNKyGltNiNFkzQS5+Av4bcH3uuTUh1
 WAxiHN//WyYEUmOmWgzwfAocvosAuZ2/iX7HFTy9WHD7PIs11efmPPKNyI6ymP9SpiIB
 hgDP0oLojJLmB0JHq0XXTLEX1qjcfI7Oi+5kajQmalQM1xjf/7JFHSi5k4my0x6FczVA
 nviQ0OtKz+nHMtqMEq5OGmlLkItrgK8WZXly+ibruLFKyzwkUmy21XdchYXozDanHMel
 v5oM6AIxsuQtNw9CFsVw2jwzGmGZOfpKgrXnJYLzMDvBgUfMGVaN09/WoPo4MkJfBvTM
 BDcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3ukbPqcaW9Xl0LbdqMYVFeG1C92bEMGZzKCGBreTy0eDJ+LSFr3tMPf6UHtsVeLeMGJBRxVZwi/OswhLFrqxHHyla21vm5Vvxyfq1wBFEMrV2qvnQkTepFGsCmLKpzVXVRAUhf6YTs+6HwyJ/5g==
X-Gm-Message-State: AOJu0Ywv2rq96dNg9YC1W4o1J2TZsatcN9rpnnX8bTF2VovPs+pJg1LO
 ZLeRmrxc2msPdZZFCa08+H1NmivCXn/LKIE1lEttCnXLy19bvIqM/sJyWvMBozylDuHFW0bmGUl
 0oVXQ+IJyFhTFwhlwMgZf3Sr79/g=
X-Google-Smtp-Source: AGHT+IFMzzhy10NqDN+BK2sKx5qHOBOz1iWOCM7oh2BvBq+hmVZas4TDKA77iA356owZsETodRWHQmax6qLWPeR7z20=
X-Received: by 2002:a17:90b:ec6:b0:29b:17de:6951 with SMTP id
 gz6-20020a17090b0ec600b0029b17de6951mr1582952pjb.3.1709233972379; Thu, 29 Feb
 2024 11:12:52 -0800 (PST)
MIME-Version: 1.0
References: <20240229181106.351877-1-helgaas@kernel.org>
In-Reply-To: <20240229181106.351877-1-helgaas@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Feb 2024 14:12:40 -0500
Message-ID: <CADnq5_OdYfOOckVNzxZHgxCn5tuYHrCUuaTEnEubJS_2jwXw-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove misleading amdgpu_pmops_runtime_idle()
 comment
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Helgaas <bhelgaas@google.com>
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

Applied.  Thanks!

On Thu, Feb 29, 2024 at 1:11=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> After 4020c2280233 ("drm/amdgpu: don't runtime suspend if there are
> displays attached (v3)"), "ret" is unconditionally set later before being
> used, so there's point in initializing it and the associated comment is n=
o
> longer meaningful.
>
> Remove the comment and the unnecessary initialization.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index cc69005f5b46..68416e2a9130 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2744,8 +2744,7 @@ static int amdgpu_pmops_runtime_idle(struct device =
*dev)
>  {
>         struct drm_device *drm_dev =3D dev_get_drvdata(dev);
>         struct amdgpu_device *adev =3D drm_to_adev(drm_dev);
> -       /* we don't want the main rpm_idle to call suspend - we want to a=
utosuspend */
> -       int ret =3D 1;
> +       int ret;
>
>         if (adev->pm.rpm_mode =3D=3D AMDGPU_RUNPM_NONE) {
>                 pm_runtime_forbid(dev);
> --
> 2.34.1
>
