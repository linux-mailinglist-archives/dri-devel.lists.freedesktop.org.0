Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6F1A8588E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 11:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6556910EB52;
	Fri, 11 Apr 2025 09:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxOlhV7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0925010EB4B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:58:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5KZqR008265
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=k+idOG9XotOwye43x+aZtsKS
 o5apYGkMFeSNzvPXUCA=; b=hxOlhV7v6VeJG+N0YGvU0gjoBJF6Yn4aA71CxGUC
 GYcp9uaTYZ8g29UzU0rmK5BJD5j+vDiWoU2KJQ46ld+4CGyz7s+SZabxzo5R3wSi
 Ybv/BUA3LcQp9THEOZFRn3n3IPkjSHa5cSAkHy76P+LvG6kcHQGxPXU2Pgq8SdsP
 jczEm4Ovqw4/QP6hK6qoqFkgUWoahjNO4yrGpR8RoiQc9caWBFo6aQ+weEa4JQ/8
 W52HPqmzJp4os2as8dyTd1cMESCp51Z0MYBw4Gzw88QkuzRzj6Psk1EZFXXB8k4S
 bMvgexwmkHI3S9tQw2ot1G8+Dnv3u5Wvj+/WusbdwCXL1w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd0a4j6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:58:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-af5310c1ac1so1229656a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 02:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744365480; x=1744970280;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k+idOG9XotOwye43x+aZtsKSo5apYGkMFeSNzvPXUCA=;
 b=XwLxjV2R4U38HuTRNllTvce3McXJfAZHfZuNdqqtFgGrUYvp7IUzj/7Ugw33G0z9pj
 stVBd9E5Vvt5y2M77U6qoOjo/9SyadrymdtTATILHawdF/oB/KAJ137VgjcsZUANtxOF
 8SZRHQMS96JwBgvteEhvrF1DQvtnIyXiNuhL/3hetof/pp2RtbAMGgUvLA5oH8ggoBPO
 ZyslW11OdQ0BGGKW+EdOrE+xNLZw0p3j9J+jtLPZ88PGjBOBAfbsEvOFUxvH6027Ledg
 dNt+4mteWN6X9TiT77BkJzpFR6wO+QaiopX0+JlcZjdbN23NX3cJQV4R3sD2LOOgLfy+
 DwUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOoh84eSuDj+1XiXXymT7DAS8pErYLEpIA+OKjq3j9TCs2R9LYtlkJn3NWyX7awAdSOJqGo1VqFPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxuc88c2uJKwDCzTwT1OXeDpgKuUJfzkkadWa5daALXbYPn4bTn
 ofVz9HUfLiofGJG/MIymUAp1a4oaG3XEAWWF9wbdyQNMpWnwyMbG1Xgpn0TGaJQrZ4n/22TECzm
 O1pRuGRubpOq5fF+RSmVs3tfD2JPd1hynEQNv4E2d7FbuS1gjL2jum/HjoN/VCqx2y831deklGr
 uOaKFpB4fhPFzpLg0L7VUERT4e73/NplUSasEGy60Gyg==
X-Gm-Gg: ASbGncuqelBxEJIu90x4jS+TENcik5VvsTaj3HTwsnAVwz+aG140Yucx242nH+uNNTy
 7kwQz5PTbLR4QTZ7Ptb+uMoiw+qkw+0hB+yrE77WZlc1/fdbFKPZPHL6YRiclPrDRRPl1
X-Received: by 2002:a17:90b:6ce:b0:2fe:b470:dde4 with SMTP id
 98e67ed59e1d1-30823670b3dmr4001695a91.12.1744365480558; 
 Fri, 11 Apr 2025 02:58:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI1n5Z8D5yvjCWkAaXY4/KGC/DQqzFnZDGgKLa+mNp2DTPuSUov3tYEUj2t2409SXNjrimJVcrKkNOiyzN9oY=
X-Received: by 2002:a17:90b:6ce:b0:2fe:b470:dde4 with SMTP id
 98e67ed59e1d1-30823670b3dmr4001658a91.12.1744365480147; Fri, 11 Apr 2025
 02:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
 <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
In-Reply-To: <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 12:57:48 +0300
X-Gm-Features: ATxdqUEgh6uca37YjS4OleFpbDuXY0MPOwXUGWqzyIIRj2finACospEgxJL2mn0
Message-ID: <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 6fl83vOLwvh0HFTHXSH2oYk3yNycOjfw
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f8e7a9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=EUspDBNiAAAA:8 a=aDpUdPclnTHmp7_NnesA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 6fl83vOLwvh0HFTHXSH2oYk3yNycOjfw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=895 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110062
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

On Fri, 11 Apr 2025 at 12:49, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/9/25 5:49 PM, Konrad Dybcio wrote:
> > On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
> >> On 09/04/2025 17:47, Konrad Dybcio wrote:
> >>> SMEM allows the OS to retrieve information about the DDR memory.
> >>> Among that information, is a semi-magic value called 'HBB', or Highest
> >>> Bank address Bit, which multimedia drivers (for hardware like Adreno
> >>> and MDSS) must retrieve in order to program the IP blocks correctly.
> >>>
> >>> This series introduces an API to retrieve that value, uses it in the
> >>> aforementioned programming sequences and exposes available DDR
> >>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> >>> information can be exposed in the future, as needed.
> >>
> >> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
> >>
> >> - SM6115, SM6350, SM6375 (13 vs 14)
>
> SM6350 has INFO_V3
> SM6375 has INFO_V3_WITH_14_FREQS

I'm not completely sure what you mean here. I pointed out that these
platforms disagreed upon the HBB value between the DPU/msm_mdss.c and
a6xx_gpu.c.
In some cases (a610/SM6115 and a619/SM6350) that was intentional to
fix screen corruption issues. I don't remember if it was the case for
QCM2290 or not.

>
> >> - SC8180X (15 vs 16)
>
> So I overlooked the fact that DDR info v3 (e.g. on 8180) doesn't provide
> the HBB value.. Need to add some more sanity checks there.
>
> Maybe I can think up some fallback logic based on the DDR type reported.
>
> >> - QCM2290 (14 vs 15)
>
> I don't have one on hand, could you please give it a go on your RB1?
> I would assume both it and SM6115 also provide v3 though..
>
> Konrad



-- 
With best wishes
Dmitry
