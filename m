Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF687D4C7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 21:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EBD1124C2;
	Fri, 15 Mar 2024 20:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KdCZTbt/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1035F1124C2;
 Fri, 15 Mar 2024 20:02:07 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5654f700705so3753786a12.1; 
 Fri, 15 Mar 2024 13:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710532926; x=1711137726; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/YYAb4etLz4rCTfoR4YKT4WIcWb2hUEXXqGho2kxvLA=;
 b=KdCZTbt/bjll/8I35xgR0KtLbYAO9J5PwLLt0FCrlzXUfwnNjfM5JtSzO07lmn5sez
 CCCSwO10mh2/bdpI94ejhmUW/AwjYPkHl8q2rhTz9wCksO5VdCxocmBBgzfrp80hvQbs
 1USWghtJClPu8t3XAgfKfEVByTXiINO9OaAxLlVw/PR8/9GKOIrwunaWZIuxVCfuY7Cr
 NWWoGe4ZOXYZtxRrKWqCidMtevejyOlOaLggp+nfV2Lh3MN6chPYFgA6xjLGLMZhlAsb
 N67ihxzIlpdwfUz8PJrsd4yWApgbeCFDK6WeNBLtPgfFaXX7bX7mYEAK6iGWfN7N/iEX
 vbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710532926; x=1711137726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/YYAb4etLz4rCTfoR4YKT4WIcWb2hUEXXqGho2kxvLA=;
 b=b/dPCkpOtysGekodckdyJeYmykc7DGIAg1YqeQ7XL/akFT+tbS4HO/rgTqlceWc/yP
 2418cNhGzGwPUtlWifrCN/zO03yg5TeI/5clnq7rt9xy5KpfTRlMdPWtwpOMCu3rrXJ2
 6UU6w1725IdAvHCsPYkotNf12u43Vsgf9wo7t4jwZN9jzAfKZTLOC+fORNK8yEuXXfpW
 Fg8nQdyS6wLHCWzmD5PFrO1TodLUh8vO/GQ7alvZlzlBwms5ZQaPH4QuTsUHnW3davb7
 jOyffoWc40uv9oZbnD/KQb9YD0Y6ZUMi6SWcwnOGqnbjwWoPwrjku9KuGcSUoCOeytpD
 Y6kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsGWUYFH7P6h6sO2jyfWdDRNhk97w+6SdSXpkSqMYK6Abn7vVBRlTVEXGUr3ymf/xpE2GMaeEF9I+P6g8q0Hmj42hnKhZnQO+lixcjkPBwgTYkFIuPTLu690/3g3A96WLXz6TEplo5Pc4OBQDCABiK
X-Gm-Message-State: AOJu0YxSfB/aJC8hboxYawS2N3dfyqrkfildxKrllpFoPdqfRbTia0IV
 bSR7W/hvnCivn6Wz7wQLIWFqWxPs8Pwwh+/UX/mnZNylY3feidI6dqByUilLbq3CzgC2FxrRidR
 GRUEA73xKGJYPHmwcAZvCviFeFEs=
X-Google-Smtp-Source: AGHT+IGNiEX+KvIuK+2zgES9ZbZBeWUk3t1ZiDKNwUyIzDDeNdWSwtV/1hXvoCPUp+xFTA06sIdvaC4OjWNqTwIhSb0=
X-Received: by 2002:a05:6402:1f07:b0:568:b490:7d80 with SMTP id
 b7-20020a0564021f0700b00568b4907d80mr1600464edb.18.1710532925895; Fri, 15 Mar
 2024 13:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 15 Mar 2024 13:01:53 -0700
Message-ID: <CAF6AEGuc-xu_Ji5fOXCFFudos1Ah4tgFxjRs0neHVujtNdXB+A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 00/12] drm/msm: generate register header files
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Fri, Mar 15, 2024 at 4:46=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Currently display-related register headers are generated from XML files
> shipped withing Mesa source tree. This is not fully optimal: it requires
> multi-stage process of the changes first being landed to Mesa and only
> then synced to the kernel tree.

I think we'd more or less need to continue following this process for
the gpu .xml so that the kernel and mesa are not diverging.  I guess
we could drop the display related .xml from mesa.  (But it would be
nice to have a decoder tool for display devcoredumps, like we do for
gpu..)

BR,
-R

