Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F04BA1C60
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 00:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0082410E2E1;
	Thu, 25 Sep 2025 22:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAZeOmvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CB410E2E1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:21:35 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPcsZ023329
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aoTfqDMQtgNp8uKI6NaCQod1
 KhD8aF7dBolg9fIYyjM=; b=MAZeOmvkPjKC32lFD2F+OE6mpbrhBaW5mKvBQNe6
 tM1Pb8YBK5DDsvX/hmxhWhhKwV2dKs8/zfyklHHGC7vxhvHBSkNA5ZNThn4lnkBO
 QQh4wUfoh5cKxqOvH0GhMFc2JfSnEEDugaQ3rNceSM/PZ/dh9D+eHrxk2qyI2dMy
 lfU1ku9t0z+gVtbNCWxTkvf5loyw0EFZCSfYty4Q3Pmw4eunLVQYfurSUVBAAp6F
 oxpWWoSPH2Uy/rS84xVRnfUglz0kLWfPa0NK6ajypxVErks1nacawLcwTNtiYdu/
 5kapW/j7H3X9lec6+cztABI+8Ej4CuIDGQtBaexI+Hl2Fg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qrj5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:21:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4bf85835856so40247661cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758838894; x=1759443694;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aoTfqDMQtgNp8uKI6NaCQod1KhD8aF7dBolg9fIYyjM=;
 b=EkxhYmRrQI3AuqBXXWpQoxW5IlWTf3VTif3ES9hKyMRRAdjB4rbN9z6xvDajNfIxa1
 jXVsWH6ztQZ9nu0AeWzX5Wjs9Pr2pZgWAiQRw4fpXN71eTmJ5zZTc+SEhNXIFTQiVr82
 M6JqM+c02hdz7yVp2nC7KdUkPpUmu2Z1pQCEDdqiH/OXFXHPuAzEctjGcZe4LMZWwbZ5
 7APD3EGmoecnbnhpmUyj8eMjhJz7yC0N0FtDSJbE7J6zwdRajmU4QBaOujZGwMyjwdp8
 W4Kd6pGtF02s/66XgiRtfkos4SoIMHKEQGsXcf16s0ZZv/AubCU7yJAyLDyvVquJOEgq
 z20Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCDKaHkwyzB4ya3I17rNHRPJf+UKmFZJ+cHTNaWEB9Xoy8lsRTai59oa60+IvgW9pCPBP8pcxCvKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7Gy7RNm7Pj2mFjv+MaFD/v+8ppM/e1avXNIZH3eIqJaOu6aG0
 uLzEspY7S41H6dkHyO1fCuB7XjkomhVEVdXf/y/SlHHanIFUZKBckx/TWPbkVsWXCYcY4wmweId
 PhUi9eE0mgxa1afEVconYsR5lnXPPGkygbQBWy58Ur3yVaFDREkio8JercNpVEYQCIjuTyF8=
X-Gm-Gg: ASbGncvKWo6G/jTdLIECVLK6hhOiZYcL0dY1iW7cDk43tLu7yu3aEBaTIHvxhh/ujAz
 qSuSXdyNFNOQFP2zPn3R6ifRHHF1O5QTyEqIWJsGqgjuvO0eMiM28K1Z2eHUs9PK6+ribsK7YSS
 eDJQV+Tt799X02+1AifEYjrxwPQaAIOH+OtXrHL8TI3cSfZEMBGxNaCfwxOPW2nZ4Gx1coaUU6X
 I0N35cGHd1tx7hIsbER0TdVdj1qeCauVFK7Wte/rhmPrEPhQmnKHvoI09VuhqqP6qpBnZWObNSE
 sGLW0ZB0CjKpF42g4hOOa1UVXBg91uZU3CDwgPF33kxbMOPa4h31qCaZtIJUmioJtRVTu6I8uFB
 t8037XOWtgrD69Cyv0z+L/LvFdMI/Uv15jsNtCTBJYkdXlTq7By2t
X-Received: by 2002:a05:622a:190e:b0:4b7:acab:852b with SMTP id
 d75a77b69052e-4dacd2444dfmr53075991cf.26.1758838893904; 
 Thu, 25 Sep 2025 15:21:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+ndE8As98QEszHZ6NDkq+zsmIILHZCa3+sexpBqWme3ZRaECjD3Wj4Ezi0fMLWu39g+sHHg==
