Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4DFBDF853
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3152010E84F;
	Wed, 15 Oct 2025 16:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwB9JrAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F318010E853
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:02:20 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FBNN0O016276
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H199RkECw2OR7uIxDJjbVgfktA/lOVmfTufkUpWbTh4=; b=RwB9JrAHXcUK03zt
 bAaQSBg2mIoEULLZr8wm5/XAgy+71VjzkUTxm4tyu05e4YbkGcGmGoWW1eCq+CJQ
 hKSn7JvQ/XxFP5sYymg26DZcoEWP9TfMqS3ZhPo5neQS8KRXmNFMuR4ZO7ouOKf2
 jXiZ5Qo0fnJNl1ZelM1z43E8XmnBqwXqOUs4hR9a7gQj4bso9y+YeMws7jUwqqnW
 mfyi4y1AKwR5X+REj8fbReQoFIcAj5T0aDOxri4QXRUFtpRf7sDHYO7eKmSJexXy
 DQAvLze/t8NKHMI2jCTN2FxCWNuYaHe24HA+Rut4EuJf+Fng6t63dcq0mN9Kc7MJ
 7+tpCw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkd14h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:02:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-780fb254938so8755128b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 09:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760544138; x=1761148938;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H199RkECw2OR7uIxDJjbVgfktA/lOVmfTufkUpWbTh4=;
 b=g1D1S6xheN/646/M62Rkyl/gglk1CmYx3kI3qlbzD9KXOtn8AHnh2vxQunTtmNoVIm
 JqI520ye50J14s/3iW/JYEP8EXeTFS9u4hqSOul/Uz+c/eUEW+9GqBgTmJRwIddSgITw
 tbfGp13g0vgBD5dOnkFfsu9N3WTLB7/SThFyWKgvxcv7Isa2WOw24/dlhAS0YwIXpzUC
 fOyHRc+A5/TbfFw0rii47pInk1M4v0jJaj5/ZOjwYI70wTEEZtUlRQGft/5AUMYeMmiu
 V75tUOR9fS/uqi++rMvOP0FwhLfnX3AEOWa01bkXUl2jfb6njl9kNzjjpDHhgKknBOJ2
 eGHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD9DrKO4LSkbZZxhfPhHCesw+1AM9GLxzqiRvcV0v02TVT/s1CVohX4BO0oUKwdHyFud0A6f2EWNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMHxjtA5rz0g93n+it5PRZgppIu2kvaKIhOJ68GNnJVFIPnbbo
 ZuVPQ9rsj0XJdEMPFdfw0+Q13qPP5lyxP2PP4CeyRlwgxhw6gJwkJI1HzRXDcnUnADRnKv++Uae
 JUyLd0gbJc0D8MYXYR3PdVMobPphG2qdidkTGV75yYua6Ru0bUqA1H3vx/AEP/5yes3YEMpXnaR
 dgwNM=
X-Gm-Gg: ASbGnctFJsf4k+Gpu1dTYF5SyNkZJ+xyrbGGFOcwjPbKttLt2/3+/RpKkkN7I+wo3GI
 3aaIAHDj+h9Tg7dTwrL+VEAJ7MTcugj69nUXgwC++TxVJ2c0j6pvrto4TGbx3IoRERo8ugQfSzp
 y8DLMkWvO+X6H/wTD54if1gZMd3EMZYTBQlYma4yxu6OoZspovRpGmBqrMu7lWZYpoTltSWDirx
 0KFigVD0MAFTFCfBJBRgU9uq0BSq4Zn+VHsE4s70wYdPvrOEfShJrLVxKprg8BOZxw8bp956wUP
 Z+QHKn5Yc3pG7Dqa+yrCcHE8roUPwREzz7MJl9Eq3gyMCajoaQiU0uEbRutKbSOWWhEQe0DS8GT
 9tFhYQX+esbklFl5lUwW4+h7yqks=
X-Received: by 2002:a05:6a20:12c4:b0:262:c083:bb41 with SMTP id
 adf61e73a8af0-32da80ba052mr40371077637.3.1760544138138; 
 Wed, 15 Oct 2025 09:02:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwbSLk+sDebSEJMslHAryCuVQL9jWNZyI4ZWGJJGMTPCmydIy2JaHIzffCLni2E/UTDZbLNw==
X-Received: by 2002:a05:6a20:12c4:b0:262:c083:bb41 with SMTP id
 adf61e73a8af0-32da80ba052mr40370570637.3.1760544133011; 
 Wed, 15 Oct 2025 09:02:13 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992d9932edsm19069125b3a.73.2025.10.15.09.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 09:02:12 -0700 (PDT)
Message-ID: <93ad648c-1a40-4c4d-b328-7b9b7ecbaf0a@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 09:02:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix mismatched types in min()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9ul6x8fgzSJFcTKTXOdAfuoLNvtC-XiG
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68efc58c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xm2fmmAW1NdyyY9T3qUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 9ul6x8fgzSJFcTKTXOdAfuoLNvtC-XiG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXwqMCTHTG1I25
 yLmFPMWSbEeEqP3I721XWFk7Ib4s6IWTs/s1QhN4Wx4GBm87xF0AKm5ugFCq6FTrkfm6giP8dOj
 /dJceRnKhmMsho/aZOF4DodoMrcQgWET38Y6Yda091+bXTUTFPsW4Qy7A+TY5KPgzBsHQJbTl0t
 xjqeSYckGoAwVs33fgt9Kb6TOqcHHnNhBBjAZOBrmn2DvSSjv2d0wloOQFGrnlJz+hY3H/maVYT
 hatbKKxAdoJikUFR57XqozWZr4GqNj702HFgm5Ie7i/TYjLtgmT+N1OqqwZcmd7D3aE+HURmOYt
 6JRIcxH93ASn818AP1cwTNQroLIV97OXNrieUvpRHBuftq6JUXY4kUuUsQ8PaJVz+oPlBgENVJR
 PKY34hud81atBDqtACOUEJVeGEgJ4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

On 10/15/2025 8:37 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Use min_t() instead of min() to resolve compiler warnings for mismatched
> types.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
