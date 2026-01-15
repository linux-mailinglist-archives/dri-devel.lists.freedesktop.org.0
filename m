Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887E5D2367E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D605110E710;
	Thu, 15 Jan 2026 09:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MhNRUBH8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TngFWoaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A53710E70D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:19:33 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fkJf606449
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pURHtbp6VGKQeBQ/ldaen2l7gcfocWJuNey1NSuLoXc=; b=MhNRUBH8bvXRD6RZ
 ndIGPioDTeOHk0+CbIlS2sv7nj5KZRutmkVj5eprDgbygh7I1s2chnQW43pSv5Zv
 BjjTDnKRl9Def9ZPsAZfutqQBIcfhKO7enhGCtufkU8+JZwONHdk56CUIyMInfPO
 hHwcfmBfNnS7iBZVYm29ojxzPRW8GhIbxSai4Rx/U+anzDmVNF/UV2HYMpGLaDx1
 mXm79nAF0DazHGE5qLp7VsImtysj3slenQbZ8sNDw8RWoynkgYyus/NJTG09Ec8P
 TetSGZIUfTV+13+3WuO1ZRQpXpPXNELSL2S57lMZA3WckylJEbuqoZR8NWsfmWME
 vjuzyA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna0hpv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:19:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c533f07450so24740785a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768468772; x=1769073572;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pURHtbp6VGKQeBQ/ldaen2l7gcfocWJuNey1NSuLoXc=;
 b=TngFWoaAcX85Bcq07jH0796lLTP0H1HtAE4O4kFXUyIYgSyTmJKJjezXXZ01OD7nz0
 +IWDN3dPXqaWPnD038r1AvX6C7rS+Jq87NPn/Y2XBLRwLHW1gPMjRzQ0ATr/hAJoCGR5
 6elcZTN3dBb8oM8LIZ2m3itJFzmkaINr2gz/pzCCsz18psv18pwDTZ5tTKnN++RuQC/7
 CXXWOgfhSVTPkfYJWunqURQzBETDBhNXj9pcpDVvH7KrEAHIRVJgiG3wfl8hDBh7uZ2H
 F3aNdepA+aeYEeZ3745sREazqj0W8u6mfXdH28qoUOdn7R2m5ZklPhbeKAYIPn3P6EG7
 kgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768468772; x=1769073572;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pURHtbp6VGKQeBQ/ldaen2l7gcfocWJuNey1NSuLoXc=;
 b=i7e0bdbqechqRqX2Of2IPZFVm5U5SbaxR2nLWEdJ2/fadTsa6tDBv5PREs3iA0MQQ6
 ZQHYnaYflLqFbDU3WZvf8jpXx9TG8N6UdYhPEJKCoUSN+4+4cTpXINkmll8e7pKc19Kr
 YudgcCtVOy+FlKScFIoJeKw/bankwksH/rgWIO3JyZ/nuWIpHS09Ms2aKUiPA/9KsmqB
 tSMW9ARaJdfvaP/p3ZJ4eWKxGvCiQjhw88g/L1GuYPQvrdGVY5coBomhASXOHDR8t0Ep
 yDo2dC0IRTm9DIk+KKrTFKWLT6dNMgxwNZVXLnwEIBNpC9I+Y6arsGp69ygjW+TD8ZRX
 icSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+fYzzmniHEyRPD1sCwzn9tvoMZYS0G20nw+Jc26tzI0OIRvpIVsADJ62+Or7i62QGO5YB/OzNudk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYdL/YTU8nOzPX+ZlfwU8tysWlO+dyqppve1W1jSXm9KdYSbKo
 tmyfNXswRsjW5+v+U2qPJsbrbLhxXDARsefwEjxu6iUefckOivcoj5IjWC0RfVaR3hQh+wbURIa
 pt33IFEpywXx2ZTNPia2VELqh/ThIKNRKhgxc/I/8bSYya0fG7Ip0/DnT0PGe6r3cmfLTxjM=
X-Gm-Gg: AY/fxX6g6mbwYGfpb8F3whIr+MusZJ8ngFWpL48FZnC8WD9AypXO/7uVlg7m6ITkcVH
 Qa7fIWzbUzyXbpEFIVbwZ6MWJv7EXDr4A6RjZ4b/CRvw5hT0DoF1o8LOFmzh/RVvmYKVlTVeCp3
 OmaTQ1PuJlQwr56vRFX9mq763LEJj15tPIXvMUpB+LYamV/hXptiaeCXtVzrxTVX3ib4il7Xs4H
 CDi6n3Py3yTMDqeb5TSk0BnbedOQgwqP9M88gy+V9enSfW7ISH9KjXezLAsUcZlypjj5wYpdD7F
 g8JdAz4WIo56UtmLsQz+SwtanXp4NZ4LY4wJVRrdCycFkKwyI8+2uSL4ieB1gq9DECsTV+0J3Ox
 I4yVzrRB+VVFf1RZSZyh4zlo4EoTn94TpxMb4TMvR6ujhd9CL1vXNcEfLX/K0n+ILsCo=
