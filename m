Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMJ4IFbuomny8AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 14:32:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A6A1C33FA
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 14:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BC510E269;
	Sat, 28 Feb 2026 13:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKPCazFO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNS5V3E4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1AC10E269
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 13:32:03 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61S90ApB1252900
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 13:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tPKkssMOw7u1G3FtJ+5DZxGV
 8FHzK+dCLc4VoiSMY/o=; b=DKPCazFO47XyaJheoev84VdU5DZ468U0I1N0z3K1
 5qiHDGt1jt2hOhFISX00wmCR0zPXX8Hbid+bkBTNP074wCRL8hPTz4tq4UldQgE3
 dAm3bgP7bFcWmHDz381g2cTUwUyNZg7NV2Lh53ZtUI7+wYjf7dFd1SJKqvVX6IJI
 umqjaYbxGb4qqSZ7jBPGJTf8mo2VS+c/bw6RKc4as4BAExGnfgncovU4zVM0ViHC
 gs8yk5jiH80fcepBeIKiTVOO+OtXf4Stsk/dMrAcP/6/Wa/gyMf7lvPyX+If5oOG
 9TUD6HuFG1fsFndZa+n4CapRkwIfe8xjwze30zFId7qGEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksn40yag-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 13:32:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb6291d95aso3339378085a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 05:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772285522; x=1772890322;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tPKkssMOw7u1G3FtJ+5DZxGV8FHzK+dCLc4VoiSMY/o=;
 b=LNS5V3E47rI88sK7xNutNBMaVa9S3AVwowQk03AmZgv7IE9qHI5uZn3vzABZfYWi8q
 a/nOtzQ2prDg93BagaCtodRINFe9daZO9Dp05nwghu7WH7UygbqnLgzjl8aVdNuguNjR
 Oa9pjyZTJQXlRazxFmtXvumUNbx6Xg2MIeMjHx4v8vob1l2Oqjnvo9VOurrAQla6xzs+
 6jnUJEZK6ZL0D4zfXlbkN59YVAb8zTv9q7w+D8Q80r6X8JO1dOmeR7LTsBuW4fohfHzL
 sH9E2cD2fpgeFUpJxSlNqFhQ6FB+qzcpk1i9P7LO+tVWorhNepqjmmmqEDfXY5PlIdhs
 Jm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772285522; x=1772890322;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPKkssMOw7u1G3FtJ+5DZxGV8FHzK+dCLc4VoiSMY/o=;
 b=mYp3DFWoZGDkg+8bwPky3QUkjjEvhJEEkntqq0TVfw0dkNBnihZ/kW4OKHZmftijEf
 EHSNcv4/VRmzCKXcLNcHINxYk7nLX/DNk2DnxbDyMYbgPjhdRtzy9d1A9JaTiXiSqucU
 HMsX2/00n+ClwiVs7YH1gdZ2ZtHCdSHY2/XaAfKxh3CYlMZSvC181LNNM1iF9Zv/MKmu
 IoTvUJtQuIWCdHYrgjnr3h7JIqes0Iqfm6/Ht7pmjil3t4CtywTnYR2h56BAO8wa2knc
 7UmDUx3ciVybqIrF2pIU9A/0ugSiSauGVyUK+WZj7c/h1nJ0cFUjLOuaWJs0Y25/YjIw
 DUbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaMDbFpb09+PQ/OfLEMx7B27aNfyZ1iwrrl3L3Jx4QVIqRj16aBN6BecIHcFIPQMqTiKRw/igNVYM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLlWUQw05HQTgXaZUvnETvx6uV99l1NvfNcLQFPlW3iy/OA9ws
 29ENFmtP+ImALZihtCG5K5yO+Ap6VOeHdI1a2Znv0AFIh4F68FyDyvm0qx81iHJQq60duDBmU8t
 /LjCQ4OHNwjYRzXW8bgPrySKtPLTZS30LadUMhcWNyIOOXsd1GUEjvtksEMFl03RvZnJdTFE=
