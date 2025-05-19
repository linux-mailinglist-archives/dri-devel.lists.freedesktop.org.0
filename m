Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CA7ABBBA0
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE0C10E3E6;
	Mon, 19 May 2025 10:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofkjOmZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAA810E3EA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:56 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4F8oo014390
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=; b=ofkjOmZErSlLIt1d
 mCkbYMVN6TGC+Zeeyp/dr2vOSNDHi5I7gYcJ4gAq4tHof7zmYPf/F4bkCN55suW3
 J3wsTvqI51Br/tQ/yLNYFwBYY49E3FX6M011ogCt7V0fFUsW3oSE2g2L50UfoLgz
 8hNaw9OjXQANs8i2P7IgxiDYqXK6+GhLFmz7arXhtKvbNAhv+ccPDtGSOk8xIsyi
 H/ufduINiGxfqdaiAQEBb/0jbg5jWEI/Tu1x0sXE7CdsbWmhTOTsOdtSSttFbV5s
 6MMsK4noJhOoArE2iKWgOvtgxiqGaEAsJ3Y5IFRZCiWnvoCYVPk04YxG6d93OzAs
 c1AF9Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwenh5bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6eeb5e86c5fso45117146d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652334; x=1748257134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=;
 b=PYo1T5cpy56kpjxuknz/bvWknPn2hUBzpHuPDte1MDMcYBm6CKau7FCjpKrh46I9Lw
 hh3URtSFvfpCxFD3/YwunTNPSBYUsWjlc4kym9yTvsCn+I+iD7o9NFlnriwzrWgdU9JO
 QlugPDxnLNpujAiS2GcG17qSfuNmVukBD1SLcyXpa18lGFd42I/FTBgDgOQfjhWRH0ro
 jD1tMeBpBzsm6lHDVVWd1XFZwiTdawrCaym9TxSbvWMW3Lz3pMxATaSlLqhbdE188ACq
 wR1qrVb6XtnW83XOuxGDf/wRQqPuKaZIjh9rkzozHPPhqgL23emdKG3uqKW2X2dq4XCl
 eR6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxEkx6D5+j85Wxj2LTxEzKphHjKI1NsrNNXI6v0R/yS40Iv874WcWEN+VyeWBesUPm2/qaNjowISw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypSaOLG2LZA/RoryZJzSoCUHqUTY7QrKhX/Yvxa1EMcbvHVviG
 eZAHc9A+sjo2apby5LqHeg6nLxLRoShpQIjXpEFzYKbTX9/RHNY79hYN6zYSQVtCrhL7ZjAB9L8
 CR0Kn2lyfGUrU6Ua8p0BBUKcrmqvK1HcwybXqdSZtVSGSTo3IXQufv6OB5u70SGAlrzD1oB4=
X-Gm-Gg: ASbGncvLv4A013KsMyT+v2QC2WrL9OHViRF10BWrAlhST0yJGS25JYfjeYIp+rMrlhm
 vICu/liOH3kmRlduO36gfupeV8q63Rgxc1CCFjZrS/B7pqsViheUIoP39yiJH0Ga3aCoCHtgfVK
 GQB59wWkGtNTftH7tR4CFAJy+KMFjTXNuBqLFhoLRsevuzaEASFsZqvcI7ow6Ir5S7Utym3Qxtb
 VeM/eWLBvKsc1EX/3HNZcEUTrhkg9qsFDQsyz0bGlJCmjYENKG+7OmdMzgENkcM/KKjD1s0pX6x
 aEdYZq/SFPbo8nLtDkAKb8cn9HzOU9nSOpWPvIJy8zsm1TDrT6o/Xo2/ZcACncMdzXRLo9GFgiI
 xBfBs+RA2LaGNx1dsjBLPKVoI
X-Received: by 2002:ad4:5f8e:0:b0:6f2:b551:a65 with SMTP id
 6a1803df08f44-6f8b094f396mr220670006d6.38.1747652334340; 
 Mon, 19 May 2025 03:58:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9NmA4hTkaWiWt1DG/4qc7GE2Tx99AjTx/JlvVe7S5Gwt2EQWgtvBoTnNLcaq/78n2BYfQyQ==
X-Received: by 2002:ad4:5f8e:0:b0:6f2:b551:a65 with SMTP id
 6a1803df08f44-6f8b094f396mr220669566d6.38.1747652333886; 
 Mon, 19 May 2025 03:58:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <rfoss@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/11] Various dt-bindings fixes
Date: Mon, 19 May 2025 13:58:37 +0300
Message-Id: <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QHj1brhZu0tvl-cYfCwst-aEaGC-wbRZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX3DFU0gqT4GBx
 nnxPmL0JmD+Jo9Xcv3k4f5BNYszWknMuODyXmoDD4XqubCmRanWVI9YEtiAkhXiUiGqS3UyL5Ry
 IYcWJuUWuGPEaPiD1fJw4NTQ7y95JYLl1DAENQdZduDoah82UNGvwxkSNtyL+T3JNireML2YbiU
 vIGkpj310+y+KMdIviBE2IBr1m+7na7Puu6qQLL/k8PasRSqhf8bAj7Z7D/EeCDPc1J9zB0YeW2
 AQyGPS6DP7T4sP1x10OQZCaX+ziGXHzbZe0DGj55GEqBCowUZDFktUJn9zgm8DAVOAIzjBIWL+2
 PcAKv7zedAeGnwXhgNwjKfDW08Aquy1qmW4b5SIiqG2J5GyG2zVZ1iFRhxji/C0JMTIcrUbBiLo
 n1BHutS1poVCpIJSg2l+AbwtKJX3yyjFTZK281LAokGtqFcWJ7cT1jPCYHu7wgTE7Y+gjyuQ
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682b0eef cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=AprTATsQUE9CPNEuHX8A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: QHj1brhZu0tvl-cYfCwst-aEaGC-wbRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=900 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104
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


On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
> A set of not quite related bindings warnings fixes.
> 
> 

Applied, thanks!

[02/11] dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
        https://gitlab.freedesktop.org/lumag/msm/-/commit/60b8d3a2365a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
