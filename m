Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EAAA862F9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 18:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B304410EC15;
	Fri, 11 Apr 2025 16:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZUJlcqX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0142E10EC15
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 16:16:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFiSGI019629
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 16:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4IhlaAVM447bRlfi7RkIp9IzM8AW0t5T8e260lhmWr8=; b=IZUJlcqX3iFQJxmv
 b4Gl6CvM1wCowY4OrpLABeMLNYcfbIPv89CGhTHGgycNT52L9qdKZMbNK0tDNC4X
 iXpeRofYnSQRlVt+E1yvLz2ucDWhx4IFcqdNLtiWFpOTnepfO7o3NHGavGStxon1
 aMaUGCncNbGVivzOiwxfFAiaka6IRkyyr42C/NxkyZ2HfzFAeakE12R4twR77dtm
 hGTABMO1h+SBfdOb/0W5evCiUnBOj29e3r64eAVjPRojImhwcvASnvA0Utd7VME3
 x7Z1rNx0cAZ/svZpxQMVumh/0cx6mI1sB3Z00KncltYHhjiIUaqWbBfrNePDQAFD
 GY6I3Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcru3kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 16:16:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-73009f59215so2447854b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744388175; x=1744992975;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4IhlaAVM447bRlfi7RkIp9IzM8AW0t5T8e260lhmWr8=;
 b=BdMS38saq/zug2NcDl8q1gXURKvlFjLVuyFC8/K0E7L63lB6bAK4rp6fuHscrA7UVs
 qYcLxBC9d8g7n8g4ppIk6x0kgV450hN+hhB4oI/8Q7pHdM5eYcyg0/dos+BJzsrC43qg
 B436snnVYz09eDL4uYeAi1QhbgA0fw3XWhhHdf/E1sJMPb5B7eWitn0KGhwZeTSu9Bn2
 Ls8Ci5OBgZp6B3AkiYIyoXLnTFdExrzjMZVx6M1AoESQNTwosP+M5ncCiwFVIVpOfshk
 wpuHDa3NiRGcEyh+25nNBETdUaUsB0POuj0g9YIjJ7aOjr0nvyId6tk+21Yy9fZ/YzW7
 UE+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy7RUQ09pxkIccymSrCL/4fjnnSzkYT1SlEzGDY/NpwyApsPcwPw3PWV6j/e0FdF7irWO34HgaE48=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgQ8oSVujxHoYj5AJHcU8ZtVfvl7/k1tBjlVFr9cFaaLldKevA
 Sg6tt600S5bgQtRrvyOCQuY/ESacL8zCufv/Fe8l8q3HkAto66Y9OfOxRIUC4rShoxL3Lm01uYo
 1vpPakxv7cIzzLo3U4sCNNAvfLaPxuo1IG7J/pqcHXnLqIGejarQ8+SG4kZiCLiqv9mQ=
X-Gm-Gg: ASbGnct+x1cuSYvo28Qq0ZAVE7iV/jMfr84WV4JCKyhOaUORNwgdH79l4r2KKCrMrUB
 3EFPtBewrL7330dtjL2SIRCp1xiKBr0gEaR/7BB0RWs4FgTYrKgskEIF2ve3n+X7gvkFZfZ1R1X
 TwE+ihboIdGRKgr/0ndQzW+oo9pHLZSj7BtpiFjObn/KvmqMKJlvExL2ZC+uSr9/32ifRpiU2lt
 k7rGOfGxk4KgGBZC+dPbJMOz58WCmh2uiY8fMrGcvTjVEkN+4+kGMXUDb6jt2s40U0Bg7btInnX
 RelchXZ/XQyezLGsfvYc6UlRftbPFVLCxZd1AhnqWUJ11pzB/LPUKOIoLMpHww==
X-Received: by 2002:a05:6a20:c995:b0:1f5:769a:a4c2 with SMTP id
 adf61e73a8af0-201797b96camr6010727637.22.1744388175325; 
 Fri, 11 Apr 2025 09:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2C+sSIwxuAmGGQvBGazeQxoErfToQK8MgYWtP1mBFETFneyUCN4Iy+2hWS/Y2/4HLTAN5Gw==
X-Received: by 2002:a05:6a20:c995:b0:1f5:769a:a4c2 with SMTP id
 adf61e73a8af0-201797b96camr6010683637.22.1744388174958; 
 Fri, 11 Apr 2025 09:16:14 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd230ddefsm1789764b3a.143.2025.04.11.09.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 09:16:14 -0700 (PDT)
