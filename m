Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C7B3496E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 19:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD5510E277;
	Mon, 25 Aug 2025 17:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmFEeEtE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0164310E277
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:56:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PG98rw007747
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qZbc+LiP+W9ZiZBK8FOlQwQv
 CJhWGeKmTwDpg9afkms=; b=ZmFEeEtEHL9QS8O5lYBbwW//3Z5kDSkVvUidjwnA
 HwAmWqM8lPuO7Ay82PqQAFq15BFH8p/Pe8T14QetYMWeaLbe8DuuVGmXRajltWsL
 JU917ZPjSDacM02Xkn3wDusb3Xfvj+RC+BvbsX7IKID0RW6TximIPBRm8zNamL1L
 aagz01YHUsC19EXqbfSOK0dbiq4QUQEGM3lImG76Igt79hfAhve8NKtWih8Wch8d
 fNFh1JTJVIlcbC/tLRg62UDkBLtATeuikNmAp2aHyLdqNKqxbYGt6SxsNBFjzcWJ
 Hua46ytpuNScg/PpNmFK/Laj4jnB0w6UZqO5x0meY/xX8A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfe0t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:56:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b0faa8d615so148364131cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756144577; x=1756749377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qZbc+LiP+W9ZiZBK8FOlQwQvCJhWGeKmTwDpg9afkms=;
 b=fDJEP7NQtAUcjgq+xzwiTUTHbWPhb+d8+6z+iLTlEhTWW7JUM+CfwsJfrsAUbuQCbw
 j5J/JYkq/33cyoNQX3SFUkvcLcsRqeSjw5DOVkDEzzHrlc9tKeijT6HS3h9IGoUCZwXf
 6uOi2oXkYFoBzvMGqMneZeeUUh+izJNoRWpI6kRlo4WO8C4iC6Q64EK3IuUNbB//t2WP
 iDXGtpneeyUHmLEoLa8SN77gQEKzNr4osjryinvcokMoCLjunZSwqjA9GNh3s05SUclD
 b8KNKhbtYI3zlIgb/5rcJzeoFxM2omHufoq1OiUDgl5eXL9umsY60Fkh577+PMEaF8P+
 pjhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULnMzsxrzvQgNlcIXoyc8yDg6gpMJskPGAi1FePtLp6+5zwLAx43Z0sfjBUXQBdYJEyqZrIxeyu/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfK6CA9VVB1xwZEuKzigXp7M9BgdEfySaPMRKDgIiP4htNM0fj
 EOIoecsgGSZkArEjh1WWdolMMbogSfDSvc+w3nfrYid0tt/ka5HLIUoloISMHvqnHG3wpZ8pnS7
 aZVDktmuvhxmJItTiyfZSWjvyDVhMBrb7uwgfjOKGRu1qFuatPDOT3IjX/NmjzuCRgHThlrQ=
X-Gm-Gg: ASbGnct3XahBPCeKxXyb4XoPp7443fzm3cy7VUM8tRUA1jSDs3pyzBdH69Zi5RV02LN
 om9eSCnM1LlSZUuWsC6M+2Vcv/O957uk3cebyqnHbGLSc35Nu9OCWWy1vtiaNymEXQyAa1b/nOC
 G4Jpi8mOztb3KEFTNpBrm4e0Wf35UbZGsnUtAFhT1dKrtgy1s/ZT04mT9Y766yvaZAjwCQ/VAHG
 SBWKUzQflAMSXd07iEym5MXKsza1R3TJP+JOYhlnO8gfshDGOJTKSF2ogU6lX//oiq5ZzaXim6p
 cdIh5D8oQ6dpt1wQhEQpuQvLZ0hUQ9eu+hbT0l5cxDaLpZGWzM28TWXfK4xQUA5/trTrdT5J7sE
 2JgxCK4LD0wyQ8Mgcj+Qtb2GIyQ7lFKwIQQC8ITxUmjsEsAVWbIA1
X-Received: by 2002:ac8:7c48:0:b0:4b2:9883:830d with SMTP id
 d75a77b69052e-4b2e0845a60mr7129871cf.0.1756144576987; 
 Mon, 25 Aug 2025 10:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe/SOgbCIAs7eJLZOpHwdby9mGDyCQ7MxuYmguN5qUnjk/bn2DIS68PMx9r4sIAT4GiA9z/w==
