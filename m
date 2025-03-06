Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B692A5463B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 10:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE83D10E036;
	Thu,  6 Mar 2025 09:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LmeW/38J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D320510E036
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 09:25:53 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3f66bf7602eso136388b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 01:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741253152; x=1741857952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eAXYiA/MHOAdQMXh+C0jw5Ofxnxlrhaorm6TX8gdw8c=;
 b=LmeW/38JZ3QXiHpqcWxPn3dZcngV/SBWhsxIwSWEVzZ17O/pjbADXRZxVvIF70oGxq
 DImqVyvc3p3y7CvhfZI6C+abKGE18LKAdFdh/+6g3D+llmNmVByTdkCaBa0BA6W3ua2L
 wMZsGg3Evgz/a7E+x8Sx2MhTshmkNxcl3UErBM0xwtAvsTdMSSnvNsA3W4vYWLuktDAp
 9F6f8Cfcjr/Svz8B1lTPYe1ARSa2Tv40TIn8zRmZLZYXYTJmFO2cm/QK3RH1z/c4hOPg
 e7f1YGHUBoQXgBb/ak74cgqqlb7XLxepLRz0eJqlQWK4m6PPdgHn41JeW02Yvm1Gxc1K
 MI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741253152; x=1741857952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eAXYiA/MHOAdQMXh+C0jw5Ofxnxlrhaorm6TX8gdw8c=;
 b=FCPi3duvHcO7zNIGfS+OQedBqH4MVq8fxtsOvomxcn+2oIGNbB6QB+Ve52TKVKMKTh
 QjfW7vElxwLI1XOafmOWmrD8B2srSPd/Xt/VAOzThnOk9GJMvEdkK7JE246xxtWGnhD2
 1px16hME/ipLhkGpdjxkPyYzImILCKO5LkCaQ8sheicFVWMEJkvRR6lWP3JAflAWAOSO
 0/rMwX1/YekH0SKLOniv1tDNKeWJss4Ui3tR929pb2xtxY5gip7es2o+Tickc5W1vIT3
 lO5OZ+vZu3y4u4JPi5oFAFgw671NMPg8zwOJd+KOUPFojv690GXxze9R0CKmW7uQ/ZU0
 DufQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ6h2AsYj09VIQl5LiRjO6huW0nLYw+WPmGHLurSrsWGUk6Qq4XXp9Ro4YMzpnr5YtnR7Hl4Z7A/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyngnHi0VhdJ06effMs0tPmD/1tzeG8lp+2kZ6XPAU4DPw+n5p3
 klvotuF5hslPmdqQdFpjuVoQ793+z3LgHbVza8d8msTjh8eEVyPn5K94vrllr9hKfIDOR2X4AUU
 jLHPP2VOrk3gbH6x6d7Y+eGH+hDY=
X-Gm-Gg: ASbGncv5ZQzMBjutl2oqTutraiwow4HoAG1IYJ+CcDgrsuZfkoreyiXBjVe49s/0mcu
 8nllWp470TF1OTdSu3E8h0Eqvq78/17q7UoOn10dfwnw9RXqpIK1OXMVxRh9/rKq9zCbCW57CGd
 sYv/0LkFl7nQKYDdaWaYgdqCHA
X-Google-Smtp-Source: AGHT+IE+MrhlxDA97sRbtzv0SinGLTbWQPhTRvM4OzDVVIZo23dvkiNaf+0XUCosZsqKFyerKq91Qoa7XWsl1LHUYfk=
X-Received: by 2002:a05:6808:f12:b0:3f3:ff78:e5e4 with SMTP id
 5614622812f47-3f6831f210dmr3120103b6e.38.1741253152337; Thu, 06 Mar 2025
 01:25:52 -0800 (PST)
MIME-Version: 1.0
References: <20250201011434.453879-1-linux@treblig.org>
In-Reply-To: <20250201011434.453879-1-linux@treblig.org>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 6 Mar 2025 10:25:41 +0100
X-Gm-Features: AQ5f1Jrlft8qiL2kDUOEuJjZM9OIv8RXYZ3aWpqOMf8V_TmACTpv9Oxf_0_ImSQ
Message-ID: <CAMeQTsa8enkergRai6ixmE-ivTQgWazoTJ9stMWSgzobexphJw@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Remove unused mrst_helper_funcs
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

On Sat, Feb 1, 2025 at 2:14=E2=80=AFAM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> The mrst_helper_funcs const was added in 2013 by
> commit ac6113ebb70d ("drm/gma500/mrst: Add SDVO clock calculation")
> and commented as 'Not used yet'.
>
> It's not been used since, so remove it.

You talk about mrst_helper_funcs but the patch removes
mrst_clock_funcs. I assume this is not intentional.

-Patrik

>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
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
