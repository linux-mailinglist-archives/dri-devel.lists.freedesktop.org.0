Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B60B3B64B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 10:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858D910E0D7;
	Fri, 29 Aug 2025 08:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O171H4Aa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570BA10E0D7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:48:44 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85Gi0013920
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/5pBODwspf82fhKHX/+Qq3M8
 oCn/6yRZrJbLU7BeMOU=; b=O171H4Aal17R09DovZSV+f7s9mAfCdAdtrQVTFsl
 GQlxb/LkQrUq/6+/W0kU6lq/0pofV7O7pLQhM+o1+aXy9r4fAPkuYL2MXiD4siQs
 g1Na+02TxmDq29fo1qK8CUsEFolUHv7Tc/CfS4QJaFJpsGjh9LlP/jSUXO0lRmWZ
 /CEbX8JaAtsj2hyphwKEMHu9i/NeKTePzqcndXiJ2Ty5Bd2R0/1PdwworLi+vW8J
 VU+zqzS11JwUSpjblFP44O2dPwkJuocpegRv6CbYE+UMyxnMNW1agMiKOmNwftF9
 j6bgIpa5uAUClt6tHX6mVrzhmjzjmE3cf5qsJHFYQFAZGQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w33hrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:48:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70baffc03dbso41731836d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 01:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756457322; x=1757062122;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/5pBODwspf82fhKHX/+Qq3M8oCn/6yRZrJbLU7BeMOU=;
 b=kpNnRAyJ5+jxyKeIa09VcbfCyb7j3GC7AaR+lRZnhgLgsQnvMPaXQkwZDVwtM5Qzh5
 b5h9pY0EB/XfGymzE/sZ4WJ3tKxwlhgvxB3vnuwR0djRPvabcgtGJUtLGqqLg9VL3wkW
 aswTTGHE2ntK/B1WsLNmzJDlQIaX5nDt2A60XXBapctdJrin4mkkYp8Ko2P9dxQT8xL+
 SCTyUXBjSVD6nK6muerRoJN7r++IjfxfUY/AbsYEdHED5CUHsSqSuBxvedPRYmf4Iuuc
 usI2by49G5dmtya5KtBPboIq05Kjc5WxdACujVn7KAH2IkNgTSIHklKOnJuFr+GoCDpd
 baYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNW/vT2iJcxfYaRIm4CiwJJdf2Eqd0c7EUFA9zh+Ry8lDaziCTn+uS8jvN+yE0VqnIZRagE+WI72o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbq5FiGcsrWLTc9vmK+F3Jy9XCHzY+6tbg11vD3oNmv+rhU4Pc
 rLD2LLOt8ITkz7nRK/8ZMSdI8o5ZCNHRaOru1+7lrRb0nxW+oTqm1ZGZVDtTJcQzDDDpHg+M7eK
 69MTs1oHcQHKCUJIXTZ/MdbKJi4/P/1RASAQc085yEeWwrltf0c1fojzHl/fGAkqqoX8IFl4=
X-Gm-Gg: ASbGncva1eFu44GvXsR2UHlY54j1M8KtCzJmncF33Hj0yaGU1YYElTRa98hqK1Ew7Eq
 bgRlYk0ftbpX794ZRFyiUqUZHdUJ2ResxfCkhnGLywSO5SkHe2ocLyJe+TTLBIDN3s3XLxGHqZ7
 TJ9ZAhgBon73khUEgNOTNZF2+5LRkYB9yv9cww/ZiFr6cHQTLh7p0jtzIM44+FMu/YW2u6hezdg
 /0y6SrdQjTwBGBY+DsOZ4NTxFWaV7MdrlAr9F8C1lUnNg2QfTX7ALu1P+NWZZRpW8oNNxCLRgOe
 4HurofvZFyWQgiu28zEFDJpuJlZ5LPCGrUB8V/lAPqbGMI3PXgUYIHAnvteg8L4CHCwBPS9ERYN
 aspvXa9witLJpZMCdPVOgnR8Sy256eGO1mGbl7L0IUAGVj1USlG/b
