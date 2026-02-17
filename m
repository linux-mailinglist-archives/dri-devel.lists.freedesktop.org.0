Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCP1A8cjlGnXAAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:16:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D577149D14
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBD910E086;
	Tue, 17 Feb 2026 08:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJ58iPct";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AI4cVz5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8362910E46E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:16:03 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61GNUecG2417581
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=L7Se9ZozDPuZSwTwJ1P7pdf1
 wL0THwc/KeQEqUqTJZg=; b=kJ58iPctnagvC2lIwIZ+tUtNaI3SBiZhGZxUfxy3
 e/OP35RiIWwvEksFW1LGY6aPpwhNJMvskrhXbT1NlBvVwfbtUMHIK3TkuakV9rF0
 10KOtj7APxCeNffFXjPO6ZknRDpdPzq+SDPX68KsnUb8kvtlpE+Nf6+xKzerzZud
 JAt39Pn5Rnv0VtJArp2TjTQL7oQJLIu+NdaQwDRmKiWTvPAzP7MmFA5kuUIa3xta
 hqpM9bT0HIHXwiq15J+lOVPetBqwABI/k+FEji7I9VAY+EAqxnN0wXnbOP/Tcfui
 C98i5h9oyRtFuNmL6Jbdw2FodZ6EBGVRePZWz6cu6vpKoA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tm9h9d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:16:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-506c0231e63so267835761cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 00:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771316162; x=1771920962;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L7Se9ZozDPuZSwTwJ1P7pdf1wL0THwc/KeQEqUqTJZg=;
 b=AI4cVz5XhQyvB+0gqOwKoR3+nup3zxKjGs8s60RmRvSvnEoQ1VEqGU3pxzMxAyDKqw
 IzfgccKYa5etL3k0oSU/PZzXZkkuuhzL7s0V0wevXoEo9t2natmSRoHXlyT2s9xsEF7h
 itwXqeiKG/lqS+LePNw1aRrgRr/6xaBmYaxmtRCOJdCNPG3pGUlr0P7Po6mfQvgHx3dp
 uUVShfkiUn0R3DhGf9SdtIRTw/DiqME5JTajKK0jPvcw0koEt8Sua+lCP6QTrL9cEK3H
 oVykeKdZXguPBNqvzLH9Jpv27nXX8jiPrwKrOGGoirG66SC/gooqTxPrcw8ojS1AcJkV
 KXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771316162; x=1771920962;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L7Se9ZozDPuZSwTwJ1P7pdf1wL0THwc/KeQEqUqTJZg=;
 b=CmSFb1ZSOabgsfhXobI2Ied6pMs7wy3q/XjFqiFP5OLL8HjBw+VYbf1j6uCYrC8Onk
 ZjpU40Y2YhkdpU7GUFBuBKdg6qzkX74ZTUiNAhm6/E5HUMJIP268ir8Z11EKrH94U9++
 9cvVmHyMqVJqnDnj6pu+AhuggRnBgn/j4APZxO3eOA7CmzvqyRh5xKWViXkQ2HQ+uGWJ
 CoFJKt4zRxTxioUAj82THYGNYLSNpHja3fcRi3C9CYOiqY8epaW90GtZcA8SMPFbd98E
 9mazMlb/bJGR6UOu5fieBx3Ur82AmLw12O7pupv3VwRqxJdhb+uUMbV4VywzTl72P1AI
 Tigg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAs90X+4Thyj+1sjHHRwovP5QqMTdPS5S3/wigG8ByFPNhJah9TlG/M0sVpd23tF8vSA9aTKSAnqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0FaLcG+QwGbWr8JhTHuP3ngNexewDiCJPqGuBP38lXgM5AkYz
 oaURQ/y5NUY9LKVUhbLOPMC9yR3Yr5lhv2l8tw/RekOC0PLAH75sLMOmFxpwzOtIsCsKQGH/8nC
 GPqacgJx/hws6ftfL75YEpa8GzpkI9L7Ysi4ZOm3szmsv74ZstUPBQGW+VaiT5Z95/0WMU+U=
