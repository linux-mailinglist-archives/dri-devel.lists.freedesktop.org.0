Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePufGbwun2mCZQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:17:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9547819B626
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5E910E7D3;
	Wed, 25 Feb 2026 17:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KiWpLnMw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDHWIgAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483E810E7D3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 17:17:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PGkMpZ3632343
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 17:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zlhhBeBDZHYroAhwpgIufMaWgUYA4mcK1NKdH2dwIU4=; b=KiWpLnMwbAFkAHaz
 89bFWXsfuqfI69YBtIJSlf5qugU+40wlRvv5baioME5yzga3digRu8fT1cE3s/FY
 hL2PfPgCqykveDZ+Lz2VyB/lCQAyoZ0svQBTXH8rQVDfBzaCiojgbAnFfdBf1Sip
 a7df93bZQlT+unXcLtfpXjiqIvx6AIO4Le8/LiHzNGV18oad7SOkubvEIhvAeEa2
 JMweihFR8NRd0+/WuZyKOLzOJch16TUelt3MYCv+u8l9oYO8gVKubedOcbbAJvsf
 2VVNRZ2hm7MYhdbSFxLf2EIc8jO1HelXBn7yktbJYip6uZvo/v//oS03iqIcA8I0
 Ahy8DQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj4w4r3r5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 17:17:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb4b8e9112so622012585a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 09:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772039862; x=1772644662;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zlhhBeBDZHYroAhwpgIufMaWgUYA4mcK1NKdH2dwIU4=;
 b=EDHWIgAyZ/T5We6oasXHF4gle+ESAdvoK6ye6jTxqf9/ygds3pg7mCLjPc29Ap8yeh
 v/qWcZgtot68hqqAJRduftCsZ51jLuRnFQ+9P7maCEPZUEISao49ES/aiD2Vn5b785x/
 5f1kiIzTbGxNikQz/IXRTVZcx1k24eFq3mAhMoiG8DsF3q4GC4DkbDYLWmoMCnbi4Dp5
 WR8mGOeAlCZRBkqGfSxDBdyZGLCAvBFbgy2FGdGVToPe4alVoIC9xOmGrLUw1en9FDYC
 zdOTqYQnt9ijHgj0Il32Jqad5/f1Jb4U8X7bH4EFRrLSzS2kz+wis4d/L9dfCzTzCt3w
 ZpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772039862; x=1772644662;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zlhhBeBDZHYroAhwpgIufMaWgUYA4mcK1NKdH2dwIU4=;
 b=AFEt0hvEAXbTYr/zPx1AqM+TZinOqj1x8DEVBa/AZ8DvVX8+H9rYbLnoGCyVio4t9M
 1zqOMGk0HSfb0iNyP1twd0669dwSJ4H9uYWq4Ef9eP2tnrJSDGFMZC/04y78xuEnDeo/
 SBR/qSQzoXJYpb3khDMrZPdl5+Xo4d+uT1f20logxxt3CocSBbmAZWUEMivTjcyCFzgo
 YUp9fcsj5Pq/LRcl4oxw65/WsScgNnfN9XWniiuEBXwyYUbgdV1tF1xRCFFlHv4qQJX0
 SG4Fiys9lU7Htl5WttEnS2PDaiAcwOfgQJtzY6g/t2MZuF7jlLg2tbcOuG6ranZl1YFu
 G8eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz4SAZOKRN7ihkZbktS6vmql3dG7OxlQLXERNa9FNPdODBg6tRzOso42Yhkit2aqKtuwpgsw3QvPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkQsNDlfdQ/rNzVvC5e8hVp+KSGqetkfq3NtNKW/RlrbHBb4fc
 caNBFPhXCH7k/9aMk+osf7mLXmXacVefV9BQ3T7vTa80F7bU1yhGN2veU4CK6PFwEfF23tejPyt
 sQA1iTHTzZOE+4vgsQWmOcKnaiIzn0etAFNhKqSd7WJAMEfe1zmgSwbJ3HukHX7q8rI9ek1s=