X-Received: by 2002:a05:622a:190e:b0:4b7:acab:852b with SMTP id
 d75a77b69052e-4dacd2444dfmr53075521cf.26.1758838893328; 
 Thu, 25 Sep 2025 15:21:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316a3304fsm1171495e87.122.2025.09.25.15.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 15:21:31 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:21:28 +0300
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
Message-ID: <jzy37mcxvonlnouvsyepgyld4uxcsvlgxyj6upm4hek3fmavll@api4pfbjzi33>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-11-damon.ding@rock-chips.com>
 <tsgfxlkxty653crmzmwsr7p6slf27pxf6n6to5p7zvi6wsl444@525tz5uhbj44>
 <2870c278-3c65-4d8f-ace3-1fd5b03af2b4@rock-chips.com>
 <ykj7xrnpagbtftr7wt2vkyc4d4u4k5nmxsir433jzz7lhc3oq3@gaq4kicsrlpr>
 <7babd32a-6b20-4e4b-9c40-594520a183bb@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7babd32a-6b20-4e4b-9c40-594520a183bb@rock-chips.com>
X-Proofpoint-ORIG-GUID: ImWR2t3BzsKuYYGrxfhvCzhUYAk2mFvW
X-Authority-Analysis: v=2.4 cv=bJ0b4f+Z c=1 sm=1 tr=0 ts=68d5c06f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=ZqRDvNvAEryDotfT4VUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/zejIPUEGN3N
 LHWe1X64Rlx0G2HpVpzXXqvZfReUFqNDD6mXm3vAD3+AE11XiUF+uWx9HY3Yh9JJnKEgaakxvWo
 1VFNGRTxOE7K4Hg4ZNmXnGpp/2mwA8zctMSmRIX0VBZhmvb3maHbD/WzA/4IQiYAok4njUJQphI
 iyxrXHrwIGDaUSA3jX/2ssWmNOaoEzyj/dIhztmCsItp4ywuQBl4CQ9PVT1YMXXDXNLl6pS4ojz
 SdjprnjNPkgMROJaQFxQvvWoaPFRCy0YcMlwPp/rd1U4Dr8AOnt7o9JU7CT+dBwGDOrp5GC2DxP
 w8m9zJGU2WLaIgGLRQ11ZPAHx6w8xTM6p3QNnY0V+0JgCaYtp87YhmJW9oJn7HFrZT0WwFlX4pm
 Qu442/M2+LoitAC+xLJvHcB2ydRahQ==