X-Received: by 2002:a05:6214:5186:b0:70d:b3de:cec9 with SMTP id
 6a1803df08f44-70dd59c1196mr125891176d6.22.1756457322354; 
 Fri, 29 Aug 2025 01:48:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq1ezFqcENyB1YLJXTV7TThom8X2IGaTOdTprgqE2iRpU+3lXQDMjeVPvPOaC+kNzjQAaeVA==
X-Received: by 2002:a05:6214:5186:b0:70d:b3de:cec9 with SMTP id
 6a1803df08f44-70dd59c1196mr125890886d6.22.1756457321839; 
 Fri, 29 Aug 2025 01:48:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f6784526csm461424e87.84.2025.08.29.01.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 01:48:39 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:48:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 07/13] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <ghp33yxo24gaubn6pijks3wnuch3fpbmi5z27cq7pk3siffiox@jb2zw3lt35hk>
References: <20250814104753.195255-1-damon.ding@rock-chips.com>
 <20250814104753.195255-8-damon.ding@rock-chips.com>
 <incxmqneeurgli5h6p3hn3bgztxrzyk5eq2h5nq4lgzalohslq@mvehvr4cgyim>
 <62dfbe1d-3e36-4bc5-9b25-a465e710f23b@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62dfbe1d-3e36-4bc5-9b25-a465e710f23b@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68b1696b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=g_3uhpjf_u-dzjrkN2gA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXzfZWAFvYS68Z
 BWHytSlNkOuxI+8ReNVQh9ThyiW1XNmiPCSpJOwcU1IwDGgElOXTpX2/gJQtd2XMfIW2d5rMDMW
 1H1afn7/6scZIp1jReD0CLn+SINT0+rcp4LnNPBAL2k0E61MUdCo6VQcy3WZRBvEN9KZilq9EEp
 V1qrrcvwR6TvtLTPPFx0J5ZR5vAG/sqxvaRBpe+LPah05Evg6hNEM2mkmUE0kuaq/GxOzbn9Uiy
 kMC2If0Q7qfsoKJ1/46IL3FKDxXQ7sba1iWZ08KswCA1QXdnJrv3KnKyr/unm2mN4jDjMiqscjF
 7OcddREC3N/saEg/xOiPrvtAmubnTP/G0IImQHxFsTQbrpSflD7E9lBgx8VEsxV160eg8CWlR/H
 NKf9Rn1Z
X-Proofpoint-GUID: Ztrt31DkSZtrTn5GE0ZOXeeGMHULVuOt
X-Proofpoint-ORIG-GUID: Ztrt31DkSZtrTn5GE0ZOXeeGMHULVuOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
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