X-Gm-Gg: AZuq6aIxJVE+ikgBTFPccUlaMMC9cQYelYA9WNey6vlCfC1fPL65u1wBUn5UURV7pLW
 2rWGnB5id9a1pqidqex8OtJqsjQlQZ9BdSgkn4Pbo/ewaZahOKPdusKoQ89URBoz+xSwwaolnc8
 aSv9jCDj+3ZPAqBfkyw28ndZ8cHM1+FCKVYyg0BBKn1ElUFJkJQM7YR8q4rUenZAgSORBpX0Q9n
 5+iSMzm687S8IZkI32jncWxd3z4xelmVKMNyQ80/mRtv1AGx0QSdWUlvPlybBYFhG41g/Q9V+sV
 AzPfU5TbvsqG3I1GCg+Wq0CF5tqmEzaM0P+X4HeFHRzQay4ay5lbcyTaCq2FjYevZhdgkNuRy82
 zGAlkb9UCkqoTlPViMjPRHr6JQCTA+1f+011KoG1MrLr2GMN9pqP3licD0Fhkq7tX87SVHSTT7K
 JhSgRXO4bhiC0xSiJsRTTVX/my1S1uoxF60AY=
X-Received: by 2002:a05:622a:4ca:b0:4ff:b0f4:c307 with SMTP id
 d75a77b69052e-506b275f142mr134586191cf.24.1771316161752; 
 Tue, 17 Feb 2026 00:16:01 -0800 (PST)
X-Received: by 2002:a05:622a:4ca:b0:4ff:b0f4:c307 with SMTP id
 d75a77b69052e-506b275f142mr134586041cf.24.1771316161365; 
 Tue, 17 Feb 2026 00:16:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5ac0bcsm3769119e87.61.2026.02.17.00.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 00:16:00 -0800 (PST)
Date: Tue, 17 Feb 2026 10:15:59 +0200
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
Subject: Re: [PATCH v2 3/6] drm/panel: Add Novatek/Tianma NT37700F panel
Message-ID: <3nhx24v2tqrvnhj4iklih5iprjqyqekedqbzn6vdmzvyxfikbw@bbn5hzefjyhw>
References: <20260217000854.131242-1-mailingradian@gmail.com>
 <20260217000854.131242-4-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217000854.131242-4-mailingradian@gmail.com>
X-Proofpoint-GUID: O6YMvNsG0MBSbCYRj91XWlJ8sD7jAzhg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2OCBTYWx0ZWRfX26Ig6U3jZEi8
 nOlD/0xreRovIk1yHbQWr5FhNNiBnd9T5YQS3Hql8Hs6b/iv8jY2iYukc+5O376xuOE6Mjc5DgY
 C4za0SmrnGC+Pa2MhrfT9SRQSVs2hC6+GW6H/96yl3hTJykH/U06xhhfnndJ3Vl9ICamZoVhzUh
 iaaJHJuTaDGepPoic53BHeXpwU8D6c0pS4ajnQDBp2aPlaHu78wMj7Rc2JDeM4K3EOq454n78Za
 2pLC9P2tWIEozCKyG26hTp9cthl6MFwkBUSqR1c3q1cbfgfmGoOcVdr85bHdjOtNR+sX7X9rUfQ
 RE2kSAr2wgZuGUPaqGWRvFECoWgA6fJfgJqid+h8dt9S4nl+y4EjiuHpVUtdW/jReAVCZbKnFHV
 lYYgKQQrlakdZo1afkQBCxExNCjgA/Iz9qbkHXk3vWGSAdeEp7xse0RKR07bi2qpg0AKu9+fYKB
 9aU3Myt7gI8IQe6vhhQ==
X-Proofpoint-ORIG-GUID: O6YMvNsG0MBSbCYRj91XWlJ8sD7jAzhg
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=699423c2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oINNAWDTXFj4uIHvT00A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170068
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7D577149D14
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 07:08:51PM -0500, Richard Acayan wrote:
> Some Pixel 3a XL devices have a Tianma panel. Add support for it, with
> the aid of linux-mdss-dsi-panel-driver-generator.
> 
> Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Tested-by: Yifei Zhan <yifei@zhan.science>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-novatek-nt37700f.c    | 282 ++++++++++++++++++
>  3 files changed, 292 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
