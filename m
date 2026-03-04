Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F2TL+NBqGn8rgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:29:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F13E2017E6
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C7A10EA21;
	Wed,  4 Mar 2026 14:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJqCBfB0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQcGhfZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC8410EA1D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 14:29:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6249swl71213799
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 14:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lAM0lLkLhAfZCHZbUwD7qSCj
 DT4hN9TPL8tFOeuxmUI=; b=BJqCBfB0qKdEQVsK/2X15m5IXjAdc5KRuN8e/Xo4
 vi4ro0xCEUv6OFDzLXDcsh1/STs1snGMX+15LLxHZfJxfwCf+TNzMMBTaiDxHx1B
 TyTnKVtkQB6vGH22fa1F/HJKKMbYOqdVCtv2UGs/6X4pbaFWVNwNnnjixMPy33dh
 DJdZ/gu968JpVuKUCi7gx4Xp4egHOMt7R1dwm9EbFD8PDogFutbUUeUY+yzch3WN
 wU42V9A6qitW259GdmZK1mSiugBRJuzZJOhjwUSnB75h9/KFV0Aus2FO4e/Aho7b
 7Y/xWiMlB+f2RsJZ++3MTqkdwnDaUXf8HZ23eqnDwYuK9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5rrwt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 14:29:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-89a116bf0f8so94633296d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 06:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772634587; x=1773239387;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lAM0lLkLhAfZCHZbUwD7qSCjDT4hN9TPL8tFOeuxmUI=;
 b=EQcGhfZv8/swvwXoynaX9lf1zCRhvorXOF1HE8SxPEjVFnDQh1HzcLwYjdnU+i3c73
 0i+igAd9cLzSzs4fJoQsJeD54T1yuS0tKbx9F3RRzVtoIIfnilByL4NyHEdcr3MAPOKw
 PrU3lWoxVgtc9scYZ/sgj2zrXjkRDpcTtCsbP3MZdx9gzFLC2B+RmYHzaA0PDN8q/cGf
 RfEDa0F2XWqk4Mr2pABGiBq56DIIwry+y7F7ntewieRAHDFcKnxBSO99nqWS0uuaG7ul
 7FjV3rXxBITDFg5QReuKDSJLABs5QIHusYSt0zqfgvoeuRXQQPEgPBK+stCnkMTSoQaA
 25TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772634587; x=1773239387;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lAM0lLkLhAfZCHZbUwD7qSCjDT4hN9TPL8tFOeuxmUI=;
 b=fLd/VqkUBcloZqaM2DRR6Fxp001PtEO53MRNn/OPOVqg3RDmo/jpedDM2oDyAD+0fL
 oxXEd5HF7fBCngGRUUvQ6bBfTY600WExaOxpah0LpChNKNPS6FUjrzNRDHmBW1YjQiU6
 +65bb0Lci6kIDe+g2oMHh+exAisnTVznZ4qmxu9TOAAvwe8GgF5dEcC9vFbT7WHByMyQ
 402kW3614bc18QISD57VIAS81s4dAU50eYAn67tRCVqmWtiZzkZyzsKh4SAVcjbbE144
 AGtUinblU5odJ27rGQKcaVGzbihC/DlXFhmypFdqoL6ObzoCCqRPjRNi4YNbxs4DVzxY
 1EQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV59aC8Vci7l9uXl6iMDXSGJDS1a4Get8INdqnuAMNc8+TyZRa1At0THFnQKKrjvvMFrLOzgzqqyHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2t5nBarMV8pTl01uyCjvcWT8/yvFImWSvjhtvpr8kro0bX7Xp
 MRze0AxS+jCM2vFGxkA08JwTNE+m3IQYwIkeTyoHmpg/wVN4dy8tjXV2jKAk6CdY2V/bjFn0OAv
 qd3zAVk4uxqkooEfvnJPnP3qB1G3y8pBcOq3fYJsdnyyU75P6XOhWo87IhcIDoR6JB8RUGIM=
