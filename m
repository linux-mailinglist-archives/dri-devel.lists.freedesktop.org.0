Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED24A68DE0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 14:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F55710E1DC;
	Wed, 19 Mar 2025 13:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OIglPj2X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B8310E1DC;
 Wed, 19 Mar 2025 13:32:00 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-86b9a1466c3so393503241.1; 
 Wed, 19 Mar 2025 06:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742391120; x=1742995920; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGkpKqMgjBiSjviBn3MT7rNUCwz3YjW35rqjdwx/eQE=;
 b=OIglPj2XVq6510b3pkuLJ7hpNHJokVmn9kRZM67rj6prPZdsHwtgbs8Tj3p2p+VFS3
 f7c7nLRLyMJI61jMqZwrwdT+vNgc9gcZqR8Vegra1RYvYLPI8RX7hGzGePyL5CQlM1iI
 6gS8er7WPrxc/bjXEnzeJxLN7JY6VNXVLFvjWJJRowpenW0d8iOStnYOeymM3HzZjvfO
 bHXcg4hEWdSeOTqJlNmZOg3Zh0rh+G59+KAHuwJWTS2NTUnabkF5GUHNO6jt0qZ0xOoA
 4wtfWJLXrZoqXLxgjCvucMKJkaHTiC8J+H0SCUkx03dgsLVjU0+kTHxidYafO9xYcLma
 TGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742391120; x=1742995920;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGkpKqMgjBiSjviBn3MT7rNUCwz3YjW35rqjdwx/eQE=;
 b=HyAufKjITyI+lGhEJxp7jpisFbUiJ67pAv/Hc3nQi7yD/VKLATToZuHbMBH6bqPO4g
 K/64jzXyn1DjcagBMRLThERFfASe4//dRqKGC9V4hCHGQhuXAAL/c04jG7sVoYFWyquI
 ZcXzrU/qgwNKIOdQUsiqmRfTLX5CE79/yVklI1nu/NTbQ8VNKYR7lw2Nka4ti2tMaT7/
 nzylBDFZMZPII7OaxmfOMbCh7Aw7z5uMTywXpPMOBknLAtgnrccEsM5iQSEageYCLW6a
 EhjZqBRfffNN2mE4YCFNLA6UKyJC8n4t+FL5U7MdKHOcbVrsYgXS8VIKJfWBhnPN6gv9
 0UxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjcoo4BkBGNLSIVa2RXdMuDhTTdoYZMyTZ91uw6WHufXwnHkovdIOF3JvJqe0St9nio3GrbVMMtNcl@lists.freedesktop.org,
 AJvYcCVf1hX5sDMWUVX1Lh+TX5IiQrlmwB0hyNGeBHhwzQGR4Hbb0ub+jkafcZBOUrWbOtASkMfX5uHC@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5QMNDXZtCFBqsQDCi1c+5jgf0YpbGZ4BDcIHXh2j13nZ0aLPF
 oyFXMb6aCyS48fCyvdAi4sPcMtUBQGvZDWNmy5khpF+dZZHbASgvk6cxFLqdF4zS7N88Q6OxCzF
 NqOkOG4N/7x5VID6e000wPrdM8Jc=
X-Gm-Gg: ASbGnct4drGq9TkMThTBNSYs1NaElKLq6gamOZLY5Vx1dbhIQ89PuTddPqXZ5XvPzZH
 Evs1ZZAEkjeHMT0BIqUp4Stwr8AoprwM2n/A0D5siSKCta9NdjRHfvrDfn+EExBR6JctF+ohkSk
 A0m/xPZbNQkma0hxbgwpZrZRCN2Q==
X-Google-Smtp-Source: AGHT+IHgUH9cFzpBtBK9ey2+JGlYXkvPasHk/a/LBDDDziZJcfeOxGGk9HskojAVImQ7LiHzpzC9kHrE+Wtl3zLwucw=
X-Received: by 2002:a05:6102:512c:b0:4bb:dba6:99d3 with SMTP id
 ada2fe7eead31-4c4ef4d27cemr361182137.8.1742391119808; Wed, 19 Mar 2025
 06:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <20250319092951.37667-19-jirislaby@kernel.org>
