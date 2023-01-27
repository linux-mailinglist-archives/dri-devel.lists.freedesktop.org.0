Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2469467EDDF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 19:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE6410E19D;
	Fri, 27 Jan 2023 18:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D2810E19B;
 Fri, 27 Jan 2023 18:54:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30RFaRsk015566; Fri, 27 Jan 2023 18:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PxzRcMqaKUQJ+tSDCXJvGahYyjOj7aHE9kxVr2T+obg=;
 b=WMFPzX5RGQd88165vGZsqdBIgdcvcTCAoEINSJtrybCv433F9UNwC3AhAQlDGIk+WnFM
 DggyO5LebYPIRiEOpclfQ4TmIX0rNEhkL5qG3P6fKwuUTWNCzh3EImmxBoGv6jlG9Srq
 Dblvt5Vs016MIloFUZGodNaTTYbyq83Ah7fFDhecPpfAmyLOkgSufZVQsRIWuXixnvBB
 LmGHmf+du0xRwUpmm8gTpu1tOLERvmzI0eOeQ7ICpRHOBTUejSW4bCSUC8mX9/qlQ/ce
 Vxv71/j4UpkHNS4V99UuL8vt54lHHY+OolEJ7+RrqCQ2/2D0LkkO+watpBnnNYGmZ6DA yA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nbdnybvhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 18:54:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30RIs1B6014691
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 18:54:01 GMT
Received: from [10.110.33.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 10:54:00 -0800
Message-ID: <31a0b303-64a4-8ac4-383d-6656f05a541b@quicinc.com>
Date: Fri, 27 Jan 2023 10:53:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [RFT PATCH 2/2] drm/msm/dsi: Stop unconditionally
 powering up DSI hosts at modeset
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230113155547.RFT.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230113155547.RFT.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230113155547.RFT.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4w95YAKvg5247805K6_ZEYg_KUua5_Yn
X-Proofpoint-GUID: 4w95YAKvg5247805K6_ZEYg_KUua5_Yn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_12,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 mlxlogscore=945 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270174
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
Cc: Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/13/2023 3:56 PM, Douglas Anderson wrote:
> In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time"), we moved powering up DSI hosts to modeset time. This wasn't
> because it was an elegant design, but there were no better options.
> 
> That commit actually ended up breaking ps8640, and thus was born
> commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time for
> parade-ps8640") as a temporary hack to un-break ps8640 by moving it to
> the old way of doing things. It turns out that ps8640 _really_ doesn't
> like its pre_enable() function to be called after
> dsi_mgr_bridge_power_on(). Specifically (from experimentation, not
> because I have any inside knowledge), it looks like the assertion of
> "RST#" in the ps8640 runtime resume handler seems like it's not
> allowed to happen after dsi_mgr_bridge_power_on()
> 
> Recently, Dave Stevenson's series landed allowing bridges some control
> over pre_enable ordering. The meaty commit for our purposes is commit
> 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter
> bridge init order"). As documented by that series, if a bridge doesn't
> set "pre_enable_prev_first" then we should use the old ordering.
> 
> Now that we have the commit ("drm/bridge: tc358762: Set
> pre_enable_prev_first") we can go back to the old ordering, which also
> allows us to remove the ps8640 special case.
> 
> One last note is that even without reverting commit 7d8e9a90509f
> ("drm/msm/dsi: move DSI host powerup to modeset time"), if you _just_
> revert the ps8640 special case and try it out then it doesn't seem to
> fail anymore. I spent time bisecting / debugging this and it turns out
> to be mostly luck, so we still want this patch to make sure it's
> solid. Specifically the reason it sorta works these days is because
> we implemented wait_hpd_asserted() in ps8640 now, plus the magic of
> "pm_runtime" autosuspend. The fact that we have wait_hpd_asserted()
> implemented means that we actually power the bridge chip up just a wee
> bit earlier and then the bridge happens to stay on because of
> autosuspend and thus ends up powered before dsi_mgr_bridge_power_on().
> 
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Why is the patch title showing 2/2? I am not seeing any 1/2 here.

> ---
> 
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 68 +++++----------------------
>   1 file changed, 11 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 3a1417397283..5e6b8d423b96 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -34,32 +34,6 @@ static struct msm_dsi_manager msm_dsim_glb;
>   #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
>   #define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
>   
> -#ifdef CONFIG_OF
> -static bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
> -{
> -	struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
> -
> -	/*
> -	 * If the next bridge in the chain is the Parade ps8640 bridge chip
> -	 * then don't power on early since it seems to violate the expectations
> -	 * of the firmware that the bridge chip is running.
> -	 *
> -	 * NOTE: this is expected to be a temporary special case. It's expected
> -	 * that we'll eventually have a framework that allows the next level
> -	 * bridge to indicate whether it needs us to power on before it or
> -	 * after it. When that framework is in place then we'll use it and
> -	 * remove this special case.
> -	 */
> -	return !(next_bridge && next_bridge->of_node &&
> -		 of_device_is_compatible(next_bridge->of_node, "parade,ps8640"));
> -}
> -#else
> -static inline bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
> -{
> -	return true;
> -}
> -#endif
> -
>   static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
>   {
>   	return msm_dsim_glb.dsi[id];
> @@ -254,7 +228,7 @@ static void msm_dsi_manager_set_split_display(u8 id)
>   	}
>   }
>   
> -static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> +static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>   {
>   	int id = dsi_mgr_bridge_get_id(bridge);
>   	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> @@ -300,36 +274,10 @@ static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>   	if (is_bonded_dsi && msm_dsi1)
>   		msm_dsi_host_enable_irq(msm_dsi1->host);
>   
> -	return;
> -
> -host1_on_fail:
> -	msm_dsi_host_power_off(host);
> -host_on_fail:
> -	dsi_mgr_phy_disable(id);
> -phy_en_fail:
> -	return;
> -}
> -
> -static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
> -{
> -	int id = dsi_mgr_bridge_get_id(bridge);
> -	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> -	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
> -	struct mipi_dsi_host *host = msm_dsi->host;
> -	bool is_bonded_dsi = IS_BONDED_DSI();
> -	int ret;
> -
> -	DBG("id=%d", id);
> -	if (!msm_dsi_device_connected(msm_dsi))
> -		return;
> -
>   	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
>   	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>   		return;
>   
> -	if (!dsi_mgr_power_on_early(bridge))
> -		dsi_mgr_bridge_power_on(bridge);
> -
>   	ret = msm_dsi_host_enable(host);
>   	if (ret) {
>   		pr_err("%s: enable host %d failed, %d\n", __func__, id, ret);
> @@ -349,7 +297,16 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>   host1_en_fail:
>   	msm_dsi_host_disable(host);
>   host_en_fail:
> -
> +	msm_dsi_host_disable_irq(host);
> +	if (is_bonded_dsi && msm_dsi1) {
> +		msm_dsi_host_disable_irq(msm_dsi1->host);
> +		msm_dsi_host_power_off(msm_dsi1->host);
> +	}

In addition to Dmitry's comment of keeping the bridge_power_on() name,

this part of the change seems independent of the patch. This was missing 
cleanup for DSI1 (esp the disable_irq part).

So can we break it up into two parts.

1) Add missing cleanup for DSI1
2) Just get rid of dsi_mgr_power_on_early() and keep the call 
dsi_mgr_bridge_power_on() in dsi_mgr_bridge_pre_enable() unconditionally.

> +host1_on_fail:
> +	msm_dsi_host_power_off(host);
> +host_on_fail:
> +	dsi_mgr_phy_disable(id);
> +phy_en_fail:
>   	return;
>   }
>   
> @@ -438,9 +395,6 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
>   	msm_dsi_host_set_display_mode(host, adjusted_mode);
>   	if (is_bonded_dsi && other_dsi)
>   		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
> -
> -	if (dsi_mgr_power_on_early(bridge))
> -		dsi_mgr_bridge_power_on(bridge);
>   }
>   
>   static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
