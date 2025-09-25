Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92B5B9D516
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 05:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0979110E26D;
	Thu, 25 Sep 2025 03:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgTSuc6K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DCE10E26D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:37:51 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONvBDi023770
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=n78nIIomQavWQosZYQPTeoTh
 4ytOcFS5L4hdEAU6XLI=; b=UgTSuc6KmCehqi8ARRkarzQ/yMYshdS5YZXikwc2
 7kEv0mWOqAoVbz2YicphPD1AnKPWlRK1yp+Fmhm3SFLF2E1yvaljAw4k8AtMELg6
 inG7Gz+JOnDV0mhleHIvoHBYxyJFyI7901v6BlbPPK5iouwon9LWTXsbaCKBEIOH
 eimYo1z8/aAmfxm60mIIoxRFz+QEjrkNqCiCRZ+GJ9ejdR8KsVANgS51pb2xPN7c
 PxENgsIhvFIwfVK0cSmGzFd+nlsjppggHlen3kj+tEcsjeH6bQCmWkOlOu5d61Zi
 ArtvXKWsEGrwwYRd1VJG9Jo9uQVCHTZDYJdJP3/srrRK0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0dn28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:37:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8589058c59bso175770185a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 20:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758771470; x=1759376270;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n78nIIomQavWQosZYQPTeoTh4ytOcFS5L4hdEAU6XLI=;
 b=RIOXZsZ/QTujC+Gw0y6JvwZqG1HonQK9Q2/lYlIkBLpjhkxxmoAil8YZ4XuJ5eU/FO
 Wrs7grWi3zMy28VFWKv0sr1w0Lgw/ZbEOUcIfYbCvMcpRAiRjwRCOWAVI/JtymkUqlxX
 Erb1jHqnJfpj0Ur1eH7naCvMcPkv8XQIWz36KEY9QEePH5/Kc8NWr/YYQQ8xAaSwlo5Z
 9IOXjAils294lcQzEYWKkdG0Z6gr+TSAGKmmdaTdqQRiuNHcItPLBSidwC1h6ibPQEVH
 Cubp/6Sqm592UcdqUQ20OQ42ps1zCdOiz2PQbyFDht0x/KsKYWJbsBu4P08dxP5LLR1c
 A3Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjwL0UtMTUc+ZATEcqqPeaBiqAgp1cenptCjP0KWj5ca6chP3GSigLKfRtB7D0Mkk2Mb0CHjdanzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2P20bsqY//NaEZa0z+tsz5OjaJgbjFztNklpHZO6s0dOwlLjw
 kOT6X1+j5rIjsE8fSr2D4Gyjec4FNoG2//GMgnppDmK6nkcjJaV/dO8J4kpRvT3T3rlEaWVQ5if
 Olg1rCLnNCpuVcX9yQm+ka0zKPD4FcOF8t8wrBFdzEO6NJx4Vx9QuVcPMZsWzPfc7uLfDHAM=
X-Gm-Gg: ASbGnctKZDhqRrl+ryCnkJA/cZfL00Xuwv6B8RXMtdfp6alsjHcyfJBEUTY7ETduKMO
 1AtRXFQtFGerfLpwsHvF9xt4z6MR5/hnfBli6/Fr+ihuIzecQv0F4qxO+OKIEgHiZiH5k9aqw3q
 H27C/C2NlHBTz7J6QJJhg+CmptsA1vBfyToKfmmKbmgQGc8Z2sDfku2w2FunMlp7Fv8QJ8LALxK
 Wpdz3Eewm4Md4fAXlfzHFqK42UrOCUtfCEpTBwakFG+fMEFlEtZbixlA4RMiNeB4lMXTTSTAuft
 GnCfX8iWfR6FFoW+Xp+yVNWGXLzm8V1jlJunhg8crXML8UytUi7kTzOG2PUWW9xqDjKquwovc2N
 xdGqHw2C3Lep9sz4CuqQ/xh2JbymvOTHY1KxqXbV9QkVUK5UkjAY9
X-Received: by 2002:a05:620a:2907:b0:80a:72d7:f0cd with SMTP id
 af79cd13be357-85aed8cbc11mr225516385a.56.1758771469840; 
 Wed, 24 Sep 2025 20:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Mkya6v8AWWGYf6q1L7jR77pkQxfEZnuvWyLMjPjoG8YIV9rwp0IrPi1ugpz+EuhpXNM8VQ==
