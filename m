Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHMPLDI+oGmrhAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:36:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4974A1A5C32
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202D410E916;
	Thu, 26 Feb 2026 12:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2EdUfJb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2J4lnWb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024BE10E916
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 12:35:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QAKgAr287482
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 12:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5GMNC82o2PbIp3JNg7h1C+vK
 9NoeCm9TDJIU/C8NC8I=; b=T2EdUfJbHAVI+0GT7fY3kFu4OBWGb1E4XS9vCwYz
 6HJ2D2hfvG9j3pbp2sn07vVBw1gHCoSz5d8vKwxFWh9mrQeJjn7rclgCKLhHg5UC
 xagjwIgPgmWolVBhmpfXuIYaBnZ0BDi6c1KUFHxXwWIZZ3qgEXvTB++XN06xibBh
 pvDDLriwoEoK4//AlKVOiiTECn0tWJe6St088N4D8GLn1DFLJ7fORdGHaGftvaJY
 cy6kFNshDi5k2yAOnBKNwtDHulHSD8mgCUhhXpsI3EZ4tskICgHA+YZqt+HEZAFP
 z5F1xhtDRRmfJ36+de5c4NarHJYwv3/7BaWRnxQBgMT0wA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u0c32-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 12:35:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb4e37a796so523657585a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 04:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772109356; x=1772714156;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5GMNC82o2PbIp3JNg7h1C+vK9NoeCm9TDJIU/C8NC8I=;
 b=i2J4lnWbD8uQNH9HSqWBrSnw9dxzruS0W0kVPYNXlMi9UQOE9sSK5jhuPmARjgW+yj
 VqeRD54fPGezb/8SzOvxbMbi5wfq3rSkpMJCX+6UvZ/bp4wm3rsUOu81FQHpnW32IZGk
 5rrWiPFsgSfKVjKiJAYU7cptyCD4ZAD/QFh5jaevYIEpSqZCJvLesKq4hfJhvXw2SU9o
 cq2H422KIvzM6GomOmqaKp/qT7DDtEeTnktfpyFFW3BQuPECSC9y/C4AU/tdrlSwXIZY
 ltEkEgzERk2kLME/6jfi4Z+K/FKPwejd4q4OWxznh3SlXw7Co4nMUoaCFh5aaOGPhAuy
 VeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772109356; x=1772714156;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5GMNC82o2PbIp3JNg7h1C+vK9NoeCm9TDJIU/C8NC8I=;
 b=v0zjqx8hOcrMYh8UDWX9+13KnftIdBe+OFJ5h9Q63QskLf8p66W5q5NMJW2L48+i2i
 PzDhfSqfgwh1JLZNy5gAZUnIsdQ3/gozl6ddKRV17wKB0hV3pW7JhOoH2VqZ/qOngWWS
 2LLZYO36Y1s7Aacx5gV0Af902N801uLMrado7FKXDDiuRwvn74f+oqCavDv791pel/Jn
 1UYgTF1zxtngxNhI0HaWMApijBOBVOdzfVDK36N2OHJZDaeRJvI2bBvnA/XL2EhQYvVN
 LEZ+AcZDEilhgzap4QGkci7yY8d45w+e3E75+pRKEHA2ZoQ6w6ITeWXOr3C8MY0n5J1+
 DoRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy3BpIbOP40Vovh59w06jKx9KbqkuMeZrxbGF2xmyk7EyNjR2KvrRU5li/py2m7CIUjSAAg4ehcjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB1DaD3DNJ1wrZQEqNXc+mr5x+gsPHi3RulWRaXGD6P2JNw2Kb
 jvk85fEieqvZiYdBSROfVYSMXOUay/YtNxGxHY19+TCXULecQa91Q2RC93zwxtlcjoxhVUex+y0
 10+q+1RNVNTY+nIUBd53QKLnVNRWFuZ5uL4xf+MoH53HCvvsrYPGLGIFiL7YpB6DDmEABNQI=
