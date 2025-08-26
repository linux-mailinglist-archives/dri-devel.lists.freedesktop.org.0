Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D08B3759F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 01:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7661510E6DD;
	Tue, 26 Aug 2025 23:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZsNZHH2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C8F10E6E1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 23:42:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QHLFer027991
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 23:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zu9C8ffYP2zbDrnUd2W1zM9YKo6YTVhAJreh0ub4tB4=; b=mZsNZHH2vrpoWbMB
 1dNmWkE7asnW6C8+z6PLbatFsJacAMKuO6/mbA6lSVJeDWLqXaI/MvJgRirXSk3X
 tbtKEEbEm3NKx6izBpLfJ00D+IGWGOOS59vVO36vBZd03P50O7SXq0hbb4yG6v37
 Mm+KTpTWDN3CglA3JLoQZqnK6JEui39E7bWxLEGpdGwAV3M7rbATg6w52GAI3bFL
 DAciHcH+izqmlrhP4ccllgnmaUjS4k5kxSik/Zs/3M3IuG4p5V4qTebZg7kOSgTJ
 AKsv9IQvcAuHrPR/CGHwQJCqq3vaMT53VfYVFGZr+k80BFN0NBmFGLyac7zvjE+G
 7XU0Hg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8agx7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 23:42:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b2ecb8e64bso8176801cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 16:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756251757; x=1756856557;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zu9C8ffYP2zbDrnUd2W1zM9YKo6YTVhAJreh0ub4tB4=;
 b=MA1GdP7kIN3fi+nEBxfYRP30uhNNHoogblfuUxKOoANYxYI/74vD1UROBiYr+Nfewk
 glkDHEtD+tRnskAhwNackHNi6Vftki49kTHnW4PbFPCFImUesVNpSJmxp5NztYSnHmSa
 t6bNkzELDqc4A3QHYH7rjGYNJERsao0WWxrEXdVs7r+1Lho2d7Ccb7W7wlRc4JaQXODm
 Iu/Yc2eDU5kTfObNDZFsP0xLMX6cmwLfhgKZS0m47SUDEU/ML0V6nhsFz2UJanr86GrI
 1Wd7k8N1p9FUVgSeF72QPHSCxWTPAOpjb/wp/ua8ygQnxW+sJHkPCFmfeH6S6bY6Sz+A
 +dVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6Y8Hl08EW5IarAJsjcIhaK1HEYsGfGC0v8disKUQnZxF/dn/1m72/4nmI+DBx14ZPQF063VXxJkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNsr6/LQEUakgwfYJu9GTTmJrzUn+euWqqEOajflg4mmttFZ0m
 1I9nODUSHQ7ekS1heRMY6f2bs1AZtb6QJv3Bcask6d+gs0UZm7BFNyyigUdrniGshQErYNqmNNR
 X+Axxfk14YfNr6BukJj1+bNxq3YHEBiNXQHdStqm1wfkLsTMSb1pzOCp4xxYgEp9UxNp+TyE=
X-Gm-Gg: ASbGncs2hZtSGois6G0Yvqa86OyMIMJaOCB9By5Ollzmd901125SrvERe8DpMePf0d+
 RATcOXQHpmZoIl4Sg6SRRPgz9DfolXKkCWccrRMO+3aRROks2/KxQZQIJ2dp5acEUGK5Nu3TW5O
 hPMdTc3iPqiUgSdcJ83ndQSPNA6ifawYiC7LvJhVeA0IK02f2VGYSnZEzXDxvc8mT/yVi7m2o/L
 U/qjXqnxfIkucKN9NIZbU5ZXq1rMQdW2zxQDaYEh4Q1OXVTTH4lutx4PzxJOPIlqe0mTo9loD3g
 21YDM3xdejDLt4ly+IaHSz7YN5v335shw9adFJKQncfpzGxVtmacuWyIEvdcFwC/ABE+JgHhGfI
 lVap0XBIxecLY33RWfcL7rgzmbT6ebOzgrqdxgFZ0OFNqe1Tz8+PE
X-Received: by 2002:a05:622a:1898:b0:4b2:f2b0:32fb with SMTP id
 d75a77b69052e-4b2f2b038cfmr1568051cf.1.1756251757078; 
 Tue, 26 Aug 2025 16:42:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjGIIylAidnuipVcsn/Q+ugXwaDOHP5jB2aqY956weD36FeNFEDeYWh8wFDm8rzuQrzEue6w==
X-Received: by 2002:a05:622a:1898:b0:4b2:f2b0:32fb with SMTP id
 d75a77b69052e-4b2f2b038cfmr1567761cf.1.1756251756549; 
 Tue, 26 Aug 2025 16:42:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3366de0ec70sm18587661fa.66.2025.08.26.16.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 16:42:34 -0700 (PDT)
Date: Wed, 27 Aug 2025 02:42:32 +0300
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
Subject: Re: [PATCH v3 36/38] drm/msm/dpu: use msm_dp_get_mst_intf_id() to
 get the intf id
