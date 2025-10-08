Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A87BC64A1
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0057A10E890;
	Wed,  8 Oct 2025 18:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Udj/OQ61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3938310E890
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 18:27:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5MiU001477
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 18:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WEtc+TcHZs/BG0j7p/wx3/HzsUUUzf3QcGZUF6Nv8Es=; b=Udj/OQ61PPTHXxwo
 Elh7iBhAynBeMn5CdxlSBCxAWB6D+70uMGhKmvfwFUiu/b+pJ6gMAJmWwTs/iOGx
 CTV9sLcAVWdWylkV1SDRHw2I64WjSEDLuxFb9Q81SCZd2P772JnKrHTim3UXxLed
 2KRTn5IxspmXWUFzeQDrvQnLOlwKhIcIQQmUgeWY8VNsTdeK73GK74W/DBQZCaIY
 thifF2dl82SCB4y69Bxddi5usQEgKInhsCprfVrs1pRSOLYQeevg4J4SzwPyYxMa
 9W+Eo49+lF90dJxqzfBjRA3Bd227EWAO9DIqSeqVoqWvathrbLzuDDUF53bcXkDb
 MnLiwA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kr7ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 18:27:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e2ea9366aso103346b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759948030; x=1760552830;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WEtc+TcHZs/BG0j7p/wx3/HzsUUUzf3QcGZUF6Nv8Es=;
 b=aP/nlcq5Emyt0/zvPSZ9RRciZWRIwM1w6NWLj08/if0CJnsU4Frp3kTJviAPdImUvh
 hqx9DoTqDUgzJaiGgAhQ08+I3jug2qtrraIqZQjs85mKOUYOASrdS8IyHeOiCI1KA6SI
 Schy/LwzivPsq3ET2hUZrVP6BuPRdGkTNqnaGz6exxfXJgVbz/AgSRaGD81+q+RWtoS/
 ZiFhk1o0b0btLuN8EoymSrfx+71U90BXbYxnNPTmsFNTmkvciA5OGs8jbXXAw3tyfyuZ
 YeHXH9i5YvEA8QIu00EZ0+uALCqMyp6khMHCm0tXMeoklXTQff3Bkvr98ZzPR6UTFKMq
 giRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOYx94l+a0ikXMMscVMKJsaX9Nom829TAVWsKviMy50695RMUrQlPw9q+Hrgx/mYVRrcRt44iedSk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWmn/TY0vsWGXnKbcwm8U/VDB3uaj+OLVxaueL3aCscZmibLjB
 sRqNuXTnGHhkj0y6ncuTCa3uBNsWa3DAt6Zc3OpFI6XxneZ9Cl7eUbm0n/79fJyKFeZpmnLMsOK
 jh+bJ9dIU1FbSXCT6kBfIwy4SwKSyxrHwKGBMSpjSpaq/ae14S+Uoezw0TFcxNsHPE/C8TBPoQN
 4X+Pw=
X-Gm-Gg: ASbGncuZWXsq/dSLpCBafB8xcs127KdCcxRS2mGqnzvPQoPn3t4Hg25ivly15N+vdYs
 hXdD5tlkcyhUTXZl4NFLJqgxJ7gOhPMzRlB8qzFcFduUFiDia1z9NraS9tBy313VgO1Y2bfVvq8
 +IfdTGS7gKSKM3dd664CFUHF2ffw4AUd8TQlo15NWd4Vbq78BcpG2Ws8PYscYYJ+vdvgofmdqbo
 yzuCMt9+7rz8vSNHbTjNMFzRjXUGUAgAVm7Itfd12MMz361LzM0wHQDhTLAygv6AB4zPDdKC4DW
 8ACe6/lcQ5EZ+xhtPMd4lQGP0B5vXc17UPgd8H0q9p4jKjYzqdHxOg4W5R9Bl0QlJH3Wz+sRTPU
 V81EbPo4ZBMoSaAn35h4=
X-Received: by 2002:a05:6a00:17a5:b0:781:18de:f7e0 with SMTP id
 d2e1a72fcca58-793881eb478mr5515164b3a.31.1759948029965; 
 Wed, 08 Oct 2025 11:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhOH5X+XDvbdolR+ekTGtwlfRBuaIvvlRos/xZajYdUrqKQ1KyBOo9pHTj/agC47o1a7+/LA==
X-Received: by 2002:a05:6a00:17a5:b0:781:18de:f7e0 with SMTP id
 d2e1a72fcca58-793881eb478mr5515130b3a.31.1759948029344; 
 Wed, 08 Oct 2025 11:27:09 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794d4b3c72bsm417567b3a.3.2025.10.08.11.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 11:27:08 -0700 (PDT)
Message-ID: <82236398-af27-4fa2-9630-f3e354e929c9@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:27:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Ensure entry belongs to DBC in
 qaic_perf_stats_bo_ioctl()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX995FxxjgKlIU
 0/ctrwd9lHqZ+4UW/KBna14ZeaP+MJ9csmlP6NH9FZ5SCKItq2yGIRbvL3ueI4Y9l8+/++cdKgD
 ADjwN1HE+tvNm2PtqIL77WDKoVZFAMN2v+LiXUdYI6Cj/tl8siA5B45pKVYPga5GUlLd/FOEyrH
 XpAlK8g+SaSZlfiJl1raMhrInMIasQKFcMxVa7WivM16njj8CbLmx6tXyek1TvHR8cuAPSh5UoA
 w2ygRBwH+P4bT1H9RYHpM9OqNU9t1CWflOahHjw51vN308YTu2ZQeXW2zuaBOwj6DYyLwA34v+y
 7+nhSifPDWuu/vM8O5dIw5aIsQuksvHZmu7XThNP8AMmxAzNA6pCTlb9xNnZP2iovUfRxo+5KsT
 P9iINh46c6NinNRNB2UNGN7JFOHtSA==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e6acff cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ZyNJWp81KiKnRxZMCyUA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MXm727KI_FD8rSQ4bfLdNrVQGwUoADws
X-Proofpoint-ORIG-GUID: MXm727KI_FD8rSQ4bfLdNrVQGwUoADws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On 10/7/2025 4:12 PM, Youssef Samir wrote:
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

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