X-Received: by 2002:a05:620a:2907:b0:80a:72d7:f0cd with SMTP id
 af79cd13be357-85aed8cbc11mr225513785a.56.1758771469267; 
 Wed, 24 Sep 2025 20:37:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb7bfb413sm2245821fa.56.2025.09.24.20.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 20:37:47 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:37:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 10/17] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <ykj7xrnpagbtftr7wt2vkyc4d4u4k5nmxsir433jzz7lhc3oq3@gaq4kicsrlpr>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-11-damon.ding@rock-chips.com>
 <tsgfxlkxty653crmzmwsr7p6slf27pxf6n6to5p7zvi6wsl444@525tz5uhbj44>
 <2870c278-3c65-4d8f-ace3-1fd5b03af2b4@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2870c278-3c65-4d8f-ace3-1fd5b03af2b4@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4b90e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=e-wIutcIwHs2mBw2ZVAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: nAhRKLLgQ7_x5t7ZgtSSBiQyG-EQxMZ5
X-Proofpoint-ORIG-GUID: nAhRKLLgQ7_x5t7ZgtSSBiQyG-EQxMZ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfXyUp8qJqFjZea
 2knTD1uGz10t/2OZhiNd9xFgRnpj2Wo6zvP6hYDwetYil0EX6VBZD1GxF/cj+b1EqowBUdWWlwo
 eCMHcfpJQpNNqFBkZ0k5fVK4q7eXjQ95UA37YymIXfya9fwuEwQI2mdXKG1U0V2Achx222AMvkj
 51h2E0DhrCU83FRBYzp7qFnUI+5kc9rM1n0VAoqL+vMMdCXGwAOvdSQYXac3k02Fxu4Mi6e/Cuq
 B9eOy80MwenHkrjXICKfkNOolZWjS8w3v3q5TCrE+4+U4FcNdtPpbwweoNp/Lab/NY4/UpKNa79
 vOK1QAd3XHLRcwh44sprbq/bygEifQhU/yR4GIb+aC3ac0yu6IkoTrNlLgDPTaATxkUnDZuhsFK
 Se7Sfwe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138
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

On Wed, Sep 24, 2025 at 05:14:57PM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 9/12/2025 7:03 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 04:58:39PM +0800, Damon Ding wrote:
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
> > > 
> > > Changes in v5:
> > > - Set the flag fo drm_bridge_attach() to DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > >    for next bridge attachment of Exynos side.
> > > - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
> > >    the downstream device is a panel, a bridge or neither.
> > > - Remove the calls to &analogix_dp_plat_data.get_modes().
> > > ---
> > >   .../drm/bridge/analogix/analogix_dp_core.c    | 151 ++++++++----------
> > >   .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
> > >   drivers/gpu/drm/exynos/exynos_dp.c            |  25 +--
> > >   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
> > >   include/drm/bridge/analogix_dp.h              |   3 +-
> > >   5 files changed, 95 insertions(+), 96 deletions(-)
> > > 
> > > @@ -1532,6 +1487,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
> > >   int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> > >   {
> > > +	struct drm_bridge *bridge = &dp->bridge;
> > >   	int ret;
> > >   	dp->drm_dev = drm_dev;
> > > @@ -1545,7 +1501,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> > >   		return ret;
> > >   	}
> > > -	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> > > +	if (dp->plat_data->panel)
> > > +		/* If the next is a panel, the EDID parsing is checked by the panel driver */
> > > +		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
> > > +	else if (dp->plat_data->next_bridge)
> > > +		/* If the next is a bridge, the supported operations depend on the next bridge */
> > > +		bridge->ops = 0;
> > 
> > And what if the next bridge is dp_connector without a separate HPD pin?
> 
> This case was indeed not taken into account.
> 
> If the next is a bridge, it should be better to set DRM_BRIDGE_OP_DETECT and
> return connector_status_connected in analogix_dp_bridge_detect(). This
> ensures the connection status remains connected for both the dp-connector
> and the bridges without DRM_BRIDGE_OP_DETECT.

Maybe OP_EDID | OP_DETECT? I think, we need to fix drm_bridge_connector
to stop preferring OP_EDID bridges over OP_MODES if the latter one is
enountered later in the chain. In other words inside
drm_bridge_connector_init() clear bridge_edid if OP_MODES is encountered
and vice versa. This way you can always declare OP_EDID here (after
converting to panel bridge) and then letting panel's OP_MODES take over
mode declaration. Would you please include such a patch in the next
iteration?

> 
> > 
> > > +	else
> > > +		/* In DP mode, the EDID parsing and HPD detection should be supported */
> > > +		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> > > +
> > > +	bridge->of_node = dp->dev->of_node;
> > > +	bridge->type = DRM_MODE_CONNECTOR_eDP;
> > > +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
> > > +	if (ret)
> > > +		goto err_unregister_aux;
> > > +
> > > +	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
> > >   	if (ret) {
> > >   		DRM_ERROR("failed to create bridge (%d)\n", ret);
> > >   		goto err_unregister_aux;
> > 
> 
> Best regards,
> Damon
> 

-- 
With best wishes
Dmitry
