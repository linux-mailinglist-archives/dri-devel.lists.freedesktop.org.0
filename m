Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33F7CE81FB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 21:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E7110E033;
	Mon, 29 Dec 2025 20:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlAdv2ub";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1kD70Zh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942FC10E033
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 20:21:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BTJqjqi2284839
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 20:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=; b=KlAdv2ubMWttmbER
 zK1m+HlhknlB9IltkrkURme8qcJDFJ+ZfDlbtrT4bO63ZP5p0yx+Yt8/PEmB7e22
 ahTfq8OgZvlgXY/Fsb8iq2Hnn0nKA7XFrPAgv5htE3T0qjnlfrTng8IXvQR38wtG
 dyS4TuVPF7yWnkc9+GkWwkgFnvdzpeOMNt3YbmgDgTpzxZ6IDNNMTu7cVEt0ApYd
 RQLEh2PAj9p1gENTP3jl3g3yILavYaUsbAem52ycezS2xmen9DpZqC0OGQFJUvui
 8gdV093GMKBOXuEyX5EfYy6KfwRshLAHXVDpYwIjScRmISHmwSoBA6hGexuUMRA1
 OFlloA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gr1rg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 20:21:49 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-11bd7a827fdso17720225c88.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767039708; x=1767644508;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=;
 b=R1kD70ZhyqcQjMrGyjLlh/6TtYzrh1C7H/euD+OgnF5acXnkKaF/cZ+UUzqL250ubU
 iLiVbJ6zBXtlQgnlfjawoRPxLXikgyA5/HpEZ5sC7VWZJspnh4AY4Qn6zvpT48n3BOuu
 faOzr4aTDmNm0+LGPstODqkskojazKFboRmauOYFI4XIFfVYxTjDLP5l7tnYc6Vf3Xbg
 14QgdQQPqDfOt/8/4j/jU+bBSvBFp0UrtoyBF4osJtWHDvolx6eIy9Oct1RkstNuXx3a
 TliWXJzY03ZnHFLufuFjwmNyOsNGLwpCAYLYMB3TpGGb6sQ5Gj1xw35xnENyKzZmQrq9
 1Spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767039708; x=1767644508;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=;
 b=X228R3fJsTarBo+7P425mkZv0EhZJ/gi9MJo1l41aC4jZwcgT9rR3FbunzvHQ5HMua
 +OP8Zc2BY8rtIEs6ipMD0gqVojy685gqd3nx0YD+iBp/KkF815HIN+M+G+vKZArdNFjj
 7e37MdrhE9vdQbXyArbdoHUrrMsN1ZH0zBeeXPOA3uGJjH+lTKyvahd4LQhWWLpEpYgY
 m2V6q+ffpjwp3sl4Fmkd0mkUIz6unIlTiiPT1SVTaN1T+Ek1pRy71YFNvTgnoSL55WGJ
 hvn1bYrHF6ahqEp++yGlAMq2uiSR9te4/A5+WhUyVRgriWOytHAwrgBFn0+mt8OZ/Zkq
 gugQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9OSbajQaQLW07oLYRF0h3Ky2KNDLMtpHbv7UReNrsLyduNNyjwSddXbd7LIrctkR/nok5esbcq0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycoI4OcjxAniT5WOlGDgvktKeyESpPJha2TQU1VFItpS+CMlV/
 PuYZZsolZr4LaaJp7bhvk+mhWaAo4B040EGijA3AZE/3oKmVn9LcdyyBQmkWVWCchxhniKf1gRq
 Cgo95wjmryR9ib+HFQ0GoO2h4bJsbst1hgrDld8kin1/glm+jX7Ifg1KEboJn7EtRFZvTg4Y=
X-Gm-Gg: AY/fxX6ygGWFqt/kOEk1aoOQbVUB7IZJbT3rEdhHk9oQs4UjP2gZckH+yPnQZTGF2jZ
 OMIrFavUZ6JcdTkseuILbygRU+w+RcapeCS50A3aPyO95RIbPgngejcaBlPtbumGRGGFdHIxfBT
 mz1afgbQ0sBKFU8cjN3Z+kGiAtKWr1mCKNLtSVXFk+dgge8qj0Mk9wMhqI86kLbdE7njMe3pxs7
 F2T4MHc0e5pAgTq+EzregS/o5u7m8x7rD2HgTpVt2VZHjI0nlAMNP7/WxPXXhqrVaDWZQq/0Bw8
 k4wAVffWSrteJG9IGKTAKuX7bZUPysluXKNBDSgZvlk9Vj4Pe1XZTEvQ55kBVfTdXhjmdVY5/8H
 0+sBZBXIjf/5CEpCA8hb3t97L7cjZCL+tYBGZpTEAtJyOw4iPPgvs0x6MNYDEjRA=
X-Received: by 2002:a05:7022:204:b0:11f:19f9:c5f9 with SMTP id
 a92af1059eb24-12171aca672mr31221596c88.12.1767039708205; 
 Mon, 29 Dec 2025 12:21:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETQHo90sIZ9Ah2oFCPURRgJ6JOFVSXKLGKjyL2O2wo5JOl3Bs3GTMtBAiIr30Ft0lRKlNsqA==
X-Received: by 2002:a05:7022:204:b0:11f:19f9:c5f9 with SMTP id
 a92af1059eb24-12171aca672mr31221563c88.12.1767039707617; 
 Mon, 29 Dec 2025 12:21:47 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724dd7f5sm120318362c88.5.2025.12.29.12.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 12:21:47 -0800 (PST)
Message-ID: <9e6d2c54-6c63-4cb9-933b-3647c25fe72d@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:21:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] bus: mhi: host: Drop the auto_queue support
To: manivannan.sadhasivam@oss.qualcomm.com,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-2-c7499bfcfbe0@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-2-c7499bfcfbe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ijr5HQVPZASfmKMa82jwGQ6Z6HpiOYIH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE4NiBTYWx0ZWRfX3kEoBPhFP/1A
 E0Ts2N4ZSft8oDvS7UnEoSNvirvBhZZwawF5m2wjGXoaLZT/hv4bT+j1q1VtMi3BdwETgFTD6hv
 l/2iNh8KtD6Ha9qo8QuZyclxIRFX3cStlTMcYAjK9uM0TqrpABRgJpG+fHUkdPrAc6fLZ50lml2
 pMRAFSENKezrfTGFv7EZpxm/sAbyHyXdhWy3E4XVD/TcKjfCJeMVoTgi19lWQlVswLIo7IHdRGx
 YYNXZSw2S/8c5lBXXZmsl6dFPwLDFlL5h5MUV+zqMrs7+IZxLsd7umeYverqoGTLrARU3eZnLhV
 x5b0jxm6XXdJhl00qJ4PaPmVoqefC/Rcf3kjRmC1FeigULm3kuPsjR9UHfRYGX/NvVjrER9VJ6J
 OV7230X32w8ITzQ/jOIXX1LZONZAE7txUScA2Uql7UHlrMG+p8OADltI3HzkIouqna/yPMV6iNM
 8tOAqc1GfRQvEmq7e8g==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=6952e2dd cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gPICEALkPRU_h5exja4A:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: Ijr5HQVPZASfmKMa82jwGQ6Z6HpiOYIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290186
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

On 12/18/2025 9:51 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Now that the only user of the 'auto_queue' feature, (QRTR) has been
> converted to manage the buffers on its own, drop the code related to it.
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
