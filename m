Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1E9BD690F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 00:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D9610E05A;
	Mon, 13 Oct 2025 22:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKo0uVM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73C110E05A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:08:25 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDAo8018954
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oQmisN95IhtDaTX7ATkYQvb2B38Dk65Yb3yFjG2YkLQ=; b=fKo0uVM7AGoangO8
 pICUMs7RVa0VkZVEVOh5Rjeby2Mn18mAmAcugaag1mofjJ7zT/w2A1YYH7yRueOd
 klogwMYbvNaqu/Ao+Oa0b9WPJ+fgJTy/yx6k2V8ifcCig8kwp0xfKFTz67NNtfyJ
 Xy79arLHJbsJO7hKHACpKD8mWvz+KK5uZgOLukkc85m3v+iNtefvbF6NvCpLz3mr
 hpwvyDaSNLDsH0l73Ws706i7hAChcoK9pzqX35fqEY70Voo34xXPiQyzV9+boiKg
 Df4EtodDTZk0gGgMaSBJ3TaKUHRdrrYnjJ6m439iDbHGA3d8ZFUxuyCa/WwK641F
 ARu5Gg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferxauw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:08:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-32ec2211659so8567662a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 15:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760393304; x=1760998104;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oQmisN95IhtDaTX7ATkYQvb2B38Dk65Yb3yFjG2YkLQ=;
 b=T+Du/4TgrHrDpgDIzfYwfIgDc7jdt8yLXI4XVDL203dVK0Q+ydcBf48kZLWx3kRljF
 XmW6y66FDTlra2/v7yChRlNkyAEHWHV284tFzdLTXRZzBLIn9pl601kK+VITNsaDkPTd
 BNFWVfmPTM6ve+EDdiFPCQLrDsADAjLBkK0DGSPfye78yNfKRLOAn6DXU3ou/CHCRmzG
 MOxDF/a10FdNgrzA/vp32gdxMHK+SB6FuuAVT0QIbizDx0wt83WvTTbBBbfzzdE0jrMx
 Efpa0PznBTL5yZ9DfYSVe8OjPOP2Pq+rOt8lrbrzMon/rZArYj3KoCsWdtZ+ONmlQqKp
 eW2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLmzA8dQm8BqPpsDem/TO4zyJ6VZI+lRgOQYYBhPU8AOrxY1XGEy0DEwzztFTgglhGuXrLg1k55BU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8kuw9wQScR9KkslKIXsLdsODJl3SjdInn3Eh5P+47Bh9f8y8P
 54YIbmBN0e/scThVDRSF5+0q53hskYpyZkJF4w04HOyks5o13kqAtY00IAdC0ReORLXM06YQjlt
 dfWDoYQm7BuFItpfJom1HtnVtet2ZkXU8ZW8f3OFI9nyL0p5wo4nwrWyBn6cBUC6UzihSvbA=
X-Gm-Gg: ASbGncvodFkWnBgvyPvmHlSMRehVder5oM/gh/nGVBtPSJrFOxGVZgfdce5SamMbysQ
 J7hL3NRSD5SWMS5VCerwdwEasAeYpFJ0TCSU3qcxHYzH/gcWuj6yw07EPs2SQp92nTw/jAUfrJK
 n2id2sm9/9JahSvFqSQ8STn9fO1dWsGboMcVbZdtUqkS3qpAZqPiwIlCNJcxaRwBJrZycUIrtP8
 sObjWJ7myLI6LDqMYcmjpUUoNrH31s9CsNokSkC4fFbE4ogZMQFPzM70dh9Qo45U6V8NLZ3ebKR
 Rchwp+D56m9iWrHOmZcn5t/oGDt1DBofjkpctzK4ZT5sfEZHIuUNU4l8xQxlAbOeWM+IYhkt4jY
 DAbo5xOqdJbq4sUQAfBV7E3R8c+g=
X-Received: by 2002:a17:90b:4990:b0:338:3b73:39ce with SMTP id
 98e67ed59e1d1-33b5138e3a7mr30229728a91.25.1760393303697; 
 Mon, 13 Oct 2025 15:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyrLtsw9G5fBMOgfmCTBl9HjcLmQyx26V1efYNwwFnNqhpoN6PWwYRe0RBYeoWSqKmSiQBfA==
X-Received: by 2002:a17:90b:4990:b0:338:3b73:39ce with SMTP id
 98e67ed59e1d1-33b5138e3a7mr30229701a91.25.1760393303240; 
 Mon, 13 Oct 2025 15:08:23 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b5288f84esm7851092a91.0.2025.10.13.15.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 15:08:22 -0700 (PDT)
Message-ID: <93288297-0c59-4fac-be2a-2adf088b75b3@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:08:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use kvcalloc() for slice requests allocation
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
In-Reply-To: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ed7858 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=57TA5eHKvZbov0TpALUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: neVadreInDP0IoXmlwJhOnCoXD4EaXfF
X-Proofpoint-ORIG-GUID: neVadreInDP0IoXmlwJhOnCoXD4EaXfF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX1dUgRXb4ZRNa
 UFxyCxOr2Ru3PuMOhcHL8WlJN1OQegUbLnImqOyPhrzpUO0K10P9Jp31KIEB5xpf1+fMWhpvSeR
 6/J1XM5WNZ/BIeTPQ3RO3LM24XTraUitnhliJFl2yUCljNAkI75lLf6/0JGVsz45NOqh60cIwPp
 EOakRfp1UKQEaLKDFGhwMoS/bpYarQAs8AQZXf3khCLo97BXoT4vbR+dwGVluZZWbuUcl3VRIul
 GI8CbZ8tsiyTMaJlOk2c1u1IUPXLZxhknZd7P5XViL3Fg5NyKfw8wQiQ1hKbm5pw0iT7wvTaRfa
 dxXof/YtJIcLH5tgpRGjiDe2SqPcCNgzhk/H7kz7FiAlVOXrdgs1H+0a1YKPsB0u2fBTtuxuiJp
 qTfptyO/yuFLDRFYnq7mEOLMmQqnTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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



On 10/7/2025 5:18 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> When a BO is created, qaic will use the page allocator to request the
> memory chunks that the BO will be composed of in-memory. The number of
> chunks increases when memory is segmented. For example, a 16MB BO can
> be composed of four 4MB chunks or 4096 4KB chunks.
> 
> A BO is then sliced into a single or multiple slices to be transferred
> to the device on the DBC's xfer queue. For that to happen, the slice
> needs to encode its memory chunks into DBC requests and keep track of
> them in an array, which is allocated using kcalloc(). Knowing that the
> BO might be very fragmented, this array can grow so large that the
> allocation may fail to find contiguous memory for it.
> 
> Replace kcalloc() with kvcalloc() to allocate the DBC requests array
> for a slice.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
