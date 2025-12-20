Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090E3CD2466
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 01:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8857910F02B;
	Sat, 20 Dec 2025 00:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JrCFVGtP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqsFm8BI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3266B10F02B
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 00:42:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJNO44r2704818
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 00:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=JOGt5/7g49gJezpOEHrF48C/QV2MS3EEhUzdFDmEb1Y=; b=Jr
 CFVGtPYigp2xekdP7NSsVHZw4ZM8O+6A+55929D2nwL9taxUVeadc98/08DQ6atw
 K0iFclY6I8x39qVt/1irZlJFKWef0alBG5nU9LeYq07HMVSHGQ/EAuk2FBTlk6z5
 ONT/Xk8buEtv4aRA/0E/n/3YwlDTvcX5AdxKKEDXy8Wls3jbmkNF5xTlQ5qsEgRJ
 0+l/uc0EjO18aRxE3iWL6cIMLzufyFDBs69Z7pjHzUGurogB5D0cw5wS4g8A7pEE
 IYzjaiURIUep4lwPZMKi25mSedKmd1KuyBSB6I+hFjePHeR7lNXahrF+N6l4szEs
 ujPBJmaARXDXOZMOlbzQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5frq86gv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 00:42:45 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-657486eb435so3145208eaf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 16:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766191365; x=1766796165;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JOGt5/7g49gJezpOEHrF48C/QV2MS3EEhUzdFDmEb1Y=;
 b=eqsFm8BITOF7NCE4dOMXI73bMzkZUt77b+LGLhYSB4mdSK6w27VxkKaKwAJrlwNJwi
 qANSQ3hEmX9N85VUEKHXlZAsrrrgq8zuaEKj1jsPgeWqS3Me5+tgFq5CQfTPhNxSLUyY
 LmBOucjWlvRXeugi+7NSqd2VeQoARyR2qyAvu0dyk7R7Wq3IFtejFdmRAg/Vw57zsvsN
 G0xtAlgKP1ga0N3Mk5J7SOvzl9FSokgUe5gWndFXC/AJbOha0hgr/YgEDeXP+UI1v7+G
 Hj6c2ktQuFtxnqn2pBMf1Krnlb315NiTStUMlISrHxTKNk+H62OKLEfA+0G9NzqwX2mM
 rXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766191365; x=1766796165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JOGt5/7g49gJezpOEHrF48C/QV2MS3EEhUzdFDmEb1Y=;
 b=eYf7okGqTymUhcckbEqYO5zU1jXycsZ60rE6OUkdDRxCEEmj+IEJIAGzg6V6xAvtot
 cIM7kHp1MQZ1W+Cfde6DLLb6ORQvhATLqe4snAZ7C7xtzTHntvqAGzkBq7hgd5jyQwyx
 zK6LvrXktmRRIwUKjyfS1a1w5XrCuVOGGaKxpifHh4Cv11YmQuAE6S/+nel10KBK83pS
 YG0VNIkLvR+zW593vOTwxb1phxs3PsZyJgvGEOaBz+EtZbjTLIdMCux3EVOV+lb1VCyq
 dD12CxmKAXesIavisqmV+HQkKdadQDHGm0TGBdwpYOEcrzwUWFI/0rUc5ku6A2YIknkX
 ORlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEkSvxU5xVptC5YfWZA3uuLrgbmpRlMYb+3TlD7dzkIkUil5O1atvHLYjFTr31G7ECWu1eP7jmZ/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3tBM2etxOlz5W+b+tsiu43DguD/REy6HchAMQQP2nt14pjMFo
 hj32YXiHwI86K6QAZTwvtHykouZx0MQyabsTJc9OcFP/neqt6k/H56mIGmIRTvivMFPobv2qOoz
 Jw1mSdJedXwg7DW0/1ftOE04fg4A4G2N1d98CeiDt8cVPkAXvNxUIosFBWW0HEktAxG286IT7bp
 BlDMvZTOFZ9X8TXUt6fs08OCTxfYbqSEsuW/19v5vcI/WMow==
X-Gm-Gg: AY/fxX73VY7iuCMUNNBFcwLCHjXX5I+fbWTXydvVehk90IFlNu2NbkXz37OCWH3RSZj
 JkiTCiux1gPtM3X2Q23gDfiMuMHFAFsMxnU2YMEYwBd2gsbWj40EvY6FO/bSvMZqzhjU1DaNYND
 pUFiHxaosvbt4Nuq5QiIpITATwam5WmZad4vMZ2j2h4jI6ifuutifCoBhWapwjjtwqNQ==
