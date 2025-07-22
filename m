Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C6B0E59D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 23:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2BA10E274;
	Tue, 22 Jul 2025 21:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOt82l1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1961710E719
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:38:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKU3Li016003
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LxLJaMV7OXItal3Gz6wp6eY7p9oi9m5tlAOw82q3OnA=; b=kOt82l1NSr5ROuW3
 bSRdVdcSuPIGn/CQpDL7Cx3fTxSls+G/0PFu4oe+S7YnGvMzsnExL4A2JYMuU6j/
 FpvKW74RW5VJNw575g/fa5OHg38/3bjnCLhQ9fZNx7vmPUJkkpOpTQE3zXv6VPnz
 Ox7s1+WZOzueyqBvjnvUEaHWgF9g/i7VCJ1m5lRBeJsmaM6PHvDITBqnvDHWLU2k
 96ZQQQtrTtFQcIRLXh4qeBuRX5n2KAJgv40GtHJ+TaW7+2l+TjEgmdc05mrlSr3/
 eymp38UdfXg+FzSt6ZG3W1mEcedKzdh76t6gRHVvPoENyJ6tI4HvohhnFT8UjhFZ
 IFBzfQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w19c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:37:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-740774348f6so5752589b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753220279; x=1753825079;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LxLJaMV7OXItal3Gz6wp6eY7p9oi9m5tlAOw82q3OnA=;
 b=k+OkiaMly3RM7UERwXBJnPwu8XnqK0SxcceN8BkNrsD5z29YJYknH1nPzBR5M4C29+
 KjbeY+dNsQ1io+1BUQLF4mXBQGS8LI3gsSFPTo3yuKU+3skgBOkJiZv/dOsOExolbWl9
 kTPZ4mxo24AvwYZ4StqDpDSyNfHmq5rV153fd8OJDDq01PiU8LmEcdsooVU6ew/n6jfK
 g9K4erUE3ts5WnsxFMqbYFpxfbfK4dpCBP2GX/TPsjBNrCKdKGmb3FYKTexduEOZdFH9
 NgwaLkL0sZkApi+nq6Ue4oiBWtyWZed5wXCgXgxLSPr7/cDRHpuHoBOBGWGTNqweNjTX
 bajA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs0Gvta6iB5LoZ6ygEpuC+1jRntX8DaMWfTcwWcb6JrizRNYXAr/S5wauSSrMub1fztL54nO8BQik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo2Bw5k+q4T5xSjZ79rOBwjPsJSSvPDDZY5jqlo2tFEDi2GTZN
 qG9HBVpfLuQB4nb2pnMCHF/7678Yu1sJ3aGTWblVm7/B7/5IS98H2MiG/82TmL5Eh+ekwPUDDQ6
 0wC2hNiddSHNfWME+4uwP63uai+K9piFeEMaggKUhQwxVODgRM5bo+qI8wkW5MxrcSSQEdpg=
X-Gm-Gg: ASbGncu/P0x3yCMtuzL/q6sO3Tft5GL9Qsi3N4ygawVHomStImTav0B1PEcUtimSpI5
 Fx0HgMNX2ku7UUYGNLHHc2yMxF4q0gn1bEDbgbRXrvtTImn/9cQLtqI3tyTrF8MPabcJs2uYCgM
 yuU+8SHaVtXvMgyqHXxKfhDN9c9vgc0mJfJ5JKH9aFx642gHg6B/+037sL0aLvZroBAohIcnZXv
 VGJWC7Sx/Uk+5bkoUQsJK2p0726UUIet0mHrNYPksxbaOQqaoOiTKBh2WbD7qudniExfCt2wkZG
 KOo4Jq5H1IeU+/jPv24Ys85G7FNNyA4ZDGLykWmw3STGFTTtq7UFAV27qIEGk8Lf
X-Received: by 2002:a05:6a20:3d88:b0:23d:480d:1c8e with SMTP id
 adf61e73a8af0-23d490f610bmr649763637.27.1753220278616; 
 Tue, 22 Jul 2025 14:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUzh0+F2fFC/OFAdVApFhTjPc/PEurlH2lfCsWMfZmPW8kbCHDDIcYhoLoJAcVU+iy17tT6A==
X-Received: by 2002:a05:6a20:3d88:b0:23d:480d:1c8e with SMTP id
 adf61e73a8af0-23d490f610bmr649724637.27.1753220278164; 
 Tue, 22 Jul 2025 14:37:58 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe62d9fsm7733090a12.1.2025.07.22.14.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 14:37:57 -0700 (PDT)
Message-ID: <85073de3-3933-439d-9912-1f0ff145df97@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 03:07:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=688004b7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=0HPixKO5BHaGtdwfH9wA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 0prKh6GkWSmncVqYy3RpojrM4KHXjWlz
X-Proofpoint-ORIG-GUID: 0prKh6GkWSmncVqYy3RpojrM4KHXjWlz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NyBTYWx0ZWRfX7zf3R/I3ADtZ
 hK1X8MvKYuXlUVkMdC1aFqcOEs2FxZHI5budw5zAueLQADl6ioE/lS1u2ze84Lain6Ww49HtnPZ
 fEQpwn1qEx4HQhg1AU+fSiXuc0cPfw47ASlnhcT7tcfyM5OuTcAHNKeKhhWcSotwOlgSfxtbOCI
 4jbaKLPo2b7mnf6qmG+JGfxkWxonJUDvq/74Znp/g+EEj9G4IKTqucN5tAv4BD7JyYEW/MBgP4J
 DVA2/WJF1qnnBIrWNCSMRNFnajMUlm5Qm+txPwj7v4Os6qNK5mchkJTwpJ9GdJOk4n3baG5UmzF
 GyA0LC6cHrrLa+iPuWTbfkVtNpZuAlhJrvv37sT72SgoYGDHFxKaJAkfgu3YFg7ShMfv+p0wku8
 5VSG0AvQ5lxAQqTIZsAsz7ml3/DGc0BFGK0vSU4qffYHVJpk5oSOxO/epC79i5tdtxh72X0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=732 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220187
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

On 7/22/2025 7:25 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:17PM +0530, Akhil P Oommen wrote:
>> Add the IFPC restore register list and enable IFPC support on Adreno
>> X1-85 gpu.
> 
> Nit: GPU
> 
> I can't stop but notice that KGSL enables IFPC for a bigger set of
> SKUs, starting from a630v2 and a615. Is there a plan to get IFPC
> supported on those platforms?

Sorry, no access to those hardwares. But I can certainly help if someone
wants to do that. :)

-Akhil.

> 
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>  3 files changed, 78 insertions(+), 5 deletions(-)
>>
> 

