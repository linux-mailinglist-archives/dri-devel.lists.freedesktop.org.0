Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mp7wL0S1fWlOTQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 08:54:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F67C125E
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 08:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23CE10E120;
	Sat, 31 Jan 2026 07:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXSub0HD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Weqz6QOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E899C10E120
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 07:54:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60V4d34e4076877
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 07:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BNGCdgB+I/241R6e7TdCbqbF
 QIHMkedIcP3fo1ofUoo=; b=iXSub0HDBbJZF7c8ZqLFgDfRVEOTyO3PdLhPloqn
 VfizqYx/98oUCJO1ujItkVh53g4XeeTLMIDpEv+vugTMiuF5zqVYGtrYPNEwFEmu
 smOqNwijvmv6QfKPrlKOu5Nl9CjMSuhHiqzloNRVP4FV7QSxHgXRlfbN9wQd00+E
 pijhEMPG4itwILT+4aalkniebQ5yjheRO6KdQ1jSETVPSVx9OSN9EaXv1C4WQmvE
 +WeBt0QAVsUOuSarqVss9Z2SBHnw1P0oSPQwTxEzxyggHO3brTP8mXBp3q2AMBhh
 zWTH4BmzwOEHq96DdLBT1Qr4iTVKu0f/8lqmZs/20g2XOQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx0d7r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 07:54:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6b4058909so737222885a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 23:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769846078; x=1770450878;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BNGCdgB+I/241R6e7TdCbqbFQIHMkedIcP3fo1ofUoo=;
 b=Weqz6QOS3NI4No0tifd7Y3GaeNxKPO4DL/hHyUmpWC4Bxk5rH4s9NGeklnzRwqxxTd
 0Sdpxql5d/oObVmGcdwgnf1SjvIxY5r7WyCJn1ev84mrPd0wiTNCI2JNI+aBkV5Bcam7
 MsmQAf4IZ35F6wcftgSy9MOl3+dqs0Co3PJh1NBmhkZCRJ2EjvM8VUAwT5dhIFKAEjku
 syRwlC5pAPYSnBUHbOvxIn+Z8wpaMSF2UMxEa9sv8H6Uf3gYEGWSZFF+qlXhd/c4IAPe
 fKkbd6kjqF0hIMDSpOtZ7y5h1Aj9/jJLkrnzxsF6wKAuF2TBF1K7qxQnczcSs4/ByM0D
 ssRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769846078; x=1770450878;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BNGCdgB+I/241R6e7TdCbqbFQIHMkedIcP3fo1ofUoo=;
 b=ubfnhH/lcQQshTmQgH1OjMvlIdrUbK1iKpDRsECe66KRuHmATdz9KtetiQp4TTImV1
 uKqLOPRVCPN1jzKK7jWsSWyZbscahiCWn+HXNL8wjpBRQvTIWCKDMHTGjN+wqLj3WDYR
 PVaoZ9Mr/VRA8XdL7q/XqX34ybh4h4lQW79SYu4Y+oJwfaZhYiEkS/5hoM191mF37rEN
 HKbgfb9+O6ZKzE8sREbHLKqNOAUXAkZcqC7LmQyx1y807SkdFyWpsiuDKUAuHfS8KPu+
 KxCsp8VVPjM8NO7dtnlCAeaCvqez+U6MFYA4mToynj12sfMP8OvDy1lvMWwdLFEkhN9U
 STVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGl0Yr2Vv2q82yEUzoLpCH3wkA7N8mxWk0jI9bNq9kIc0LPIm61gu0VmP25jrrhuPaFPdaArZ1bzs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiLH2XGD/avVcfOEo6bKf0izmxl/MELIEwir2aBUQF8EYc6s47
 OZcpokQK8wqITR3xlTFjkPnZorJwoF4ETaxpsXs+BAMZNk3Qo7gcuzPDG4ECZmIWS9ew40Ills2
 zbd+CxSlgFtfSgvTZZ7T9+spxKhAExdixqgXOgc5EWXtFWtj+g/h0aDswKQT/rN+B5+9BPEg=
