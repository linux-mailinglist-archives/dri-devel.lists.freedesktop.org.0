Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BlF+OYDrpmmQaAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:09:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBF81F1149
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A33B10E820;
	Tue,  3 Mar 2026 14:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="odY8+8Q7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3aEEuf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3550110E823
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 14:09:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239moa83951858
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 14:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vA9LhWu4c+RxWCGc7dLNVetf
 L2EcqY9KkAYh6iDyUdc=; b=odY8+8Q7h6mFBSbGzMyefsQSplK4vPQHDTdhEeZu
 hNC+DfHogEfH8Kmi3tphAeAOvbwvzNJh5AbBoMdzLIUJCBSefcy4vR/LYu/dwdZQ
 Ud2Ks3G0Dn9yGzWghEUUPDAkd4gZO5Jg2ZnCu6PpEhWDhbDznco0Pqu8rJ9yHxSZ
 wfA7Ewkp9KuOr+U94Zpz1e0qO8oXCRcrE5oVEogCUI46pNammtq6BmPM3i1Lao5y
 Ew+vW7tY807G7K8Ale978o57ZT7zZyXEI07Y2sOLqd4ShWr59eDyK59R+dtIUjn9
 8EAjLDmcmTZCqMmQ3VVMt4VgOlqJIXF6Tc1qn7fCfWmdEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnu3n98ms-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 14:09:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb413d0002so4301108585a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 06:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772546939; x=1773151739;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vA9LhWu4c+RxWCGc7dLNVetfL2EcqY9KkAYh6iDyUdc=;
 b=N3aEEuf7iH7UzCvL+PjJUYjQHHvE1n503zY1ICH9GIoFklLXmfWXZRwQ4SVBQCUalM
 T19SIDbVsSmmx77b+jc1MWrFb/24rbKkQG+vasuiWs5aIfZUAYEi0D9Pr2IVbUENssYm
 NtIyb2PB9cc0baF+qkkGMumuZtJim/wATOTX25Hw8lc/MesrfkGNq2nB9jateeODZku/
 hh9nfU5CAfx8g1sggjfzDxmEbgmQS+N7J3MLSf4vFVU68HnsfshXcZb/YjxLFxXT1fGg
 KXrLSZPbBvzCcGrb6lvU4eWKxhqO3lhx1dmeTNfC1jXUbv4bZADI94OF98rPVclIdYZT
 Ga7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772546939; x=1773151739;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vA9LhWu4c+RxWCGc7dLNVetfL2EcqY9KkAYh6iDyUdc=;
 b=JyBq75KVBBCSRC8xNJhLtyhszCCyuGFmjxX9CWifwf9fMEPIdXhEsDXQNFBWThCLTl
 gosquXq/o8OFL6hDww09L7i34Ku26UFvL1Go0t6FpfV23SnYTPnZ+Wv/3u/G1hsdbcTO
 MY+1I9k+XKvHKX5ID5ZuetFLIKiEY0UkeBcA8RLoqHHCj8KKE5aNCNTYo7K903RwT6o2
 Jf+2KJm9hzEzFWuwNow2HdpPAlG+AwVHsJHhVOcvJObvk9E2b9nv7TrYdSYUAM2zf5vF
 7n3Lgua+FBr06cruDvKG/odl7NXND9IaWBaW0aKooI6lq6BpYQIVjrnUYDUUlWYg/aN8
 r0OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX04b7PiOTw5GlOoqIhXZ4Ty6BnAr/yNnyKpkQ7BNZj8c/e3iw4obu+xeIFR1PY1OUy1iE9SBSi9Yk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCKerGemdYPkrxligqcOMMY7wpTS4Pz9wG3989iZ7qn7UpdHYd
 NITb6gyY5cici57UHwmezaE3mM3L3mn4ChUomXxs4fzmKbBzE2/V4SjsKGRprpOewwQQGanV6Vw
 iPMrVsw41QueTkgBFk65EeT4d3Q4rNlpzVUrt2tT7p5AR0w+XNvIduU9Els+lefwgfD6VFLE=
