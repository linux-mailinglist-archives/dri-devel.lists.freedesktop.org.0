Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8E4B8AA07
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 18:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0846010EA56;
	Fri, 19 Sep 2025 16:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+zIWkYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0943810EA56
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 16:45:34 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JEocJV010955
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 16:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=C20ghaTYz2z07OewDUW3U9kP
 PyChf5ZskPTDdANcg0M=; b=L+zIWkYX2CHEXD1IG7LIUWQjC0kQ25fACtMvwpbi
 OZboAtLm0n3MKd/wqPAgbMCllkaBCywR/c1UNbx1+bk1upwTi5krAOiY71qoc0b2
 mivrON5KmSG3KK97wOSVX03BecCOBLMcWCTd47sVdojrmDgixGdUsvzoIh5GLaDm
 aJVclV883owgqTbbHMTb+uPs707N0k+5UoKpuhQr5EqDLQKjYj5jGRrfrQJsVsTx
 ji7qbLbGiKr67yB3KEJIZgXwx0mG+6sRoNFTnbeB0NUw4vBVXA48aV6Hb2Gz35D+
 RY8MC/gjrF7wxU3T1isgVegs5peQSApRmS6bTSj9bGegVw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy32qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 16:45:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b7ad72bc9dso60082891cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 09:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758300332; x=1758905132;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C20ghaTYz2z07OewDUW3U9kPPyChf5ZskPTDdANcg0M=;
 b=bmD210PCyMreJ0+ZrCxzftbeLj08T+FmLiBQi0+SaN0ik9/FvnW/g+1Qx5wMMHwqEq
 K8R9eF9bSAlz/bQwYmOyako0JueKEp4KsqV4NFsi8aid5TuZyw1aZRw6ziFB9bVliix/
 hdJkr0v6vEGZLPNiwZCm9MV3/3hniDeaiaYW3gJlNyxfkp8D0XvX/l2x9Wrd88n1NMfo
 EYq/FMsybkV8q9E6lOc2YPCH4n+AAZp9ssw5O/PGhY0nZM6G6rEX6QU2iRLZEmy4+F1m
 mlDDN1EiXqURatLvvScAPfT3lS9w3s5Y+M5SRBSihvSZ5VKFpkQ+plfasr9ZiHK74tCS
 1paw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFLEEfY2L/F+YJabSLLb8I7u50Byj5gHKtZOI795GlIWa0/WlSO7ciGkYvpVTHVxvcgtHIwA7hH5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp8u3u4N3rBdyXtHKEZi09qEzx/Wv5EWa1AxiKtRN+NRNJ/peQ
 zth1lZoLWgNPGwac80/xU9VU244vzO24LkI9148ClQl2JSCCWDd2+mnJnfaochUtg5SYUsw75qa
 qYlO+rClQ01hO8CyuU6Yy1wxGJlwqZ5WTsvNj4DBm+IEHH51epkkOqJPTcQ6Xp7hxX7ASODE=
X-Gm-Gg: ASbGnctzMBdbnoTcEensFyaXikfQBPHJ6vc0n2+omBQkHu4qu+hgXgWLgEwDUhQmVky
 4MenjqtsTTsc1tLOJDEUY/rhkwPh6yNwpePH8w+uQoM7z5XJPYGKkh+WJDG4SjT1O7TM+2WSoDU
 afnrgh+URUAFbatag0R9qfb9F/is4Mi/JWyYMRgKhQiyx35/+ycLQgOnKzYiAGHdZCRiLNiUrCy
 HvmJpvQu0XJcrk6xoWqQ4uXSbIaXcafjc9vROICc1ZMGfHBW220rriPV/wlF6m1iSNLwbm0EZO0
 oA9pSG9ZooxLvdeFXVTDkN5InG1In3irV3eTSXGoSp9MiwtaezLf3He3WLVTr5K4O5Pv8hZ7Lkg
 vwMuTLMQjPiYIWgPDrLlSECp44H3ZY9yzzIOU9JJRgXmbvixoPKS0
X-Received: by 2002:ad4:5de6:0:b0:78d:72e5:4309 with SMTP id
 6a1803df08f44-79913f8ccc3mr48541746d6.25.1758300331948; 
 Fri, 19 Sep 2025 09:45:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENMkKKG2cQIkLe25WJp4a+nFBl5DjpFFzclGB37kCIW8D1f1msQ+H2z+bjyqDP10qr1zJDzA==
X-Received: by 2002:ad4:5de6:0:b0:78d:72e5:4309 with SMTP id
 6a1803df08f44-79913f8ccc3mr48541056d6.25.1758300331184; 
 Fri, 19 Sep 2025 09:45:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361a26cbcffsm14030911fa.22.2025.09.19.09.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 09:45:29 -0700 (PDT)
Date: Fri, 19 Sep 2025 19:45:27 +0300
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
Subject: Re: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
Message-ID: <z3phuuokrhonbukct2siz3ujear5ymtnoviea2epxzvjdmsvkj@w4puf4c44tmk>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXzI/+61cvinAn
 WTJB7fn7P2DfGS23p0VQUhRvV6qXn7f3b5o1BiSlogkpXQcO6s2ITZpik0fFd4A6DVG1CNpr5DR
 u/1yNoHCv7UQgzPXH88g7R05ddGK8cendYUk7QSjPbogCeMYXORTivRDE8SGc3z1DcRilEeX8vy
 Ly3nDh5mitqh7eawdvnRrY8uU+4Q7mER6swDPDhBCZnkZhlDn50dqk40F7seU5ufopwxWR7T/sa
 ihD6vx4EszioXY4cNMhgKrOaHNqKtcYiA4403uPNd4eRu2GLabDkqOjZZpjclFv/rAas00CyyqR
 o9sSln0Yu9yMH9jl5pzurqWrrsHq1Z4S6FKyE6LszoHz8BNeko0e27NTH+dbC1nASlySVFmtzgH
 YreBz7t0
X-Proofpoint-ORIG-GUID: M8B5C-Rrm4zsechnjrNnb-Nc9p2jl-1A
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cd88ad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_hUenYmi4SsfCOKiixMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: M8B5C-Rrm4zsechnjrNnb-Nc9p2jl-1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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

On Fri, Sep 19, 2025 at 10:24:22PM +0800, Xiangxu Yin wrote:
> Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
> path on the old hardcoded list; non-legacy path uses cfg->reset_list.

Why? Start your commit messages with the description of the issue that
you are trying to solve.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry
