Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B22C7FFD75
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 22:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC6510E046;
	Thu, 30 Nov 2023 21:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4305810E046
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 21:25:04 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-54c109ed07aso1677310a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 13:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kali.org; s=google; t=1701379502; x=1701984302; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8c4Eu/Dubr5HSF4fDhNSD3Be+bs9dIetpJRDNp7v/M=;
 b=lnwHswlSlbRDKGTsretmxuKQ5eWjHoxKdZ+wJNh6eLbPPFII6XiAd7XQIohlbBdnmj
 NQBJ2fLJM7uzZlw1Zz8kTgKRXZJOZUaI50ZsBscGpAAMjc1kcXDG1PnOhIuT2wuYgATx
 j8Dixi8YJQI2Nm7+6wDLfjCtYCWivozkD8CTTYoPZx6Uw6DI3No3Mcp55KWj6bP/HkOC
 CsQ+0RSb3BrpREC3ujOGanXGQ+qUqeaqvmPDvuparHKr27W1VDkuLJ4y9K3yx7d263uh
 tUFiFM62h2y53OGxJmimj1MIEOoehYrWImFjoKIWAICt99rXVpWAUAuBqJjtEZk0Lakd
 n4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701379502; x=1701984302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8c4Eu/Dubr5HSF4fDhNSD3Be+bs9dIetpJRDNp7v/M=;
 b=luRGdIJ/M/ghBk5ljDszERz5Jnmh//fx1az92mbijiRQmaVOmrkKcxr08EcVBGvzbr
 DetTIsTduyGNAYmDgShP/DtUJpupCj5D94OxGb/dBjkVpCuQfvX7NGrDB0bqBSPSShhR
 0U5Oo9UD2b89htDF6Q5Kt072cZIifvzXjkEVMLfSuTAjxTjJv4NOD6ExhFDeIquJfWax
 V0IiK/f5W1srfgGlzV39q0J3970yEYidVt50DrjFfNVcB+WI0Eee80TY9f0sDDPwtsW+
 k0UhFLSzJx4HSEP3ihvYXwYsxtetj+JX7iilEnOtiv4uFFd93xX9ktPY5NnmUtnztiaL
 kWnw==
X-Gm-Message-State: AOJu0Yzq8QcMnY2kCfHTogAUbavqfyEzT5hJhQrjqs1W5gmF5zmVR7qo
 M6qmnKCQH+2lo7ILocz8qlqustcQTLLLA5YjjaHdJg==
X-Google-Smtp-Source: AGHT+IG0ta2XtylneHDppsL8gcmXtn/Q/+7/EPbWdZikXUYS2NOvcQ4OqXc4VNcjnztwP5GcK+tdQYNKGciNXohB/fY=
X-Received: by 2002:a50:aa9b:0:b0:545:3b25:d142 with SMTP id
 q27-20020a50aa9b000000b005453b25d142mr198098edc.15.1701379502435; Thu, 30 Nov
 2023 13:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20231130192119.32538-1-robdclark@gmail.com>
In-Reply-To: <20231130192119.32538-1-robdclark@gmail.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Thu, 30 Nov 2023 15:24:51 -0600
Message-ID: <CAKXuJqgrKLw7rFdJcgueR4=tUdpP52i0P8pJoins6-9z6=sxfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Correct UBWC settings for sc8280xp
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Danylo Piliaiev <dpiliaiev@igalia.com>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 1:21=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The UBWC settings need to match between the display and GPU.  When we
> updated the GPU settings, we forgot to make the corresponding update on
> the display side.
>
> Reported-by: Steev Klimaszewski <steev@kali.org>
> Fixes: 07e6de738aa6 ("drm/msm/a690: Fix reg values for a690")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mds=
s.c
> index 6865db1e3ce8..29bb38f0bb2c 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -545,7 +545,7 @@ static const struct msm_mdss_data sc8280xp_data =3D {
>         .ubwc_dec_version =3D UBWC_4_0,
>         .ubwc_swizzle =3D 6,
>         .ubwc_static =3D 1,
> -       .highest_bank_bit =3D 2,
> +       .highest_bank_bit =3D 3,
>         .macrotile_mode =3D 1,
>  };
>
> --
> 2.42.0
>
Tested on Lenovo Thinkpad X13s
Tested-by: Steev Klimaszewski <steev@kali.org>
