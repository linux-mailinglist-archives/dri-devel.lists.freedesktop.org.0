Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C9EB07F0F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 22:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E678410E3C6;
	Wed, 16 Jul 2025 20:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HSPU/JFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0165F10E26B;
 Wed, 16 Jul 2025 20:41:12 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-313fab41fd5so79205a91.1; 
 Wed, 16 Jul 2025 13:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752698472; x=1753303272; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9WTk3ecSPyAdaWfFH64n9hfQBBys+xnWczCgTkT/lXE=;
 b=HSPU/JFwJ7duJwzWHnBBJ2Kz6546ZGOJZ7qm+iXnIoUMyAJkwrYKLbeW7FyOd3Q0QA
 FFYc9xDkQydmdFy2fv+042Gry7c+WCgG/dAsHogapyHYv3y5YkX3bpFbdGOaWpJF94at
 1GKmYnLzNiNpzTfcrb3qZrllaoSMbsGYGBDbxEpKfHkTIbEJXlEucl/Gf1VVB/tTinil
 spGwnffT0zgqRRnuyGco4hcuI46Y3GotXOa/F4+tk6M4iY/M8UelL4p1EgKAnudb6unB
 YSM//TCqwIoJw+1LjpK486sNCCj4grqa7dV298E0L2IgN5h9o10020LcS/afFQrJvPaT
 hTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752698472; x=1753303272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9WTk3ecSPyAdaWfFH64n9hfQBBys+xnWczCgTkT/lXE=;
 b=UgWMPYLOQ5B8j1SYbwAIR6bFNwvp1FY+PwmWqkJui6E4mDezfjTbMch8P2MlaQYOyW
 JFEeC9ly/1brJwOLpconrFn++maXQn/VRu76n7XsUinxOObeRrmtR9rsRDw5la9rbKpX
 2tQVO1YnIK32d72dRmyA5HGh4pyjn61d0Sp9lme8lT3QqkbdHltVmKorm3Gp/VQJJQAr
 lrKuw7ca3sDlP6g+VVFvwKSINxIrcMtHGPKDp1kTEttTlZXNNlPN10syk4rHjlmdaKOP
 5P+wcoXBhnjcezoRc6onXFU9lzu+UHrOK9gRFtmrnZip+A7KTZHoR51UsJwjmoG48anQ
 AthA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkqcw+p8WgArC0bjpdLakV5Pt2BOvu8tN7wfRyrjgpCQ70qO482z8ZoG2D8GOIRPaDi1WbC4CQr6QZ@lists.freedesktop.org,
 AJvYcCXjFfUMlBuCLcN7vDLxD8GkzzwG02cB2RdDKtDtfcQj6M6cnSbEyyNTVYfYBs/3skx3qpLS3i3S@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6fUHt73OquRpG8CgdbKqUcNtq6V2dIZps0NcxapOVWVe+Brcs
 /hiVcuq1aPFeddllixxCS9vmxYaM/nfNWNSHKZNaHO0G4eWqVsPTa143WZlgTJR6kN8RjEymyTu
 UUywu7fml6qBlqgIFw6VuUIW6W5n46pU=
X-Gm-Gg: ASbGncv7gFdyvMVA2tBJd/4yM3181YIS00MLTxGNTboTG5u9HhiWJOGIRR2mdwzYCGX
 Nek46sGhfEeFQAfV6y26LzczKFxgfE3Hdo7DDNgyubOXmzI5h8/GyTaIaquvBSGOadR3IHUfozf
 2jd7kBTmbQo+NlPCVvhbWB2ZMJfdB8EAoKgnlqMIB/vufWzfoX3JGKzIMJrJ2EPqsDun84uhdAx
 KRzhllU
X-Google-Smtp-Source: AGHT+IHuHUD2m7ZHZ47B7El682iJGXBuIMMlr9IIW1bcSj4FYiX4jkSjOzexVGhwwdlc0xDtvJfZAg9JN03gQ2X+ToM=
X-Received: by 2002:a17:90b:2689:b0:313:151a:8653 with SMTP id
 98e67ed59e1d1-31c9e7a412bmr2253586a91.8.1752698472350; Wed, 16 Jul 2025
 13:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250716203546.505788-1-alex.hung@amd.com>
In-Reply-To: <20250716203546.505788-1-alex.hung@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Jul 2025 16:40:59 -0400
X-Gm-Features: Ac12FXwkZjc7IGICBgoi7ZjfjRMfZtsC05b3P-zGF2GmgP9MfBQMimTLLynsjxU
Message-ID: <CADnq5_NDv4heRD6rWCEuqZfhieJ3PK+Ez6uO9fc_e90KjFTJrQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix kernel docs for struct mpc_color_caps
To: Alex Hung <alex.hung@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 aric.cyr@amd.com, aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Yihan.Zhu@amd.com
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

On Wed, Jul 16, 2025 at 4:36=E2=80=AFPM Alex Hung <alex.hung@amd.com> wrote=
:
>
> [WHAT & HOW]
> Add kernel-doc for a new struct member "num_rmcm_3dluts".
>
> This fixes the follow warnings from "make htmldocs".
>
> ./drivers/gpu/drm/amd/display/dc/dc.h:255: warning: Function parameter
> or struct member 'num_rmcm_3dluts' not described in 'mpc_color_caps'
>
> Reviewed-by: Yihan Zhu <Yihan.Zhu@amd.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 26ad78fffc66 ("drm/amd/display: MPC basic allocation logic and TMZ")

> ---
>  drivers/gpu/drm/amd/display/dc/dc.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/di=
splay/dc/dc.h
> index 59c07756130d..fac976b2cbee 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -234,6 +234,7 @@ struct lut3d_caps {
>   * @ogam_ram: programmable out gamma LUT
>   * @ocsc: output color space conversion matrix
>   * @num_3dluts: MPC 3D LUT; always assumes a preceding shaper LUT
> + * @num_rmcm_3dluts: number of RMCM hardware instances
>   * @shared_3d_lut: shared 3D LUT flag. Can be either DPP or MPC, but sin=
gle
>   * instance
>   * @ogam_rom_caps: pre-definied curve caps for regamma 1D LUT
> --
> 2.43.0
>
