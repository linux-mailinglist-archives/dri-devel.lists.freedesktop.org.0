Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C02DAD0692
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 18:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584EA10EAF3;
	Fri,  6 Jun 2025 16:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQcaqCRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BC510EAF0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 16:23:37 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9FWY018079
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Jun 2025 16:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Job4OHvLmpQl8dJm/Om4wAG+XGc+S/rzGCaXbIP5Di8=; b=YQcaqCRqT0l48uUO
 2j6Inu4HZHCpn+iR0YVB6vVAt9c0OgCoPUIWD9+TM5utxjoKRPCr1TmeRcdaZYpC
 4d/f2GRphDTg7u87Y54zZopADk5g0eOoVL1nHGMVN1696B2nzk1ZgdU65VkyP1h0
 pepezAaAbiRT+hoktXSYaIo6w25eMZIZ1kn/kfa9gycciMZdrfkvyGn4B4Wm7uEi
 K7KNU9IebA5YLyzQOS1JdqIHWkSw98PFrOUmZBZgF8Lz+rdHfL5myl4DGdpuevv0
 XSo5h0c2vQuC73bQxG1Odm1lvL0qmQwioLdKh1ipsMNgbG6Na3qtWf8xOHa72S8O
 Cxp09w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qd76m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 16:23:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-235eefe6a8fso16146705ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 09:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749227015; x=1749831815;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Job4OHvLmpQl8dJm/Om4wAG+XGc+S/rzGCaXbIP5Di8=;
 b=LV2IeeC+N27mvll0yKo/sIo3+0KIasciby5bEFq8Vvfk8nY7KtOoO1qES89q+W1ygn
 PlQ0znf1rkhSpMerBCCuyLzVbdXnZne9BxtqXAWpLCJA2QKhxT/R5rXKyBvOSdFhsu5v
 J9RrTiYke7SzaKZenYuL3i9gvEr5G3j8JcS7CMG+2DY70ZU/8li5k5Se/drTbIJYhMX4
 IuwtWiZhNLw/Y04gVDmeeLt82Hj91yNLNcY7fYIcPxf3TUTYCQFwtVXCQxXs8dpWFAlV
 JG/y2JQXHvaDOtmOvk8XLXQfVFbfhujgSmG8OLVhx+VFA7V/LDoBIbmsN9LV4/jDVrHD
 9YJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCGBLWZ38j8S4AZw27PCRYbbQnrTvgwa5gMINstbYileB4vZ5ngUiHAHP9ddAPtOTlecPb01pdqCo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3DLq8wm+aUqKzxFs/2WPnVDeXfv5zT1X+RgyrMSASrK4064St
 Ps4EPooygogXpijiExzmAs6uxWu9X/NCzzZMcaT1720sSCwOgqWDBjJs2vnRHJQrbfyD5DWYi+8
 K7JG8ljL/NBWESpLXDMoF+SZ+wzwXlInNtKONf6zaof2kf3t2N8Zg1z+5/9sYNieVA1vjdDA=
X-Gm-Gg: ASbGncscSGPPyF1lx9GV7KCvbA9UepAj1s4MJwRhiFH08gefczxP7+y+Ul1V4DRTdLA
 LuKr9SgugT8oNhaKrmtY1DRrZa2aZi6u2sMdlxsnYndZMPNuEuQt+ApzC2ljQMKG82ilrkbOCyI
 kNVTHugObfgJmrvorib7iw22eYbY0bHhl+7S3jgJ//0DkYWaQjWB2eYtD3yCfYdvY86CX9Q90M1
 vVMdSv4gaIwV/ykCLy3oszIhz3TyHIWZ4qmmqob2ShHnJN2S+8eWYGzpBxlaTSJRVG8AoAAQez0
 Jq+NHn4L22QolozCy8GZZg33qygf/CcltNs6GYlEFUnGtpVDxd7NKaEeE07HPUcLlk+hfthj
X-Received: by 2002:a17:902:f68e:b0:234:c22:c612 with SMTP id
 d9443c01a7336-23601de8746mr64735825ad.43.1749227015250; 
 Fri, 06 Jun 2025 09:23:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvdu7j1hiNa9Bh4+JNdA5dlxIHwAbYPjJF6d95Suj7sdkhTDaSz8RxGTc+rXFKXm+yku8QVg==
X-Received: by 2002:a17:902:f68e:b0:234:c22:c612 with SMTP id
 d9443c01a7336-23601de8746mr64735415ad.43.1749227014864; 
 Fri, 06 Jun 2025 09:23:34 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5ed58b13sm1365777a12.16.2025.06.06.09.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 09:23:34 -0700 (PDT)
Message-ID: <493fdc86-e29c-4d38-be18-46411ede66d1@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 10:23:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add initial Wildcat Lake support
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com
References: <20250605161947.1237727-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250605161947.1237727-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2PSwM-Qx4ohv_01sH_pTa4kXXW8-AYAC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE0MyBTYWx0ZWRfXyowU/HVY01Qy
 tELHvMbyQmdH7LaO9C9AqwiJDL3OZZ69CgLRJvtQJRFDAHl2zLf7dAhovzPOjA5aLsDVN9sF3Mz
 kdyg49zM2pEm06YP6m+P8DPvVY5DH8warP4m66sLGHVYf9ms0YvuSRYJPxEKpRDu/SGfZIGcHZd
 NDdyMMpquSfi+aY4BYxdP9QFyxLTA6z9lVcMS0JAWjeffs3i/bZEzfDn/EkBC/LhaNBp/3ksypA
 DDuRlNOn0dLLVymtYxsO6yBfzIGUFU/Z00NttJcxdOVPZiZvQEufa8Bb+Vab7PqeFHp5s0L9sTB
 FSg1JfmUdbvF0ZK8CWrbaw0KCDeAans0LqQxTq3lKqdTlDAiTnwbcb+8dOQ31dFiyzZzJlzg53g
 ITHLitubIDrtuzVvtassMNv7z1+uQh0v6Gg92msh8JYHlbeod/YWrmaguq2LlFx4TPHCd9X2
X-Proofpoint-ORIG-GUID: 2PSwM-Qx4ohv_01sH_pTa4kXXW8-AYAC
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=68431608 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=anBAwXL5CswY3QBA3EIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=982 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060143
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

On 6/5/2025 10:19 AM, Maciej Falkowski wrote:
> Add support for Wildcat Lake (WCL) CPUs.
> Wildcat Lake contains NPU5 just like Panther Lake
> hence the initial support is very simple and adds
> only PCI IDs.
> 
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
