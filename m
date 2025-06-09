Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56C6AD22F5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 17:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2101810E3B5;
	Mon,  9 Jun 2025 15:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a8DfLomd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BE910E3B5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 15:51:13 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559A3C7a004538
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 15:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=K+GJtEmFeWWV7acoRA4FQCe7
 suMJMwpWj1BE28bV0Ww=; b=a8DfLomddNxsdSt1oNauMa1WiRDQR41rKMnCrldL
 mMbZS+/IXuFye+VD9bJ5A3IPH0PIk9ZQHS2pl/42durVPDVZ/+Slzt0/1CgxMQNz
 ZE56kus+FBFoFT0dtvQfc1fqdoKOohjkHS0Dp/N3XVkir9lTVPCCIQBN1XhG6Qi7
 0ZRCMWQuFPXeLhfBn3/5iu3r9ybN6c7566IQQH+4FMAIXLBzwDiZOMSfFbuXgvev
 HxJKMfB5c/08YpfcvkEbyOGViDnCJtNHpikWGLb0dVihNutLnZmd8YBDa/pVPQcG
 n0XufbzxXfYwKdep1aENBv997oPpLuuIi/vcS3U89Q0Xcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jeasu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:51:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so693664585a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 08:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749484271; x=1750089071;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+GJtEmFeWWV7acoRA4FQCe7suMJMwpWj1BE28bV0Ww=;
 b=FnPvsKuKdIZ06tJ87D7tt0zsxYlZg45PfKsTJ+N1DmH44+TX/6DOUhq9HRZC7CUfpY
 EGwl7yXmRjoHa2VT1GSnsY4ZyCY2Xe6TFFd7BenF8FzeYZhkGfHSnFV17qTshl03QnJ3
 LYEuDQyQ7t1WKmXDnbM0hyKcr2lp2F0qFzWDj+60+OXc8JJDHuUkh2AmRBcsrv1KEeOH
 L7axiagOdtohummWcPb5dCoq5KJ6VqPmTRW3Ar2hwwu3L8627RM23oFCrLsQzzi1IpZP
 AsWwWr2r3pGv0QURLfCT4TpS2U+l8acrlOq4Q8RD4olotLVPHXL6hiPmoZ9g3JJbUx+f
 NGZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGaFpwaf5eg5Bqw9xJ97T44ugbjteiCsUo5kSDs+rwQSREHzH+2PCgg5SB0MaADClunkPoWrEh2ts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp4pYtd1VtI2jPdAHKJtrgFSoNnUnEA7IERoxPl2u6oVwSXojO
 4Z0/Ch0ss17EFtUxlsaH2aE2x6d0huasOQf3Qg51hxDEKMCq8RvqfILT20WKGYyvrgzOUueUI9/
 T/ccHOsn/kstJKf/ZYtwveVRBBC6U+07RwiQjOSTondkr+rSTCaL43O555j7K07ac4qwO9g0=
X-Gm-Gg: ASbGncufhVKTnr5p06EOv6n4qoyM6N1dwDX1MDDRFJzAmEnFwlSZwR3VZp3WK8mAxNO
 ZdGenjeWueAaGKpR/C1FhpTFJS7tJW0sNqF/pOa+AI6gZWRhUcBlYcS/3HMfWZ02vQNbrhbzvyH
 fuBFpm1PbzI8sCjFWAt2mwg369REUIgxEIH4ps2+RJ+k8bWIqSU5t5NvFB06h5u1UJBM22pTmcy
 kulVbFhq8CW7yMNXznE3JlVAdelM26VJL4gllAfDJllQ9n0mhBEEUXqFfXS0FJ/+UuNrZNbyGej
 UTxvwRg2/xCsntHp5G+ysi8l453XKe+T5g06t1uJdcCZHNPPNj1S+w8RXUEoXYrhXh40GkfGtTE
 =
X-Received: by 2002:a05:620a:2694:b0:7c5:a41a:b1a with SMTP id
 af79cd13be357-7d22985b912mr1886686285a.10.1749484271320; 
 Mon, 09 Jun 2025 08:51:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkgTWv8MC/AitIaS/DA4ob4l3D99JLGsatSu5WEducw95bQhwsH7AW9Oj21iwH8CSCiLhHEg==
X-Received: by 2002:a05:620a:2694:b0:7c5:a41a:b1a with SMTP id
 af79cd13be357-7d22985b912mr1886681885a.10.1749484270922; 
 Mon, 09 Jun 2025 08:51:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a817sm1205198e87.171.2025.06.09.08.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:51:10 -0700 (PDT)
