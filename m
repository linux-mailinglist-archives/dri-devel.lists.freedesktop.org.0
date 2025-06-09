Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BACAD2480
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 18:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214BF10E147;
	Mon,  9 Jun 2025 16:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnLzrSlp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6675810E147
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 16:57:54 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559GebQq000933
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 16:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vneP2DX18iJ+KlTNZiKjmC22
 4Mk3kkmH8LnYKiLpD4c=; b=PnLzrSlpWgGn4uruN4Gpc2LZhF8KsmPGcVymGks1
 xKRsHdWZRLBuWMBvATa7UTqxFATFi2PGrQeMlxt80yZZvGPvh69RugIP7dYyyRwO
 AwRYd8KsHtxy9Lb0Ib9OFZOoYG7vHtG5n147TrG+ydyPpIlbmNJK0cBdLCRnPdIR
 3DOhjOJvP1wF876YeZntF/APoJ7nxe6/xSKsLTphH51uOK5isjvoXx/OY8V86ntj
 cVQTnahE4FkA82ooYxckRqXazBBAxqlWUhvOTJBFkq5ZU6nb0py6BfcVYVOALiAZ
 kjBea3DlXG3+nHi0IK1B2qAOSXtzjCpxPMWdl3p8oozpVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2t9e89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 16:57:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d21fc72219so313425985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 09:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749488268; x=1750093068;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vneP2DX18iJ+KlTNZiKjmC224Mk3kkmH8LnYKiLpD4c=;
 b=hs+iSjBzMhrK7Is06t0nlFf79+J3DMc1ezWr0BIVjJP5ajlawkMrBqndKy76Nd5Tje
 MdEnpe8URTLjt2ff/Z24wBF7aYzk+N1oK+iO7iBY5e92KNB+xgiZJcW+YMmoOkENytL4
 XyZuQ4EOPwznejZ4hYiE25g+qW57/H4Rfn20SOkLWp2hRiz7ZRMUB6XDD/TuwZ9uhkp1
 W3JXn8Vw1CSJgE4xGg31q6wdgNXcX+ysXAQIui1dlKB43nKVPEUqmvAhznij2RUKOUWG
 2ZEEiwR8QX+sH8Wuvq8ZNh72P/zuXqpyIgXlpfCMazd2IZrdeor6qFRk3zwmLBJzsJm1
 kcYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQxcc3qaNek/FkVTBtodT7r2bZhCBGE5qqJYePqTyunTe3HVlzPzP4s+Cc7PkrTneqrhV//s5crDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz17CIcU9t0QwDzye5YfvTQFm8LwGOjRyf4e+Aq5OXEYnszSBcE
 eYX+NY6OvrhSQxjzQNz0bxCGH7cOhR8/4wS05/AETu8bpcZAswtj6bnTA6mbw51E3kYpWl7/mAa
 r5bywNNfr94ZtJjDEvmP8rg/HQxEGEFhrzr5gabW5Vsdp9eNLKC/z5solAPyeoIOdo6KOCPo=
X-Gm-Gg: ASbGncuoweQu4bggvyQIRRoba3CrbGZS8k3kskHUS9/JnhQ42y3R9X2TbBdYF63S//A
 FUTY3rTX7idnebNkC4x8O5RC4iHSc6f0CxePzWw166RkrGKq2D90U9w9wsu0gCfTD915vmZ2rOw
 6yszvwq9hMrz95Eqp4YwfFfNMcjhXbDjNKmkry07fmUHk7qk7eKAiscVVgwAoW7fPRr55vy4U2P
 Rfjik7Vq5qca5/6dni/kdTxvhb2Wsah0rkxTGAlidfTzpSV+ibS0W3bdeZzjwZ+JXI0unx51I8M
 VrwjDdIUdtI8ti3Z6IoixrpUeXIPINIFtwtzqgQ0yVEQQkOq5P5fRKTb9O8/VmPu6NeAC9nu9Uc
 =
X-Received: by 2002:a05:620a:29ca:b0:7d0:a119:23e7 with SMTP id
 af79cd13be357-7d229949d04mr1971226285a.1.1749488268302; 
 Mon, 09 Jun 2025 09:57:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuOIyz1gO9+R/XbrlmeEb9VZkyxA2b4RUV8fYDjH0Cjb+6ZgMRfAyijb61tapQIW/wHY+KFQ==
X-Received: by 2002:a05:620a:29ca:b0:7d0:a119:23e7 with SMTP id
 af79cd13be357-7d229949d04mr1971221985a.1.1749488267763; 
 Mon, 09 Jun 2025 09:57:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1ccf522sm11626591fa.92.2025.06.09.09.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 09:57:47 -0700 (PDT)
Date: Mon, 9 Jun 2025 19:57:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 02/10] drm/hisilicon/hibmc: fix dp probabilistical
 detect errors after HPD irq
