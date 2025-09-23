Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2401DB94190
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 05:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E8310E53B;
	Tue, 23 Sep 2025 03:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CM+odUjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2A010E53B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:22:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MHZuwv017057
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4BaStgRA9naaMpcfCvi59hb/GSqirNOjqp8oFnDbiF0=; b=CM+odUjYk9HSIgd5
 DJaukv6vyEehW1eky22WBy+ltxZyyNXvmQrOGf2yB5dGEh0em48l38wcSuaUpHBm
 qC+AyIYJIviechqUhVRhcZwuZlr8gEdI5ApWMMsWUO4AjzSujVzVAP/SH0CRUOGR
 yV4Xd+AqSj0v+bOeAZph5LRLJ6oYz3ASjPXlgSbMIfKVWgpN3rDwva0YIqOHq4L1
 rPHMbHnzR2Uf6U47R9jSC2xav5GZ3MwQhvlKsRNIWyD+3+6PI+QkSCoEUQbyKrHQ
 VCsxFHeBIlzWN4PmlBtp/x4IezHd2YFNY8PPFQLMCtEeJBLza78JdvXi++splWxw
 Dp2SiQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98eywr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:22:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-78e30eaca8eso44366826d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 20:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758597765; x=1759202565;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4BaStgRA9naaMpcfCvi59hb/GSqirNOjqp8oFnDbiF0=;
 b=D97F2IKJwVbZ6KryQxgORKJ9r4+JzOWzmlBUqX2J46Ho/6bNDUxTsiQAP1PfbVUiXe
 KzbLrnNl7ihekm5ZTzrhQKPHvADIp83T0PdbbBkpUGgAW2LbhcSnf21P/NlMMaLXhN6d
 /AumunJQy+VPPPStZ99Pwk7Zo0So7JLkm+otYqxTrO+vx2nmczYEnx1vars10ARqQhpe
 OuB1G/4MEcFj/FZ33dd79NKNuF1YQvETY5kUtXcGFso0cRo6Evz+jlpliuEy75Y58FTO
 sVRBVBnqGt/+RPrhGcOpnUaRTW0Cbvax56TS68DBOOIDXrhhTK3+l1bmb2PC16rrMZwD
 +T9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJqk+lkKqljQ2KQ1ExycZJFW7Yj2MDDjyE4KI1NTYEeGOysJheLY6Q7Wxq9+5N6QPLOJFCxAQlhIk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu3G/+fs4K7CceFb2AeKKiuiG4lPhMaDcOAZi4Xj3PIG+IOJ0M
 S/8fIMoyhFi1tOKm6eDxJUnKVTAwUUmGuO0zMOkWm5CIlVJjVsl/vBza8opWBb43DIZk1BhocZU
 VPMOaEWwtbTJAa7Zwg7wy3ozDTt/1vA6tc8Rs6vWIRpZ7ym6Mjc+n6x47hTHhwBtHZQPThWQ=
X-Gm-Gg: ASbGncvi4QY9sho+CmD4+yV6xsNRG3bSBN0XFZKm2vdzpJ/rEfr9w6OwY5vxmNYRSNT
 S8iDgAhsFSl07dEf8ctI4yNQFm43SulFmMlLjiT5p98lvjxDmW+/vegBx4thmwO6I79QoYbG84m
 NPgCVBPs+KWLIJmjMNciNekmIM3Zaaf76F8XGiCOQtmFcb+cCqU6ntOSj+djBZwiQjTtSpucO5/
 GY9u2izYUsNfLmiVXdEIlb+G/JkLwJqGtG7/9TDgj7iH7DaBBYuqDzzs3wfFANyZpLfUE0AlQEw
 HXG7PHejjzlCHOZdmLlCnKOEyWbKPmi2GHKVYUCIxiaPY8ot2+BHj+Cn/fI4kLZhcNNhWo8uB7a
 1YKAfH168YZgtk4fj6mG1v6fpAJSVVJCKCxZGhktAASfk6vzgBQ83
X-Received: by 2002:a05:6214:d61:b0:7dd:16b:2a01 with SMTP id
 6a1803df08f44-7e71687bca6mr12820576d6.46.1758597764910; 
 Mon, 22 Sep 2025 20:22:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFve1xcjR3BgNxDtbA5JUCymBJBIBi80BRmHw8alfsOEhoUAytyNfVHKakjYTFor0qoU5hHgA==