Date: Mon, 9 Jun 2025 18:51:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
Message-ID: <fcmbo5qhiifo3erfnejgtu6es2nmeo3c5r4plbutj23gdtydng@xy3mqkhbsjia>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=684702f0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=BF5CnLKeIFxmMbDrz1YA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Y_Gm5Bw1gD9KBaHF5vfZWgy4NbwZ6YMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExNyBTYWx0ZWRfX/gERMs/CcifS
 HTVClWu54OS/0Rz1Fayzj+zJiuV7P/QxR8N/tmUcj88mwsl03jFPCGTQM+w8xaaneva8W9XIit8
 d/Crs1/S7z4F8NsKfIALnzJ/zT3m8Nvw2v6GsgW+SJih6KLONuEyFIvj9NzD14GySVTge7J03ku
 XwT4cMeSAiTGhmu3oSIQE2LBiD3qkjbfy7yv8ycf5/PmwL2dVb79phWXZ5GFgxg4zx66MQYtTyY
 A/elmoqdgqD3MLWT598f+UuxLSBJMjNTfAYjjNTUX6mMXEOj/e643CoT6bMsA/6r/NH+k5BNjYA
 PLmwI49wlAYvipZjuNkiAr2htUnbil/osHGBdmIMZz+ieNhTSiZmJAZi7vqO9NeYlk1GRYgWaAp
 WOnqh81mxNM75D0OM/Hk58CvqqPcJaotM/Bm0lZoPHWJDe1MJGK1dRzlwISzwc54SqJXKX7O
X-Proofpoint-GUID: Y_Gm5Bw1gD9KBaHF5vfZWgy4NbwZ6YMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090117
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

On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add connector abstraction for the DP MST. Each MST encoder
> is connected through a DRM bridge to a MST connector and each
> MST connector has a DP panel abstraction attached to it.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
>  2 files changed, 518 insertions(+)

> +
> +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
> +							    const struct drm_display_mode *mode)
> +{
> +	struct msm_dp_mst_connector *mst_conn;
> +	struct msm_dp *dp_display;
> +	struct drm_dp_mst_port *mst_port;
> +	struct msm_dp_panel *dp_panel;
> +	struct msm_dp_mst *mst;
> +	u16 full_pbn, required_pbn;
> +	int available_slots, required_slots;
> +	struct msm_dp_mst_bridge_state *dp_bridge_state;
> +	int i, slots_in_use = 0, active_enc_cnt = 0;
> +	const u32 tot_slots = 63;
> +
> +	if (drm_connector_is_unregistered(connector))
> +		return 0;
> +
> +	mst_conn = to_msm_dp_mst_connector(connector);
> +	dp_display = mst_conn->msm_dp;
> +	mst = dp_display->msm_dp_mst;
> +	mst_port = mst_conn->mst_port;
> +	dp_panel = mst_conn->dp_panel;
> +
> +	if (!dp_panel || !mst_port)
> +		return MODE_ERROR;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		dp_bridge_state = to_msm_dp_mst_bridge_state(&mst->mst_bridge[i]);
> +		if (dp_bridge_state->connector &&
> +		    dp_bridge_state->connector != connector) {
> +			active_enc_cnt++;
> +			slots_in_use += dp_bridge_state->num_slots;
> +		}
> +	}
> +
> +	if (active_enc_cnt < DP_STREAM_MAX) {
> +		full_pbn = mst_port->full_pbn;
> +		available_slots = tot_slots - slots_in_use;
> +	} else {
> +		DRM_ERROR("all mst streams are active\n");
> +		return MODE_BAD;
> +	}
> +
> +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);
> +
> +	required_slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, required_pbn);
> +
> +	if (required_pbn > full_pbn || required_slots > available_slots) {
> +		drm_dbg_dp(dp_display->drm_dev,
> +			   "mode:%s not supported. pbn %d vs %d slots %d vs %d\n",
> +			   mode->name, required_pbn, full_pbn,
> +			   required_slots, available_slots);
> +		return MODE_BAD;
> +	}

I almost missed this. Could you please point me, do other drivers
perform mode_valid() check based on the current slots available or not?
Could you please point me to the relevant code in other drivers? Because
it doesn't look correct to me. The mode on the screen remains valid no
matter if I plug or unplug other devices. The atomic_check() should fail
if we don't have enough resources (which includes slots).

> +
> +	return msm_dp_display_mode_valid(dp_display, &dp_display->connector->display_info, mode);
> +}
> +

-- 
With best wishes
Dmitry