X-Gm-Gg: ATEYQzzEKEn+Cgji/Fj8mUXBa2HPOp23LsPE/w5Lq5GDmVyHtA5Hntkl62TN1/uQrGm
 o6T4eICD9qemXYGb2aV01c1ttQhmqLHyB4titjHFOj5P7MiesLu+PxJOiKI1hi3pgY2h56nhqtH
 pEHg0+3qmDFt8wl/cGkj1gBtyy16rPlKp2oA9qtm11Hnfnke2a2MuY8/+1p0dHHXfKz7qNVubtT
 a+mf/kwQtKwA2CdJBAoa9gMv/hupukZgsefeIYFGM1tDZEkHaGvdseD1z/bk691/C6EzqpcKOwM
 PC7tkhe5o0grbk6HYloRDkcIZ47U6eUnTmjCjmtTU8ThgELAuZR6undYKZ3Wz4trsPglenXm3bO
 v4YXAxTFuZd6KiSxhJroyRge2oRWexe1FaUwd7R6bsqmbgiPwHpCuvh0il0HncKqO30JDm1l5hn
 kJdxrp9vYE87BvH0RAfMcb5vKj5BEzmEYXu1M=
X-Received: by 2002:a05:620a:4004:b0:8cb:7ad9:65a9 with SMTP id
 af79cd13be357-8cbc8e79948mr809016685a.59.1772285521808; 
 Sat, 28 Feb 2026 05:32:01 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8cb:7ad9:65a9 with SMTP id
 af79cd13be357-8cbc8e79948mr809009885a.59.1772285521246; 
 Sat, 28 Feb 2026 05:32:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a11a12923dsm2815e87.64.2026.02.28.05.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 05:32:00 -0800 (PST)
Date: Sat, 28 Feb 2026 15:31:58 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on
 SC8280XP
Message-ID: <hfohv2evihmqbaehmnjsj2cgmqbjytsa2j2z6l3cph2jlszv3t@d4c32rfdvt6d>
References: <20260228101907.18043-1-mitltlatltl@gmail.com>
 <20260228101907.18043-5-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228101907.18043-5-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=Tq3rRTXh c=1 sm=1 tr=0 ts=69a2ee52 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=oZPMeiHd2FbyKtjdOA4A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 46yK4RdX4NHtvNHElzDAuHh70kX0CdFm
X-Proofpoint-GUID: 46yK4RdX4NHtvNHElzDAuHh70kX0CdFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyNSBTYWx0ZWRfX1PwjermZm8Jf
 jwyO/QzttBwS40fdE7808X69qR3ur4f1bq1nHyrZsyVkkLTYb2E5WF5bK0drKQb2KhOk9NlsVgE
 D3JaZz3+i1FIa72bu6UZPuQ8k5rllEskccBm1RLb8go8CJ3IdXOc5OPpQlic7k19UPRgLmMcPp5
 XoN/f9e21asfPh0JTi0fhbsOp9pAher5ESWywnHfP5iuoy2tAuMPfohWtPa6yIPVW80HCir1nzf
 HWBzRMinoYc8vMgMu5muv+j1R0Yk31B/BtqSCBWwRVHxmrTkzfzHwj5NGOA30MNELFkgsbO/XqE
 0kqghRNgjVznYsweX+40VvsU1jCWzmKk0cWo0UP+ug77fOuzNPTuMNApT0MGSH3pPGqpa1WOEGV
 3eg9ohDbYy8mU3w/Lshxv0IEVu4/txOSEkaKZFzqKnn4OtfY/PwjiN+LPz3wodprbs7/nplQUIU
 t2O7xO0yqs/aqK6r4Lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280125
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 25A6A1C33FA
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 06:19:07PM +0800, Pengyu Luo wrote:
> The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> utilizing the same register layouts and clock structures.
> 
> However, DSI won't work properly for now until we submit dispcc fixes.
> And some DSC enabled panels require DPU timing calculation fixes too.
> (hdisplay / width timing round errors cause the fifo error)

- Please squash refgen patch into this one.
- Please post at least the dispcc fixes.

> 
> Co-developed-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Tested-by: White Lewis <liu224806@gmail.com> # HUAWEI Gaokun3
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 396 ++++++++++++++++++++++++-
>  1 file changed, 388 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry
