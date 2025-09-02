Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BD3B409E2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC0A10E7C8;
	Tue,  2 Sep 2025 15:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="luJbMLL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731D310E7DA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:57:32 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqZKc024617
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 15:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=TREnSWpfAdWrhmOtMgkCSdJYlV1MbSdoxyYVKxg6HYw=; b=lu
 JbMLL47Ftx9g9Db4lqWD1qbEVabosqCPd+0Qr/JAi6TePDUU/GKbTLq894xe1JKX
 WOHsWP+nlfxuW3JHRyx6lbHkNeRejs7DbeZmIo4te8gF/spHIzDCCoH2biGydJnT
 CMjIbhLCbdCCu+j9H5VDPslhQ0AXdVx3AVVlRVwSv+DGX/UhTo4/+Rd9FnlNVAe2
 5XUo2komMoOHF3B6orvdFkAW0kDOc3pkTQnO32l0EvBc0WWjmEsC7wYYHmGRmnKq
 5OrDadHtvq05ukhB++lLHUr9wQuEsC5fHr3EwzAr5PFA4kqs84gy76CI8sQD9ghw
 5LLP0Lwf52ooGiIRulDA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush309cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 15:57:31 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-435de5ccae6so5405336b6e.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828651; x=1757433451;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TREnSWpfAdWrhmOtMgkCSdJYlV1MbSdoxyYVKxg6HYw=;
 b=Hd9l1PUBOqDxq+usJ69e7Ydi7Zk5wPRTcCG4sN//z9igkak5dkwM8Glhlmoy84uNsg
 2JOcm6rVn9EwiE/WxuE4FXJz3GSEXLSzCdmoS1spU3kVZ4furOzCijaZngUyqntDULiS
 AUYeCf7wckJkFbSrq5YJV1B6vGjKxE51sc2fQan7Tso8UnIvP414XttynptlRrx28o+N
 kd+3+TuDKdduazOtJpZ9kNeJCbYSN3UrfWOUrvQWEbFulcBQSZmVhd483JuX0X4wGVLU
 Izn246+202uJ0p+5XnYAk85LpMK4yX7BaARR0NpF3Pht/jwBLACvTuLx1s4Ib5fDQofL
 Y53g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0VXoBlKSDfDmWIYj7TLGXaUSTNeWfOIbj/661CC/tx0rkp158+g6mAZq/S6PHR3OyKav617nN8II=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCnjEJzCWT7NkHTGoG8DFt6TaY8FR2YHMgQILHS7ZqgAQ08q5C
 5qvgKNlxOXg+SD7QRFSYUbREjMF6I4FXv+MfdkviCbaumHmZjcQD8av63ICJZeCQqMXdCjqOgEM
 tRtqgTIUIUQf6GpoRSPPXaTEg+fqrjYsoM7kWhdlqcX3fnWQTxQsHBQV029DRYUHvuwuMAsuvsZ
 8jimmyGvMIRt1Ck2zieNsRV9X5SerMzulcNjugqrAshYpdNQ==
X-Gm-Gg: ASbGncv7Vdr60XKvNORFUJpcJhB2XoNznt3/9TNnUSEveJdo83SByTol/B/lF9KeLFe
 tGUBPeepkgilGn7Nm4/ti5bJCBb54/xZaxp/F80UYqvuq+9FZvAkKagUQQXw4RAU4sfLSKqMT0i
 6ELUyI2H4QTODLqxKRcmpSSCoFMAaPe/5S7ntTXyDA4/uei3xT/w4A
X-Received: by 2002:a05:6808:152b:b0:437:b10d:3b46 with SMTP id
 5614622812f47-437f7de1519mr5637669b6e.30.1756828650806; 
 Tue, 02 Sep 2025 08:57:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYnnQDfuHV9n/jWre+x5H5L+i6EA8p0glanc4jK3wzaEOdW1w8zr1QPsTQkge73XmH1NyXNbBSBZwJ1vwOsTc=
X-Received: by 2002:a05:6808:152b:b0:437:b10d:3b46 with SMTP id
 5614622812f47-437f7de1519mr5637653b6e.30.1756828650361; Tue, 02 Sep 2025
 08:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
 <694f0989-64ea-4c3c-8613-863da1dd286a@oss.qualcomm.com>
In-Reply-To: <694f0989-64ea-4c3c-8613-863da1dd286a@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 08:57:19 -0700
X-Gm-Features: Ac12FXzQPwDIUy_DiVh-kEO71EFonDrLLU22HZlou8nVFBUUUe2guiMPv6umOuA
Message-ID: <CACSVV037e-GquRk7P1_qT7T4HF=f-TF93FpJ16NiKShqicaCfw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Add a comment to acd_probe()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX3iZ2mSTP8/3d
 lvtku0FhiO8eDvjoMZAvBMZZfyIxzrpgfvRNbe5XpO2YxI5aQsLxIHIgGIcJBaM49z3xJg9x5jj
 5zAtNLHiwsoSAiYPUJBQ2wzwu+8sTkHx6Mf2TlT8ssfN5pk1kyoLIyUgeZFPUnzc5Z4pIvWfQoP
 GbvWZUEJrmyzOXfz/+MgUSm8FDirMiVpt2JFLVIONfg0aSgqyi5quD3s0px7zGAfFxSkViibg/W
 Z4jMPxO6IGwFq3AZoCHJlBZkAtbzpLjljfBQkwdhC7AVNlG2Z0M9tXOX7r4WYrbdpmKa4FVyBPB
 To4goXdRY7aRwDeyl8331mwavDCvlraqoGXu3aaZbXOQ8L6zh9FEFs8vIas+mTiw8x323hwke1D
 XAhx2hXq
X-Proofpoint-ORIG-GUID: zJj0OEzuQZIyxb0lCCPRWbInJ4e7kfsc
X-Proofpoint-GUID: zJj0OEzuQZIyxb0lCCPRWbInJ4e7kfsc
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b713ec cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=ycJl_s5THFxdJBPSnQsA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
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

On Tue, Sep 2, 2025 at 5:33=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> > It is not obvious why we can skip error checking of
> > dev_pm_opp_find_freq_exact() API. Add a comment explaining it.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gmu.c
> > index ea52374c9fcd481d816ed9608e9f6eb1c2e3005a..de8f7051402bf0fd931fc06=
5b5c4c49e2bfd5dc7 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -1694,6 +1694,7 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gm=
u)
> >               u32 val;
> >
> >               freq =3D gmu->gpu_freqs[i];
> > +             /* This is unlikely to fail because we are passing back a=
 known freq */
>
> This could probably mention that known =3D=3D we just retrieved it a coup=
le
> function calls above, but I suppose the reader can come up with such
> conclusions

Also, I think s/unlikely/not expected/ ?  "Unlikely" implies that it
could still happen..

BR,
-R

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
