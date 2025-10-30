Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DC3C20CEB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 16:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F5110E9D2;
	Thu, 30 Oct 2025 15:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dA7hC1lh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dF6zWClt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C3510E9D2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:02:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UB8bwn3808770
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y7mIVHjczy+G07m/awOiYZNFAk52oy8y9dslXKIzRms=; b=dA7hC1lhkmyGhNA9
 jjDuRzR+l7gs5bbST0jKWpSdFZC6AJeR5XLnweZfde9HDHHRKGguLsdZicDPhpk1
 um8ntLxz4/gQeH6WpSRBMMoP7IJncSyUd+X2346qzK24HZCnokGeEauK73BDDXPA
 +mZefGeKUy5aavhlsqwbeBmTgZHAJAsAbe6jut3PlEsPhkLUC5dCJWHy02yc7wtr
 o9Tyibq0NMA0b40nJrojnkSnrSeNh2cGaWmvNGCz4IvgA0HQKyKw9WyXTQ2KCFz7
 yDAvleEPre4bLTqGec0s1YSN6vxsTLFOSkmZUWIUhUToveiZvJDgWSzoX7uAUtLg
 r4xB1w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a46vv8m68-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:02:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-340410b11b8so1075565a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761836562; x=1762441362;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y7mIVHjczy+G07m/awOiYZNFAk52oy8y9dslXKIzRms=;
 b=dF6zWCltacpmdziSQnASEe37qPt2Je2r0AI58H2hAgKom9xGyi7IW49sxp/mrurXTi
 5zz9gONzFqY2kESbnjwhnNjJILp5q0Zzg2D6j1+OeE/FlJdgwUwzwF2SOYllxtkn4T27
 /ROIONOF6yTqyQmx99CPeWGCoyXwK5IZhNdMugRfLZEpTEGPJ2GVJTSlzkan30h3R47X
 5yJUZkk/c9cQCN5RR9cSiEBNC9TXM6O0++eoSFFyGRjTL6TfBtALCaxss1Xq1bo9+QKG
 7eibBLZjir33K7P9QOB74jdF2elzDfWzWEqyCFWj9S3hrwklIQbLgGU0l51xjM1a2u9Y
 jLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761836562; x=1762441362;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y7mIVHjczy+G07m/awOiYZNFAk52oy8y9dslXKIzRms=;
 b=kk7Po+DF9Uue0rs15R+63IgT6dpZ9G0MlPHTUiEzOk5zbzvlrKux/qVzOC+QmnPMJl
 3BrMCJhuPdbOebqVCYTJPsRIdi7tHqYLpOFjCMN3UlJOQKfTYa+8SbDyIsbdjY4bHUXn
 MeiZhB9D3HRwA/GzkW1OvDUPNBL2kJQ4r5IFilPVQi4UweeSjk8YOBmAr8emGs2cUiUO
 hjHLGmEFUp2o8IBKGJdLcln1V5l1inLkj4C7NATN1Y1+tP3vqxiUba4G8N8CHDAtD8tc
 UJYJI8N8ImQzUrX4AzeOhWYYmVcdN6jGae2z40oWIHxLzbaYuaS0/SGbmYwH/gCirxkY
 22EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNMCl8F7d3Pf0cHhAmep823yjyFoHlIwqSFKeVqICA76SB8Jjd4WoZwDoGilbR90CgZ78NUBzGits=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxLQn+x7EI7sHzzFlb5gZR5zZrbAF+Mk+dVzIx7j2MeKa0QyK0
 lahOEGr4vbHpviEAKtb83maLaA4RVGOVmvvRcc4dcY6K9zzygFP51RJygBWq0w31fYdhFS1Uyzv
 67msqKc+4WK5WAUJyU/T264HbsCudva7Gj0PILEZjc3HtgDBu9TqxUokhtxglAYGzRxWzsNiHnf
 CbyZY=
