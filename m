Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBmANxMjmGlNBgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 10:02:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D9D165FC9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 10:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778E410E064;
	Fri, 20 Feb 2026 09:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQscCiX0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U17BEVCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDE310E064
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 09:02:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61K5RtSq1805605
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 09:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MzeMV3zJR0Z3YOKmM8PGjhIS
 Ubswhlv1VXlUgwMvtzg=; b=nQscCiX0+x/nODtssTs+Pb/+xxAvW77Y6dH3yJ2t
 PPPaSjVSVra3Ms585wbXJQdiPGXBRp6MgKfbHTJ+uOzJaVqEF1roKydZiArxLfJZ
 EpvFSw2uuhPSszIVvdW4Ritub4vRehOZwuK+BkMWUQVulCvNgHv0WfLotM2DMlU7
 IDT1pVPKAOkMiYWM8bT1WYLxByBToBN65H8lZC5yVT1gNEG+ZyzmVxbR745BqInM
 0oDR0lg3+3xO/Av4cpITqWCAs2agIk4+FAwMAfip/nrsM7OyAo7E26qYJWQoQDBK
 TqCIJNW3xqG6lvwIpXrhNlJ3jkBumH4z/eqd0aIbEyF5lA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cedsns2jg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 09:02:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2a75a4fe597so9835465ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 01:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771578121; x=1772182921;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MzeMV3zJR0Z3YOKmM8PGjhISUbswhlv1VXlUgwMvtzg=;
 b=U17BEVCkgWWzeMK9tnTTr2iPIi+wF7VeS+zV7CCaLz0ZA8xkCg2iGjaA2hAIQ559iE
 L2Iw0UL2MyCJFjzT1mq/xUxyxIJEpUBXYzVtcmTp7HTGicF9/3x+BAEO8zMfmAwqX+Mj
 HDsdBDQQRsiJH3CbUqrox7MTSyiV0nledSDgZBQTvvNDzTqpXE8sRlo6U+pe020AuzZa
 pnuGUeLYAx/YZ1tFUa6hxh9KEoa+MdsgpLM8Pz2lrYIEQW4Eoz72saDFUr4tqSlVcHsp
 KXucujY6+jrYGwrNkK3MICK2kEYi7tmyfe9kdeKR0ebkEmkq/kJ4I0b5vulUeldu/xtj
 OHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771578121; x=1772182921;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MzeMV3zJR0Z3YOKmM8PGjhISUbswhlv1VXlUgwMvtzg=;
 b=G31fTIFlJIsp8JsO3wntbBekAhJvw8F2+rQIpR/m+R/JlewMT0GRsERI7uckEZqSba
 ByLd3KBTYDdJhL9WqpEZImC8gxrS90lI0HJN2HU6B6qxd2Y22SbXywEO2hGDxng2/aif
 T126k5jM6ciEwvcBch4doWuQqR0v0Ea68fPdeLmElxyTYvJBvGlbUmgo68HhxccaUzBc
 zJvCEhSkb1mD4IGWxdTSb3K7f8B8x8n+/J1ifUZZi63i5xUaCEVBzvDIiRmiCaOf5goq
 1/FL0fKxj5cmICvaI/EKi+R6P4JjVuYK8tvb20zKfiAfo5N20IpBMPoJZqvQlR9dSmu+
 kuCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQySHjVgR6cezq8A/CFNRMQm0LgBVUIrBjzke52X4qu+RlXDzZXCQsG43DgVkKzKYdV3bNG4phrvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUzFU5HlPxfZvDAdwJDLMHdCpbwbeK0NnUNM5xj6LPVYxRPM4z
 rz4NF/fvIjuRwfLqdhfS0aASb6UFZ2ORBETWvFeP/7IoqG9p6drakj0cWg03GnSepiWxAzg4tIg
 ZrbauVOS1F+iRwve2+zRBJIf5bwK3CaM0M0GDOKjDBohyXlsvlG/XNDM7Q5DehrGo2SR2dZE=
X-Gm-Gg: AZuq6aJO7Y5vTrRXr3yLsYpKVLCt5wudAD3eAmV56Al12MJk6N0RrIpfR8jP+aU71NL
 PnY5vpafWREMhFy7rdhPQvSQadSyiyrqRCPZjzLhyoFKIT2KuGJO1s+rMrf4S7ODPreRiV8KMH3
 UIZsgRUflOltQwLCPAdy44VJ+I55kD7KCaHguHWQUKGCoUPfdVq5eKxc9PxU7FRKq6BG2NBhI6e
 bKIEwkHPkeWjI0IfOCIsQBCQtlbwQYUeyOv/ExVgCXWlryL+9cpKWa2x8F6KT8NuIqaCJ+unMyF
 ovpeilqEaJCyG+tSxuG3ewj730Gbnoh9Oz3OvVWhhnX7DuzV5J2t5VKyi8ioyKQk61ZFhvZFbsd
 9994kGXKfCHqgks6u4fa3LH/3ldKEjEv4TwrVblXuc0QcdLXhT1wlBxzFfjd9TQUzNTB41VhyaE
 KT1cyRCk6BSjGtThQgty98bdccYNoVKePjSU9JyWWoVQ==
