Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D6E8B0A10
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 14:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B7A113B23;
	Wed, 24 Apr 2024 12:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gCwWGPOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F669113B26
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 12:51:49 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-de54b28c41eso2243927276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713963109; x=1714567909; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vHUte1eLVQkq8WvW65i5PTx6wzp6ysbfkPKQwSAJqfU=;
 b=gCwWGPOuNUyWeMBfpqtbP86JsaN8vefOo7gbPdm3GWW/FfOm3h5ac49e4hvX04HOdI
 j3FxqgMj2yV1N7nO2rFAxd4PU50F90CSS4rQTtmmy343x3jGT6dZ9qLpnd64c/rqnX7x
 CpL/7D9NNgXNI2rP0jvJHLij96Sor8m0upXsliMAWTPq/tC/ri4/cRDOvOc/yHQk9gEm
 elK3R7O9QD0dVZdtVg9T1SqIxNf/HwL03bMvfQf3NOdf4QApjISNV4Z1mbaa4T7MTYti
 aVKhQqy+Xcz2+H4ZeBlnlGAzOsRcycY531CyFAyCvAoNZgwF7MZCiqEb9eMqS8F0M2ig
 SSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713963109; x=1714567909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vHUte1eLVQkq8WvW65i5PTx6wzp6ysbfkPKQwSAJqfU=;
 b=CSAkNPHwxtB7ru11sPwqBwkGf4uvtf6G//iWg01p+c8U07Nvv8pjxlIDRba3Xn3nv+
 Xx7I/yPLhAQ5jdx/olqZa8OLG3PQcpsZMkGtZYXVkqoDxiCnx/FQaRTG14bcuuadif/C
 le9FDeHZxlFq7Rg+G+w/Zmd8zhsNneHqIjn+yUeZ85+uCSmPDsIttbPwyVCPdGXRi8Ql
 m/WcPs4RaCfnCoMz/60kfEyF2/tHteqSGuX7IqSpqefmBI0vcWIaTY0Hxw4RFzisXx9C
 SUvXzHBSn+NCGBZ2S2ArxwyTGxOyJ2cB7FXJYz/UplFAey0pBfrAVdf9+LEO2XpzqKs1
 zrIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXce7TVLQcG1c8i0E2yCbo/r4QmuuaUmr/7Fr7wecT2jcoY8BiOJV9wZYxFRiTEafx63wLhZEBoUZ5bIM0piTxpYnfmbiyXsbgvXxzLrPv2
X-Gm-Message-State: AOJu0Yy+KmIe0+soxoI6PV0gCUBfByxC+gwGHqWWwU7hYE6KdvICRWX/
 7Jp+eFlY9+Dpbj0o6I+fdEx9oSc5AT1I52EpM0i2kQfvIPqvihpeHH//V/nPUah096cQUC7lbuM
 wYw6sL3yyL2/KoXuEHQ1hTBOM/B/obuTWXTxRZA==
X-Google-Smtp-Source: AGHT+IEtNwcLByaURm4S0W2WX61nHBOa/bBuBHOAAc6U0o1qOXu8yZcg3XBDxOP5Yl1UNJOhL+Nqv3uIUQoTgcemjRI=
X-Received: by 2002:a5b:a87:0:b0:dcc:f0a:e495 with SMTP id
 h7-20020a5b0a87000000b00dcc0f0ae495mr2062785ybq.3.1713963108899; 
 Wed, 24 Apr 2024 05:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
 <20240401-fd-xml-shipped-v5-9-4bdb277a85a1@linaro.org>
 <CACu1E7FjcBHHZerZjRBd7=WiLDu40-d6-4jKPcKmbY244w4Zww@mail.gmail.com>
In-Reply-To: <CACu1E7FjcBHHZerZjRBd7=WiLDu40-d6-4jKPcKmbY244w4Zww@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 15:51:37 +0300
Message-ID: <CAA8EJpo=BP5wrFoXHZhAgc8MKf=pV5B8Psp=NrSCr=5mVh1bAA@mail.gmail.com>
Subject: Re: [PATCH v5 09/18] drm/msm: import A6xx XML display registers
 database
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
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

On Wed, 24 Apr 2024 at 15:21, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On Mon, Apr 1, 2024 at 3:52=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Import Adreno registers database for A6xx from the Mesa, commit
> > 639488f924d9 ("freedreno/registers: limit the rules schema").
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml     | 4970 +++++++++++++=
++++++++
> >  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  228 +
> >  2 files changed, 5198 insertions(+)
> >
>
> FYI, this will conflict with a series I will send out soon based on
> the register updates in [1]. Is there any chance to update this before
> it lands in msm-next?

I'd suggest updating the XML file as a part of your series. I've
already opened a MR for the display changes to be picked up by Rob.

> Best regards,
>
> Connor
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28883.



--=20
With best wishes
Dmitry