X-Gm-Gg: ATEYQzzJ4bcbxTmWMqeKwfPnFw1tal6ghlUvQQcsofwtxr0ZMVy4LCgLEGQelJx9uGR
 lN5PrCkRE5inI2LK0qCHAQyzLplvZiPUnMd6qDU93Wl/GgOB7wbNw3eUDIZ8UbOjARBuIqfwhjI
 oB0HJnJM4ik34TousReNDl6yO5LS/fPJWiqV/31ZZN4l3SEzIGxK2RE+RcJW9QtzbhYu8ZBDGfs
 U9xl/KfoJZXaxaLmRDLxZefqbrAGV8xtaZTZkx3vdCoEw7jTtyKbgEee9SgZs3OhQ89VqiKo3vA
 M2+mhpPPGDvMcJtXhwtIztY+i79rvQRojDX+mM6MUROEC1ZKKSNr3e60cUI7IpVTb0ESDqquSD9
 9oEsTpt6/SbR3L1cWyn7rqq7dfBORG9bSUZyIYT73Ed3SKhz8NPtbDt+/FIdbdajFfrRF7pqgL5
 Ymzr/1ClIZBT5qfz58B5QJY49dbDXdva2ndLc=
X-Received: by 2002:a05:620a:400a:b0:8cb:5c90:dd6f with SMTP id
 af79cd13be357-8cd50bc2f3fmr245465985a.32.1772546939310; 
 Tue, 03 Mar 2026 06:08:59 -0800 (PST)
X-Received: by 2002:a05:620a:400a:b0:8cb:5c90:dd6f with SMTP id
 af79cd13be357-8cd50bc2f3fmr245459985a.32.1772546938750; 
 Tue, 03 Mar 2026 06:08:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2ffe01fsm32041621fa.26.2026.03.03.06.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 06:08:56 -0800 (PST)
Date: Tue, 3 Mar 2026 16:08:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 7/8] drm/msm/dpu: Add support for Eliza SoC
Message-ID: <tybhaz76xj6spq3kw3dys24ynx3unpvyimb2skmz2djofxr72d@rw5l475xjkth>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-7-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-7-814121dbb2bf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JaexbEKV c=1 sm=1 tr=0 ts=69a6eb7c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=zHWNXANJRpzq94LBRZAA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: CTyQto9pr1E-TQv8tnkKnni0cVu5vWcl
X-Proofpoint-GUID: CTyQto9pr1E-TQv8tnkKnni0cVu5vWcl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDExMiBTYWx0ZWRfX5rd1CIgMBD/N
 IuuejsDYpNWjYvuz63Q2+G9441799exVeMBmy/x8PB92yu/+QobH4ccGCfC4koCHjCH/fk1le8H
 y+ZuWK39WwqLku6WZJozaanj79hK9rmATUgtnrcygGudKUl4pOn+8Y/AZs4JnvKEa42ooWk4d2p
 adJN/eYu1BRx8r2ossvM6ORXj4veVsmDvXcPxMGubseiv8RUQikQpnx4DxIpRw/X603rGAZnvzU
 GjgiPYzv8xaeCdp8BG4uGEarGspj8MJ+6XZD0m2XSRDAQcKU9eiLtbpLaMyXLsRMAvh3rI3m19Q
 bcrxxW3WUxKTQYWUaPUDvZmis4+lem0TAVxdzsjfoquOgZizQBOFIZKngEK3vgzVUbLCjG69x53
 cN/3N1EnHPiBpVjaVVw/7pkLStTsmq05hCUieWJfVBflUGY1eyThvY13R9qfxuqPwAX3k9urCbK
 N296nAnkrxa8ckxXhlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030112
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
X-Rspamd-Queue-Id: 6FBF81F1149
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
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:57PM +0100, Krzysztof Kozlowski wrote:
> Add support for DPU (v12.4) on Qualcomm Eliza SoC, with one
> incomplete/skipped part: HDMI interface (INT_4).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 368 insertions(+)
> 
> +
> +static const struct dpu_mdp_cfg eliza_mdp = {
> +	.name = "top_0",
> +	.base = 0, .len = 0x494, // not verified

This is very weird to read, coming from Qualcomm employee. Were the rest
of data verified?

> +	.clk_ctrls = {
> +		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> +	},
> +};
> +

-- 
With best wishes
Dmitry
