Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGKdI95FnWmoOAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 07:31:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88BC182718
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 07:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E71110E4B5;
	Tue, 24 Feb 2026 06:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="REB79/Ty";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfBM3M1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9F010E4B5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 06:31:54 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O4LqV51460886
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 06:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CbD57KvOVMFD3V1n/xjvFIE9
 X9cvT4wMbpskcqH7IqI=; b=REB79/TyQ/lQNOhbdNjiQ/Vi2U3BaTJqm1ie5Pfl
 DryJpFK8LmA9KzXWLrD+qE6rFE2Np4Xj6RQHal1pWhFRG1tA1LNd/rYwojGcbErM
 8JRxfr1fFT6qxa4GjD5vZKL6pG7pNDK+q3vvhCSXGnNFxL8yhtAyzUbPNkjRyG2z
 EG5B6C8BTTBvmMo+wDmjFuZgNkBamO4fEpMJ1HOhfTS+fxxqQ26hAjuJuHZ16PWb
 hBCqMRcZxK4jqY5qhgcjfO8GtWurKxgNeVFkqZ1y+woU3ECGN0+c10ouH+caOB7y
 Rp99Ou4gcd44aVZ9nOt+mwTrYh2mF2p3hpOh2UDP3OW69A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e38c0m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 06:31:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb52a9c0eeso462390285a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771914713; x=1772519513;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CbD57KvOVMFD3V1n/xjvFIE9X9cvT4wMbpskcqH7IqI=;
 b=HfBM3M1RUjcAH58T7aTP4q6e7a6xz9dDHLy/8eB/zEao9ZliTWkNlUpRcVrwibqdBH
 PIFrNb4cn3JLwGI8YGcFgDI++59b7Zay+uT1CEz0WC8owYwLp9EW+19rhZxcDRrvC1gd
 q//IOBv439WjXuFlr2US7YiaZEmgnjEfREx6nFY5SMqdYjwQV2T0bOcZmOLTIM8I7Qxt
 90yHomT65bE/ec647YXf0mP6ILN7hrPFhWSWKw2q80qwA0ILi8s7M0NOilK6wPeAMDlM
 NJyhY8Iha8UWPuMLgxyqMqc7htvegxbqmX4RmQrNEvDt4on7uihch6EQI/30nxFQYbGb
 lRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771914713; x=1772519513;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CbD57KvOVMFD3V1n/xjvFIE9X9cvT4wMbpskcqH7IqI=;
 b=m355dGuxL8Spn98ykfGikMt4EoR21bqO6RjugapuWRQhQ+8kaIGUPEjBTShSoBTF68
 XywLz4dyn80VjjzfjsF3pVKM7m3+9/JtXTuKB9IasRMty0vqSBmhj++nAfhXou0HK2HX
 pl1QhD7sh6zEZ3dKhrKqa7bUw3qQwP2dgSnsGBOVGkWrRGfovv5NdAYiy+f8WN5DUOsp
 5+Vqdl64lVvhCTNLXbNukB+hp0YAbEhoAq1jBKRPWt+CuTeAjeXGiOQaW2nP7hWPrO33
 X9vSmswQI4Tr/8yMw99nM/g0nSaRDjsOOg1A+EUVDY5SM2Zia+WSPXFfc+L3eeIrwoit
 2izw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn6ZwpDdNJnDZRqYXLTOobXhxD4mWD+aBG5HZ6O57trXbCsf0o4JfioJzD2BdRlSbaxrXI6LUcoiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLByQGTRPX4g/a6Qk6Gz+w19dRj9siWsdnT54K8gSe0/N2axRO
 0zutLSz24sOw41VCJOHTk98+rYkrG0yGttCtc97WYrVNrx3rEHFdTw8JC2eqHICSutSX6GnvZfg
 t7+ZFV/kohr/V2gsxU1Zeeapp1MVEXfFXbUIDKe4z1mRzSa62H/nMFii/d6SrCuNarDgP2tA=
X-Gm-Gg: AZuq6aJMVd1OjulQh9Tdsqd0rHLA1UBt0oH+MgkUGBkVZx/jR0Lb6KQYhUqi2X4wW+/
 R1ao3nQM/SBmewBlb8wgBp47aRgo701L3xPDJzxYa03JpeK+9EqwkEPunPIvOsL3l6szZsz5dtT
 eh+gA7Hr/qBkSxMCpb8hXMcoDfDAb9O7HfrYpTvWubF7NSPZ/9wiDbYsUaMkJ/UlTIFypuNlJdt
 2OsVvJ7LlObSMQzTzpFdatc7F4icnKTBLQpkytclnZvd67ERtakgkBu0qjDjLvN6SBBzLmwXhXN
 JTEDPgQugZMkK6LBMre3YIOAstiiBAUssDpCvGxRJkW14QhNpJfgmUaoLNLc3khUou71n/Vf2as
 rxBq0bIA6wAUJzOjoqLP7MHNLB6ZjvQ+wblHMDdV9UF4q8pHYo+w0niJOoniYgLOQxoA8wuOsx5
 XwusVoKq8FFpPk9EICQGBFCu6VT1hVYmoRMgU=
