Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DECA7C042
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 17:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF28810E06E;
	Fri,  4 Apr 2025 15:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oUsyGKrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD7810E06E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 15:09:04 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534EsI37032626
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Apr 2025 15:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wkJ4A/aC7pKXYGEy7Rw5miq0Hsw92wemjeWCtzrGHaM=; b=oUsyGKrrHUGn4Alj
 rxNp+f/UFH99gXiyhYEs/8cx6XCEmAt5yWxwxz1fJm+5Z/uTdqX10hY2n9ljnkgy
 BWRps3zVIrQD6VxYpzW2ztsGn8dtLLrlt3V39NSlpSxh1m/MM/I8FqddrUPpNp/S
 y+uDfzprTshxIQGPJptz6xcM+7Xh/NAtIdbt381ZED+u4Rl70J31TBQLu5BKxWfn
 v2CWBBUyfMPuDreWgXqMxOdHJHdKfl+SjfB5bJSL36ENqPL5rdYldBcIWEPdFoWa
 OMRKab0RhK3rvgx66semrgJyM+iDAiBHtvRjacgIN0KLrIwKFf6hHKAT/hdJyzPF
 v0kHSQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d8t6n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 15:09:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-224347aef79so30987835ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 08:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743779343; x=1744384143;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wkJ4A/aC7pKXYGEy7Rw5miq0Hsw92wemjeWCtzrGHaM=;
 b=sahC2gVdtM8N04v+CGDUWcLMiKZ3xCaGjHmQ+GovFtKumBh72Ukyzg6wAYNktrgg7c
 e3FTjaQeXSWpLybtRtnaddVTL6/YLSTTuP1gTWNJQwKTq/ONwHmP6xV0g13WXdYWiAhh
 uELx7g3bvee9eW4SqzvnzSEJQJUZjIn0poWFsZMFqT8U3RYc/ju5Q11PpqRPZAZvXxJi
 nouDpoDz9FGxPZowwE0vLOBhDNEYxMa5TNvP6w0cq29HGnpwRGMYjETMHRLI+rPQrdof
 9Avc0ug4ug3XAGAoi/FEKbVu391JN8P/4UfEHg/bXpVOM8H6LksLx++MbLqV6m9pdecz
 +Qzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGG7+ind98BsI0ny0bVOktNV7u60h+PXkxUpzug4SdUjUZ3t+vfrfu37e9L8sq7Pcbwil5xctY7C8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfC/n1GSXuM5Bbt8VRAtm751CGQwDBuaEcs00ImJn0tGD6xYId
 YI6rq0SBXrGJjro1CviuEiLrpa4HUArKxmgXz8p/VFp9QyxG4kuJtPheXuT6UQsyGrjvYStMBLd
 DXBCejRGxRbQLJmNyE7eENf3OmzdHBBZ86yYAPhUuMIeQ48wwSWDUcsi9U8e7gzlrv2Y8x2fOzR
 k=
X-Gm-Gg: ASbGncsMx9lbiIUifA34yt2EcBTNJx2PT9dRvucT5YorFgcWlgcIEVTqsuGdVnEsU/2
 HB6vhkGv1BxmtJ1TIVMyTw7+RWuAVsh9zEm1NEuiKF+faFRnZjaf+3dGgjBC7uONsv2BpbWVPF2
 EB9IE9Wq9LCReFNEcpcECGNiJ5QEGrUytbSmeiyhg21HfGEGc0PmH4wqdcsCtraVPcQe+L8R7Dq
 HDonHWcccSanQEjfduCfQreW3VD+Qz/j0GHc/TTfiAJXCarfjZeeiACqNeA8qwrifwl+v0M2pRw
 cnOqLZ+FDeOFDRa3ujpuT8v0SKT0KjTae9m1HcZP/WvF32gorfLYzj9uSqLMpP6APg==
X-Received: by 2002:a17:903:2ac7:b0:224:1609:a747 with SMTP id
 d9443c01a7336-22a8a07e75amr47276285ad.31.1743779343038; 
 Fri, 04 Apr 2025 08:09:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENFz05Yp4dLMQfru7T9w7HO2RpPSzpYzX3hqg3qF00f8PIzAReAOci9J80pjBEtzUHdJ4xTw==
X-Received: by 2002:a17:903:2ac7:b0:224:1609:a747 with SMTP id
 d9443c01a7336-22a8a07e75amr47275995ad.31.1743779342684; 
 Fri, 04 Apr 2025 08:09:02 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739da0e7cc5sm3559585b3a.176.2025.04.04.08.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 08:09:02 -0700 (PDT)
Message-ID: <38f15544-57d6-4963-945d-5bf8e2c06343@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 09:09:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/ivpu: Fix the NPU's DPU frequency calculation
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 stable@vger.kernel.org
References: <20250401155912.4049340-1-maciej.falkowski@linux.intel.com>
 <20250401155912.4049340-2-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250401155912.4049340-2-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KNo5SWs_rylYm0GyqEw4YRIeATYH4ixr
X-Authority-Analysis: v=2.4 cv=IeOHWXqa c=1 sm=1 tr=0 ts=67eff610 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=p5fPCWA-AZ_0pnIrD7IA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: KNo5SWs_rylYm0GyqEw4YRIeATYH4ixr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040105
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

On 4/1/2025 9:59 AM, Maciej Falkowski wrote:
> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> 
> Fix the frequency returned to the user space by
> the DRM_IVPU_PARAM_CORE_CLOCK_RATE GET_PARAM IOCTL.
> The kernel driver returned CPU frequency for MTL and bare
> PLL frequency for LNL - this was inconsistent and incorrect
> for both platforms. With this fix the driver returns maximum
> frequency of the NPU data processing unit (DPU) for all HW
> generations. This is what user space always expected.
> 
> Also do not set CPU frequency in boot params - the firmware
> does not use frequency passed from the driver, it was only
> used by the early pre-production firmware.
> With that we can remove CPU frequency calculation code.
> 
> Show NPU frequency in FREQ_CHANGE interrupt when frequency
> tracking is enabled.
> 
> Fixes: 8a27ad81f7d3 ("accel/ivpu: Split IP and buttress code")
> Cc: <stable@vger.kernel.org> # v6.11+
> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
