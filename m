Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLCpAfaTqWmKAQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:32:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAFA213813
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E3F10EC4D;
	Thu,  5 Mar 2026 14:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBxqYvA9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLJ/FS9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471A210EC4D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 14:32:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFhP11783458
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 14:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Z9t7wjwaSPH7MTmoJHEvGf2G
 IFWMJMag1Lhetr+FOmc=; b=dBxqYvA9e1DoQUi6qOJNdncGEpxiiTsPE9Syg08Q
 bbyR0WngQzLWCYNZB34JATCS8+MgaxS+p0ODRlF7yMDi8FGmtbbm3jZTaUFhlk8h
 +MIsHiNZGiY+k+c1OkHBKy4jJ3bLoH9rHXl2I8/dZQ87an4SMMkmaI9ZDq+E/PE1
 f61/fNg/Cd7WcBWsZSNRb7Ziz2pGlA2vaylzVLZ6XmV+jS5sIbbWtEIJRpF2Qcoi
 GHt8uk2gLRGLRMggO9p0JvlZTuHNVANXBsvtedmhrtz1Qme8TOPPPlhga/vC2VqK
 Yo43iSycI8fIdr4JtpryUPbc5GxaCDG0TdF9WWKhNGvSLA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk22d9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 14:32:17 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-56ab23e4698so47836471e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 06:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772721137; x=1773325937;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9t7wjwaSPH7MTmoJHEvGf2GIFWMJMag1Lhetr+FOmc=;
 b=TLJ/FS9tQDSWzr/YxVRyk9niwR9StCLd6p7eqik/Vk2aRGK935Vd7VfocP1iQm+/Hz
 kd0+u+Jz5gXDFrC15sZZxZBXyFNROkskFzI/6GVI21eyaq2fAfNx1qhpsQ0p0W0Z6iW1
 QYMtFFLneegdWgS5zvnPtpjMUqc/BDZU+2GXHotjG/6j+d5cuMk/DCA4XpGNGBlembp2
 zbppZSDrHZyL4PusLLJRzIFzRDtWdCaiCoBiuJSjsgABGB/yMpkmBTaS3Kplw/MTPDtr
 DmGecTSWN1SHqR9oajFzqpTsY1KQ3T0ZaP13qs0kCR8uQ24qBFKlg1AwylxwtwR9fp9h
 ah2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772721137; x=1773325937;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z9t7wjwaSPH7MTmoJHEvGf2GIFWMJMag1Lhetr+FOmc=;
 b=GaFM7AZT6g1JI7kqJ4wgXahLuTT09nH53E1F5TiVgEC/IiXAhcIcRQyGCOij8VoqbY
 xfHxiRI8rYT1jOiKsKinYQYLQII24j5UphegZjtKZx21Vt2bTOTJXF1Rq8AZ0/qnNSlL
 ooF4BflKsvOzsiYtGeK01b8gqg4rJOrU7w/Dcmm6htaH4AritPTGYBKfh7DKwjddgvE7
 hu36Z3Q6LhO0gEnj8dfujxRx7AofNhJC9WYMNqrZ6TgiL1mu69fRmXfjXbzpnWGzROOY
 waCtRBg4x/R8Q46fLUtAyaHyjVvSabKCNNXyWrdtRywx9/dp/5JQVy2Z2dixzPopsfSf
 oc8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSbAMBCG3iAtwacsyeQHKZGPBNk2H8xvwdK8cnJzrQuv8gkRs0CNelHCj1i1XvPDMsGI1XS77fdbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0Ko122K10RJuHPGNrDy3omPqSUpgIdjATagrXwIwL6GPylety
 Xw1NUqnR/WAa/CyRe6DuvMPFBPeKjhmS4lgmK7sF3kzO5oUefc9Gx8ItjTTwJHxlW5q4Bm7UuWo
 VxDXnDflD1Kmz3UhljPpwP/igq8AdcX+FoAzkNHIhby/VU0IOt1iSQB3s/lpVaPUfVCPNuZA=