In-Reply-To: <20250319092951.37667-19-jirislaby@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Mar 2025 09:31:44 -0400
X-Gm-Features: AQ5f1JpyJz7Ugj_Qtpizh3Phb0sD4bkNclDSrU4JuLu-9pUF1cvpfLaSOGRYtu4
Message-ID: <CADnq5_P93d5TTPA36JB_RSGE8uRwoQQ5to7Wp9STD6xJrrMqdg@mail.gmail.com>
Subject: Re: [PATCH v2 18/57] irqdomain: gpu: Switch to
 irq_domain_create_linear()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Wed, Mar 19, 2025 at 5:44=E2=80=AFAM Jiri Slaby (SUSE) <jirislaby@kernel=
.org> wrote:
>
> irq_domain_add_linear() is going away as being obsolete now. Switch to
> the preferred irq_domain_create_linear(). That differs in the first
> parameter: It takes more generic struct fwnode_handle instead of struct
> device_node. Therefore, of_fwnode_handle() is added around the
> parameter.
>
> Note some of the users can likely use dev->fwnode directly instead of
> indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
> guaranteed to be set for all, so this has to be investigated on case to
> case basis (by people who can actually test with the HW).
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 4 ++--
>  drivers/gpu/drm/msm/msm_mdss.c          | 2 +-
>  drivers/gpu/ipu-v3/ipu-common.c         | 4 ++--

I would suggest splitting this by driver.

Alex


>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_irq.c
> index 19ce4da285e8..38e7043016e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> @@ -725,8 +725,8 @@ static const struct irq_domain_ops amdgpu_hw_irqdomai=
n_ops =3D {
>   */
>  int amdgpu_irq_add_domain(struct amdgpu_device *adev)
>  {
> -       adev->irq.domain =3D irq_domain_add_linear(NULL, AMDGPU_MAX_IRQ_S=
RC_ID,
> -                                                &amdgpu_hw_irqdomain_ops=
, adev);
> +       adev->irq.domain =3D irq_domain_create_linear(NULL, AMDGPU_MAX_IR=
Q_SRC_ID,
> +                                                   &amdgpu_hw_irqdomain_=
ops, adev);
>         if (!adev->irq.domain) {
>                 DRM_ERROR("GPU irq add domain failed\n");
>                 return -ENODEV;
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mds=
s.c
> index dcb49fd30402..9d006ee88a8a 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -150,7 +150,7 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *=
msm_mdss)
>
>         dev =3D msm_mdss->dev;
>
> -       domain =3D irq_domain_add_linear(dev->of_node, 32,
> +       domain =3D irq_domain_create_linear(of_fwnode_handle(dev->of_node=
), 32,
>                         &msm_mdss_irqdomain_ops, msm_mdss);
>         if (!domain) {
>                 dev_err(dev, "failed to add irq_domain\n");
> diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-com=
mon.c
> index fa77e4e64f12..223e6d563a6b 100644
> --- a/drivers/gpu/ipu-v3/ipu-common.c
> +++ b/drivers/gpu/ipu-v3/ipu-common.c
> @@ -1169,8 +1169,8 @@ static int ipu_irq_init(struct ipu_soc *ipu)
>         };
>         int ret, i;
>
> -       ipu->domain =3D irq_domain_add_linear(ipu->dev->of_node, IPU_NUM_=
IRQS,
> -                                           &irq_generic_chip_ops, ipu);
> +       ipu->domain =3D irq_domain_create_linear(of_fwnode_handle(ipu->de=
v->of_node), IPU_NUM_IRQS,
> +                                              &irq_generic_chip_ops, ipu=
);
>         if (!ipu->domain) {
>                 dev_err(ipu->dev, "failed to add irq domain\n");
>                 return -ENODEV;
> --
> 2.49.0
>
