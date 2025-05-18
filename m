Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9974ABAF1A
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 11:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD1B10E1E3;
	Sun, 18 May 2025 09:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZJskLuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9422F10E1FE
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:49:14 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I0PmMs020337
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uk3XmHMtZKL9KyAJ7vLCOFV9
 j3YnYGhoaY7wPOpdmB0=; b=SZJskLuk3du1Dr5b9j+Qx/OL/HjANFbrFfMOvLM+
 MjZBpkNAfkD9uYjoiNuhUK3h84+nOZMc1L7apJUbwMCHEZgYYr1dqz7sb1HoW510
 buGK5tnwdDMPLgJutpw+xW3X2S753YuP0xmpgyTRkFLrvok9kf6oLNi0ErF40cx6
 Ayp6ro+LHOtpCC5yahNK2umqdiONQBThK8Kn2gVivkhJ5igg2QyzvHiDUozfcgrI
 t8m9pIX0PVVlM6zmCPnxLgnbr0pROpTpkyKpAKWoKbmR96P+t6eNSlikNFeoVKvR
 rbXnMx2ucGqRZOj3wK2uwBdz7C8pRnUNZYrZyTvVng7ypg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsst0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:49:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8c9552514so15992416d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 02:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747561753; x=1748166553;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uk3XmHMtZKL9KyAJ7vLCOFV9j3YnYGhoaY7wPOpdmB0=;
 b=ryraaNnm+VQxf5f+r/OhVAzQWwDEZfwyxfLZZJCBdmGSmKv61axQWQ44mvSPQFO5lQ
 soX62OsgJS4EOVm+m0gjfXc/5Hov+vc1m1BbjKOZosuE0bxLyKar909QOTigPibIBXdj
 HSmA1KzEdCRP5/UtPgQB87+LSV5emvBcqIlSqbkdiJJLOaCHh2gHXelrflDlT6F5ZFZ0
 XiQEDd0fyLW70kjWO0IEwOJ4J7fTAivvTIRDMwsUt+z8ScOQP1M4M4T3lAr7GS4Kr7/d
 Wd6kqhEWpYIW+pzIOgxUFZXGUPszROnJpOA95FhSOtkoKVHCOzsmvjADN3qjChU333xs
 WKWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcaPc5wcl/dO1I2c0TivtZthN706saQTClxC/lMCRZxWu4oLRy57xQ678BUNDHE2F0bP9vTMweI2k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsZf96l1wqTbQ6toLqcE5/mBApmvAj6t/MjCHWvVZMNIBWKej0
 vkKDfciTMlvW76cAmEexQ4ulQxq5JyH1+vW6p+hlKG9LC/Up9/sNLZOInk1QiMEvr51jKUjepRd
 QGSJcnJ6cOvlpdbjYVzG5VIe/P83CofdXT3jyhGlxQVInwMYyVNuWxXhZx82UwFGAOY41qzM=
X-Gm-Gg: ASbGnctqtBiNbRR9p4RGjomFjlJ9N+MiAe5Vhmj0Bpfn0J34d0YN+P7K4DPclolvCBB
 TD/Hh5NGdzm4HOccrNNWWFj4Dqj7/GuXpzIGdPpsEgHrOooLM5ESsLZcd6zmhfI6paJcbqMkjSy
 r+OLpmW7K1gqeNRZAC8VTeVpsWlAza7K7/JTqzgHebIvemLhdLVlTtdB+6Ks0oxWU2YGNA5m5iW
 yaJy33GBtKTpmy1QoXba/MSQCcqnJu76BQDUci6wagpNkeEkR3ozh10U09zGQn0Vrsm0/fply4J
 JyQF3fqBWWw1nHYEL/cMorYZYmok3rYKEqcnGWhN38LHyK3arNDrY2uxpPh2Rxl5E4GNz4JivA4
 =
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id
 6a1803df08f44-6f8d03572a0mr30939176d6.15.1747561752731; 
 Sun, 18 May 2025 02:49:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB6cOXuCp6Ea8OwMdD+YYtA9uX4ETpwrWWSJ6+rASNTDgvLSfjQDY3rF29CklGqPF6j+ijsA==
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id
 6a1803df08f44-6f8d03572a0mr30938976d6.15.1747561752424; 
 Sun, 18 May 2025 02:49:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f16584sm1356425e87.44.2025.05.18.02.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:49:10 -0700 (PDT)
Date: Sun, 18 May 2025 12:49:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 09/14] drm/msm/a6xx: Resolve the meaning of
 rgb565_predicator
Message-ID: <6shba2twwvusoud4grdmagparzg7bostkhqnrohscqd6bik2iv@gvp6t6lklyk4>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-9-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-9-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Z86TUXFaKDKE5Nz0lcPKuUbbZCVyE4RY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfXxLefxuFQeadQ
 fxcIDQBDo2MWfxZ/eE0dxAMugUx5QSTJx6a5Cw5iWdeIPb4lZI8IpQdRHZpOEzQrfg3c6hBCMus
 IFy+oQxNBzgM6/QtGWZNj5r4mZQZjG0N71qFFPo8Zehe8JhVFRoyI9xMF2oYWjRJ2BADK7mrhgi
 cYxEJmY4cpAJziY0sULDEyax/FBeAsk139yBZO5lwN44JVctKd/Fsc2EPVxW6honFIjDJK1yd2d
 x7pMrf1OW3iGcWMWjiYG3ARtRtO72bu14KA6CfX5aOFluJHpwsbl7RUIjNx8bcndhjaHCSfAYzu
 uD5K/0gwd75sVxZvRCMtekHPw1sbDxiKi8FH+YtclEuPOyr5URPKBai1UqkTwOiyI3yYEhJezUE
 W2Ffb7EWdjv1CuQ9V5mNtL7GfuGDlXqPcEDMAZWSP5sAtnv5lgNd1oFZJ1v9ft/6xQ4mIYqu
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=6829ad19 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pZ1cKns8_n0M6c_4lVMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Z86TUXFaKDKE5Nz0lcPKuUbbZCVyE4RY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=860 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180091
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

On Sat, May 17, 2025 at 07:32:43PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's supposed to be on when the UBWC encoder version is >= 4.0.
> Drop the per-GPU assignments.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
