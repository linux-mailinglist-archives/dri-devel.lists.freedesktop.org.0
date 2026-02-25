Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Cs2MpdJn2lEZwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:12:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2327C19C9B0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF58810E222;
	Wed, 25 Feb 2026 19:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCm1INdN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoOksD2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D72910E222
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:12:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PHjT5D3056476
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Lg9srVmRK+oZJLWJq17xoEHm
 pPxqRtxhu3c9PChBOMk=; b=WCm1INdNRRhbh84DyjMSXzpeUoIeQXVsQgHBlF1h
 Ndkvbhvx3lXr7E9lEF/C2lv7P1XNL91hKJWoBQPh0Ju3cQ8qDmL8N4hvHi5mx4Xb
 xpvtgujVzIept+Zev/RH/7hr17o5f9CCDpLLq/c7ZicXw3Ga2LdzZX3eXzwD8av9
 9hGSbTuWBNDjgYpAJRgqznmnbhInDU8kIHwTTvMK007WXU74W2nrIUXjgZRCiyr8
 ZDgLf3CSVdKV8UTUfhoIJCPhtWkXt+diNrnOdGZ/33Tl3HfsLLImO8fyTA3KdLeB
 qw/AJbDZk+cn0Otpvkc1kuFzAmdGKQy61y9ZbdjiYvRPZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39hx1v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:12:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c70ed6c849so5286002985a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772046737; x=1772651537;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Lg9srVmRK+oZJLWJq17xoEHmpPxqRtxhu3c9PChBOMk=;
 b=FoOksD2B+aAJZfbvQGJtUcWMMZEzB/DNSK+cNAjFlw3xhiULdw5kbwgz9mm3epe3eG
 syLYL+GwUHhPWDhv5El4gwdFjL4L2peuWVCku/EdIHBvVq3yyCw16iUdfubNdd3/s4Za
 EGO9N0XXit0yJA7kzaukHPQhNEx3v+34E0TioIcEQpN6YcuR/FqBMPeH0MQkGmCsPBEO
 sxjcQsiKp3TK/jNCUUNnXOganIg0FeTfdLKOgSDgLYHEsn58moOCxfgqxKDRk4K+o7JZ
 6DYREr7IxVa42FGlPf857pGrVab1v3lnVToVR1bJif76uANIpiJgsNve7lfUUUSoNUs5
 7u/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772046737; x=1772651537;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lg9srVmRK+oZJLWJq17xoEHmpPxqRtxhu3c9PChBOMk=;
 b=d5JaW78ArTXsbq+DQjTJ9Jt+2KhNUvOvYrrx+U4SWBEDViGQGGK14PW/Kvgy6IdyOY
 DEkbAwyea80Hc0IOGMM7y0FVC4oJz03QUo6GhptQ/RqUFFOlSQD6Sp5GoOToSqxC8+y8
 ySR9AGwF2JridnjInLmbmr8lLNAiEybBgkCwGCOPKtAQ5xsQDuoqi0+CACcYbR+PlfnP
 aXiLNafujdPgo40Xomj8WIBEFqNUV7ldLi9BUJkDUq6qOmJAGGkAy46BIoIDpze9eIY+
 fhmZv313T30YH6o6OXJ5EEG0qsX7rNXu9+nB/mPv+3i/dOZvaY/6NwV/fZiMm4H53/tN
 Kudw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXF/eZ2M84/aWjUNDAnYAcqGzksldRHRCJqmdpWI9hbchFDwk9oozwk2QEd+FemRrND9asuvRQgC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyU/yWqO3wVPsSXOb8Sj9L/ECxWxTDFizDJ5W92ao3FE4267F0a
 VyYb3Mreg4Fj1EtvvIFrE9vL6DaPmJrQjEUwgmF/riRZM6kSAxadPt9fP/aYr73VjwuUiWYruRO
 l/R3AQpfkL/evBI+HUhN3IOo9+u0S0cAnwXArD0dgher2alv0MGTIRL2NDfS2FiJxLxvdbgg=
