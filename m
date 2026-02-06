Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gASkCZHChWltGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:29:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0436FCA66
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D25310E6BF;
	Fri,  6 Feb 2026 10:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="dudbY7Kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D6B10E6BF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 10:29:30 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6166Z4OK3275617; Fri, 6 Feb 2026 10:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=n
 TPz76n9O2gmroSl4JTWTSce/6NpF83ZvXm8PZcOSZc=; b=dudbY7KkMXRMKsl4N
 BXVxNTZ+nrgIc5F9KaC3v/S791wHWGyIkQYZzc8pjkFakNE7pojIYHBHdDGeMnyD
 GXUmR5hhrlZqMj6n6lcawLzO63Lgeiyjcx7c9Q4aPy83Y0Vas1NiQTBzMocwlYK3
 ZvkAu+KNqCLkyT460DT33C2kndenWLEQz06CbB6nHiLTnflYrU4Pmx3ntMJsoLiv
 AzuMXqnMcqBGci1d7bQGLdsxeRlWbmLV4zeK4VE3xRBzYnouoX0rGA/QzUiyalop
 8UStVCmQ1kPxNHj0+kfe49h+NrvtJpjrWuXJSGOUdWOvKBkA3pIp1NDGaOD6te+c
 ZmJfA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4c4jfy0yc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Feb 2026 10:29:20 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 10:29:18 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Coster
 <matt.coster@imgtec.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Frank Binns
 <frank.binns@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 "Alessio Belle" <alessio.belle@imgtec.com>, Alexandru Dadu
 <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260123-pm-domain-attach-list-v1-1-d51dd7e43253@imgtec.com>
References: <20260123-pm-domain-attach-list-v1-1-d51dd7e43253@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Use dev_pm_domain_attach_list()
Message-ID: <177037375874.23958.911536028586828029.b4-ty@imgtec.com>
Date: Fri, 6 Feb 2026 10:29:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Originating-IP: [172.25.6.240]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA3MSBTYWx0ZWRfX42pUaGKamrfd
 VawebB8q3KRb4KBVRm+pAR/QsErhaUbN0kHoGUmP421QyA33GNeoGdWyuo2qMiHFIPnaW7D46wn
 l+ShrrQ0wpLdlyIvxdZTOrARJjumZuEgSZu8NpDjVMJQmATAjwsA4pDxPtY0s+Bacqb/6bojWMI
 H5qUTwV6ao7R35jTPUQjWjQOdd3GYAc7ugKWGk2pMCLsvN8Mb8lzXiE+P8r1UmsXvduvAtaRpjP
 5yk8jN1HYp44BnEIYtNenSZQI/f4u2CTSntIPFHTP85/MZ+36wnqmjbRHy1JYRgXSxTzyjjOtcl
 I1kUZpAoy5smtI3dp7v/6iy6NhxJNp6i0GTM17eYLoxPdeKXkly5nIS1s34dDzjA2nAoqv8nxfC
 +Aipr7G+uhcSyXM1R1ulIAdYW8gQzD6uo77y+6dmBUIUG/zxrGqqLK9e9P9nzDu3SRPJQFGOcO7
 W6U0Swj7D2+cfEERL6w==
X-Proofpoint-ORIG-GUID: atWpmSyV2dsRIrV6bUDLwN1tS6T-mSA-
X-Proofpoint-GUID: atWpmSyV2dsRIrV6bUDLwN1tS6T-mSA-
X-Authority-Analysis: v=2.4 cv=GakaXAXL c=1 sm=1 tr=0 ts=6985c280 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=r_1tXGB3AAAA:8 a=A6I4vVEcvyWHdRA4lJ0A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,imgtec.com];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matt.coster@imgtec.com,m:geert@linux-m68k.org,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:email,imgtec.com:dkim,imgtec.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A0436FCA66
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 14:44:50 +0000, Matt Coster wrote:
> This helper handles the attaching and linking of the entire list of power
> domains. Besides making pvr_power_domains_init() simpler, this also lays
> the groundwork to simplify supporting the varied power domain names used in
> Volcanic GPU cores.
> 
> Note that we still need to create the links between power domains to ensure
> they're brought up in a valid sequence.
> 
> [...]

Applied, thanks!

[1/1] drm/imagination: Use dev_pm_domain_attach_list()
      commit: e19cc5ab347e3cdcc21c97ea5d11af8da7f1358d

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

