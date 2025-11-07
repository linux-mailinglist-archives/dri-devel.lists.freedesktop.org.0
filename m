Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E530CC41432
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7800C10EB58;
	Fri,  7 Nov 2025 18:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgO1357d";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxcw+QZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF83410EB58
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 18:19:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7CqVaN2281086
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 18:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +I4isfTsZMgK3HQJ/niSfIoQ03VYJyMU2PJWo0GDYFw=; b=MgO1357d9IzxLLrf
 xCN2Tlx8X5da1tgWRoJTRVuY56YIfqh27JcRPJDn6PRMPojU0Ni2PPF2ITZQIdOW
 ykVJUengOjH5m//g66px0Cg3VBl+Y7zcToHp9cN5uDIBQ/NiPMPkIzfZsdOSFczY
 BJOzBL2pkbmkgN9+gxsUMQ6EcNKuOFjokj7Uvw8ZZPLlsVNxucK+rKz2CIg8EBA+
 jFhaCuYccXfII1hQArANQ9TtBL2O5alC7t9W14XU0KPLVsHl18/kNctV7bK+VkRQ
 BfXjJTnt+VL+rwqmrxVnhDM1EVUeFIRkyeVKPkgajOvy/KCK31CsiAbNgAEiI8hZ
 50yfjA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9a9sj6k8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 18:19:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-340bc4ef67fso1307010a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 10:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762539548; x=1763144348;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+I4isfTsZMgK3HQJ/niSfIoQ03VYJyMU2PJWo0GDYFw=;
 b=bxcw+QZfmZLDVcAoSysviriC/sx7fN5FmEdCfmfrNAa31XmWFwFIR7XXmXp0LYsD9D
 qfFPi7Qi/PvHXdREOZ1GWFIBFkV7iRqcDBvBEh3iZev46g/vmpsbFsNraG8+mpDN8Xl8
 YV1BbMXGCS4If3Xp1wVoEhVCCiBEhlSVtt0onowNsWqm4+70owgRKhllgXmPbpTau7FM
 2f1XhoYAKqKYkm8FlcPtd20GJZzwlV8dxioiS7Q8gaCO6pZPEbeBSogtTXrihYEosZ/2
 YjcrtaZNxT+mNXD36fhk8yx4fVhInYBnSxy87iSvTrraU4h/caRMRwVsALxuS9VsP/4d
 gGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762539548; x=1763144348;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+I4isfTsZMgK3HQJ/niSfIoQ03VYJyMU2PJWo0GDYFw=;
 b=k3vlpTJpkCQ1cO0t7uXEdwNy5TwUseFnVdWgm+vy51uKf4Pp+UTYeB+dnwmqtdGTq9
 GQUoJur8oYrs7h4Ts7s4uZ+d3vU5msqMXFE7Poa6YsrU/MMxeDt9CVR2FZ55dsh+zzFx
 BU/L8wd4TI2nUWAhN0OOM3IsKL8FtQKEjAUQEr6fdrVKG/EWdJFYjf2bHeVoqQcgx6Pz
 s28nR1hn6YJPNxHR5uFk83OxQXBEOySFwxkg7z+5ydHnjU8eh8PNvwa8fhlI+RdlHLYT
 XJfw/WgYVyZNaw7oCsrUpv60KAsJdaI0kh5oKcZIqKiOD5cGn2uTxBwnGEMNgQxLCsK6
 5SNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhjWuQKUk+IEKidQg0S10bQOjvY/+jsxet4IibvNXM0QAZ00DZBQGQoJK5T3OISGflGxalhZRG0+g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxn4BB1GEJtcfe0vq142rOpFBMJ3Kq+yYKCq9yvB0k8FVXOXec
 zZkZOUZSZO9u/ceC4VIicyNwsASoiyfPkQ3wrPGMC+v+x53YiuRVjSoxgitP1tBByxDjMLsqlWu
 8I2s+uv5IJufXRWohW2waeJ0peq5vAYIMN6zPq5Xi6JpKaww9DaK7kUIYVHxczXN48tqcA7I=
