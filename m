Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP64CqtMgGlQ6AIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:05:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768E2C9090
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105CD10E216;
	Mon,  2 Feb 2026 07:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMmRXDw2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fg0FfPth";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8750910E216
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 07:05:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6120KOQa769243
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Feb 2026 07:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YhcjZlCEdnhukA6M7eYg9sdCZm9yQULKNjnZ4xyk89Y=; b=pMmRXDw2gXuuF2EZ
 QV+vjfNBpCK772+V5cH4ugHjTlDyP8g9bJ7KlA3wSTmxC5uV2Rc8Fvb/ZqoA4LL6
 PXszstMnyBu/tca7M5P+kAFWZWp5AYe6+0RJdjZK7DOcmkvbXISRhureBzeAfXyO
 0xJDgX3AuJPrZVK5gO9wtmgzu1fFDfySmm4DblS20HDHlEyW+XcRJ0nv1DWsNk0/
 +pZgC1qTFE5pFOTb68SDj6jxex8XuP6mvVes3TDHGqepSRuMK/UFOt3T7355OY3f
 MiFsOKS9+526Sn+7aSgBg74U2S1UE7TmUCp+MeZINnYyVI8fZto+mxiXGwaLgT7i
 gVZWFg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arec9r3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 07:05:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-352c79abf36so3646729a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 23:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770015907; x=1770620707;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YhcjZlCEdnhukA6M7eYg9sdCZm9yQULKNjnZ4xyk89Y=;
 b=fg0FfPth/S4Zw+UCr31I04me/LcNwqdWi68VgUfjNSBlUtv8es72yjnmSfwn7srcLL
 aknfTKxyfhlMT4gXwf1KWgsfrKG9OcI0kPbjKIquHLrxVkKmgnL0xPLN81sonOKP6MWZ
 ayq2meIe3BWR7Hf1DEC/Ap9VFJRq7TDfXxlncxRWnbd6nXpLMXHdF9tuVLrA0ICHdR1g
 EFwSa5zkdDOgykDvMlX9N1NwrSd7BcZbBVWnr94bPq4AKe0uJKbRNxoysl2d5ArLmCbt
 JxIObL2hIO0bD47h9Ut9zQX+r4R6E3fb3/drdqFqIgbYV5andpvDwphmLzTH+tG9LwX8
 NzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770015907; x=1770620707;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YhcjZlCEdnhukA6M7eYg9sdCZm9yQULKNjnZ4xyk89Y=;
 b=OSudJQiNRaLIoDnNL3o6/CkL5LANTWP1h4idbZmHBC8YWf7bE413IOAq96CAIqDW6t
 uNXX9Zb7FoJ7eSZDmkskIcRf/4r2BlxiIeERc83E6DdW7jfzgd0/1LFN7TNORc/SnZGi
 kSwK/qoPzPeQET+vp6a5d8FcvV3amcGGbdL9m9CGPQFn1Loc4OqiOeQIokIez5aSuQyr
 MJlq3BfQPkfuUiwPAY8QMcb4amx3OOAGajkW1bNLf/BwkAjmEVOx0T7r7xmmDrqpAvpS
 VzlkUEa4Pu6Be7e7FMF9P0tyaorpbD2wt/1bhJknioHPnNrX7ajlu9EVE94FWZEsjXNx
 2IVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcUkhpnEebmcgR962L0rfNlPigbhATPhlOZngWG+qh3jsoJmIbVpvvYunLxMBIPkynma+2NuTGG4E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC7MJfBJrQLn0dVW7zY26sEYnsdQasYIcbAoo75VWsjVclcV26
 cVStK8vGKS0SqK/+Fdpy4y4qheplSvHi76dDJvQCCpkJz4oMHQBjtz4YYnLztsDiwJnnqb1ojMk
 lqb11BBaHgUkWV6kf9p3X7ZCaNL4xNVXBYtmAwj9dZk63I3Tf6CSXT0Mzy4ob1TuIl//h3X4=
X-Gm-Gg: AZuq6aLaAC4U+nyq6fMA+n4mRJU10gCfksaY1ai3/tSelN+HgEpw8gIEqUjSAhkLIUt
 g4ffgzQ9YtcnJsFjpS4GoP57jNvkPyw8j6Jw1KFLHvwN+YE+2N4kpUHMXoqGK7s+5VJwwK9z9Mo
 L1mHW7HEocy7MolTIcnCLycXxFzH144NQf7UoqHcbYOEvatEvXfaITuRbFJFHVfbZ7TI8C65MR3
 QselLNNISaKinaV80/FrsmdPvelJEdkcolJ5/g938u0Szo8o+v/rugBmi/ISJ0vOn+s6uQr/eB/
 jjCBuexfzUORzOYVlue4T4CHpseAPfzihflogbtD51fwzl81oOQ+OujG+HEjS3HvS23UkZEjnBR
 5zQaFfpPmtA6sUoFfNWz1FzAqQVQHZSzL2wfzvNLDtzKl0w2BuywHvIku5fhWhONCxH7daI3iVO
 XaliR35w==
