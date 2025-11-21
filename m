Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEFAC7BE5F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 23:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED68B10E915;
	Fri, 21 Nov 2025 22:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlesCqKo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCcaSEuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A31A10E912
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 22:44:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALL37Le2841459
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 22:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6h4F3URArhkXYaOyRfPjchow
 oGF/yMvFUeAB/KcBtkI=; b=nlesCqKo5WFSoo2G5ByLOA1Yg8PX70G1iXta/sYS
 9rgN6j+HLEa8EzDuaq3j+scWb32VStQUB5koiZrCOY4qYU52OE8ek+aq7i4Emd09
 gsZvqtRRRUH/nS2A+SZfMZSeMMGP8hn4olwGMC45+4QEgpOijL/qx+k2WliwPT/E
 xups0qP2enlCdNhJw3Tx79nmKJABOILnXMBRxaZnR6kI2E0+2gyVHj0zw/Q6b3av
 q6YvbtoRiKHbyK1piacXVei9XCLR2vEMq2FAhNDLxSvtWgrglLcoP0xYFkK6Uy+k
 /UnTX2k0nlz4MdLpD4N/pGFujsz/97OI/YmuwdEeFmWJEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvk52k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 22:44:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b24b811fb1so687199685a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763765062; x=1764369862;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6h4F3URArhkXYaOyRfPjchowoGF/yMvFUeAB/KcBtkI=;
 b=VCcaSEukmfyXKlcPR7PFtOmFue4O9sCzlAkjEfdP9rLq6bC4Vt6n+JtBWsnGdR/EzU
 xBCvjpOe73FnQc917uk2u81IXu9gEbsKAN/NWWoFcXVMG1Kn7xLZewR43wDSeb2gXyVT
 vClwaOR+t6j/q5r0pDmZkzv/dTM1BV6SPJ9m/dE5la44Q2Me0/wZOIDSQv9+JODNL60p
 jX3IC1JjxW2x0v21EvR1c/DD+iw95qU83G12npOd9YiyCUYz/+RN6Wpg/6tR2UYmKb8q
 xYK6pZQmXpPdyvU5pq4P3jcpE6rYx4Acd6rW4Bo4YihGKWPxVwKgpid9p25YvUtfGrl8
 0Ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763765062; x=1764369862;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6h4F3URArhkXYaOyRfPjchowoGF/yMvFUeAB/KcBtkI=;
 b=aop7CrqLmDNc+eFkK6tgDr9wW1n63DP2N77C3FbCeWY1OHCU/3LZYUC6cdCQFYp2sg
 +6jArwae1tHsVMEmb25N6lYm4qSNWPu7GtE/MvOMw6TRxnFDVYyAikOYIk73QW0FT0d7
 a7qzx+jK2kVpvp5funCCb4F7r2eEyhGE53LcoHa7gkkdNdOUKTrs8UZgPJVfF28Cf9IR
 B8GjrjRm0rd0YxaHVWj3oUvI3WUC8nwhYOUBJ9d+9XhL2tH3AWXHbYOGobt9MqujxLob
 mOr9pdlIdRMeZXWZnLsuvaZQ/GBqTf3oNSerR3zJNeveAyt/XYvtlLgzG7fEclfEBsJF
 89hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfoSm3/pLVAfIB3WbJEG1pw91dWcaWeBUwjgaolMZfQShqoSX6+pq8BIHBBsJVcP3XSTU39kf8bIM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOJSJgkccD7OL9nljLtL4HpbncfZPC0JtL82gafdGz9q5LBhRo
 IAjzyd60Jwy+JkqWFDaVDvftoWf8HmTTqtTfLvcXBhRHe5TGJcJW80K4TCOhbKDN6+APPltHUpC
 +UUzECjC1cQ2OZNEqVp1Ljd6vDGfSyNulDcIJiUVhDdZThSOnlGaHch7dqZ8+tahcogqTB5s=
X-Gm-Gg: ASbGncso4POyBqkt+LZkwknyG5RsfXrm2LI4YYdGOS4WiR7ANJcSxq7wkrxo0ikU1dh
 P7zq+BY3SKmrR77fDHOIxZUUtER3Z5z00YWfD0devN4oDzVMKMPJFMSB4grkOXXyqEjh+JDCrnI
 1ZcNNrUz/WVm7v90aXTusJlHnmfV7qI9ln7V6M+DV+HJdVtOtQ2s+ctIT6S0AS+dgszsJxkWVUY
 iYZeMoBtLkZyFw9aYSulFQIHe1SHGVITPuP0r4PnHm9Gdmcac/7pMP/BtWWGvRLV7zbS2JYG3WH
 oRwiBPy8ddx/SEVAS6pUAdu8LhbXHCzG3cgoCra6q3nZL10zoa4kyiya5iArHIoFKsPZQiGGWq9
 btiqwsAFqb6S6Gaeg9bye8kQiySY0W35X7Irvle1d1+OaUfqyYcSuBCKU6asaPTUGqsTqi3/RSJ
 yPqOBsHJL24DY3uhucguhqTq8=
X-Received: by 2002:a05:620a:199b:b0:89d:b1e7:29e5 with SMTP id
 af79cd13be357-8b32ab88f25mr1002676485a.5.1763765061751; 
 Fri, 21 Nov 2025 14:44:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI3I8lG5zOPGUxBnJD7antL9Am+iuZ9URcxIpbTDxXkvCQsuPHwSAvhtJp00c2A1SPWXrsYQ==
X-Received: by 2002:a05:620a:199b:b0:89d:b1e7:29e5 with SMTP id
 af79cd13be357-8b32ab88f25mr1002670885a.5.1763765061187; 
 Fri, 21 Nov 2025 14:44:21 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbc5b2bsm1959572e87.67.2025.11.21.14.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 14:44:19 -0800 (PST)
Date: Sat, 22 Nov 2025 00:44:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
Message-ID: <afqmoz2fml2kv2z3hhrltxvbpefrcla5aqymesf5u3nkkhexxt@h6uw4wj7dq6r>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-6-9f4d4c87f51d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-6-9f4d4c87f51d@oss.qualcomm.com>
X-Proofpoint-GUID: PpT2d5hkNJP9KB1KWEHYGcHWXlYTmXcF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE3NCBTYWx0ZWRfX6fUv1Y0PrMlK
 L8JqdVvSYzMAl6I778j1YNWTsh5M7TRkHzP4hbVBcuKbwOFcb1Ot+19St0301rQ/jvZiAHs1Ad4
 7Rt1U8etN6ddMmJUargqnbG4Nq05jxdNQGpcyXOFq4TcZFtBNxAbUVFY+mmk6hF4dwz5DVaDMfy
 dzgAEmAOP/j7VxI/uXnZPX1yXByxwK4re4YvRW/P9YU8Jo2SfiWGvKkVplN9zob1PajmwB7ADpt
 0bh3d+2ooKeibW2BT+UpmI0dq1KZNsuy908XXUJNoGdU5bE+jAG6ivVFrTgHPO0AICawZtdQmQO
 YMUqDK5WQRwna8439UpwH1ukEfQfkFGvGB2xerlXLTVU4rZLeJzqiDmXKEeXbE/Zixjc4wvMmvI
 EvooYje3Ch39cQrYhc3W6wL9ulZcmQ==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=6920eb46 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YsWbbbpubv--tx4qmFYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PpT2d5hkNJP9KB1KWEHYGcHWXlYTmXcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210174
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

On Sat, Nov 22, 2025 at 03:22:20AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
