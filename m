Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2371BD6BB4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 01:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA54210E508;
	Mon, 13 Oct 2025 23:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORy9I3CI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1EE10E508
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:24:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD63q016349
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PvISk9YT5RJCI3q0r/F45lMUM36h1JsB4OfS502032c=; b=ORy9I3CIh9vjbRdq
 BYn6Ol0nEE+/SgP07RdDi10VonMY2H6CO2DE3VdIWTwgcb8tT+iKmM4VrNwAc9nH
 /8fbMn+0Uzf1nav5lbrrqVMI7F2oXLcZnzokQWXAKuY1FNVM+Ya/poO21WV826jn
 hayaVnK6OITE7JkVRBXzBqueeuyWFhyAIGs1lYiyYLlkZ3PKPwR1rr5vkacpZPxd
 K/Gt7HSoRTg4cdDG4aF/+ZTQQ0O0icwwdXSEEhcCB+kBpQhe4Uig4WzSpkMSA5GE
 jjorl/YTjKnxNze5pe/PCf1hM+Ez3JT5ceJhM/VwJhFYqYq+Ks2mMn5QyDLDGd1N
 zuB2Lw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1aatqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:24:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b57c2371182so8852887a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 16:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760397894; x=1761002694;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PvISk9YT5RJCI3q0r/F45lMUM36h1JsB4OfS502032c=;
 b=qHHpJMFOLqTgIi6pVcMNB38YW6/ybN2/5RvDD6662VmSqHDGmgBrgGs+WzwLvlp8/m
 bBt17w292rOf1Ksb+lq9r7jCoxoW63eJt1Rs23hm+e3BhKP22Rg2EaV6LvsPgDSfgTL3
 mRz5XrxVUU6AvfqgX0ZgzW+a4jrap4gsUK9lg1iGI9YXhJuTPclOS/FKL+/RyYha63Qf
 xorlj4vlDFq4q41mHfaeX//HaBA516rC6dm5qPlwfG93+9gkgPRyoxTp53Wu52aOn84h
 L0YmLW6/4VwcAwc0XJbLlD0z6zNAuXnFBxkKw/3T48XKAGf+Uf5c+T0gf3W1kVN92V3T
 Y+5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdCLjlmTp1O8dhR2P/2XG25K3B8ML+CgJEEivMkjfinnTqT9ZrQfF5bVapT0H0eYtFZWkfsQtZf9k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS7J1pjq8PE86FQlp88qCG+6pncwUsM7s20EY22jG6+PibqsBC
 jcryk8JCMD25M4LkmEIWQm7Ro3mj6UUd4KU9JnbJiMB/q9dw/lWpUjxA7Z8Zg/JFL7Gq82IXCbs
 McuV3p9YIRVgWk/ZvmaJtnucIx3YtWsZ838uK+3ckP8hW6924sSl1VYF6tzSOyWFKv78ANfs=
X-Gm-Gg: ASbGnctg0IDOcJBe9hZvKeO1/V7/OiOn5TO8wnyztQNaDqm2bRbABR7XWKjevb3V/bJ
 7rXAJ16+2JjR0iodI30vetCLyLH6VhVVswTf4JjbaV2aYiSBoOTUJrp//eoM27CSU1lX5PVeGCh
 mlS+CiVKy5iiwqxOqnFMWzpk35jSr0EPQ5ahhhWCRcMSxxSjgJ2t5plDKrttW80YjUGt2tagy0D
 tt9Kq1e90emXWYbgnhjep2BGWwEnvmr5luMwziDQHXUxcTs745k75RDvjJsyLDJ7X+QYGcUaTRQ
 OGx9ouK9MFTQUcuzME9NpaCLjFfPA0HvdMGI56/FRLajZi/NQDj2IhAih7zlYN9KIIuLRf/nYE0
 pzi/Cg2BvBfECNtf5nQyQS1jLXrU=
X-Received: by 2002:a05:6a20:a106:b0:2f3:b278:eac3 with SMTP id
 adf61e73a8af0-32da83e4f90mr32307116637.48.1760397894126; 
 Mon, 13 Oct 2025 16:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBhhcsb1aEwKee6Uz8WqMmDmhv+KWlye71kdEFyuGJdJ+boHVqUtpb2DUEbYRuqEwLIl/AXg==
X-Received: by 2002:a05:6a20:a106:b0:2f3:b278:eac3 with SMTP id
 adf61e73a8af0-32da83e4f90mr32307097637.48.1760397893698; 
 Mon, 13 Oct 2025 16:24:53 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b678df8ea31sm10143431a12.42.2025.10.13.16.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 16:24:53 -0700 (PDT)
Message-ID: <8da98737-b768-46d1-a0df-19e01d5c4964@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:24:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Ensure entry belongs to DBC in
 qaic_perf_stats_bo_ioctl()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ed8a47 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ZyNJWp81KiKnRxZMCyUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tkGmp2d44uip5Xd4uNBmVy5kU37SdzLD
X-Proofpoint-ORIG-GUID: tkGmp2d44uip5Xd4uNBmVy5kU37SdzLD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX2G5AUBl2DuQR
 7cMhZW/ZUF/ZOLMIh5UOgA3PDOPl6+VXMuhWA/eyYU+EoEVpxKcnpcl4Wo5DbxJLsH3DT/lTgMN
 QdkOns6baweL7OvRWK+dcK0F9cENV2VjRJX5Hhbw2zAAbD0nc2i5YekpgJFmcuxSoLJJYbX/DLf
 shfLHFa2Fhp3ymWSh/Ys61Bk5vuPkypEXzM8WV7qcNYx7C/HUq/3ZYre1I+7uyOJKiaUzIRDp6k
 zPyp4v2O5xhuPwyRHiFs5vf9dELmV1bvQV0jg9gd2O8+ROWL9VaKIWNC5nl+uVvEJJMdthOUQw4
 E6FG534J+qyUk5qoFu2kQg7C71Scn5LhRrvyAgjEcP6BWD4fD2eqwqP7blAlhbVsE31OPfXLrM2
 S15wnAhAckUBxeE8vQRF2xCTPIJZ1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035
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

On 10/7/2025 3:12 PM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> struct qaic_perf_stats is defined to have a DBC specified in the header,
> followed by struct qaic_perf_stats_entry instances, each pointing to a BO
> that is associated with the DBC. Currently, qaic_perf_stats_bo_ioctl() does
> not check if the entries belong to the DBC specified in the header.
> Therefore, add checks to ensure that each entry in the request is sliced
> and belongs to hdr.dbc_id.
> 
> Co-developed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
