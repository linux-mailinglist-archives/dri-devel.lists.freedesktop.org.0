Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNtQLqtQnWkBOgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:18:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231CC182E44
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BB010E4C1;
	Tue, 24 Feb 2026 07:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDDZeAQ4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8KQc4YW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D1010E4C1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:18:00 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O4M6w82318885
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ekBQ+gwM/4zQdd6ugVpTA+Fd
 cj3wp/ekgn7ZSZzvo1M=; b=hDDZeAQ4GaYhBtoWoBfbrYH5jfydhRHq+QJmJgyB
 JP+D/BiNRc92N2sA27/en7J6DxhqygNRckguAxinN+BVGrO3/Q3AGaY6/Na1r5vh
 +x0b2LuVNFgRGHeLm4aLVbXetq1QZre+9VpW7l/LD2juuCW0U5SAKc4DMttvqsSw
 QFFa+RwHBMueJVo2PbTGqR2TZpJJSQQwpxtFSDJims4n7fCZsyI4PGaTzS7RZF2h
 ZCg+1g6dqCGcjyr261bUPHuJ8OhiygWjhrY9PyGMl4pAU1Eqx04SV0DRn0CYWH2A
 PAtkE1UAYIs/eMj0QW5XkawoSDCBuHg2cbJ9rvaBBTMXpQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyja4gk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:18:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb403842b6so5182559185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771917479; x=1772522279;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ekBQ+gwM/4zQdd6ugVpTA+Fdcj3wp/ekgn7ZSZzvo1M=;
 b=f8KQc4YWfoBv+Y0N9oSEWK+B3YCFn2HAiIJkhMN5gxbJaluwjgowyg3lE5IVyRhRA5
 74yTy2QWiMhHy4Hc+qNnw6COMobfEbV0K78/vC/DVm1LKoXUGg6Rieab7nrPKRr+vlpx
 g51X2bFFAFi6HEQXTiy0MufLu0UQjsQ/y1rUQ0c2dlI9Py5I7NGo5V+qwdYOUwMxPJtB
 OF8lniVPwq5kdHc7OVtRB0p1WHgT4LmXK8tegnVGjM5TGJEgkRRC3xobeoNkfhln3jWM
 sUAd4/HUaytsO3s5OAIfxGOs6WpOLAv7fOhzFHh5pa5qurr+fyxmfIRQ9P2MQ+9Zn32U
 p7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771917479; x=1772522279;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ekBQ+gwM/4zQdd6ugVpTA+Fdcj3wp/ekgn7ZSZzvo1M=;
 b=fhI6C/b4tOKiYetKK74sKjHcs8Kpw+5GJVMqOgViBNmdTg6I+qEwNm+W6pNy2RrkT5
 fqPoXOZZDQOqXuoLfHfRopsZlPDXb5kkvABIwmqF8oIbUnOozSheAogG8WpuH2vbjHVx
 lY59L5S0JzdMwgK+JbgdbdRULGvZ/4lpluszTy/Y2IxHnn4ShWjnt2IZCXuEBP7vQbav
 A+v0f7AvH49iCgH1/dMkHZl3H2uFrhmSiXyyCKGl14NwildlS1Bo9xXRWQzKCxvjBKnG
 TVYkWvaZMIDT4wEWGZa6ffswJDGxQTa6oa1O9X3qz4Bzo1AFDvLcnRFVK1BLU9HZl187
 6BXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT2P40mF/NmphasxB1MJ8w01mr8jyV+bBcqqBauhhBa8JgzdHxyREPNpLdzxUSV9DWIJuWDW1lyoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+0w6hl9g1jAYS2ltQcwep/0bfSIW0uy44571ilS2rYJVfpATm
 gfoinLJdJigHe69BXzbunjhOlFiMWZHAVutL8ZdXyPeJ8zbLF0FpbFNQiW8u+JtaQnD+43nFPoE
 DIE9m6Yadkk59OCxgmwWeCzP7S+OxIMb15ji0R2YybAlcjz0Eu2RWZ+gQ5p1P1heBFp6GccM=
X-Gm-Gg: AZuq6aL76UzNhgZ1mC4H2RnMFPrSPmO1CwrgKKUdS2X3KAv8HeE33y4EPL0l+FcM05d
 SkcqlY/wHKKLFuw+02lq764ZW9nx7WWZqr3NEWsSqdXAHdxypHNV8XySU97EhyiGK84XJqkupLX
 xmF45rrynh5Tgn0wRuF5w1NY0zWwtPg+3ewW81DWCFxv1DA5YYJHrwlCTdufh/0lMTGHzNiZArX
 mS57G5+XZxQlTOdRBfB/f78MVQL+n88ILW0EbnCFQ0rAtgAh2q41ZzmiD6B2Isv9d3IY9K4fiS2
 A9cJDJfvIsuPI38AF7FpxQssisb8epcGQzWs7BoWmt2O9KniYo85IEk1UA+YHeyk3WDl/uBMqgF
 M6qzZZAR02wnQ//lYHyK9aiP1HjF8h7cETWU3aNM0mAK/Dw7u7/yGoXflX0QjvswiVw4/V1TjVe
 u66mnUHPu2mukdWMEWB7IWCMgKatA5Xiqsxok=
X-Received: by 2002:a05:620a:25cb:b0:8a1:b5ab:bbd6 with SMTP id
 af79cd13be357-8cb8ca88cbemr1310574285a.71.1771917478776; 
 Mon, 23 Feb 2026 23:17:58 -0800 (PST)
