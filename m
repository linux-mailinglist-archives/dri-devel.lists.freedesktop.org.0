Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D9D235ED
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF3210E70E;
	Thu, 15 Jan 2026 09:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSD0p/DI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOU3LWEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7502610E70B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:12:50 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g2EH783428
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sTN6sCWzZcqzyKT6xfnM3ywcxTjqTMX0dXCRizp4xxQ=; b=hSD0p/DIxfwxKHqq
 bX+EkklFL2pfEuZy5Yt7CIJLgqLv1+36Pmrau/LDtFSHDY5bil6swOF3rg4BAsK/
 IU6sAIaoHILDTZUaVFagwNxyPTZR1CJxn2kMAbIFRmhz/zC3Zol+MjXs4BukZI9q
 yV1vzrcxvH1FjKutF8wXYD3iCL2fDogyLwLJz4fWeQpPCLOqGgN35K6TCyNUbp5R
 eZJswStvVcMewZfgoSAxjzajqolT+R4PpyLgMo45W9HZaxPQF6bgdaJW4HbfGXw2
 xYOQu8dUcQBsXxqvQIBsy62Gigvyk+uUXv22Bwiy/8cKeM9B1eVJWM90Li01Q1KE
 tmOZqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5ka29-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:12:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c53892a195so15950085a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768468369; x=1769073169;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sTN6sCWzZcqzyKT6xfnM3ywcxTjqTMX0dXCRizp4xxQ=;
 b=DOU3LWEzLai6XADO7+0JxA4stvMt3MZwlCVyy0swU0MJnPsOYoZ7JvUtqYUx2kQ7GJ
 TUIlCBA39honSwl1xKFuujSUbCa+MwYcNkACaCFBZ1WmrK6vznRA4kgGwLL3awlbeFdA
 3Ff1lMjFXp5jWUCx/4p8CNdB0rDXpjn69rZI52mx2khh8If/T0MFaTKHhPLMuDZa35Pp
 naHJT3YogXVLcIibrU/TOg4b5wChiYhm+OR0vcCDdlWA/pHBlyIzZJTWt9Q4xHX2QtGu
 0sBUjlkVlzQ8zDjwuNUY/9vNmoKXCcf1zOk99hjUXt7/1ALckHqYQYq167u3d6Lef+dO
 6UpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768468369; x=1769073169;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTN6sCWzZcqzyKT6xfnM3ywcxTjqTMX0dXCRizp4xxQ=;
 b=J4oj0uBHNXCdeddinddCy3Iqysm7noATKB4Ro0uQRFaCX6A1sok9J1jTnhgZpFIMbZ
 XfmyJDyNxPVhU58eRKfhfUCxectfdXJC6zIv3QIq6AQZdMh+6gTCtybhP5fLI/f3PQ02
 A08lw7WXbE6QwEgFmMgl7+qeaxSizJ8ZfZ93nv25ytSUXoyWqyg4rRR8H6aiQZpJwHNO
 zwTQInunE4TkjHm/sJ/iWHtKtW59Tu7fr4jjBa2TYLLUwC0+2xQWuQk7tg9r1mSj0BIw
 /S2f2lixxBMvwLTZz3z/94jtq4mvJLVnihs6q7p8yiqbjVRlhn0iK/sijQ4w+qF9MQkn
 gW9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF+sSGqHYsSDJWYB3BwgxOaIHUCs+P3rnKSRHCTHjUXgpEmsUrtqDWrgvV2A4lzbgqA4wkAYDeVh0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwM/JBX03IYVHj3Oo/WzGoQWPATr4kNqzYS3+4OKNLBaCvZ/Gv
 YM9X1+tO+cQHqG0b+CQYStlYbu+N1QN96qZ34whQV35VMy1Tsh2oFbF+uMFJLVnIweFv1B/+6TF
 hrY2Dg4vcyMCNogZWJRLhWHyh3xuxGYgui8PTXXPivLW0N0XEhfPUbGI72l03f5Ap450Nm7Y=