Message-ID: <jq3tsnri2ehb37ueb66he5lwifxe4kq676jzcpa4fpk66sol6w@buxjhhwga73z>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-3-shiyongbang@huawei.com>
 <r3tnmjl5bnlyhgblhfqwouu57oh5tfpmfsrx5xczzmsovalvse@mujphkc4mv5k>
 <49a4644d-0e73-419a-aa53-0db69bd00833@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49a4644d-0e73-419a-aa53-0db69bd00833@huawei.com>
X-Proofpoint-GUID: tataNSgSdeZ5pmdYznT3YMLw6_AuUD8d
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6847128d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=mLV4-GXAN7EMi8kBQXcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tataNSgSdeZ5pmdYznT3YMLw6_AuUD8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyNyBTYWx0ZWRfX3230+VYNhl3x
 coBb9E8TRdEXuSLE5K3YLM0rTV0yXbub2TxoBvbON8sAayD0wLZT1UIJml4odTmC28IGi8XtF/S
 L1QwuEkLX7u58s0lkheIJXU7pQS9x86JUczfo5WmD/vXIrULnkneQWyovORV75vyjDwkb2DggAN
 eUYDXxuaJH2QotViy/3yDuhLr6j/PNCSEiHs0HXUuQFeIcPv55AhVCy+iAaNjPQA59JTuMBkyuz
 nIzPQQEwSwTodIpGr6t3Df2+gAb5L2XHJSv2hPePXKZuh/RQ0q1jdJS22nItW2OWTV1GrPdeSEo
 Ac5mL0aD3Yt4HRXWKCx+91+hu59mZV+ZtrlxgbaPZZ7UVddScW82PvvfFr/N8LD7cvDQYtM6hoS
 uQj3LzPyXLcvc+3H0BQd5oF8g2laHwvwrxMJbbsoLi1l097KQsl6TFq/bmA+NISvacV2UE8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090127
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

On Mon, Jun 09, 2025 at 10:47:50PM +0800, Yongbang Shi wrote:
> 
> > On Fri, May 30, 2025 at 05:54:24PM +0800, Yongbang Shi wrote:
> > > From: Baihan Li <libaihan@huawei.com>
> > > 
> > > The debouncing when HPD pulled out still remains sometimes, 200ms still can
> > > not ensure helper_detect() is correct. So add a flag to hold the sink
> > > status, and changed detect_ctx() functions by using flag to check status.
> > > 
> > > Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> > > Signed-off-by: Baihan Li <libaihan@huawei.com>
> > > ---
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  1 +
> > >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 38 +++++++++++++------
> > >   2 files changed, 28 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> > > index 665f5b166dfb..68867475508c 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> > > @@ -50,6 +50,7 @@ struct hibmc_dp {
> > >   	struct drm_dp_aux aux;
> > >   	struct hibmc_dp_cbar_cfg cfg;
> > >   	u32 irq_status;
> > > +	int hpd_status;
> > >   };
> > >   int hibmc_dp_hw_init(struct hibmc_dp *dp);
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> > > index d06832e62e96..191fb434baa7 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> > > @@ -13,7 +13,8 @@
> > >   #include "hibmc_drm_drv.h"
> > >   #include "dp/dp_hw.h"
> > > -#define DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
> > > +#define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
> > > +#define HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT	BIT(3)
> > >   static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
> > >   {
> > > @@ -34,9 +35,12 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
> > >   static int hibmc_dp_detect(struct drm_connector *connector,
> > >   			   struct drm_modeset_acquire_ctx *ctx, bool force)
> > >   {
> > > -	mdelay(200);
> > > +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> > > -	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
> > > +	if (dp->hpd_status)
> > > +		return connector_status_connected;
> > > +	else
> > > +		return connector_status_disconnected;
> > >   }
> > >   static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
> > > @@ -115,22 +119,34 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
> > >   {
> > >   	struct drm_device *dev = (struct drm_device *)arg;
> > >   	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
> > > +	struct hibmc_dp *dp = &priv->dp;
> > >   	int idx;
> > >   	if (!drm_dev_enter(dev, &idx))
> > >   		return -ENODEV;
> > > -	if (priv->dp.irq_status & DP_MASKED_SINK_HPD_PLUG_INT) {
> > > -		drm_dbg_dp(&priv->dev, "HPD IN isr occur!\n");
> > > -		hibmc_dp_hpd_cfg(&priv->dp);
> > > +	if (dp->hpd_status) { /* only check unplug int when the last status is HPD in */
> > I think this way you'll ignore HPD short pulses. Could you possibly
> > clarify whether it is the case or not?
> 
> We actually doesn't enable short HPD here, this feature just used in our electrical tests.

I don't think HPD pulse needs to be enabled specially. It is documented
as IRQ that Source needs to respond to by rereading DPCD Link / Sink
Status bits and acting accordingly.

-- 
With best wishes
Dmitry
