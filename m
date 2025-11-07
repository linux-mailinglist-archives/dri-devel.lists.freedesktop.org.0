Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE27C4031C
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 14:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9966D10EACA;
	Fri,  7 Nov 2025 13:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+TqKBDb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OoJnQ5q+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA8C10EACA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 13:52:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7B2T8R3041070
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 13:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MCwp2yKgRDbiKLKvcUZpR1sV
 O2SWRlEpJ9zJU9FUvCo=; b=R+TqKBDbKj/6rKVtAZQdBLGkTnvPLUZCeuR4Ggg3
 b+NbL6AD8iBsfw+3bAXkk7G26U8aRHcPOKNRiMGMF/PsE94FWGIb5cLurF87uu+e
 5cWZmulbGSucLrwNCbojlL+f/BUrN7o+PXXL4WU/9/OL5XyUCJMUswYv3Ez2SvK4
 1D2ok9jRm9yvcCgDArgTOR/UMKQSH2WpJ7W8PTcilCSKiHCH0tgoPut8uCY7cBge
 JM99atXVBiAvuJKFBJkcjz5Bm3YceCs3Q1LZ0EoIdVGlLsjLjp/RYRBHbEyUqUv7
 9gIcxOsgSeAOARG2hOp0/+NiBOV47p/GcM2sqlSrb9nDog==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9fj08d4w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 13:52:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-29598910dd2so18282005ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 05:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762523519; x=1763128319;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MCwp2yKgRDbiKLKvcUZpR1sVO2SWRlEpJ9zJU9FUvCo=;
 b=OoJnQ5q+6G4o/bYnOtL7kLR4jsjS9SOI5ocEqsyU8XjwDDsivgRwVmGlWYy3OUrn/2
 8UwaSZZlm80oWR/03+GwbpqbutlioGCh7zcR7ZEoHxAw4kaybqfzS4ipb5pR0vgQvzYV
 5phiFhPFK44gTHQIhIpv2L7WDRo22fcQpGBW3QKpNmZsAjUW3LFeELWcf999w6Y2pztH
 t5TXHGn0eRd9JX7CN9shiYWnYE8yzXPnkRA2+ZN59fWFTpIIojkoyPj1H0i8s5E+0+T5
 pmrzgKTiQ7gjsF216MA+Q+wr7JG6eTN+xFaZQG7QBo6OAMt/Pqe34mQsITD7DEfc6dSd
 f9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762523519; x=1763128319;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCwp2yKgRDbiKLKvcUZpR1sVO2SWRlEpJ9zJU9FUvCo=;
 b=bkE9BuFC8arHtuPRMCjCAfj/2YLQhgfO+IKMOeutFb9a6/KxLGNTbA/RVdnvg9YfaU
 +JVhw6fwrWjgAtuDkx4obfD4/cruwGRXcq+Rldg2SooLsCa+vnQXfXqnEs0xNU+pDxzC
 USDQEsTLhPw5TcwZUm4djrZD2Xv/HIMsvH7RDNDhP3ZXKfh6feIXXcE234kQxH7SSBvn
 qzsr6LqC0bnCWjY26AcFvdDO9PDN27vp9q1JBA8TpneGOQGmmeXFxP2mdR33Kqg4d39W
 m4ZPyH61N/nEcAl4rNyToh2NDrCxZ7WiEn2DRDqFh3ez/s0KogQ3k8q8uL7lv4CtIYNW
 X43Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz0TJIGgEttxkB2sdJblldxJzW24lePMrehXuTU5PuueQ1bclLtNZHL3eu8xOx4N3gmMj1G5fD7UE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN1YV9HDRD/KVB0Hv1j+C5NdshbDVhWYszlsPNZlr5MUGmu0dm
 IjEzg+LhkfFa4RHyIz/c7HOe0qY0vGbtba4bXq+Hdmz8pAl2/E4cZCwzvZO65dYYs72+rwHG5yH
 i6+uuds+5yD5qRaM+9XIxh6mP4lSST8RHpGWOcYVjQ7wty6ahlQDdJntm4GqL4edEh9OlWw==
X-Gm-Gg: ASbGncu3nKjofop449iTF4p24NVd3y+X3q0MtnR1upA7k2Mw+ySDB4ctzjWsJyMvTyk
 pEnzesHheC5urKR+mhPLbM9xBuuFpSS/ZKhyJ16ARuewU1iga6KIOhFnF2lhizaXZPS3VCUsX2v
 asj/pJhcI0ykcdQOm+NJkhhKeVCOW6YtFmXq6Myv7X3eFXHQWd34wVEr8FNpoXBBo3TBFAqbmwQ
 fPsNW8isoMoraip1eeWEaaV1+m8n31KMna58vZ6r4uraCxIjoZYVYMAgVwJLzMUMBTd5th02p2/
 X6Taxu6qXivsUnoomcWiC9fLlgtjzlHdWF/BD9hCzHNmjPfHh9B4HRXu6TzTOHeD34Vrx+c9d2Y
 VHq2Y1keNtdqf4WPSiR+y1r7N