X-Gm-Gg: ASbGncuZQPwjcZn4xoDuv2S4Sb549givQEvEPEBDwcf5vZhopMlihAdm6S2mz9k2Hp5
 jQ0Vo5YeE/CPkBsdcWclPFZT8KHxN5jmJE4qfV+K5kK+UxGly+yhSKawGJro7C71+nLzgAiyUnE
 g3l5PYdfws0bzzzQnqC8ox2IJ/5iEAyK1F77ZHElm8IvlX6coIajBlqFuZwxMyUSZbWFLnVedLq
 he+vfvxmzgOAnbDw2YCNlULLYrDCNePzfExlCTPb9qg3cyNOJbxFChqcxxyF8nyMrzMhSkBuWEn
 vQ3pKZQNUmLVQO09GqXncbRFOxI+EcSt9arORTPyh++gdRvRb5eE5CHVshdpjJJs+3spr4vlGBy
 /Ioe+ZtbphNCG6EhMpp4nccqjR+O35H3V/d40bh8xFLkeNndV4Vd0
X-Received: by 2002:a17:90b:28c4:b0:33b:ae28:5eae with SMTP id
 98e67ed59e1d1-34082fdbb99mr1945a91.14.1761836561736; 
 Thu, 30 Oct 2025 08:02:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFncMXvhqCs6ZcYBWEUEBUX8UounWfTkYgFrqR+3QGvJxG9ONBncLcZQxJKwThpum0pZyoQsQ==
X-Received: by 2002:a17:90b:28c4:b0:33b:ae28:5eae with SMTP id
 98e67ed59e1d1-34082fdbb99mr1633a91.14.1761836558373; 
 Thu, 30 Oct 2025 08:02:38 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b712ce3a90bsm17860429a12.25.2025.10.30.08.02.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 08:02:37 -0700 (PDT)
Message-ID: <baa2a93f-d131-4adf-90bb-a1ab49d693c1@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 09:02:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Wait for CDYN de-assertion during power
 down sequence
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
References: <20251030091700.293341-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251030091700.293341-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B0Re5awJyVRH_fsKCc1BIY93yEPQZ8_-
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=69037e13 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=bWUy6ffCo7lWDh6rsR8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: B0Re5awJyVRH_fsKCc1BIY93yEPQZ8_-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEyMiBTYWx0ZWRfX7YyRhyEJv7Wj
 MHeN1Pgskm2efz8qqUp4bGrQgGYh7VDMRgBgFtECrI1RFFDynfa5HOrLHb94uyHDAdS95U24GqW
 PTELqUe2C3wPPOhp5gez0j9DNHBoIvUKXohJ1oTG5EHBk+RINos0WMmu/daZe5blYONemSaz2f0
 TYfgF3tFpTitLJIqcSB3PI/xfRZP1FizRJLTgH9cYIzb6p/fViYimAbOI2608ttNSixognGvRk0
 mn6kCRH8WQLexv6OUCCDZaRhpwod2aIi8v6fkoDyszYLwZb2zs6K4xov+x/Bi8S3R9FRs5yKss9
 H1KS5SIVNXl4PUzBZwvsAGySBIaHhvtW7rwsJ7JUZYYj3mkHR0YbIQbonFTpywVLv8Bi9MkOqeD
 5Z0To6G4mAqI5vWyDG5ayA+oOohh0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300122
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

On 10/30/2025 3:17 AM, Karol Wachowski wrote:
> During power down, pending DVFS operations may still be in progress
> when the NPU reset is asserted after CDYN=0 is set. Since the READY
> bit may already be deasserted at this point, checking only the READY
> bit is insufficient to ensure all transactions have completed.
> 
> Add an explicit check for CDYN de-assertion after the READY bit check
> to guarantee no outstanding transactions remain before proceeding.
> 
> Fixes: 550f4dd2cedd ("accel/ivpu: Add support for Nova Lake's NPU")
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
