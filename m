Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF2EBA5EF3
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 14:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0191A10E199;
	Sat, 27 Sep 2025 12:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtAHyxdA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3667E10E199
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 12:25:55 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58RB5xO5010815
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 12:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8HTZrkSYrqPPOE5aWwuZ/eo7FP1KIcHRJKoII1rHuug=; b=LtAHyxdAoERLVHjZ
 JbX115ejTnojvTKRZuUdPj0fYaO0C0eczNiv43mvnGuxSSJNaGnD1UyGLqOKGQZw
 G6Z8Q4wwd2Ef0gn5ZI/RYEX6KCE9ujwfgSiAauKN4FHhV1deKSpo5TxFND3UzPZe
 a/m22yMSkF1Y95uwOT82TntEsXDs0FDo4A7UtkQSo4Ffb/RAhRoAxf7UpC+Hejn9
 dBDqQ5oUq1zp2UGyeq8b/pdQaPlJDwifMdhRvfRmyj2zjLLzCq/bEqDqvYgL58gh
 0cxqGGcLeSDfy3a2BnH23sP6+bZyfHJCaPBgeMZiMsF9R+KK8+uRnuMOnBeresZY
 FVLe+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pd8mt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 12:25:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-819d2492a75so133570985a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 05:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758975953; x=1759580753;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8HTZrkSYrqPPOE5aWwuZ/eo7FP1KIcHRJKoII1rHuug=;
 b=QY27Mx1CaFzi7QTWjYgwnOhNJU3ldnRU6RvSzAtthYhlksX0ZbJEQx5XCC6ZR19pb0
 3xNCPa/D8DCwbXtdUgKrJzt7xcP4iutN0ZEtfOszpGJnb7NLRvRm87k2bjqnAYTgigEG
 I1gubO4MDMn6M3IGMepO6+aa/1NtIhStNhrYdEoHNWncBQxwglseWfz/o3I0nIplDSP4
 QqkJAwPNvB94Z9fROXsCOsPOB4ZrFipMyVoW3KP4HdOBqx9spB7G165ahyT9SUqAfl6K
 V9jJVVeKaYKHOn6BqyMpnv3+UuosjFklRQMgUIjKJRJbMTC19Qet8HZAH6osMWhRZK/A
 0Aiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIKCl1uRh+BUslxQ3DORjoZkT4QXivsFtMYbRJxBrMHQD9Qh/A5K24Tn6pEjSiv49yJTozaO2CP38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxha/MZ/KdahYDGm1oJ5jBxVTjqEPkNi68b4DMY4FXU62e6AMrO
 mnE5mhq5JcEOFGT9XlP2o/A1GddTFvPrQV+1OiQMMBsZsR3sD3YnN6lI9V4gKL7fdoGAqzrEK4r
 W5X3sCtAAHhj8mZQW5QbM/1/QNIGMNToMfj/b3rsJSdJC+XTeBmgqQHHMklWTXleGWzxuuPU=
X-Gm-Gg: ASbGncsMYr3JgIbqj/z+HrbXaj0KvAcafjLXgvhO2pw3YUv1TrAd0GDXnlyhYtMUWV1
 kGt8k2Z50VDpDtDn+CvXoSkJVAnYGl+rYA70EqLvndKo4RK7hcKblwdp1xg8m0l0PZEUOx5D9g4
 dTaVSgD//Im5NAiVkp6jB/TxVlgIYXn+jTtI0n9VFPiy5gXQlsm4E1A+GLJd0cTvUUl2wxjuzTm
 LBtvQzuM54B7xFCADLnnu+gHwRqjtmc6JQopiv3AkrLJUndnumM/OcXO3NfXDml+l2jj+r4C8l1
 zhDhuoaltqyLpInd4ZaNJ9hFUJaKXhMzHZ5rmjSV2EhwaIys1Q6xfQ9yL467Wu/S4EUYWWXRUqC
 wQUMOImf+Rsz/jeMUu2VKAQ==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id
 af79cd13be357-85ae6d81db3mr926478585a.9.1758975952994; 
 Sat, 27 Sep 2025 05:25:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCG2e/ZW9GFpuGzcSJqt6X2AuHy0M9fiQ/EEgWD1R6USyO/kkVUy9LiI1L21B8ibFVZJ2N8g==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id
 af79cd13be357-85ae6d81db3mr926475985a.9.1758975952413; 
 Sat, 27 Sep 2025 05:25:52 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353fa65a62sm554412366b.47.2025.09.27.05.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Sep 2025 05:25:51 -0700 (PDT)
Message-ID: <7cfa782b-07a5-4f0e-9151-44a42c77badc@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 14:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/14] phy: qcom: qmp-usbc: Add USB/DP exclude handling
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
 <20250926-add-displayport-support-for-qcs615-platform-v7-10-dc5edaac6c2b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-10-dc5edaac6c2b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tdsiFaEKs5de7jYnW3Jg3l7evUcTjfLb
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68d7d7d2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7a1U2GcbA96CJLvzQ6EA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: tdsiFaEKs5de7jYnW3Jg3l7evUcTjfLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXzxUuO6YnFwAA
 +cXnsuO/UbeDScfdeIPE/5pVhAc82npgMf5Glh/cwpLyKd5HUjCB1x4ASO7wjsRhFrBqSH0jeeC
 /YszHy0CNHPeUl2bpMZOffbZCDCPr9NEC/qzWl9WGrZ/VzkxvV8i1HE8TrB+t61HoE8WRJhfV5G
 VGP9E4FLEEPlNX6lykjW6RlVUPITVHMQ7EPZd5g9kcmu6+aRqqiNPB6BLtpinisVPWwNoMi2/qf
 urUaLC6Zloem8ly3dT6L993+ZuJ6zEthd6UMnHeoctGaL6vW33k7ND4mEAihhHhM8XMbZ/FZTQi
 z0e9XbQg4bXrHM15/VeK1z4nxbhkvtdMe/k/DQ/82erlAj5jabebPpSMz0BBaZvRR7yg6VkwDjO
 ZTrifusct9PAakPiCrf9hv73VdNvRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-27_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
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

On 9/26/25 9:25 AM, Xiangxu Yin wrote:
> When both USB and DP PHY modes are enabled simultaneously on the same
> QMP USBC PHY, it can lead to hardware misconfiguration and undefined
> behavior. This happens because the PHY resources are not designed to
> operate in both modes at the same time.
> 
> To prevent this, introduce a mutual exclusion check between USB and DP
> PHY modes.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
