Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC8BBC8220
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 10:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06ED910E979;
	Thu,  9 Oct 2025 08:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xrw+H4t2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2727110E979
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 08:52:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EJor019131
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Oct 2025 08:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mz3R/+d2HRB2j4ZAAYNbKPbcU1+9mJalbUWZyK8B4cM=; b=Xrw+H4t2gQxnEgFS
 dxv+K9WlSIoBBBrj/ny7tiQn2lGq3Y+40pV21TdG40PO0bvvblR5bscNgV8ZBOn0
 NR5ZYiWL8QWFoguVwfz/fuQfFrppThsY3Q6L0ubkm6qsz5BlViVelyt6shk7GNjg
 avD6M4JFFF5Q7ZU3EEXJ3AI/QwJ9mtGweAHnTnft2xYkzftNm04PoQN2Jnbs0dtB
 PiXMI2iiKa+pVEaaVykHgKIiFJpoNi3Gq+3SzjvHtA0bqUvBQ6RsfKL74sJvSRbc
 AYFN1sIRcanio+cS6t5fRfrGcpOXBkpeoFpQ5OX2bXJdDG/WoLXi/SwnFEPSGQLv
 HNQbAw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nt3ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 08:52:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e0f9bedf1aso2578081cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 01:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759999957; x=1760604757;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mz3R/+d2HRB2j4ZAAYNbKPbcU1+9mJalbUWZyK8B4cM=;
 b=wKeaIey26CJ1lNh2dxKU1iXPh/htmlNx74LxewP5sc2myMjy+w2fzNCRFXmfDtfwg9
 hxQJ259SNW9nYmi0FGI/t3AN0/zBWhtGBqokrjm+ka6NuGKBNhgE0PZ/7eDEb2Jspi9N
 cUwIzu3VW5K7Yq2EXl/B5clnlPAxAdrUOgYSAEKB5nyTCxSQE86uYT63jfrHGZ3ktOQB
 7mZkIu8s1IhQMMFfLo3F8FX+eCFWifMV30QUkFrUTk8RSgY/etE6ycDPrsxe6GRT8Djs
 TMU5Q/pUp9nRGeAvMIS5VAeemYPmcVUXtoLB6qoi+9WGO2bLXbRcHRuCEwq7XfV41HeK
 EfGw==
X-Gm-Message-State: AOJu0YykpkJ/Mqze/a9QAvfPLrgNwIKtXf8VDSP33Avl0x5WJn242XOr
 Hw6CMnQ9asANEAEdaeZv0DHIybciQcPm6zOcjpCXLOBOuUEm2TCDawtqow8BL9+mw1CuRu8OqM1
 GEWrdmmdVvwP6eagx74OsEA/q9WN7vcHWVpUlCRohvBzrFcRXF4kSHj3+3bMhUPR1CCvjUEQ=
X-Gm-Gg: ASbGncuCZxfa4TyqUyJTGn9FCVHPqDZVXiFUbwSlLKobZqLh1Ax2+i+WcN0IPA1LBxU
 MTFN4Ur855uUJC+UU9q32Ypao+/a2DoGY6ttMqOr6LIROQQvh6Px59WqgZDp5oGvNRXhczQqoiK
 Ns9yMCYhecG2oNeZr8w8j4dqMZH3ArbKQlh8Xvyx8NovPzbQodjTx9CtVNBUGdxTOVIaeyqH6wQ
 UI8JBhawDkfntZQvjvIy3GuQG0iAWA0k7u38waTusut5NajG7waz5pCFNWAcvBXnWav2aM68a+8
 VLFTZ9AUcS/wAgs+fIYaa/drmJ6TGoPQ/8UXSEZVTXeRJaccW2uho0hJcnPvf04nvBUOahPEnBk
 UaKgsx8lhI4IMnm08t/P06UGmrkk=
X-Received: by 2002:ac8:5fc3:0:b0:4b5:e9b6:c96 with SMTP id
 d75a77b69052e-4e6ead1deb0mr60152811cf.7.1759999957510; 
 Thu, 09 Oct 2025 01:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt0uEiEbh1bGs1o55s5jlT8wv6t3qr229hu5kTSl6GIzd3si4d6C3k4g7aU0DhbZYlQXIyoQ==
X-Received: by 2002:ac8:5fc3:0:b0:4b5:e9b6:c96 with SMTP id
 d75a77b69052e-4e6ead1deb0mr60152511cf.7.1759999956930; 
 Thu, 09 Oct 2025 01:52:36 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652a9bfcsm1836499866b.17.2025.10.09.01.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 01:52:36 -0700 (PDT)
Message-ID: <3e115b9c-41b2-47c8-ac92-22969766ec3e@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 10:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-5-21eca1d5c289@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-s6e3fc2x01-v2-5-21eca1d5c289@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KtXuuIm7mpaBRCywuGMzGBqsH20vpsWz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6s2zPc2mss+1
 06OFPOrcy391GBAJ3myMAlBUs/1Oe4MqAqd+0Z4c93rJq9DFv155/WhuDptrC+92IRvayhNH1QY
 bxl4rY6QG95laX9wWENTp6UezXWeeYdLpx2Mijxx7tVu4btWc7MjdTAaA+QYZzZXgt8ZAQiRWR5
 PfUtbj4F3FVrgxus7CJf2wYnvVn6KcZUZQjRxfV38vQX7k4UXHDx0IY4Ex6hFufgXV5P2hLVgWL
 BoA4W8Snj9j9+JYs/gitJtVsDpNPjqBXZ/Wjts+CKNBMaq7r+uUmlj7JrQKsAnjn1OdZUsbaqVC
 oyGrzNM4PB7M+Bxgd+g1cDXobzVKQG9/Moicvy+7ODtkZtJL/EOAhY36+1Fw8bqgHq7Ya6LzvM1
 xrsSCzCSuFLx9tr4tnQiu/ABlXxKqw==
X-Proofpoint-GUID: KtXuuIm7mpaBRCywuGMzGBqsH20vpsWz
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e777d6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=WFa1dZBpAAAA:8 a=bBqXziUQAAAA:8
 a=cYgmbtr1Y_meZTC9yNIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=MZguhEFr_PtxzKXayD1K:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
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

On 10/8/25 4:05 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add panel driver used in the OnePlus 6T.
> 
> No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> 
> Based on work of:
>   Casey Connolly <casey@connolly.tech>
>   Joel Selvaraj <foss@joelselvaraj.com>
>   Nia Espera <a5b6@riseup.net>
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +	/*  This panel needs the high and low bytes swapped
> +	 *  for the brightness value
> +	 */
> +	brightness = __swab16(brightness);
> +
> +	err = mipi_dsi_dcs_set_display_brightness(dsi, brightness);

mipi_dsi_dcs_set_display_brightness_large()

Konrad
