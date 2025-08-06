Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10559B1C294
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 10:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648A610E727;
	Wed,  6 Aug 2025 08:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksDURSDQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C837010E49B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 08:59:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765sYof015103
 for <dri-devel@lists.freedesktop.org>; Wed, 6 Aug 2025 08:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c9I/PRnvwO+XAYuNdl+hXvdMXnF4nGQyuJTKHNoBE+s=; b=ksDURSDQKWTiq7qX
 /VjuPogM6lDUZx4KB/rQ3ZuuzyFazP6W6oIvdTWEdvXbLcbciAnZ+yC0mkyvZmOv
 CjODee7bCnFWdEQ5cum5huQV4ROS4Epy0JIV5H6Tv3GsYrdd6ZccnMPZaimvuOud
 QTdQOMUrCvMf32S4K8BjBRaB64oWJ3cr6ehPaJ4DuYHKvaHFDig41u+Y5xSQSyy/
 QcjICPFmt1qKXOT5rJiZmGTwPg6cslzOpB1tSDgxptiTGakp6qOisi5WZMjpNoxP
 /GK9zkv5TosWv8tAr3SKifv0N4k+x5DeJQlCLwf0ZXyRtcxVIn9EQ1d/nH8CQj/V
 QPDzaw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvvt2rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 08:59:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b0938f0dabso1491091cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 01:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754470779; x=1755075579;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c9I/PRnvwO+XAYuNdl+hXvdMXnF4nGQyuJTKHNoBE+s=;
 b=Q/n3Pl1JA89Slxnz3fb/EtSJ1Zq2FQeIRWMcwMiiWtzzKT5Xm0oZbLWkNJF+CPKkmp
 +55z4lMSHFzuL3awHqp8/MgWHDuzFAaubUVBw6d4pP56qKF+K2lOBS5DpMIYykQ7VhqL
 uJs9W//SEaFu9+ujgUL1yb5ngYeXNx3hMG2khjnzKCZJ5PnDCJNxxPv4VFLdegcxvkYC
 w8pPaW3GAbIZw2WDAmTopwxa+7ST/KqhnH64izf5ewjKFZK0XlDQg1nesOl8HrXsOcAe
 ibWRIEfpzikOKHpnOjQCMAkgLwcFvFQZRCJAoBrfI2wTuLB289+BhNhM4JdTOK0shHk5
 bUGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9wj35YnJ1mOSZBZQ/S6+rQjbmQsaEVh6NDdg9LZTSAYDQdtoabiMW3rtNKCFzMOWuvA7vVXyd3Z0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUvpf5nhE0fCAVn5hI8cqNyiKlM1U1nNFdlkMp2kbpWo+PBxNZ
 lrKDwyAKBnyO2DMfTZ5oicAai0BmHr6E6PFEdjgSBlsg4X4HO3DhMsy8mL6fE1swiskBg06iJjh
 A3MNakoYECVxPejsq5GNNYtgJ6l1GaC8wessKN4gOXN3z7zOA0faYrFZhvfU3sBOEZS03USY=
X-Gm-Gg: ASbGnctQ5XHW42hbKdjW/nqK9dhKPVblNRgVwQmlzPn9CDDEYAedKpcVAdKJxjSWHcY
 rqgF+/STY0su1YRL1vsQwyDGyT4Dk6Ph4IuitUc8/xPZpyCq0emz2mQjpIXQm9nm8WucqFPjxys
 +mA5cP5iSnqtbY5fzjtTeWAx16Mesc+4rdBVos+C0RLIP6ZutSAEcGzygpI6bF/P6jfZOXrLDQ6
 MMZ3mjn1pnajbGigvPP2tmWcstrck1SepKu+T7I7dpt3Oqy1BFwZO1349zerG4CwOX3opTg3F/t
 B4qCUGSBlMQT5vmwSXM421qqc9UKhfVDsJJsknbEXqLcBdEVTysrYeMC+PDXSUcUT3PUR1URIc3
 NuwmfVuNv7upMHcggxQ==
X-Received: by 2002:a05:622a:609:b0:4ae:6b49:4d7c with SMTP id
 d75a77b69052e-4b0915d25a2mr12806291cf.12.1754470778764; 
 Wed, 06 Aug 2025 01:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdf6mYk0vm8CTUCUOiGdpuR4DjfOcWPVGZsk5L2Aq3igXFKb2AjbidwZTi756A4BnYvppCtg==
X-Received: by 2002:a05:622a:609:b0:4ae:6b49:4d7c with SMTP id
 d75a77b69052e-4b0915d25a2mr12806081cf.12.1754470778117; 
 Wed, 06 Aug 2025 01:59:38 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a076620sm1052660566b.10.2025.08.06.01.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 01:59:37 -0700 (PDT)
Message-ID: <ecaf893a-0c47-466f-b8b7-54f9ad166b80@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 10:59:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
To: Yongxing Mou <quic_yongmou@quicinc.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-5-dbc17a8b86af@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250806-mdssdt_qcs8300-v6-5-dbc17a8b86af@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2qoTRC3FIyXXN2i2gN6Ag4zRRPLxaZUD
X-Authority-Analysis: v=2.4 cv=GttC+l1C c=1 sm=1 tr=0 ts=6893197c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qcYK-ZiiYIKsHLxbHAsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2qoTRC3FIyXXN2i2gN6Ag4zRRPLxaZUD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX4tK/Dymx7Cke
 4cEsx6XYE8zyOxOI/FGH8zkmNyQtpVNoHasMt/oxyAnbCa0bRRthYUKMMXJFl09y13zQOYaYJ9A
 9Y7dxAqsYXy56VWAMZYBCph3iitA2GxgkfmR4c4xtARUrk167iBYJxiUJJNvNBeLMwRnaaCccoZ
 WBHqBVCXFCjDHvGOF33gCrPpSHC8/ovDy9IqfCScTdX/TVut+3f7TOaMxn7xpKELxMFoVS6lnTv
 8XnNqeFuPYnMFkbTkDDPGGxyPRwFfe0ki27lltEGmwJ+32g81Hdbx1JoMltrKRL/iVqy0blidSj
 RwkOFABCjPc9BQ9pPcxBB0gMqv7A1PzLIMzN9ibDrvsRI8HcHkkiqOsqGVpZCBySR9x+kMukSBW
 FrAF0DIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

On 8/6/25 5:16 AM, Yongxing Mou wrote:
> The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
> the SC8280XP as fallback for QCS8300 according to the specification.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
