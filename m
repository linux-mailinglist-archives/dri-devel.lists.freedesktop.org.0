Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIqYM1cipGmMYAUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 12:26:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D5F1CF508
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 12:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DAB10E14B;
	Sun,  1 Mar 2026 11:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoJcbcrR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSLRBHcW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BBB10E14B
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 11:26:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 621Aa1gI1540515
 for <dri-devel@lists.freedesktop.org>; Sun, 1 Mar 2026 11:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QmUr1rTU5LpJYmI9eic/VBnv
 fwQETQhpUNXRgKER80g=; b=IoJcbcrRtIpOByww44k8Wmb7didV9HBwATFnYr6D
 ViAHRvji+yNjDLfo8oinu/Gly+W4DhWpZezO0wAU4YTVugo3JFskOhWEVpCl/SkI
 y7/J59R9jAWCW2mNU39Edy/PnxVwrEisHNTYpMG3p5GZvHDW1HFJLveefVdlC+Py
 x7vI6F/fO4u4b6wy505RQO6aaHEIzXDD5A8kbax6qO06zcHamQC3J9TB1LEJsKmk
 NxpFprNBjRp8H1TlxkzKEs/L5v9rTFr5AsYYBVmeuRtR8yFwT5Rm3Ev+PFAE8Skz
 Xpy8L2CaURFUEmbwQ5UI/n2dAwSDqDKoXHdBz/OdHz6ADg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd2mf7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 11:26:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c882774f0dso2984461585a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 03:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772364370; x=1772969170;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QmUr1rTU5LpJYmI9eic/VBnvfwQETQhpUNXRgKER80g=;
 b=aSLRBHcWEp6thg+98zj4DkudHFoqTuTMX4hfTPCY10Ivy9N4DYz6LNb7AUyit0ekTf
 j1qYKu2dmtVpq6t3Fnc0iQa/9cRnxw6IyEJ77kVEMLimH+cujH1OPP0/rnhU/FAj4dks
 YttlUj9gyZYAi++AlnUgHGN56dsMAlDieaz7LK9IiZZGIl6555aC6J9pD6sAH/BDWhyG
 myFGzfFgsCew1hxCU3UVHrP9TFWo5MAmyAxTX6Asi48WahrNFL4Pe9gVBoQYpNUZTFmq
 viCNxoy0DTVjq0TSH+BgBR7fPMW86UiGKMBQbodJLAUo6+hdwi5W5xggTl0hIJzcDww0
 IsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772364370; x=1772969170;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QmUr1rTU5LpJYmI9eic/VBnvfwQETQhpUNXRgKER80g=;
 b=ck8yrFiLqoPTmE8iKs1ZDSbhK0uY5vu+w98g4kLQGS3MgkGUYhYrGiyAoeRB5xoTUc
 ZtBDYIW8klIJ/GDYue2IFXytbET9OWQzSmxO5BP7zpuA7AFtR9CvoWWdfr25PV96e0be
 Hk4HTjTVslcr0ecj2PWbZ/My+VByfxVuoRRVj6uJiYcR23yWU6Sc3+WvkZfADMo+xB4j
 JEnI2KBIM+WoICybU7jGAo5EqEKF+/AOJwhLfIl1uBWK3fqOVaRuNW+6zhHo80bxD/M6
 1uccmAQACrywSTHhT+bNJ+8O4nnNglB26jpZ+RZ802rHaWEE9X1XAB5Rjg33fJIKyes+
 Pk7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqGcL76iW8qq0ms2BIODLgWq1fSrI8mOCHQ2PRRKIc797rgu6Lm+rlc/tmUV9Bgy5QrQSmszS49Yk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuNZ2hZ6X6jq3CMOAc9bc3c7zHS5cvqa3/51sd8DNfTS24OkvX
 7QEBtKcwlm2poyFQE4uLMwf2C/Jyfkmtf+gDFY5qkNg4+4PKREYyKGv/8XCdN85YJGKovNHk/7r
 RSIJAhld0P5YUy7ubyRa3Es22UC6uCRkNv92xQguOq3d0ep/tns2xIkECT8BTbaC+equgWJY=
X-Gm-Gg: ATEYQzyl8zkQwvMRHlBY/4DetG4eaIsUocmhLLNofPI0VpNOqNqJVuGdrzzl8mHlOBv
 odZIZy7Q9fqBrPrsAIO/me0GqPV2jzIDLXuWWP2LnQS6kSFyD6VkaeLmT1D1+ily3cZvrWLOx3q
 Har7DFpealmBtUkZAKoa9Kq3T9ZWbV8tuxEd5hHXPD2hdL4FSl7HFVtUo2MwS0P7TURgY6wxZ0H
 XV0CDld6QmGujfDWStSqPEFdHU9z5pBYGd3cIjO8BqjiKiPe5p3yS498HCTA9jUD7cXxJ+bG6m6
 dD8QvJlcH4vmHLjaAQbTi5/9k7kygA/AgXc4MgvI/wSaG9P2FZNHQigSBZBXGJtPzUCTkiku/aP
 y+4M42R2wIEF7bUIoaxfh4AQuSYrWUTdYErMnlGp5WmaxHS7jnSQzs4fXGP+BDukb3+SLz5rz6I
 BWOR60u5ixJRov3uCiBGm1uSVyt8twveXbwXY=
