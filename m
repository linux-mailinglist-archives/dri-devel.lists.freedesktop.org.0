Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83589B4A6D0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC97310E672;
	Tue,  9 Sep 2025 09:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLKhNHL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994A610E66D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 09:09:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896Ss5U005065
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 09:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xQLSJJKoOAxMywKNQ5ccnaCy0rBzwUBIGaUQg1SaW2A=; b=nLKhNHL2ewzJOPud
 lZhZtHzpkeoIViVIMcU7VaJf1n28xgKVWSCY74A8qqc8NAsyDfDPdgpNfqKqs5S8
 DALDhvWpu1iOU0eZEeKh014H+CYEOpDICzIvxMlPWJus7mG+vTUN4h6bt3qfUMDH
 raoRK5dImM2TjFOePAWN8g4xZcgx3keguaBxIibSZNzQUrGaAqjJB4XakATEAHqz
 JYk9zbodMs8kWnhZUhgKP0OcE/rqc57I3sDRiyfNHOd2O3K62rq1rgRdydDLUNIZ
 2BHXMxLQ3EPK9L+UizGxe8aL00oltypYg3Hx3Rps+iaVKr/LafMXbKmeKswA7izl
 xOaggQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdvf6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 09:09:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8186ffbcd7cso67188585a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 02:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757408981; x=1758013781;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xQLSJJKoOAxMywKNQ5ccnaCy0rBzwUBIGaUQg1SaW2A=;
 b=E1hELAyj9OY7LJh6iGf6quCCTjaaBW8HWrLHafiqSISLNTkovk/8H8W+h6ImSPwjzj
 90wc/ZCkiAuVrEhjVV3YqDVgX0DZyY4ReKMu9ryY3Y/kJJyHZA3Bowbidq8PnszSKlve
 4TzJLlz7FGgt0BfJh38WmUpGU54L+LqnC5/PfA+OHgSZdFXoflF5TBUfb64bK1kQ8/lB
 aI2A8IJDHfpi4kMb2f8Z1Z+cXiHw9OHrPulo80KJ9hB1ankg3kA4R+jB30oBOv8NqrI/
 aRzPdNIotuiquh+MQWvCCWkQc2r+cAu/b+n50vo2rFIijnIDDH54jAOQiRAbOI6jwwyz
 CpzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr+7XA/2tN6u6HqcUXgpvuzD8btJNU3rlJfxK6/hNGNDmTGXf2naP4ybq7Cfht7IL8WEMdyPJgU4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywpkwbrWlYKC68eoPRmhAFxJNDTFeryqoOIkxRzIVeG4vSL1RW
 ssoZyK4pV0gaOCkYYlKHbW/Zxq0p6G2aZo524pq/5ayZ+XuLdHD0KUbPn2cDbrZVMIumMKUIZVL
 V2RxAWbOSh/4DwHzCfkoDREIFlEtQHYL+1RfaDqsbGjzFiUEE0vzSQHhBtI97AsGLxVQ3dGA=
X-Gm-Gg: ASbGncv8SSIKGhuY2I/Atp0VMQ2Mv4kqLz+ibf7kwn3cgBhHMMA/26yqhGh4gz1kM8z
 Kcewti7mVuWKHVF1ygZZfAJ1DvBFZ/RDaeEflSojyUPB3wRwIZkHjnU04jhLA/4ZgQqBzCjUFm+
 s2gzpq9Jb/Qp/R+4DjC7qQ7P/QoqBhxDo0jA3sQrcwo8OxG2fBX2CLir+sRgI4iXDPegYY0UQMN
 De7fq9PMkWwLxZzodxBR8PQAUoRSz12+1azlMegJRzx1t2nyD+jxRODF4sdECm3HcRSvaRRHad7
 VJuvc1Z2A4HFIzZUyUyZdPcOAudCyTToqBZbDY0z5yBpcgU2nH4krDPD5PXG+ws6pu6FtiVQZGo
 1DwFYuuNZ9YIBvNga+Ih6eQ==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id
 d75a77b69052e-4b5f8531717mr75858941cf.8.1757408980788; 
 Tue, 09 Sep 2025 02:09:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElaS7VsMyAK4sn1lpqAU55/RUqGD6nhMUESe+uEL6+M2kFs4PMy1dM3B8kVdWzzm0FbO3i4Q==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id
 d75a77b69052e-4b5f8531717mr75858671cf.8.1757408980330; 
 Tue, 09 Sep 2025 02:09:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0d9b1b53sm2545589166b.96.2025.09.09.02.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 02:09:39 -0700 (PDT)
Message-ID: <b879cf3f-4216-4fe8-94a8-48244efbffd4@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 11:09:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: lemans: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
 <20250909-a663-gpu-support-v5-4-761fa0a876bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-4-761fa0a876bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S7vUuS8iP5wQFIVJARsiNqwtBFeoEIeO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXwr+K7FlVIEtH
 RH7wPX82cF66uklFfaGXHWfZ+g0tpsusGayI3XkbKkVxV+9pxx0qN07naxPkuxetaTRYG01JVfv
 WigQi8a2IqlALu/npfCIUztDLHWH0zrOP2dfeovXnpA/8OKhNDlKJbTnzAHdJcuTAXtD8VFVXnH
 dW9nOUmMmelcvcFvv4pBse/p/kgy30v4Hr/rGyQXQ8ro5uFoYgJlhLSWFC0ZgtLmJwPvW4d3/4j
 at5HpFHEtxb7ga6+6npOIR1cYo9+ZZ4PVViat7aY4gqL9ffNxxg8OIvzLAQBdEhykAOPD1yI0ib
 WF2XV7pSgJV31xuMIlf9KDDgLbSSFTewHRUBsni5dZD491v1ZwkzrE6Y7afYijduWuDA5g9AIgE
 KLzLeB6O
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bfeed6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=7IyadIS-_L4Ux7daf1QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: S7vUuS8iP5wQFIVJARsiNqwtBFeoEIeO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
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

On 9/8/25 9:39 PM, Akhil P Oommen wrote:
> From: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 105°C.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

you'll probably want to turn the 115 trip point into 'critical'
(which is fine to do in a separate patch)

Konrad
