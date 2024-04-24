Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936CA8B0923
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 14:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0AE113AD1;
	Wed, 24 Apr 2024 12:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eOzr4is4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D85113AD1;
 Wed, 24 Apr 2024 12:21:19 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2a5ef566c7aso5416034a91.1; 
 Wed, 24 Apr 2024 05:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713961278; x=1714566078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bunj5XIiZEdgRNTi0guP+wyf7iojN98jqRolArsaLoM=;
 b=eOzr4is4DmoXjC2EdmEaASjuLhWEfaLgKF/AMWKFl2ckIWtfjJV8438ECkpouL+QTn
 6G1oGUUBrchdxsEwz99c44dKE5ER0hO0SVppMlQ8kQR97shqsDCu4/qZCw66mEQg+N5b
 cwuz1odSCq8OzagHUbh+zLQqzDPN9BeiyffP5veWx+G7XHblnx3P9/z4/BKydlrbae1/
 Z5h2zvyo1LG8v1ocTw52kuu2P3Xu/n7rxxlohy75kjdLFgv8wc6y4MeLXrKM19WHubqw
 VCJ9Y3hMXK4rxNk28yiFsaFVh/vlnXDaB+taGqwvxSYQN4SQxp8xuWY+sioxY9IoatVI
 gqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713961278; x=1714566078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bunj5XIiZEdgRNTi0guP+wyf7iojN98jqRolArsaLoM=;
 b=IN5Bj8/fmgPNwVISXHt7sooiiZcvHXbLE8V2/hksViCdaru+nqLa2hEWxSqNez1R3Z
 mjDG18u9/A06bpveFSuYmyp5SalY25t4ie9GzEZUffVIRq4Nt4V/K0fceF0hy/E0R+B9
 pkXW6lyYuoN1dMmfJCZQWRhFyxiccU7BfnIEX0pGH8XXIFegi6CStyEvqN6ksp1hGMlQ
 RH8weymRpBM544Y2PyeIUP5EimK1as98PtECjoS70mlc1yNymxfSPf0FDfziHMqdlBVX
 tnGZ7myUwxShLoYD7CndJLc3zZyVNm53edBnDXqvmgOXDIQXmQ3wjtF6S7gOY/7ln4GW
 iGGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkxObN6yctGjGXtxhn1UxEChXyUMyr6hp4lz22GZ5eqvdxmi68p1x2ZLBTVnQl72CgCDGFrebBT5i6Rll6DapIB/ph7EnXGc7yHMrGeI9sFrktWi1jwtK1Ka+M0FPQqT5wurclA1mc2loLn9MuODPd
X-Gm-Message-State: AOJu0YwBV66DDi9xI55ybqc5V36iJpAZAUhedX4XeLSdyBImkHIHwG1G
 3OR58OLAs+ICMskG5pwR+Eh4TE+JgSyRmY5OLtXKoHb7BgC63lK7G3VWh7o73sGl/x71Izi6PZB
 zHZrlPYHNcxL0g2yxwM5zAa3E6K8=
X-Google-Smtp-Source: AGHT+IGETP+1lVi26Ns4UGyWygBlMb5M8kF1qGR/jCcvzQIASLeqnOBJjDQv+2u0GvL5nvwmYlOH4XoyTdsIPgVGb48=
X-Received: by 2002:a17:90a:9a87:b0:2ae:8f3f:9bf2 with SMTP id
 e7-20020a17090a9a8700b002ae8f3f9bf2mr2063814pjp.42.1713961278417; Wed, 24 Apr
 2024 05:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
 <20240401-fd-xml-shipped-v5-9-4bdb277a85a1@linaro.org>
In-Reply-To: <20240401-fd-xml-shipped-v5-9-4bdb277a85a1@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 24 Apr 2024 13:21:07 +0100
Message-ID: <CACu1E7FjcBHHZerZjRBd7=WiLDu40-d6-4jKPcKmbY244w4Zww@mail.gmail.com>
Subject: Re: [PATCH v5 09/18] drm/msm: import A6xx XML display registers
 database
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Mon, Apr 1, 2024 at 3:52=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Import Adreno registers database for A6xx from the Mesa, commit
> 639488f924d9 ("freedreno/registers: limit the rules schema").
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml     | 4970 +++++++++++++++=
++++++
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  228 +
>  2 files changed, 5198 insertions(+)
>

FYI, this will conflict with a series I will send out soon based on
the register updates in [1]. Is there any chance to update this before
it lands in msm-next?

Best regards,

Connor

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28883.