X-Gm-Gg: AY/fxX7P6bf6gXOcUoTIzhW5Oag1RPJMI3ue5Sf5pUBrcyLpWgojF/QJK5uz6O3Mv5J
 JmGH8MgKt5ZuP0fz7Jn5q4/KB/xRuCbcJCdYCvJm1NwW6L+FQj55CpVzLzgaJjMTP9vp2KY0VNt
 H0kaYiJCda500rmaZHGNz8tLxqWhhyQj81CaU/G/XPz5QmKo/Bt2Ryh6r5sZtr1VGoBfnu8Qmma
 xrWE07dpW6ScIqkz6u17jp1l4OOf+Y93dPiDlyEJjbLUQJVs38TAAsT0DFzwBgfTXb8n4obtDkd
 GvcTgUwa65rdOM2pRXpRIwVGmsTlWLCQrZWsjWHK14ezM9Lo7LK3pxm0jmgnhmVj0yH84y4lnrk
 ZjaBkYRR6N58vLjanhGQPhWy3Kl4KsKPrCnTyctsplFzQBla90orA1N5RV1OZ+ePWMxE=
X-Received: by 2002:a05:620a:4411:b0:8b9:e0ea:af3b with SMTP id
 af79cd13be357-8c52fb74bd4mr593193285a.5.1768468369089; 
 Thu, 15 Jan 2026 01:12:49 -0800 (PST)
X-Received: by 2002:a05:620a:4411:b0:8b9:e0ea:af3b with SMTP id
 af79cd13be357-8c52fb74bd4mr593190885a.5.1768468368433; 
 Thu, 15 Jan 2026 01:12:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65411877707sm1893534a12.1.2026.01.15.01.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:12:47 -0800 (PST)
Message-ID: <c2d8ef54-069b-48cc-b6d2-642b357eaf5c@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] drm/msm/dp: Fix the ISR_* enum values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-2-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-2-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NCBTYWx0ZWRfXyX8mXEqVgjNM
 EfDF4DtmGxvFLUs8qFaFQ6eDTGmd6aVaIvUu1viIyzSCatYq6mdFIFlF8iE4NAggg5biIIl1Lfc
 Nc541TAeenUNVFO+C8gFpHpovfVF9ERVb8Dwzukhdsj9W5pdjEMcLVDREgu3XqJwuvljZfQzm94
 6ILswdXbUVL6uzs1DArtL7sM0G1M5nF7gtliON5Un0m5hyZ/BOrIVTn6ovjGEyyXmOKyYnvg6HL
 HYjSYBA9cHm8WnP+sY1Td0zLd9AQDV4qIe6e7/HeN4iWuKxxDpdHR3JGS2chgcP0ivAAQ/UBrdM
 XB3Ytg60v+XHaSiRn6GVS5KrDTTwsnsrai83b0Ld8g6ynu82ATixHx62GQH5HLObew8cZWpMjbs
 zl1XNeicBTP8A9VwKJjI3CIXS3HEhqWdUEhmpJDu2CqOdBkHoMWUubDGh4v8B8Vjv/KPOJU519t
 4Bar4atgj2xVMVlZYXQ==
X-Proofpoint-ORIG-GUID: gbQaSnPs8HXl-GEW_uMxw9mxHUPeM6lj
X-Proofpoint-GUID: gbQaSnPs8HXl-GEW_uMxw9mxHUPeM6lj
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=6968af91 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hxhQaWjiUK3sto3hAJ4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150064
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

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> The ISR_HPD_* enum should represent values that can be read from the
> REG_DP_DP_HPD_INT_STATUS register. Swap ISR_HPD_IO_GLITCH_COUNT and
> ISR_HPD_REPLUG_COUNT to map them correctly to register values.
> 
> While we are at it, correct the spelling for ISR_HPD_REPLUG_COUNT.
> 
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

