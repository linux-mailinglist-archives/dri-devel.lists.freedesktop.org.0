Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B97A568EE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 14:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2AD10E18C;
	Fri,  7 Mar 2025 13:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CSVkVFbQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9011410E18C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 13:28:33 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-2a9ef75a20dso2252692fac.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 05:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741354113; x=1741958913; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=om7dUSQeU3nA4vWwFqpjqIAryUg9gFGfPyFmJdqn+yw=;
 b=CSVkVFbQpfIGkpckhYe/XFjygTH84D71ve9fPaUvZ1DkL+Npm/6IOt+5/9oXPtXcGs
 PeM7D+mDrBU+AaT+Zx6JmXS9sJjC+VDN5el/r97s8UEOuNa19cg1brzCOL69p++7PE8e
 E5AyeBURmQ1HXK3FZiGDZaXyRwZtxYS/Leo1o+SoQgUIAzKWa7jKCChp6pnRzYVVbSUx
 BrL5j845J1jLcVZA+uLpOIuV2NgSpUtQ9uBZdM2cWtEEuuw2xfaMYthAGFfOMSycMKZO
 3qJkc6P3BKUvSNebrGVQBYcX8lCzh4fH8YRhwT5v37ssRSooaLf/+TJ69zVWu4hreZsx
 AHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741354113; x=1741958913;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=om7dUSQeU3nA4vWwFqpjqIAryUg9gFGfPyFmJdqn+yw=;
 b=uPUZR6/Bu5tpHENGpcScJRKa+LbQrHngtuwm2iCMYxuLHopia0HfYejTaxKfT639y4
 odD/scbTTeE4hfjAW9isXrh3Ov2vK9l/rLiR8uvgVahBW5lb/ew8KcEiSz+eM5b0Lwfc
 7APPGOUUgeL43B5XEYlLLcq/K9CRY5EWAqgPURC2Fg4bs8Ubx35TKgTM675Szcj7qLtz
 tLhhCpUm1H9VZhUGdM/yX16zSH8qbFGgKes9JhzE/aFqm2rY+h1ERxFO2QNS4vK81vzh
 At77fMCj4xD49Ong2FcIChYQAjB6LJAoigXdjUqBmGa//2fIu3rrYJcuwXWqT7jNO4MB
 ok1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbb/8sGUqXSNeo5t3hf3sSMifXw1QC6sioj045CtgCN2M6X6klVHeVsmuA21vt/HuXYp9qzhbtjLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbkXMGdwGZoGN4kmIS7Ns9Q1MmiLABA+NHh8B4CrF4p0y/c1kY
 ZzlRAWLtQTNksknS+g70fEUdHg87RRi8VPyXVMbkbXHidpabPQjsIdWAZ0QFfZcw5mTxELzUw3E
 SZmuQF93NCjSx+wmelXFo2pER9Jc=
X-Gm-Gg: ASbGncvy2vZxwUP9OsPg0djAUw9ST+3BhVFrymeeAE8XoD4VbxUfdw5g1tq9bJl3YPB
 FJA1bGp+vzQx4glJKQEFZa9C69R2IEge0sxAMLN5oRWkWwm350sLcvNtCG8tqnsPa2hllkf65GT
 oekbVfx/TBkVoWrmsHiPOdlJAV
X-Google-Smtp-Source: AGHT+IE33fovpF9R81jBgh9BHSNr65ixbRJzK0lDwC/iy1PppPEO9z5fS2XneckRazv9rar0Y1yj92tlmt4FtYA8AWM=
X-Received: by 2002:a05:6870:9a12:b0:29e:8485:197b with SMTP id
 586e51a60fabf-2c260f71217mr1989035fac.2.1741354112790; Fri, 07 Mar 2025
 05:28:32 -0800 (PST)
MIME-Version: 1.0
References: <20250306155155.212599-1-linux@treblig.org>
In-Reply-To: <20250306155155.212599-1-linux@treblig.org>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 7 Mar 2025 14:28:21 +0100
X-Gm-Features: AQ5f1JqOu2fBJjbXECylHFbNtSZ3YUtFsUmYnsIhzE-HJAPGJVe7c0dc4Ub3W5g
Message-ID: <CAMeQTsaNfQJ=OgWXwQ2bAxa1xbbQxAWDYEcokQ3VJE_EApPbzQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gma500: Remove unused mrst_clock_funcs
To: linux@treblig.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Thu, Mar 6, 2025 at 4:52=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> The mrst_clock_funcs const was added in 2013 by
> commit ac6113ebb70d ("drm/gma500/mrst: Add SDVO clock calculation")
> and commented as 'Not used yet'.
>
> It's not been used since, so remove it.
> The helper functions it points to are still used elsewhere.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied to drm-misc-next
Thanks


> ---
> v2
>   commit message fixed to use correct struct name, and add
>   note about the functions used still being used.
>
>  drivers/gpu/drm/gma500/oaktrail_crtc.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma=
500/oaktrail_crtc.c
> index de8ccfe9890f..ea9b41af0867 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> @@ -658,10 +658,3 @@ const struct drm_crtc_helper_funcs oaktrail_helper_f=
uncs =3D {
>         .prepare =3D gma_crtc_prepare,
>         .commit =3D gma_crtc_commit,
>  };
> -
> -/* Not used yet */
> -const struct gma_clock_funcs mrst_clock_funcs =3D {
> -       .clock =3D mrst_lvds_clock,
> -       .limit =3D mrst_limit,
> -       .pll_is_valid =3D gma_pll_is_valid,
> -};
> --
> 2.48.1
>
