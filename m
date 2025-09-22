Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01708B8FCB4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 11:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DA410E194;
	Mon, 22 Sep 2025 09:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLQ6+NuC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8287610E16A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:40:35 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8vCd0010120
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hj4Upp6DvQZMXvyU0WYeHHC7
 m3sQ62ahNFhZ9X5v5Eo=; b=RLQ6+NuCiPUV/W2JulyLLZL6rEnT51TRuFjybdHd
 tkFtkdlQJASvNLju4ImrI+Y1E+Zk45K7z6vcnBJWtoS+MtjDj80cqbJ4qubWfuUf
 FBsbjyzvU/nGHL+zuxQjslKcwLO+ohd4L9CWfFBOT6JfD5hw4kP9CH8S0fLEUue1
 hO4xFWEUOhNm7ov69+ut/ZOZS9BIAyX3ovHXOagvcikYF7Jbnbcmq49pf52DKaHi
 Kb5O7uDHt5aUBAB5QjrMv49+B9uHO2hLZoyvrtkSTAB2lu7DYYfS7PV/upznyikY
 b8Tk5sDL5qrrVPe79ijAYvccl0gEUYkqAvhX46zXuahbvw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnmh6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:40:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4cfa9501871so5541481cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 02:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758534034; x=1759138834;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hj4Upp6DvQZMXvyU0WYeHHC7m3sQ62ahNFhZ9X5v5Eo=;
 b=JL7L4SRvZT+t655wjqc8a9QkZ56iKoIx/77Wzy9PqX5t/WUSLaQYDrRnWdzFngxEaL
 OyrvDOKcDOLUiTQJutoyEcoGvEclBWNVS18LtghdjFSBO78KQ0SX5C8KKEZd2x8huXc7
 /W+yJ2nKjTQGNOaFRvJI8r/ZzAiByxVqH1jkLi7wvWm42eNin7x5PoUQpd+Q0k02bQ3G
 btZDUP9+kmbOBZnxg6jviQGmybVifvbOamEibyeSLAADRbu0zgFIcPx17z5dmzTY5Lh1
 IMjtXQK2fLj30zkkXNwPB1J8mgXMgDz/dD091B/psZ/fBLe6MEPDXkBfvfNc2Ku/4hWU
 Kjxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXLHadVdEM7kkhrhlwhw7hNgB8faZZZhD7C3SM2wRWzrV00p1X+k7uAECoe55g6SPABW6Hul1C/eE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5MPKdRHg+iqoYnUrPbVHoMgwHQ9IVeXP1Gsl1/qndKAUF2FMO
 n/0W9JAiNOWclR1h+aT2inUFu1Ns4N9uXgM+l2QyU4FmNPHmZRjZRKsnKLighbHRPSr+pZfA+sx
 rH0HfyeJEhsqlcvBryE0REJGKoqGbFg7JnBk4WbyLBl/U22q51oIJrDA1kbKKxpQ1/TYiLyU=
X-Gm-Gg: ASbGncvIEy3+5ZKZS/j3UDxZZ0hQEMYy01tOsGIf3RLJG1IoVwx+D3nDPr5XVE/OljX
 kZ+vsYHJrG+DPrWRItZyW+0m5u86zPeLKLvTaLLnbhEgBeRUlYyWYFEvRzuXKKhGnG+H2KiMGuk
 uFseB3+U/h+8tr8c7ChK9uCSLkGj+lEB/N9jSVJnB1PAQ86MmXPZT4VMvEc1q2QCescjhtWAutQ
 iP3CGfVG/efRDmcLYiys/j4P96n5WdawsFzehmf5r7iHgBWiJNfqs+z88eCnAUbmOKWbtdLfOuw
 FIAKH27wF+yv3LpwJXE8YPRCKwsbfqvh3spOTD4uXNVmWJjD/EWCHqt9mIm7MwxHE5ThTfYCZZ2
 redKYjUtyIS2e+dGVY5ooL7QTKQ+hG7pft/IfmIspUCNVx2vJHDOX
X-Received: by 2002:ac8:5a0c:0:b0:4cd:ff33:1ce7 with SMTP id
 d75a77b69052e-4cdff51a4eemr13103101cf.3.1758534033771; 
 Mon, 22 Sep 2025 02:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELhFuWdjsYSdj9FPHM6ic0X6+DJCEC6Pmfu51Xrw6oDaWX8H/IWt6E6CzyE1gUwe2UoHrcGg==
X-Received: by 2002:ac8:5a0c:0:b0:4cd:ff33:1ce7 with SMTP id
 d75a77b69052e-4cdff51a4eemr13102901cf.3.1758534033229; 
 Mon, 22 Sep 2025 02:40:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57b9545a8f0sm1561000e87.83.2025.09.22.02.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:40:32 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:40:30 +0300
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
Subject: Re: [PATCH v5 06/14] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
Message-ID: <we6q6eg6ho4hvf2b6ibhakoxl2gdph6siokkgvzrnpp2iampl4@xomenqunmssw>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-6-eae6681f4002@oss.qualcomm.com>
 <xtosrpz6rzdvtmpyq73gboeckl3c2x23iqehlxzbaszqmzugjd@ixhj25qujqxo>
 <d09b2b45-3ca9-4808-8ff1-72b98d6fed2e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d09b2b45-3ca9-4808-8ff1-72b98d6fed2e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d11992 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=o0wnlFsxEizOfUfN_0IA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: wkyqSYAXeiR1v8TTI-hT9X5AZCpe8bef
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX5RsTHPyr/NIZ
 KafqW4OpPJZNUYoH8rz1qUaW6/7J3hlIL2ay7xh1VrpwlKQuN2uHs50KniVnWlXVBkPyq21G/Wr
 5aVT+ngPT68R2/LQz/NcIRW8lnBIIGWXFFWAS1bfCvSxm3dDF/wuLwd9HR1g8qKSevzHYFu+gzu
 LCPLV8DIPHwDezGWB1iBKn9nqrelJOu/mTNadofRh08xysai7bVjBw2XvT4+ELeNfIHIdttyJH/
 DGsoFbSsZCPpPz3yOkL3dvK7HAMDbLy99FUycX/fkq5/z7u8Y2w9pDoQJwaMRESETfvdp1YAeCw
 JklmyyrBlGzt2BqYqlkK3R43BpqYV43sgnpp8cypP4Kd1HNDWCTFJ/Gh9n7tqw0+KysyxzkBcDG
 RQLYLKLl
X-Proofpoint-GUID: wkyqSYAXeiR1v8TTI-hT9X5AZCpe8bef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000
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

On Mon, Sep 22, 2025 at 04:26:43PM +0800, Xiangxu Yin wrote:
> 
> On 9/20/2025 12:46 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 19, 2025 at 10:24:23PM +0800, Xiangxu Yin wrote:
> >> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
> >> Extend qmp_usbc_register_clocks and clock provider logic to support both
> >> USB and DP instances.
> > Why?
> 
> 
> Shall I update commit msg as below?
> 
> "phy: qcom: qmp-usbc: add DP link and vco_div clocks for DP PHY
> 
> USB3DP PHY requires link and vco_div clocks when operating in DP mode.
> Extend qmp_usbc_register_clocks and the clock provider logic to register
> these clocks along with the existing pipe clock, to support both USB and
> DP configurations."

Yes, please.

> 
> 
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 210 ++++++++++++++++++++++++++++++-
> >>  1 file changed, 204 insertions(+), 6 deletions(-)
> >>

-- 
With best wishes
Dmitry
