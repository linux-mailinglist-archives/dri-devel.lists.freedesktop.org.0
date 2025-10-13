Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27CDBD6B72
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 01:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEB710E094;
	Mon, 13 Oct 2025 23:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTxATYvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0171A10E094
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:17:30 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD9RP003046
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fANAh/oCQmMIJHnnE3c5GDiSvFKJ+afyqczK4Zc3Jww=; b=UTxATYvlZFP02FHk
 xAtf7+PX5wdXmmun+1nvmZc4xpEtBkgAjYABCufbb5QkAACt5P+6ih5KVXB31kag
 txIqfdMkP7dyhZw1RCn3XOG9AXquqz9viKH3ZKejjoH+z/DlXONcqV3dqeKTEG1P
 CgqwSHgQrLjUV6f2GGD/MVbFZhkowS4chf/lRGzKG2cs1Tq8Ve+hDzHIe4gMb/K1
 6P1a4gqMY7izfGfuCAMKf6jbHA6xivxHOt9eqhlWoffv0cq0qxQtbxWuRSMeTpVk
 xwsV6BRJ/y0b21guHHM9Wu4/EmuZXWZZXLDQHQ/WTYnCK78q+jFl/wF0rJxlnTiS
 rzT/DQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0pf03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:17:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-28e8d1d9b13so89296385ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 16:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760397449; x=1761002249;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fANAh/oCQmMIJHnnE3c5GDiSvFKJ+afyqczK4Zc3Jww=;
 b=WAGwTwjjOW+PLKYKILPmfxa4WDA2wmKJhKL37SmBsDAYEFlFvSsRFaYq/4Ek+RhkA9
 d8hQ4YLiIgpHPJHH62D0sYnXjj+EYxoI6mSYR5XOa6K4BGQnu/AP8LS0FVGbs1c0Hbkv
 UAFg1GHVMoDJ9eGFj0crPPPpWmwqnjlmEW0CrZAscnzL5V/hEogHpizfbmIsLL2b6/Jl
 8pnrNy6VXA5LZwbh1ryMgDe5Odua4SZTIVCIuAFugt9Yxu+Tj8yALKMR7b/sp98EvC+j
 fPbnM2gjxcMMgnsKwo5EnEJYwTTagY0xKHRxDYDl2ycVGC1TFQVwyqfCNxzU6/j0MROj
 sTig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQSLTYYuFBukfuWxA+AZhyu3DxMwN9b+E5fQDk0ZLjrNDeOQbUhDkKXOXk+MY7Gb0YjmgDhY/86Vk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTtyhamA/bFCPeGEJJ4VJHzEmd90WApOzyIYkj9C5gRg1NMNQ8
 ieIgwxEHZPZ6Iy8Su9+ZCJlHLVbqw4IgypKSG5Z9C2StXtepjYTEWolhM4BtDpY0SUiw3YpGn18
 SUsEkIoW4h90Pw0UuyeXDYduYPAjGcGe/0MYgtmju+b7CZLA1nC7jzFGw2CdyCUnmZwKJVtUQx4
 T4Guk=
X-Gm-Gg: ASbGncu1Eqg2x+tkO8g+AI4jjdOw9ZeEMNoWIlKbU53JVuCjCjC35Rch1Xr1l9t7LjC
 j0vrylk0NrWpg0Uu00Bp4Vn4LYvkZ+i3nUZekV8Vv2uApbFBVjzcIlLdLQ4lZ6uP3e5xb1ygWjk
 xtqP5ebp4/ROlXB63MVqeRuzmXiwYKK3ZS8ewI0kOb2O3gYJ2XWeKu/vDYsYKUDHjZ/76cXkXBa
 fKTpzRrXTO39PPjb9Q2IwvBEtkqiEEZ0J7vA3vsBWBtAUYwko/sr3i+yAAFKoXG8uu+pOsed2bZ
 bfaggaXD26WdfHPMgB/7BbDuwJJ4QYbOjvdYebNWdwOczCYpCGOGFHBRE3+PujIuLJE2MOyW/9j
 xoUQVdHcIPl4/v56pVcJHhV27NCY=
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id
 d9443c01a7336-290273713c8mr272187575ad.44.1760397449261; 
 Mon, 13 Oct 2025 16:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES92wJ9oCyKeHD34cwFqZlyfEmNR//y+xpMc9t9GBfg4bGarmxAG9L7XG5F6Bg/xgkNal0FQ==
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id
 d9443c01a7336-290273713c8mr272187385ad.44.1760397448841; 
 Mon, 13 Oct 2025 16:17:28 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b8aba949asm515921a91.4.2025.10.13.16.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 16:17:28 -0700 (PDT)
Message-ID: <a8c76986-bfe8-4fb7-ae56-d99bc3ae3187@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:17:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Remove redundant retry_count = 0 statement
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7RAivzBWQrqn
 YgGyVYueUopRCjfYDZgUlw4NPZ0rHtdHyH++ghKnsjNfvVPGKiZ3hiaplqqrDVEwuZ0mumYW2s4
 ud9lLstYbepecEPu00PFph/x9WUvclD9keRusJt6I9DgSGijlxzadwx0KUktveNFHax1eyDYcCb
 6ai9S/t2oEOAvKbC8RKhlhRtW8lYJnORQC3PE+UmTWDPBjTL3zKUXV6b/LjNJWkLICWFdBz5pJl
 U6Ay5abGSFBKfpmT7uRWbGTK2bbiijyx5YAUeF6qzC1s9EY0t3mNVP3ykDp3PlxCcu6qJRxiLYd
 /FayhMFb/zi2sbQO7zrMwuHLlsy459EsVh+HzaAMCAsilQCCn6s7RoFktBr//6IXVGS3xOEM81x
 RWjeGpfRr6CDrMu8WW8hVLqsPA4zbw==
X-Proofpoint-GUID: G0YLkhZe9hQIetnBa1-tZGM5zHSz13Ul
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ed888a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mnYluDPEoM_Hn9eIMYsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: G0YLkhZe9hQIetnBa1-tZGM5zHSz13Ul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On 10/7/2025 9:11 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> If msg_xfer() is called and the channel ring does not have enough room
> to accommodate the whole message, the function sleeps and tries again.
> It uses retry_count to keep track of the number of retrials done. This
> variable is not used after the space check succeeds. So, remove the
> retry_count = 0 statement used later in the function.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