X-Received: by 2002:a17:903:1b63:b0:2a7:8bf3:5674 with SMTP id
 d9443c01a7336-2ab4cb003e4mr180464345ad.0.1771578120844; 
 Fri, 20 Feb 2026 01:02:00 -0800 (PST)
X-Received: by 2002:a17:903:1b63:b0:2a7:8bf3:5674 with SMTP id
 d9443c01a7336-2ab4cb003e4mr180464065ad.0.1771578120244; 
 Fri, 20 Feb 2026 01:02:00 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1aafb972sm173956445ad.88.2026.02.20.01.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 01:01:59 -0800 (PST)
Date: Fri, 20 Feb 2026 14:31:51 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony <syyang@lontium.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com,
 Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: add support for lontium lt8713sx
 bridge driver
Message-ID: <aZgi/2XQ3sAnHn5j@hu-vishsain-blr.qualcomm.com>
References: <20251228-lt8713sx-bridge-driver-v3-0-9169fbef0e5b@oss.qualcomm.com>
 <20251228-lt8713sx-bridge-driver-v3-2-9169fbef0e5b@oss.qualcomm.com>
 <ud4eneuxamylrbiaqr6d6ntoh52kk6aqr6rc2v7lu24lhulidg@sdruua7h4yxh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ud4eneuxamylrbiaqr6d6ntoh52kk6aqr6rc2v7lu24lhulidg@sdruua7h4yxh>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA3OCBTYWx0ZWRfX8WrAdqoJzfSW
 Us+4HGoggp62pIvw77g32Qsi67eMt7gW0Pta0amw6KJm/VVClu1uylUOMGZ3GiIW7lAzEtpClam
 apcE97nTAAVO/OENVEz1wHF8d/S+W4Gikau6DN3Rpe515wAitNidJ91wU6At1IinU/e5o/1bHef
 bxrKUh/Eim5ZHaII5JMaRb+u/xIru44LCKOh2obBAfHb6eHXP4KM8A+mBNaHXyh+ZMzmj8JFhpa
 YA25cFbipR3gw0ysK1xsUhbWP7bFbVuWPSY1Jih3u+TUIMiXs6roEb0NiHxXHLgwvRsDT14eeac
 jv8rpgMcbd1VxBQwZ4Vld4/J5eDQmkD5wLK12O4r/RrNKkBKB3cjllfRuQMpAsTq1DQuj8WHNst
 iKHZlnByp0RwJF8cm3QAhYQND1ubLYY1BXy7kFl6Z9rsg65FVCGuIzUExLQVvU/ZSmF1Ixwx7eW
 fVrSkNPG/rFcenQ2eZg==
X-Proofpoint-ORIG-GUID: l0EDvXKywZFII4W2WMusq5J-FDMiM29T
X-Authority-Analysis: v=2.4 cv=JsD8bc4C c=1 sm=1 tr=0 ts=69982309 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=o-hIJX-er_C3sSJ8K0IA:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: l0EDvXKywZFII4W2WMusq5J-FDMiM29T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200078
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lontium.com,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:syyang@lontium.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prahlad.valluru@oss.qualcomm.com,m:vvalluru@qti.qualcomm.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[lontium.com:query timed out,qualcomm.com:query timed out];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim,hu-vishsain-blr.qualcomm.com:mid,oss.qualcomm.com:dkim,lontium.com:email]
X-Rspamd-Queue-Id: 74D9D165FC9
X-Rspamd-Action: no action

On Sun, Dec 28, 2025 at 05:01:05PM +0200, Dmitry Baryshkov wrote:
> On Sun, Dec 28, 2025 at 05:10:40PM +0530, Vishnu Saini wrote:
> > The lt8713sx is a Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0 converter,
> > with three configurable DP1.4/HDMI2.0/DP++ output interfaces and
> > audio output interface.
> > 
> > Driver is required for firmware upgrade in the bridge chip.
> 
> Or for enabling the bridge chip. Or for building the bridge chains
> inside Linux kernel...
> 
> Also, do we need any special handling for DP++ / HDMI devices being
> attached to the bridge?
Needed to add minimal handling of drm_bridge in the driver when ports
and remote endpoints added in the dt.
The V1 patch was also working where drm_bridge was not added in driver
and ports remote endpoints not defined in the dt.
 
> > 
> > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig            |  10 +
> >  drivers/gpu/drm/bridge/Makefile           |   1 +
> >  drivers/gpu/drm/bridge/lontium-lt8713sx.c | 682 ++++++++++++++++++++++++++++++
> >  3 files changed, 693 insertions(+)
> > 
> > +
> > +#define FW_FILE "lt8713sx_fw.bin"
> 
> I'm still looking forward to seeing this file in linux-firmware.
raised a patch in linux-firmware: https://lore.kernel.org/all/20260217-lt8713sx_firmware-v1-1-f78b85fceb63@oss.qualcomm.com/

