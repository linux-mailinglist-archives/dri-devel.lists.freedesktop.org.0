Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92E5CEBF62
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 13:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD9F10E0FE;
	Wed, 31 Dec 2025 12:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e85aK0XT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eH+keLmv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE30510E0FE
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 12:29:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BV4ocbW1429654
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 12:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KFud8qCRw7D7DQF64mtGmDdTqmMXZ97Xc4c1B/Av8pM=; b=e85aK0XT7X6B556g
 rSxyb4cR/aBwAXUbyRNOcVz2c+e9H99AQXq5xS9XRXEfpes7PKwtVHRQRte8T/12
 ymrAgYI30cJoBKrp+D0r9b8EtAP4mzPTd7YuyxkHnT8khKUy68xOuR0/CcOuka46
 D8pOTkH1rx0J70wek8q7vjW6l0hD6S0uiF6lCS75DebTMSVwBLNBGKSOP30zqvCL
 L5i9IbPWnOVEZSAEoMjRtC3BLq23yT+j8XnfTzkndecFzf97ygjQePjL7+07txuY
 TXTXWBTZ4g/t4qdKEr/lexZrQKrGG3F3YRtEbQwCC81lbnJXm4s1seEKW8xOMvzb
 rVj3zA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcw5e0rb5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 12:29:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f357ab5757so48490981cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 04:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767184171; x=1767788971;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KFud8qCRw7D7DQF64mtGmDdTqmMXZ97Xc4c1B/Av8pM=;
 b=eH+keLmv3K5GhHPPDIjjL5YYaZL69nnslEKi/eWU6nFL1eKt4i8eXGdJI/u2alaVWS
 QjzhE2H44Ghd7RMSBeeD+Ai7l3w//W46xFraSzIhzXmpo2ejYPkqVQ3+3AV3t0ikvNvA
 0frFTurQeJ9Bcu6FRnpdh3G1YlC8T9zdE0uTeGXajP+eOALddBYSd9VXHqvOCx2KMh+x
 pMA6iP1E8riT3iF7wBMvRK/9vxiWFF6S9gss8OZTaIjbqRGG324w/khjcPEVa28fkfZu
 CNK4ZkdXuX0BXIIViIjk9hK/XaQIobtNiqrcZTftK8DMyYJ07ZOirPRhaGs+h5nVUrcM
 UbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767184171; x=1767788971;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KFud8qCRw7D7DQF64mtGmDdTqmMXZ97Xc4c1B/Av8pM=;
 b=krg4DgKqe10An7jhvP/thnIUELOIZRT3Z2y9ejQHkYZ/uliZRTpvfRZ2ApibQKbK5h
 OPmB+k/djNIJw74dKdJsSrRVMFz+G4Uc3z7sCcR/pZAtGDO6uLHq8Lwv87TIiZ67YrS1
 L3++ssIhe2ZfF/5wwaEz1sjxUHKsstW46oVpvQ0ZJQVuhYKj1/a0AtHq4j8fY/bdInlQ
 nskjwme29gfmELyysQX9kG3B8bNdBlS7vdkGQ4WDeH5R+l0buYOG3JS1/BwlZOcwvDik
 kHGzyZI40BcArt6RqlqfwFQI0J48tC03S3lepeX3feFgwrC8aELoFPtuHZ72lxnrG6Q/
 nO6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVM26OdjGXm48qcFlA7PrIVHgUzepwOjDVt1FYwL7Xu09FbrC6FcNZf40/lWaK/LvNyqIiRiAHFPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziFBff0cWfx0COowpyaTUjlWobZNsSAj9e5Ej9AZiDF6yCCMI3
 evRKie2AHGlMjzvpTerSMqB8Qpl7clKWtnAaO4bNDbHQGuu0XRKIQKHmG2ri6HpWTP/gHWyLPaZ
 b6rVyYlus6yZ1HrKUWy/fFDFOd7zQPHRylJZg5TXICM0JBXs6HT+HWSB51MdsVGfpZGy1iO8=
