Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879B2BCAFCE
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 23:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3318D10E247;
	Thu,  9 Oct 2025 21:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyUTD9rm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4924C10E247
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 21:56:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599En4Li004918
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Oct 2025 21:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aXc6K5FtfcVXCLUBSxVt1McR
 pcSj+yDNhIZwNeN9Dac=; b=QyUTD9rmA8NOJa8IAHnoJvNHyfr1M5380oyJsX3b
 R4DqEb+ay1JHcls/T/Hh2H4+ZXJdFtqmUuZbM3/oG0sX8n8y1/VE7RONq8l0pkxM
 njzgs115RQ7eMC8o+DC2TcEU2zR9R3uDau0fRg2krkRwJeZLiVn/O/1WFFvhl8fI
 kCUPEmG2MuZLbuhYawhUHGsTa4mMmcVViUxmShgs6d0LcjAmRFeDcUEEhHAH1Y+Z
 7vLtyLuUScfZFMon3sCuyCuI1AlG8YCvgNEkigwWYn3euk+fIGWGGrzbCoULSYu+
 Lio6gXm17TL58qigBe2HL4DxdeEvdDXgXaXeg08oaBR1cQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u4crd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 21:56:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-857003e911fso478005185a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 14:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760047006; x=1760651806;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aXc6K5FtfcVXCLUBSxVt1McRpcSj+yDNhIZwNeN9Dac=;
 b=xKBpINzuWPw4ozFWirzEstIyy1b5bms5y1jPM3/o0Rn0zGmS8rgWrU7g6ZquNDgpTo
 HfhHf9rtx8lxVUDY0uKPVZ7TH+ejXhrSvrol/SzlvEV96lsnlqbJc0twFf+RZuDApNCu
 yMisp9UYYCTc+QoZMQNmhJkynlxSJQcRPH0WRqFAiYspNCPHFgpJkOKRSIHBdim632UE
 qYg4YTcFH0q4fxben6xOPrci3+jcc5K3AiGYUnprgNZAeFcG9jYeGK1ZvBQ9hsV9JLBk
 zLYnECuijeWgv38Vus71ONND65oi1z8EQVAu9sDlgTDmpj+OQ/kIvTxkwrbmHFyLddAK
 wxVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUR4CeVpckLNIeXZNsljzZqLWhZe1SJ+aWiu+1LCIyRAlJaBkfoCRcdEOTtZ73o4qXtUiej9DuLLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrG2bIPLC292jUHqw/h4Iylir2deX7jZV7IH+m2ZxFi3/ay5aB
 8UnBgmjY2W4b4VrYdyDK9L8c/J9WjFpaSCLm903drR4ccY9ETtquVFoDVwnGKH5U+CyHBveuutD
 YfK758V4KNVAODpJNo4n/n5xmPpgNCm2nIpuzD85G03Z7jQOrVszwbVI2ifaGbgJgLiZQK5Q=
X-Gm-Gg: ASbGncupoQYhvzJ5MDA0zVHSPB7ByiXJrPvnyFJ0+a8/y4sF5QYscHdroAqLcDUmvRe
 NZMIJ6Z9hfYF0ZGNpxK4t9MM4K0RexLwhC5KUhn+JtCp1TK1fOBgukE5bX7B9mqVAPo9aWKwAxO
 Wj+vhYvCkrU5Yug4Wr436Gx1FZ3ljnKUPBTxKGF4PrujeDW3ht8AVH/4xHY7ZYxuReBLtngjQeK
 Vho1Tsmr+nBPr2PZYFPDJrIGFO7MSzsMLz+tQoh3DsM/dUEZINHpSvTjJH9MsDcqF7pZGvsT50m
 ku2XVu6Cej4zmxYxfUWNFCm7+qXXYK4gEiF5Ebi5n1dDT0FOBznrzgVgMyl3agQIiiyiTpJqlcu
 QrqfeVPPA/LVwpbno+wnxLutvkqcxhuhGVd0sygeE8KwmW7KlUPnWJyXnHQ==
X-Received: by 2002:a05:620a:1a05:b0:84d:a352:1853 with SMTP id
 af79cd13be357-883502b5269mr1331694985a.10.1760047006499; 
 Thu, 09 Oct 2025 14:56:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSe8X1c6l0Woc6nK1FL8k1XI8rlfvjiZmvEQKYodTgIRwNv66o2mRudxwpcphaC7lwUMm+yw==
X-Received: by 2002:a05:620a:1a05:b0:84d:a352:1853 with SMTP id
 af79cd13be357-883502b5269mr1331691785a.10.1760047005925; 
 Thu, 09 Oct 2025 14:56:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881e4f99sm225146e87.7.2025.10.09.14.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 14:56:45 -0700 (PDT)
Date: Fri, 10 Oct 2025 00:56:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
Message-ID: <vipgohc4rdankw2lcitdeypzpnqicbpccqcs72e37itpxj6wt5@5govlfjwyqxl>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
X-Authority-Analysis: v=2.4 cv=Vrcuwu2n c=1 sm=1 tr=0 ts=68e82f9f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_rVczFtdL_8dPuQia7UA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _HKRF-ypbzK864cOYeb65Xd-4irHBNHY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+EbFTKFsJ1ML
 EyJWJ/8x0a5eozCgDa+L5D0uXYcl01tzkCop9m9ZPB+haJBmKCnrk/uyPwTjVC+VEgs1RVsNBHP
 lRgiVOl0FyPfepSvGg92wwHkaJtGgrvTqatv7gVMpTx5jRnbfJYs9MnGjxMJ9XNArfySOFyLLdf
 KGlrK4hCY3bsvBt4jPrVTCDfAFqXEt6JfIbuDc93ThWqFndYwUVTGqrZrrOC7fMVK76HUEPJm6q
 YUh00FQdKi3g3A8fCNlHzltJkSXyY1SmUzzx43TfEPUr2hidQSYPlrKeoqmBElXGQ7hNVPT+XdG
 CaTvEZ9Agiz2Tyf8sBb6qK/qItQXFRdr0sW1ZIA/kLFJq4aSVNGohlczhrU+zrc8RiI7DLFJKox
 h0ZlVAkXIvoPDavWbRv9dPArB8TcuQ==
X-Proofpoint-ORIG-GUID: _HKRF-ypbzK864cOYeb65Xd-4irHBNHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
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

On Thu, Oct 09, 2025 at 10:09:32PM +0200, Christophe JAILLET wrote:
> 'mixer' is only zeroed and is not use. Remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
