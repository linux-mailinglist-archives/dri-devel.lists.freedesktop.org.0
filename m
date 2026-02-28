Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIWdLZf7oml28gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:28:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1855B1C3945
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B41F10E2BF;
	Sat, 28 Feb 2026 14:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYnd5z2T";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3A9K9lm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EC010E2BF
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:28:34 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61SEP19g313607
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UtIEEx7IZ6KH8YRRxMiZGyHC
 dpv2NzwcnMso4YuYxKE=; b=TYnd5z2THhCb5lZj1xRTbIIB7raSmA8kDle3jvyQ
 /01GYepsD8lMgs6VBCnZemA/gT0VEdBa5RUQyGWiVTiCKxqR4YajeFYvBUdEKs1H
 jkCX/kleQMSLU5mPRvG7C9o7iFg6h5X87B48nlO3p6Zrzwz1AuS4q+j+3O0DsI6z
 hdtZe/cEw30+t1X0IN5Nvw9OaLZDzlgmB7fxWjIEHDVnVxeZgHrphk7BxUeqR4oW
 MViiCCt0l6PxTgEH9RrNwqbbyz21byVyBLyCgbEnsW/qTcmLhB7ALokEJNebLIwG
 1vdkycwzgb0D08RHQvUGoNOjGr3UcsoIvWc/vzlcVn9ZMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6h08u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:28:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c71304beb4so1982801985a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 06:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772288913; x=1772893713;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UtIEEx7IZ6KH8YRRxMiZGyHCdpv2NzwcnMso4YuYxKE=;
 b=T3A9K9lmqhTfLiq3+4jjrITKrzc7vwUsNElTQadKgdc412ZxoNOqrOkl4WBpEtOsBl
 lp0SUzZoCW8aCqWkJ7wmMPjPf8+GOaQQKEkQ6+45O4JgTqTVswit4Tw6VE/VeuKqLnX0
 yvOD100Z6ex117q2eZ4j1tH3z834k7qi1Y15cwlgkFAXZeN9dXrtADEfY6dnlkA03B6K
 op0nE7fC4UfrhGeoDhGvyTtuJWEDFjSTXhOZnC6NCrm66BXVpyMe7BN6LJHowUnJq3d/
 eY3ZJnhm6ezblW61CSB1S576iUSeRGHyPfIynosbDgFQpvGvDwjrVI44bqx1uPvEWSI3
 D1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772288913; x=1772893713;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UtIEEx7IZ6KH8YRRxMiZGyHCdpv2NzwcnMso4YuYxKE=;
 b=cua49Q2xGAitBVfO+aaK4uvfS3y8q6W/1iNj4DusVTmQk0XVRNeQjXs2nzoivlEhvc
 LzBCmRJfUCHncKNISMumxYTxTnmTKz4SXrtSo3grwqjF9FjTVldy6KO4nUOsCn2zXfV2
 FaTBdtsAbbiAgCjt3+xW9N7L2FGyKtlCGlGXupyZj20k6uKZYg/xgJx20elzho4iz4Oc
 ziycUxlLNz9iGq93q3eQl+mgS7VWb3bLpQYk1MIAcBjgudaps8yCT0JqcvGML/iNEFQv
 gtyI6RxUxr81Rn7uFfHIyRlNmp6U//ENYSmved95nyERqPyY9r3Bj2ICH4a/6WgHYNJs
 bMng==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5sv1zifQ0es/kywgJnbBDWWCfp7oS5JTtyDePn5fr9br/KPPLrr34WRKwpB/gYNspkuHLNqjezMw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc2YpiqgIz1mwMLWe85uBTS/4vesjpNWmw8EOWt3wxTpKLEv0v
 QJwxe7vDMq4cfsE3ckrKcyx3GvU8CXrjpICTA2HEI2QIpHHaiawsbyRvAluF6k54NnNulFg7/bO
 kcWho5MpOayVCDrzYVo+xrMqtpNP1olsNxM6bWHf5hyKkdaktXnqr7ea2n8f8j8rlF3fIhUc=
