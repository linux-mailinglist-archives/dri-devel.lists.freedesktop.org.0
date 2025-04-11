Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089BCA85853
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 11:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FC710E03E;
	Fri, 11 Apr 2025 09:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="moQeEa2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B500910EB4B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:49:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B52TG5019642
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1Cs7Olcf+iGn0kiLuKLVzTGFucVizSpTxlSXymspVxU=; b=moQeEa2ISOojle/w
 /JoZ35u9aMiF2+p6HCZg34oGywaDgM3UO6AYsquLopCnm2ii7ww9VjjFFP+6ILWf
 1yWC6q24vXnxgxjQ1HdvUSFoWoMniTAKXLQenjw3n+7B179Zujl5ABxIQyNZBvHb
 FKsuGrlN+HAxQlaw9WhDATIC8yFlE1WrvzrFhOIxeJPBFk1+N7b/Hh0Tx7XroHrt
 SzmGACtbeVq9MutycP4bCOvwBrAn6juwgncxGlsrsd8v1kw8I9zFRB1wfSPpFPXM
 vnrVnTPxtVCU7Y2iXQ2nubr2mOfGdAswvuYdVe6buWL2r7RW3LegenEu7yxad+sW
 5DrE+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrt4an-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:49:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c76062c513so40105785a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 02:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744364939; x=1744969739;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Cs7Olcf+iGn0kiLuKLVzTGFucVizSpTxlSXymspVxU=;
 b=TVaTcofTOQhrmZW72KVvNqfHqslW0CAiCDjzhJOzr2yGHH3cEIkbd9nzJ7NnYz6HO6
 dVpeVPr60bH/3Hc+wEzeYY09gLqNm3ZJSCvB7DT2UB9NIKIuGYInjv2d+WfG8Td2Q1tf
 CWfr2W5Nwt8GJmaXRvqI8EH777oo9vG3HQ6KBJQpxEkQfTeMk+o1o6pZn6+KugJGF6Q5
 lGNnTQykj29e4OmNu9EjvK+NzZEddsyaWOcsjRQZUa+pU2KQsNytVgQslbmReDY1/1cj
 BS9HWJZJL/bvMydrPLNIxM7UbjgADltSUZlA9nyLNPM7Iq0evL27BKqVYT3WpQW9DHJi
 GGrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAujxEBplq0l3kY7QI25Cj2tuRYMlnP8F2Al63wyTIHSj/aDt2mMiJu5OUs3Syfhqu5f/t3NFbo7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsfZA3uAFua+84JnRMKdDBZGvs6wydLDSYuZ3sWtUCmGSynVUi
 UMPysVfpQmnyKoVYBU6UHB2nNlKnS9ff/tPbqnHBudT8Tj2tOlL3wz4q7Egrr72gLM2rPTHy0aB
 NO9QZT+hY+Oxd/mzxFLXLbx3OCmBy/sOZb+rRgEgFleSPumoaAS/tH8+s6xn0qRi1H0o=
X-Gm-Gg: ASbGncsR3wD5Mz5zSyeNN0HRhewC1eP8BJYW/X/Baul3TjMBQeBBQ7Cfp79BEmrSja1
 D3APj/LmRbm72qIaj/X+urQiDC1HXphMTEsp4mUn6dkyX4kB37f5hn21hlMnmqeZo+RuFxJbcno
 Y9YyQypIknqHt6CvqvhVnPSvV7EnuhHTKddrFnLroKUciFOVvMWQjBVpfmcbciYKWMLpsrBmz3/
 uXGlwu4Dv7SrzmSRbeonNkvrl3P2ajet5MNBoAC8zkhhruGFWwK/s3Kvc103EDZUb3AF+d7fIRS
 4QEKtfTTaUBF2PHr2M6+yA/4rTNr+DkCU9k5NemGca9/HVKMow9glAq7dJda/NlDCg==
X-Received: by 2002:a05:620a:254d:b0:7c3:e1ef:e44d with SMTP id
 af79cd13be357-7c7af04c112mr120742085a.0.1744364939707; 
 Fri, 11 Apr 2025 02:48:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9uldhSMjj77tDXI8Od9HS0eE+YcyHVF3EP8I1eSD53hf5eI36oThMUSZZTFoT4LlFjZitIQ==
X-Received: by 2002:a05:620a:254d:b0:7c3:e1ef:e44d with SMTP id
 af79cd13be357-7c7af04c112mr120739985a.0.1744364939225; 
 Fri, 11 Apr 2025 02:48:59 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4204sm415022866b.116.2025.04.11.02.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 02:48:58 -0700 (PDT)
Message-ID: <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qP3op-DiotTJjQfU8UNQQ2hs2DYLYbiw
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f8e58c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ur0lq8UJKF3ET7YIcuwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: qP3op-DiotTJjQfU8UNQQ2hs2DYLYbiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=880 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110060
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

On 4/9/25 5:49 PM, Konrad Dybcio wrote:
> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
>> On 09/04/2025 17:47, Konrad Dybcio wrote:
>>> SMEM allows the OS to retrieve information about the DDR memory.
>>> Among that information, is a semi-magic value called 'HBB', or Highest
>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>>
>>> This series introduces an API to retrieve that value, uses it in the
>>> aforementioned programming sequences and exposes available DDR
>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>>> information can be exposed in the future, as needed.
>>
>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
>>
>> - SM6115, SM6350, SM6375 (13 vs 14)

SM6350 has INFO_V3
SM6375 has INFO_V3_WITH_14_FREQS

>> - SC8180X (15 vs 16)

So I overlooked the fact that DDR info v3 (e.g. on 8180) doesn't provide
the HBB value.. Need to add some more sanity checks there.

Maybe I can think up some fallback logic based on the DDR type reported.

>> - QCM2290 (14 vs 15)

I don't have one on hand, could you please give it a go on your RB1?
I would assume both it and SM6115 also provide v3 though..

Konrad
