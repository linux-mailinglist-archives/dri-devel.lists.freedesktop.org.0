Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E52A98AC3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C350810E0BD;
	Wed, 23 Apr 2025 13:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwfqo26k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0B010E1BE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:21:15 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NA594g024290
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o0Oojh+DOVkC76UOAHNrHiaA7ZHX478F8dAXStkU6sU=; b=bwfqo26keTZguCUI
 lpFj1PVfOvesj82rvdjoEPQXNXnQadeUl8hxFEs60qbBjGgUKByuKmIIty+JUt0Z
 1iG+B6M2ng2pDbbR3KErXPer4so6qHukcVDOyHn827gdZ1ceCVmDUj9cQFX9FCCG
 etndl05X6EAzNkTGUrTlA2SwND/bAJSJA+y+PM1M6hhH0446eGgzC1WF1pc+ZhgJ
 jllaqY4MO0VdxvmvaUpcXA4kOraQH2dumRY11UUDVBvz0jy59xhliaIQhBlkaqs5
 FxYJ7ippD19BNgReAjUR6XisBOtFW0IS/1RjbWhxLFwBrjjsUw9ne5hCGpWLXgvR
 YVYvZw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh12727-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:21:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ff605a7a43so9126556a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 06:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745414472; x=1746019272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0Oojh+DOVkC76UOAHNrHiaA7ZHX478F8dAXStkU6sU=;
 b=wjN+ay+wzmXGIjYw/VAQqlSd52nZtG/eO1381v1IhlvQcsI1EXhAFOIo9k6yuQ6hG/
 aFJK8+CGXjm0A9w75ltV+iqP+Jq7dGEFXWcskO3E2zHM/3tA8GNEKGWgm1ceUCMwFSYl
 Tum1TBuHYejmzFM3PYowtzXJoYwXgR/Zd//Rec+XBAtwCiTYK4H0wZ4gnRZNIczAiPW8
 zfi98LdTOQIGqK65QHAQlRXeWyLj/tFmRARJylsWK9ba3HjAhkTNUmN6fLkvakSMCszn
 RN9EIqXc6YaMsjW6t5A7AOs/Vz9lk5SVBOldXlj7ZhjvtgtOmnZrZbeTG4ABmWFelIZc
 yuKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlSjBOXzA5NMuizX1SrPXgfwT2y8PT+NnqR7BkUeteowtiRUFXYaDFqPKIkJ/vOiKgtbCyZ2SCXjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yya0BLEtDv67gHFh23W8gCUezc1rWIWF9/cDjKQjdf9OpxWr7Wf
 oVM6fvom0TUv7TG5p68dW9OkeD+V+o9rJ8yvWr7dD0C1JMIIfNyJaVbJj1TtGsQettLomffu5hl
 rooWU7qvjoP6KjeJHYVO69q3qqMVJFgeUU8h61l8XeUJBZXyL3dYP3aRu/+TtvjslDMVY+9gZws
 G3G6Qn+qtfnhwv2XBNKArc+mKWhkoC/qhZXQoyAYugwwgkne1Tfg==
X-Gm-Gg: ASbGncvSzsAXFGquEA8gHouDp9MJA0MGoiuFt5vrp9Us+ree3M33QIpFwxHKF6jGKl+
 CN3Oor+fjT1Lnn1N7/R3AoGSv5Su3MOaWRQltmeYIEUDuAbiH+5PReod3OC9WEPKtLN7VuNUTev
 EzmFzmuGcN1YRXVN4vZLJ32yrT
X-Received: by 2002:a17:90b:2f48:b0:2ee:ee77:2263 with SMTP id
 98e67ed59e1d1-3087bb418dfmr30784365a91.7.1745414472175; 
 Wed, 23 Apr 2025 06:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqmjm/2kDzMUyAfKU30umWUUv1n/JyBQC1oaF07FgLHjm7bKHWdrgbopbp7m+vpW/yO0v9Q/VkT8i0fw84gas=
X-Received: by 2002:a17:90b:2f48:b0:2ee:ee77:2263 with SMTP id
 98e67ed59e1d1-3087bb418dfmr30784318a91.7.1745414471636; Wed, 23 Apr 2025
 06:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
 <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
 <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
 <d67b8fe7-ab92-4756-b549-827210240593@quicinc.com>
In-Reply-To: <d67b8fe7-ab92-4756-b549-827210240593@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:21:00 +0300
X-Gm-Features: ATxdqUGiKzLZZWpft--coqQChZkRh8TF47Vs6qYx0rHMcX_qIVdwunZSkKSPdaU
Message-ID: <CAO9ioeU9_MsLn3THJDkR1J6efmvm2u9vPZSu9U8Qe2mdHx0_tw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Connor Abbott <cwabbott0@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-hardening@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: eWi8P92BEJogBWPRdq1En3ko803DcZw1
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6808e94a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QMXKlZcuWh9fA9xejY4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eWi8P92BEJogBWPRdq1En3ko803DcZw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5MyBTYWx0ZWRfX29ynOA2dCJ5L
 Eq6phItCDQ/tFF2bb1PuRxjRQ9elUqm/4Cdg1bKaCDPz9jyAKtuyhX3/kXNZKSSznIOdyRzKmMd
 QdgoNW4vSjP4bXAZ5Zi56DQ5Z7cvX/AI8BA689oh+4McpHxxJB4KV867MsoYgtOfP1zh8Z2Hh2S
 0zhCytw5EQp71/jxfXIH0Eu/z6NVAT1g86PRYXOEAJvmUGNJqilZtbOkRRL/K7ZoOalU8YraePU
 GseNUKgeAzCYhHnNeMY8nkAySeWKixzrIAyp72HPyZFods5LYllxW2zfWol2HcFy5Xh/cakCsqg
 1nH9mS7aSWB7vgt9EsFZspI8Ooa2uE9g3J5m2nzMgBbzux89iC17vzRYnVbvWqe7iWYu5Te4s/P
 kraQIzbITb9E79d552d2JjFdAu/JfYHfuon55nUvLGaW/J0k2BDtVBCFtLb8ebWe6udtnhui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230093
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

