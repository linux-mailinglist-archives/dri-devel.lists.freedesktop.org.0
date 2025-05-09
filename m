Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169FFAB15D2
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 15:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FD610EA48;
	Fri,  9 May 2025 13:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lTzSDYaP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F06010EA48;
 Fri,  9 May 2025 13:52:38 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-86135ad7b4cso87554539f.1; 
 Fri, 09 May 2025 06:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746798755; x=1747403555; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PtSH5nI+hYw4K91qiMTbyWnP4++Yt+hkpqevJyQzufo=;
 b=lTzSDYaP0nqQwpGAv9TU8t2vdDlFlGZAsazcYnATLvvUKXLwakQ9O84pV11cQnZefs
 8qsnAsm3Yql0ODC7Z4uG02rIHptK9K1NnqYEPBv+PaKjG1vtNKeyaF+QpZilvJQcL+YU
 qFujffcrRS3FWQK3NrOLCGo1H8kYtLm28wi2RW9xvi030wqSijhf900AKLOht6xRN8lq
 aamdVKXneiDjAeUppsK+O/zC9adQecjEmt0ZdZ/OhcFee46kKbq+6GmkYRa5P2DakxJY
 2D4yZv0bZNBgP5ZYxFh6WgDiPoZVyNLBKkeNeuxnrY+8TEI50mTPD1AmVNS3I/Ugjou2
 qJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746798755; x=1747403555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PtSH5nI+hYw4K91qiMTbyWnP4++Yt+hkpqevJyQzufo=;
 b=EoDe3eSHcF8JficL9sJqU23m3Em2HBDiJ4ekH7KCvIroMbwJwB55XLRwz6ADyDYOY0
 f2MM/meuYo/NAW0rx1HBIxlMFddHes3HSMUbTcZRCZoX4QIpH/9dhK7mBvSpX76++v/k
 FLtlCrAoYe5fGrr0fho8F3ARYGNb4q9hSJFckOPVcd0UB/I1T3HyoYhoJljZw0dnbfOl
 XIG3i31RHgzMk6x+HspgaitZik8xOZIpt0Y24va4AwWhvfCfO+t8Vt5R8X9fmUwY7DDq
 5gx/7CF0TSdtAGTbboQCZMvg1k6Mk9Lt4x9zrZlMCR2g39ei1Qayx5v7B8DJjzZAkYOi
 b05w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxtLb0Eam2C8Zik/jrLZhnUzL5RI+4CVkEIlBMzpvBcQnYH3SKjLS2ufxAUt554eb2L5NFHB4P6do=@lists.freedesktop.org,
 AJvYcCWvwc0Qhe3+glEX60kdoLCjV4V9nYhVoWwfA3EoHNfpRol4GV9w6pLF9jekIG95/YwofJSP6eQ0+g3z@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw7JzF6vDTyjqKiwEjkJ3VoEWS4TxnHZdOMsnnnHwZ37W2kOM/
 Bddnj4K06ehDP/nfQe2ILXktzz6nTlWlbVAn0ZXR/eSDwnvVuOLu66MB/yaXwqjnPXMnIGHDScf
 u/lyTp0JDnqQAYLsbI7SHa3+8TpQ=
X-Gm-Gg: ASbGncs+iFeSbu2ZigSsAb7fa1Ugpg1NcLCkmSNhw9fXwyaGySbHFs79WKdhyTyeyan
 aPyeOKIleBEEnE1qvzu4F8nSktr9MCyptwQP6rEpbqjH+YVcatux91FLv5rdfykwz0EGRFZEvRA
 vBpgGeLA9MCt32kv1jxYC8Xg==
X-Google-Smtp-Source: AGHT+IEtyWkvkWlkFB/0B7z7ZFqlkBdmXeZzAPAxswbI80SdN2p9eTapIvhC18am+K6cf2EQIuo8FKBK2WLzBA1V15k=
X-Received: by 2002:a05:6e02:1689:b0:3d0:4b3d:75ba with SMTP id
 e9e14a558f8ab-3da7e1e1b24mr43129255ab.4.1746798755408; Fri, 09 May 2025
 06:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
 <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
 <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
In-Reply-To: <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 9 May 2025 06:52:23 -0700
X-Gm-Features: AX0GCFtkuS-MqVFGx1kw13xZjuTaKSplnt5h27l8JKKLHrytJs4ZlOcxEKTw1KU
Message-ID: <CAF6AEGvmEP4oGytfsCHYDCtOUDYq68y=vS7fu0jzP+=oajeq9g@mail.gmail.com>
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
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

On Fri, May 9, 2025 at 5:31=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/8/25 8:41 PM, Rob Clark wrote:
> > On Thu, May 8, 2025 at 11:13=E2=80=AFAM Konrad Dybcio <konradybcio@kern=
el.org> wrote:
> >>
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Start the great despaghettification by getting a pointer to the common
> >> UBWC configuration, which houses e.g. UBWC versions that we need to
> >> make decisions.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
> >>  3 files changed, 23 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214=
366cfbd22d5bcf4bc7 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *g=
pu)
> >>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), pr=
otect->regs[i]);
> >>  }
> >>
> >> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>  {
> >> +       /* Inherit the common config and make some necessary fixups */
> >> +       gpu->common_ubwc_cfg =3D qcom_ubwc_config_get_data();
> >
> > This does look a bit funny given the devm_kzalloc() below.. I guess
> > just so that the ptr is never NULL?
>
> Yeah, would you prefer this is changed?

I think having an all zeros ubwc cfg isn't really going to work
anyways, so probably drop the kzalloc().  Or if there is a case that
I'm not thinking of offhand where it makes sense to have an all 0's
cfg, then add a comment to avoid future head scratching, since
otherwise it looks like a bug to be fixed.

BR,
-R