X-Gm-Gg: ASbGncu0tVjjmKFQWH8SJMIVBSON5Ara+clNTgOwl8piv9WyOKMl+GqPvp1uE+tspLz
 OvRLAdG5XZz8Pl/WwsgW1/vRpmVGa+/WQGB3xoqYcuDxTwdMwDKNRbnOCPGNNKsLqAwdskcJLGM
 TlCgrPa/hN15naAYqswasTTfizSvr0d1WJkUxPiPX2xGcKc7vmTclOgPDzo3wxpAKIadvBZWyY1
 YhBEcpBvyDo6kM0lzcoFVW2LUw5LlnhhjuUKhpoPyYAXVKjk9vn159aWGaR5y65j9AyS979cY6U
 rVnEfVSFSSJrH27pz3V4Jp/A9wc02U8fkuRiznSo7NeEvi1YZ/e4it8UVLCzvbXjFi8Ps97qVvx
 ZgizN2hE3HdVw8N6De9hPcYi8UH9G+xV4CyWJNGCDuzKfqfx18fDl
X-Received: by 2002:a17:90b:5245:b0:340:2f48:b51a with SMTP id
 98e67ed59e1d1-3436cb9ec36mr93033a91.15.1762539547802; 
 Fri, 07 Nov 2025 10:19:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/aPM7Fku/fLdv5H7g4SGu2ruwxhBFHeg/MhpCokILK1V0/5ddbWwnqaxOSxLb4vF4WcTk+A==
X-Received: by 2002:a17:90b:5245:b0:340:2f48:b51a with SMTP id
 98e67ed59e1d1-3436cb9ec36mr93014a91.15.1762539547328; 
 Fri, 07 Nov 2025 10:19:07 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341d13a6031sm3168921a91.6.2025.11.07.10.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 10:19:06 -0800 (PST)
Message-ID: <b0d851eb-0889-4ec9-8c95-65f14877b878@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:19:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] accel/qaic: Add Sub-system restart (SSR)
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andersson@kernel.org
References: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CdgFJbrl c=1 sm=1 tr=0 ts=690e381c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SR50krzvgNCArfR1BZEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE1MiBTYWx0ZWRfXwkyZtxI8LYSM
 qlxKLmFo/NIsKAD4h8A8TovkqscfjrhqTVevZfU7x1hhOYvAP8sCh6kKleWbouqOmNm6o+7c9CM
 8Ad0j2Ra1r9my5c8Bid2EvOs6m7s1wqBYa1z6KEIvqa0YkW/fyV2d6QszmGsA4fjy5DmYeZfCE8
 BsDFva75lt/5o6uvjAA0BHFl7MDK2XBnjck1Ci+DrRO0dFknfDIso7eqw59RVZv8ddB6pYv0Aym
 cpc5L83TZTDg+g4qOCMSJ17X08Ie8DVqNZWQqU6l8LhAVYb+0CdmL/cio94pUN/EwS3TjII7xL7
 jMtv8CYfoRZ/VleiTBYb7MFOvO2h7dSL+KrLCSB6Yo3YWB73dF4DkpWDKWWsCXodz8/0cBB5Mbp
 TOFXYSwUpCAIYPOJDt/oZz9+AKk6XQ==
X-Proofpoint-ORIG-GUID: fu68VuIjnpA5srbXrGOuUCI_Y7kodQMU
X-Proofpoint-GUID: fu68VuIjnpA5srbXrGOuUCI_Y7kodQMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070152
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

On 10/31/2025 11:40 AM, Zack McKevitt wrote:
> SSR is a feature that mitigates a crash in device sub-system. Usually,
> after a workload (using a sub-system) has crashed on the device, the
> entire device crashes affecting all the workloads on device.
> SSR is used to limit the damage only to that particular workload and
> releases the resources used by it, leaving the decision to the user.
> Applications are informed when SSR starts and ends via udev notifications.
> All ongoing requests for that particular workload will be lost.
> 
> During SSR the affected DBC changes state as follows:
> DBC_STATE_BEFORE_SHUTDOWN
> DBC_STATE_AFTER_SHUTDOWN
> DBC_STATE_BEFORE_POWER_UP
> DBC_STATE_AFTER_POWER_UP
> 
> In addition to supporting the sub-system to recover from a crash, the
> device can optionally use SSR to send a crashdump.
> 

Series pushed to drm-misc-next.

-Jeff