> > +
> > +#define REG_PAGE_CONTROL	0xff
> > +
> > +#define MAX_OUTPUT_PORTS	3
> > +#define LT8713SX_PAGE_SIZE	256
> > +
> > +DECLARE_CRC8_TABLE(lt8713sx_crc_table);
> > +
> > +struct lt8713sx {
> > +	struct device *dev;
> > +	struct drm_bridge bridge;
> > +	struct drm_bridge *next_bridge[MAX_OUTPUT_PORTS];
> > +	int num_outputs;
> > +
> > +	struct regmap *regmap;
> > +	/* Protects all accesses to registers by stopping the on-chip MCU */
> > +	struct mutex ocm_lock;
> > +
> > +	struct gpio_desc *reset_gpio;
> > +	struct gpio_desc *enable_gpio;
> > +
> > +	struct i2c_client *client;
> > +	const struct firmware *fw;
> > +
> > +	u8 *fw_buffer;
> > +
> > +	u32 main_crc_value;
> > +	u32 bank_crc_value[17];
> > +
> > +	int bank_num;
> > +};
> > +
> > +static void lt8713sx_reset(struct lt8713sx *lt8713sx);
> > +
> > +static const struct regmap_range lt8713sx_ranges[] = {
> > +	{
> > +		.range_min = 0x0000,
> > +		.range_max = 0xffff
> > +	},
> > +};
> > +
> > +static const struct regmap_access_table lt8713sx_table = {
> > +	.yes_ranges = lt8713sx_ranges,
> > +	.n_yes_ranges = ARRAY_SIZE(lt8713sx_ranges),
> > +};
> > +
> > +static const struct regmap_range_cfg lt8713sx_range_cfg = {
> > +	.name = "lt8713sx",
> > +	.range_min = 0x0000,
> > +	.range_max = 0xffff,
> > +	.selector_reg = REG_PAGE_CONTROL,
> > +	.selector_mask = 0xff,
> > +	.selector_shift = 0,
> > +	.window_start = 0,
> > +	.window_len = 0x100,
> > +};
> > +
> > +static const struct regmap_config lt8713sx_regmap_config = {
> > +	.reg_bits = 8,
> > +	.val_bits = 8,
> > +	.volatile_table = &lt8713sx_table,
> > +	.ranges = &lt8713sx_range_cfg,
> > +	.num_ranges = 1,
> > +	.cache_type = REGCACHE_NONE,
> > +	.max_register = 0xffff,
> > +};
> > +
> > +static void lt8713sx_i2c_enable(struct lt8713sx *lt8713sx)
> > +{
> > +	regmap_write(lt8713sx->regmap, 0xe0ee, 0x01);
> > +}
> > +
> > +static void lt8713sx_i2c_disable(struct lt8713sx *lt8713sx)
> > +{
> > +	regmap_write(lt8713sx->regmap, 0xe0ee, 0x00);
> > +}
> > +
> > +static u32 calculate_crc(const u8 *upgrade_data, u64 len, u64 crc_size)
> > +{
> > +	u8 crc = 0x00;
> > +	u8 pad = 0xff;
> > +
> > +	crc = crc8(lt8713sx_crc_table, upgrade_data, len, crc);
> > +
> > +	/* pad remaining bytes */
> > +	crc_size -= len;
> > +	while (crc_size--)
> > +		crc = crc8(lt8713sx_crc_table, &pad, 1, crc);
> 
> As I wrote before, you are basically calculating the CRC over the padded
> buffer. Please pad the buffer and calculate it over the whole buffer
> rather than doing this byte by byte.
yes, will fix this in the next patch.
 
> > +
> > +	return crc;
> > +}
> > +
> > +static int lt8713sx_prepare_firmware_data(struct lt8713sx *lt8713sx)
> > +{
> > +	int ret = 0;
> > +	u64 sz_12k = 12 * SZ_1K;
> > +
> > +	ret = request_firmware(&lt8713sx->fw, FW_FILE, lt8713sx->dev);
> > +	if (ret < 0) {
> > +		dev_err(lt8713sx->dev, "request firmware failed\n");
> > +		return ret;
> > +	}
> > +
> > +	dev_dbg(lt8713sx->dev, "Firmware size: %zu bytes\n", lt8713sx->fw->size);
> > +
> > +	if (lt8713sx->fw->size > SZ_256K - 1) {
> > +		dev_err(lt8713sx->dev, "Firmware size exceeds 256KB limit\n");
> > +		release_firmware(lt8713sx->fw);
> > +		return -EINVAL;
> > +	}
> > +
> > +	lt8713sx->fw_buffer = kvmalloc(SZ_256K, GFP_KERNEL);
> > +	if (!lt8713sx->fw_buffer) {
> > +		release_firmware(lt8713sx->fw);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	memset(lt8713sx->fw_buffer, 0xff, SZ_256K);
> > +
> > +	if (lt8713sx->fw->size < SZ_64K) {
> > +		memcpy(lt8713sx->fw_buffer, lt8713sx->fw->data, lt8713sx->fw->size);
> > +		lt8713sx->fw_buffer[SZ_64K - 1] =
> > +				calculate_crc(lt8713sx->fw->data, lt8713sx->fw->size, SZ_64K - 1);
> > +		lt8713sx->main_crc_value = lt8713sx->fw_buffer[SZ_64K - 1];
> > +		dev_dbg(lt8713sx->dev,
> > +			"Main Firmware Data  Crc=0x%02X\n", lt8713sx->main_crc_value);
> > +
> > +	} else {
> > +		/* main firmware */
> > +		memcpy(lt8713sx->fw_buffer, lt8713sx->fw->data, SZ_64K - 1);
> > +		lt8713sx->fw_buffer[SZ_64K - 1] =
> > +				calculate_crc(lt8713sx->fw_buffer, SZ_64K - 1, SZ_64K - 1);
> > +		lt8713sx->main_crc_value = lt8713sx->fw_buffer[SZ_64K - 1];
> > +		dev_dbg(lt8713sx->dev,
> > +			"Main Firmware Data  Crc=0x%02X\n", lt8713sx->main_crc_value);
> > +
> > +		/* bank firmware */
> > +		memcpy(lt8713sx->fw_buffer + SZ_64K,
> > +		       lt8713sx->fw->data + SZ_64K,
> > +		       lt8713sx->fw->size - SZ_64K);
> > +
> > +		lt8713sx->bank_num = (lt8713sx->fw->size - SZ_64K + sz_12k - 1) / sz_12k;
> > +		dev_dbg(lt8713sx->dev, "Bank Number Total is %d.\n", lt8713sx->bank_num);
> > +
> > +		for (int i = 0; i < lt8713sx->bank_num; i++) {
> > +			lt8713sx->bank_crc_value[i] =
> > +				calculate_crc(lt8713sx->fw_buffer + SZ_64K + i * sz_12k,
> > +					      sz_12k, sz_12k);
> > +			dev_dbg(lt8713sx->dev, "Bank number:%d; Firmware Data  Crc:0x%02X\n",
> > +				i, lt8713sx->bank_crc_value[i]);
> > +		}
> > +	}
> > +	return 0;
> > +}
> > +
> > +static void lt8713sx_config_parameters(struct lt8713sx *lt8713sx)
> > +{
> > +	regmap_write(lt8713sx->regmap, 0xe0ee, 0x01);
> > +	regmap_write(lt8713sx->regmap, 0xe05e, 0xc1);
> > +	regmap_write(lt8713sx->regmap, 0xe058, 0x00);
> > +	regmap_write(lt8713sx->regmap, 0xe059, 0x50);
> > +	regmap_write(lt8713sx->regmap, 0xe05a, 0x10);
> > +	regmap_write(lt8713sx->regmap, 0xe05a, 0x00);
> > +	regmap_write(lt8713sx->regmap, 0xe058, 0x21);
> > +}
> > +
> > +static void lt8713sx_wren(struct lt8713sx *lt8713sx)
> > +{
> > +	regmap_write(lt8713sx->regmap, 0xe103, 0xbf);
> > +	regmap_write(lt8713sx->regmap, 0xe103, 0xff);
> > +	regmap_write(lt8713sx->regmap, 0xe05a, 0x04);
> > +	regmap_write(lt8713sx->regmap, 0xe05a, 0x00);
> > +}
> > +
> > +static void lt8713sx_wrdi(struct lt8713sx *lt8713sx)
> > +{
> > +	regmap_write(lt8713sx->regmap, 0xe05a, 0x08);
> > +	regmap_write(lt8713sx->regmap, 0xe05a, 0x00);
> > +}
> > +
> > +static void lt8713sx_fifo_reset(struct lt8713sx *lt8713sx)
> > +{
> > +	regmap_write(lt8713sx->regmap, 0xe103, 0xbf);
> > +	regmap_write(lt8713sx->regmap, 0xe103, 0xff);
> > +}
> > +
> > +static void lt8713sx_disable_sram_write(struct lt8713sx *lt8713sx)
> > +{
> > +	regmap_write(lt8713sx->regmap, 0xe055, 0x00);
> > +}
> > +
> > +static void lt8713sx_sram_to_flash(struct lt8713sx *lt8713sx)
> > +{
> > +	regmap_write(lt8713sx->regmap, 0xe05a, 0x30);
> > +	regmap_write(lt8713sx->regmap, 0xe05a, 0x00);
> > +}
> > +
> > +static void lt8713sx_i2c_to_sram(struct lt8713sx *lt8713sx)
> > +{
> > +	regmap_write(lt8713sx->regmap, 0xe055, 0x80);
> > +	regmap_write(lt8713sx->regmap, 0xe05e, 0xc0);
> > +	regmap_write(lt8713sx->regmap, 0xe058, 0x21);
> > +}
> > +
> > +static u8 lt8713sx_read_flash_status(struct lt8713sx *lt8713sx)
> > +{
> > +	u32 flash_status = 0;
> > +
> > +	regmap_write(lt8713sx->regmap,  0xe103, 0x3f);
> > +	regmap_write(lt8713sx->regmap,  0xe103, 0xff);
> > +
> > +	regmap_write(lt8713sx->regmap,  0xe05e, 0x40);
> > +	regmap_write(lt8713sx->regmap,  0xe056, 0x05); /* opcode=read status register */
> > +	regmap_write(lt8713sx->regmap,  0xe055, 0x25);
> > +	regmap_write(lt8713sx->regmap,  0xe055, 0x01);
> > +	regmap_write(lt8713sx->regmap,  0xe058, 0x21);
> > +
> > +	regmap_read(lt8713sx->regmap, 0xe05f, &flash_status);
> > +	dev_dbg(lt8713sx->dev, "flash_status:%x\n", flash_status);
> > +
> > +	return flash_status;
> > +}
> > +
> > +static void lt8713sx_block_erase(struct lt8713sx *lt8713sx)
> > +{
> > +	u32 i = 0;
> > +	u8 flash_status = 0;
> > +	u8 blocknum = 0x00;
> > +	u32 flashaddr = 0x00;
> > +
> > +	for (blocknum = 0; blocknum < 8; blocknum++) {
> > +		flashaddr = blocknum * SZ_32K;
> > +		regmap_write(lt8713sx->regmap,  0xe0ee, 0x01);
> 
> lt8713sx_i2c_enable() ? Why is it set again?
Right, it is set again in lt8713sx_config_parameters(), lt8713sx_block_erase()
and couple of more places, could be redundant.
Will try removing it.
 
> > +		regmap_write(lt8713sx->regmap,  0xe05a, 0x04);
> > +		regmap_write(lt8713sx->regmap,  0xe05a, 0x00);
> > +		regmap_write(lt8713sx->regmap,  0xe05b, flashaddr >> 16);
> > +		regmap_write(lt8713sx->regmap,  0xe05c, flashaddr >> 8);
> > +		regmap_write(lt8713sx->regmap,  0xe05d, flashaddr);
> > +		regmap_write(lt8713sx->regmap,  0xe05a, 0x01);
> > +		regmap_write(lt8713sx->regmap,  0xe05a, 0x00);
> > +		msleep(100);
> > +		i = 0;
> > +		while (1) {
> > +			flash_status = lt8713sx_read_flash_status(lt8713sx);
> > +			if ((flash_status & 0x01) == 0)
> > +				break;
> > +
> > +			if (i > 50)
> > +				break;
> > +
> > +			i++;
> > +			msleep(50);
> > +		}
> > +	}
> > +	dev_dbg(lt8713sx->dev, "erase flash done.\n");
> > +}
> > +
> > +static void lt8713sx_load_main_fw_to_sram(struct lt8713sx *lt8713sx)
> > +{
> > +	regmap_write(lt8713sx->regmap, 0xe0ee, 0x01);
> > +	regmap_write(lt8713sx->regmap, 0xe068, 0x00);
> > +	regmap_write(lt8713sx->regmap, 0xe069, 0x00);
> > +	regmap_write(lt8713sx->regmap, 0xe06a, 0x00);
> > +	regmap_write(lt8713sx->regmap, 0xe065, 0x00);
> > +	regmap_write(lt8713sx->regmap, 0xe066, 0xff);
> > +	regmap_write(lt8713sx->regmap, 0xe067, 0xff);
> > +	regmap_write(lt8713sx->regmap, 0xe06b, 0x00);
> > +	regmap_write(lt8713sx->regmap, 0xe06c, 0x00);
> > +	regmap_write(lt8713sx->regmap, 0xe060, 0x01);
> > +	msleep(200);
> > +	regmap_write(lt8713sx->regmap, 0xe060, 0x00);
> > +}
> > +
> > +static void lt8713sx_load_bank_fw_to_sram(struct lt8713sx *lt8713sx, u64 addr)
> > +{
> > +	regmap_write(lt8713sx->regmap, 0xe0ee, 0x01);
> > +	regmap_write(lt8713sx->regmap, 0xe068, ((addr & 0xff0000) >> 16));
> > +	regmap_write(lt8713sx->regmap, 0xe069, ((addr & 0x00ff00) >> 8));
> > +	regmap_write(lt8713sx->regmap, 0xe06a, (addr & 0x0000ff));
> > +	regmap_write(lt8713sx->regmap, 0xe065, 0x00);
> > +	regmap_write(lt8713sx->regmap, 0xe066, 0x30);
> > +	regmap_write(lt8713sx->regmap, 0xe067, 0x00);
> > +	regmap_write(lt8713sx->regmap, 0xe06b, 0x00);
> > +	regmap_write(lt8713sx->regmap, 0xe06c, 0x00);
> > +	regmap_write(lt8713sx->regmap, 0xe060, 0x01);
> > +	msleep(50);
> > +	regmap_write(lt8713sx->regmap, 0xe060, 0x00);
> > +}
> > +
> > +static int lt8713sx_write_data(struct lt8713sx *lt8713sx, const u8 *data, u64 filesize)
> > +{
> > +	int page = 0, num = 0, i = 0, val;
> > +
> > +	page = (filesize % LT8713SX_PAGE_SIZE) ?
> > +			((filesize / LT8713SX_PAGE_SIZE) + 1) : (filesize / LT8713SX_PAGE_SIZE);
> > +
> > +	dev_dbg(lt8713sx->dev,
> > +		"Writing to Sram=%u pages, total size = %llu bytes\n", page, filesize);
> > +
> > +	for (num = 0; num < page; num++) {
> > +		dev_dbg(lt8713sx->dev, "page[%d]\n", num);
> > +		lt8713sx_i2c_to_sram(lt8713sx);
> > +
> > +		for (i = 0; i < LT8713SX_PAGE_SIZE; i++) {
> > +			if ((num * LT8713SX_PAGE_SIZE + i) < filesize)
> > +				val = *(data + (num * LT8713SX_PAGE_SIZE + i));
> > +			else
> > +				val = 0xff;
> > +			regmap_write(lt8713sx->regmap, 0xe059, val);
> > +		}
> > +
> > +		lt8713sx_wren(lt8713sx);
> > +		lt8713sx_sram_to_flash(lt8713sx);
> > +	}
> > +
> > +	lt8713sx_wrdi(lt8713sx);
> > +	lt8713sx_disable_sram_write(lt8713sx);
> > +
> > +	return 0;
> > +}
> > +
> > +static void lt8713sx_main_upgrade_result(struct lt8713sx *lt8713sx)
> > +{
> > +	u32 main_crc_result;
> > +
> > +	regmap_read(lt8713sx->regmap, 0xe023, &main_crc_result);
> > +
> > +	dev_dbg(lt8713sx->dev, "Main CRC HW: 0x%02X\n", main_crc_result);
> > +	dev_dbg(lt8713sx->dev, "Main CRC FW: 0x%02X\n", lt8713sx->main_crc_value);
> > +
> > +	if (main_crc_result == lt8713sx->main_crc_value)
> > +		dev_dbg(lt8713sx->dev, "Main Firmware Upgrade Success.\n");
> > +	else
> > +		dev_err(lt8713sx->dev, "Main Firmware Upgrade Failed.\n");
> > +}
> > +
> > +static void lt8713sx_bank_upgrade_result(struct lt8713sx *lt8713sx, u8 banknum)
> > +{
> > +	u32 bank_crc_result;
> > +
> > +	regmap_read(lt8713sx->regmap, 0xe023, &bank_crc_result);
> > +
> > +	dev_dbg(lt8713sx->dev, "Bank %d CRC Result: 0x%02X\n", banknum, bank_crc_result);
> > +
> > +	if (bank_crc_result == lt8713sx->bank_crc_value[banknum])
> > +		dev_dbg(lt8713sx->dev, "Bank %d Firmware Upgrade Success.\n", banknum);
> > +	else
> > +		dev_err(lt8713sx->dev, "Bank %d Firmware Upgrade Failed.\n", banknum);
> > +}
> > +
> > +static void lt8713sx_bank_result_check(struct lt8713sx *lt8713sx)
> > +{
> > +	int i;
> > +	u64 addr = 0x010000;
> > +
> > +	for (i = 0; i < lt8713sx->bank_num; i++) {
> > +		lt8713sx_load_bank_fw_to_sram(lt8713sx, addr);
> > +		lt8713sx_bank_upgrade_result(lt8713sx, i);
> > +		addr += 0x3000;
> > +	}
> > +}
> > +
> > +static int lt8713sx_firmware_upgrade(struct lt8713sx *lt8713sx)
> > +{
> > +	int ret;
> > +
> > +	lt8713sx_config_parameters(lt8713sx);
> > +
> > +	lt8713sx_block_erase(lt8713sx);
> > +
> > +	if (lt8713sx->fw->size < SZ_64K) {
> > +		ret = lt8713sx_write_data(lt8713sx, lt8713sx->fw_buffer, SZ_64K);
> > +		if (ret < 0) {
> > +			dev_err(lt8713sx->dev, "Failed to write firmware data: %d\n", ret);
> > +			return ret;
> > +		}
> > +	} else {
> > +		ret = lt8713sx_write_data(lt8713sx, lt8713sx->fw_buffer, lt8713sx->fw->size);
> > +		if (ret < 0) {
> > +			dev_err(lt8713sx->dev, "Failed to write firmware data: %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +	dev_dbg(lt8713sx->dev, "Write Data done.\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static int lt8713sx_firmware_update(struct lt8713sx *lt8713sx)
> > +{
> > +	int ret = 0;
> > +
> > +	mutex_lock(&lt8713sx->ocm_lock);
> > +	lt8713sx_i2c_enable(lt8713sx);
> > +
> > +	ret = lt8713sx_prepare_firmware_data(lt8713sx);
> > +	if (ret < 0) {
> > +		dev_err(lt8713sx->dev, "Failed to prepare firmware data: %d\n", ret);
> > +		goto error;
> > +	}
> > +
> > +	ret = lt8713sx_firmware_upgrade(lt8713sx);
> > +	if (ret < 0) {
> > +		dev_err(lt8713sx->dev, "Upgrade failure.\n");
> > +		goto error;
> > +	} else {
> > +		/* Validate CRC */
> > +		lt8713sx_load_main_fw_to_sram(lt8713sx);
> > +		lt8713sx_main_upgrade_result(lt8713sx);
> > +		lt8713sx_wrdi(lt8713sx);
> > +		lt8713sx_fifo_reset(lt8713sx);
> > +		lt8713sx_bank_result_check(lt8713sx);
> > +		lt8713sx_wrdi(lt8713sx);
> > +	}
> > +
> > +error:
> > +	lt8713sx_i2c_disable(lt8713sx);
> > +	if (!ret)
> > +		lt8713sx_reset(lt8713sx);
> > +
> > +	kvfree(lt8713sx->fw_buffer);
> > +	lt8713sx->fw_buffer = NULL;
> > +
> > +	if (lt8713sx->fw) {
> > +		release_firmware(lt8713sx->fw);
> > +		lt8713sx->fw = NULL;
> > +	}
> > +	mutex_unlock(&lt8713sx->ocm_lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static void lt8713sx_reset(struct lt8713sx *lt8713sx)
> > +{
> > +	dev_dbg(lt8713sx->dev, "reset bridge.\n");
> > +	gpiod_set_value_cansleep(lt8713sx->reset_gpio, 1);
> > +	msleep(20);
> > +
> > +	gpiod_set_value_cansleep(lt8713sx->reset_gpio, 0);
> > +	msleep(20);
> > +
> > +	dev_dbg(lt8713sx->dev, "reset done.\n");
> > +}
> > +
> > +static int lt8713sx_regulator_enable(struct lt8713sx *lt8713sx)
> > +{
> > +	int ret;
> > +
> > +	ret = devm_regulator_get_enable(lt8713sx->dev, "vdd");
> > +	if (ret < 0)
> > +		return dev_err_probe(lt8713sx->dev, ret, "failed to enable vdd regulator\n");
> > +
> > +	usleep_range(1000, 10000);
> > +
> > +	ret = devm_regulator_get_enable(lt8713sx->dev, "vcc");
> > +	if (ret < 0)
> > +		return dev_err_probe(lt8713sx->dev, ret, "failed to enable vcc regulator\n");
> > +	return 0;
> > +}
> > +
> > +static int lt8713sx_bridge_attach(struct drm_bridge *bridge,
> > +				  struct drm_encoder *encoder,
> > +				  enum drm_bridge_attach_flags flags)
> > +{
> > +	struct lt8713sx *lt8713sx = container_of(bridge, struct lt8713sx, bridge);
> > +	int i, ret;
> > +
> > +	for (i = 0; i < lt8713sx->num_outputs; i++) {
> > +		if (!lt8713sx->next_bridge[i])
> > +			continue;
> > +
> > +		ret = drm_bridge_attach(encoder,
> > +					lt8713sx->next_bridge[i],
> > +					bridge, flags);
> 
> This wasn't really tested. This code will not result in what you intend
> to do here. Each next bridge should have its own encoder / bridge chain.
This patch is working, might be because lt8713sx itself provides 3edp output from 1edp.
I am trying to attach all next bridges to the one previous in chain.
I will try to attach a single next_bridge in next patch.

> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int lt8713sx_get_ports(struct lt8713sx *lt8713sx)
> > +{
> > +	struct device *dev = lt8713sx->dev;
> > +	struct device_node *port, *ports, *ep, *remote;
> > +	int i = 0;
> > +	u32 reg;
> > +
> > +	ports = of_get_child_by_name(dev->of_node, "ports");
> > +	if (!ports)
> > +		return -ENODEV;
> > +
> > +	for_each_child_of_node(ports, port) {
> > +		if (of_property_read_u32(port, "reg", &reg))
> > +			continue;
> > +
> > +		if (reg == 0)
> > +			continue;
> > +
> > +		if (i >= ARRAY_SIZE(lt8713sx->next_bridge)) {
> > +			of_node_put(port);
> > +			break;
> > +		}
> > +
> > +		ep = of_graph_get_next_endpoint(port, NULL);
> > +		if (!ep)
> > +			continue;
> > +
> > +		remote = of_graph_get_remote_port_parent(ep);
> > +		of_node_put(ep);
> 
> And this misses the of_device_is_available() check. Please use
> drm_of_find_panel_or_bridge().
yes, Will fix in next patch.
 
> > +
> > +		if (!remote)
> > +			continue;
> > +
> > +		lt8713sx->next_bridge[i] = of_drm_find_bridge(remote);
> > +		of_node_put(remote);
> > +		if (lt8713sx->next_bridge[i])
> > +			i++;
> 
> And if not, the driver should be returning -EPROBE_DEFER.
Will fix in next patch.
 
> > +	}
> > +	lt8713sx->num_outputs = i;
> > +	dev_dbg(dev, "Enabled %d output ports", i);
> > +
> > +	of_node_put(ports);
> > +	return 0;
> > +};
> > +
> > +static int lt8713sx_gpio_init(struct lt8713sx *lt8713sx)
> > +{
> > +	struct device *dev = lt8713sx->dev;
> > +
> > +	lt8713sx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(lt8713sx->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(lt8713sx->reset_gpio),
> > +				     "failed to acquire reset gpio\n");
> > +
> > +	/* power enable gpio */
> > +	lt8713sx->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(lt8713sx->enable_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(lt8713sx->enable_gpio),
> > +				     "failed to acquire enable gpio\n");
> > +	return 0;
> > +}
> > +
> > +static ssize_t lt8713sx_firmware_store(struct device *dev,
> > +				       struct device_attribute *attr,
> > +				       const char *buf, size_t len)
> > +{
> > +	struct lt8713sx *lt8713sx = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = lt8713sx_firmware_update(lt8713sx);
> > +	if (ret < 0)
> > +		return ret;
> > +	return len;
> > +}
> > +
> > +static DEVICE_ATTR_WO(lt8713sx_firmware);
> > +
> > +static struct attribute *lt8713sx_attrs[] = {
> > +	&dev_attr_lt8713sx_firmware.attr,
> > +	NULL,
> > +};
> > +
> > +static const struct attribute_group lt8713sx_attr_group = {
> > +	.attrs = lt8713sx_attrs,
> > +};
> > +
> > +static const struct attribute_group *lt8713sx_attr_groups[] = {
> > +	&lt8713sx_attr_group,
> > +	NULL,
> > +};
> > +
> > +static const struct drm_bridge_funcs lt8713sx_bridge_funcs = {
> > +	.attach = lt8713sx_bridge_attach,
> > +};
> > +
> > +static int lt8713sx_probe(struct i2c_client *client)
> > +{
> > +	struct lt8713sx *lt8713sx;
> > +	struct device *dev = &client->dev;
> > +	int ret;
> > +
> > +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> > +		return dev_err_probe(dev, -ENODEV, "device doesn't support I2C\n");
> > +
> > +	lt8713sx = devm_drm_bridge_alloc(dev, struct lt8713sx, bridge, &lt8713sx_bridge_funcs);
> > +	if (IS_ERR(lt8713sx))
> > +		return PTR_ERR(lt8713sx);
> > +
> > +	lt8713sx->dev = dev;
> > +	lt8713sx->client = client;
> > +	i2c_set_clientdata(client, lt8713sx);
> > +
> > +	ret = devm_mutex_init(lt8713sx->dev, &lt8713sx->ocm_lock);
> > +	if (ret)
> > +		return ret;
> > +
> > +	lt8713sx->regmap = devm_regmap_init_i2c(client, &lt8713sx_regmap_config);
> > +	if (IS_ERR(lt8713sx->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(lt8713sx->regmap), "regmap i2c init failed\n");
> > +
> > +	ret = lt8713sx_get_ports(lt8713sx);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = lt8713sx_gpio_init(lt8713sx);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = lt8713sx_regulator_enable(lt8713sx);
> > +	if (ret)
> > +		return ret;
> > +
> > +	lt8713sx_reset(lt8713sx);
> > +
> > +	lt8713sx->bridge.funcs = &lt8713sx_bridge_funcs;
> > +	lt8713sx->bridge.of_node = dev->of_node;
> > +	lt8713sx->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> > +	drm_bridge_add(&lt8713sx->bridge);
> > +
> > +	crc8_populate_msb(lt8713sx_crc_table, 0x31);
> > +
> > +	return 0;
> > +}
> > +
> > +static void lt8713sx_remove(struct i2c_client *client)
> > +{
> > +	struct lt8713sx *lt8713sx = i2c_get_clientdata(client);
> > +
> > +	drm_bridge_remove(&lt8713sx->bridge);
> > +}
> > +
> > +static struct i2c_device_id lt8713sx_id[] = {
> > +	{ "lontium,lt8713sx", 0 },
> > +	{ /* sentinel */ }
> > +};
> > +
> > +static const struct of_device_id lt8713sx_match_table[] = {
> > +	{ .compatible = "lontium,lt8713sx" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, lt8713sx_match_table);
> > +
> > +static struct i2c_driver lt8713sx_driver = {
> > +	.driver = {
> > +		.name = "lt8713sx",
> > +		.of_match_table = lt8713sx_match_table,
> > +		.dev_groups = lt8713sx_attr_groups,
> > +	},
> > +	.probe = lt8713sx_probe,
> > +	.remove = lt8713sx_remove,
> > +	.id_table = lt8713sx_id,
> > +};
> > +
> > +module_i2c_driver(lt8713sx_driver);
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("lt8713sx drm bridge driver");
> > +MODULE_AUTHOR("Tony <syyang@lontium.com>");
> > +MODULE_FIRMWARE(FW_FILE);
> > 
> > -- 
> > 2.34.1
> > 
Sorry maintainers for delay in response.
I was on travel and than went on leave for a couple of weeks. Will be dedicately work on this now.
 
> -- 
> With best wishes
> Dmitry