X-Received: by 2002:a17:902:db07:b0:295:39d9:8971 with SMTP id
 d9443c01a7336-297c03a6069mr56742325ad.1.1762523519056; 
 Fri, 07 Nov 2025 05:51:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3HJZJpW76pJqwIeIsZ2hbm5brwn6HSUBfJ7QroBwBmNe0D+4y6WwifSEuJ1CUZ2VLMgu18w==
X-Received: by 2002:a17:902:db07:b0:295:39d9:8971 with SMTP id
 d9443c01a7336-297c03a6069mr56741865ad.1.1762523518491; 
 Fri, 07 Nov 2025 05:51:58 -0800 (PST)
Received: from hu-nlaad-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651cc6595sm61506885ad.98.2025.11.07.05.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 05:51:57 -0800 (PST)
Date: Fri, 7 Nov 2025 19:21:51 +0530
From: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH] drm/bridge: add support for lontium lt9211c bridge
Message-ID: <aQ35d3ehnW6Pi+BT@hu-nlaad-hyd.qualcomm.com>
References: <20250911-lt9211c-bridge-support-v1-1-c221202cbcd5@oss.qualcomm.com>
 <n3hycqdiupxhfuswrhckwel5q2qc2a354t5dueoaa3x2bviuza@xgqkkhfmr5o4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n3hycqdiupxhfuswrhckwel5q2qc2a354t5dueoaa3x2bviuza@xgqkkhfmr5o4>
X-Authority-Analysis: v=2.4 cv=XZyEDY55 c=1 sm=1 tr=0 ts=690df980 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=h0J1ii3O1rLK1nQplmoA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: cCsrZFOvsucHpY6NYRYqTtpnw0D77ZgI
X-Proofpoint-GUID: cCsrZFOvsucHpY6NYRYqTtpnw0D77ZgI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDExMyBTYWx0ZWRfX9pDAJniAcuM/
 2KvIACxk2D1j1czjAO2KSxXKktqaFFMPGfbbc5TafZgeR42RYLLQuUaTz4rs8x2GtlhyzX8Q8O4
 plDYDAE6t7wp+zBzhao9ppjESYPpxQzIiSsvS/c4lo//6fJoRqtZHvtn8vRYnzFDh0caX31ValO
 fe2vxrz4G2N0IXn8hp/jgVOzV/QjaTSdbKtQ1/rnkKOSkmGJgNghQuj2OjxhyaJNdkkibHBQpE6
 SHLfT8fN96NtaHW9fgSVgEeAGhP2NxErHBZ6nUnUwtCRoGEXmDaNx7NDaOO7w8kAqbEEa3YVjRp
 gplXSxzKUERKaEixbvat4Uq7syjxm/E00swAk6hEEkihw8iGGw4Ndriof7dlhJbMRA4lMKR1wvG
 GlTcV06DMhFI81a/XdBqLd0BU3AhXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070113
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

