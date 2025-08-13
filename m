Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E734B25693
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 00:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E123510E7DC;
	Wed, 13 Aug 2025 22:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9Rmk/HK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8347810E090
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 22:24:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMGmjS027429
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 22:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q7gth1q5wXt2kbolj7dWwKraNNmPxnZCoAelNEomImI=; b=K9Rmk/HKt+36obya
 M7UIbbgfRjSYDDYDWA3EMZ/BOIvwNdm2eFMRYEt3okNQRPA0cpkcWri3lnn2208z
 b57DhfPUBmsM/a71CsC8D0O0AGP4VNVIBDndA7NCLVIzbv38FMJIAfi+yQht2xNc
 VSuQDiWxyoC+8D1qos/8AaQZjYj43EmBU0CdXTGnrPwt10R0byL6SP7n2tRHtW4e
 MsTJ/Yw/hRfq5eyXk2PmPRIR41v/3ydboLU2mE6ABUihzo1eKQ5uTw2fr3QnZz06
 ecyaMqZzanckeqGnfFNvxfTg4ooITRU5EAIh1v9QvRicXdAvrfMU8kKF4NuFc7QW
 G8R6UA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjs8u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 22:24:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e2e614e73so349399b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755123871; x=1755728671;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q7gth1q5wXt2kbolj7dWwKraNNmPxnZCoAelNEomImI=;
 b=my32Krs+4DCJ5gZ9nxVP2cRq7lir77u3Cb8L0Ge7NjPpb0cBNyGZOIaQCAy3viefcj
 ZqZo7IbfEJViTenjLCuxcMzmwDAwnjOWu1HEPhCUKLEM3PX3IkdiNsO+icw4q870roG6
 8506yp1kPHnzRMc1tnlubIciujSXYfRg6BGetLTKhVT3yr35qy1bCCHJEM7y0dy5gSHL
 2OQXcRwLIbJNh3EIjsJDklLVTY5JxZgJGLUSiqX/dRk/fu+m+viCXRmxUtQ/DQPHUDKm
 AuX9m2jyu5NSXFf41dB3V9SzPST4MwW53ZZpV6A+GX3n/vgQ/pxtcCKVBJCLcFlKYugc
 mKvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk6OyQd/GSCiH5KsUxroYOlbsAgbhczc2BFWiO/4n4ObhOnzoSkBBUfBCCjKl4pULyAbBg867yyLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh4udjkd5cbtTG0hiXnHpde0F9YCiXXnQ5JgFSGZAQNh4RtQUz
 KSFAHZbavRVD7KE9jcLv/JT77fWxkYSrI/LGPlQzCBBv+YeQLrZ5/E97IRD5RglUmpXxyiskniY
 UesDd3++NIKUfn3s61wSIG4vr3vvRTZPhIpq18bZ61uPt/6T18QQweDfwEcGiwqV8Bm9juA==
X-Gm-Gg: ASbGncs2IGrNtkvZY3VcNBhrT04ELKQ0pPTx8SRDGtiYGikzsMk7g0Y1PT+hmiH5S1X
 uOi5DOBA8dj7wOdpPgLjjs9GRWuLN26Ua9BfgjvAZABCRFf1j/gwEtAPmHoZy8EC0os0gQLosrv
 WyUryAtsDuYbH0C1UEuebHuCWglLoFRRHKAR/c4PKI4v/u2AvYrLRl5w6IsDLGEA2Qxd130EBN0
 Ga+yBQh+COJ0fbU7fQNyxFobwXDt5zdevsZCI4fu+Y5zS7l3wrqvciTOweeMvLZM6Bh9U4JcpXk
 +lX92+mY2TgL5M2TXay85duDs6r7qMZtkfhWGzNVWHYT6ZY5+fAJavcUOQr+tapRnLx1bU63ACP
 K8w+LjsGiO892fuRj5CKjcAaeJzvFVn9dUH3jIA==
X-Received: by 2002:a05:6a00:3e24:b0:76b:f1c9:4ec9 with SMTP id
 d2e1a72fcca58-76e2fc23e59mr1085317b3a.6.1755123870899; 
 Wed, 13 Aug 2025 15:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrd6YX7PSuR1I0NvscqCwDnSHruYilibycjxTioyww4LMs5uJhtMWQp7pwAdosrJAlaZ3ajA==
X-Received: by 2002:a05:6a00:3e24:b0:76b:f1c9:4ec9 with SMTP id
 d2e1a72fcca58-76e2fc23e59mr1085287b3a.6.1755123870379; 
 Wed, 13 Aug 2025 15:24:30 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfd8ebbsm33032684b3a.102.2025.08.13.15.24.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 15:24:29 -0700 (PDT)
Message-ID: <d81abdef-18fa-496d-8493-e8f336c43800@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 08:24:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
 <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX3s3kHIy5qrc3
 xZ+IUeYY1o+sHCiqlFCGIpkHGhKcTfMu1PgKUDn9lSPZ8ZTby3+27BfV/KiS7apiB/y4FEvuG5I
 CMpOg3HHhhKXwfpv2slPcZH4cY5uAmRcpTO6/bz7nc64tjCH3qrslePTIRCbMthAX+ky1flbvl+
 dJCs6LrefiDCK4bhmUB8fmsHA1FClW9D5rUNRnvmu0gNWx3J4r2EujozaVCyrx2AaPeBxh/cGWe
 YdtddEBQwRSdNdz0p7phgVZY75VhoLTpHz78lcjAklzQv/t3I88BItBh9ZnmU6D066TmrqyE9/U
 VjUH6/8nWtqmvEtsuR/7M06hJ26rRJPOKXZc5/4ZOK9WOaba7IARw6RyeaeHioR9Gc84aCJfH6O
 OTGxLDKS
X-Proofpoint-GUID: s7MOr_Yonvj46Mr3m-65C3SAGUXquNFe
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689d10a0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=ShNZIzb07UMatG3o2d8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: s7MOr_Yonvj46Mr3m-65C3SAGUXquNFe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
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



On 8/13/2025 8:00 PM, Konrad Dybcio wrote:
> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>> Enable userspace to allocate shared memory with QTEE. Since
>> QTEE handles shared memory as object, a wrapper is implemented
>> to represent tee_shm as an object. The shared memory identifier,
>> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
>> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/* Mapping information format as expected by QTEE. */
>> +struct qcomtee_mapping_info {
>> +	u64 paddr;
>> +	u64 len;
>> +	u32 perms;
>> +} __packed;
> 
> Please use types with explicit endianness, e.g. __le32. I'm assuming
> TZ will always be little-endian, regardless of the host OS
> 

I'm not entirely sure how this point is relevant. As I understand it,
the core that populates this struct is the same one that accesses it in TZ.
Your argument would absolutely make sense if the host and TZ were operating
on different cores with distinct architectures -- such as one being
little-endian and the other big-endian, which is not the case.

Regards,
Amir

> Konrad

