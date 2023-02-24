Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCD96A23E0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 22:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503BD10E279;
	Fri, 24 Feb 2023 21:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F5810E3B4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 21:36:27 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id a10so476617ljq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 13:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=chW2sH/gJAtv0VgHpGdTehMYaBfqQmF+IkEl+pnB18E=;
 b=MW2s77FgG8K4w/A9zQUgFkiKvFBw/lCGBTlOKcABDk+ZV+lMg0bx73LIcCVWhewdwV
 AjyZ7YEbZkEHRGmsPeQhS4P5deYL2M4FQ4Cr8WsOi3tXb2wHFHlq17uERBkKKmOwQl8G
 1+CMi+Khu8fiby2fbbK5hqQw9B9BsrFhdDm/0MMsatXY9txJ9cMvlllnHVTrfG35qW4i
 z9sr9caIsi/O50MIORqqTFhnUCuzqvr766+eZy0PqXmvUXWfnAOna/FNoHDxeCySKJPT
 Z7XAJC7cTGd7JvzWE/3Fec3fghlPA7g9VRPMfUEPQrK/At7+WceL1JQoigyfKJlHIYKG
 5XTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=chW2sH/gJAtv0VgHpGdTehMYaBfqQmF+IkEl+pnB18E=;
 b=zg1FUL6wl354tzNdQXLxUwvdqj/Fp9jtFMjD3am8oJ2URYzoUjb5S+ThZM+6LLVnvI
 NDdsOBtKPcVEHmv1K8K6+u5bI2ELU47a0w2uKDGUzBjk3rIxxcDXevaSjRuUZZvxDHB6
 IMNkmK306lWRQpAb4W/lUk2OA5E2q7iBLBRAAAH/6iiqpixxnfyhW24CN1oGUiuPWg7g
 LF8+8i1y4VEgZ219XgDaFKWrYPqrN8hermjYnOeXg1eZBKj4ZSSclpqMlLKSg5eJaQQA
 YbtSpgksDTKRYjnwsWZd+8mfNWc+nx98xkh2EIp6zroNrRvtcYPMPvy0hUoQeuZ37paX
 gfQQ==
X-Gm-Message-State: AO0yUKWeWwuQJ/3N0wIT21/W1833UIPzgWNF6MGruvv89ra5nPTdscj4
 Hj1uN+jSFbgOoazMBVA/ZpzjPw==
X-Google-Smtp-Source: AK7set9sr/S30YDREz0zkmufGzYaW+YfuYTq7xmRz64mZqq0bHZMqbHFtNMynCf2RgEAKp9Efi+3ag==
X-Received: by 2002:a2e:9857:0:b0:295:8c04:8205 with SMTP id
 e23-20020a2e9857000000b002958c048205mr5498434ljj.41.1677274585434; 
 Fri, 24 Feb 2023 13:36:25 -0800 (PST)
