Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEB6BA1B0D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 23:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA73610E9C3;
	Thu, 25 Sep 2025 21:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lbaTtvra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503F210E9BF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:54:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPd45027613
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=V77Z5Ho34wRfniMvExHw0L93
 ufuCYBEpuq3QobQDp/w=; b=lbaTtvraUQayXHdkdf/MuJVtN5609Gsu2GmI7Hb5
 gcfmYkWM5XUxTaHzt5TGMeg62HIZfX/rsZsKHXsV+bvLp7/Lg1NzvLWH+A2qr5a3
 Te/HCFlvsOOpdA17HBEgzTCWJs8/NVckMd0WiTCBqWQmt1KAbOgqMFik0OrlorwN
 9JdyOiLjKtR6nuxbgY79eRKQcWfD4m1SPJSpAUT1xz+cRfWkhxo9Vds/RVO+cVkv
 0Hac2LP0/f7c8CiSClOfSAPsGWkfn9/u9UEExcTMjLHFu4ooSlo3VQXYwQL4AAgf
 kctlhSr8mP/DTa4Hhv14X6I99W9gLs451RIRgfumhDJ/7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0gaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:54:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4bf1e8c996eso30693331cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758837254; x=1759442054;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V77Z5Ho34wRfniMvExHw0L93ufuCYBEpuq3QobQDp/w=;
 b=XYtkSt3/BKIJaLn+70eEGiHdd+WTJrH67PMhXfBvHi65Qswpglcjj4437FRIIVLvNM
 7gw0KRgigvaK/5TsMyEoJY8N65QLafJvT6tKMl1uMOPvH9ZMqRwqz1m2b8IzGN31TNdl
 u8hT6C6VPd+GRECIdLpaRplvMpCu6SUkUhHPZ2h10fxTtHB+P+AKxXtpmabpiWbfEd3e
 xizZV4/gmZr4PsmdlP/xoXhs7ZpOx/HcFDz5djadzUnIB3s/+n1GA9inLYEJ3Ztykopp
 riPHUKdDkogM/N3EV9jlv0pLNdULbuqBIlTqjkq5Br43GIRmyoxPyNjURARXMOH50pt1
 IS0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr0lQz4/h4Lexh3gjbTShuOl/Hvb+3q4XXP/LA5Js5fwXLglMMOlTN+g6ARV9E+Z1iq5oXxtIe4fk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqSIzKxSE1Ngst26h+e2mTiRWiANs6ggzrZUL0+beCmrMy4ViC
 CpeMXoZbgULBm6p8bqSeiN0WjEGPdrxWyJMXuVvoREH/H6MqE2kcNYFc8HutZCZBI4KkBpwWMTF
 iLqjMyzIBUfrCbickI9KPU4V0MUC3lDWpdA9ASwTP/PBiK3r+7UjkgvUDLZK7sTPyQc/jfOU=
X-Gm-Gg: ASbGncuXUGXLtEO7CE6J/WuTJcYYpbTejzvjccYln+FhRTTLs2sY9XCFTigpukph7eP
 gm7keM9d7V/7xEeHoPmwBOwLdFDC6IK++Nb2r2UXZ79smzeTCLuXwJneCATTdahQkLAM1zb4Uf5
 iiz7SIs30lPWoRHVJ2XqxRTa2Y8P6vMlihPoFyx8X/+ddNmnWaecwt0b987pjVjBdRd+KbRepPp
 BT14QuBjPzko4EajFReUZsaZ5iOklvoVGzjDTE/FztO+bSB6dUtEmQyyEsK+f0vcZiNG51Kh5dk
 kb962PkSAEv5rr/3eYJxWV5FazddkUyfFEMnpzVI9P4qy548/7DRy+bRSdlvVS6hLJof/iBwYPO
 +rpRsJ8Q/kJUpNhm5I11Nb94OX5HrAVNPXVftNULT1d/kNPiNNzKK
X-Received: by 2002:a05:622a:1a0f:b0:4b0:da90:d7d with SMTP id
 d75a77b69052e-4da47a1a220mr67870221cf.3.1758837254452; 
 Thu, 25 Sep 2025 14:54:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyFRxoSrrZVyL5ZFN8zm6WyGWU2qPELuXqbOoO1z14tsOOdtn0pbtF7AxjejfvrN1FriBxtQ==
X-Received: by 2002:a05:622a:1a0f:b0:4b0:da90:d7d with SMTP id
 d75a77b69052e-4da47a1a220mr67869871cf.3.1758837253974; 
 Thu, 25 Sep 2025 14:54:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb4e38b04sm8222961fa.15.2025.09.25.14.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 14:54:11 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:54:08 +0300
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
Subject: Re: [PATCH v6 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
Message-ID: <d72npzj56ng2lxsmbmu2l43ebag4cfyhou5322kbpsutn3nwwf@oi5ibgajlfos>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-5-419fe5963819@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-5-419fe5963819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX39hNJ4h3Izva
 6WcZvlbrSKPyTZpt0ryWKtC+RntCTCR9gd+Xb2KKQLaxaQOOv9NAEsSUc0rETxtnU+8SQqnFyNO
 TTXdPC+bpncbV4WjEsWkyd5Sere682T6pDD9XuxLM4Ocq7lFBSnUCR9RN3DDV5rT38q3OowDSKu
 fiYbz7pkIJlDJsDawfFbB1FVDDAzCs5L1dQnBGNHjJp3vYjgK6mAeCYQ0uuqh8n3LHMZ4LRwBzk
 Ia6dq/P/wW8xxcWnpgXYLaJsbZ1VBcO/4WuCK0WR9hY4G0ftXkorAv3WbQPZvtyrsioxGoumwRh
 3BtPoXRVNjpoPj7DWOuMb+sC9L2JL+AWyZ8eLUyT9TVwGTVZNdxuVuDYpkXeGeeGNOXaTNy9ki0
 enRCOXBscIz0NqpD7BxQtmivNTpmsw==
X-Proofpoint-GUID: RHkTqQCceonx0A9Lswp64-Ub1nyUiCT1
X-Proofpoint-ORIG-GUID: RHkTqQCceonx0A9Lswp64-Ub1nyUiCT1
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d5ba07 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VJ1vJixsNvIt-2Mg1ysA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 03:04:51PM +0800, Xiangxu Yin wrote:
> The original reset list only works for USB-only PHYs. USB3DP PHYs require
> different reset names such as "dp_phy", so they need a separate list.
> 
> Moving reset configuration into qmp_phy_cfg allows per-PHY customization
> without adding special-case logic in DT parsing. The legacy DT path keeps
> using the old hardcoded list, while non-legacy paths use cfg->reset_list.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