X-Received: by 2002:a05:6214:d61:b0:7dd:16b:2a01 with SMTP id
 6a1803df08f44-7e71687bca6mr12820436d6.46.1758597764303; 
 Mon, 22 Sep 2025 20:22:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36be170a88esm8033581fa.70.2025.09.22.20.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 20:22:42 -0700 (PDT)
Date: Tue, 23 Sep 2025 06:22:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 drm-dp 1/4] drm/hisilicon/hibmc: fix dp
 probabilistical detect errors after HPD irq
Message-ID: <xlqffumhurbzcj6sfuu3tr6fafpxb4akwskvd45kqx2h4mprux@armcruouadfx>
References: <20250922024943.311947-1-shiyongbang@huawei.com>
 <20250922024943.311947-2-shiyongbang@huawei.com>
 <4vtis3tmlxhmxjmzhi4jdfriexidtr5u2jdcpmfegyyc5gkznu@mpzganc4k5gp>
 <5e9aad79-fef1-4258-83c4-6938ceafbaa5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e9aad79-fef1-4258-83c4-6938ceafbaa5@huawei.com>
X-Proofpoint-GUID: Qgnpqfv1Dje705Rx-ARRHa8sC1RHsBMd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX/iDzbzdIbZPP
 WguTUVdN+n/3Z2CS2bwuWdBeQnKnMxKjXeCzclM2pECA3Bn8bqGgK4EJrTPTwNgx9XDnqP0rsnV
 4Eeo/QVaYSTfgqQ8Mwk6A0cbtbNAOaUwlUaBEOGZN4V3PsnNrxvB1s2QOr+/OXQpd5A4mek6N5Q
 J5SUp8LgNtCVluKAs8nf4LkElYghXQ0euhQGm/pU9qqSU72cdkGY5QljDLSCmC+9QONDRW3Bm9M
 dkj8If5JD6vYyK3pudQxVkD00TmrxuDwy0OHjCivRs7KDpzCKIpR6dfIotj4FaMcD0Uxq7kmIWH
 3/eSYPhZ3Y74Ce802EWx/Hnb/H7XhyZgRVY/vqXxKhsDIX7wIaY3A0VpSp+dxjGSxjr7BBCHmoR
 IbCzrWx/
X-Proofpoint-ORIG-GUID: Qgnpqfv1Dje705Rx-ARRHa8sC1RHsBMd
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d21286 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=i0EeH86SAAAA:8 a=_EjEUeHQWHsufru9t1QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
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

On Tue, Sep 23, 2025 at 10:57:56AM +0800, Yongbang Shi wrote:
> > On Mon, Sep 22, 2025 at 10:49:40AM +0800, Yongbang Shi wrote:
> > > From: Baihan Li <libaihan@huawei.com>
> > > 
> > > The issue is that drm_connector_helper_detect_from_ddc() returns wrong
> > > status when plugging or unplugging the monitor. Use HPD pin status in
> > > DP's detect_ctx() for real physcal monitor in/out, and keep using
> > > detect_frome_ddc() if it's the first time to call detect because of
> > > insmoding driver.
> > If I understand correct, this is not quite right. Consider DP-to-HDMI or
> > DP-to-DVI dongle being plugged without an actual monitor and then the
> > monitor being plugged later on.
> 
> Hi Dmitry,
> Thanks for your correction. So your point is that if the HPD comes in from a dongle.
> Is that okay to add those checks at the end?
> 
>         ret = drm_dp_read_dpcd_caps(dp_dev->aux, dp_dev->dpcd);
> 	if (ret)
> 		return connector_status_disconnected;
> 
> 	if (!drm_dp_is_branch(dpcd))
> 		return connector_status_connected;
> 
> 	if (drm_dp_read_sink_count_cap(connector, dp_dev->dpcd, &dp_dev->desc) &&
> 	    dp_dev->dpcd[DP_DOWNSTREAM_PORT_0] & DP_DS_PORT_HPD) {
> 		ret = drm_dp_read_sink_count(dp_dev->dpcd);
> 		if (ret > 0)
> 			return connector_status_connected;
> 	}

Yes

