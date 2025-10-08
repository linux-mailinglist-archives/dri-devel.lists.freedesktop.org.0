Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E674FBC653D
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC2110E0EB;
	Wed,  8 Oct 2025 18:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZaHxiZdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1D110E0EB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 18:47:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5IxE027645
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 18:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=X3OK73bHBwsSCsPnoqJcEPf6
 LmWfF1FEv1wyHSAhwNI=; b=ZaHxiZdYlT7+2IktgpTpOzhGSkLjGR295GpDPaw6
 8l8B3bvaL7vdSbSAoSY941nFJm5pCfNKHEi0YFqrI5jIKGtIdX706UXIRd9i+722
 YWAujWCZ3W6jPj59Bt9cUEKWL+6vdZegQbxvyNfiK3UiV7k6PRtJWDxp2Xkj0aHA
 Zal1+mHOKtNdGRbS66QXyeDQ3qovBTvc2P7uinSv8omTGOxxCWfADCy4D7MW65Zl
 cMxXKOX5Mkn/7vb/nwJvWPpSgfmO11mtjq4BjeEs3gYksBVFC2twrzy8l9tz17+4
 r3h/5dv3KvcGBqYB4rGiZh7TXZNbsej4qu1NFfJh8Wl7Ew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nr94b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 18:47:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e1015c48c8so33451261cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759949269; x=1760554069;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X3OK73bHBwsSCsPnoqJcEPf6LmWfF1FEv1wyHSAhwNI=;
 b=rmNIypLQHbv0SUmeLfNyWuIcJk80fohRfafIVnT7fn9GCLlHhwtYDsDyi6xqs/fmK+
 UwRsGgefNqAmCGzSSshiZ2t5PLqgNer06nn7V3mW1Q7LKIVtT546zKucAGSi27zr2fa2
 S3iremYv84L9Awgph+b6e9WdlpfXiuvkCFZPtgM8HgU4KoLkqOIjgBJE4Q8+6njQykTi
 hdoFF92EIemb9Ga0vPmRi4Lvb27+LIqUKTzq+lszjAdjEzNkUNwKbgRiXyoJdMsGBck9
 gKRDsN4Uwg61x/GB3HVmbWb+fEfToR2Y05kIfdvu0DHEaSNhDDhR2tapskuEj6xuLRFm
 6mVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSCI257N7pYWLLQpSLBIjvtX8mi7/7lqFNf9Y01SJQqjVGwCj6yS+AzHRgOFydsmtapZ+pMIsNevQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypUmDnnNg4vh2Z9aCPrO4PWmTAHYr1JBi1hcjmbwRmKIcj/OfJ
 qXtaCCtaEoyLVXv6sOyzXTMQer25XiSCcihLf2JmltVSrAbkc+GBKQfTKTVGL9XgrBnbskbXQkk
 Z54gn1uuwv0mCVQiX+b1p13fkZ+2oEkWuVh1lLZnzUX3A/xLjgANVIiImXJK3uSYbTxolWFY=
X-Gm-Gg: ASbGnctarp3XGSc0vyc3Wb23jjsmROBWfEOOd6B7VdkVodLk0uwzdSDM4fshtPnGF0R
 JcK8ncfwF6YvsctPSGupsu1exOId0Rg3/z/xt+ni+CoIXZu+Z9QELHVkDTZv/u7Nk6IRTdlRmwA
 brhNPVjrVkiumR6PqGuLzPkTDO7dPRN0TifHRKJ3Wg61atnzg1k3ZBPyMzjTOPDYGALZVEspXbe
 62mKXpz/R6+vVw5QkkdZLJpJiSs6gxbdpbJU0On3h/uRlcq60cevfIKl15/nbQaVDIeIvp/wyg9
 UChw3QxAcAEfOhRm0FB52UcUjXPrMr4VkOPa0ow/KC/MRCMLRKfr46a75QkKgeTo2bioeIhrDwh
 U8zE9s2HzJ0MkhfTjdZunSVymx6YTzRdvpXomqNCyWoTgzldZfEbtQeKWVQ==
X-Received: by 2002:ac8:5d4d:0:b0:4d2:ba6f:28fa with SMTP id
 d75a77b69052e-4e6de8b5d39mr136839601cf.34.1759949269004; 
 Wed, 08 Oct 2025 11:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQKQvzko3qbaxFgsjx82A+PL+c822Ka1T/cMhgVoRCIXqgJtpZtPaiuhGC8/IySiPYiH8Eyg==
X-Received: by 2002:ac8:5d4d:0:b0:4d2:ba6f:28fa with SMTP id
 d75a77b69052e-4e6de8b5d39mr136839181cf.34.1759949268518; 
 Wed, 08 Oct 2025 11:47:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907adb26f3sm246089e87.103.2025.10.08.11.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 11:47:47 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:47:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 11/16] drm/msm: dpu1: Switch private_obj initialization
 to reset
Message-ID: <2gpgdmamnljxpmgvrkgmojnrkv63c4tcmo4xglbswtv4yc4h2i@hk7op2aug6mx>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-11-805ab43ae65a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-drm-private-obj-reset-v1-11-805ab43ae65a@kernel.org>
X-Proofpoint-ORIG-GUID: RgtpFWfg2QONwL615daTRW2j7yhk7Gdf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+IwbZqwQUrho
 eyvdXaOIfJEz7b2sMUVGh7yE7UAgChhqLohQ+tPhCYhStoHu+rjodEYa0+LJb5UtB9fZGakkCeb
 uhT1ObMWvOuP59KTP82PK0++/XYftAFQSNI/FFcrLwHH1vtJg5khrfk17nn7OvV6Q1ncFwu4tLB
 10o6AKV2GtaywQYWxaiEQPwvyTresNaCp4mW1W38B0jb8XtkdIgS6GAyPNg7aMwW9h3rIhslCDn
 6uVgFZGrfvXX9SrYnqOp5+di1qvFlTdfvM6iTrQH/ruzuNjBKTZAlKWvWl68hBevuGhwqDEvz9I
 C4VAj/q4AUAzWaVsCGy/1vV6kwuVDqFgepoA1pTPeXA8408XNnavJss0Mz7p2/MX3vznhEMjA5z
 qp1b/vSNJ2P16Tp+bntPgYymre24PQ==
X-Proofpoint-GUID: RgtpFWfg2QONwL615daTRW2j7yhk7Gdf
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e6b1d5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=MY5GpsA41Snrp9pqcaIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
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

On Wed, Oct 08, 2025 at 02:04:09PM +0200, Maxime Ripard wrote:
> The MSM dpu1 driver relies on a drm_private_obj, that is initialized by
> allocating and initializing a state, and then passing it to
> drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a reset implementation, let's migrate this
> instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 
>  static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)

It can become static void now (up to you though).

>  {
> -	struct dpu_global_state *state;
> -
> -	state = kzalloc(sizeof(*state), GFP_KERNEL);
> -	if (!state)
> -		return -ENOMEM;
> -
>  	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
> -				    &state->base,
> +				    NULL,
>  				    &dpu_kms_global_state_funcs);
>  
> -	state->rm = &dpu_kms->rm;
> -
>  	return 0;
>  }
>  
>  static void dpu_kms_global_obj_fini(struct dpu_kms *dpu_kms)

Possibly we should also inline these two functions now.

Anyway:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



>  {
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
