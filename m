Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC1A975966
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 19:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B4F10E08A;
	Wed, 11 Sep 2024 17:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gl4dDBtC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D4610E068;
 Wed, 11 Sep 2024 17:28:51 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-718e25d8b67so2524b3a.3; 
 Wed, 11 Sep 2024 10:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726075731; x=1726680531; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/5EzSlXh1lS0icq6diShUrZshLQf1oM6mIWH0eLac6w=;
 b=gl4dDBtCooeqXhLXoQLqxzftdwkOx28u2XlFgOmFGI24q1gaGZPwG3X/DDTLn6Q4+9
 w4pLO7AjqzQU8CCXeDEfqvXq2jLNOefs7m6KcDE/JsR4mT4+Y63Ktp1LltTmVkXAKDfM
 l7QKI/VWg/ua162aplDFE2Hck/v/mSY6BkVj+bJPAz/OLDhT5Nf24fFkbqkLL/4nOeyW
 J/6bUQaxIoHxNu484JO4ko3EyULAcJLNOT8Ol7QsJQK/zuo/xOWFgHX0GFRE6dlRlcD+
 y+4OmyMs1eeIv+KFjG60VHRjAwqWI/irX7PZUnRTRIzOKunQXPeKW171bxLvhFW36D6Z
 TY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726075731; x=1726680531;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/5EzSlXh1lS0icq6diShUrZshLQf1oM6mIWH0eLac6w=;
 b=gqcD7f06egqWnTkIIGb1ctmpm1txudShB/FOzvRHH6NbyafwbUWC42Ow0ya7qaqs3S
 RFmqRv7XdGqRIO+7RPDZ7ycc4nnCsvt4z3Ouv+epG4vfJciWvXokemjgNtS0G4BJhrrm
 +RLfOdgg+T0/EMOPJviRKumb5E41LuTrIIl9N7zVejWuJIdBZUNODE8KWv1LPXebecum
 Svy4oGEQhnUWdzbNcQEMs1ycVGkerhKUxwKE3MyQSlRj7FqJJ8YbCN1RaXn9KWc1HS10
 IlIX8QQwqj+I20hbzZyE/b097ar2WxBxV9KCbdtOmPyNmKx7UNWM9h4BkFIK1qBFaI4W
 DBEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj2lh4rkcGiELJUJLlhhEO9o7SZ+jJIWq9Tru0wWJ8MdCNCqDREFU7vqhhLFkS100YmERzzHSd@lists.freedesktop.org,
 AJvYcCV2jvlPvGeyuw/Bn2b3X5UzmdSEyRe4cU2zOxzF9nEettQVcVoCurfOlpHc7aZTUz864JCovN3Pa3DV@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo2U/pmc2r96OnqXLNMmPRQHxvSAiOVHfNleoKZDb9S32mozLc
 ake5KU/tnjNFdD9fNlVkKzWYLcnIpQx2JAoxhnItfAxrk5Bg9epgE2qnU1uCZU6+eQX8q8GrRwd
 HrIdu0VZbYID9XL+ldAJAWhReMUs=
X-Google-Smtp-Source: AGHT+IFA0G5uZOCBy5k8O0yLZZs1R0rN4uQsSJU63PRF6WnRL3LSE0hcu7DKXdFxbgJhEXyTWbnXeuxNrWxsXZem3jE=
X-Received: by 2002:a05:6a00:1790:b0:710:51e4:51f0 with SMTP id
 d2e1a72fcca58-719261e77c3mr77539b3a.4.1726075731083; Wed, 11 Sep 2024
 10:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240909224122.14780-1-algonell@gmail.com>
In-Reply-To: <20240909224122.14780-1-algonell@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Sep 2024 13:28:38 -0400
Message-ID: <CADnq5_NMW5jkWqq_uGXgLLvZmUHbeLvJGhOhus27iar6Ry8pHw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix a typo
To: Andrew Kreimer <algonell@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Candice Li <candice.li@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, "Stanley . Yang" <Stanley.Yang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, 
 Yang Wang <kevinyang.wang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 Matthew Wilcox <willy@infradead.org>
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

On Mon, Sep 9, 2024 at 6:53=E2=80=AFPM Andrew Kreimer <algonell@gmail.com> =
wrote:
>
> Fix a typo in comments.
>
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> index aab8077e5098..f28f6b4ba765 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> @@ -58,7 +58,7 @@
>  #define EEPROM_I2C_MADDR_4      0x40000
>
>  /*
> - * The 2 macros bellow represent the actual size in bytes that
> + * The 2 macros below represent the actual size in bytes that
>   * those entities occupy in the EEPROM memory.
>   * RAS_TABLE_RECORD_SIZE is different than sizeof(eeprom_table_record) w=
hich
>   * uses uint64 to store 6b fields such as retired_page.
> --
> 2.46.0
>
