Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87920760179
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2C110E371;
	Mon, 24 Jul 2023 21:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E910A10E371;
 Mon, 24 Jul 2023 21:46:15 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5658573b1faso2788393eaf.1; 
 Mon, 24 Jul 2023 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690235175; x=1690839975;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9NnStTipjate4A8hMy4OAO5j3l8ghoR4SvTd3Ty1jyA=;
 b=dETYlOp9BARBq6hRFY+R8WX/Iwt59GSuDbKPOaJYNmKrIEJ/aptALOufrEn6ziZI+M
 aPwnnUkPJU58oBT2NAXQls7+2gxAQ8AL/Iu5qlc0bGVhVWw2LSpC/Yc//qwTa2mcR/0C
 06nYQffkUtioyMpim1sSeJoJleQS1qMjej6MibXErkHJTGXfv10sk2cjIS5OWcselqBe
 mNm4f3ag2LGexG5kcUbx5ap7s9DcwOv7zPY3ntzH6yxfPybyocYQHdNnAuWRSemrNVo9
 p+9N2T+AK5UqnfBsbBbQPXaiG7iIp868qVgAWUluBv6DPCBC3QHKzVo8OMik4elEM7Fr
 vzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690235175; x=1690839975;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9NnStTipjate4A8hMy4OAO5j3l8ghoR4SvTd3Ty1jyA=;
 b=Nv2YMbl5uhxxY5IdnOFi/ENJwUJXbZj5DvVdrpkxblm/Wf5l3NxOWDC0AY5vy/mg7f
 noj7e1m2m0ecjOtNL+lVKbvNeO50uKlBKc4zhhCRy/HmNqiiAHEMEIp8QAhdq13xLsNC
 hNPply3uccT0oFtDV+67C0U8j0LKe8M84uUd7f53eGNRtPlTwjNj4wMraWbFX6kG9uJO
 z1TfNIBr0vyY2YOPPF5tyKpotZspkLj3uYfSXhjg5QehPoDbNDZnipU1rXAgjvN2ZfOB
 9RcCnmD/QxYbDk5utOho67KdFLwIV4Y0ZD0+IC3sBEyZlRMTWKFcRGEMdavj0c83vbut
 udgg==
X-Gm-Message-State: ABy/qLYVWsZqPTdc7pzXGZyQei6V8BQ8GZzMZ4R0kh5QEFRfTerbb0ql
 NGuSwJdVoKvtJdHUUXql7zt/Z2/4kLdYPuqg/9w=
X-Google-Smtp-Source: APBJJlFMsa/ns3DFCqUpFXCd4aDEpig5u/kEDwcEKFQTS7TJz776r8oPtP60y4QiG9ksz9ois6VQjAzAeialh7bVvPE=
X-Received: by 2002:a4a:2449:0:b0:566:f62b:7b91 with SMTP id
 v9-20020a4a2449000000b00566f62b7b91mr8751740oov.8.1690235175070; Mon, 24 Jul
 2023 14:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230724070049.8540-1-xujianghui@cdjrlc.com>
 <7ad78e88ddb94a0811947b48b04dfb2c@208suo.com>
In-Reply-To: <7ad78e88ddb94a0811947b48b04dfb2c@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:46:04 -0400
Message-ID: <CADnq5_MMhpBVbHzaUNNoyxhk-m_2HjF-2kaK3z5mjmrHiORuLg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: add missing spaces before '('
To: sunran001@208suo.com
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 24, 2023 at 3:02=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> ERROR: space required before the open parenthesis '('
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
> b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
> index 8a8ba25c9ad7..a7569354229d 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
> @@ -262,15 +262,15 @@ static int renoir_get_profiling_clk_mask(struct
> smu_context *smu,
>                         /* mclk levels are in reverse order */
>                         *mclk_mask =3D NUM_MEMCLK_DPM_LEVELS - 1;
>         } else if (level =3D=3D AMD_DPM_FORCED_LEVEL_PROFILE_PEAK) {
> -               if(sclk_mask)
> +               if (sclk_mask)
>                         /* The sclk as gfxclk and has three level about m=
ax/min/current */
>                         *sclk_mask =3D 3 - 1;
>
> -               if(mclk_mask)
> +               if (mclk_mask)
>                         /* mclk levels are in reverse order */
>                         *mclk_mask =3D 0;
>
> -               if(soc_mask)
> +               if (soc_mask)
>                         *soc_mask =3D NUM_SOCCLK_DPM_LEVELS - 1;
>         }
