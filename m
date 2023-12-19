Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C7B81909F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 20:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2919710E1C3;
	Tue, 19 Dec 2023 19:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6001D10E1C3;
 Tue, 19 Dec 2023 19:21:24 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6da5d410432so3063954a34.2; 
 Tue, 19 Dec 2023 11:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703013683; x=1703618483; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ETYb4p/dYwWhsBHF1nMWqW8fNK9SRI38gyUWxBP4t0=;
 b=bNrIQoFBQCHS2oF+Q//EPu23ORWR8q4Zr5I/sSZekE8PbYWsBYFt5q+Isijn08b5wA
 fa3HMtEUfp8lWYR+JWjp69bhY/FbgLbmLlPiwzA22QZhRTB6bn/PRfMC2L6tdhCuN/ha
 Hx+oqcqDHcbdaGRb6dz6Qrcv8lu7W+AkbBtFYeeb/yBbAkImcwi6/8vUkhGs2bw/q4U7
 P6272mF0yvP7vdGzVP1w1w6x97uNnWF3PQUD8FvFPYM0EXa2ODG4RgIZmAsI6vMW+Mvb
 TTJoZa7wAG5QsLOy842NzeUJrncfNv0ThrkGzRMqB5Ci7/8JS6laz7mIxAOd8w1knvvN
 4cQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703013683; x=1703618483;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ETYb4p/dYwWhsBHF1nMWqW8fNK9SRI38gyUWxBP4t0=;
 b=xUuOP3Zq641ejbMvQeFBRxry4OS9Mpd8HRPs1WPoJjIdVmT7d3slJ8o0QOHyutXrEG
 B//54FEZ6VdUtYLD33F8hO6M+OD/veqsh5tp5CBNcQwp5fPPB2IJqU4NIuXErMdukfc/
 L83FzFz+kaBNin/EpJVhsrhfdM1BMKBnIm6fxPllUiKMCm8y4FuV/LAgqQnJwZAO3de1
 5BmxrTKbQoyA2X6vuvsMXOWxYfZ+LbUbz+hNkzbGDfqtoUuyyANhl4Qaa8t+UtMXGNOF
 kKYF6moNnS1lITMl091XlSWPf2C1kl29PDoSzzEBUuGi21a4VWLestbKFC1itzEYtLGV
 cTzQ==
X-Gm-Message-State: AOJu0YyeFngG+eNjFxFIcK8cLLsj+98fu30BbU8Zfmv4WyI9RSBiIutg
 nJdklqFOwqs6UmKbXk+N3Otyn0PLfmmnXukJXFUREt+Z
X-Google-Smtp-Source: AGHT+IEZVSzHdhnBJF3ACTt4+Byj88TFSnsLe822jMawRK5DOWRBwmTecbWpBZ7A5KtB+207zqeJFbXxzgdOA1vZWXs=
X-Received: by 2002:a05:6870:15d5:b0:203:eb72:7594 with SMTP id
 k21-20020a05687015d500b00203eb727594mr2055316oad.19.1703013683353; Tue, 19
 Dec 2023 11:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20231219141930.367426-1-colin.i.king@gmail.com>
In-Reply-To: <20231219141930.367426-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 19 Dec 2023 14:21:11 -0500
Message-ID: <CADnq5_Or8UGd1tarX9_Jvd20Lp3TcPYiGxCNicuExOJCiNUEmg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove redundant initialization of
 variable remainder
To: Colin Ian King <colin.i.king@gmail.com>
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
Cc: kernel-janitors@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@gmail.com>, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Dec 19, 2023 at 12:40=E2=80=AFPM Colin Ian King <colin.i.king@gmail=
.com> wrote:
>
> Variable remainder is being initialized with a value that is never read,
> the assignment is redundant and can be removed. Also add a newline
> after the declaration to clean up the coding style.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/basics/conversion.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/conversion.c b/drivers=
/gpu/drm/amd/display/dc/basics/conversion.c
> index e295a839ab47..1090d235086a 100644
> --- a/drivers/gpu/drm/amd/display/dc/basics/conversion.c
> +++ b/drivers/gpu/drm/amd/display/dc/basics/conversion.c
> @@ -103,7 +103,8 @@ void convert_float_matrix(
>
>  static uint32_t find_gcd(uint32_t a, uint32_t b)
>  {
> -       uint32_t remainder =3D 0;
> +       uint32_t remainder;
> +
>         while (b !=3D 0) {
>                 remainder =3D a % b;
>                 a =3D b;
> --
> 2.39.2
>