X-Received: by 2002:ac8:7c48:0:b0:4b2:9883:830d with SMTP id
 d75a77b69052e-4b2e0845a60mr7129441cf.0.1756144576374; 
 Mon, 25 Aug 2025 10:56:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f43351382sm971641e87.124.2025.08.25.10.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:56:15 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:56:14 +0300
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
Subject: Re: [PATCH v3 13/38] drm/msm/dp: introduce stream_id for each DP panel
Message-ID: <wvctskhoyphicaymbm5b6kermvubhrn5u6uzui3pqf7p3a7ia2@zirqohupflvp>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-13-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-13-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXzAkOG5mFBoQu
 edTauzaJo4WUdujGjwyFZK3EWQFgIWIIaW+Jez9B0fULZ8stuyeClMbWbDdK775Wft3uquX4vUa
 bM72XlwueZE8BxWDwZ+m2mVayI4Or7nEOQJHSfwNUWKsVtdNZaE97/SdZgGgRvQ6XpVhMBeDz0z
 BAboUWSa2iGDspJ9EPVN0XvGMipVOBr3wcuPuf0vQRO1+4xQ5H5TPVQ4U2875lim5yfvO8ADpmm
 KXt/mDx+hzpVrwxujzHrytWK+Dz8UZE4S4PUsK64DochoURXeaZMB+mETwLHDJs8Ma979Iw75kf
 pnH3pDbjquiNb2k12Q0VlhvX6/ViIQRgEGsusoi1KCxXnZWIP+UdQ1L19ABEDQFcKd0txu+FK5P
 xnqnOSgu
X-Proofpoint-GUID: LD6U3ozjMW15YPnG_T-k86UZwAAoPO1V
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68aca3c2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=esdiVXI3waKZDF_2LzQA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LD6U3ozjMW15YPnG_T-k86UZwAAoPO1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
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

On Mon, Aug 25, 2025 at 10:15:59PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> With MST, each DP controller can handle multiple streams.
> There shall be one dp_panel for each stream but the dp_display
> object shall be shared among them. To represent this abstraction,
> create a stream_id for each DP panel which shall be set by the
> MST stream. For SST, default this to stream 0.
> 
> Use the stream ID to control the pixel clock of that respective
> stream by extending the clock handles and state tracking of the
> DP pixel clock to an array of max supported streams. The maximum
> streams currently is 4.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 58 ++++++++++++++++++++++---------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 11 +++++++
>  5 files changed, 73 insertions(+), 28 deletions(-)

> @@ -2677,10 +2675,11 @@ static const char *ctrl_clks[] = {
>  	"ctrl_link_iface",
>  };
>  
> -static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
> +static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl, int max_stream)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
>  	struct device *dev;
> +	char stream_id_str[15];

A comment would be nice. Or better replace this with the array lookup,
it's much easier than snprintf.

>  	int i, rc;
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> @@ -2710,9 +2709,19 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>  	if (rc)
>  		return rc;
>  
> -	ctrl->pixel_clk = devm_clk_get(dev, "stream_pixel");
> -	if (IS_ERR(ctrl->pixel_clk))
> -		return PTR_ERR(ctrl->pixel_clk);
> +	ctrl->pixel_clk[DP_STREAM_0] = devm_clk_get(dev, "stream_pixel");
> +	if (IS_ERR(ctrl->pixel_clk[DP_STREAM_0]))
> +		return PTR_ERR(ctrl->pixel_clk[DP_STREAM_0]);
> +
> +	for (i = DP_STREAM_1; i < max_stream; i++) {
> +		sprintf(stream_id_str, "stream_%d_pixel", i);
> +		ctrl->pixel_clk[i] = devm_clk_get(dev, stream_id_str);
> +
> +		if (IS_ERR(ctrl->pixel_clk[i])) {
> +			DRM_DEBUG_DP("failed to get stream %d pixel clock", i);
> +			break;
> +		}
> +	}
>  
>  	return 0;
>  }

-- 
With best wishes
Dmitry
