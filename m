Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3F7184CA
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 16:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C2810E4E9;
	Wed, 31 May 2023 14:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEEF10E4E9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 14:23:04 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-33b3674acdeso2741525ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 07:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685542982; x=1688134982;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BEeMcGwsmQcWXT4vssRRefgYUtAVUNcH/IZjc9KyPZo=;
 b=nl6ZncCyLlb0//swZpa/cW1OOoof1YurlLrT0As3THnOC5paCGiiezrAe6ZP3mFMyL
 lfeBOvC/VUPhAOWMUQv7M1tmzulReiXgR0kmhKXkRmc8r6Nh8x3t9H6V1okoxEoO1vyX
 hci3H0ASHYLYkRFxcFeaPkTkVVan8Zfp4oNCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685542982; x=1688134982;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BEeMcGwsmQcWXT4vssRRefgYUtAVUNcH/IZjc9KyPZo=;
 b=jSOF/7LquhTeIS6LIMtFPo6Lvfs7gEe/tBXNRWEOi71OpBFQco8Tmu4O/AMOZtfEhF
 aXR3bEPLspDWWhovG5TlpHDm02IFenJ7FStUnHjEQVaEBCDw4Ofk5u8UfDbz28qo3vrz
 HJa0lCjP6L3kItySHydkkhGgOuwVP65sF/J1+WaYJc/Tq2zO1CPMOQ+EhZbrEGNmT0Yw
 8ZdS13HTaC+j5DoeFzi4PtXUN52IpqLLAnIvP6z5NmayA59gTtnN0Kfw/jQXsnOW3Hyy
 YNcfG4ORvg86+PHkpx3/q13CphBdYphs4ZG+LIBU9GTrf6KxTnvGltz7SmvDbsswuVQ9
 6FzQ==
X-Gm-Message-State: AC+VfDy0b5KK+EuswnykEjZYTCJHM56dgHm78HloAdEh2t7yTh00Wvnr
 YrGvn4LQMkUd4uAf2vJJDulu7WVDGOKtsQIJ9nw=
X-Google-Smtp-Source: ACHHUZ7fm2htfsakPT0P57gV1I4d72M4J3yeGfXA/aauSi9XzvEXm1q9s8CwX8xnPUqz+xiMjUMeMQ==
X-Received: by 2002:a92:4b08:0:b0:335:8542:440c with SMTP id
 m8-20020a924b08000000b003358542440cmr2046869ilg.12.1685542982171; 
 Wed, 31 May 2023 07:23:02 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com.
 [209.85.166.176]) by smtp.gmail.com with ESMTPSA id
 k15-20020a92c9cf000000b0033ce0ef231bsm20081ilq.23.2023.05.31.07.23.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 07:23:01 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-33baee0235cso141815ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 07:23:00 -0700 (PDT)
X-Received: by 2002:a05:6e02:2196:b0:331:4d3c:db55 with SMTP id
 j22-20020a056e02219600b003314d3cdb55mr209123ila.4.1685542980288; Wed, 31 May
 2023 07:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230531075854.703-1-johan+linaro@kernel.org>
In-Reply-To: <20230531075854.703-1-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 May 2023 07:22:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UtyMSekPYfamMkswC=mSRnBpQUygMxZ+Wgf6Y2dB2Qhw@mail.gmail.com>
Message-ID: <CAD=FV=UtyMSekPYfamMkswC=mSRnBpQUygMxZ+Wgf6Y2dB2Qhw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix uninitialised lock in init error path
To: Johan Hovold <johan+linaro@kernel.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 31, 2023 at 1:00=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> A recent commit started taking the GMU lock in the GPU destroy path,
> which on GPU initialisation failure is called before the GMU and its
> lock have been initialised.
>
> Make sure that the GMU has been initialised before taking the lock in
> a6xx_destroy() and drop the now redundant check from a6xx_gmu_remove().
>
> Fixes: 4cd15a3e8b36 ("drm/msm/a6xx: Make GPU destroy a bit safer")
> Cc: stable@vger.kernel.org      # 6.3
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 3 ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 ++++++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

I think Dmitry already posted a patch 1.5 months ago to fix this.

https://lore.kernel.org/r/20230410165908.3094626-1-dmitry.baryshkov@linaro.=
org

Can you confirm that works for you?

-Doug
