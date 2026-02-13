Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO+SOqxdj2mZQgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 18:21:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4078C138962
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 18:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E1710E053;
	Fri, 13 Feb 2026 17:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcZbj/gi";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBig0iWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D445B10E053
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 17:21:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61DFLqtE3893153
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 17:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kivQ43A27uvAmPAQ6L05kIqO
 MtzdQ3TdAouFNPVkN8A=; b=pcZbj/giOr50Xqa5xAlVzpy4mNH09o9KHCO+aYzp
 aiSwQKydjPlRU6tYzj8WxyrFB0msRXuqiZQ6S7vEU62iwKbWN/iV2aBjx+7NLAn6
 jpKozUrIOT8rBuEQ4mTgPV33n+5t/LhbG6NiiZxtwwkQMfosxMXVmgDku6xcwQzh
 uVeGMJkdZM1uCI4dCQdaKismu5Ar6g1u2g+aYX6ockfwGeN2OgIvuadlTtSx3jY6
 BpYh+Vg6KIcCkGz2AuZ8Z9P54ilmFI47OTiVb4Bz4Gm3BZfDrQELRsmAK3+9R2C3
 9jojAqKHFPO4WUXMhTigN5hxe3eNU7KAYmq1WXixu1FZeA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca6h7rhhw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 17:21:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb3b0d938dso438451885a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 09:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771003302; x=1771608102;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kivQ43A27uvAmPAQ6L05kIqOMtzdQ3TdAouFNPVkN8A=;
 b=PBig0iWkxYjBzNs3q4D/QTCHmUIRWVI2f8zFH01y6Us3RKiix/8Rw64BCKKiwrjSMT
 JcYVPQoZ5VUCSRQhN1wbk4wUefo2IYwlll30C3LbgOTPqGmV6aDWD3WCl4S0u8s8kuKy
 mRxOmILOFkWzvS5B9RYhaq7SGmBixyemus571fxY+ZSCJQ8pDxEq/zMLCIDcCsaWamrB
 MqQ9HajMMthVFO6/qNGYtlovK22FEjJjY8d6xukjGIG2IQsfm/XpYl0nu1+08ndqnJUa
 JLydN+2aXtqLJmNdBbD3HdtokON9EnQ+bahDS9Vpc1KFVhjmGvjfeOA+KsLL/Kt9KokB
 t+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771003302; x=1771608102;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kivQ43A27uvAmPAQ6L05kIqOMtzdQ3TdAouFNPVkN8A=;
 b=S7lnDNbO0gEonZX1cZ44ddp0yMLpskj/dm2rmoZycBloBeZtpgjMEWFgoMWpmSh8h7
 L/PNeOpp84KC1lSvu19/oBqCvurJI2ROZ5K2bG8RiE0KGLadteaYH9wJntWG7DQAKYG6
 D8pSrJUIrTXi9epVpZd2m5ctvKrpSCbxwyDvtIdVvui6QDnS35JBI515G7EdRDv1gGur
 0YUfkGhgzVRJFQLvetFyikxMDSL9wXxPjR1xts0I0x4liPGlt7kaSXUOl2LFBIqG4H12
 GvgyoxGTzunEicOACvcku5wb8wAfAAuSAVnYuU32J6nbBr9TsaFRSyjCofsPeqFdcQMv
 z0JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdYJMvy69bdD18/iR3RJXyo4+frxWoED7lILc1nZaMWGmqBBN5YcHYwGNrdSxfQE2aeaHDhUIca78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNE/4mNWgKspXGSqngYYMz0iA8s/7fiVlW1FZ3jdx+bkKqT+Hr
 ErPY/BuVD5oRIxkIzML2mpfcn+0jYqqaSlbQJjmc8kYO1K56Jnlo69N4pPvEI4Q9SHXkw+8qqO9
 A76mDL44sMx3ZBKz0ac98Z5zg1W0xOmlXc54bansuU1sfFQvCGApcoGkfJyPzz7HZC4rTnu8=