On Wed, 23 Apr 2025 at 09:55, Akhil P Oommen <quic_akhilpo@quicinc.com> wro=
te:
>
> On 4/23/2025 5:27 AM, Konrad Dybcio wrote:
> > On 4/21/25 10:13 PM, Rob Clark wrote:
> >> On Fri, Apr 18, 2025 at 9:00=E2=80=AFAM Akhil P Oommen <quic_akhilpo@q=
uicinc.com> wrote:
> >>>
> >>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
> >>>> On Thu, Apr 17, 2025, 1:50=E2=80=AFPM Akhil P Oommen <quic_akhilpo@q=
uicinc.com> wrote:
> >>>>>
> >>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
> >>>>>> On Thu, Apr 17, 2025 at 3:45=E2=80=AFAM Akhil P Oommen <quic_akhil=
po@quicinc.com> wrote:
> >>>>>>>
> >>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
> >>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>>
> >>>>>>>> The Highest Bank address Bit value can change based on memory ty=
pe used.
> >>>>>>>>
> >>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonabl=
e
> >>>>>>>> default (the one used prior to this change) on error.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>> ---
> >>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
> >>>>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu=
/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319=
f20ae5f8f5e57f38ecc62d9f 100644
> >>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>> @@ -13,6 +13,7 @@
> >>>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
> >>>>>>>>  #include <linux/pm_domain.h>
> >>>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
> >>>>>>>> +#include <linux/soc/qcom/smem.h>
> >>>>>>>>
> >>>>>>>>  #define GPU_PAS_ID 13
> >>>>>>>>
> >>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_g=
pu *gpu)
> >>>>>>>>
> >>>>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>>>>>>  {
> >>>>>>>> +     int hbb;
> >>>>>>>> +
> >>>>>>>>       gpu->ubwc_config.rgb565_predicator =3D 0;
> >>>>>>>>       gpu->ubwc_config.uavflagprd_inv =3D 0;
> >>>>>>>>       gpu->ubwc_config.min_acc_len =3D 0;
> >>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adr=
eno_gpu *gpu)
> >>>>>>>>           adreno_is_a690(gpu) ||
> >>>>>>>>           adreno_is_a730(gpu) ||
> >>>>>>>>           adreno_is_a740_family(gpu)) {
> >>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 fo=
r LPDDR4 */
> >>>>>>>>               gpu->ubwc_config.highest_bank_bit =3D 16;
> >>>>>>>>               gpu->ubwc_config.amsbc =3D 1;
> >>>>>>>>               gpu->ubwc_config.rgb565_predicator =3D 1;
> >>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct ad=
reno_gpu *gpu)
> >>>>>>>>               gpu->ubwc_config.highest_bank_bit =3D 14;
> >>>>>>>>               gpu->ubwc_config.min_acc_len =3D 1;
> >>>>>>>>       }
> >>>>>>>> +
> >>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above =
defaults in case of error */
> >>>>>>>> +     hbb =3D qcom_smem_dram_get_hbb();
> >>>>>>>> +     if (hbb < 0)
> >>>>>>>> +             return;
> >>>>>>>> +
> >>>>>>>> +     gpu->ubwc_config.highest_bank_bit =3D hbb;
> >>>>>>>
> >>>>>>> I am worried about blindly relying on SMEM data directly for HBB =
for
> >>>>>>> legacy chipsets. There is no guarantee it is accurate on every ch=
ipset
> >>>>>>> and every version of firmware. Also, until recently, this value w=
as
> >>>>>>> hardcoded in Mesa which matched the value in KMD.
> >>>>>>
> >>>>>> To be clear about this, from the moment we introduced host image
> >>>>>> copies in Mesa we added support for querying the HBB from the kern=
el,
> >>>>>> explicitly so that we could do what this series does without Mesa =
ever
> >>>>>> breaking. Mesa will never assume the HBB unless the kernel is too =
old
> >>>>>> to support querying it. So don't let Mesa be the thing that stops =
us
> >>>>>> here.
> >>>>>
> >>>>> Thanks for clarifying about Mesa. I still don't trust a data source=
 that
> >>>>> is unused in production.
> >>>>
> >>>> Fair enough, I'm not going to argue with that part. Just wanted to
> >>>> clear up any confusion about Mesa.
> >>>>
> >>>> Although, IIRC kgsl did set different values for a650 depending on
> >>>> memory type... do you know what source that used?
> >>>
> >>> KGSL relies on an undocumented devicetree node populated by bootloade=
r
> >>> to detect ddrtype and calculates the HBB value based on that.
> >>
> >> Would it be reasonable to use the smem value, but if we find the
> >> undocumented dt property, WARN_ON() if it's value disagrees with smem?
> >>
> >> That would at least give some confidence, or justified un-confidence
> >> about the smem values
> >
> > The aforementioned value is populated based on the data that this
> > driver reads out, and only on the same range of platforms that this
> > driver happens to cater to
>
> Like I suggested privately, can we centralize all ubwc configuration so
> that it is consistent across all drivers. With that, we will need to
> maintain a table of ubwc config for each chipset and HBB can be
> calculated based on the DDR configuration identified from SMEM. Once we
> migrate the downstream drivers to the new API, we can hopefully move to
> the HBB value from SMEM. This will ensure that the SMEM data for HBB is
> accurate in all future chipsets.

I like this suggestion.

--=20
With best wishes
Dmitry
