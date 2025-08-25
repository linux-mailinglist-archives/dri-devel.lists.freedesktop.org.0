Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F4BB34DE8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 23:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A11810E580;
	Mon, 25 Aug 2025 21:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnqMBaHh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5367110E583
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 21:25:16 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PHC63s003654
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 21:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QkdYyByc4qu2z3KivFhAjolM
 bNa7uS7Ln2Vatot7HuI=; b=nnqMBaHhCoIZuQmlmcrujNwKLGlo9GshRQFAxeNU
 4vylH8cKvMtUWWFI1ddEmpSMjNhpINqsN+TsNR8ucOVrKo43CbeGn54aUHeutiWI
 4xuMTNz649EhZ83SyTtXrFykuoVEu++gmwvUEHqpZFDItF9PTbze4yDk4q7PY1Qh
 qDa51+eGeeObAmirYJx2fqGDc6eIdY8yyhy02nhS81vpj4513NPF2jrXrqSOIgh6
 AhNAISH+3NI7ZzGdYWXGS1DQAseOC3f6oHhbaez/KJ/RTpx+6/kcgCDdgY38Pc6z
 oAz856XtwAsgxMKqkvl9mKU9CBxrGnnAV3r/Ft7jT5qmAg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5ed55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 21:25:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70d903d04dbso94275466d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756157114; x=1756761914;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QkdYyByc4qu2z3KivFhAjolMbNa7uS7Ln2Vatot7HuI=;
 b=uDul5kh6Pn9ku3kUBTmHbYpMj4M2C+v7vcPRex3zSiwMAe/M/RpkmztKeLH9TpFlop
 tyWUh74fQ+ANn7ci0aamdJhPtPLol0R1rtprSI8BXFvv1RttkWYuR9iODM4M+Zit2ahA
 /5eKR6ce2fteYVT8PDhPVV35fb/vqCyXnLceDHhZkJNCWUMXF8aZ0dG/QQpZM8M/mXKX
 PaSmf7lzi6P9KKGsC62IfM3AT6qX0jDsGIes1jkwGONEhzzdbfZRaDJ2W0kRbDMB7mXQ
 gwHwRu1mAti+vH7KHqRozlqvu6Hfiz9hJ67tNwkvNajiet40H8ol2HT9eIjn7UHkXcen
 HpMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjoXM1DvEDFLVaIZ4AZ9LGTnAvpwL8UVxk27vYhkdeTgx3yxWw1gj2qB2DFCB0QnQW+64E5yaIuwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvdPeHbXGaCWgh3F1aj85hqNqTXRi3OrfnQPGGDiUh2jYvdDzd
 6GI/uJ8GLHBQKwrUMNdBm4nZLboP9A1bvUSWNw7wPYJqMC0Qt+fgqXOG3uxqf3ritZnsx7+soBU
 icurdCVn0+23o+rBWjfQnJaDUiWowc6Ym0XYDPjMey7AVopP22J/bdCI4RatnOANeFT5zvbs=
X-Gm-Gg: ASbGnctcec3uXtYUiiX+yIRjSJ1DlFCr28yRma4j1w5i8Jpyr0fCaK30V+tMDaH7FO/
 GCwhq+CGEbqW9S9D71LTPS+PjWCPFTr13OYIDYHhihaNqJecu5CdPm++RgH+8qNS5MHAi762JL9
 b/sXz9ByoEUKKM+SHD1DgB0+HNmdRdotn38kekwlEnvkI+IiY1GKhpkfEBH9Am02ogCEt9xruR9
 05uodazHgGXO4cAuRNSx4zMaW13gK9YGf6IvaOXcKap21dMBEIz2hBpTh0KcAONnK3y1LlE8cPQ
 K2e/rldpzbrvb1l9bncaKZ3XWGagDdUSwVISgtbyyfCuxnM188V2qScxEPvFUWgXe8VqSbWPxfQ
 ZDbEVN0UAkCT5lWkk8blwwsHQ4w3ESFO4tVRWQt/Wc1Lj2em0T237
X-Received: by 2002:a05:6214:5194:b0:70d:bdd2:7cbd with SMTP id
 6a1803df08f44-70dbdd285e5mr57898546d6.43.1756157114526; 
 Mon, 25 Aug 2025 14:25:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq2rEu+6ixuxBMxYQ8u/Pd+yFWmby54+NU+NTEPnzzeO9/1ZQ/Y0I6iBmqPcH1qtql2z3huA==
X-Received: by 2002:a05:6214:5194:b0:70d:bdd2:7cbd with SMTP id
 6a1803df08f44-70dbdd285e5mr57898016d6.43.1756157113775; 
 Mon, 25 Aug 2025 14:25:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35ca730bsm1836015e87.148.2025.08.25.14.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 14:25:12 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:25:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 19/38] drm/msm/dp: no need to update tu calculation
 for mst
Message-ID: <c3e7aemrnvf57rupfegdetprztvrjyn3setvh7xorehm3wtxjn@mm5brbolt4zg>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-19-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-19-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX5LoSV8ikXkKI
 HeZ1JS/gsoqZZi9rEew2ySnLi9aVsu76hLbzHKlsWxndRShJOnbvJN1UVanuvsAZ+tyv5XjU6rd
 rJbVP6r7/wvq2Oyy7UNBtcS6l3UWOlo3t5b6cwbb4PJ+LknS3LSRXoayipHPro//8tcjKxPOY/L
 voCgDs3eetapwVKc8+qlQnZ6nYimTwlQgPZx6BWJ0upKZtCIcRw9McStq+hy6k5eq8S/SblTMMA
 4l3ziu695/qc1UiYfePnyoHKOC4CEV48QJdnTQhYhS01+YMj4sp+CGSop1DogM30J8y5+Ua991p
 Ee/ZjYWIeaNDdGFTKGwf2WTeVuVGnAu59ICspOTQAdJ3uEF3Nz3F+dunFhdWN944J8UuGA0TW76
 q9uGkvv+
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68acd4bb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rNJhjsDl-Jf4-vzM-zAA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hdCzQd5G3vaZLg8aMf0fQG1HTBWDjARB
X-Proofpoint-ORIG-GUID: hdCzQd5G3vaZLg8aMf0fQG1HTBWDjARB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:16:05PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> DP stream is transmitted in transfer units only for SST
> case there is no need to calculate and program TU parameters

comma before 'there'.

> for MST case. Skip the TU programming for MST cases.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index d562377a8d2846099bf0f8757128978a162745c3..c313a3b4853a1571c43a9f3c9e981fbc22d51d55 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2685,7 +2685,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	msm_dp_panel_clear_dsc_dto(msm_dp_panel);
>  
> -	msm_dp_ctrl_setup_tr_unit(ctrl);
> +	if (!ctrl->mst_active)
> +		msm_dp_ctrl_setup_tr_unit(ctrl);
>  
>  	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
