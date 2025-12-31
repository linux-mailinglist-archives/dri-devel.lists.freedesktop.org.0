Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F13CEC5BB
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 18:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B23110E12D;
	Wed, 31 Dec 2025 17:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJMm3lvy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SJqALZW9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D36510E058
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 17:19:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BVGIUji3315362
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 17:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FsVwhGeSNZjfI/xypJprbyAZCILTaLME2r61MFMi/rc=; b=MJMm3lvy/Y3eQX81
 p8lLCK0eriJYaeMJ6JuMn/cjt07FjYOWk7wUlpbgdrZVZ/0dNvoxqBbBTuN7l5hW
 mtemvEHuwI/+iEq5whqBp4cOPxh735vyuvtI1YeOeccb5T3jDEM+cKxawQwcXSWj
 vs78HRATyEEzqVdgUZsBHNLOcPT1H2y1o/1/28mnPRBBJQ+lzBEiB35DfUex70qb
 SI38zYCmFz0wOU8y0EmUaNfE9KCmrsMChAM5QR4p3p1tqBRwphStt29mkAXtwI2O
 2Ol1TxcPwliGULd+EaWKVo3XSrQT/5JgYXydZAFfYBaasDNKq9CbkMuw2OGlJa97
 q6cKQg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77c82y4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 17:19:47 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5dfae804e02so19804827137.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 09:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767201586; x=1767806386;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FsVwhGeSNZjfI/xypJprbyAZCILTaLME2r61MFMi/rc=;
 b=SJqALZW9USW0l2sR4/EBPaXj8EdGmA+N4D3Tbgq+uYvl6TitxAX32rIhYEhgTTF3uY
 IX3POqzGxRKV4pdO7NmOmOhSQ4k3z9VRfrCL3z2uyaNNpudEFiFRhsiGu19hO7PyHDx2
 uXYE6MLIkGVvTyNwbLLyyAmsb3BZxrfgXrNpL4dgibWpuM3uPPPGkgHlOISFIK0E8Ye4
 SCckBg7Bnmubw6ehOvHYF7XrLTpT9AckICRmqmB4IrvlFfhxDbQq/n83OEIMmMbl+Qu1
 v2idOY3166pKaHY3g5KU2EExZvecIVCJIVKARFn7gGwvETeagn9mmAFEESJNphCNCpZD
 6ocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767201586; x=1767806386;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FsVwhGeSNZjfI/xypJprbyAZCILTaLME2r61MFMi/rc=;
 b=P4H3sS32a9K8bWhX3cV05VpxbNCLf5briZjFWErFGZKDyoDhz1ogaE+OCEIUZoQzhj
 y0DnMM0ww6EvI49sD2TLHRZtRQsHwfqDfugoqDhArn1K2Epcm9oA2I7+a3CT+RIOmI4p
 bw5iVaSRycYBIgmKnHP09YW5eFtpZiBLA+o3KKVW+BXrU0mNpaX4cAsAvpdEckEScq76
 vON04zV+mvhHUHKUUp71aAZgtq3U0QylB6Tr2zEwfk6lzr/6NyFq0m75/R1WEHZpzAYl
 6kFb6W23MonihPGyckLUK3zGSAomWpbcnMsgVxM/BHYHeDhNQq3BmZBduUdz6A6ZutWC
 WXYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGwfiVf8f6qO8jjHNosQ9Vucy/4acQRe611tv8JVXqx3VM80slglSRWpw00Jaqr8q/cPkDpqVRF1A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPB2BsG84+QBxV+1vH4fWs/jPWmL8CkbPzzAKho+EOSoa77+2M
 ZnoE0AK7J4cLDdqGnoIJXZpRST08L5Eb6my1SQCFu2Qi5HunUyj46FLJGTn5eYHwKjPlG7l6Fda
 d4B1yj8gYwNlC8dQR4umwowcGNBN7CBhVVlQY1b/l4J24R6s/oJwFQFDTSVq2Cl/XM6KGnOc=