On Mon, Sep 15, 2025 at 04:19:57AM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 08:25:27PM +0530, Nilesh Laad wrote:
> > From: Yi Zhang <zhanyi@qti.qualcomm.com>
> > 
> > LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
> > Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
> > Add support for DSI to LVDS bridge configuration.
> > 
> > Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> > Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> 
> Please send the driver together with the bindings, in one series.
Addressed in https://lore.kernel.org/lkml/20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com/
> 
> The driver looks pretty similar to the existing LT9211 driver. Please
> explain why you can't extend that one.
LT9211 and LT9211C differ completely in register programming sequences.
Even lontium mentioned that register configuration are different for lt9211 and lt9211c.
Nearly every function would require duplicated logic with if (chip_type) branching,
as register sequence are completely different.
Having both sequences in single file is not looking good, hence want to merge as separate driver.
> 
> > ---
> >  drivers/gpu/drm/bridge/Kconfig           |   13 +
> >  drivers/gpu/drm/bridge/Makefile          |    1 +
> >  drivers/gpu/drm/bridge/lontium-lt9211c.c | 1105 ++++++++++++++++++++++++++++++
> >  3 files changed, 1119 insertions(+)
> > 
> > +	const struct reg_sequence lt9211c_tx_ssc_seq[] = {
> > +		{ 0x8234, 0x00 },
> > +		{ 0x856e, 0x10 },
> > +		{ 0x8181, 0x15 },
> > +		{ 0x871e, 0x00 },
> > +		{ 0x8717, 0x02 },
> > +		{ 0x8718, 0x04 },
> > +		{ 0x8719, 0xd4 },
> > +		{ 0x871A, 0x00 },
> > +		{ 0x871B, 0x12 },
> > +		{ 0x871C, 0x00 },
> > +		{ 0x871D, 0x24 },
> > +		{ 0x871F, 0x1c },
> 
> lowercase the hex, please.
> 
> > +		{ 0x8720, 0x00 },
> > +		{ 0x8721, 0x00 },
> > +		{ 0x871e, 0x02 },
> > +	};
> > +
> 
> [...]
> 
> > +
> > +static void lt9211c_atomic_enable(struct drm_bridge *bridge,
> > +				struct drm_atomic_state *state)
> > +{
> > +	struct lt9211c *ctx = bridge_to_lt9211c(bridge);
> > +	const struct drm_bridge_state *bridge_state;
> > +	const struct drm_crtc_state *crtc_state;
> > +	struct drm_connector *connector;
> > +	struct drm_crtc *crtc;
> > +	u32 bus_flags;
> > +	int ret;
> > +
> > +	ret = regulator_enable(ctx->vccio);
> > +	if (ret) {
> > +		dev_err(ctx->dev, "Failed to enable vccio: %d\n", ret);
> > +		return;
> > +	}
> > +
> > +	/* Deassert reset */
> > +	gpiod_set_value(ctx->reset_gpio, 1);
> > +	usleep_range(20000, 21000);	/* Very long post-reset delay. */
> > +
> > +	/* Get the LVDS format from the bridge state. */
> > +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> > +	bus_flags = bridge_state->output_bus_cfg.flags;
> > +	ctx->de = !!(bus_flags & DRM_BUS_FLAG_DE_HIGH);
> > +
> > +	switch (bridge_state->output_bus_cfg.format) {
> > +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> > +		ctx->bpp24 = false;
> > +		ctx->jeida = true;
> > +		break;
> > +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> > +		ctx->bpp24 = true;
> > +		ctx->jeida = true;
> > +		break;
> > +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> > +		ctx->bpp24 = true;
> > +		ctx->jeida = false;
> > +		break;
> > +	default:
> > +		/*
> > +		 * Some bridges still don't set the correct
> > +		 * LVDS bus format, use SPWG24 default
> > +		 * format until those are fixed.
> > +		 */
> > +		ctx->bpp24 = true;
> > +		ctx->jeida = false;
> > +		dev_warn(ctx->dev,
> > +			 "Unsupported LVDS bus format 0x%04x\n",
> > +			 bridge_state->output_bus_cfg.format);
> > +		break;
> > +	}
> > +
> > +	/*
> > +	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
> > +	 * from the bridge to the encoder, to the connector and to the CRTC.
> > +	 */
> > +	connector = drm_atomic_get_new_connector_for_encoder(state,
> > +							     bridge->encoder);
> > +	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> > +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> > +	drm_mode_copy(&ctx->mode, &crtc_state->adjusted_mode);
> > +
> > +	dev_dbg(ctx->dev, "width=%d,height=%d,clock=%d\n",
> > +			ctx->mode.hdisplay,
> > +			ctx->mode.vdisplay,
> > +			ctx->mode.clock);
> > +
> > +	ret = lt9211c_read_chipid(ctx);
> > +	if (ret)
> > +		return;
> > +
> > +	/* Lt9211c must enable after mipi clock enable */
> > +	queue_delayed_work(ctx->wq, &ctx->lt9211c_dw,
> > +		msecs_to_jiffies(100));
> 
> At this point MIPI clock should be enabled.
> 
Yes, MIPI clock is enabled here but a delay is required for lt9211c to
detect the mipi signals. Added queue_delayed_work() to defer execution
without blocking main thread.
> > +
> > +	dev_dbg(ctx->dev, "LT9211 enabled.\n");
> > +}
> > +
> 
> [...]
> 
> > +
> > +MODULE_DESCRIPTION("Lontium LT9211C DSI/LVDS/DPI bridge driver");
> > +MODULE_LICENSE("GPL");
> 
> Missing MODULE_AUTHOR
> 
> > 
> > ---
> > base-commit: f50b969bafafb2810a07f376387350c4c0d72a21
> > change-id: 20250911-lt9211c-bridge-support-9209f7cc7697
> > prerequisite-message-id: <20250910-add-lt9211c-bridge-v1-1-4f23740fe101@oss.qualcomm.com>
> > prerequisite-patch-id: 79524a1aaba6b39f49603db725539cf11176820b
> > 
> > Best regards,
> > --  
> > Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> > 
> 
> -- 
> With best wishes
> Dmitry
