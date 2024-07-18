Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BEB934E94
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 15:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978BF10E88D;
	Thu, 18 Jul 2024 13:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R27HLHgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9216F10E88C;
 Thu, 18 Jul 2024 13:54:42 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-70b2421471aso545895a12.0; 
 Thu, 18 Jul 2024 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721310882; x=1721915682; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5zV2MPH5gSmcOC/Ol+e5BTBsjovoDd4as4GAddrNN+Q=;
 b=R27HLHggK0v+kSTcM4BcuzBjvNXBFW8a1RVJ1yzIvI6XbafFmHN6DOdLUCpGrTkxpf
 f+4P80BJVnMUTxxTXMBZPYy+05fMg8tnjaSj736tbBuyM1dUN8CTFarq9uzGjLQsHIVF
 KP4tMu8tsOe25iM4+jsup16a3HIazy2kiy8waRLamCFkf0Hd8wz4KzbxQJB6N8W3QU55
 LKAqalm/op3y0pS+uvP/a6N9wvDkQDqZ5HP0EcdDuiXJPuYHnLAkfG/jNVob7zmSjQg1
 rfcC21GgRi6Hjy1+H8yWWu2doowQacYXFnVcWxV6VgqiNKaX7oIUHSYk+hoG/VM2Mjix
 ZUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721310882; x=1721915682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5zV2MPH5gSmcOC/Ol+e5BTBsjovoDd4as4GAddrNN+Q=;
 b=G2A+absIAymVrd9pblKWKI0cFavi8kUI8ij/pGMj6vVAGS5CpZnHRwOxdCvslE/xe2
 9JgXX+iRx11/iGZsgDdtayqll+N+uOPhMpJ9ajcNQxL+m7UriQRnTOo69P4qBu7sVYdv
 2iFGLkDrwJJwQ7lX9Gv71CAA1X5DKd1BSsYNCnVmSZLcwERBGGWn2211fGe0bOIe05x1
 tKdzHl0b428I9vioEE0cJR/eVMWr2fobhziuivqZZcSA6D04OJ+qpW+LlG97BYRcgT+2
 ZZ40yU8BzUYlTIJ/Akj/rSnrl0kqTslWBycOhRvo8uJHKkEGmm2z/a5pBwOAZqiqMBkm
 Abyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuH2M5pQTKCArQMRnk3oSpC6vmJVU8sGfWEvRzlLWsGQQIMzIb1+lUVvMM+8Yf7vLthG8wQM0PGr06ojTWPIpKGohpYCdT0bTh610X0TSdgYlM+Na9vymO4tgbLJQwyUinHC00+rU4mwA5F5lfGQ==
X-Gm-Message-State: AOJu0YzFh0Uz4IJaeZlkXldcUMEzF9fys0ENUtytirGsSFGgHl19jci7
 ffY13/AUC7oRmQcl9Ik3e3143FOHxKmgH2vXTcU68nzCPNnsxZ1aakVj4hzdZVKY6EEpEU+CZBz
 FyH7cKP8gQJQ3HEffwLoat9byxj0=
X-Google-Smtp-Source: AGHT+IFI4cYLODpNXKiLgPsSh/NS7hTFY9BWhgG3KU0S/egbzJ01L6bxoqfo3h8scGyT3KhacGUdNeBT9XdG3UGpK6o=
X-Received: by 2002:a17:90a:fe81:b0:2c9:69cc:3a6f with SMTP id
 98e67ed59e1d1-2cb527f5861mr3697496a91.31.1721310881910; Thu, 18 Jul 2024
 06:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240718131329.756742-1-make24@iscas.ac.cn>
In-Reply-To: <20240718131329.756742-1-make24@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Jul 2024 09:54:30 -0400
Message-ID: <CADnq5_Mr97=TBi0pO95tVNqMZOja4_CU=JzdmPMjcG+xXad1MA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/radeon: fix null pointer dereference in
 radeon_add_common_modes
To: Ma Ke <make24@iscas.ac.cn>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, airlied@linux.ie, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

Alex

On Thu, Jul 18, 2024 at 9:13=E2=80=AFAM Ma Ke <make24@iscas.ac.cn> wrote:
>
> In radeon_add_common_modes(), the return value of drm_cvt_mode() is
> assigned to mode, which will lead to a possible NULL pointer dereference
> on failure of drm_cvt_mode(). Add a check to avoid npd.
>
> Cc: stable@vger.kernel.org
> Fixes: d50ba256b5f1 ("drm/kms: start adding command line interface using =
fb.")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - added a blank line;
> - added Cc line.
> ---
>  drivers/gpu/drm/radeon/radeon_connectors.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm=
/radeon/radeon_connectors.c
> index b84b58926106..37c56c16af8d 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -520,6 +520,9 @@ static void radeon_add_common_modes(struct drm_encode=
r *encoder, struct drm_conn
>                         continue;
>
>                 mode =3D drm_cvt_mode(dev, common_modes[i].w, common_mode=
s[i].h, 60, false, false, false);
> +               if (!mode)
> +                       continue;
> +
>                 drm_mode_probed_add(connector, mode);
>         }
>  }
> --
> 2.25.1
>
