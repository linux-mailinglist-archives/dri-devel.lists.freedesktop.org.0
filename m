Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37F3B348D5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 19:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B39F10E17C;
	Mon, 25 Aug 2025 17:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="figFNp7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEAE10E042
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:34:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFqtB2016949
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=921Bzr011b9Fk2gqlTe/2ABf
 oYFpWqrFuSDN0tU0Jcg=; b=figFNp7yWDmkIdmseVps3EgfXJ5gryeuXcWD5lyA
 dH6bFvW3l5NbJR7L5OgFMRuNQo3oGOcKskZlSty0IY1fKF9ykdU9jEj6S3fUCi7Q
 RNObZIodLFJffFaph0aMvFbXWMDylU7ucoGsmJiWL/rRLKyf0nL/oUvXNqg+OeLs
 TcuxO4AURjP/0wxo357YcbWhk0doJ2GXWmgG7shNBND79+8EbCODQ2iBGDz/X7Z8
 6EdPd6etAuIhn3Bf+Mw3nTXSLwq21OvOZHZvqjYsU9/WNZSgfUTnMCl9VE/f3coU
 4D7gy5gEiLbq3e3vTUDoU+ZT5/ptJbzeaRec6izeZqlfRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpp2n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:34:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109bc103bso106667981cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756143281; x=1756748081;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=921Bzr011b9Fk2gqlTe/2ABfoYFpWqrFuSDN0tU0Jcg=;
 b=uIO6IhZv9IZYbCF3HJ6+iJsjAwLoRvz6WTuhpdZ1OAyyhXdEMwJlWJzFp/OfDJMV99
 REPmOigDH4+RQtdee+QF8jBkbF3AGOCtS8h6W6TdOw0eiESW7554uzIMFGm0mV6ubHkm
 btrh5dUKzFVXH7sI8OZXDRVsm2vEF4qAsSWnud+QGQX9s28JwmZh/77g6uTYnVMcU6cS
 5iDmWQj1QWOd2VReiHV7RuSuUgpOrEVvWcM7IjliqVdzwrTfSDwnu9h3PgVA56kwnnMx
 gzvvbxvdxDScmR1iQjrJaIx4sAzsMy/wBB+jFUQiBOR3eEAukQPwhJxGE9IJIH7gt3k2
 nDSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+IO7/3DJvZm6itbSfp86rNB/d+7B0Bv54nlkY7kee6CEQprrkepP2B2Xe+nt4CupHL91tINxT28g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMhxb19JpjvWW9BAj0jEsIPGUoBFuZUwuyZvFKA+ycocs6UNlI
 9Nb8Vhk1Zh0tgABhRjTzJaY7Z48niRYR7/fJqIoWbk4qfqNUB+GACqrUJZ0JP0LNYO0N+62Z2Yp
 w/jLPUdUbuRNUwj8YMxA+Rm6pxjFNxu+FkqMs+9CAL1wOJ+xMZNb3SJdGtPORhSuHqLysoFI=
X-Gm-Gg: ASbGncvNOJhZvhEoxww4dxKC/uhgW9P4aWBr/7aHksAmokSlN8fFi1a+YV0UWCkTBzS
 BdzNrAmvyumAbIrpj+z7IxZr3KCxettfNM7m0YLsjGa6yHtkW1/E17nOQnvbzu8yzzpF12sCMRE
 q8DznT4dbEGx3yNyujyanZUBRIt4mMNdKhUMnCyIGOpDWX31/ft4tA+FDaALYnGDZXMrFDK6UtV
 ugBo9+xPIK7TwZphusGP/oP6/DrOgSFQb6HCqkQrGBTb6zy/6Ps6KIwhPVzWsp/RI5n9JccUcre
 eSnS8QHflqZYR2Pn6ZIbTvhciflBzooSICuzuXaYiwslCERcWB4Ithlsi9XXayX9ckILInKLk2i
 PGqUVYgIIZiFDjsV1MXWaE84nDlTF5DqfCoMK9nF+ziceWcqEXhBS
X-Received: by 2002:a05:622a:5c9b:b0:4b2:d220:4211 with SMTP id
 d75a77b69052e-4b2de83cb2emr22826171cf.83.1756143280788; 
 Mon, 25 Aug 2025 10:34:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz6WH+r8iVC5X6v7K3eW/AwuiBzcHaMNlP04RqOd75xHftv58SkM/HMIMyfwMINBYuS6fANA==
X-Received: by 2002:a05:622a:5c9b:b0:4b2:d220:4211 with SMTP id
 d75a77b69052e-4b2de83cb2emr22825741cf.83.1756143280341; 
 Mon, 25 Aug 2025 10:34:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f46dc5a16sm544219e87.125.2025.08.25.10.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:34:39 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:34:37 +0300
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
Subject: Re: [PATCH v3 08/38] drm/msm/dp: move the pixel clock control to its
 own API
Message-ID: <tmbatmfixhm4axvor3xliq75774vuz5w4ard42serfuwejs624@wh3sk5ug2u4a>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-8-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-8-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac9eb2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YadZbbKFZxuD_lQ-BoMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2ScBOdigKn03caBRFgAVmfUVH9InOLIV
X-Proofpoint-ORIG-GUID: 2ScBOdigKn03caBRFgAVmfUVH9InOLIV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX0heBsRQqSDtv
 XRgDhqRQXtoz9raJqTlEkKjwpQ+fvRfeSKJFInAnhQA9KokFlGf1qp1zyLL/RlLTz6bAsn/aQtN
 8HrVPML5wb0auN9UCYwHiXNgULkjAeNhfPT3FfjKn7eGKoxyU0y+bjOhieVEIynGahkv9lDSAGB
 Ngbs0cSEWmCMaAWW+zyDzxmbrbMz7oEBI1NtQZvQ7anzUhY/pBsnN7SQuXJ87/JkXOY9eoq7+gL
 VPRIjnybJLcww2yACjt2KTXfAlRr5Nu/rv5JExJ5TMTGgZZtm1CJJJzof5jFyXFqVzMRbg0SPU8
 y6xNfoFCtd31BziYIRGdj55XE+R1vJQvKb3dea733KznHG2cfExNaD9e7pbogbOdaZwr4eUDZhM
 kKnEnXVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
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

On Mon, Aug 25, 2025 at 10:15:54PM +0800, Yongxing Mou wrote:
> Enable/Disable of DP pixel clock happens in multiple code paths
> leading to code duplication. Move it into individual helpers so that
> the helpers can be called wherever necessary.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 77 +++++++++++++++++++++-------------------
>  1 file changed, 41 insertions(+), 36 deletions(-)
> 
> @@ -2518,21 +2539,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
>  
> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
>  	if (ret) {

Nit: unused curly brackets.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> -		goto end;
> -	}
> -
> -	if (ctrl->stream_clks_on) {
> -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> -	} else {
> -		ret = clk_prepare_enable(ctrl->pixel_clk);
> -		if (ret) {
> -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> -			goto end;
> -		}
> -		ctrl->stream_clks_on = true;
> +		DRM_ERROR("failed to enable pixel clk\n");
> +		return ret;
>  	}
>  

-- 
With best wishes
Dmitry
