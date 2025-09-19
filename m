Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDA9B8AEA1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 20:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B6810EA67;
	Fri, 19 Sep 2025 18:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRnz2kIR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405CF10EA65
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:29:35 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JBCPYa003286
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nELkMuG6G4b4hNEzE5++D+4i
 ykuQu225GTPV54pVjNk=; b=RRnz2kIRHqwrjQd99LcWnGKFoqNlJppKNVg6v/zN
 74LFRnDceaW9jKBreZkDEvDKElFeX749jroH92Eb0OinTtrVOK/OLHxnPyg52eqn
 z2yiikSeEf5Qq7G40h/HbIevhMsTjnvwsSXtlHkCl8eCOJ5myA94VAxTu8S02VAw
 tI5ZRPQOFDswW0M1tCn35ZNF0j49zKygeaWbk8y6GNlLGwAf0HzEX6z1J5ivyG81
 mi/zh+GtRBC8RgVZOexYC3lNhqsncw25aPQrOc4CZkbkTJ/DmTWG/hWKgV4UTe67
 +fgKPlWYvjtGzlVqaxWbVoDt/eFGzsZ0juSSyBzxc5da5Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqh10yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:29:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-79a3c16b276so20761496d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 11:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758306573; x=1758911373;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nELkMuG6G4b4hNEzE5++D+4iykuQu225GTPV54pVjNk=;
 b=e0M3v6Qv9cjy6YQPoamdu0pf1wmSmnUhKdjVrsOIaIbRNCRjA4qVr9PcDNQmC2u++d
 gJXwIaQhHOwgrOkqlyOYpsRIrF2sG1hmQXY0flSzrEG7qLFY/1tBY+vfuYvrwqth139e
 bJP5goI9zs4j6OjHdp0++nkiw/8PuuFsngbnanOtHYVgKSFNatXpWxsHVbmf9dXeyULC
 MEBDuqMyILym3CqMSfYjkZVjtDzWzpM44MYiu9hP/p3UMxiEx5+3o9FCIHY+2rX0eJUl
 l7V8V/Pl0eEI6S8iDOSG9SlJfAxw7K9cBqMgkc5RxfuHtjAVHcKrR7mtnUikI77mTDFa
 HzZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrPAIvKAV66ZtFw1gFTbmglvbc/Jp9bslBahMGOn03MQ2ORLM65DVl+k7/0Y/y59Jg1r2fISMBYH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyokmchxfvyRxMEWo4KElxwSdTWffzkumgkPffu1oHPnyMazlu5
 iKQJRFlzYQMb3SpUvMh2dIO0yEkB919JXqSEmu0Ufs8M53y8Y3ckPekWr9VwlFON9PkSY6CczVU
 256CPs8x9vrKnzk1n3WFDiggHyQ2mPOPEZVQgA5qxJXNGc4JQDK7c2rti64UqgerN2tVqVag=
X-Gm-Gg: ASbGncvqJ/zo/KDKHMRBGg1eMXJoRwlaIMVIhvEk4f0GLU46oxQAACuDLOTBzNN9/cW
 At4XISGWu348qsOpyHffrAre1pnf07O6wAvfSilVntQBgEKY1zrCsADo44u97jNe+znN6RiwQ6d
 whPqcJAiQ6SAOXaq/MSpdh1aH53kPiJyNYAwXSmObnWUTH3nB9iynJ65yla7o7f6VjEi1a4jgVr
 p+KGbtC16JDHjc4bEggYATVqJay5Eo/YikGqSIPQm3YXSYpOLCptMBC/qFiHaB63GaTi+Wt39rx
 KBxI+NtHtAyv3OCoGZEBqn+rTuk94eJSRBtqQahvEE8L9CwIEZ8WCBMVYm5W0lpiZh8j5cH0MrO
 wNsAhZwNFTITVLiXesMCOj+83ogEQharbM1ra7tMMjAmgyvsD0F+P
X-Received: by 2002:a05:6214:212d:b0:786:8f81:43e with SMTP id
 6a1803df08f44-7991a92b751mr45979776d6.33.1758306573182; 
 Fri, 19 Sep 2025 11:29:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1heRt8eGc/n23vl3sA3KqPDKFH72DXCf2ZbAaB5smb4GgH0KGIrCssMBhJrzkGAMEzwdWYw==
X-Received: by 2002:a05:6214:212d:b0:786:8f81:43e with SMTP id
 6a1803df08f44-7991a92b751mr45979186d6.33.1758306572586; 
 Fri, 19 Sep 2025 11:29:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-579ae3d9c88sm958682e87.140.2025.09.19.11.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 11:29:31 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:29:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 08/14] phy: qcom: qmp-usbc: Add TCSR parsing and PHY
 mode setting
Message-ID: <j3e7f6fqeilaz4nek2hnh7obsvjwret42dkmwervcg3c74o7ai@pz244lhrwuou>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-8-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-8-eae6681f4002@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Uk7VU4LWELNUxO6GZSTY6D7_hIOMqAaS
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cda10e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fgmTnHYI-UD6AacMZvIA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Uk7VU4LWELNUxO6GZSTY6D7_hIOMqAaS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfX7BhtBshOfKCf
 SRl2CnmDf9pJfTO4FqTb5of19F0fZcyj2DzNasf7X3ogN+1Hf3JCHJzwCpc2F9FOBLKeUc/F+4I
 U+7UmRoTb2dJ/g/1x08sQWJrfo353ei5QLx3vm+K4EuswR9GCvw0iQJGT3orTuoULshpx/ksrpz
 INMsknmmiMvy7g17uPJcpFnPEELFIZUzeVqS+sGmoyyvxCx9S3OxV5Umu+kXSHKUJyI9tkuNBnK
 S+4D/1xNGKbxmCcLyS/e7lPKPbbAq7ihDfrLNOGVh6YMWWDp7wnUgNaqczsu2GUj+LnTlFd40wK
 OABGfL7BkGTAmhmccLf1Lusf0ciotF9iVsfYcdCvE6QG0j3/sf/pfNjR8B0/3FeBgBX+QKAOkSa
 c7D41Vbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128
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

On Fri, Sep 19, 2025 at 10:24:25PM +0800, Xiangxu Yin wrote:
> Extend TCSR parsing to read optional dp_phy_mode_reg and add
> qmp_usbc_set_phy_mode() to switch between USB and DP modes when
> supported.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