X-Gm-Gg: ATEYQzwsvS8dx0YSNGViz9EAMJPTOhzkOsnCYgAOUmdchcKx6VkeoUF7yIOM4M6HIWs
 wy2Wq7MsKkQjvZ/37UyYMVz8nap5jVghaU7ZIt6/s+wWUY5gAOaV45DsslbZ8gZtlQDYkR6hUNA
 LuF3uNXY6dwZfIwLsw8zz9VCHaO9G+7JWd2ztfZfbxJL20mzigYsU3EaeAt84W+AbmjhLXbABFr
 6xmMy5s3hQhstnaGNcZUuvKA2zNjy+DxXAxdJXhKPRap9KMaJCTfTYF7SuZGLfMkS49Ms9Gpz+b
 52g+8cCPSxyOVNNu7zoQwHYuIlnHoqAJ2WA1SvJ0ErDefQFzZ7jLhc85zmQurE/GXztU+16T9Vk
 rGdYQAiwozsPfGkcbUPtdy2YTJpLJy7OQdfz0KHbyfDqZDTdOApvl9J5wCOw7Zs3LNJsBgsKrDd
 UldqOUChbOpx9ze7sOi+4S+ATYVdOBwv6KDdc=
X-Received: by 2002:a05:620a:3712:b0:8c6:adfc:48fe with SMTP id
 af79cd13be357-8cb8c9fe778mr2045652785a.23.1772039862001; 
 Wed, 25 Feb 2026 09:17:42 -0800 (PST)
X-Received: by 2002:a05:620a:3712:b0:8c6:adfc:48fe with SMTP id
 af79cd13be357-8cb8c9fe778mr2045644185a.23.1772039861293; 
 Wed, 25 Feb 2026 09:17:41 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb16344sm3159248e87.37.2026.02.25.09.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 09:17:40 -0800 (PST)
Date: Wed, 25 Feb 2026 19:17:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
Message-ID: <en5tdgemre7vq5qihe6wnkbrro24vtzwfxwqrpnrrmugxoszs7@x2ox64zeznvd>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
 <jyd3ufisoz4xcfe2dvu26odesaz2czj22jn46qswkzz6ocg4zu@6krzvyvirkmo>
 <ceba8973-4fb7-4497-aebf-dd41f2d2eaa5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ceba8973-4fb7-4497-aebf-dd41f2d2eaa5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yIcsW5t6jPEsGNavpesbIZehDZ4DrUPd
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=699f2eb7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xDAtTkWTXggOwAMwgdAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2NSBTYWx0ZWRfXxJ4VghvQCQTx
 vyV6x/eorNqd2GIOaeaoBMOUSV5ru+kD/7sbqiBC5Y46YroiYBlngjNGp4+sZItDN+EvzU2xXoB
 Yf8he32RtrffMJG7VZ5nAS43IAeH+b7+0QQyhgSMIDj7nUlY/Kw9ZxWXZPXqBcYRpNh3xlbJAlj
 kIwYGJP10llN+UpT1EciQQl3saSgRWNzsmSujn0W4SNwOh4CVeGybsGa5C8D8WPu6/EOlhbTCGh
 HxktfPSlFhuTCcNdUJeNzCDmQfiRMwHyGNqvZBs7IwWZlRjLJcKPdNXBmv/pWuPAuto1o7hcH+w
 luoUMqHZlX6VK0iuRWb9bBPE3ABbl0bW8YkhbRlyOaZ6hsyffADPf97ivMoojHQGU37xKujwO6P
 gSKjV4g8Se3bqlAZewxR+h/qKyvZ4nvn3HGEkzMEtABlmN5fCl7IivlIuRUP3SfJlSnrDDXRkbC
 LlwHLUTeQu5VV4Cm4pQ==
X-Proofpoint-GUID: yIcsW5t6jPEsGNavpesbIZehDZ4DrUPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250165
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 9547819B626
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 07:27:47PM +0530, Ekansh Gupta wrote:
> 
> 
> On 2/24/2026 2:47 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 24, 2026 at 12:38:55AM +0530, Ekansh Gupta wrote:
> >> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
> >> integrated in the DRM accel subsystem.
> >>
> >> The new docs introduce QDA as a DRM/accel-based implementation of
> >> Hexagon DSP offload that is intended as a modern alternative to the
> >> legacy FastRPC driver in drivers/misc. The text describes the driver
> >> motivation, high-level architecture and interaction with IOMMU context
> >> banks, GEM-based buffer management and the RPMsg transport.
> >>
> >> The user-space facing section documents the main QDA IOCTLs used to
> >> establish DSP sessions, manage GEM buffer objects and invoke remote
> >> procedures using the FastRPC protocol, along with a typical lifecycle
> >> example for applications.
> >>
> >> Finally, the driver is wired into the Compute Accelerators
> >> documentation index under Documentation/accel, and a brief debugging
> >> section shows how to enable dynamic debug for the QDA implementation.
> >>
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  Documentation/accel/index.rst     |   1 +
> >>  Documentation/accel/qda/index.rst |  14 +++++
> >>  Documentation/accel/qda/qda.rst   | 129 ++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 144 insertions(+)
> >>
> >> diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
> >> index cbc7d4c3876a..5901ea7f784c 100644
> >> --- a/Documentation/accel/index.rst
> >> +++ b/Documentation/accel/index.rst
> >> @@ -10,4 +10,5 @@ Compute Accelerators
> >>     introduction
> >>     amdxdna/index
> >>     qaic/index
> >> +   qda/index
> >>     rocket/index
> >> diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
> >> new file mode 100644
> >> index 000000000000..bce188f21117
> >> --- /dev/null
> >> +++ b/Documentation/accel/qda/index.rst
> >> @@ -0,0 +1,14 @@
> >> +.. SPDX-License-Identifier: GPL-2.0-only
> >> +
> >> +==============================
> >> + accel/qda Qualcomm DSP Driver
> >> +==============================
> >> +
> >> +The **accel/qda** driver provides support for Qualcomm Hexagon DSPs (Digital
> >> +Signal Processors) within the DRM accelerator framework. It serves as a modern
> >> +replacement for the legacy FastRPC driver, offering improved resource management
> >> +and standard subsystem integration.
> >> +
> >> +.. toctree::
> >> +
> >> +   qda
> >> diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
> >> new file mode 100644
> >> index 000000000000..742159841b95
> >> --- /dev/null
> >> +++ b/Documentation/accel/qda/qda.rst
> >> @@ -0,0 +1,129 @@
> >> +.. SPDX-License-Identifier: GPL-2.0-only
> >> +
> >> +==================================
> >> +Qualcomm Hexagon DSP (QDA) Driver
> >> +==================================
> >> +
> >> +Introduction
> >> +============
> >> +
> >> +The **QDA** (Qualcomm DSP Accelerator) driver is a new DRM-based
> >> +accelerator driver for Qualcomm's Hexagon DSPs. It provides a standardized
> >> +interface for user-space applications to offload computational tasks ranging
> >> +from audio processing and sensor offload to computer vision and AI
> >> +inference to the Hexagon DSPs found on Qualcomm SoCs.
> >> +
> >> +This driver is designed to align with the Linux kernel's modern **Compute
> >> +Accelerators** subsystem (`drivers/accel/`), providing a robust and modular
> >> +alternative to the legacy FastRPC driver in `drivers/misc/`, offering
> >> +improved resource management and better integration with standard kernel
> >> +subsystems.
> >> +
> >> +Motivation
> >> +==========
> >> +
> >> +The existing FastRPC implementation in the kernel utilizes a custom character
> >> +device and lacks integration with modern kernel memory management frameworks.
> >> +The QDA driver addresses these limitations by:
> >> +
> >> +1.  **Adopting the DRM accel Framework**: Leveraging standard uAPIs for device
> >> +    management, job submission, and synchronization.
> >> +2.  **Utilizing GEM for Memory**: Providing proper buffer object management,
> >> +    including DMA-BUF import/export capabilities.
> >> +3.  **Improving Isolation**: Using IOMMU context banks to enforce memory
> >> +    isolation between different DSP user sessions.
> >> +
> >> +Key Features
> >> +============
> >> +
> >> +*   **Standard Accelerator Interface**: Exposes a standard character device
> >> +    node (e.g., `/dev/accel/accel0`) via the DRM subsystem.
> >> +*   **Unified Offload Support**: Supports all DSP domains (ADSP, CDSP, SDSP,
> >> +    GDSP) via a single driver architecture.
> >> +*   **FastRPC Protocol**: Implements the reliable Remote Procedure Call
> >> +    (FastRPC) protocol for communication between the application processor
> >> +    and DSP.
> >> +*   **DMA-BUF Interop**: Seamless sharing of memory buffers between the DSP
> >> +    and other multimedia subsystems (GPU, Camera, Video) via standard DMA-BUFs.
> >> +*   **Modular Design**: Clean separation between the core DRM logic, the memory
> >> +    manager, and the RPMsg-based transport layer.
> >> +
> >> +Architecture
> >> +============
> >> +
> >> +The QDA driver is composed of several modular components:
> >> +
> >> +1.  **Core Driver (`qda_drv`)**: Manages device registration, file operations,
> >> +    and bridges the driver with the DRM accelerator subsystem.
> >> +2.  **Memory Manager (`qda_memory_manager`)**: A flexible memory management
> >> +    layer that handles IOMMU context banks. It supports pluggable backends
> >> +    (such as DMA-coherent) to adapt to different SoC memory architectures.
> >> +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
> >> +
> >> +    * **`qda_gem`**: Core GEM object management, including allocation, mmap
> >> +      operations, and buffer lifecycle management.
> >> +    * **`qda_prime`**: PRIME import functionality for DMA-BUF interoperability,
> >> +      enabling seamless buffer sharing with other kernel subsystems.
> >> +
> >> +4.  **Transport Layer (`qda_rpmsg`)**: Abstraction over the RPMsg framework
> >> +    to handle low-level message passing with the DSP firmware.
> >> +5.  **Compute Bus (`qda_compute_bus`)**: A custom virtual bus used to
> >> +    enumerate and manage the specific compute context banks defined in the
> >> +    device tree.
> > I'm really not sure if it's a bonus or not. I'm waiting for iommu-map
> > improvements to land to send patches reworking FastRPC CB from using
> > probe into being created by the main driver: it would remove some of the
> > possible race conditions between main driver finishing probe and the CB
> > devices probing in the background.
> >
> > What's the actual benefit of the CB bus?
> I tried following the Tegra host1x logic here as was discussed here[1]. My understanding is that
> with this the CB will become more manageable reducing the scope of races that exists in the
> current fastrpc driver.