X-Gm-Gg: ATEYQzypEKQjgeke2pV3lQ46cXSHfZPI+5K604/GhGOC/J5OrdsBrYJOERnftPCTV4u
 vDtGRO4/k+yZ15c5F0qMSQIlnj41EadnaJ72fFMNflneV12gjeQzCGhfNtQEO3JGHKiMPWeLJxN
 Gjpe2msEXoxbCQs6wO64V8SfcmCjw+1B0ldYrn5hshBbAP/llcm9hx1gELttFWSqzLo+php/5WJ
 lu+tJ9vm8JKjYL+oMXHQCUOm1yOlYQF1r9wfwQEUrr21jCKrf+TBKsPdAcz3hQ8f2wqLepa4H2W
 XowxILlRO65GoDaIa+zR4XuX/tj3L3L/393068Dc9WgY+9O1ynr3xqO5JbrNhqbij3aCpCkFLvm
 hiLyLHNlI4/5QLMLJMYtKWn5FnDsNBbRD6Biff2IPUzk90OlaJQV5S28VIXkm9H1tzORV956zbp
 htLs59hQ5JcB+3pdW6IDGBlqDA09YruEtlO9Y=
X-Received: by 2002:a05:620a:29ca:b0:8ca:4438:b8ed with SMTP id
 af79cd13be357-8cb8ca83779mr2673675785a.63.1772109356303; 
 Thu, 26 Feb 2026 04:35:56 -0800 (PST)
X-Received: by 2002:a05:620a:29ca:b0:8ca:4438:b8ed with SMTP id
 af79cd13be357-8cb8ca83779mr2673670085a.63.1772109355723; 
 Thu, 26 Feb 2026 04:35:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2f4b189sm5886321fa.3.2026.02.26.04.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 04:35:55 -0800 (PST)
Date: Thu, 26 Feb 2026 14:35:53 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP
Message-ID: <dyqv6ds3tdqcdrdl6zexwdn4mhi4g4p77sdymaqan6nmdhqmxc@mzl372c52wi4>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-6-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225054525.6803-6-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDExNCBTYWx0ZWRfX1NtlbQQTmQGU
 b+75aKF7qdY5CRd9B3bksQgrWAtFLSb1QjzDBFwc3neHIYwRjoQhTlmU+owwH+G7cjN6vv3OnHS
 BxfnyYKZnrlFRkP2TJXMqZpvjc0SAWNehKiX8OnS14R5epVToG9UXXAwV4trS75WznJ3vdKhMva
 6pnCPp9WdCnQbe+5Nbc6m88poY0fcDQgO4TNBEoZR5JB2msTiX+uvH0sP2ktg099pfev2Sb9mEc
 /KX4zqEkYfURf6DYQGuLmnAlXp9MuZyTjRTQsnjvXbAkjCYZKRecjfRJyftynV9iKzzxuCap2M8
 k7PagQUnHUUZn+8J92ctkT/DZRClVFr0r4XjfHyR7asOh9c5z3WZyKKGbZs2DoFvEjtqD9SZ4C1
 YA6nuEZSHwd5fSGjdBMlRf89fsmaOWXvpAYzPTK+GX+bMYSQRkh97SoX/1P18dcwtj4L75WD0h/
 hjmP9wiL/OUMpBNVV3Q==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a03e2c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=2VfSu496nhalCebPFTMA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: i4slOnShAxltRAo9yR2Lik3aUQC3yoct
X-Proofpoint-GUID: i4slOnShAxltRAo9yR2Lik3aUQC3yoct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260114
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4974A1A5C32
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 01:45:25PM +0800, Pengyu Luo wrote:
> The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> utilizing the same register layouts and clock structures.
> 
> However, DSI won't work properly for now (Partial content wrapped to
> the left side) until we submit dispcc fixes. And some panels require
> DPU timing calculation fixes too. (hdisplay / width timing round errors
> cause the fifo error)

I'm looking forward to reviewing those patches!

> 

-- 
With best wishes
Dmitry
