Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOArB5vmpmnjZAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:48:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5469A1F0AC1
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E7510E81A;
	Tue,  3 Mar 2026 13:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljCTyQ3S";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UcmmEpm3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F2810E817
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:48:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239n5Pr582377
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 13:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2eWWjGPyBnebc1FydoyAZxwZ
 ES4AvXrNNkhP2BxgHh0=; b=ljCTyQ3SB11zQhOOc2FSe7OrQR+Pmqpy9ik6jcnS
 MPIAD6wvdCb+dNxdlXx4mjTmbw3Ulskx34qFNcFl+m6EWDxupfN4RcoiCceNB50u
 z7pqzit8hrOoGGHRbe5nkaBBVQPJjIAOFwlSyHd4HsDgQ6L4MCfFt4U5tTGrPZPE
 rAYOdZCajwz0FJ6teZzSW4+ReUunH+auLxxi/ogDuFDWlzh4a6QIlGglVcNwmImM
 4G2xX0bLbiJF4QiEEefbmSKjVugnFjOeHScq7HHgtsVMUtc8YQCu04nWJa4Iq98U
 q0SQikTBI0QHa1nDr2tEdkhWOFIEaI5oaSFbdbm53lW0Xg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnh6ub4f5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:48:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb413d0002so4293432785a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 05:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772545685; x=1773150485;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2eWWjGPyBnebc1FydoyAZxwZES4AvXrNNkhP2BxgHh0=;
 b=UcmmEpm3XZFOXKH12dEGuRDjNssKLXgIpIm4/IxphngQbUdR0z17zNaEkzfCVzESKr
 2twZiYYOFeF64xKtIUXAhGvwmyPUOC4+Jf+eaMY1hsIRn+/PZb4UlHt6pN9juD/j4Vmg
 ml+S/9QgKHdAJshIbM33d8KuFKY/NTMjp/UFO8a8FbQ987Kcwsh4wOp65WZJUYoOaGnG
 IsJZvlnDtsHkAHLYHDgQJMuUAyB2xe/0TwE3Pkmflseodkz9h5IGZ3btjhatsy69U+nH
 q9t9sU08G9EnfOF257I7bGsY3HGONTV5DIS/ntlInGJiMYdlOo5Oi6ZzsSlS7WnVDas7
 gmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772545685; x=1773150485;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2eWWjGPyBnebc1FydoyAZxwZES4AvXrNNkhP2BxgHh0=;
 b=og6GcUhh7SspNe+86xTek6Na28arupZ+yNnA+DTqcPTPPRUNXzJhmgNbJjb65I8uP7
 2ilEEMLPsSEfb6Y0GnTe7V4cqNEfRPl56hFnpvrlNd+XN5TpL03NxJXkDdjJJPaPTrPm
 oc/lDOtMkYQXAwCoO/+m0hvpR97JwaLDu/ZnvJUcW4XXHZ0U3/4xVUv4t6pHSSqFa7ZH
 y7s2uNpKGl3EEEhQw7c7wLb4u8jUMGh5YyjI6LN0JxUy0ngNCR/GXehkSZSCRKctnt2L
 kTv2Tu22QAF8AOxf7iqFzo7hFXeycxJEKQg+rdfDnwnLgOo4eBsKoJ4n/J9uwnZHKf83
 Nl5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbud6/0HHLYvceuTBWvo1q/NtwYJT8sWzQDAzy7AS02k6jwjmcE7rsQ3QcLREOaCB7oujO3otpNdw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYM+cxdRryhKtISBm8xgXrHnRkvkwq9valUqNvMk38uhM/LS0h
 iMSiQTU0ZvJpgh1IOq83d69wWae5SunTNoc91wuECW9z3ZwimED3zDlesaENFAOVo8F8ry3LyEQ
 G4BBaFg+6Bi9nUF4Ys9FCqf/paEgBrLOgUXqwOYeNtwkz8aqrD0JE7Hi2L/ZhJDTr5iFds+w=