It's nice, but then it can also be used by the existing fastrpc driver.
Would you mind splitting it to a separate changeset and submitting it?

> 
> That said, I'm not completely aware about the iommu-map improvements. Is it the one
> being discussed for this patch[2]? If it helps in main driver to create CB devices directly, then I
> would be happy to adapt the design.

That would mostly mean a change to the way we describe CBs (using the
property instead of the in-tree subdevices). Anyway, as I wrote, please
submit it separately.

> 
> [1] https://lore.kernel.org/all/245d602f-3037-4ae3-9af9-d98f37258aae@oss.qualcomm.com/
> [2] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com/
> >
> >> +6.  **FastRPC Core (`qda_fastrpc`)**: Implements the protocol logic for
> >> +    marshalling arguments and handling remote invocations.
> >> +
> >> +User-Space API
> >> +==============
> >> +
> >> +The driver exposes a set of DRM-compliant IOCTLs. Note that these are designed
> >> +to be familiar to existing FastRPC users while adhering to DRM standards.
> >> +
> >> +*   `DRM_IOCTL_QDA_QUERY`: Query DSP type (e.g., "cdsp", "adsp")
> >> +    and capabilities.
> >> +*   `DRM_IOCTL_QDA_INIT_ATTACH`: Attach a user session to the DSP's protection
> >> +    domain.
> >> +*   `DRM_IOCTL_QDA_INIT_CREATE`: Initialize a new process context on the DSP.
> > You need to explain the difference between these two.
> Ack.
> >
> >> +*   `DRM_IOCTL_QDA_INVOKE`: Submit a remote method invocation (the primary
> >> +    execution unit).
> >> +*   `DRM_IOCTL_QDA_GEM_CREATE`: Allocate a GEM buffer object for DSP usage.
> >> +*   `DRM_IOCTL_QDA_GEM_MMAP_OFFSET`: Retrieve mmap offsets for memory mapping.
> >> +*   `DRM_IOCTL_QDA_MAP` / `DRM_IOCTL_QDA_MUNMAP`: Map or unmap buffers into the
> >> +    DSP's virtual address space.
> > Do we need to make this separate? Can we map/unmap buffers on their
> > usage? Or when they are created? I'm thinking about that the
> > virtualization. 
> The lib provides ways(fastrpc_mmap/remote_mmap64) for users to map/unmap the
> buffers on DSP as per processes requirement. The ioctls are added to support the same.