X-Gm-Gg: AZuq6aKC7L+F1OlmcxFXx4Av68TfP1gklXmJS0+ikFYkgjEzBwHpikZC4/z0iJNRRT/
 QNCRH4vqubBjUfev2aY3WAYeXT6VTnkxKgTDtfIk2ulovvOjeiZLD0aSTzqFcN86BTudssk5qe5
 Q7nRC7NMAu0SrOthDtC8z5Q2P+qKwX8mSO2Q+RE73rn4QRz3e2QTtBM2B3NAu8fTSc/FOt2Bf0l
 5/PXTYwGBbEn7xU6zFNtALOdRwjJUnl7RIh+ZDft36+IExBbTHuWzkrk2PZjClcwChMqhDgZIH5
 kQJyCrs2KPYgebS1EBfmhSMMOnLdcEtPfmBeSibiDa+MCA56jLcrq5u0/u+R/uFLBy6xTuGDNcM
 yuBUzyjgVgn3cO70dDtBZjegesaxB4g2deWa3EjosJiPtXY9EI6PwmYe7zLSWS+ySYqDWeSVFZb
 oOcp5k+YbX0mc9ot8VZjOUh6Y=
X-Received: by 2002:a05:620a:d8e:b0:8c6:a5bc:8a80 with SMTP id
 af79cd13be357-8c9eb276269mr783151285a.29.1769846077994; 
 Fri, 30 Jan 2026 23:54:37 -0800 (PST)
X-Received: by 2002:a05:620a:d8e:b0:8c6:a5bc:8a80 with SMTP id
 af79cd13be357-8c9eb276269mr783148585a.29.1769846077410; 
 Fri, 30 Jan 2026 23:54:37 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38625fbd154sm18624001fa.43.2026.01.30.23.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 23:54:35 -0800 (PST)
Date: Sat, 31 Jan 2026 09:54:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
 srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Message-ID: <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Sowt1oKPuHeUtPi8Zco_cJPGZsgPSFpR
X-Proofpoint-GUID: Sowt1oKPuHeUtPi8Zco_cJPGZsgPSFpR
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=697db53e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JZfQ_b1XWSiC6XszZi0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2NCBTYWx0ZWRfX+ro3Fh0sPm4g
 P9VlN+5VTXR/vDzExuhaZn7NIk3hCvakbvL6Fiy+frpSMSmHOXNHZuZFw9x9VHi+/0MMJ1Csbv5
 0wN6QuSjMILKtIxRrAKVqK8rinCC3+Ctasfi5nrKlJz266qhaUkT6GcSQleRvVazFQJW6hq/hvM
 SQWw+a2ZJ5ZdBlv5ZMAMJkwacKRKvHTlFCYDhZAenIUSz6o3GD2uYTPWbhoXdfJawwj5Zhihma7
 e/4rqkwzM9Mtard+jWIa71LfwUhroi21ROBDPBp901xh2sH3DqPuDDSbC1Awc4A4g1AOyYeub3d
 OZb3qzrQd9njEDZSqOnBTIPkrimAamKHCe5T4D/MZb7na93l01ppU170BQ4NPQumbEVzE7TqB3m
 fEie6zZJGn9yPped8mAWQXDhAtEoeMBC6h4Tm3HIKu+Cuft3nEgbEc4savnUXyBNUkLrkO4UBUn
 TeTufON1dSzx/nX3+xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310064
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E6F67C125E
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
> On 1/29/26 1:13 AM, Sibi Sankar wrote:
> > Enable ADSP and CDSP on Glymur CRD board.
> > 
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > index 0899214465ac..0eed4faa8b07 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > @@ -487,6 +487,20 @@ &pon_resin {
> >  	status = "okay";
> >  };
> >  
> > +&remoteproc_adsp {
> > +	firmware-name = "qcom/glymur/adsp.mbn",
> > +			"qcom/glymur/adsp_dtb.mbn";
> > +
> > +	status = "okay";
> > +};
> > +
> > +&remoteproc_cdsp {
> > +	firmware-name = "qcom/glymur/cdsp.mbn",
> > +			"qcom/glymur/cdsp_dtb.mbn";
> > +
> > +	status = "okay";
> > +};
> 
> Please make sure it gets to L-F (only Kaanapali is there right now)
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
but the firmware in linux-firmware is (now) targeting IoT devices,
should we use WoA-like names for firmware on Glymur CRD instead
(qcadsp-something.mbn). It would match what was done for the SC8280XP
CRD.

-- 
With best wishes
Dmitry