X-Gm-Gg: ATEYQzxS1bV/2RkDNHY8ecdXF9yuL4eyPkQrIHlons0RODv5veRqtjtIHQfLrLQ3Aj1
 qZzrefgIIlNVbc9uvfaIeem7jS8PW0U8eP1RRRQ4ocr0Jl3q19jP18u5tAIaDkYTCCWnDZ1y/N0
 9WZ6PJqGmE9Et55T52EAmkVikX7vrvm7KhvKulNZOjwbGOiK9RG97fCLcw6i7bfywohR+dZovI9
 99KbGt4949LZvUA+8Np7MrkAFAlYAcC9oB1tBDe/NkZaUscPyNrapmg1Lo4yrPDGBV7txl4pDv/
 c3Cp/tbfq+D+4GRhdE6Tg2HrCssahJyMMPa0upZPq4Sxs16u04dFXm+AhgKaZ1LGDf+jGpLpjBl
 N4o6v7xc8ume9bQj5aoUiJFqUHDBCTsuGJ+k78h52Rp9vcpJIPqYZJy/WQ9hJp3BnDcnfvGFY+C
 TOYdFNxkfwku1DUVFHs6/RMRd1AcZdji25MBQ=
X-Received: by 2002:a05:6122:ec7:b0:56a:92d8:785a with SMTP id
 71dfb90a1353d-56ae77a2c83mr2575240e0c.15.1772721136788; 
 Thu, 05 Mar 2026 06:32:16 -0800 (PST)
X-Received: by 2002:a05:6122:ec7:b0:56a:92d8:785a with SMTP id
 71dfb90a1353d-56ae77a2c83mr2575192e0c.15.1772721136252; 
 Thu, 05 Mar 2026 06:32:16 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a125c65f9csm1633905e87.86.2026.03.05.06.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 06:32:15 -0800 (PST)
Date: Thu, 5 Mar 2026 16:32:13 +0200
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
Message-ID: <anhregq3m6axyjozkrmcaeh3fkbmxxioypfq74gar3kl7l5vew@mmmh2fckulk2>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-7-ea0579f62358@oss.qualcomm.com>
 <mo2fc5oalscfgagdrj67aa7xssnugsara4dartp4ycsdvoyvwv@swzmdnwtij6u>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mo2fc5oalscfgagdrj67aa7xssnugsara4dartp4ycsdvoyvwv@swzmdnwtij6u>
X-Proofpoint-ORIG-GUID: iXkaaV6hBZSUboyye2XtlwmgooV4c6bP
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a993f1 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=RHq2fkPijMoWQiYS0DMA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: iXkaaV6hBZSUboyye2XtlwmgooV4c6bP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX4Bgy0zdLyMaV
 ud7VsTGb/0zgbz9c1w+sQUt7LlAYRZY1Z/YnElSGAEoXnaYD+VFo3bQOVY4jgpRnrL7cTulHLyN
 pTRMnICZr2hJtIRvtrWyItKq211UZRk9ib1baEoAdkhhmAfUgGR+BdfiHOdIq5rwMKuVKFvwxPi
 Z2SKH0RMlCMOBLcwJ1oxUrm/EgSHtDQzLYmHr612ZOnXd26p22Tkp+qIKElP6EnADVdZqNzBNG7
 2LsxvXVJqxeVEibgBMxHoyNdi+h3sC12WpUU+uW8ixqrTC1j2nWUiJ1qYcDZCmBT/UU3JvdcCvu
 YIgx5GjWiBMoDeMMPft9WQGv1uHGHVXOcfmiNVZ311VmggDQKbL6I6JCjqQcdL5n9xCoQGoMkFY
 ljzyhm3E0aAw4POIj9L4qkv3tae3Dl874PUve5uRF5vm4MRcEOyz1GTzLDqvt2yoBdW1Jl070VD
 iNzXuKp2rzrKLEFdllw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
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
X-Rspamd-Queue-Id: 6DAFA213813
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 04:29:43PM +0200, Dmitry Baryshkov wrote:
> On Wed, Mar 04, 2026 at 01:58:49PM +0100, Krzysztof Kozlowski wrote:
> > Add support for DPU (v12.4) on Qualcomm Eliza SoC, with one
> > incomplete/skipped part: HDMI interface (INT_4).
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > 
> > ---
> > 
> > Changes in v2:
> > 1. Drop stale comment
> > 2. Fix INTF_3 controller_id -> DP0 (Dmitry)
> > ---
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
> >  4 files changed, 368 insertions(+)
> > 
> > +	}, {
> > +		.name = "intf_3", .id = INTF_3,
> > +		.base = 0x37000, .len = 0x4bc,
> > +		.type = INTF_DP,
> 
> This should be INTF_NONE until we support MST.

After checking more, this is fine.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> > +		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
> > +		.prog_fetch_lines_worst_case = 24,
> > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> > +	}
> > +};
> > +
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