If the buffers are mapped, then library calls become empty calls. Let's
focus on the API first and adapt to the library later on.

> > An alternative approach would be to merge
> > GET_MMAP_OFFSET with _MAP: once you map it to the DSP memory, you will
> > get the offset. 
> _MAP is not need for all the buffers. Most of the remote call buffers that are passed to DSP
> are automatically mapped by DSP before invoking the DSP implementation so the user-space
> does not need to call _MAP for these.

Is there a reason for that? I'd really prefer if we change it, making it
more effective and more controllable. 

> 
> Some buffers(e.g., shared persistent buffers) do require explicit mapping, which is why
> MAP/MUNMAP exists in FastRPC.
> 
> Because of this behavioral difference, merging GET_MMAP_OFFSET with MAP is not accurate.
> GET_MMAP_OFFSET is for CPU‑side mmap via GEM, whereas MAP is specifically for DSP
> virtual address assignment.
> >
> >> +
> >> +Usage Example
> >> +=============
> >> +
> >> +A typical lifecycle for a user-space application:
> >> +
> >> +1.  **Discovery**: Open `/dev/accel/accel*` and check
> >> +    `DRM_IOCTL_QDA_QUERY` to find the desired DSP (e.g., CDSP for
> >> +    compute workloads).
> >> +2.  **Initialization**: Call `DRM_IOCTL_QDA_INIT_ATTACH` and
> >> +    `DRM_IOCTL_QDA_INIT_CREATE` to establish a session.
> >> +3.  **Memory**: Allocate buffers via `DRM_IOCTL_QDA_GEM_CREATE` or import
> >> +    DMA-BUFs (PRIME fd) from other drivers using `DRM_IOCTL_PRIME_FD_TO_HANDLE`.
> >> +4.  **Execution**: Use `DRM_IOCTL_QDA_INVOKE` to pass arguments and execute
> >> +    functions on the DSP.
> >> +5.  **Cleanup**: Close file descriptors to automatically release resources and
> >> +    detach the session.
> >> +
> >> +Internal Implementation
> >> +=======================
> >> +
> >> +Memory Management
> >> +-----------------
> >> +The driver's memory manager creates virtual "IOMMU devices" that map to
> >> +hardware context banks. This allows the driver to manage multiple isolated
> >> +address spaces. The implementation currently uses a **DMA-coherent backend**
> >> +to ensure data consistency between the CPU and DSP without manual cache
> >> +maintenance in most cases.
> >> +
> >> +Debugging
> >> +=========
> >> +The driver includes extensive dynamic debug support. Enable it via the
> >> +kernel's dynamic debug control:
> >> +
> >> +.. code-block:: bash
> >> +
> >> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control
> > Please add documentation on how to build the test apps and how to load
> > them to the DSP.
> Ack.
> >
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry
