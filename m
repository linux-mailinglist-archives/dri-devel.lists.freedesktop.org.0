Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EB2AB3CAB
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 17:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA9B10E441;
	Mon, 12 May 2025 15:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fKIxilUc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5604F10E441;
 Mon, 12 May 2025 15:49:00 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-22e62c101d6so6699225ad.2; 
 Mon, 12 May 2025 08:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747064940; x=1747669740; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1toMIC5cZ80kbGTeUrqsXajhHvT1yGhs13QyNN+QB4o=;
 b=fKIxilUcYAJe/ZDTTL9psqibJAtSdbtihoMAd1XcVPZjjUidpol+grYzZafAYMGxdL
 0CaLJRVcFbeBYIxlFdNqhAWJkSmwvSa/e4LbH4XuZDt8H4AOeZciEbKrToYrAoKp+pwg
 R6eBmWcYtqp0Ltcwogr0gPiMSKVkTnjhJ+iXF3bII+X5NdU+LfB3c7lIuBD/JDIUfOd0
 nEGy8NDLog5NOq3/doe592QN2vQpnZL6tmLVXzXbbX8wuMEeP1ic9U9o4Z20vzOcl/IU
 zIV/jYmTZqIZyQC98jgFWbQEdidSwdYm4PJ7RanL71p5qYRDNJ/JnUe07ow/05mY55cm
 4z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747064940; x=1747669740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1toMIC5cZ80kbGTeUrqsXajhHvT1yGhs13QyNN+QB4o=;
 b=u4ZvBVGxioG0W0/1XuPzYrVbIa79vsLZINQVTcclE4aTzXww0gJ1RQ3ybFTRAWRgT+
 JhxTfSJXASlueghxQ4B+t0Ca/DG1CQZeWU+Pj1KtgNZN5N53kF9r2WFlURMDljWpIRPz
 G7OekULcHlxrevyfPOQRU+bxhOprp01VaBYNaW6tVk6T1C++AmjENNtACw5qLQ+LDxBb
 juprhtmQ1Oh+yoj+BxMwOKywo3rZNS9iastGWDARwL3592DAnUaQkiKZaNVMW5uJeVJ6
 c2YZSjEyQgh4UIvT7vmqNlgloHwDch7YYQ++TBNcsvpb3GsJaj6+GF1FyC1zN4kIvxwl
 IwaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNrDAY4j+kMnKSkxCGoI8NCT0DCqjMLUWOOdiRUOcoCBsdM63HmVvpoPQ2rAH7qZt29sU+i1TJOoM0@lists.freedesktop.org,
 AJvYcCWgTXyh23CasLV6nfU/KWzQDipHDH7+8frTV52tM/ZfukYO7/0lNSvKtZd7g7r3EVJElkFsVuxu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAsvM6h6uaKwO4qXsVeVeymFF6zIGOSoMbSV85G7QDZmtGvA06
 yrh274wDFChp6cS+b+7sa3mxG3vvSRRdgtvZvXxGH/+y6io0tDSfE+emKJMP8nCsB0z5V90Q9kj
 o7YnPrY9QieEoT6PAXsh03VUIfEg=
X-Gm-Gg: ASbGncsqy5PayytXiUHdyoiWUBpJlTnijb5eaBxGqocCBhSyfiUv9YPFh36/0oMgDLB
 q3xAcJx+am2cGhpdVpdy0S4S07pX8nGII9oMdmwtQt2n9RQAJQQK6h7g5cmmJoxoMJ0tB5cjXPj
 1Mh2tMngGuWS0aloUad6+H2zyos/K7+uyctOjRRIcHMTg=
X-Google-Smtp-Source: AGHT+IEf6tEKjFeycq+UPlsS94TJHt5DH6CFc9vHqIPjnQk1kbzxBAOujdq7+fVBzkSYWm7S9YFoxapZxqZHVDT5E44=
X-Received: by 2002:a17:902:e88d:b0:22e:5bdc:fe24 with SMTP id
 d9443c01a7336-22fc894997cmr73958435ad.0.1747064939757; Mon, 12 May 2025
 08:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250512074215.40928-2-bagasdotme@gmail.com>
In-Reply-To: <20250512074215.40928-2-bagasdotme@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 12 May 2025 11:48:47 -0400
X-Gm-Features: AX0GCFsa3NVdD9o69w_BNRqPm2ZbQH3a8ks0cMWBhi2YgHQxsTH8KYq-3IVam30
Message-ID: <CADnq5_O9X-rTUOPdaQEh_G3DajbSBwdxoDfDLVmDiyh-YT=ptQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/gpu: Disambiguate SPI term
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Documentation <linux-doc@vger.kernel.org>, 
 Linux DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>, 
 Linux Media Subsystem <linux-media@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Rodrigo Siqueira <siqueira@igalia.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
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

On Mon, May 12, 2025 at 3:58=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Documentation/userspace-api/media/glossary.rst:170: WARNING: duplicate te=
rm description of SPI, other instance in gpu/amdgpu/amdgpu-glossary
>
> That's because SPI of amdgpu (Shader Processor Input) shares the same
> global glossary term as SPI of media subsystem (which is Serial
> Peripheral Interface Bus). Disambiguate the former from the latter to
> fix the warning.
>
> Note that adding context qualifiers in the term is strictly necessary
> in order to make Sphinx happy.
>
> Fixes: dd3d035a7838 ("Documentation/gpu: Add new entries to amdgpu glossa=
ry")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250509185845.60bf5e7b@canb.a=
uug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Applied.  Thanks.

Alex

> ---
> Also Cc: media maintainers.
>
>  Documentation/gpu/amdgpu/amdgpu-glossary.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation=
/gpu/amdgpu/amdgpu-glossary.rst
> index 2040da593b1490..30812d9d53c645 100644
> --- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> @@ -182,7 +182,7 @@ we have a dedicated glossary for Display Core at
>      SMU/SMC
>        System Management Unit / System Management Controller
>
> -    SPI
> +    SPI (AMDGPU)
>        Shader Processor Input
>
>      SRLC
>
> base-commit: afc6053d4c4b0a6be500b9e643aa17221e93a57b
> --
> An old man doll... just what I always wanted! - Clara
>