X-Received: by 2002:a05:620a:3726:b0:8cb:4289:6c3a with SMTP id
 af79cd13be357-8cbc8e34841mr1096658785a.74.1772364370539; 
 Sun, 01 Mar 2026 03:26:10 -0800 (PST)
X-Received: by 2002:a05:620a:3726:b0:8cb:4289:6c3a with SMTP id
 af79cd13be357-8cbc8e34841mr1096656085a.74.1772364370036; 
 Sun, 01 Mar 2026 03:26:10 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a1136acaa1sm1350284e87.59.2026.03.01.03.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 03:26:08 -0800 (PST)
Date: Sun, 1 Mar 2026 13:26:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pet Weng <pet.weng@ite.com.tw>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hermes Wu <hermes.Wu@ite.com.tw>, Kenneth Hung <kenneth.Hung@ite.com.tw>,
 Jau-chih Tseng <jau-chih.tseng@ite.com.tw>,
 Pin-yen Lin <treapking@google.com>
Subject: Re: [PATCH v6 3/3] MAINTAINERS: Add entry for ITE IT61620 MIPI to
 HDMI bridge driver
Message-ID: <iyalnt2hcuqxv5nydtymj3snfbbxo4mnwzze3dyoo3iedh2654@ygruo3o55sl6>
References: <20260130-it61620-0714-v6-0-70afa65923b5@ite.com.tw>
 <20260130-it61620-0714-v6-3-70afa65923b5@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-it61620-0714-v6-3-70afa65923b5@ite.com.tw>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEwMyBTYWx0ZWRfXwhyoaNjwl5CH
 bm6qNKL/qUaJrmWkxqEOq8B/qeD8w+087EBnejgT4C2KPN+caWJnTSHputdD9uchaZZ9t1zutME
 /zN8PkuaS1GN5G0j4I0DUtj9/7th8uEqt852LEmLEbru5IXvVvLSB1+LosehQOWvHQcq2+4KAgm
 nhpI7ZoHrTHbC9MlWzKCm1Tb33CAIR4ky4gtO/4VI77ui5kVkt2uf1xImfG00qG5TRHwB7B+0+h
 zkbovbxlb9qz23v/e5vZEzxHL/P9g2I3ctW246myT3BixTRnbQb0aIoVNZu/aaP0/AVZFzxOOqo
 O67igqzo/2f1fLHpvXbLAQXXDh4W/ZCrcUrPIIhcEtaa8y07z5Ua/dsBicT/V9RA8fC4GXzWaBv
 wt0kksfQC2BerGrqCW2qeIZYeyJLatZl9rgVvzlXv8SZ+ZBphs0uZdyHL4YWIwzCT4Ym9CuVGFe
 fdVLjVU0JmcfFjGwx6g==
X-Proofpoint-ORIG-GUID: OpPY8PsC4kEQE9r9P1OusbioTuEV7v8D
X-Proofpoint-GUID: OpPY8PsC4kEQE9r9P1OusbioTuEV7v8D
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a42253 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=Ns9eNvu6AAAA:8 a=IpJZQVW2AAAA:8 a=KKAkSRfTAAAA:8 a=m8IrmWRc0mMpOOsEDagA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=LZLx1i01EnjtqRv10NxV:22 a=IawgGOuG5U0WyFbmm1f5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010103
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
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pet.weng@ite.com.tw,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hermes.Wu@ite.com.tw,m:kenneth.Hung@ite.com.tw,m:jau-chih.tseng@ite.com.tw,m:treapking@google.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org,ite.com.tw,google.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,baylibre.com:email,qualcomm.com:dkim,lists.freedesktop.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 46D5F1CF508
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 03:51:36PM +0800, Pet Weng wrote:
> Add a new entry for the ITE IT61620 MIPI to HDMI bridge driver to the
> MAINTAINERS file, include the responsible maintainer, mailing list, and
> file patterns.
> 
> Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b84ad595e226f231b256d24f0da6bac459e93a8..6775ee371aa11bcaa1c45bbf5ea31d4aa5522288 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13504,6 +13504,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>  F:	drivers/gpu/drm/bridge/ite-it6263.c
>  
> +ITE IT61620 MIPI DSI TO HDMI BRIDGE DRIVER
> +M:	Pet Weng <pet.weng@ite.com.tw>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
> +F:	drivers/gpu/drm/bridge/ite-it61620.c

Squash to the previous patch?

> +
>  ITE IT66121 HDMI BRIDGE DRIVER
>  M:	Phong LE <ple@baylibre.com>
>  M:	Neil Armstrong <neil.armstrong@linaro.org>
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
