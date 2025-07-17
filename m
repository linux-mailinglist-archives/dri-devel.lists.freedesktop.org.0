Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E920B09498
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 21:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B0610E884;
	Thu, 17 Jul 2025 19:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VwaS3Ie4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC1510E883;
 Thu, 17 Jul 2025 19:10:59 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-313756c602fso242972a91.3; 
 Thu, 17 Jul 2025 12:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752779459; x=1753384259; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whHHXq9ZKdXTAW705B1rQtAiW8MTVvGsjlJTeXv7yyA=;
 b=VwaS3Ie40tpWXw+48ewyQaYuj/MWZJzR5rsFIQ7LCMBG/sbeg86q4TLgZaGk8flGYl
 GYtUWPsDzot1kv+8lDA1W7Q4KI7WKnF4wMwiRmlqyKqKvAWpl/sVytp7ulNTbDcIyaQf
 04wCpA2ehnhZE1K9ClQjAbzHVYldhsqMTnQiwH6vTCUFSzhaLa/W8Z0taDWBEMWVwJ2Z
 UcGdOxYMThtaF5YgDCou0PwAmJnyo1S5UFkpfPaiuR7D7np+dG9osM823eLq1kyIBrb/
 kRZJ5NnAc6dcMYNMMd2wQ2C5YlkjLi4EELhqHXwMQjmfBzehY36Ot5v8Xcp8JvpbUujj
 HLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752779459; x=1753384259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whHHXq9ZKdXTAW705B1rQtAiW8MTVvGsjlJTeXv7yyA=;
 b=WSgQwL6Ntt+oCwLYrhtKdfFdBMFTJj0rgtSeDQZl7KGf2Efnf3ZwBPJ62pap7d14++
 3+gL4VwsFVAYnKmqbbedjK7KAihVqohudECMdOv2Buw/4i56YXUM6asf1kmwzc5YDmcw
 ipufmkY7c5YQLw/oRWUZYYaJjNaoJdk3uyK8guriEIBiWQYfKpH5tHtk0xb1Glz6HiEq
 H7y3lp1iRb6DaG+OBBpJl6k/Bm8FEIwXefChh/4gRGhIVlRBjAJ35fE56ruTtii5fHlJ
 fIgFokQ4cgSygKFf/3GBdm609o+Q+Tw8ZTjeuqUxI4fINZk7oUrHPH/GzZ29QxxQr4Cd
 4zng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoCa1oVPGDeft723V1EP136r2222Za6YacDi9PoiPy6/ihIv1guAcDHwu7fURUQ/l2bMTWEgLf@lists.freedesktop.org,
 AJvYcCWG937z9OYKg4EY8DEb5wMgV1YBJkbPfhXn76iJZkscV4VeoJDUblVHm7TJR900wGiZBNgoAxohRRtA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRwF1sbiBhkQILXsGxoaiUQqLwj4r11uf0zZAoLWa7plxhrLRv
 nnsnYFPQNnWX3pr4FVMj7gfmDlIk3Z0UBQY5d1aipPViKiKSV1XvH3djMrzUs/ulROrPI+fq+Ga
 9ajZ304xTYwpr+mXjWCENMDgfYePUNTQ=
X-Gm-Gg: ASbGncuNG+YUT+sEXvdgr7OKDltrowhja1zkp1SAarJ7gZ43ObpQ32tzrZToI2hpEeZ
 apQJWpdlto2Dj4W53EyGDkjYdbnNbNK8NhXWJ2MwY/r+Sh6W51VlQU0P9xU0uBvq+UyagHHIxYM
 hLM8WnrEN2AsWq/NtmSikk52SVtEdsjUNzyQxHyeXdjS9Hp9ADa+T53Ea+c2Q1YD5kK1K5ZJAsP
 K6imz9Q25xQ3lJv+uQ=
X-Google-Smtp-Source: AGHT+IFcDXeIo6uU4fndJVvGmN/jTY47SR5imHxzk90iAiBRzhNnnJo2QL9GoDY6Xm/D5hnz57/gEipwcAYqKUg8zQw=
X-Received: by 2002:a17:90b:1cc3:b0:311:c5d9:2c8b with SMTP id
 98e67ed59e1d1-31c9e7767fbmr4619712a91.5.1752779459096; Thu, 17 Jul 2025
 12:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250616175019.3471583-1-superm1@kernel.org>
 <20250616175019.3471583-4-superm1@kernel.org>
In-Reply-To: <20250616175019.3471583-4-superm1@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Jul 2025 15:10:47 -0400
X-Gm-Features: Ac12FXzm6w4bvt8xXNl05VHu2uQA28FvAWVfU6YAJzv7lZsIpjWGCcVY04Bnf2I
Message-ID: <CADnq5_Pn=0nCD-CyoeJxSAn=Gtn=evkaCBUH2pr_O-=7vpw+bw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm/amd: Avoid evicting resources at S5
To: Mario Limonciello <superm1@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:HIBERNATION (aka Software Suspend,
 aka swsusp)" <linux-pm@vger.kernel.org>, 
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, 
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "Martin K . Petersen" <martin.petersen@oracle.com>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>, 
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Denis Benato <benato.denis96@gmail.com>, 
 =?UTF-8?Q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>
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

On Mon, Jun 16, 2025 at 1:50=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Normally resources are evicted on dGPUs at suspend or hibernate and
> on APUs at hibernate.  These steps are unnecessary when using the S4
> callbacks to put the system into S5.
>
> Cc: AceLan Kao <acelan.kao@canonical.com>
> Cc: Kai-Heng Feng <kaihengf@nvidia.com>
> Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
> Cc: Denis Benato <benato.denis96@gmail.com>
> Cc: Merthan Karaka=C5=9F <m3rthn.k@gmail.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
> v3: https://lore.kernel.org/linux-pm/20250609024619.407257-1-superm1@kern=
el.org/T/#me6db0fb946e3d604a8f3d455128844ed802c82bb
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 8edd88328749b..c5d8f6d551238 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4966,6 +4966,10 @@ static int amdgpu_device_evict_resources(struct am=
dgpu_device *adev)
>         if (!adev->in_s4 && (adev->flags & AMD_IS_APU))
>                 return 0;
>
> +       /* No need to evict when going to S5 through S4 callbacks */
> +       if (system_state =3D=3D SYSTEM_HALT || system_state =3D=3D SYSTEM=
_POWER_OFF)
> +               return 0;
> +
>         ret =3D amdgpu_ttm_evict_resources(adev, TTM_PL_VRAM);
>         if (ret)
>                 DRM_WARN("evicting device resources failed\n");
> --
> 2.43.0
>