Message-ID: <1c7ed443-a5b0-446c-8689-97fb8319ddb4@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 10:16:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: accel: add device tree for AMD PKI
 accelerator
To: Nipun Gupta <nipun.gupta@amd.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
 conor+dt@kernel.org, ogabbay@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de
Cc: praveen.jain@amd.com, harpreet.anand@amd.com, nikhil.agarwal@amd.com,
 srivatsa@csail.mit.edu, code@tyhicks.com, ptsm@linux.microsoft.com
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250409173033.2261755-1-nipun.gupta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BRTrnPm_6ImdgHGBh56w33LoB_fiZMLe
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f94050 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8
 a=DZtHtFm8LNTDz7ZeIvIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: BRTrnPm_6ImdgHGBh56w33LoB_fiZMLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110102
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

On 4/9/2025 11:30 AM, Nipun Gupta wrote:

No cover letter?

> Add binding documentation for AMD PKI accelerator supported for AMD
> versal-net SoC.
> 
> AMD PKI accelerator is a device on AMD versa-net SoC to execute public key
> asymmetric crypto operations like ECDSA, ECDH, RSA etc. with high performance.
> The driver provides accel interface to applications for configuring the device
> and performing the required operations. AMD PKI device comprises of multiple
> Barco Silex ba414 PKI engines bundled together, and providing a queue based
> interface to interact with the device.
> 
>   +------------------+
>   |    Software      |
>   +------------------+
>       |          |
>       |          v
>       |     +-----------------------------------------------------------+
>       |     |                     RAM                                   |
>       |     |  +----------------------------+   +---------------------+ |
>       |     |  |           RQ pages         |   |       CQ pages      | |
>       |     |  | +------------------------+ |   | +-----------------+ | |
>       |     |  | |   START (cmd)          | |   | | req_id | status | | |
>       |     |  | |   TFRI (addr, sz)---+  | |   | | req_id | status | | |
>       |     |  | | +-TFRO (addr, sz)   |  | |   | | ...             | | |
>       |     |  | | | NTFY (req_id)     |  | |   | +-----------------+ | |
>       |     |  | +-|-------------------|--+ |   |                     | |
>       |     |  |   |                   v    |   +---------------------+ |
>       |     |  |   |         +-----------+  |                           |
>       |     |  |   |         | input     |  |                           |
>       |     |  |   |         | data      |  |                           |
>       |     |  |   v         +-----------+  |                           |
>       |     |  |  +----------------+        |                           |
>       |     |  |  |  output data   |        |                           |
>       |     |  |  +----------------+        |                           |
>       |     |  +----------------------------+                           |
>       |     |                                                           |
>       |     +-----------------------------------------------------------+
>       |
>       |
>   +---|----------------------------------------------------+
>   |   v                AMD PKI device                      |
>   |  +-------------------+     +------------------------+  |
>   |  | New request FIFO  | --> |       PK engines       |  |
>   |  +-------------------+     +------------------------+  |
>   +--------------------------------------------------------+
> 
> To perform a crypto operation, the software writes a sequence of descriptors,
> into the RQ memory. This includes input data and designated location for the
> output data. After preparing the request, request offset (from the RQ memory
> region) is written into the NEW_REQUEST register. Request is then stored in a
> common hardware FIFO shared among all RQs.
> 
> When a PK engine becomes available, device pops the request from the FIFO and
> fetches the descriptors. It DMAs the input data from RQ memory and executes
> the necessary computations. After computation is complete, the device writes
> output data back to RAM via DMA. Device then writes a new entry in CQ ring
> buffer in RAM, indicating completion of the request. Device also generates
> an interrupt for notifying completion to the software.
> 
> Signed-off-by: Nipun Gupta <nipun.gupta@amd.com>
> ---
> 
> The patch series was originally submitted as misc driver:
> https://lore.kernel.org/all/20250312095421.1839220-1-nipun.gupta@amd.com/
> 
> As suggested by Greg, the driver does not fit in misc and should be part
> of accel or crypto. Accel is well suited for AMD PKI Crypto Accelerator,
> and thus the driver is updated as an accel driver and yaml moved to
> newly created accel folder.

Why does this not fit in crypto?