X-Received: by 2002:a17:90b:2883:b0:32e:64ca:e84e with SMTP id
 98e67ed59e1d1-3543b3253d9mr11688134a91.15.1770015907323; 
 Sun, 01 Feb 2026 23:05:07 -0800 (PST)
X-Received: by 2002:a17:90b:2883:b0:32e:64ca:e84e with SMTP id
 98e67ed59e1d1-3543b3253d9mr11688082a91.15.1770015906802; 
 Sun, 01 Feb 2026 23:05:06 -0800 (PST)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c4665sm136327385ad.64.2026.02.01.23.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Feb 2026 23:05:06 -0800 (PST)
Message-ID: <0fed5dd8-daa8-4956-9170-d824aaf416d6@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 15:04:59 +0800
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
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=69804ca4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=TJdMcaj38x47FP8pHAkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: j2gx2J4MJI9m8ZHlSAyh4n5cSSccF7hg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1OSBTYWx0ZWRfXw0gUVPIXMgtj
 K91Y8XUlRa8r1CuNOrZXJZg2Pla8Nvo5f2w98dRF9AC6AsBH1Odb/F9uGgnxYT+zMdU4GztL5Il
 H22KoTO9ID1EXGrj8FqMk6k+kjpC04B9KtikPrHlb7a9QwvANyhlFPemxbPvRJSVRsLCpO6NspJ
 XyugdztCjcbJWJ6YRORcCAZZpSJR1B3qc3OkDMUpCMhSyoxmTy23hQt18apmlOM5GjxlaPWr9LT
 Ebx4cRZ5rz7y98TaTCbnvRHXJENs2hGAyk7pZJZO1M0waFMzrT08i50lISmlPNndgPTvtxzvtCW
 rGpunmJbKqhYgIE/fnrwjXgaoF0CvsqMgccOGPXoIJ5FYDi0vkJNpJmvdGDwlbh0TiDOmNerRbM
 J6/K0sb9JJvkaLekTZWQTwNLEKA0yXg+S7/9jKa7Tpm7gJghVv2LjL7JcgQ1pj65p63hxdpD7NH
 I3XAZxKG6OEm+oPwuUQ==
X-Proofpoint-ORIG-GUID: j2gx2J4MJI9m8ZHlSAyh4n5cSSccF7hg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020059
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jessica.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 768E2C9090
X-Rspamd-Action: no action



On 1/15/2026 3:29 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Instead of relying on the link_ready flag to specify if DP is connected,
> read the DPCD bits and get the sink count to accurately detect if DP is
> connected.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
>   drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>   3 files changed, 62 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5997cd28ba11..a05144de3b93 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
>   	return 0;
>   }
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
> +	}
> +
> +end:
> +	pm_runtime_put_sync(&dp->pdev->dev);
> +	return status;
> +}
> +
>   static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
>   {
>   	struct msm_dp_display_private *dp = dev_id;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index fd6443d2b6ce..e4622c85fb66 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -15,26 +15,6 @@
>   #include "dp_audio.h"
>   #include "dp_drm.h"
>   
> -/**
> - * msm_dp_bridge_detect - callback to determine if connector is connected
> - * @bridge: Pointer to drm bridge structure
> - * @connector: Pointer to drm connector structure
> - * Returns: Bridge's 'is connected' status
> - */
> -static enum drm_connector_status
> -msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
> -{
> -	struct msm_dp *dp;
> -
> -	dp = to_dp_bridge(bridge)->msm_dp_display;
> -
> -	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
> -		str_true_false(dp->link_ready));
> -
> -	return (dp->link_ready) ? connector_status_connected :
> -					connector_status_disconnected;
> -}
> -
>   static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
>   			    struct drm_bridge_state *bridge_state,
>   			    struct drm_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index 9eb3431dd93a..6c0426803d78 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -25,6 +25,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>   		   struct drm_encoder *encoder,
>   		   bool yuv_supported);
>   
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> +					       struct drm_connector *connector);
>   void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>   				 struct drm_atomic_state *state);
>   void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> 
Hi, Dmitry, i want to ask a question about the .detect() here.

https://lore.kernel.org/all/20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com/ 

In this change, we moved the hpd-gpios detect logic into the MSM DP 
driver, but it seems like the current detect flow doesn’t really handle 
this setup. what i'm seeing is:

1.On platforms using hpd-gpios, booting the system with the DP cable 
already plugged in doesn’t work. The msm DP driver can’t detect when 
link_ready = false.

2.For hot‑plug cases, it looks like detection is still handled by 
display_connector_detect() instead of the MSM DP driver.

Could you please comment about this? thanks..