X-Received: by 2002:a05:6820:a93:b0:65d:4d4:e7c4 with SMTP id
 006d021491bc7-65d0ea9d1a2mr1335952eaf.38.1766191365433; 
 Fri, 19 Dec 2025 16:42:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfWlogR9xBl/XkUR0V/unvcetOQiM2J5qVYXxc3t+LBazokeb/IMmWiP8Yax26tVKm3/hUS8y1D/qy5l0k1bc=
X-Received: by 2002:a05:6820:a93:b0:65d:4d4:e7c4 with SMTP id
 006d021491bc7-65d0ea9d1a2mr1335938eaf.38.1766191365068; Fri, 19 Dec 2025
 16:42:45 -0800 (PST)
MIME-Version: 1.0
References: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
 <c97ee966-5864-4be5-9e6e-afc8a93dab5a@oss.qualcomm.com>
In-Reply-To: <c97ee966-5864-4be5-9e6e-afc8a93dab5a@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 16:42:33 -0800
X-Gm-Features: AQt7F2o5phxtrNBceCPYAwCNEcUUmU_OixULB8ukBXOVsyDFaPSHw7bt6s4cKtU
Message-ID: <CACSVV02h-51_YvtiU0yS5UEpaO7NsjBMOyfMbuF2hk6=8oMfig@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: check state before dereferencing in
 a6xx_show
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Alok Tiwari <alok.a.tiwari@oracle.com>, alok.a.tiwarilinux@gmail.com,
 jordan@cosmicpenguin.net, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 simona@ffwll.ch, airlied@gmail.com, marijn.suijten@somainline.org,
 sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: nYV_LmeWD_6maa-f2qpQ3SEmWBc77AcV
X-Proofpoint-ORIG-GUID: nYV_LmeWD_6maa-f2qpQ3SEmWBc77AcV
X-Authority-Analysis: v=2.4 cv=Mu9fKmae c=1 sm=1 tr=0 ts=6945f106 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yPCof4ZbAAAA:8
 a=dNUZgOZt_aCjTAHcu2AA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDAwMyBTYWx0ZWRfX+ShzWLONtars
 5MdD2LPKYiqsCDN1YHFugLnLZskBB3I4hEt1zukA0OHz34J0ouoBJaZ8NwV4YJapTNHpJ5qQXKH
 ZS6bi1zEcqqIBJcyQHn4A/TpBHdWw+EaLvCoaHz8j5qjMf8PLuQwTLvoYuhK5VhAldlUz8v7CHf
 EOdaG1SLkQDgJcrwcGqe0bUE80Av1kXGGkLBA3zUSVzKB6hDG+G4tQfypbtTVAjC7rFRHkRw7Re
 lu1y/70S47I9crsvd/XWbK7HrgDWVwz+udFZq58OF46qM8KYDiD9sVgEP/FtxIyAnx/QYOyBWn1
 pNJv1vKhJQEfJLZYesQ+Lp+Q97/QQo1eoJeMF7iCyU2NYE/T3WqlNB6aQq3/V4bL7iL39Fibw6T
 g0GeMMnR6VI++FfMfno4LlRhpjZ33tiyEArA9lDHkUHF/C3apW6QZu2WtjuYs1qoOqZqe4LVh62
 WHYP1DoMDpaaRQz4ipA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_08,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200003
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 18, 2025 at 5:57=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 11/17/2025 6:55 PM, Alok Tiwari wrote:
> > Currently, a6xx_show() dereferences state before checking whether it is
> > NULL or an error pointer.This can lead to invalid memory access if stat=
e
> > is invalid.
> >
> > Move the IS_ERR_OR_NULL(state) check to the top of the function before
> > any use of state.
> >
> > Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
> > Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/=
drm/msm/adreno/a6xx_gpu_state.c
> > index 4c7f3c642f6a..e408e1d84ade 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > @@ -1976,14 +1976,14 @@ static void a6xx_show_debugbus(struct a6xx_gpu_=
state *a6xx_state,
> >  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> >               struct drm_printer *p)
> >  {
> > +     if (IS_ERR_OR_NULL(state))
> > +             return;
> > +
> >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >       struct a6xx_gpu_state *a6xx_state =3D container_of(state,
> >                       struct a6xx_gpu_state, base);
>
> Are you saying that this container_of does a dereference?
> I don't think so.

it shouldn't..  but also there is no code path that reaches here with
a IS_ERR_OR_NULL(state), AFAICT


BR,
-R

> -Akhil.
>
> >       int i;
> >
> > -     if (IS_ERR_OR_NULL(state))
> > -             return;
> > -
> >       drm_printf(p, "gpu-initialized: %d\n", a6xx_state->gpu_initialize=
d);
> >
> >       adreno_show(gpu, state, p);
>