X-Gm-Gg: AY/fxX7xLEqu/PWRgDyOS6JPqzqf2xrmQgAlifDwRuWs97cDkxO2ZGOCmuvshI32FQU
 pQ1iGG1d4/SX1sZRHSoDjcDWO2nFxjsirm3E9zNksenXsDTYza0qIFHFZWKjv0yPZpbiSGjtPhb
 GDfkZ79ZTtzvaSgbF68yUmHr4dc/NyERDyrMQW3aM0YHl4opXyYejHCeBnfU9SyKoYnj0FG5Xhg
 u/8SKOtgvAQtediqMEDMAJRIDZMMPMCCmFALVKsB2OJdhccYQtEw1KQzF8GxKyjucNaahINpJ0D
 +PMz6lrU4EKm3kLh7/fMQph4Y1gfRl8x88vrVGNaAEk3QTtAg8SL0zn48hxtBbJ10wtN/SZ7A2D
 rI3KMxAIEWeQSRbqs6X08uATASrfbG1+5/uljVrpGqGGsMeIxaq06pvk9G3qyc19mQYev5S7n/o
 OKf/+XKvd0kiL0TpMIOZ3AkxE=
X-Received: by 2002:a05:6102:6441:b0:5dd:37a3:c389 with SMTP id
 ada2fe7eead31-5eb0237d5c0mr15223315137.2.1767201586361; 
 Wed, 31 Dec 2025 09:19:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx3T6dkQkJD7EfRSRFNeeLsOEG0OrMkSaoi/pwalLJ0EQtX2UMRuBKbYrQVKniuFZcoxPG6A==
X-Received: by 2002:a05:6102:6441:b0:5dd:37a3:c389 with SMTP id
 ada2fe7eead31-5eb0237d5c0mr15223311137.2.1767201585958; 
 Wed, 31 Dec 2025 09:19:45 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812267b184sm98222551fa.43.2025.12.31.09.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 09:19:45 -0800 (PST)
Date: Wed, 31 Dec 2025 19:19:43 +0200
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
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: talos: Add GPU cooling
Message-ID: <gwrg55ytewfhlz7w23yl5ac2sjic5uise3cv7jnmuahnolompj@jl7ufr76wokb>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
 <20251231-qcs615-spin-2-v6-7-da87debf6883@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251231-qcs615-spin-2-v6-7-da87debf6883@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69555b33 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UQAiW8fk4jwks4S4FoYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: b40Q_lgtVoODCusfG0dyHdbJ6Eg0ZjsT
X-Proofpoint-ORIG-GUID: b40Q_lgtVoODCusfG0dyHdbJ6Eg0ZjsT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MSBTYWx0ZWRfX4vLNxq1SLilH
 mZMv8hdilRemsBtjGkxYLgNeik1h2P7NOk41+O5xOvp4rYQF3JcsezOkcJW1S7fDCWbRtgpAkHK
 0NuPh02IrUyggHIU835YoTFfEEio3gA1NxsKVN6qrrxPS+aRA41xYtp4gWEQX/R2t+1GXBnSZ4a
 ja/bECZoJERPsunc2gIcDoCwfikwr5GqjzWBpoyPSbk5m6XySJuGTgeeBGHSLUQ07PtJqkwkTK+
 RBspPZTKGAWqcMiEgARtOcDk9KJsmQfpjrJZqvkYx07/0ylQfvMTFw+4xaVhaOj6Py4gd9OBUsq
 EcqV0WHKXYX3bAzVolGSkK1iOXMJmE2RFCTxX6dcYuGm1EHQVk3ojaj66nUI2KS1R6v7zGfwypH
 GvooJfYWZIJTemwrz5Cz2ygbHJynAt4YYR9CmnWan29zBf8BMvhKneTxzmwPciXPFT0WiPllxvA
 8IjYm+kPKkWdsyC8DsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310151
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

On Wed, Dec 31, 2025 at 02:15:28PM +0530, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed when it reaches 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
