Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6EA7C035
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 17:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F3610EBE4;
	Fri,  4 Apr 2025 15:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIa95kvm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7285E10EBE4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 15:05:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534Eruov029593
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Apr 2025 15:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FWTe1diDmn6dvcW+h1iAnoQKV9X5BD5p1BbCHCqySdw=; b=bIa95kvmjzNCBf45
 DbfAUghagR6DtT+kwVIjiREBanAHWieQUKRNZUfap/KRHcH2Ba9BLrNsHviy/fhG
 gxRrfe6WgcVdxZx+f6/u+LLuT+8LwWmZ9Rd/WqCk8qOo0zi7z4ifgCJO2D9OOa9a
 1GYlsfveNqj6ByT7tuzkVI0Azuvg9SK2BLuk5UDsVY5cponYKG6pOPN7Ei3heXTc
 zO8+JcUPUgiKBrG6HzvJyqFOTbDlDcyiuhIXt1+fBeM1vpUR9X4lzG1960q5GPlL
 9z7AHQJFwBzNzTHQVKTdI8mtIJA+Wl6a+cZB8Jfy1IbwZJx9hpqSoNKGWtyOrfoI
 OeErwg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d528ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 15:05:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ff605a7a43so3353404a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 08:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743779145; x=1744383945;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FWTe1diDmn6dvcW+h1iAnoQKV9X5BD5p1BbCHCqySdw=;
 b=vYWPe2Rs6MkQ4TBRro/k/yIii5Jz0pgropiZknN5oDi7Ds36pGlFHSsAtPJw5jtRpx
 Qob3PRv2q5rMYJP4cp/G0aNfSXi9AzreTIs9WgHkYrWqCvYZU0kaRXEj2kt7xM9XtOB5
 3SwFnsOL0TSJKaLlBAL6hUQJTCSY+W79y58J6Tbts82EqRSGtKd8Zrb5lbDnXpWa4Pnq
 1vl0JHocNbacatOK33tMCnGkBHxaOT4QOVHdWWJeMVwn6+vWsrLNB2wOj5IYZ6LXZ05X
 axssOwHPfFYB4NnL9f67rpNMrJQGWAwLs9lrzC8dZDRl1OaHqXdFm5zUHWJ2lwJh5KOr
 Nxyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmlG64imYAoVePOhGhgSMeEHiXG1FWmtkFqayApGj14zHJvccjEiqAeLoHG6fKAu2Lo82ZCq+vSro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzErtrtnYQ3l0b3GrpippiCtKqau2/XyNzXvpAgmae4kpfN5pZS
 I1V7EqrnN4gheljBxS0G9ACXaRYczlAZKDw37LbkiM+jhdxrQcNI3iBTDCUqdOSAQm01Yt0BovZ
 Btx/kUG/a3teKfUE44R+hkgp5j45ZwOLT0dddL+GDqAa+0lxAAA2C3pPCY4yxCN5MvnE=
X-Gm-Gg: ASbGncsgQ0Cj4MAwSeIaAPwqS4DNMmnSIbOTN257YMlNYDSxHkxYDlx96OIYlBDpJ/w
 Kq/CPQUrZb7FwcwVxGBd9Oj4Nqh/ixm+NzBxi7hNaEhQR/dFynIs90SqYObPEUdKd/PG+JHxgaY
 YBldEBpx0vI0hIMsIVYqxP74JJRWewMbfV+1KhuOmqT4j0GRLY3o7p74ZnZmi4icAd8s4WDVyg9
 USgt7lOV6+jWc/l2wwOKuYMX2/RyGKvmjDk36ZPqeG0FyUMa8CSwB/Vd6BUK4BC52wdt5Pofg6H
 WwT7q5pY0g4E/5izuzrFfjlq7S4I/04p95HMYjIDg2BFe4ArEiUyjIfHht3O0xG0Ag==
X-Received: by 2002:a17:90a:d604:b0:2ff:64a0:4a58 with SMTP id
 98e67ed59e1d1-306a4970dcdmr4616351a91.22.1743779145193; 
 Fri, 04 Apr 2025 08:05:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8YAVO6A8eNEFyS8YWV4hWHdJCWxKT//TMYKYdhIzKvAtFnMwoQL8g0UvmJvzxLr6NFQ4/Ww==
X-Received: by 2002:a17:90a:d604:b0:2ff:64a0:4a58 with SMTP id
 98e67ed59e1d1-306a4970dcdmr4616317a91.22.1743779144856; 
 Fri, 04 Apr 2025 08:05:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3057ca1f4b5sm3799494a91.7.2025.04.04.08.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 08:05:44 -0700 (PDT)
Message-ID: <0302ab1d-0858-41c2-b904-23a2eba912b1@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 09:05:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Update FW Boot API to version 3.28.3
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20250401155817.4049220-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250401155817.4049220-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x5e8Sx92oIhMQZ0Vm6RwMjJKR-r2HViH
X-Proofpoint-GUID: x5e8Sx92oIhMQZ0Vm6RwMjJKR-r2HViH
X-Authority-Analysis: v=2.4 cv=Cvu/cm4D c=1 sm=1 tr=0 ts=67eff54a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=albSZqQxqIgmCv0TABIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
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

On 4/1/2025 9:58 AM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> This commit bumps FW Boot API to 3.28.3.

Feels redundant since the subject states this.  Might just be 
bikeshedding though.

> Use new preemption buffer size fields from FW header added to
> firmware boot API for preemption buffers allocations,
> if those new fields are zeroed use old values instead.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