X-Gm-Gg: ATEYQzw/du6PiTh0p8mdDvnSm2d98px/odCi9ZXlVp6YjjmD3wWz4mdVbbyxvSGRkcH
 hXQsj+UUrAWdlDJiAJPagiGSIthvC4AXxFADlYopI/zzauoR2Lli8g/n9EFdOeAbZOH6QodWmBt
 2AEBrdUPgmgQtWi1vilQQigy5Ok01oqYbBnYKrCiiOOTzYBVrNF4eq6PbcG1rjP+Er7dBIquC1t
 VVGk7WF3CfEkHvg/oW6RtlVapREzazkEGUP1KhUpCuHKWpm1GTyRLBjvcLwwFfQGIRsqK43tepr
 XYtPKawVn6pglYDmkJEDAKGMK3I6oWYs0sVTDzYFN0PkZc3+54O1X1Uqq0m4ymcHpSnUAKIjeOE
 aTbdC02GuQywPaKZZOVkuEmudyRmzEum2kmmeUm+vHyYEtCYsJ54vzcs+viRXcNIcSqQeuGmmER
 wkzohyBVgM9TvvtJVyRq6azDuQtz6Ri95BeY0=
X-Received: by 2002:a05:620a:254e:b0:8c9:eee0:db94 with SMTP id
 af79cd13be357-8cd50bc2911mr203051185a.31.1772545684693; 
 Tue, 03 Mar 2026 05:48:04 -0800 (PST)
X-Received: by 2002:a05:620a:254e:b0:8c9:eee0:db94 with SMTP id
 af79cd13be357-8cd50bc2911mr203046185a.31.1772545684050; 
 Tue, 03 Mar 2026 05:48:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a1273cf021sm94913e87.4.2026.03.03.05.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:48:03 -0800 (PST)
Date: Tue, 3 Mar 2026 15:48:01 +0200
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
Subject: Re: [PATCH 3/8] dt-bindings: display/msm: dsi-controller-main: Add
 Eliza SoC
Message-ID: <ym4nzlar5tgu3pzaotucg4sd4gcapprl2i2jrfop6hcj4mrezf@5irva5crbxxf>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-3-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-3-814121dbb2bf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOSBTYWx0ZWRfX9g1oWaIaBB4p
 P99tMMoXd36Gcdhnc8BBgRqA3mePU115K+8efnMCiKWQsftg7rVpn4lwSI7vDmEw5Mqpm+m2Fcw
 61dx2bZ4n2oHWg589Vul13HuW9PGkU+sfHuzQ03fvwV4cI8ESAQOeslgLIHT+5MNh4Ke3p4MGyB
 WRAWokIsGSuF/W4T5VPUW9W0NiEosT1q8SWKSqwHHZ4fwzcZy+SpxGl3jXLeGtmlqriESX1aTVW
 RTqD9NldqXX3Sba2ybh6X52UergXLzI2DSR9kXKVGkPh3Y0yocsmScsz7FMithq2gTB7MYR58en
 9URuIBQumsprDIcbryUfrw0JTzrRfIURODidxIFLtRDv4WaJA/7LQ5MTLfp6ICHBfIs+hUruUz4
 aClPsnTPA45HDShiGfvF3pfnOhGg74VZxwv3r20SNf8T+MLzTW6WtjX8o7hh0QwPLHU5d8J7tik
 1LOXjkrHpMyVHWg2CNQ==
X-Authority-Analysis: v=2.4 cv=MuhfKmae c=1 sm=1 tr=0 ts=69a6e695 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=hxgsInd8paV07mNIhWkA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: M2olxuYZ4QS42VTXBL0bZgHV0oEcWtii
X-Proofpoint-GUID: M2olxuYZ4QS42VTXBL0bZgHV0oEcWtii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030109
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
X-Rspamd-Queue-Id: 5469A1F0AC1
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:53PM +0100, Krzysztof Kozlowski wrote:
> Add DSI controller Qualcomm Eliza SoC using exactly the same block as
> SM8750.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