X-Proofpoint-GUID: ImWR2t3BzsKuYYGrxfhvCzhUYAk2mFvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 03:33:45PM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 9/25/2025 11:37 AM, Dmitry Baryshkov wrote:
> > On Wed, Sep 24, 2025 at 05:14:57PM +0800, Damon Ding wrote:
> > > Hi Dmitry,
> > > 
> > > On 9/12/2025 7:03 PM, Dmitry Baryshkov wrote:
> > > > On Fri, Sep 12, 2025 at 04:58:39PM +0800, Damon Ding wrote:
> > > > > Apply drm_bridge_connector helper for Analogix DP driver.
> > > > > 
> > > > > The following changes have been made:
> > > > > - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
> > > > >     and &drm_connector_helper_funcs.
> > > > > - Remove unnecessary parameter struct drm_connector* for callback
> > > > >     &analogix_dp_plat_data.attach.
> > > > > - Remove &analogix_dp_device.connector.
> > > > > - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
> > > > >     &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
> > > > > - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
> > > > >     &drm_bridge_funcs.edid_read().
> > > > > 
> > > > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > > > 
> > > > > ------
> > > > > 
> > > > > Changes in v2:
> > > > > - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
> > > > >     DRM_BRIDGE_OP_EDID.
> > > > > - Add analogix_dp_bridge_edid_read().
> > > > > - Move &analogix_dp_plat_data.skip_connector deletion to the previous
> > > > >     patches.
> > > > > 
> > > > > Changes in v3:
> > > > > - Rebase with the new devm_drm_bridge_alloc() related commit
> > > > >     48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc()
> > > > >     API").
> > > > > - Expand the commit message.
> > > > > - Call drm_bridge_get_modes() in analogix_dp_bridge_get_modes() if the
> > > > >     bridge is available.
> > > > > - Remove unnecessary parameter struct drm_connector* for callback
> > > > >     &analogix_dp_plat_data.attach.
> > > > > - In order to decouple the connector driver and the bridge driver, move
> > > > >     the bridge connector initilization to the Rockchip and Exynos sides.
> > > > > 
> > > > > Changes in v4:
> > > > > - Expand analogix_dp_bridge_detect() parameters to &drm_bridge and
> > > > >     &drm_connector.
> > > > > - Rename the &analogix_dp_plat_data.bridge to
> > > > >     &analogix_dp_plat_data.next_bridge.
> > > > > 
> > > > > Changes in v5:
> > > > > - Set the flag fo drm_bridge_attach() to DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > > > >     for next bridge attachment of Exynos side.
> > > > > - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
> > > > >     the downstream device is a panel, a bridge or neither.
> > > > > - Remove the calls to &analogix_dp_plat_data.get_modes().
> > > > > ---
> > > > >    .../drm/bridge/analogix/analogix_dp_core.c    | 151 ++++++++----------
> > > > >    .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
> > > > >    drivers/gpu/drm/exynos/exynos_dp.c            |  25 +--
> > > > >    .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
> > > > >    include/drm/bridge/analogix_dp.h              |   3 +-
> > > > >    5 files changed, 95 insertions(+), 96 deletions(-)
> > > > > 
> > > > > @@ -1532,6 +1487,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
> > > > >    int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> > > > >    {
> > > > > +	struct drm_bridge *bridge = &dp->bridge;
> > > > >    	int ret;
> > > > >    	dp->drm_dev = drm_dev;
> > > > > @@ -1545,7 +1501,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
> > > > >    		return ret;
> > > > >    	}
> > > > > -	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
> > > > > +	if (dp->plat_data->panel)
> > > > > +		/* If the next is a panel, the EDID parsing is checked by the panel driver */
> > > > > +		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
> > > > > +	else if (dp->plat_data->next_bridge)
> > > > > +		/* If the next is a bridge, the supported operations depend on the next bridge */
> > > > > +		bridge->ops = 0;
> > > > 
> > > > And what if the next bridge is dp_connector without a separate HPD pin?
> > > 
> > > This case was indeed not taken into account.
> > > 
> > > If the next is a bridge, it should be better to set DRM_BRIDGE_OP_DETECT and
> > > return connector_status_connected in analogix_dp_bridge_detect(). This
> > > ensures the connection status remains connected for both the dp-connector
> > > and the bridges without DRM_BRIDGE_OP_DETECT.
> > 
> > Maybe OP_EDID | OP_DETECT? I think, we need to fix drm_bridge_connector
> > to stop preferring OP_EDID bridges over OP_MODES if the latter one is
> > enountered later in the chain. In other words inside
> > drm_bridge_connector_init() clear bridge_edid if OP_MODES is encountered
> > and vice versa. This way you can always declare OP_EDID here (after
> > converting to panel bridge) and then letting panel's OP_MODES take over
> > mode declaration. Would you please include such a patch in the next
> > iteration?
> > 
> 
> I see. Following your suggestions, the logic will be:
> 
> 1.If the later bridge declares OP_MODES and
> &drm_bridge_connector.bridge_edid already exists, the
> &drm_bridge_connector.bridge_edid should be set to NULL.
> 2.If the later bridge declares OP_EDID and
> &drm_bridge_connector.bridge_modes already exists, the
> &drm_bridge_connector.bridge_modes should be set to NULL.
> 3.If the later bridge declares both OP_EDID and OP_MODES, set
> &drm_bridge_connector.bridge_modes and &drm_bridge_connector.bridge_edid to
> it(preserving the existing behavior).

Yes. And then the get_modes() will defer its functionality to the last
bridge that declares either of those.

> 
> I will add a new commit with necessary code comments to implement this in
> v6.

Yes, thanks!

> 
> > > 
> > > > 
> > > > > +	else
> > > > > +		/* In DP mode, the EDID parsing and HPD detection should be supported */
> > > > > +		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> > > > > +
> > > > > +	bridge->of_node = dp->dev->of_node;
> > > > > +	bridge->type = DRM_MODE_CONNECTOR_eDP;
> > > > > +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
> > > > > +	if (ret)
> > > > > +		goto err_unregister_aux;
> > > > > +
> > > > > +	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
> > > > >    	if (ret) {
> > > > >    		DRM_ERROR("failed to create bridge (%d)\n", ret);
> > > > >    		goto err_unregister_aux;
> > > > 
> > > 
> 
> Best regards,
> Damon
> 

-- 
With best wishes
Dmitry
