Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AAD96B1E4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069A010E608;
	Wed,  4 Sep 2024 06:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CllFdcrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE9110E608
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 06:37:01 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53567b4c3f4so280789e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 23:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725431819; x=1726036619; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=363mU4m3lLPvF7ATuhqmz9NXB63S6HLlYBsvwTXiiwc=;
 b=CllFdcrUrO9ZJ1Tc+zGpSzTE8EWxAjFHGb8ee9ynUDDWTzNZY/FHaY0/4FKCbRX2kV
 iaXZPiou1T3a71O+coLYCobe8wdZ0fSqOoLphrTRPLY9TGxo3FJlgrshoRNolpe9kc9L
 pqUyzf2fpjzyhse7mrhrAVcH+aDh+mi6fFfSCEbSlIeKWywKktZ3rrW0pj00GS8mYh6W
 txiSjednpwRv5NI+2I1B5mzicAoV5mehoqLUgM4RoRNoUg2ahiE6crY2Jb2id2yPWq/m
 hxLdlqRJPAN2oPHtFKPCzYEZM2NJBoriy/1Vz796KA6FnEdURiSwbUKTecxNPwI832R6
 H3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725431819; x=1726036619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=363mU4m3lLPvF7ATuhqmz9NXB63S6HLlYBsvwTXiiwc=;
 b=FmGldS04HGqin5cC/xlBmEIYj707CbYvd6Er/a2KBvMVM+OZAYSyr2hxoBjjKNywb1
 GLSBDfuBWNYKG8+hyHgi6bsCuDfA6UzmWA49Z3ZrehJ0/ZWDlC3CfLpo7UCahyiyQYi7
 21HQkByiGFR6nMeeAkfddKjxQ08BiLfju677Aczf6TXeJdFHBz0+BK9ndHpB8TngzRUk
 d7ML8nEuBlEMS9CVFbpae7mdeT+evn7FNLP4Es9JOP73VFKdH9px1v7v+MptlRH3oXS5
 DAfcL+J+5GPtNzjSI1Jaynik4lNbiAphMheHD6Zh41FnbWChIHwQ7eulnF8aSviET3sT
 EcKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0RuGseJLoqLTGE7MjDCI5+DBOqqsr11hWOXF/mY73h8HYvWxdv4wTQukZWxNAnYpXnx9TcismVe0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxevfjAwlkyeVzfUiCJYNozfrVKq3LStWJOv7ixpVD4YsJaOuPr
 ybMQcR/GklUde+KLoaIrlNSFF1kat5L8mjoY/vNGWurIuah+PCxczSMWjktXbAedhRcRsivqMbs
 VA6v1wjw7IdIrlUUYigIFcghU1ouVLPgp3agoGQ==
X-Google-Smtp-Source: AGHT+IFANbFFIb2AE+3bD/mCPJSNcgwATi9WIJUaz/OV5LiTCV5RiZYF1CJAENDM7jd3rljQYOcJ7sOu//gFSmUsuSA=
X-Received: by 2002:a05:6512:6d2:b0:52f:cffd:39f9 with SMTP id
 2adb3069b0e04-53546b2c596mr11407999e87.24.1725431818339; Tue, 03 Sep 2024
 23:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240419083331.7761-1-tzimmermann@suse.de>
 <20240419083331.7761-22-tzimmermann@suse.de>
 <CACRpkdb+hb9AGavbWpY-=uQQ0apY9en_tWJioPKf_fAbXMP4Hg@mail.gmail.com>
 <12510239.O9o76ZdvQC@steina-w>
In-Reply-To: <12510239.O9o76ZdvQC@steina-w>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Sep 2024 08:36:46 +0200
Message-ID: <CACRpkdbJEv7pV_LOZO_2s_otSth9EYM7=fH9VPgxUyPom_BZ4Q@mail.gmail.com>
Subject: Re: [PATCH v3 21/43] drm/fbdev-dma: Implement damage handling and
 deferred I/O
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 javierm@redhat.com, deller@gmx.de, airlied@gmail.com, daniel@ffwll.ch, 
 linux-fbdev@vger.kernel.org
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

On Wed, Sep 4, 2024 at 8:09=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> Can you please check in which memory zone this VRAM is located. In my cas=
e
> it's important CMA is located in Normal zone to trigger this problem.

dmesg says this:

Reserved memory: created DMA memory pool at 0x18000000, size 8 MiB
OF: reserved mem: initialized node vram@18000000, compatible id shared-dma-=
pool
OF: reserved mem: 0x18000000..0x187fffff (8192 KiB) nomap non-reusable
vram@18000000
cma: Reserved 16 MiB at 0xef000000 on node -1
Zone ranges:
  Normal   [mem 0x0000000080000000-0x00000000efffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000080000000-0x00000000efffffff]
Initmem setup node 0 [mem 0x0000000080000000-0x00000000efffffff]
percpu: Embedded 15 pages/cpu s39052 r0 d22388 u61440

So at the top of the normal zone at 0xef000000 as I read it.

Yours,
Linus Walleij