X-Gm-Gg: AY/fxX5sxkZkTPAI45uNq/xbzBDamtZAGxtyHkQ8vWxYBKBEkZ7H1VkHhM0HLtxaFwQ
 T43/WXhbFRAzFTI1WHewws4MGOJw9RmzlwJcWu6ld60szi/OCigs3Q7PGbLoa8Ph/3qo1G2gkvo
 u+Qeef3hdQYDslg+5DpFCJ/JlpXap26bTro7KQrRJSdLYzjq+6M0Aoru/UKxCKZQEQafLFA0jJp
 U1hFs29jBNjGB5mvtPDp2XKUDM9WaxWGQf0BHDNBYc9uztQ7HuDurCL4pLpFWtNBdBvxsT8b8As
 A9DxpbIBzN8z05ikvxYyGbhyuTW+OAmJ9vSx6iCWQEKa6gjPzjbXP2vqi/pQ83VNm2+3uBmt16Z
 iNAOKFV9cm2ZLlLPRejeiwt50P/XW4YOIl3k88CbMiN+3pFpMjbTj2zUJQ5PG+PeTgA==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id
 d75a77b69052e-4f4abccd72amr410542571cf.2.1767184171276; 
 Wed, 31 Dec 2025 04:29:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhDVqUtx8723JBX42anoDu6k15qa+jqxNz2Sh0hjnvTQAr+BDlp8CHnTosrIcyTDnpDaKPvQ==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id
 d75a77b69052e-4f4abccd72amr410542181cf.2.1767184170897; 
 Wed, 31 Dec 2025 04:29:30 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0ecb9sm3877057366b.56.2025.12.31.04.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Dec 2025 04:29:30 -0800 (PST)
Message-ID: <f30d26e1-068d-4af7-adc3-9cd03617ecd1@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] drm/msm/a6xx: Retrieve gmu core range by index
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
 <20251231-qcs615-spin-2-v6-1-da87debf6883@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-1-da87debf6883@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOSBTYWx0ZWRfXyVL2j5g7Nnoa
 6fRsiai+fPZoVAQNeAZvb23MUHt3yXqQLo8IowJMpI4poj0I/ypzakfwn31X6x7EZm2j0Al2inU
 qp2ny0GB30pBpejNoktGDxMYZqkXQ02BUtCkovOFwBqjI6TqZ/GVn7bYlUJFvEpuuARE2txwmaM
 DGV3411Dqlsjsc3EzZpIBUv1Q8f7KMpARlu3TfaZNGPUC5ALc1e8W5H9mM+Zk1gGvRFeDNprMhA
 Ra3hIPNn6BeUktkL/PS1WqY6C2fsxSNgIJ7gamDUuco+Bqjt3nspdxZI9ghb4PzAj2hfg10UQ57
 Mb6CCULUA2kA1YWjyZI/NzLmzlkv2Z1FfXwwGT0UOsFuTngji0QCw5BxYB1m4Bh+EvhkYM/06aG
 PaVs3amg0Z2xuJWzp2MmaaP+7DZm+Z2VBL97z1dDHPJbz4h+QQJUualJ6OzTnmRBEZzSY4Vm+OK
 CjOs9OncAIRJxBz/ijw==
X-Proofpoint-GUID: mMlQVx9yDqEgRFLRSdGIBd284__iGhqQ
X-Proofpoint-ORIG-GUID: mMlQVx9yDqEgRFLRSdGIBd284__iGhqQ
X-Authority-Analysis: v=2.4 cv=Mdxhep/f c=1 sm=1 tr=0 ts=6955172c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bmOu7kEL96IPmD5EUUcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310109
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

On 12/31/25 9:45 AM, Akhil P Oommen wrote:
> Some GPUs like A612 doesn't use a named register range resource. This
> is because the reg-name property is discouraged when there is just a
> single resource.
> 
> To address this, retrieve the 'gmu' register range by its index. It is
> always guaranteed to be at index 0.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
