Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41231B8F65F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 10:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38F510E3D1;
	Mon, 22 Sep 2025 08:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHqe234Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B735D10E3D1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:04:54 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LLb7EW019670
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OBOlNt0KylCLkmD2DPMzP/dcM42JfiU2PW1abyinKzQ=; b=pHqe234Qr4hfKtip
 8vFbscrqsNDOJhQB6RrHpm3aVnDYgX+Z/kJlOKRtpAQS+BmMCNPZbbIgYBX8TWmQ
 71izMGieIm6StRm2fZ+V6HPEQ+Xtxw34Oiss6v1xpQNjc2WBCerD++Gfil98f04E
 fLRJZhDAIbe7ZeXi4quiOU2HYvvDZo+BFPKdadiCebtgvq1//aAkVZaq2fiVzvX7
 LUbcaVOsO7rmVQrDTnvEyWTE/d+sNF9k4VYg7y6R3hHIGVZf2zIKCI9+KRWrswdk
 pQey1qYAsRpdNYPhW/nKj7pWdqbRa+dKC5OZxs2lNSrOtrDrN3A9vEa/HyuSGWRq
 TB8gPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv0uv0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:04:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-269b2d8af0cso8182705ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 01:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758528292; x=1759133092;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OBOlNt0KylCLkmD2DPMzP/dcM42JfiU2PW1abyinKzQ=;
 b=B1tqLSbfIrKCXi9y6ju0fSNgwQT83OBSoYA6A+X/qttlVQI+Qqc8au2ueZ+ml49G0C
 Q2Z4MDr4HF6x3GAhKIZzJ/rQcbWSQMzveJQCLDVQ9ZavapCgKADWOwnjNJqvlujgckrz
 KoAZiFbziDNaqIjVcikXBVcCjllN2AY1TkVvxPn5SfTcGLyDcdWWTw8sNGNeBqK8wUEb
 RPMMvZwLNNFvuMMaHUpL88bHK9xkY4vqDcF91lZCFUgZBcIJvjwAwPLlpwZnU/8RFJSH
 a5E6oORzWJDVviX55PUwIPq8lY0A30UfkTMFFPwYf8KDLqdESdbfvEG4RddWBSE+mPOI
 NeKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX13NkiQl/r0u5GJuGjr63mHUivxoAfHoJIkNNU7YGoj0rt9DWDNzcaNIvnHMrsoYQRvPU98gEHPm4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9E5nadT8LFtBCYIW6vO0AGFe27Gpvslb+pZEsxXNwTokk+sMU
 ilCwfFHjFz4Eosmh2O8GI9M79jicWeBPGYKqXcsVhNUkb3r/hyKxXMeM1e2cBqhxTEKcQ13TP/3
 ubZhi9VY9nWrS8hoLLXuIyVUgVhnwMFsTxRgPasR4iJHKM1RbwWop62y0Vi7pnE02GDaObzw=
X-Gm-Gg: ASbGncs8u2YzKRu593GqJAleC8eDc4mPxw8lsedSc96tbUTu9fF7u7WqFx4yjxs2Bqs
 fLaszefT7CBMN6hEjxBHgYSu66p9Ukwsa5hgmJAyDm/L5mGSeDxESUFO4exk6ComS81jw9IL+m3
 MoEqy2AsMrcySXnvq4UU0G2dGk3ztcFrdIQZGOaN28MDplZRKZDigHUaL5aKALQWG5o2j4cP1NF
 IkrtLLLB3HsvNMlZJFIa3uAFBppn0ZaGS0BdT3Xzo6K6dlV+fOpRvAh3l4TnxSbA9TGM9UHhpFF
 pbqxmxRl0zUY8s22WkubIQOfo5hdInHr+DUR9a3QFS7i+E4lMX0jYZvY+SVE+qXrhCwNLu9StAM
 MrUDNCODQDUI70BPgbkVRysG4DaaFP6yplw==
X-Received: by 2002:a17:902:8f90:b0:269:85aa:3776 with SMTP id
 d9443c01a7336-269ba565f84mr64992165ad.11.1758528292458; 
 Mon, 22 Sep 2025 01:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETp7wbXt+1gQikMI1ABo2kP9bbRyManwLPmYcLYXRvB4adBdDDjXk0Op1hW4hh5H/vg0jXlQ==
X-Received: by 2002:a17:902:8f90:b0:269:85aa:3776 with SMTP id
 d9443c01a7336-269ba565f84mr64991965ad.11.1758528292012; 
 Mon, 22 Sep 2025 01:04:52 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698035cd39sm124460975ad.146.2025.09.22.01.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 01:04:51 -0700 (PDT)
Message-ID: <83b5a265-1c5f-49f5-a89e-22f466df3304@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 16:04:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
 <z3phuuokrhonbukct2siz3ujear5ymtnoviea2epxzvjdmsvkj@w4puf4c44tmk>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <z3phuuokrhonbukct2siz3ujear5ymtnoviea2epxzvjdmsvkj@w4puf4c44tmk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ks_EPi7x-qq2eRretSjm4hqg9vDEIN9b
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d10325 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=M2ADfI_v5YemfhxMpdoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX5K7Ed2Spr4vv
 Xc5jNbs3XU0QtT+UuQuEJy+iloou5cbXtI09KHrM89TUXSTGXd+whvI9rNjhW5l6h/RcUuoZ6Bm
 EBojnWWH1RPMNlRtBDTvIA5u99UWan2ofcpBWuxz2WG7uwqVDEZcqMkbhW0Nb+ZyYWKJWz7ghli
 AdDLJA9Dz4te4IlP2+e+ZU1SHseOxqRnPCepGi9xg9yld8KqDJV3XyyaGCq+ETBrV+jG9nbGkXJ
 XayDyeHloEM9HPTKJ3QRw2LFF/JNd+Cb6PmtdkrnOSTGmakDPKWWUORpwIfKGnsLwViuX1bpB8c
 mHhU+9WTCIqSAnuA1F+EqDxmJqHfiY5wn6hH1rtJzwMlfePFijkbCbM7nNmREMRJdVEFXPK0bEQ
 3ROdruUU
X-Proofpoint-ORIG-GUID: ks_EPi7x-qq2eRretSjm4hqg9vDEIN9b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025
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


On 9/20/2025 12:45 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:22PM +0800, Xiangxu Yin wrote:
>> Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
>> path on the old hardcoded list; non-legacy path uses cfg->reset_list.
> Why? Start your commit messages with the description of the issue that
> you are trying to solve.


The original reset list only works for USB-only PHYs. USB3DP PHYs need different
reset names like "dp_phy", so they use a separate list. Moving resets to
qmp_phy_cfg enables per-PHY config without special-case logic in DT parsing.
I will update commit msg with issue description.

Or do you suggest using (offs->dp_serdes != 0) to choose the reset list instead
using new attributes?


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>
