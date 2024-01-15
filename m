Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9DA82DE1E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 18:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE5D10E2F1;
	Mon, 15 Jan 2024 17:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B1D10E2F1;
 Mon, 15 Jan 2024 17:03:08 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-205f223639fso5656737fac.2; 
 Mon, 15 Jan 2024 09:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705338187; x=1705942987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1fgUZQcmOYmK00Ogyq1MRr9eNSSyjdevfo9jMdY5qKc=;
 b=izZMV7Nvhd0EXfwq/7tgCzijyVo/lZK7Ay/gVsaWtLcfh0XNgAuwfYfdCVvPUrxyDL
 ACb1BklkpfvQGe5nZ7nUckLUlKRIuOcFQv7yJJhtuFWA+vFUDkzo2gtHabFENylZgMmV
 HRwxvhD0tYQhs5T5BKVXkCQ4yuREa5/JeSI2X5HKiV0g55NdScMDXiN0Rsa6Uzc348qM
 xn+tyHSEcSPzhgIuzKqVxu7GLbKaLNEo+27diih2KSgAs6hq3Wi+TP/sUAGcHcm06yiT
 D1lc0IXqDS9F8sTSqarkSLUUa9p7vXqfvG+Qn6xOALn3b1PrxWqNkvHYR2zMHiKDCUQC
 lujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705338187; x=1705942987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1fgUZQcmOYmK00Ogyq1MRr9eNSSyjdevfo9jMdY5qKc=;
 b=txHqPRQ2WwTQpXTkSM6xVN1Lh8WdbhGZKAacxOY8u2RryE3PTeFZHhuBIUwjFL/WcU
 0FBRyqUcWrKKQsF08aU/YLidniBTBNmWRFk88T9mhfEyRp9UaL7DYC5rYfDeo3OqwUId
 hrk1ICw/cSPak8VPtx9ovaXpoY9pdDAYEe+blnb0x/N6yMWAOcOpbJYPp61XEMcfoBHn
 06f9BlNVgxsQc4Xzy1sPbBoPL2gF0/dqXrjRCCiveBQhNLgZ7xxC9o0YmMicltQaMJgS
 w36qNPVdBEQuP2/pX1nE6p/hhMcY9ivMuLpIaN99U1l1ubTK+kcC/Cq5qSjlSiJIfI+r
 Y9Gw==
X-Gm-Message-State: AOJu0YzF1Y7Mw+/WTCBg+tkPVzZsq47okJX0Dn4cMj15fOPyoVuPvKBZ
 TcWmwg8AR23lsI0FyYfHJRZZ0Ym9jxfn194IEWY=
X-Google-Smtp-Source: AGHT+IFmx4SZyITP3d+ZK651GFMqNPBuYso6fpXg81BJnj4lbZuuy4vSQXVTwX0qy3cGNCgd17/hwjkyHjrdVGb8NJ0=
X-Received: by 2002:a05:6871:8798:b0:205:c4d3:ef8d with SMTP id
 td24-20020a056871879800b00205c4d3ef8dmr8820687oab.104.1705338187418; Mon, 15
 Jan 2024 09:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20240110-amdgpu-display-enum-enum-conversion-v1-1-953ae94fe15e@kernel.org>
In-Reply-To: <20240110-amdgpu-display-enum-enum-conversion-v1-1-953ae94fe15e@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Jan 2024 12:02:55 -0500
Message-ID: <CADnq5_OH_YtGww2HUG5vypVmYgR6t-0Hup=apmUwQx+tQszeLg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Avoid enum conversion warning
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: Xinhui.Pan@amd.com, arnd@arndb.de, sunpeng.li@amd.com, llvm@lists.linux.dev,
 Rodrigo.Siqueira@amd.com, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, cruise.hung@amd.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, peichen.huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Jan 10, 2024 at 3:56=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Clang warns (or errors with CONFIG_WERROR=3Dy) when performing arithmetic
> with different enumerated types, which is usually a bug:
>
>     drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_=
bw.c:548:24: error: arithmetic between different enumeration types ('const =
enum dc_link_rate' and 'const enum dc_lane_count') [-Werror,-Wenum-enum-con=
version]
>       548 |                         link_cap->link_rate * link_cap->lane_=
count * LINK_RATE_REF_FREQ_IN_KHZ * 8;
>           |                         ~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~=
~~~~~
>     1 error generated.
>
> In this case, there is not a problem because the enumerated types are
> basically treated as '#define' values. Add an explicit cast to an
> integral type to silence the warning.
>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1976
> Fixes: 5f3bce13266e ("drm/amd/display: Request usb4 bw for mst streams")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c | 5 +++-=
-
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_b=
w.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
> index 4ef1a6a1d129..dd0d2b206462 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
> @@ -544,8 +544,9 @@ int link_dp_dpia_get_dp_overhead_in_dp_tunneling(stru=
ct dc_link *link)
>                  */
>                 const struct dc_link_settings *link_cap =3D
>                         dc_link_get_link_cap(link);
> -               uint32_t link_bw_in_kbps =3D
> -                       link_cap->link_rate * link_cap->lane_count * LINK=
_RATE_REF_FREQ_IN_KHZ * 8;
> +               uint32_t link_bw_in_kbps =3D (uint32_t)link_cap->link_rat=
e *
> +                                          (uint32_t)link_cap->lane_count=
 *
> +                                          LINK_RATE_REF_FREQ_IN_KHZ * 8;
>                 link_mst_overhead =3D (link_bw_in_kbps / 64) + ((link_bw_=
in_kbps % 64) ? 1 : 0);
>         }
>
>
> ---
> base-commit: 6e7a29f011ac03a765f53844f7c3f04cdd421715
> change-id: 20240110-amdgpu-display-enum-enum-conversion-e2451adbf4a7
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