Message-ID: <exfflgjky4zgqa7tnudfteeosncr6nsuwqadxnfftxtjay6hke@fxru2weupuwt>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-36-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825-msm-dp-mst-v3-36-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68ae466e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FCQRL5G5Yy2VVt0fnmAA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfX5vbMmkVuzSK/
 VOY9PHjE9/qgvtXacgESww+Vx6QB6ovpndNXpELHf7TDGXKZqX7jtdxL2dwvRgAGKf6I89CJ72g
 08f6autJa0rR3zgIJIyTZ3bt9KHrl5rnn0TYBK4RF/ZLCTSZcGhL07OsSOkj4ev4PZHZej92HWv
 JPPJk01AmJ/4NJZURENWrOqQQTnWFYqfVqXCvLaRzj6xNkcbycR18YNAlJF2Dg4glIumIcu++uV
 RwOJmEOIdl9Nk2PM+YIUn6/enpkfQ2TFqSPe9wqeof/Qt5DzdEs1EHSluDTNW/l3UT9JYDt0BnS
 jTS5wX7G7sPalGu77+ASpvj3CY3BH72uRxrsf0JISkmrRpDKTI2bzisZgGOMAhHF+diOL50BN0z
 w3DuehAx
X-Proofpoint-GUID: -rYYY6BYuSPhkr9A7CEIU9E7ZG80C3Az
X-Proofpoint-ORIG-GUID: -rYYY6BYuSPhkr9A7CEIU9E7ZG80C3Az
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153
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

On Mon, Aug 25, 2025 at 10:16:22PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Use msm_dp_get_mst_intf_id() to get the interface ID for the DP MST
> controller as the intf_id is unique for each MST stream of each
> DP controller.

I think we have one sensible exception: SC8180X, where we have several
DP controllers and one shared DP interface, but let's forget about it
for now...

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 51 +++++++++++++++++++++++++----
>  1 file changed, 44 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 05e5f3463e30c9a6bd5b740580720ae2bf6b3246..2eb5397d15732b224372c68d0b2b7167da9f2896 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1429,17 +1429,52 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>  
>  static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
>  		struct dpu_rm *dpu_rm,
> -		enum dpu_intf_type type, u32 controller_id)
> +		enum dpu_intf_type type, int enc_type, u32 id)
>  {
> -	int i = 0;
> +	int i = 0, cnt = 0;
> +	int controller_id = id >> 16;
> +	int stream_id = id & 0x0F;
>  
>  	if (type == INTF_WB)
>  		return NULL;
>  
> -	for (i = 0; i < catalog->intf_count; i++) {
> -		if (catalog->intf[i].type == type
> -		    && catalog->intf[i].controller_id == controller_id) {
> -			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
> +	if (enc_type == DRM_MODE_ENCODER_DPMST) {
> +		/* The intf order in dpu_intf_cfg matches the mapping in the DP HPG.
> +		 * example:
> +		 * DPU_8_4_0 - DP Controller intf to stream Mapping
> +		 *
> +		 * +-------------+----------+----------+----------+----------+
> +		 * | stream_id   |    0     |    1     |    2     |    3     |
> +		 * +-------------+----------+----------+----------+----------+
> +		 * | DP0         | INTF_0   | INTF_3   | INTF_6   | INTF_7   |
> +		 * | DP1         | INTF_4   | INTF_8   |          |          |
> +		 * +-------------+----------+----------+----------+----------+
> +		 *
> +		 * DPU_9_2_0 - DP Controller intf to stream Mapping
> +		 *
> +		 * +-------------+----------+----------+
> +		 * | Controller  |    0     |    1     |
> +		 * +-------------+----------+----------+
> +		 * | DP0         | INTF_0   | INTF_3   |
> +		 * | DP1         | INTF_4   | INTF_8   |
> +		 * | DP2         | INTF_6   | INTF_7   |
> +		 * +-------------+----------+----------+
> +		 */
> +		DPU_DEBUG("controller_id %d for stream_id = %d\n", controller_id, stream_id);
> +		for (i = 0; i < catalog->intf_count; i++) {
> +			if (catalog->intf[i].type == INTF_DP
> +			&& controller_id == catalog->intf[i].controller_id) {

&& should be on the previous line

> +				if (cnt == stream_id)

if (cnt++ == stream_id) return;

> +					return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
> +				cnt++;
> +			}
> +		}

return NULL, drop else{}

> +	} else {
> +		for (i = 0; i < catalog->intf_count; i++) {
> +			if (catalog->intf[i].type == type
> +			&& catalog->intf[i].controller_id == controller_id) {
> +				return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
> +			}
>  		}
>  	}
>  
> @@ -2670,7 +2705,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  
>  		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
>  							   disp_info->intf_type,
> -							   controller_id);
> +							   dpu_enc->base.encoder_type,
> +							   controller_id << 16
> +							   | disp_info->stream_id);

No need to, just pass whole disp_info pointer.

>  
>  		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>  			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