Received: from [127.0.0.1] (85-76-97-202-nat.elisa-mobile.fi. [85.76.97.202])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a2ea4d1000000b00295733a3390sm9611ljm.101.2023.02.24.13.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 13:36:24 -0800 (PST)
Date: Fri, 24 Feb 2023 23:36:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
Subject: Re: [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
User-Agent: K-9 Mail for Android
In-Reply-To: <741be2a3-0208-2f40-eedf-d439c4e6795b@quicinc.com>
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
 <741be2a3-0208-2f40-eedf-d439c4e6795b@quicinc.com>
Message-ID: <F8A4FC18-C64E-4011-BC08-18EB3B95A357@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Cc: marijn.suijten@somainline.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

24 =D1=84=D0=B5=D0=B2=D1=80=D0=B0=D0=BB=D1=8F 2023 =D0=B3=2E 23:23:03 GMT+0=
2:00, Abhinav Kumar <quic_abhinavk@quicinc=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
>
>
>On 2/24/2023 1:13 PM, Dmitry Baryshkov wrote:
>> On 24/02/2023 21:40, Kuogee Hsieh wrote:
>>> Add DSC helper functions based on DSC configuration profiles to produc=
e
>>> DSC related runtime parameters through both table look up and runtime
>>> calculation to support DSC on DPU=2E
>>>=20
>>> There are 6 different DSC configuration profiles are supported current=
ly=2E
>>> DSC configuration profiles are differiented by 5 keys, DSC version (V1=
=2E1),
>>> chroma (444/422/420), colorspace (RGB/YUV), bpc(8/10),
>>> bpp (6/7/7=2E5/8/9/10/12/15) and SCR (0/1)=2E
>>>=20
>>> Only DSC version V1=2E1 added and V1=2E2 will be added later=2E
>>=20
>> These helpers should go to drivers/gpu/drm/display/drm_dsc_helper=2Ec
>> Also please check that they can be used for i915 or for amdgpu (ideally=
 for both of them)=2E
>>=20
>
>No, it cannot=2E So each DSC encoder parameter is calculated based on the=
 HW core which is being used=2E
>
>They all get packed to the same DSC structure which is the struct drm_dsc=
_config but the way the parameters are computed is specific to the HW=2E
>
>This DPU file helper still uses the drm_dsc_helper's drm_dsc_compute_rc_p=
arameters() like all other vendors do but the parameters themselves are ver=
y HW specific and belong to each vendor's dir=2E
>
>This is not unique to MSM=2E
>
>Lets take a few other examples:
>
>AMD: https://gitlab=2Efreedesktop=2Eorg/drm/msm/-/blob/msm-next/drivers/g=
pu/drm/amd/display/dc/dml/dsc/rc_calc_fpu=2Ec#L165
>
>i915: https://gitlab=2Efreedesktop=2Eorg/drm/msm/-/blob/msm-next/drivers/=
gpu/drm/i915/display/intel_vdsc=2Ec#L379=20

I checked several values here=2E Intel driver defines more bpc/bpp combina=
tions, but the ones which are defined in intel_vdsc and in this patch seem =
to match=2E If there are major differences there, please point me to the ex=
act case=2E

I remember that AMD driver might have different values=2E


>
>All vendors compute the values differently and eventually call drm_dsc_co=
mpute_rc_parameters()
>
>> I didn't check the tables against the standard (or against the current =
source code), will do that later=2E
>>=20
>>>=20
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>
>>> ---
>>> =C2=A0 drivers/gpu/drm/msm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 1 +
>>> =C2=A0 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper=2Ec | 209 ++++++++=
+++++++++++++++++
>>> =C2=A0 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper=2Eh |=C2=A0 34 +++=
+
>>> =C2=A0 3 files changed, 244 insertions(+)
>>> =C2=A0 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper=
=2Ec
>>> =C2=A0 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper=
=2Eh
>>>=20
>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefi=
le
>>> index 7274c412=2E=2E28cf52b 100644
>>> --- a/drivers/gpu/drm/msm/Makefile
>>> +++ b/drivers/gpu/drm/msm/Makefile
>>> @@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) +=3D \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disp/dpu1/dpu_hw_catalog=2Eo \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disp/dpu1/dpu_hw_ctl=2Eo \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disp/dpu1/dpu_hw_dsc=2Eo \
>>> +=C2=A0=C2=A0=C2=A0 disp/dpu1/dpu_dsc_helper=2Eo \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disp/dpu1/dpu_hw_interrupts=2Eo \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disp/dpu1/dpu_hw_intf=2Eo \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disp/dpu1/dpu_hw_lm=2Eo \
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper=2Ec b/driver=
s/gpu/drm/msm/disp/dpu1/dpu_dsc_helper=2Ec
>>> new file mode 100644
>>> index 00000000=2E=2E88207e9
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper=2Ec
>>> @@ -0,0 +1,209 @@
>>> +// SPDX-License-Identifier: GPL-2=2E0-only
>>> +/*
>>> + * Copyright (c) 2023=2E Qualcomm Innovation Center, Inc=2E All right=
s reserved
>>> + */
>>> +
>>> +#include <drm/display/drm_dsc_helper=2Eh>
>>> +#include "msm_drv=2Eh"
>>> +#include "dpu_kms=2Eh"
>>> +#include "dpu_hw_dsc=2Eh"
>>> +#include "dpu_dsc_helper=2Eh"
>>> +
>>> +
>>=20
>> Extra empty line
>>=20
>>> +#define DPU_DSC_PPS_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 128
>>> +
>>> +enum dpu_dsc_ratio_type {
>>> +=C2=A0=C2=A0=C2=A0 DSC_V11_8BPC_8BPP,
>>> +=C2=A0=C2=A0=C2=A0 DSC_V11_10BPC_8BPP,
>>> +=C2=A0=C2=A0=C2=A0 DSC_V11_10BPC_10BPP,
>>> +=C2=A0=C2=A0=C2=A0 DSC_V11_SCR1_8BPC_8BPP,
>>> +=C2=A0=C2=A0=C2=A0 DSC_V11_SCR1_10BPC_8BPP,
>>> +=C2=A0=C2=A0=C2=A0 DSC_V11_SCR1_10BPC_10BPP,
>>> +=C2=A0=C2=A0=C2=A0 DSC_RATIO_TYPE_MAX
>>> +};
>>> +
>>> +
>>> +static u16 dpu_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0e, 0x1c, 0x2a, 0x38, 0x=
46, 0x54,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x62, 0x69, 0x70, 0x77, 0x=
79, 0x7b, 0x7d, 0x7e
>>=20
>> Weird indentation
>>=20
>>> +};
>>> +
>>> +/*
>>> + * Rate control - Min QP values for each ratio type in dpu_dsc_ratio_=
type
>>> + */
>>> +static char dpu_dsc_rc_range_min_qp[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_R=
ANGES] =3D {
>>> +=C2=A0=C2=A0=C2=A0 /* DSC v1=2E1 */
>>> +=C2=A0=C2=A0=C2=A0 {0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13},
>>> +=C2=A0=C2=A0=C2=A0 {0, 4, 5, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 17},
>>> +=C2=A0=C2=A0=C2=A0 {0, 4, 5, 6, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 15},
>>> +=C2=A0=C2=A0=C2=A0 /* DSC v1=2E1 SCR and DSC v1=2E2 RGB 444 */
>>=20
>> What is SCR? Is there any reason to use older min/max Qp params instead=
 of always using the ones from the VESA-DSC-1=2E1 standard?
>>=20
>>> +=C2=A0=C2=A0=C2=A0 {0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 9, 12},
>>> +=C2=A0=C2=A0=C2=A0 {0, 4, 5, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 13, 16},
>>> +=C2=A0=C2=A0=C2=A0 {0, 4, 5, 6, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 15},
>>> +};
>>> +
>>> +/*
>>> + * Rate control - Max QP values for each ratio type in dpu_dsc_ratio_=
type
>>> + */
>>> +static char dpu_dsc_rc_range_max_qp[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_R=
ANGES] =3D {
>>> +=C2=A0=C2=A0=C2=A0 /* DSC v1=2E1 */
>>> +=C2=A0=C2=A0=C2=A0 {4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15=
},
>>> +=C2=A0=C2=A0=C2=A0 {4, 8, 9, 10, 11, 11, 11, 12, 13, 14, 15, 16, 17, =
17, 19},
>>> +=C2=A0=C2=A0=C2=A0 {7, 8, 9, 10, 11, 11, 11, 12, 13, 13, 14, 14, 15, =
15, 16},
>>> +=C2=A0=C2=A0=C2=A0 /* DSC v1=2E1 SCR and DSC v1=2E2 RGB 444 */
>>> +=C2=A0=C2=A0=C2=A0 {4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 10, 11, 11, 12, 13=
},
>>> +=C2=A0=C2=A0=C2=A0 {8, 8, 9, 10, 11, 11, 11, 12, 13, 14, 14, 15, 15, =
16, 17},
>>> +=C2=A0=C2=A0=C2=A0 {7, 8, 9, 10, 11, 11, 11, 12, 13, 13, 14, 14, 15, =
15, 16},
>>> +};
>>> +
>>> +/*
>>> + * Rate control - bpg offset values for each ratio type in dpu_dsc_ra=
tio_type
>>> + */
>>> +static char dpu_dsc_rc_range_bpg[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_RANG=
ES] =3D {
>>> +=C2=A0=C2=A0=C2=A0 /* DSC v1=2E1 */
>>> +=C2=A0=C2=A0=C2=A0 {2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -=
12, -12, -12},
>>> +=C2=A0=C2=A0=C2=A0 {2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -=
12, -12, -12},
>>> +=C2=A0=C2=A0=C2=A0 {2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -=
12, -12, -12},
>>> +=C2=A0=C2=A0=C2=A0 /* DSC v1=2E1 SCR and DSC V1=2E2 RGB 444 */
>>> +=C2=A0=C2=A0=C2=A0 {2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -=
12, -12, -12},
>>> +=C2=A0=C2=A0=C2=A0 {2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -=
12, -12, -12},
>>> +=C2=A0=C2=A0=C2=A0 {2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -=
12, -12, -12},
>>> +};
>>> +
>>> +static struct dpu_dsc_rc_init_params_lut {
>>> +=C2=A0=C2=A0=C2=A0 u32 rc_quant_incr_limit0;
>>> +=C2=A0=C2=A0=C2=A0 u32 rc_quant_incr_limit1;
>>> +=C2=A0=C2=A0=C2=A0 u32 initial_fullness_offset;
>>> +=C2=A0=C2=A0=C2=A0 u32 initial_xmit_delay;
>>> +=C2=A0=C2=A0=C2=A0 u32 second_line_bpg_offset;
>>> +=C2=A0=C2=A0=C2=A0 u32 second_line_offset_adj;
>>> +=C2=A0=C2=A0=C2=A0 u32 flatness_min_qp;
>>> +=C2=A0=C2=A0=C2=A0 u32 flatness_max_qp;
>>> +}=C2=A0 dpu_dsc_rc_init_param_lut[] =3D {
>>> +=C2=A0=C2=A0=C2=A0 /* DSC v1=2E1 */
>>> +=C2=A0=C2=A0=C2=A0 {11, 11, 6144, 512, 0, 0, 3, 12}, /* DSC_V11_8BPC_=
8BPP */
>>> +=C2=A0=C2=A0=C2=A0 {15, 15, 6144, 512, 0, 0, 7, 16}, /* DSC_V11_10BPC=
_8BPP */
>>> +=C2=A0=C2=A0=C2=A0 {15, 15, 5632, 410, 0, 0, 7, 16}, /* DSC_V11_10BPC=
_10BPP */
>>> +=C2=A0=C2=A0=C2=A0 /* DSC v1=2E1 SCR and DSC v1=2E2 RGB 444 */
>>> +=C2=A0=C2=A0=C2=A0 {11, 11, 6144, 512, 0, 0, 3, 12}, /* DSC_V12_444_8=
BPC_8BPP or DSC_V11_SCR1_8BPC_8BPP */
>>> +=C2=A0=C2=A0=C2=A0 {15, 15, 6144, 512, 0, 0, 7, 16}, /* DSC_V12_444_1=
0BPC_8BPP or DSC_V11_SCR1_10BPC_8BPP */
>>> +=C2=A0=C2=A0=C2=A0 {15, 15, 5632, 410, 0, 0, 7, 16}, /* DSC_V12_444_1=
0BPC_10BPP or DSC_V11_SCR1_10BPC_10BPP */
>>> +};
>>> +
>>> +/**
>>> + * Maps to lookup the dpu_dsc_ratio_type index used in rate control t=
ables
>>> + */
>>> +static struct dpu_dsc_table_index_lut {
>>> +=C2=A0=C2=A0=C2=A0 u32 fmt;
>>> +=C2=A0=C2=A0=C2=A0 u32 scr_ver;
>>> +=C2=A0=C2=A0=C2=A0 u32 minor_ver;
>>> +=C2=A0=C2=A0=C2=A0 u32 bpc;
>>> +=C2=A0=C2=A0=C2=A0 u32 bpp;
>>> +=C2=A0=C2=A0=C2=A0 u32 type;
>>> +} dpu_dsc_index_map[] =3D {
>>> +=C2=A0=C2=A0=C2=A0 /* DSC 1=2E1 formats - scr version is considered *=
/
>>> +=C2=A0=C2=A0=C2=A0 {DPU_DSC_CHROMA_444, 0, 1, 8, 8, DSC_V11_8BPC_8BPP=
},
>>> +=C2=A0=C2=A0=C2=A0 {DPU_DSC_CHROMA_444, 0, 1, 10, 8, DSC_V11_10BPC_8B=
PP},
>>> +=C2=A0=C2=A0=C2=A0 {DPU_DSC_CHROMA_444, 0, 1, 10, 10, DSC_V11_10BPC_1=
0BPP},
>>> +=C2=A0=C2=A0=C2=A0 {DPU_DSC_CHROMA_444, 1, 1, 8, 8, DSC_V11_SCR1_8BPC=
_8BPP},
>>> +=C2=A0=C2=A0=C2=A0 {DPU_DSC_CHROMA_444, 1, 1, 10, 8, DSC_V11_SCR1_10B=
PC_8BPP},
>>> +=C2=A0=C2=A0=C2=A0 {DPU_DSC_CHROMA_444, 1, 1, 10, 10, DSC_V11_SCR1_10=
BPC_10BPP},
>>> +};
>>> +
>>> +static int _get_rc_table_index(struct drm_dsc_config *dsc, int scr_ve=
r)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 u32 bpp, bpc, i, fmt =3D DPU_DSC_CHROMA_444;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (dsc->dsc_version_major !=3D 0x1) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DPU_ERROR("unsupported maj=
or version %d\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dsc->dsc_version_major);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 bpc =3D dsc->bits_per_component;
>>> +=C2=A0=C2=A0=C2=A0 bpp =3D DSC_BPP(*dsc);
>>=20
>> Just inline the macro=2E
>>=20
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (dsc->native_422)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt =3D DPU_DSC_CHROMA_422=
;
>>> +=C2=A0=C2=A0=C2=A0 else if (dsc->native_420)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt =3D DPU_DSC_CHROMA_420=
;
>>> +
>>> +
>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(dpu_dsc_index_map); i=
++) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dsc->dsc_version_minor=
 =3D=3D dpu_dsc_index_map[i]=2Eminor_ver &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fmt =3D=3D=C2=A0 dpu_dsc_index_map[i]=2Efmt &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 bpc =3D=3D dpu_dsc_index_map[i]=2Ebpc &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 bpp =3D=3D dpu_dsc_index_map[i]=2Ebpp &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (dsc->dsc_version_minor !=3D 0x1 ||
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scr_ver =3D=3D dpu_dsc_index_=
map[i]=2Escr_ver))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn dpu_dsc_index_map[i]=2Etype;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 DPU_ERROR("unsupported DSC v%d=2E%dr%d, bpc:%d, bp=
p:%d, fmt:0x%x\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ds=
c->dsc_version_major, dsc->dsc_version_minor,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc=
r_ver, bpc, bpp, fmt);
>>> +=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> +}
>>> +
>>> +int dpu_dsc_populate_dsc_config(struct drm_dsc_config *dsc, int scr_v=
er)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 int bpp, bpc;
>>> +=C2=A0=C2=A0=C2=A0 struct dpu_dsc_rc_init_params_lut *rc_param_lut;
>>> +=C2=A0=C2=A0=C2=A0 int i, ratio_idx;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 dsc->rc_model_size =3D 8192;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if ((dsc->dsc_version_major =3D=3D 0x1) &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (d=
sc->dsc_version_minor =3D=3D 0x1)) {
>>=20
>> indent to the opening bracket please, so that '(dsc' on both lines star=
t on the same position=2E
>>=20
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (scr_ver =3D=3D 0x1)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ds=
c->first_line_bpg_offset =3D 15;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ds=
c->first_line_bpg_offset =3D 12;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 dsc->rc_edge_factor =3D 6;
>>> +=C2=A0=C2=A0=C2=A0 dsc->rc_tgt_offset_high =3D 3;
>>> +=C2=A0=C2=A0=C2=A0 dsc->rc_tgt_offset_low =3D 3;
>>> +=C2=A0=C2=A0=C2=A0 dsc->simple_422 =3D 0;
>>> +=C2=A0=C2=A0=C2=A0 dsc->convert_rgb =3D !(dsc->native_422 | dsc->nati=
ve_420);
>>> +=C2=A0=C2=A0=C2=A0 dsc->vbr_enable =3D 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 bpp =3D DSC_BPP(*dsc);
>>=20
>> inline the macro=2E
>>=20
>>> +=C2=A0=C2=A0=C2=A0 bpc =3D dsc->bits_per_component;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ratio_idx =3D _get_rc_table_index(dsc, scr_ver);
>>> +=C2=A0=C2=A0=C2=A0 if ((ratio_idx < 0) || (ratio_idx >=3D DSC_RATIO_T=
YPE_MAX))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> +
>>> +
>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < DSC_NUM_BUF_RANGES - 1; i++)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dsc->rc_buf_thresh[i] =3D =
dpu_dsc_rc_buf_thresh[i];
>>=20
>> Can we use memcpy?
>>=20
>>> +
>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < DSC_NUM_BUF_RANGES; i++) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dsc->rc_range_params[i]=2E=
range_min_qp =3D
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dp=
u_dsc_rc_range_min_qp[ratio_idx][i];
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dsc->rc_range_params[i]=2E=
range_max_qp =3D
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dp=
u_dsc_rc_range_max_qp[ratio_idx][i];
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dsc->rc_range_params[i]=2E=
range_bpg_offset =3D
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dp=
u_dsc_rc_range_bpg[ratio_idx][i];
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 rc_param_lut =3D &dpu_dsc_rc_init_param_lut[ratio_=
idx];
>>> +=C2=A0=C2=A0=C2=A0 dsc->rc_quant_incr_limit0 =3D rc_param_lut->rc_qua=
nt_incr_limit0;
>>> +=C2=A0=C2=A0=C2=A0 dsc->rc_quant_incr_limit1 =3D rc_param_lut->rc_qua=
nt_incr_limit1;
>>> +=C2=A0=C2=A0=C2=A0 dsc->initial_offset =3D rc_param_lut->initial_full=
ness_offset;
>>> +=C2=A0=C2=A0=C2=A0 dsc->initial_xmit_delay =3D rc_param_lut->initial_=
xmit_delay;
>>> +=C2=A0=C2=A0=C2=A0 dsc->second_line_bpg_offset =3D rc_param_lut->seco=
nd_line_bpg_offset;
>>> +=C2=A0=C2=A0=C2=A0 dsc->second_line_offset_adj =3D rc_param_lut->seco=
nd_line_offset_adj;
>>> +=C2=A0=C2=A0=C2=A0 dsc->flatness_min_qp =3D rc_param_lut->flatness_mi=
n_qp;
>>> +=C2=A0=C2=A0=C2=A0 dsc->flatness_max_qp =3D rc_param_lut->flatness_ma=
x_qp;
>>> +
>>> +
>>> +=C2=A0=C2=A0=C2=A0 dsc->line_buf_depth =3D bpc + 1;
>>> +=C2=A0=C2=A0=C2=A0 dsc->mux_word_size =3D bpc > 10 ? DSC_MUX_WORD_SIZ=
E_12_BPC : DSC_MUX_WORD_SIZE_8_10_BPC;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 dsc->initial_scale_value =3D 8 * dsc->rc_model_siz=
e /
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (d=
sc->rc_model_size - dsc->initial_offset);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return drm_dsc_compute_rc_=
parameters(dsc);
>>=20
>> Indentation is wrong
>>=20
>>> +}
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper=2Eh b/driver=
s/gpu/drm/msm/disp/dpu1/dpu_dsc_helper=2Eh
>>> new file mode 100644
>>> index 00000000=2E=2E4a23e02
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper=2Eh
>>> @@ -0,0 +1,34 @@
>>> +// SPDX-License-Identifier: GPL-2=2E0-only
>>> +/*
>>> + * Copyright (c) 2023=2E Qualcomm Innovation Center, Inc=2E All right=
s reserved
>>> + */
>>> +
>>> +#ifndef __DPU_DSC_HELPER_H__
>>> +#define __DPU_DSC_HELPER_H__
>>> +
>>> +#include "msm_drv=2Eh"
>>> +
>>> +#define DSC_1_1_PPS_PARAMETER_SET_ELEMENTS=C2=A0=C2=A0 88
>>=20
>> What is this? Does it need to be global?
>>=20
>>> +
>>> +/**
>>> + * Bits/pixel target >> 4=C2=A0 (removing the fractional bits)
>>> + * returns the integer bpp value from the drm_dsc_config struct
>>> + */
>>> +#define DSC_BPP(config) ((config)=2Ebits_per_pixel >> 4)
>>> +
>>> +enum dpu_dsc_chroma {
>>> +=C2=A0=C2=A0=C2=A0 DPU_DSC_CHROMA_444,
>>> +=C2=A0=C2=A0=C2=A0 DPU_DSC_CHROMA_422,
>>> +=C2=A0=C2=A0=C2=A0 DPU_DSC_CHROMA_420,
>>> +};
>>=20
>> I think this enum is also not used outside of your helpers=2E
>>=20
>>> +
>>> +int dpu_dsc_populate_dsc_config(struct drm_dsc_config *dsc, int scr_v=
er);
>>> +
>>> +bool dpu_dsc_ich_reset_override_needed(bool pu_en, struct drm_dsc_con=
fig *dsc);
>>=20
>> Unused
>>=20
>>> +
>>> +int dpu_dsc_initial_line_calc( u32 num_active_ss_per_enc,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct drm_dsc_config *dsc,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 int enc_ip_width, int dsc_cmn_mode);
>>=20
>> Unused
>>=20
>>> +
>>> +#endif /* __DPU_DSC_HELPER_H__ */
>>> +
>>=20

