Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875CBCE9E23
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 15:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D3510E8F7;
	Tue, 30 Dec 2025 14:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwJA9dak";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvxFO28P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D2F10E8F7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:12:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BUCto9d715412
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HS3TEANSKSMWymmtWV5vqUIqqjugX/Y6BQA4UQUE6pE=; b=iwJA9dak67b781Lk
 4NaV0iAKDY+b2kL3XbgtYcdlKRT3B4v+pRkqBkQTUKsgZOt95/zcOqhoEDz/njHH
 N5CerzgtUhfXLSJVhCGpW1RbRiNIWrA8eaCtipOTM0cilxL3A7CHwyOj1GAcvK31
 Q2PHcpr+KAT2vMBV/rog3g7uBxc1JXQmFOdYviBkBNEMa812aGPB3eT0+4WF+GzA
 BVYzARc82+zrOCTkD72ta+gdviEB5xGywJxwWMDwhcKr1qRWk0cJA1j2BNYCVExD
 8Y3Bgk/4Fq24XKd+E/2k4dpzDTq7lIUEgvZVJ18x6jmHtt/lgjIOluqADMrA+cQI
 qlaeXQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcf5yr605-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:12:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed83a05863so33134491cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767103921; x=1767708721;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HS3TEANSKSMWymmtWV5vqUIqqjugX/Y6BQA4UQUE6pE=;
 b=SvxFO28Pvawi0Au8t8Rqz8+dZTHInXUOHoADcnV1/TSjcyY5sAFVtsWpYBSdvCiJuF
 +htBCH82pXpjs2PgRUNbknCEAs3nYQ3LwpSQVPXmPsU1265ZddBPFDjITDXh/jnZnmNe
 ponzzF/xNzCiI1DB9MLX1Iq3GqQTZGo6XLLFCjCoCeJnLXN4gaAMVKuLKNFSAZaI6EBP
 qoj50BhJEqkBkzD/nOjaUtdeY5ko7ke37SzRcpnDeLeejd0G2d6lOfkYrfasax79b/uc
 xpiHEi2rWzrZX659k9St1I5RktQXD9Xfb4ZHhA1JooLTR81zJix7aq2CWUpTxSadAOW4
 hTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767103921; x=1767708721;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HS3TEANSKSMWymmtWV5vqUIqqjugX/Y6BQA4UQUE6pE=;
 b=Ct8+qV/fpvmUWvOlwXbSxCfZq3NeE3qHGE7jV8Ef/1siJWytevKWKlknvJDVSdohBg
 1JomKryJ9vqb2O+HkGtPnPxxEag4hMTAZa8xs73H/GaIaQusL//Us+FnHrOKomEHjEUB
 rC0ZzzCqYpGJKL85/k5kClxuNGNfc8cr6puo7NMgKFZzOxPSoHlgWCi07usr0SucPn1s
 glRi5mdWkgXkmf14d9qFwf8LKBTnOIrhiMTDks6VjnaPrtf5BIgy+xLUTnF9RIL3X+hm
 17FBh6pTQq9PW53HVYEBTq8l9q5XxrS6qg1ebkaSMR/2wC/WTZkwxVswFClzE4lJs3u5
 HINQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqKFo100TstbrC4JkWC+nWku7jkyJFxs8mowFO76dY5on1Jjd5dnJktHzaCvwep9XoRcstwpDq47g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyvq0SjnPIla+x1iFxrsZa3sdGc6wWv4/8lcyAqIxjqEUoeWcuO
 N/LjyhT0zxsvsEMYA5nhCYIiJMckMYLh/2g73j+IG8LFoXnzUAn1xxWezUkRcU1cJcS8lljzgDh
 e80/AKOGCtU74RqtdBolbCBar3XhaZcks7L5vAjnzcWKU8M5L0Mr5vW0UGBxVkwa8L96dwkg=
X-Gm-Gg: AY/fxX7OXhs22Co7rNDcf53AG7ynFTTC5YhNdoe0rRc3ucJP+BbfgAhDIK5FyOKvuA4
 KppbV8K92uCyVYXNz7d22rCqYC16mJFSKjznARShz79xs10P1gIKq2THNlEA/IBK3V9hOE6pMJi
 MF0+1olqaVdk0586vCvYDNIyLwL8CWLYqFseWpj4H49/jhsDD6jwfkWGlAVi5mzLfNBmffaTCtx
 t2Cc/O3GTZb9y7nWlEjCyFwUTR6qKmGY69wi4kB5Jk9r0kkT95rp8C3lxJjHGGQQuvqmbaJjWiG
 ZN6PbFowOsI0Q06DoE4+VNyryQFgB07Kqdhm73qWcmNoMB3UL9uObRoJTHn1qAC++ps146YKNt8
 nrGYG4Ina4xZcTlDB9WJhN+XYiEuNWxFLp65Nzg2h7R9ckYBX4ssEmt1LQZ5mTE73GA==
X-Received: by 2002:ac8:5748:0:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4f4abda5f11mr392930421cf.7.1767103920931; 
 Tue, 30 Dec 2025 06:12:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjQZFxa4VrpeId28bY9g+GLwW9YjHI5WOe3r+GpOiw5AGB2EQDoUopk5HC/dXCkr4ncHO0Ew==
X-Received: by 2002:ac8:5748:0:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4f4abda5f11mr392929851cf.7.1767103920380; 
 Tue, 30 Dec 2025 06:12:00 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b830b5fe8cfsm2133862566b.59.2025.12.30.06.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 06:11:59 -0800 (PST)
Message-ID: <b486af10-bc66-441b-ac3f-ec150caf49ca@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 15:11:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
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
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
 <20251230-a663-gpu-support-v9-3-186722e25387@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251230-a663-gpu-support-v9-3-186722e25387@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX4OQn+TUlapyT
 9kd1B9eAInQzTuoPlCodSl4TZcUbqLI0JqVd2dy+GXrV+AluR/ZeR3yhG2MPXb+vxEmcbwf8IRc
 tb1y1mSn54NiYHJ6wJKgi3O/Nxiqn+pDoPdxF8iY01Vk5LQlGcUirUl/egu9PxzEqtfHHw6FASR
 N2plXgSkg+s/M15/WWvs8K+wHKP49rKv8CshItUkgo+PXhpUPtdqFvCVoa3UUrqbWcWYvCM81Ra
 IFuECygLyCUyDO2djmP4W07WMgoguXOhoKzVzNwrZE3c912BpadvGJWMqr3x03w9rUZw6aoYAaK
 lCF8JZl5eyh6X1e7DDXdBu2oF4tdv4uvTzf3woN0OzMeU/1Sxu6pOlhICbmk0qPWxSdpzEWHinO
 5XfDyMNMx/zktbCfvipy9G0QFg00yH/eQVO5J4xw+5Onrhw4Fp2otJSFIAX+QvPVOA8gCfWJ6jR
 fDpy9cEmHxzeE+PvclQ==
X-Proofpoint-ORIG-GUID: 711PrYw_tSYLjzbe3zUKb5EW056thNbQ
X-Authority-Analysis: v=2.4 cv=KvNAGGWN c=1 sm=1 tr=0 ts=6953ddb1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3cl7Maa516Pf-TGxC9oA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 711PrYw_tSYLjzbe3zUKb5EW056thNbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
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

On 12/30/25 1:33 PM, Akhil P Oommen wrote:
> Enable GPU for lemans-evk platform and provide path for zap
> shader.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
