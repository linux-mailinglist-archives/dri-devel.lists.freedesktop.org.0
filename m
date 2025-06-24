Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4046AE6C17
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 18:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C241410E5E9;
	Tue, 24 Jun 2025 16:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZQWuKUng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF6D10E5E9;
 Tue, 24 Jun 2025 16:07:00 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-237d849253fso8908395ad.1; 
 Tue, 24 Jun 2025 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750781220; x=1751386020; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p469Z/13LqtJ+BNt8oKrD3ps0WvPg6z+cySWcusL5lU=;
 b=ZQWuKUngX9Q1j+6eJoukfK5UuipNzeR4w79G1X4seaP0Q8+Vq9wmo2OYaAwkEo+xLg
 5EQreL4rUrF9phgqFV1i6SE1t8szrzJ0YDCfiQDlJCNdquAcJko367rXxZULB6rf/niy
 nkKDGJDb+7hXdS/05A+3Pk0NNc0HzwB8nvF5g2W+GVQBL0FCAhAZo+57tXdOdjPAYOru
 ocqDmXgEuz9FUA36pMY0mWBOkuZv/mehK0gkIA7tnEIS6keLo/M+fToSyC/046TcK3er
 g6FDNG5Cvvg1rzAKitYUBnQ9IB6icHDT4kRnLlh2R2AmcEwpaHTImTOI8JHmvYho/RqO
 MgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750781220; x=1751386020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p469Z/13LqtJ+BNt8oKrD3ps0WvPg6z+cySWcusL5lU=;
 b=s/jSua0Eyl7XwQthlSr051rW9Yy2vry76admzOZr2AR/AqWxP4YhAlntJeK/CZJnQO
 sDeSHZyX1pSNmVGTDG2ZrJ8LR04AzR7LfD+4syRkY+ptieqB+m5VzocAQhK/xSH6ft8G
 YvRLMIVTriOZozyYEx5BQ+DbFSKhL0EJexeGv89KeXvXa2jl1wqHfz6j2MjE4aBio2Zr
 alEUYg10KVBs7iFjiillYl8r/nnd2aoGoU3qvQA6eCND3fYvG1hLBNT83Y5+ToymN58n
 p1ax+bYZzyJoTaA9A0qeRfk4M2S31UAlGUcNXxqENTeyVvpXUHq1vaggEiJGaQtaWf0j
 fcog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOoHgX6sAfZNFPSfL8XZ1k0F02iQIzyRAIhmDmeubL0LA59758mB6mvR+3FLCRAK4opOJuP6r1c+FW@lists.freedesktop.org,
 AJvYcCWp/u9XYzGL/DFpRcrzEDXx+MYjY4gdLP4cIf6QfyzUBrpwR4AiTcwv+1LkomtqLWpDt8V4enNU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiuarHc2ONgmlaBNQ4dbM/Tfm8IafO73Ekd4NL625c7FwHlQai
 u7lkVbrXebaFc4kcAkGaN2ZQtdSTkPTtBZzKTxkQKfnTqiFEqXwCa650aG04ca3LHOIaJoINHn1
 3Ka0cNGEQ+KXPc+mWv3mCS8CEYIX0SQY=
X-Gm-Gg: ASbGncu/4i8CkCmyHH4feFIAF2UNlkiVhWfCgrecWYAgVgGtblqUcaLI6+5IK5G1V+x
 y9JPOxIxScxjMK5o7vzucbQ8bfGVcphdfpAQ/JRV12DqkH2cltpOHwAUQuv7QuRVe/96ROhk9OZ
 p7fcLcd2y53gXk3S1DSn4NsSlOqSYPbQ+jrQ4sufpdIInK
X-Google-Smtp-Source: AGHT+IFYc3aMqLcv9loqWoG6Cca5FOBY7JI9DHpHoCgORxjIKHkQVWbdRXgw9oELbsi29DR4r0stwfPFPJoo6+BSQJg=
X-Received: by 2002:a17:90b:2dd0:b0:311:e9a6:332e with SMTP id
 98e67ed59e1d1-3159d577a7bmr10119236a91.0.1750781219668; Tue, 24 Jun 2025
 09:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250613182651.1758760-1-andrealmeid@igalia.com>
 <4907bbe3-14e7-49cc-b5bd-78ba375bf46d@amd.com>
 <f1d61291-f8b8-4646-9195-3724fdee184b@igalia.com>
In-Reply-To: <f1d61291-f8b8-4646-9195-3724fdee184b@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Jun 2025 12:06:46 -0400
X-Gm-Features: AX0GCFuxrPW3hb_jLYUej8jia4MsLoarWXQZKlGY5dgY_YRWYdFs1Tn4-SjFsec
Message-ID: <CADnq5_PRhMAoPj-deOkzo+3XSuZhnPZwvfjK9dUDrNEDZLPpUA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: amdgpu: Fix includes of <linux/export.h>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
 amd-gfx@lists.freedesktop.org
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

On Tue, Jun 24, 2025 at 11:27=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@ig=
alia.com> wrote:
>
> Hi Alex,
>
> Em 16/06/2025 03:59, Christian K=C3=B6nig escreveu:
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com> for the serie=
s.
> >
>
> Can you add this series to amd-staging-drm-next? Thanks!
>
> > On 6/13/25 20:26, Andr=C3=A9 Almeida wrote:
> >> Commit 7d95680d64ac ("scripts/misc-check: check unnecessary #include
> >> <linux/export.h> when W=3D1") and commit a934a57a42f6 ("scripts/misc-c=
heck:
> >> check missing #include <linux/export.h> when W=3D1") added new checks =
for when the
> >> include <linux/export.h> is missued by drivers. This patchset make drm=
/amd code
> >> compliant to this new commits.
> >>
> >> See also: https://lore.kernel.org/dri-devel/20250612121633.229222-1-tz=
immermann@suse.de/
> >>
> >> Andr=C3=A9 Almeida (2):
> >>    drm/amd: Do not include <linux/export.h> when unused
> >>    drm/amd: Include <linux/export.h> when needed
> >>
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c      | 1 -
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c   | 1 +
> >>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c     | 1 -
> >>   drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c | 1 -
> >>   drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c  | 1 +
> >>   5 files changed, 2 insertions(+), 3 deletions(-)
> >>
> >
>