> 
> Thanks，
> Baihan
> 
> 
> > > Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> > > Signed-off-by: Baihan Li <libaihan@huawei.com>
> > > Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> > > ---
> > > ChangeLog:
> > > v5 -> v6:
> > >    - use HPD status in DP detect_ctx(), suggested by Dmitry Baryshkov.
> > > v4 -> v5:
> > >    - fix the commit message and DP detect_ctx(), suggested by Dmitry Baryshkov.
> > > ---
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c     | 12 ++++++++++++
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h     |  7 +++++++
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h    |  3 +++
> > >   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c | 13 +++++++++++--
> > >   4 files changed, 33 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> > > index 8f0daec7d174..4d8d3e4d4f84 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> > > @@ -2,6 +2,7 @@
> > >   // Copyright (c) 2024 Hisilicon Limited.
> > >   #include <linux/io.h>
> > > +#include <linux/iopoll.h>
> > >   #include <linux/delay.h>
> > >   #include "dp_config.h"
> > >   #include "dp_comm.h"
> > > @@ -305,3 +306,14 @@ void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg)
> > >   	hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(0), cfg->enable);
> > >   	writel(HIBMC_DP_SYNC_EN_MASK, dp_dev->base + HIBMC_DP_TIMING_SYNC_CTRL);
> > >   }
> > > +
> > > +void hibmc_dp_update_hpd_status(struct hibmc_dp *dp)
> > > +{
> > > +	int status;
> > > +
> > > +	readl_poll_timeout(dp->dp_dev->base + HIBMC_DP_HPD_STATUS, status,
> > > +			   FIELD_GET(HIBMC_DP_HPD_CUR_STATE, status) != dp->hpd_status,
> > > +			   1000, 100000); /* DP spec says 100ms */
> > > +
> > > +	dp->hpd_status = FIELD_GET(HIBMC_DP_HPD_CUR_STATE, status);
> > > +}
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> > > index 665f5b166dfb..8348ad9e34a8 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> > > @@ -14,6 +14,11 @@
> > >   struct hibmc_dp_dev;
> > > +enum hibmc_hpd_status {
> > > +	HIBMC_HPD_OUT,
> > > +	HIBMC_HPD_IN,
> > > +};
> > > +
> > >   enum hibmc_dp_cbar_pattern {
> > >   	CBAR_COLOR_BAR,
> > >   	CBAR_WHITE,
> > > @@ -50,6 +55,7 @@ struct hibmc_dp {
> > >   	struct drm_dp_aux aux;
> > >   	struct hibmc_dp_cbar_cfg cfg;
> > >   	u32 irq_status;
> > > +	int hpd_status;
> > >   };
> > >   int hibmc_dp_hw_init(struct hibmc_dp *dp);
> > > @@ -60,5 +66,6 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp);
> > >   void hibmc_dp_hpd_cfg(struct hibmc_dp *dp);
> > >   void hibmc_dp_enable_int(struct hibmc_dp *dp);
> > >   void hibmc_dp_disable_int(struct hibmc_dp *dp);
> > > +void hibmc_dp_update_hpd_status(struct hibmc_dp *dp);
> > >   #endif
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> > > index 394b1e933c3a..64306abcd986 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> > > @@ -24,6 +24,9 @@
> > >   #define HIBMC_DP_CFG_AUX_READY_DATA_BYTE	GENMASK(16, 12)
> > >   #define HIBMC_DP_CFG_AUX			GENMASK(24, 17)
> > > +#define HIBMC_DP_HPD_STATUS			0x98
> > > +#define HIBMC_DP_HPD_CUR_STATE		GENMASK(7, 4)
> > > +
> > >   #define HIBMC_DP_PHYIF_CTRL0			0xa0
> > >   #define HIBMC_DP_CFG_SCRAMBLE_EN		BIT(0)
> > >   #define HIBMC_DP_CFG_PAT_SEL			GENMASK(7, 4)
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> > > index d06832e62e96..48c9c97eef0e 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> > > @@ -34,9 +34,16 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
> > >   static int hibmc_dp_detect(struct drm_connector *connector,
> > >   			   struct drm_modeset_acquire_ctx *ctx, bool force)
> > >   {
> > > -	mdelay(200);
> > > +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> > > +
> > > +	/* if no HPD just probe DDC */
> > > +	if (!dp->irq_status)
> > > +		return drm_connector_helper_detect_from_ddc(connector, ctx, force);
> > > -	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
> > > +	if (dp->hpd_status == HIBMC_HPD_IN)
> > > +		return connector_status_connected;
> > > +
> > > +	return connector_status_disconnected;
> > >   }
> > >   static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
> > > @@ -128,6 +135,8 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
> > >   		hibmc_dp_reset_link(&priv->dp);
> > >   	}
> > > +	hibmc_dp_update_hpd_status(&priv->dp);
> > > +
> > >   	if (dev->registered)
> > >   		drm_connector_helper_hpd_irq_event(&priv->dp.connector);
> > > -- 
> > > 2.33.0
> > > 

-- 
With best wishes
Dmitry