X-Received: by 2002:a05:620a:390a:b0:8cb:7b27:9336 with SMTP id
 af79cd13be357-8cb8c9cf508mr1406129785a.5.1771914713364; 
 Mon, 23 Feb 2026 22:31:53 -0800 (PST)
X-Received: by 2002:a05:620a:390a:b0:8cb:7b27:9336 with SMTP id
 af79cd13be357-8cb8c9cf508mr1406126685a.5.1771914712795; 
 Mon, 23 Feb 2026 22:31:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a7af19d4sm18218211fa.42.2026.02.23.22.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 22:31:50 -0800 (PST)
Date: Tue, 24 Feb 2026 08:31:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Pet.Weng@ite.com.tw,
 Kenneth.Hung@ite.com.tw, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add ITE IT6162 MIPI DSI to HDMI bridge driver
Message-ID: <jencn5ukz4qce277zbw2gakyuuqvqknpsxi3yqhgyewnkxickr@y4e53ocb62or>
References: <20260223-upstream-6162-v1-0-ebcc66ccb1fe@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-upstream-6162-v1-0-ebcc66ccb1fe@ite.com.tw>
X-Authority-Analysis: v=2.4 cv=DfIaa/tW c=1 sm=1 tr=0 ts=699d45da cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Ns9eNvu6AAAA:8
 a=nHe1MMW0IAeXxdot7wcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-GUID: DaiTHv-htg1GwYP7mpXz3aLPP65NytM1
X-Proofpoint-ORIG-GUID: DaiTHv-htg1GwYP7mpXz3aLPP65NytM1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA1NCBTYWx0ZWRfX+kLo09x28V06
 QokOuaihpbWQhL3vqDdDq+1nDFWXEvAp5BR9jAp/QVO8HQjrKKFd7pbLHA8LFw2kIOtRS5pyjdO
 25LfBn4CxcahiyRaua7kGO+OmkZoTmhS511h/6WO6wCpZfPliywNnSLxYk0cfcNV1CdPrw7J5bj
 s9gZl4ZKeqCLaZOn0m6HbhH7gn2+9Is5yRsz9SYWaEBacoTRGcQt+WtoyiMcPclNzi+p3y0pvZs
 MhENMAEL1RMC+nKfOoFs4ghQ0HZT/H+ijgXENS39wwr+yu3elMgP9KiY9Q0fOtRhGk5ASPsNFnI
 LEReYhvusGjDdCG7l9fXrzbR5x6l46LP/+cSyGKuKZIDz689nFtPjIY7BminQ6YH8eAVKfSULVa
 KF4kMTLv5Lr7P18LF0m/0zcn88EkGnfDgqsceffv4bazl3+Y2ZJjjiNKqWISsyy2OoAlIKS1irD
 T3bN4yiiVEtAYjX66cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240054
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Hermes.wu@ite.com.tw,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Pet.Weng@ite.com.tw,m:Kenneth.Hung@ite.com.tw,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,ite.com.tw,lists.freedesktop.org,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ite.com.tw:email]
X-Rspamd-Queue-Id: E88BC182718
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 05:20:44PM +0800, Hermes Wu via B4 Relay wrote:
> This patch series adds support for the ITE IT6162 MIPI DSI to HDMI
> bridge chip. The IT6162 is an I2C-controlled bridge that receives MIPI
> DSI input and outputs HDMI signals.
> 
> The device supports the following configurations:
>   - Single MIPI DSI input: up to 4K @ 30Hz
>   - Dual MIPI DSI input (combined): up to 4K @ 60Hz
> 
> This series introduces:
>   - dt-bindings: Add YAML binding document for ITE IT6162
>   - drm/bridge: Add ITE IT6162 MIPI DSI to HDMI bridge driver
>   - MAINTAINERS: Add entry for ITE IT6162 bridge driver
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
> Hermes Wu (3):
>       drm/bridge: Add ITE IT6162 MIPI DSI to HDMI bridge driver
>       dt-bindings: display: bridge: Add ITE IT6162 MIPI DSI to HDMI bridge
>       MAINTAINERS: Add entry for ITE IT6162 MIPI DSI to HDMI bridge driver

Please change the order: the bindings should come as a first patch. Also
please squash MAINTAINERS entry into the driver patch.

> 
>  .../bindings/display/bridge/ite,it6162.yaml        |  156 ++
>  MAINTAINERS                                        |    8 +
>  drivers/gpu/drm/bridge/Kconfig                     |   17 +
>  drivers/gpu/drm/bridge/Makefile                    |    1 +
>  drivers/gpu/drm/bridge/ite-it6162.c                | 1876 ++++++++++++++++++++
>  5 files changed, 2058 insertions(+)
> ---
> base-commit: 38feb171b3f92d77e8061fafb5ddfffc2c13b672
> change-id: 20260223-upstream-6162-3751e78dfcad
> 
> Best regards,
> -- 
> Hermes Wu <Hermes.wu@ite.com.tw>
> 
> 

-- 
With best wishes
Dmitry