X-Received: by 2002:a05:620a:25cb:b0:8a1:b5ab:bbd6 with SMTP id
 af79cd13be357-8cb8ca88cbemr1310573585a.71.1771917478321; 
 Mon, 23 Feb 2026 23:17:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a7878be0sm19544151fa.4.2026.02.23.23.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 23:17:57 -0800 (PST)
Date: Tue, 24 Feb 2026 09:17:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Pet.Weng@ite.com.tw,
 Kenneth.Hung@ite.com.tw, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/bridge: Add ITE IT6162 MIPI DSI to HDMI bridge
 driver
Message-ID: <mjbu2cdgyj46e7fethska24cwj4zu63ilikix6c4izepjxix5k@bv6446jnei2d>
References: <20260223-upstream-6162-v1-0-ebcc66ccb1fe@ite.com.tw>
 <20260223-upstream-6162-v1-1-ebcc66ccb1fe@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-upstream-6162-v1-1-ebcc66ccb1fe@ite.com.tw>
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699d50a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Ns9eNvu6AAAA:8
 a=DgozZX_GfGlvXY9SbtgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-ORIG-GUID: My4c2rVaY6-23VRX981u1pNklQeQmkEg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2MiBTYWx0ZWRfX0C0UfgHUolie
 AJxQtx+uFrovE1UukInhxOCUd0PD8iPgjRN5Llsqgu05I1NQo7Rn6JNiNzW6bGUguskfjHk6zRC
 rgI9I1jA6C0EFBy/NHUTPj9+EulHhmG+vlxySJaJA0hcymRTN5DKYnc7NBes1SiR6j3gC6pYPO+
 22Ie49P//Y3b9niSTVxhPULV+TcWpPn/J/7MidO4FnWrs+HILbZkvegGo8PpSnKtP370aaTGXtB
 puO75C4Fs3/xRBPO3aCsIBmIk8escJ3uIrPbQJVqLlBrpRpC3IXGqOlqhQkaqpNRS7SKmNCYGs2
 RWhRk70ozVarvuSl2Pb1e0Bhxbn+pzV5g8k7YLMxWBGQFpNKwBxfopjOHvnnmyNIsHlA4b/aJie
 Hemi/lWLYXAsgGC4HuLprYTxyKgRLQUcIGLvDG5rU6oslPeSXgOGjDkTId5wKMTiPEtEmsdjZWw
 zB2kzM6ve975pDkqemQ==
X-Proofpoint-GUID: My4c2rVaY6-23VRX981u1pNklQeQmkEg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240062
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Hermes.wu@ite.com.tw,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Pet.Weng@ite.com.tw,m:Kenneth.Hung@ite.com.tw,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,ite.com.tw,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ite.com.tw:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 231CC182E44
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 05:20:45PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> Add support for the ITE IT6162 MIPI DSI to HDMI 2.0 bridge chip.
> The IT6162 is an I2C-controlled bridge that supports the following
> configurations:
> 
>   - Single MIPI DSI input: up to 4K @ 30Hz
>   - Dual MIPI DSI input (combined): up to 4K @ 60Hz
> 
> The driver implements the DRM bridge and connector frameworks,
> including mode setting, EDID retrieval, and HPD support.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/Kconfig      |   17 +
>  drivers/gpu/drm/bridge/Makefile     |    1 +
>  drivers/gpu/drm/bridge/ite-it6162.c | 1876 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1894 insertions(+)
> 
> +
> +	mipicfg->pn_swap = of_property_present(endpoint,
> +					       "ite,mipi-dsi-phy-pn-swap");

None of the properties you use here are described in the bindings.

What is the actual meaning of this value?


> +	mipicfg->lane_swap = of_property_present(endpoint,
> +						 "ite,mipi-dsi-phy-link-swap");

The same. If I understand the name, you should use the order of lanes in
data-lanes.

> +
> +	if (of_property_present(endpoint, "ite,mipi-dsi-mode-video-sync-pulse")) {
> +		mipicfg->mode_flags |= MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +		mipicfg->mode = SYNC_PULSE;

What for?

> +	}
> +
> +	if (of_property_present(endpoint, "ite,mipi-dsi-clock-non-continous")) {
> +		mipicfg->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +		mipicfg->continuous_clk = false;
> +	}

"clock-noncontinuous" from video-interfaces.yaml

> +
> +	of_node_put(endpoint);
> +
> +	dev_info(dev, "lanes: %d pn_swap: %d, lane_swap: %d, mode_flags: %lu",
> +		 mipicfg->lane_num, mipicfg->pn_swap,
> +		 mipicfg->lane_swap, mipicfg->mode_flags);
> +}
> +



> +
> +	/* get hdcp support*/
> +	ret = of_property_read_u16(np, "ite,hdcp-version", &reg_val);

This one is also not defined.

> +	if (ret == 0) {
> +		it6162->en_hdcp = true;
> +		it6162->hdcp_version = reg_val;
> +		dev_info(dev, "HDCP version %x", it6162->hdcp_version);
> +

> +MODULE_AUTHOR("Pet Weng <pet.weng@ite.com.tw>");
> +MODULE_AUTHOR("Hermes Wu <Hermes.Wu@ite.com.tw>");
> +MODULE_DESCRIPTION("it6162 mipi to hdmi driver");

MIPI, HDMI.

> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