> Move original XML files to the kernel tree and generate header files
> when required.
>
> NOTE: the gen_header.py script is based on the non-merged Mesa MR [1].
> Once that MR lands, I will update the script and commit messages and
> send the next iteration.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28193
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Split XML and git rm patches in hope to pass ML limitations
> - Link to v2: https://lore.kernel.org/r/20240315-fd-xml-shipped-v2-0-7cd6=
8ecc4320@linaro.org
>
> Changes in v2:
> - Removed the _shipped files, always generating the headers (Masahiro
>   Yamada)
> - Replaced headergen2 with gen_headers.py
> - Simplify Makefile rules, making all Adreno objects depend on Adreno
>   headers and all displau objects depend on all display headers
> - Also handle Adreno registers
> - Link to v1: https://lore.kernel.org/r/20240226-fd-xml-shipped-v1-0-86bb=
6c3346d2@linaro.org
>
> ---
> Dmitry Baryshkov (12):
>       drm/msm/mdp5: add writeback block bases
>       drm/msm/hdmi: drop qfprom.xml.h
>       drm/msm/dsi: drop mmss_cc.xml.h
>       drm/msm: move msm_gpummu.c to adreno/a2xx_gpummu.c
>       drm/msm: import XML display registers database
>       drm/msm: import A2xx-A4xx XML display registers database
>       drm/msm: import A5xx-A7xx XML display registers database
>       drm/msm: import gen_header.py script from Mesa
>       drm/msm: generate headers on the fly
>       drm/msm: drop display-related headers
>       drm/msm: drop A5xx, A6xx headers
>       drm/msm: drop A2xx-A4xx headers
>
>  drivers/gpu/drm/msm/.gitignore                     |     6 +
>  drivers/gpu/drm/msm/Makefile                       |    97 +-
>  drivers/gpu/drm/msm/adreno/a2xx.xml.h              |  3251 -----
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |     4 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |     4 +
>  .../drm/msm/{msm_gpummu.c =3D> adreno/a2xx_gpummu.c} |    45 +-
>  drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  3268 -----
>  drivers/gpu/drm/msm/adreno/a4xx.xml.h              |  4379 -------
>  drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  5572 ---------
>  drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 11858 -------------=
------
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   422 -
>  drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   539 -
>  drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  2803 -----
>  drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |  1181 --
>  drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |  1979 ----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |    11 +
>  drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   111 -
>  drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   790 --
>  drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |   227 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |   309 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |   237 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |   384 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |   286 -
>  drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |   483 -
>  drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   131 -
>  drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |    70 -
>  drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |  1399 ---
>  drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |    61 -
>  drivers/gpu/drm/msm/msm_drv.c                      |     3 +-
>  drivers/gpu/drm/msm/msm_gpu.c                      |     2 +-
>  drivers/gpu/drm/msm/msm_mmu.h                      |     5 -
>  drivers/gpu/drm/msm/registers/adreno/a2xx.xml      |  1865 +++
>  drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |  1751 +++
>  drivers/gpu/drm/msm/registers/adreno/a4xx.xml      |  2409 ++++
>  drivers/gpu/drm/msm/registers/adreno/a5xx.xml      |  3039 +++++
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |  4969 ++++++++
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   228 +
>  .../gpu/drm/msm/registers/adreno/adreno_common.xml |   399 +
>  .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  2267 ++++
>  drivers/gpu/drm/msm/registers/display/dsi.xml      |   390 +
>  .../gpu/drm/msm/registers/display/dsi_phy_10nm.xml |   102 +
>  .../gpu/drm/msm/registers/display/dsi_phy_14nm.xml |   135 +
>  .../gpu/drm/msm/registers/display/dsi_phy_20nm.xml |   100 +
>  .../gpu/drm/msm/registers/display/dsi_phy_28nm.xml |   180 +
>  .../msm/registers/display/dsi_phy_28nm_8960.xml    |   134 +
>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   230 +
>  drivers/gpu/drm/msm/registers/display/edp.xml      |   239 +
>  drivers/gpu/drm/msm/registers/display/hdmi.xml     |  1015 ++
>  drivers/gpu/drm/msm/registers/display/mdp4.xml     |   504 +
>  drivers/gpu/drm/msm/registers/display/mdp5.xml     |   806 ++
>  .../gpu/drm/msm/registers/display/mdp_common.xml   |    89 +
>  drivers/gpu/drm/msm/registers/display/msm.xml      |    32 +
>  drivers/gpu/drm/msm/registers/display/sfpb.xml     |    17 +
>  .../gpu/drm/msm/registers/freedreno_copyright.xml  |    40 +
>  drivers/gpu/drm/msm/registers/gen_header.py        |   958 ++
>  drivers/gpu/drm/msm/registers/rules-ng.xsd         |   457 +
>  56 files changed, 22480 insertions(+), 39792 deletions(-)
> ---
> base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
> change-id: 20240225-fd-xml-shipped-ba9a321cdedf
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
