Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F371A772BFB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17B310E30E;
	Mon,  7 Aug 2023 17:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAB910E30E;
 Mon,  7 Aug 2023 17:04:00 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1bb89ac2013so3525570fac.1; 
 Mon, 07 Aug 2023 10:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427840; x=1692032640;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXFBy7712uE3kfDTRNRBt1+/C4b4AQWJWe2+dMjh1ks=;
 b=K0XjOCrnf/nJH0pqMzpC+/VboRlwZCR952ZMtzBtMMnxLv66byrTwmDwfZ+ooDh8ZW
 QreEURBnxzIrySgkkgkwN261N4My88y1GrRhH8nt1YdEN83Iqj0SufCII9zIhiDpE64s
 d8sLSmIJpulOdgXOev86k/z2JKfiYwcU5Nadf5D6uQLrE6yITUhdqmX5KfOkaHRC/8Gt
 DR0r+KHNTXfibhP4SGPmOZTbE22OmCBYq51hUFCD2ffhu8eVVyr3+uRjYI90nlA3qxXK
 wzu5/ZyD28a9O6sfAOh/sB/Nibz6Smh2nCa/HbVR6Wjh597j9XxC1cDSUQxqlvP3zpvB
 PEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427840; x=1692032640;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zXFBy7712uE3kfDTRNRBt1+/C4b4AQWJWe2+dMjh1ks=;
 b=QJzTAWj7YlrFd6M32a2845PYfkp42gpz4C6iIu+yrn/dna2BK/do2gKk6yIagwqDFu
 S7A3nhr9MirMtqY0REfy19YP9V1PwOmpFr5t/8U1yjwPMVil5PVcUIpStirdt6XH8pzz
 zpdNyg4DC7PI3GUX6NlPpFKr5i+0n+pZTwBdBokYXcBFPDZ1G1zj1HsIVvYkTSr8BJIr
 p9F4jGE5w/Ru+Vi7EBgivhkAQDv1InUfpoKw/nKoJERshZM6R0+USWcn0jpnb14nBYNh
 CFBVp+N9MPgAYR93+K4EYP5i0tUCH5wV2YqK4Kk+BT72niIebFZxWi4E1E8h+UGtFJyU
 4NHw==
X-Gm-Message-State: AOJu0YzO6eSDtAa7e9mrNEfQoc1bnuWfm3YtLWlYWhETYwRN0GiHogPR
 ohqRnITKFGEvzb5PL0ouKg2qM2Jfb7VdEa9niWM=
X-Google-Smtp-Source: AGHT+IHlkC7Pt3rCEKpR2f6h9hE2+W9zb5ra8F/7JHeXbFW/+rtKjGLMF4AcecgpLGAMJWPvoqJ0HH71kilAGM+D2Ok=
X-Received: by 2002:a05:6870:702b:b0:1b4:60b3:98bc with SMTP id
 u43-20020a056870702b00b001b460b398bcmr12150216oae.2.1691427840112; Mon, 07
 Aug 2023 10:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230802021504.9439-1-sunran001@208suo.com>
In-Reply-To: <20230802021504.9439-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:03:49 -0400
Message-ID: <CADnq5_MMA479HCGqitBKGvd4hn8pquiA1b_=veZzJWpZPSrPEA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in r600_dpm.h
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 10:15=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/legacy-dpm/r600_dpm.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/r600_dpm.h b/drivers/gpu/d=
rm/amd/pm/legacy-dpm/r600_dpm.h
> index 055321f61ca7..3e7caa715533 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/r600_dpm.h
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/r600_dpm.h
> @@ -117,8 +117,7 @@ enum r600_display_watermark {
>         R600_DISPLAY_WATERMARK_HIGH =3D 1,
>  };
>
> -enum r600_display_gap
> -{
> +enum r600_display_gap {
>      R600_PM_DISPLAY_GAP_VBLANK_OR_WM =3D 0,
>      R600_PM_DISPLAY_GAP_VBLANK       =3D 1,
>      R600_PM_DISPLAY_GAP_WATERMARK    =3D 2,
> --
> 2.17.1
>