X-Gm-Gg: ATEYQzx3O3pIcbxVwxIzDUyDf/yWSOjU99TrPeEx8/hd3sBkDgz+qbOGofLlL4rRWEU
 q6xt2yVvtnFD6D4GLB3RQc6mebTWd2Uql4QE3KUnKJkPI0qE0PtU7s30Hj4CidzE4W6brTs/a2w
 x0gIZHEdGJH0qnQMVhBqQDC+IBtRBpT+K3KaqXT5/tZCz78XjLv/Ru88OeVf5A/Sj4iIhWaORQ2
 VZWURCAC0j1atbNI5sWql7psLfothfZtTbz7xegOwBtdS2xvg1d2xVI3Jx57H9hyW3T5pwOMbAC
 5/KOd2wH/cKfPuK1v3dJrPmKtJTqwkxLgTFyrPeM6PaZ/DGY7B674z8bx1QBAhc/Pm5PNWZqnk6
 tk3v5JOc/b0hb3QMkoXm2aZpawOg6QFef+gtO+9h48RF9L+oWeNoWFexFBmNSwnRFMpohhof7L7
 T3Ecw9NUwKb3CrUrJbCaKGgFzphLS4L3DMzNs=
X-Received: by 2002:a05:620a:440a:b0:8a2:ee8:e7cc with SMTP id
 af79cd13be357-8cb8c9cbf76mr2070542685a.5.1772046736866; 
 Wed, 25 Feb 2026 11:12:16 -0800 (PST)
X-Received: by 2002:a05:620a:440a:b0:8a2:ee8:e7cc with SMTP id
 af79cd13be357-8cb8c9cbf76mr2070536685a.5.1772046736335; 
 Wed, 25 Feb 2026 11:12:16 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a7a1feb7sm30070291fa.29.2026.02.25.11.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 11:12:15 -0800 (PST)
Date: Wed, 25 Feb 2026 21:12:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
Message-ID: <vgcb4n6ciybslspdoa5fkvb5zwz7xon6tnxjmxxzkqutabgoq2@sgbxxtgdyeig>
References: <vU2QyEVqOu-D3eGp7BZFICUeauxL32bwWzeidOAijoeVaJTk8KcRVsaQQD4MdFQEcaQTZ5RkzRsz9-Lhl1qsqg==@protonmail.internalid>
 <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <172a9083-8cd6-428f-bd3d-d831e610b37b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172a9083-8cd6-428f-bd3d-d831e610b37b@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4MCBTYWx0ZWRfX46Okp1s2zK2F
 mnJTziyO7fT9RoZDZ0lIRrtWxNnctVQCqceZUPDGhQVKDpiAFQYSvE3GV0uV3i+E+G3gs3XpnWf
 FGU7sLtW2LT1+FWoAtXE40n3JAikDAYt5b3Tu/hRL5WGIujTzzGR93fO7NG/9waAiUqZus36Yat
 itXEl5dWtIfv/1jo5XVjbInBhHf9QvNlFBLqhziG36rtUlPBhW8Fk4q4eAbVGeDJ5Ey94dN/D3W
 CuXbnMaZpMizv5GobgtWDWhS0Du/atp60HSN1ShqaKpuJTR+tXje7XZ6hqbHCYesDDH7TP5EdpV
 DigpdZ0+WhYxMwQA1+6sdH4OQiUxNoE2Ex92FoxvZqb5lUanKzGIMPchtecvN4Hafibo2DXM3nN
 iSo4CQ3CdCGbolz2b+AHYJEZFdq3KzLJPjOsYS7wYYYk5KErGjC8t6Kx6FkV/rMmmiuTvhXGJtA
 iunFkrQhAxISEpcj6LA==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699f4991 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8
 a=DISFzqtZAAAA:8 a=jajewSGiAXp_dDDQNc8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-GUID: _CE-w2xKH1Norz1e0ksnwKuksjON72aS
X-Proofpoint-ORIG-GUID: _CE-w2xKH1Norz1e0ksnwKuksjON72aS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250180
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,tomeuvizoso.net:url]
X-Rspamd-Queue-Id: 2327C19C9B0
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 01:42:19PM +0000, Bryan O'Donoghue wrote:
> On 23/02/2026 19:08, Ekansh Gupta wrote:
> > User-space staging branch
> > ============
> > https://github.com/qualcomm/fastrpc/tree/accel/staging
> 
> What would be really nice to see would be mesa integration allowing
> convergence of the xDSP/xPU accelerator space around something like a
> standard.

I'd say, writing Mesa compiler to build Hexagon code for Teflon frontend
would be a nice item. It would probably also allow us to use DSPs for
OpenCL acceleration. But, I'd say, it's a separate topic.

> 
> See: https://blog.tomeuvizoso.net/2025/07/rockchip-npu-update-6-we-are-in-mainline.html
> 
> ---
> bod

-- 
With best wishes
Dmitry
