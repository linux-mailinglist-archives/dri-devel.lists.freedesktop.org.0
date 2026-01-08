Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA91BD0322D
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D6610E739;
	Thu,  8 Jan 2026 13:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlyMPnHT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4+MwwqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8811D10E739
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 13:47:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608B2lUh1970090
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 13:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=n3f+etYRxsMiODiXI93sCH+C
 dwRw/Gwp4Q/CPiOkIGg=; b=nlyMPnHTfHlLNFqKdBvXDwOa3iy7HGZG9PbHWofm
 pplFiw5H/3M4z4kmSDsA2q2ki85US1/NJ79S5BKoXHUhbfqrVORwZhPrfYnXJ0EH
 wZ4jNRW27nUTSGHozrhgepEpQuDoSqIt6cLi5L98pAWTZvZ/UNJdLJs9EXj2McQc
 KgGr4kCLtaybYTFM/jDFK5iW1xav92umSpnk8MVI8ddRU5IuWZFEstXXSPJbZwy5
 d+5y6x9B7ox/IWTwd9dXrDwlvbvxsV+Eph+EA27HyX49Aue9vROnNjSgxd0LzgbN
 /7lYQaR7fYt+D1bh82+ZX/sB2Co9My2trnfhwBRIbzmqng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjbc4rerr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 13:47:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2217a9c60so599105485a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767880033; x=1768484833;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n3f+etYRxsMiODiXI93sCH+CdwRw/Gwp4Q/CPiOkIGg=;
 b=f4+MwwqFAScViq8thWcU1SIwKgL2Y0mEtdOwIaVXOZwwlNHAPMmHRODkHHL6uNVdAG
 zwb5Z38aXNS6YClBHweOVqi37RkXpjw/MGi+GIL1i8/PXeQSK45gUYyfFzQTUevsiYYx
 LduI+iVyEBAsYnHsJmwZaGV0+B2KhUTZWjMYLEqJmcJdAhUJsOWZOVoX0XUBNPORFEQV
 IcEKnvkSx8LFc/s9gBk/kaYlO+O5rDnTWHteZpORfy0aw/t+L1TR+jOwn1+9UU17ZkpT
 CnwQwY4dIRJpcSK94vBrdGf1HKTDVH81f2CkO81cMEuDoQmETl86KMiX1j8cSfosA9Nh
 V7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767880033; x=1768484833;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n3f+etYRxsMiODiXI93sCH+CdwRw/Gwp4Q/CPiOkIGg=;
 b=P57867GyDtLeqWtLH010gBwO3lFKJlvWktpnuG16YJqCZk57sQBc7zFoVD+/0+U17L
 Jv7h87YklDty1unFTrs7MuS6sm+dGOq6Iuz1nNvgP5ngeIhr49/t3oyF66w8AlbTJD/e
 gqOrvzgw+1GrbLgwQHQ4x0fRiCNR2N7lIa1QPtKmYjvT/t4LmxM/eV2ppOw0lYGLWMw8
 ZmSGTnioEMBgf2dtpxoEBxmyGYoeJ46+MJ3JvrBp2aY576KHO/xf4OTKGyjhslAvzOPk
 Rn5+vN+FGvN/mEK1xkTNo5gOMEtVsCxW6R4ZfOsHridO0i8bTCigGOumpL/vOdAeBi5f
 uaPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbQtyw7n3PezPTNZ+eBAXCrhsCa4YZVpv/fJrXcTjMm+i/mKVlj/siIF9Qa9W0jjkJxj+fNG94xuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPx+WSynIPI/oSGeOURNbT3GiUwHLE6oiPZKZN+jEX8epdXrrv
 tWzFCHHcN+H+uZR3IZe/9bNYQX9jM32Wu1N6fUc0RtmKaNmidQ2nLlVo+lEJGfPx/aR+ostIn4w
 DrQHu5yvNWoCafyTNFr9nxmsDDGOnGayU6F2t5vln8irLm5suaiQTNQJ07b6rYiFTPelT7gY=
X-Gm-Gg: AY/fxX7Wq5C2x9sjf3BR9h1/AvUFLTn28rrgdKyEwmCAgWbnG+0+hBcPO1Fw0h/oVpB
 PLrvQZXdzo78PGWLzj89SbFP/KLVTUAo9+yymGYaEE+STHESbE6e1swr+hzAB7RG0jkN+R0TuCX
 yI6MQnoxfXpxUADADy7nT4eTiCHTiqWFUM/cENw67GoG06FMlhuHGxCAGbN9SLyUvqH6YuIo100
 mI4RLiHnSBxc0hJeJRO742NQtNlYogmAgiPvFMFhKiha8eJ3Wr9GRySQJnIz8CX+Khq/Ufq+4Rl
 kLsMStJBqR/c+YZvjNq0D9G9zEa5CSnNopqLY8udFkaXNC02emPThLsO1sT5+bHsTPvCNioYYrN
 mbFzEwn6dP18SaSTfZCljayO8oIAn6BhPkzzCYlz0sBdwFWBloKhQEBVfhw2OG5HRg5mcWZH2+A
 4ntGuqi+cAnAxoKM/DgtwePsc=
X-Received: by 2002:a05:620a:440d:b0:8ba:41b2:da01 with SMTP id
 af79cd13be357-8c389411960mr706756785a.71.1767880033367; 
 Thu, 08 Jan 2026 05:47:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbpFtpZNVM7lcaBYVfhMcezqpILdVwNfiJmxtPnOztyHBEeJGRheIjrGEnarHqtGVANi7z8g==
X-Received: by 2002:a05:620a:440d:b0:8ba:41b2:da01 with SMTP id
 af79cd13be357-8c389411960mr706752985a.71.1767880032880; 
 Thu, 08 Jan 2026 05:47:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb90a4besm14701141fa.41.2026.01.08.05.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:47:12 -0800 (PST)
Date: Thu, 8 Jan 2026 15:47:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v5 11/12] drm/msm/dpu: Add Kaanapali WB support
Message-ID: <mr67bnn2t73kdnh7fr4imue2jnmoofwlfn3btoj3etba3lybjv@jv4wajl62vlf>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-12-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108085659.790-12-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lp9sJHx1Mcp7wcEtFUV5RNn0HIezwlHY
X-Proofpoint-GUID: lp9sJHx1Mcp7wcEtFUV5RNn0HIezwlHY
X-Authority-Analysis: v=2.4 cv=fdegCkQF c=1 sm=1 tr=0 ts=695fb562 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2ZwTbIZCPXwejyfJx6EA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5NyBTYWx0ZWRfX1rDJPUQ6/QVh
 JXDNrNdd5gOBvwNT7GoONzW1IGBQ6FxUsDlbAqaLF9qPwhqJX3K+TmNpMBV1dkufDJJjeByX2Eu
 iw9AJ3iA6eHrJS8xVN5/EKYqNwT+n5JBcxuW8cLDIwGLUrWU3x6IoQ4Lwc6NJAFp7//y+f4lQw9
 p5HOgZltfvyYAiHySnq087ddMJroR3MCQPdAl5cnR6ZPBTAjUsbzmXGOI9mM83hssYN23beTvRV
 6sjRL6fyfxlkt3pgxDzTpeAkZywprcPc9bNYx/YAsm0F3UDwrFk8GcRCPpZFGsg5SSqiVL2Jyob
 dgrELMYwhLqLBEkheVa13WOstmfj8RsSa6JeYUgg253lPWTyAUNl7Vb9Inqu7jluARRRfiuXDLr
 luTNFdMbcNN9U/zScKJhWt7aDZpXCDu3O/8AldMJLZEJltL8b0nu/XDkvTmReJ8QUhOk5HsokrM
 EjhWCWbISq0RbsTdrqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080097
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

On Thu, Jan 08, 2026 at 04:56:58PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add support for Kaanapali WB, which introduce register
> relocations, use the updated registeri definition to ensure
> compatibility.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