X-Received: by 2002:a05:620a:4154:b0:8c6:a22b:e11c with SMTP id
 af79cd13be357-8c6a22be2c5mr48271885a.1.1768468772067; 
 Thu, 15 Jan 2026 01:19:32 -0800 (PST)
X-Received: by 2002:a05:620a:4154:b0:8c6:a22b:e11c with SMTP id
 af79cd13be357-8c6a22be2c5mr48271185a.1.1768468771575; 
 Thu, 15 Jan 2026 01:19:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6541197fb4asm1869724a12.15.2026.01.15.01.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:19:30 -0800 (PST)
Message-ID: <d826de45-f00c-4af8-947b-246362c2be23@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:19:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
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
 <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e0WYz1olkCuNLSkr_i3sdUzAZuXF2ifm
X-Proofpoint-ORIG-GUID: e0WYz1olkCuNLSkr_i3sdUzAZuXF2ifm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NCBTYWx0ZWRfX2J2kbMdb1W+B
 rQwGP+OBho/72WeVfXKNLLB0BtsnY1Licz2Lv45Ss6k+pftQtK43TF4O2+UnKFk81m5d0ihu2Wd
 riGfdrHk9C7oVYe+6kSIOXSJ8/hrG6ZuB11aTzIWZ0j8/JdrAO0V0lnyJXoJMAIYkgEs1XMYZED
 s7StgRbTqxHHi1woYjzan/UMutiuQpbpUabXOtFruHic5yW7XNbWiYp4QHvO4uzMIlEaWzj3qq2
 U2Lot6wY2rJun8cIt4U3+vAggcVAn47l3xt7oYijUyDtGjLKsackLvbMxkYbsuRUELzurUQ6U1H
 FXcamOKtVC1Ba0SsLXS1vU9o/Htyl0yIzJ0NPR7XnYZE5j4BNELFl18iC9SR8ThlcwAuD3tzxMJ
 G8q0iEWxQJ3Q4PfWyUMcSwq880ZnX//CZMUbAwLVuFwTDElI8FnnLSHX3acon+1OkmSS3UScG3C
 jPEqZHSCEMsJMNSBADg==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=6968b124 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iwLwdXV_GrZBMsYiV9oA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150064
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
> Instead of relying on the link_ready flag to specify if DP is connected,
> read the DPCD bits and get the sink count to accurately detect if DP is
> connected.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>  3 files changed, 62 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5997cd28ba11..a05144de3b93 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
>  	return 0;
>  }
>  
> +/**
> + * msm_dp_bridge_detect - callback to determine if connector is connected
> + * @bridge: Pointer to drm bridge structure
> + * @connector: Pointer to drm connector structure
> + * Returns: Bridge's 'is connected' status
> + */
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> +					       struct drm_connector *connector)
> +{
> +	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
> +	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> +	struct msm_dp_display_private *priv;
> +	int ret = 0;
> +	int status = connector_status_disconnected;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +	struct drm_dp_desc desc;

Reverse-Christmas-tree would be nice 

> +
> +	dp = to_dp_bridge(bridge)->msm_dp_display;
> +
> +	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	if (!dp->link_ready)
> +		return status;
> +
> +	msm_dp_aux_enable_xfers(priv->aux, true);
> +
> +	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
> +	if (ret) {

See ef8057b07c72 ("PM: runtime: Wrapper macros for ACQUIRE()/ACQUIRE_ERR()")


> +		DRM_ERROR("failed to pm_runtime_resume\n");
> +		msm_dp_aux_enable_xfers(priv->aux, false);
> +		return status;
> +	}
> +
> +	ret = msm_dp_aux_is_link_connected(priv->aux);
> +	if (dp->internal_hpd && !ret)
> +		goto end;
> +
> +	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);


> +	if (ret)
> +		goto end;
> +
> +	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
> +	if (ret)
> +		goto end;
> +
> +	status = connector_status_connected;
> +	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
> +		int sink_count = drm_dp_read_sink_count(priv->aux);
> +
> +		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
> +
> +		if (sink_count <= 0)
> +			status = connector_status_disconnected;

< 0 would be an error coming from drm_dp_dpcd_read_byte, should we log
it?

Konrad
