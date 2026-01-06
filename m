Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48247CF6851
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 03:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5C010E010;
	Tue,  6 Jan 2026 02:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LINgXc7E";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pntum90w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E66810E010
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 02:53:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6060nKJZ2943623
 for <dri-devel@lists.freedesktop.org>; Tue, 6 Jan 2026 02:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SOu5DLSnrkviv50Szpc1hrCU
 9hPJWswJ4K5mRwRHLQg=; b=LINgXc7E05GEr595pUELCgDfVJ+Pr2+/szt14Zd/
 wvrfhY1EAgT7mKTB4oX+X+Z/vCEYI8Yi36ylQsH51Rh5TkIrem8I2pT2rGszlh0d
 V+sYsG+RMen+gZkdngIUvDONMpnJYIYN/9pZPXrJ3TCkEnwmY65BtEc7o90fCBj5
 W9Ic+mATXeL0gMBlVZYfPXkZbrFJ45ro4oLkl2HsnTPV7NCvOJwRmc/rhoQ2Q2F7
 OcwhpppMzJQpErMW+1ESFvmKr8bbItR23PBm/0YeFqr4egZMyudkWrTcSgiDGV+w
 55p6UVvx0TP1/if6ntW1jEVHCaMzfTk2HBMhSvfDffJuJw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv01q77-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 02:53:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f1f42515ffso13805271cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 18:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767667988; x=1768272788;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SOu5DLSnrkviv50Szpc1hrCU9hPJWswJ4K5mRwRHLQg=;
 b=Pntum90wNISK7iz6YVH1a58Hy08gzzuh0w15r9oJWFv/gFBCDj/gZWelMOmAnTCjlV
 whnsSAA4DsI+wzjYBGIX/qavEX5TrCX9dNdP82Nmdsq7xezUuQAs9pUdGKLVsi4wTOAw
 V69U4bBuiHwrIOvAUwdLUcy8h+0eHp05y74J6AE01543PRL0soY2YmHJTmSNzHKlBZIL
 3E1eEcIxWPGVYcyr+r5113F0Gu4PvNDj/bkgusSKNQBDqiDr020+8VobHxuxJWFm1syq
 1/+XnXB6GV2FBcAtSXU2qwXz4TyVh7LjCJ1f5Bm+tthjf3zMMDTZmaA5AEvPrXDOcl5x
 dWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767667988; x=1768272788;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SOu5DLSnrkviv50Szpc1hrCU9hPJWswJ4K5mRwRHLQg=;
 b=GaGt+Epl02TLXGiLEbNxQwmw0Gywll0sTpI3xZoO1YYViij1FO3P1mzmEguIOGZ4tn
 lHQ2XkpHPGtlJXA5pf1FnaKGhG64V9IsMYMMKUg1PU3wLDQguYi1aIOQyZ+BvCctR/73
 dsXTHmZjwSXHBKCKp4k80K42EjVKGpb0xzC4Cd51HNcnGE8/g+tpXjvOj3UgT8TUW1qC
 kjjfYMyVrRfooVXj4jUFOPoCM+Y6gZnwkmmctK1Dxf/ER7ma137JClIXdPbSxxwheTr2
 xoWFjMebjlJZuGV17S5eETZBUPjgUxEb3OLuCk+ZGK/mc6AEGPUta9OVcIdZCGQprHYz
 KSsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCeWhplRIVcWpm3ui3YVQ25xbxFq+lNijuawjUl+DRl9ktOoYm3UgElXW5ci72SYNSH7QbBaqB27s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyeyj0eDm9iuwhg8okbjne7F40p/HQGJ+/M1H6L8tGHSKjYeYMk
 skQOltTzGmL3Ag29gFNVki/m6zUA9SCAXUX9P7rdpHR2UPWpB5dPRdjJkh0DCYCw0E1arADHRun
 hbkYYKJy4UytmpgS40FLmRDGYKluHUBnamPONXFZcJpKHy0Lx0Yza6BnBbK7h7EQBRQpJP9ARZ6
 903cI=