X-Gm-Gg: AZuq6aI3p1/lgNNWcQ9bg7a+PMk3/GE2bRgtpVnA5rKWOtLtq/GgmxLnwoqulmDCQQC
 rleBn+wCYBerMKlZPlHm+b+dsD9bUzIWukTL/C9sdHqae5f8ZZdELMsjC/7yxEHK14z97ZZPoFG
 367AqrDScudr9W+daGWbxQL6/MMuLQeQ/SudBrvj8k+gcqEwIGvNuUViPE8J9QFSsT0NYcEEsnO
 43QKahqW4a9Tw1sb3FLcTYkXYx9IbLnPCmllGoMIoIftAbECH6HmxyGTGn7FQNICA/4ilfUeuJj
 9Ff2DJhxd0Li4GqLMwkN6Lw6qSy497CSkOPJRZUtHyK6G+q01T578f10p6gd5GpWbgWXJWVGcs4
 DR2Bq6jyzRXi7Ue6dTnQeAvVm8RSU6tPPwR+3a3/sqeQXT6JE+poq9tBguaIDVvyrs6S3/vX5FK
 jjkX57yEocp/RAqPjo/3w6Kq3nQhzr7mqlfKg=
X-Received: by 2002:a05:620a:1a29:b0:8c9:f996:81f2 with SMTP id
 af79cd13be357-8cb42252bb0mr314104085a.17.1771003302305; 
 Fri, 13 Feb 2026 09:21:42 -0800 (PST)
X-Received: by 2002:a05:620a:1a29:b0:8c9:f996:81f2 with SMTP id
 af79cd13be357-8cb42252bb0mr314100285a.17.1771003301813; 
 Fri, 13 Feb 2026 09:21:41 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5a50e5sm1678959e87.53.2026.02.13.09.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 09:21:41 -0800 (PST)
Date: Fri, 13 Feb 2026 19:21:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yifei@zhan.science
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sdm670-google: add common device
 tree include
Message-ID: <pyqfeuepbadviyigknugbucuf5lw2piqe2xvk6otgo5q3vtxsq@eqnxns5oefx4>
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-6-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210023300.15785-6-mailingradian@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzMyBTYWx0ZWRfX3r3aF4vaYHg4
 /2t3T+kw4fG7wlhK1Z6VabI/GMH/CYvA8PsKgr5NU8ev5p9JH+SjvLsB0mo3OYuLWzv8t9pAb64
 INngoXaNhj4ZhVKrVBVjhZmPucXB9Ob1eVLIHboq6bxHAD4pJtsnuzdsZxUHixBACcZO/rGedTx
 UcCRi5ggMo08Lzn8TI0xMFcPTESMdWB/i0ykCtFKohhp+bWVwRbvDpJChKsDhZ8uj9ChzFuQ6Oz
 Iyr3c3VNftZZFdsGDX/sZQMXUYu/5QAJRtvoqPq51UEDeBFTDxHJ+lMjkgo+JolVIkhfnXuJLGM
 Ml5dlUjyeiB79HIbn6NCllqvCov6rfIn+PnbUrGLcNLkiOCfnKZhSuaNF0TZpaTx1iX+J+5G1uN
 zSs2wHI3GN0RoPoE9wD9S83IslxpMGotwCy5SteY6i6cvhhn9cExZENGgfgdlzAPcChzZN/ookR
 uXEsHa05xAYgyOhvA8g==
X-Authority-Analysis: v=2.4 cv=IaKKmGqa c=1 sm=1 tr=0 ts=698f5da7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=abYoSyeH6r3HoE31TXAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 86pRk2lhsCoxnp_KloqWVv_DrFmtVTP4
X-Proofpoint-ORIG-GUID: 86pRk2lhsCoxnp_KloqWVv_DrFmtVTP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130133
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mailingradian@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org,zhan.science];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 4078C138962
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 09:32:59PM -0500, Richard Acayan wrote:
> The Pixel 3a XL can be supported by reusing most of the device tree from
> the Pixel 3a. Move the common elements to a common device tree include
> like with other devices.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  ...le-sargo.dts => sdm670-google-common.dtsi} |  17 +-
>  .../boot/dts/qcom/sdm670-google-sargo.dts     | 710 +-----------------
>  2 files changed, 20 insertions(+), 707 deletions(-)
>  copy arch/arm64/boot/dts/qcom/{sdm670-google-sargo.dts => sdm670-google-common.dtsi} (97%)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