On Wed, Aug 20, 2025 at 05:18:13PM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 8/17/2025 12:43 AM, Dmitry Baryshkov wrote:
> > On Thu, Aug 14, 2025 at 06:47:47PM +0800, Damon Ding wrote:
> > > Apply drm_bridge_connector helper for Analogix DP driver.
> > > 
> > > The following changes have been made:
> > > - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
> > >    and &drm_connector_helper_funcs.
> > > - Remove unnecessary parameter struct drm_connector* for callback
> > >    &analogix_dp_plat_data.attach.
> > > - Remove &analogix_dp_device.connector.
> > > - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
> > >    &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
> > > - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
> > >    &drm_bridge_funcs.edid_read().
> > > 
> > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > 
> > > ------
> > > 
> > > Changes in v2:
> > > - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
> > >    DRM_BRIDGE_OP_EDID.
> > > - Add analogix_dp_bridge_edid_read().
> > > - Move &analogix_dp_plat_data.skip_connector deletion to the previous
> > >    patches.
> > > 
> > > Changes in v3:
> > > - Rebase with the new devm_drm_bridge_alloc() related commit
> > >    48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc()
> > >    API").
> > > - Expand the commit message.
> > > - Call drm_bridge_get_modes() in analogix_dp_bridge_get_modes() if the
> > >    bridge is available.
> > > - Remove unnecessary parameter struct drm_connector* for callback
> > >    &analogix_dp_plat_data.attach.
> > > - In order to decouple the connector driver and the bridge driver, move
> > >    the bridge connector initilization to the Rockchip and Exynos sides.
> > > 
> > > Changes in v4:
> > > - Expand analogix_dp_bridge_detect() parameters to &drm_bridge and
> > >    &drm_connector.
> > > - Rename the &analogix_dp_plat_data.bridge to
> > >    &analogix_dp_plat_data.next_bridge.
> > > ---
> > >   .../drm/bridge/analogix/analogix_dp_core.c    | 145 ++++++++----------
> > >   .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
> > >   drivers/gpu/drm/exynos/exynos_dp.c            |  18 ++-
> > >   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
> > >   include/drm/bridge/analogix_dp.h              |   3 +-
> > >   5 files changed, 88 insertions(+), 90 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > index 7876b310aaed..a8ed44ec8ef5 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > @@ -947,24 +947,16 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
> > >   	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
> > >   }
> > > -static int analogix_dp_get_modes(struct drm_connector *connector)
> > > +static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
> > >   {
> > > -	struct analogix_dp_device *dp = to_dp(connector);
> > > -	const struct drm_edid *drm_edid;
> > > +	struct analogix_dp_device *dp = to_dp(bridge);
> > >   	int num_modes = 0;
> > > -	if (dp->plat_data->panel) {
> > > +	if (dp->plat_data->panel)
> > >   		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
> > > -	} else {
> > > -		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
> > > -		drm_edid_connector_update(&dp->connector, drm_edid);
> > > -
> > > -		if (drm_edid) {
> > > -			num_modes += drm_edid_connector_add_modes(&dp->connector);
> > > -			drm_edid_free(drm_edid);
> > > -		}
> > > -	}
> > > +	if (dp->plat_data->next_bridge)
> > > +		num_modes += drm_bridge_get_modes(dp->plat_data->next_bridge, connector);
> > 
> > If there is a next bridge which provides OP_MODES, then
> > drm_bridge_connector will use it for get_modes() and skip this one
> > completely. I'm not sure what's the value of this call.
> 
> Following your advice, it is really a good idea to distinguish the
> drm_bridge_ops between the panel and the bridge. Will add it in v5.
> 
> > 
> > >   	if (dp->plat_data->get_modes)
> > >   		num_modes += dp->plat_data->get_modes(dp->plat_data, connector);
> > > @@ -972,51 +964,39 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
> > >   	return num_modes;
> > >   }
> > > -static struct drm_encoder *
> > > -analogix_dp_best_encoder(struct drm_connector *connector)
> > > +static const struct drm_edid *analogix_dp_bridge_edid_read(struct drm_bridge *bridge,
> > > +							   struct drm_connector *connector)
> > >   {
> > > -	struct analogix_dp_device *dp = to_dp(connector);
> > > +	struct analogix_dp_device *dp = to_dp(bridge);
> > > +	const struct drm_edid *drm_edid = NULL;
> > > -	return dp->encoder;
> > > -}
> > > +	drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
> > > +	if (dp->plat_data->get_modes)
> > > +		dp->plat_data->get_modes(dp->plat_data, connector);
> > 
> > 
> > So, we have DDC, but we still want to return platform modes? What is the
> > usecase for that?
> > 
> > There might be some, but I think it deserves a comment in the source
> > file.
> > 
> 
> For Rockchip side, since RK3588 and RK3576 can support YUV formats while the
> other can not, the &analogix_dp_plat_data.get_modes() help filter out YUV
> formats for some platforms(The YUV feature support may not be fit for this
> patch series and will come later).

Note, get_modes() here adds modes rather than filtering them. You can
use .mode_valid in order to filter out YUV modes.

> 
> For Exynos side, I think &analogix_dp_plat_data.get_modes() can help
> parse the video mode set in the eDP DT node when there is no available panel
> or bridge.

I think this should be handled by a separate bridge. E.g. see how the
imx-legacy-bridge is implemented.

> 
> I will add some comments about it in the next version.
> 

-- 
With best wishes
Dmitry