X-Gm-Gg: AY/fxX5SMdfagJOecuVbanm/9qCpsESxqNmx4+uCOk0hGtZWYGBnmRC+tgmCSc1j2az
 Pl88+5ye7v5chLNorEWsjhWsNuqR6MXjMnYOavF3pSTT1EsyJUCeFptsSuTQa2F3B/TmFsYZpWH
 nfmd/G+X3Iv/oaDisqyJRETuR7IwMDGRlBD8eptyrTSuuxibNrrqS1/Jujb/7hUDjSLzlURLx5x
 wA8/x6Ieitfb8yoEFbBR/vEIJ9vVSVniB5IaCv45f79WE7ByVjRK8M3aZztlo8YMeQPEk3bnYYo
 DMWnBT32bvR1LUowxAND92DoovX3FWCoUlPWMbOoBlf8QzimsNS37F1pifGwJB1xkZapWKvEeaD
 MtvE+UFfD3Hm90MOaEhblX3uOzoFqNgA+XE7XNowGxU6WFeFI9/CEG4s1a0GPR+vZ9emsFO5nwS
 2buUulFPnVRnVolPj2jKdHnf8=
X-Received: by 2002:a05:622a:4209:b0:4ed:43fe:f51e with SMTP id
 d75a77b69052e-4ffa77a7978mr21035831cf.39.1767667987699; 
 Mon, 05 Jan 2026 18:53:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvb9amrAibMxsOwQoVVZcpkjPxk8oGyOSxOfVPt6qVKOF/X1FnXoGpSJghOo10X+fxSzJu9w==
X-Received: by 2002:a05:622a:4209:b0:4ed:43fe:f51e with SMTP id
 d75a77b69052e-4ffa77a7978mr21035641cf.39.1767667987091; 
 Mon, 05 Jan 2026 18:53:07 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0d1c8sm228848e87.22.2026.01.05.18.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 18:53:06 -0800 (PST)
Date: Tue, 6 Jan 2026 04:53:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Expand context ID mask for DSP
 polling mode support
Message-ID: <xrudy7p267tuu6q5qrndw35677noevqq23zooxmsacxlswzpub@2cqtvc6e3aw4>
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
 <20251230062831.1195116-4-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230062831.1195116-4-ekansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695c7915 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lGv_y-9tEziHtbIbmlEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 50jF65Yt7xByzcjap33rMn7bzVo2HEpX
X-Proofpoint-ORIG-GUID: 50jF65Yt7xByzcjap33rMn7bzVo2HEpX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyMyBTYWx0ZWRfXz3pwqaqrFc9H
 Qg8ZbmCNUDbgEVMm8MQFpexpt4zMJpwvDgo5phpSqpDN/G/c7jSaQQFhD0p95Ay6rfvS5VQHMIK
 sbsdzD1CordtT2Fci6v3OayYrKqsq2XKQ4SgINdW1qvEoFeGfjbvx886MY5U+4xLYHqDKyFLETi
 1BT+ugJEHmEpMKGYIG7KFtlAtFZ0D3VaGkGInmPOtIIZ/OFolBQGyn1/r3upI/RoIYlC5kiL+rQ
 AWLhmUsWMsUreUqlPI/b2nLK/v3FakHRnN0feNHPikedXjVLgZA8/PDCtnHeHguRHHUYFoor5hR
 hysefE+VHJNAJJhhpklGw71kXm02vQSwciUOLExx07HRgtExN7omsJQrUfFVmQIbTCR6VwgA4MC
 LDgwzDMyxTjM/QaatZZRVK2UN+/Ugo6teXvc8+KeL29EM5fT2SErW3NhaWV4UG+fvjn/OIqQgRk
 SUvi57elHzs8t0YTosQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060023
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

On Tue, Dec 30, 2025 at 11:58:30AM +0530, Ekansh Gupta wrote:
> Current FastRPC context uses a 12-bit mask:
>   [ID(8 bits)][PD type(4 bits)] = GENMASK(11, 4)

Is it Linux-only representation or is it also used by the DSP? Will it
work with MSM8916?

> 
> This works for normal calls but fails for DSP polling mode.
> Polling mode expects a 16-bit layout:
>   [15:8] = context ID (8 bits)
>   [7:5]  = reserved
>   [4]    = async mode bit
>   [3:0]  = PD type (4 bits)
> 
> If async bit (bit 4) is set, DSP disables polling. With current
> mask, odd IDs can set this bit, causing DSP to skip poll updates.
> 
> Update FASTRPC_CTXID_MASK to GENMASK(15, 8) so IDs occupy upper
> byte and lower byte is left for DSP flags and PD type.
> 
> Reserved bits remain unused. This change is compatible with
> polling mode and does not break non-polling behavior.
> 
> Bit layout:
>   [15:8] = CCCCCCCC (context ID)
>   [7:5]  = xxx (reserved)
>   [4]    = A (async mode)
>   [3:0]  = PPPP (PD type)
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
