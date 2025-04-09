Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A787A82A5D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3129710E18B;
	Wed,  9 Apr 2025 15:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kwwFupc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F5510E18B;
 Wed,  9 Apr 2025 15:30:22 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-af5f28ecbcaso1162097a12.0; 
 Wed, 09 Apr 2025 08:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744212622; x=1744817422; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z8RHRVKQouQftyjR10Wqn4eO6RF5eyTqUXdahuKdSrg=;
 b=kwwFupc1MYd2Zc7LLnuuTiDKUlreqe9bVsZZK0BxgxXyoWnFZKJnvHe+RlBouSwJjV
 fXlt2dc5gNEaNxaeKiW+0nJS9yFoq7z5QU7bUlsg4+9aBIsIP4e0CBHqLmE+BjtTFZKe
 0JUoT1s1z4QnnYijpLvJzyN2/uMeqL7NgZwm9/W3zP7gfVRNAuPJdiOd4vW16tabtYkp
 IIIi5tT/lj/vuqm0aG8jotC56j5koeSps2guHP6/r3W3c7shXvcM3idsrQDHv79Hoc4n
 u5SzXKIjoxqdE3gfebCyKvh5C98gMpapcKH4cgolFxXc7Ynfs6fJ6bMboigoc5LN6LR0
 WbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744212622; x=1744817422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z8RHRVKQouQftyjR10Wqn4eO6RF5eyTqUXdahuKdSrg=;
 b=qehmF2nRfzwNRDTT2WzE7Dah0exKGtjsxPbS519lRqcjtFA9bzSQac6j3VBYi6/kFC
 HEDkK6a77WAEyX6EAr+kjBV4jDpx+NehHcGd3IHu0tUOJcampBU0/IcS4Nbp6VUDQIfj
 hRdpVmM5MScXBlf2RgnQCQL8lhsBvyICd4xkkEBPcm6EgwuRg5cGHQx8Li/eZlkhWRSN
 ZgUZomP8HPbY7SMTwElWjr2VrqBVVwn67BtE26+Abfs/9FoWVpZ8jiTVbj8TKLJXIS5k
 D55tX6iBBi1WRbvz5LIaoWNZuLDrYbTGCdJ1zglrVYigHplNFGOegIfxEGSIWhYZIQ1e
 XxLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQFC+4P84dmqhCOwsgZvJo1w50tPX5INs+7CgjtYDOCFKQjRHBFDOmqW3LjSBvIKzJ8RrceYToxkf6@lists.freedesktop.org,
 AJvYcCVv1eO2EyQ5CFs+/mHYov3lvf+YMD0quHEmfI62QNrsXCUzB6vDY1esAjpL59A8IN72+C/pkq1kilw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw3iJitvGr4hTApyoXY5la/EPLcKrB1DqltoDxyMOyVzQhHbyO
 OoGHDpdHbHk9x8QluAMnMbzX0fCvpnPQEiMztl+xKYQ4FUSXhNA2z5LcxXWJEMAi4oikoxp2NuC
 0mYN9FRQ98FbT8D+V2OVjY2lWp9Y=
X-Gm-Gg: ASbGncvLLuhLVbymQ3Z9bRsSr0tBF7ApAgZUhBMWBVfT3Aqu6CUiVzykIjgSHyNWuap
 zzPjaRvwpL1oUQ5r0I7Nq5XEmfkVtlM9dy+93drWPWgX7fZacbR2jP8kD26UIK5i4O6bRGuGbaY
 8UwdpXoN5GVIZlYd1Jz3tqFg==
X-Google-Smtp-Source: AGHT+IFvw7UU8V9RYaU2yDGTDkK4qSbmVBUa5uAZXnS90yUfYYPnyAx4R3eS12INHlN8U3kMlOUeGD8W96fBB246NpQ=
X-Received: by 2002:a05:6a00:3a01:b0:736:559f:eca9 with SMTP id
 d2e1a72fcca58-73bae5272f5mr1833806b3a.3.1744212621584; Wed, 09 Apr 2025
 08:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
 <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
 <c2dac38b-bbe5-4cd1-9d33-b4bba629d54b@oss.qualcomm.com>
In-Reply-To: <c2dac38b-bbe5-4cd1-9d33-b4bba629d54b@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 9 Apr 2025 11:30:10 -0400
X-Gm-Features: ATxdqUHcBvVK0Cb2KxzN_hC_D58IOi6LWCz6c0PE-YPMPs9wv_qjFpk5kCr2vVc
Message-ID: <CACu1E7F71M0Z5KUdArRYbLEMXoS3jQEtp=0-4LEYFRysOsYZfA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Wed, Apr 9, 2025 at 11:22=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/9/25 5:12 PM, Connor Abbott wrote:
> > On Wed, Apr 9, 2025 at 10:48=E2=80=AFAM Konrad Dybcio <konradybcio@kern=
el.org> wrote:
> >>
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> The Highest Bank address Bit value can change based on memory type use=
d.
> >>
> >> Attempt to retrieve it dynamically, and fall back to a reasonable
> >> default (the one used prior to this change) on error.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
> >>  1 file changed, 16 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db35315209=
d0265ad9223e8b55c7 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -13,6 +13,7 @@
> >>  #include <linux/firmware/qcom/qcom_scm.h>
> >>  #include <linux/pm_domain.h>
> >>  #include <linux/soc/qcom/llcc-qcom.h>
> >> +#include <linux/soc/qcom/smem.h>
> >>
> >>  #define GPU_PAS_ID 13
> >>
> >> @@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adreno_=
gpu *gpu)
> >>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> >>  {
> >>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >> +       u32 hbb =3D qcom_smem_dram_get_hbb();
> >> +       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> >> +       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_sw=
izzle & 2);
> >> +       u32 hbb_hi, hbb_lo;
> >> +
> >>         /*
> >>          * We subtract 13 from the highest bank bit (13 is the minimum=
 value
> >>          * allowed by hw) and write the lowest two bits of the remaini=
ng value
> >>          * as hbb_lo and the one above it as hbb_hi to the hardware.
> >>          */
> >> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> >> -       u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> >> -       u32 hbb_hi =3D hbb >> 2;
> >> -       u32 hbb_lo =3D hbb & 3;
> >> -       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> >> -       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_sw=
izzle & 2);
> >> +       if (hbb < 0)
> >> +               hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
> >
> > No. The value we expose to userspace must match what we program.
> > You'll break VK_EXT_host_image_copy otherwise.
>
> I didn't know that was exposed to userspace.
>
> The value must be altered either way - ultimately, the hardware must
> receive the correct information. ubwc_config doesn't seem to be const,
> so I can edit it there if you like it better.
>
> Konrad

Yes, you should be calling qcom_smem_dram_get_hbb() in
a6xx_calc_ubwc_config(). You can already see there's a TODO there to
plug it in.

Connor