X-Gm-Gg: ATEYQzxkafGPzXCQqGC3LXX03aTnEKZz5eEo5TTx/ffrz98GeKnJGEZf9b/HXNFEOuP
 q5BYuXcw1I2OYjO2LgNmGyDm9xJp5jV+IjHOBrxMFtof3P6ItSczY0dM665HPVcp8wk6lu6BdF2
 e6IrHj84YR6ISfwv5n3Bt3wfRvQ3j98sfy5TC18nQ+324Js6oxdTZX3QgY1nal3bie3jUxxaWFD
 eg63SsDVVRi1CzEnrm42UvR/N8VCzv5qvn/DsJK6QHOLkNJ9IBw/XNsgmgfoVC555bJcKxE76BV
 x03mwwQRep5RJHO+/7f6+HGiDDuv/KLCuESSVddnFakHv4fpdVpCmt4+wLRw4nyufQ1KfHQdGOk
 tO+ygu50Nm8xY8l0VCp38hN57wnJoEI/+dhb0QDCn2WY2uKDaF7SsPMjxmBIFiS3qII5OKWPl7F
 HwggLhnSPMT2GFYeWSlyp/zzieKVeswGOX28E=
X-Received: by 2002:a05:620a:3191:b0:8c0:d344:47b5 with SMTP id
 af79cd13be357-8cbc8e525famr760920285a.77.1772288912574; 
 Sat, 28 Feb 2026 06:28:32 -0800 (PST)
X-Received: by 2002:a05:620a:3191:b0:8c0:d344:47b5 with SMTP id
 af79cd13be357-8cbc8e525famr760918385a.77.1772288912154; 
 Sat, 28 Feb 2026 06:28:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115cae82dsm572059e87.5.2026.02.28.06.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 06:28:31 -0800 (PST)
Date: Sat, 28 Feb 2026 16:28:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on
 SC8280XP
Message-ID: <u5ra6kbotpihuizs32iufz6jxh246tiqhzabtvjylksavekvyp@x5oa3vrggvxk>
References: <20260228141715.35307-1-mitltlatltl@gmail.com>
 <20260228141715.35307-5-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228141715.35307-5-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: -XgGpllk-sRmlkPb-2Qz3JQmRiU5F8Ks
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a2fb91 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=oZPMeiHd2FbyKtjdOA4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEzMiBTYWx0ZWRfX9oX3US64ME75
 Nre7u8cZDTiMck1ze7gPQHtNsmUZk/brA15DeIRV7AeX0MtqkFHJDCD/IQh8yeWnxIR4rTqKoiF
 c+V5PAZYps6IwOwe3jafYVr8cA26DBUXhS4xFUmkdJKO+B8526EZDovynKIdKl4tFtNLH3vf7se
 n1W1JM9xIIACQkIGmnivDVRp47PEj2yJrBtkH8UKgo1PuNcjpg6q1bybjfJB052YLKhWijmPfia
 8Cuj0pVHs3iVYATBX7ptFYfNz30FT9uQJBpt6cyNsCFM4qwJu+iU6keIO3B6AItmJ9UQM2VVGBs
 5l+7b/IlWDcFin8b3HV/KJhGtt9EckLocE1Fz+PI6Pjp/krQYMeM1mkgWAEpcLyth7KGD5EvBVt
 2vTEowSZzARgqpiJhl5GyWQIbvCJXs+whVVZpUPCYvmuf+1R5aiOrKa21H/OpkPP73kaP3e0wvy
 216kOk+1wuNTUqTMqJA==
X-Proofpoint-GUID: -XgGpllk-sRmlkPb-2Qz3JQmRiU5F8Ks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280132
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 1855B1C3945
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:17:15PM +0800, Pengyu Luo wrote:
> The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> utilizing the same register layouts and clock structures.
> 
> However, DSI won't work properly for now until we submit dispcc fixes.
> And some DSC enabled panels require DPU timing calculation fixes too.
> (hdisplay / width timing round errors cause the fifo error)
> 
> Co-developed-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Tested-by: White Lewis <liu224806@gmail.com> # HUAWEI Gaokun3
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 404 ++++++++++++++++++++++++-
>  1 file changed, 396 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
