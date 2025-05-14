Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73677AB6DED
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 16:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C422D10E64F;
	Wed, 14 May 2025 14:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HpvDwnB7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112D610E643;
 Wed, 14 May 2025 14:16:30 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-22fa82144bfso5567835ad.1; 
 Wed, 14 May 2025 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747232189; x=1747836989; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3n+16DpFOcpOhaliZB3idim37DYPJw0hjtvBfmuDl1M=;
 b=HpvDwnB7iDrSL3ddNkkJZvjMO5nmMhDHRabJs3g/CqnfeGewTiYpaJslVnNixRGk5x
 UWiVx8fNuU1+NUO8z2dUOo0rH4hzd5yHc+Yvt8NTxmlgkc/+qUvgZ/wf/OySBppqSvKq
 YeIT4Qy73OYu5ERgWbk50rrfR7gtb5kSUNq7q1xtC1iMRQxDnpJx3HBrgmzhKwOXGECu
 ZJde6mKV+aXS+XmO+tR3nu+stX4QK1HIKafG9MUOOkfL4nL3fnMHUax0iCKW/TsoG6VE
 rxhSy6uCZwdbg4aOiK2EQEeWIWXboEhZmL2LfOZHutNs1EmmvSz/00SN2WUPmJD6Npdy
 PW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747232189; x=1747836989;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3n+16DpFOcpOhaliZB3idim37DYPJw0hjtvBfmuDl1M=;
 b=bGNlAYeKU3MAxLTIvuXSqugrbZV9zd/Slxdu8M2vRpSF08X3RkPPqUTjDXRIRr6HUN
 a1dSBVKRCOn7POoumL60egTRv7pfE0wmBqiZIw8p9GHEgGoIOYSAScWMtkndDC/lLeH1
 SZ5bcRgDBgdVplPonfqiVmptsYYkj6d4FBpTvFTuq1pL9zQlG+8EsmwxcXWlky4HQ3hy
 +Fv7Q5xzn/UiogpXn3alprdZYdFUIJoYmNfaUDHddngj7sDcke9h/OHK//fTk3MY5xKq
 6YGlnzdFF//equIf0KTrGvJ1u7rV0iQgxWa1pAmgiHgTD++wgkvcG1rJXiRdqqubklVk
 sncQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3Sjiko/s6NPySGlf7XTY5NCw98o8JbHTU3dMivMA61UvpDvzOnoAaD74sEmyWXN8Fw4lGhwF8@lists.freedesktop.org,
 AJvYcCXwPy6yabr/1dbN4RcHcnLcDVoHq/xGHvtlnx1vb9D+wUP+OSVu2kSQGKxOm/AoKrqDF5ySSnXCRraL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnUVehAc5lYJO30hjXiM+ttFv9GqBrZZGMfsTu9MevlBlePnLW
 qKBvW0rhcqnS0Y0Aqs81lsjptbQNEHtm3oQpMz7U1EShcJ2Zbr/JtqTTQg9fSs9iia7WpKQhSIz
 375OWPZ+h+iuf/8VeKOjHhdvgRl0=
X-Gm-Gg: ASbGnct0gOAfNe7DXwPo6OR5+WN73npB7fCDxyZv55jqc6mDlQUkDgdGtXSbGndeKLe
 NskexjzhYm/e4Y5TQscCy1Oy5Qk4ysl+hR0yjrV709Q8gWUo/vCSxR1WN5YUAjFY2ZF+KxHUMW9
 2fVbGF4HQ4DPm3XBhfyhQdVCmL40HDel7+
X-Google-Smtp-Source: AGHT+IGgOLVHlFTGN9a0SvwGp9aOaUq0v2qKq+BNE0DOArgTcRewkV7J2kadBkn8RZHPlisNdGKLis3afd8TsAPJpdo=
X-Received: by 2002:a17:903:1a6f:b0:22e:62da:2e58 with SMTP id
 d9443c01a7336-2319812a735mr20961985ad.10.1747232189515; Wed, 14 May 2025
 07:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250513233212.21186-1-contact@gvernon.com>
In-Reply-To: <20250513233212.21186-1-contact@gvernon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 May 2025 10:16:18 -0400
X-Gm-Features: AX0GCFukKcW8G7VG06CTXQGuzf_x_lHNu0hKnNMVT_ZvRA146nuD9ytPZqqbJCg
Message-ID: <CADnq5_Nv1b+C-oaQi1hEq15T2fOZS0FiQ+RgOyQyOizC6hGuaA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix docs build warning
To: George Anthony Vernon <contact@gvernon.com>
Cc: airlied@gmail.com, simona@ffwll.ch, skhan@linuxfoundation.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
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

On Wed, May 14, 2025 at 3:24=E2=80=AFAM George Anthony Vernon
<contact@gvernon.com> wrote:
>
> The kerneldoc comment for HGCP locality check debug mask was missing a
> semicolon resulting in a documentation build warning. Correct it.
>
> Signed-off-by: George Anthony Vernon <contact@gvernon.com>

Thanks for the patch, but this was already fixed.

Alex


> ---
>  drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/a=
md/include/amd_shared.h
> index 4c95b885d1d0..c8eccee9b023 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
>         DC_HDCP_LC_FORCE_FW_ENABLE =3D 0x80000,
>
>         /**
> -        * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Chec=
k FW
> +        * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Che=
ck FW
>          * path failure, retry using legacy SW path.
>          */
>         DC_HDCP_LC_ENABLE_SW_FALLBACK =3D 0x100000,
> --
> 2.49.0
>