X-Gm-Gg: ATEYQzxWOGnaflB0s8hvOIRnDa1bahE/XLS6mA2mCzlr0mCTlj2gUi0QBkmQTJzp0Ti
 VIDaIkhfTWL8zlyK56u1dP+R9hwVxluiQ8WedX0bDAAX8GIJTkCz2AxWVJLdRD3QX9s5DNA4Nz7
 HUlvHKDsqIJWERIAi3f37zLL82P7lQVewKvwx0ykhUi6xldskDFuKmYx4XZKkuXMkz4KxWrCjwN
 U8f5zXu7t66HW6N72+mAaAUordwogmcPlKws3AwXJbdNAU2QHOg5M5zl1t6bEk/hjeZjx0GQlgs
 6i2W8+9tSkEkAjkJSDyCsldquPUgBX1IqxxKPDsCmpe6JXm5YFFo5NofPk2ftpWPUyls80C5e71
 iJqJFRda0iFT0GgVV5HnadAcwfFLqPszp3UehGiSt1pAcpM4pdRwnJXWQSpQ+MVUwk2Y7avr80+
 xygjkwFX1rFqlXnevCmRd7bY33awRxnR9turE=
X-Received: by 2002:a05:620a:28c6:b0:8b2:1ee9:dcfb with SMTP id
 af79cd13be357-8cd5aebf056mr239661185a.8.1772634587184; 
 Wed, 04 Mar 2026 06:29:47 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:8b2:1ee9:dcfb with SMTP id
 af79cd13be357-8cd5aebf056mr239655185a.8.1772634586679; 
 Wed, 04 Mar 2026 06:29:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f3016bf6sm36955351fa.32.2026.03.04.06.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 06:29:45 -0800 (PST)
Date: Wed, 4 Mar 2026 16:29:43 +0200
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
Subject: Re: [PATCH v2 7/8] drm/msm/dpu: Add support for Eliza SoC
Message-ID: <mo2fc5oalscfgagdrj67aa7xssnugsara4dartp4ycsdvoyvwv@swzmdnwtij6u>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-7-ea0579f62358@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-drm-display-eliza-v2-7-ea0579f62358@oss.qualcomm.com>
X-Proofpoint-GUID: fPOJEkyb0_cgV1WEgzlsJYSwEkw-3GzY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNyBTYWx0ZWRfXzDcQMqRn7BOX
 8+YlWv6HgQpUZCJHenqUmoz3fs2yE21V0NKLdCIEIyA82+INcqw72hUk6ODV1QM1LUJXA9Tgj9B
 d5sSVL3zVymQt6SoOz+eU62RFgST/YSk86vYfPLiEFvArX2L8ZZB8ySeIRJ1mBK4TQ588XCbac1
 IZVK6Jj+Kc1vSkVq2i5tAKS/Nt4gS9DcfplTHhnT+9lt53TwJ90nBKYU1SpmfywnC9lZnzwFh+Z
 RW5WEkhiC5LlzjEfLc9pfUtXSCS8baVPkWJW5Vt+kfYIyiHYkYAC4H9DYbOFimxIiWe4wq2CHS4
 Pv3beM6vQ8fJeqCJS/wxuITCvyzX+9mxrwPDyu5h9AKo3eRUA/K5sioXPtvDZPA7VMkanDZRUBP
 H7TSMQo+5K6Kp1Owh+BjN8UJY5t7S8XHJ2m/9K2nJ/JH4xSh++a28WtOF1e8XpnNs6kfM90t8wo
 2Hl9zvwl+ebUou+BgXQ==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a841db cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=QXpS1DXcpoi-XtrU5MQA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: fPOJEkyb0_cgV1WEgzlsJYSwEkw-3GzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040117
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
X-Rspamd-Queue-Id: 1F13E2017E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:58:49PM +0100, Krzysztof Kozlowski wrote:
> Add support for DPU (v12.4) on Qualcomm Eliza SoC, with one
> incomplete/skipped part: HDMI interface (INT_4).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Drop stale comment
> 2. Fix INTF_3 controller_id -> DP0 (Dmitry)
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 368 insertions(+)
> 
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x37000, .len = 0x4bc,
> +		.type = INTF_DP,

This should be INTF_NONE until we support MST.

> +		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +	}
> +};
> +

-- 
With best wishes
Dmitry
