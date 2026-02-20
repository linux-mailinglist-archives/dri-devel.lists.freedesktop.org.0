Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPKzDuEnmGlqBwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 10:22:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCAD166263
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 10:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5617F10E7D2;
	Fri, 20 Feb 2026 09:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJqGkoD+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="em+/gxfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F55810E7B9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 09:22:36 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61K93C0O2088741
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 09:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fcsW1LF/JcPb806BA6vk9bWg/mVbQYnz26kHqfxsAS0=; b=KJqGkoD+X8OIYIic
 O6Qp/lY5uSsUpLQKovlfWs+VruGEkhqVmqrAC8q7hTCbmKHB4XXFJIGPEjm1xaF0
 AtuYRU64N5DDtjxErQUEBvsZdaSgS3dKR/nISHwqGc55TtNVEvLay77ruq7BqPeI
 /X0yKShf36dd5VjoFOy3NNnHR20/Apc1MLUpwK0PnbbQecJ3Y5XXfmj5U44T/ViU
 ijatTQbNwprKDJSYn1spzXoob1XCbj4gtwPh5tZ70TFCZM1I6/kLA1pvj29mU+42
 tAjcEuYpxlwn6oHPWOrI3hrAnpDUfY+ikdLG3C/r6NajMHj2I4og3T67v+/3TUCD
 FEPwvw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce1k83cgd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 09:22:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3547c799b27so1295320a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 01:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771579354; x=1772184154;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fcsW1LF/JcPb806BA6vk9bWg/mVbQYnz26kHqfxsAS0=;
 b=em+/gxfHQHFxOQpuqjxQiPvperrtb7KGN+waIA0M2Uh4EAGBaB9zM/zslFjk6WJLiX
 rcLZbrm4Vg1FzJ9uBu2KCfhlcYGgKV5XYYRIw2o97DBEaH3ajkWSxZmsy7LjUire1e/W
 u3NDxLj7Dr4+ckO74cbW9d9wcFrI70p37AYkkIj8rKQaEDdoxBBuZx9OK30Y89qFYuep
 gPRkDXCS875sdYmsND1hsAfVYKpM+oogktjH/l2bKScmKXW6KiZo/tVIm6Cf8QtHM5+P
 bGuBb9S8AQTahyP/0eDpbHbOM3uHU302urnqRVmpIhz36nTteQp4RtkiSLAdlAdezrq0
 uyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771579354; x=1772184154;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fcsW1LF/JcPb806BA6vk9bWg/mVbQYnz26kHqfxsAS0=;
 b=mK0Q4M5tjO+WxJ/V1WlstnbScD+ubYM2Lj0074JKt3GM1K2UkWymL4AKRkCVsSYgMl
 r96wtu2nOf32CTrmcfx/Bt+gr6Y+qFAwYKlwrZAIS9vKgJel8+CIxjP+uVudkEIj+HUO
 6LRBZIv6a/Pjmaz9TGV5ICfHRxCAAGRYT9PBhFE8QXpmJqMs0MKmbcj5lQmh2gK1yBrj
 f9hXonjBN2Phv97VwE0+QgFsR5XO0xk4/4BWyWUyWbwbUmltbkzgQS8UhBzmLIHLEXno
 7bMsTPr1bWJTDqUCK9Uo+UkZFP8OGeTR8kH/EVcee85+NUBhxXdEPpXUdTeqMq4P6J2b
 yOrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9ahm8zDuPXe5bqo3DHE0FESNxCoFhh4gM61LHzFlMOFz+eIP+cpiuH86Gerqzc6KAUFEzuYCgx10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynmAj2UXTtxglmQ4uMa54fjbN4IHCuJ812tf5FPDdObLSg7q1u
 yk6I9EevSFhOVWeodOmj09HwxOivIfeqkFaPXHNLnH4WUT6KLxXUdmfUj3eSIwIz1DPmVuZPBNn
 gH2RFz5U47lcJAPmwxZ71XP1Ayw9GT3iHH5+Fbbgp7d7G396DqThg2fQF9AO+2JUDnyrKQws=
X-Gm-Gg: AZuq6aJB9OaEQWNPL4reMgICEFPCsJv1/5gFiDE3Wx89aYEuiauaQ0llXuS8KRymVxM
 yxZ8cvToUwPfNmMa8Y4wXrfE5Ueq+Hx9/qs32m1GJt1Hc5RU29WdKAAxLSJfOJBTQs46nuQ5xoq
 SoM8ZdqECIFXSAKLDsc+KsnalhZmKalhdVQET0fbpe0jAcpY9vVZVovczjrINK7njz66sC0XOJI
 5+2DpJh1Pz+1+bSFRM6/zTSic6J7+V4F08nLA/WAJh52OkHwdMM4VunNLNxzCoxb982zpnb7pnf
 FmF566E53TCRHHU7bo4Ro0DC7lFRl9XVsClHt/KONCo5jRUYWT42XW7g7a73G5emmEu4A9L0V5F
 GsQEA8hhjFQOkzHTU9RaohjzXBkA/jVyl5Uw2v4lswWbYRGElRXVWcyKipmxJ2Iu2NlHCK2VY+v
 8GcPl+8fttmpkNPUCySrYwta0Sq/BrRR1lkxWgCy8eMA==
X-Received: by 2002:a17:90b:50d0:b0:354:7b96:1304 with SMTP id
 98e67ed59e1d1-356a6e3dcacmr15691187a91.0.1771579354228; 
 Fri, 20 Feb 2026 01:22:34 -0800 (PST)
X-Received: by 2002:a17:90b:50d0:b0:354:7b96:1304 with SMTP id
 98e67ed59e1d1-356a6e3dcacmr15691156a91.0.1771579353789; 
 Fri, 20 Feb 2026 01:22:33 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3589d811aeasm3253607a91.6.2026.02.20.01.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 01:22:33 -0800 (PST)
Date: Fri, 20 Feb 2026 14:52:25 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Prahlad Valluru <vvalluru@qti.qualcomm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, syyang@lontium.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Prahlad Valluru <prahlad.valluru@oss.qualcomm.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] drm/bridge: add support for lontium lt8713sx
 bridge driver
Message-ID: <aZgn0WaVv9T3hLca@hu-vishsain-blr.qualcomm.com>
References: <20251228-lt8713sx-bridge-driver-v3-2-9169fbef0e5b@oss.qualcomm.com>
 <91290a53-8f59-4138-9899-4523d25e1cff@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91290a53-8f59-4138-9899-4523d25e1cff@web.de>
X-Proofpoint-GUID: T4uYGP4EC0nre6HZeskOi9zArsqg1CSf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4MCBTYWx0ZWRfXxpInVeQMXgsb
 YMqs/WmWmnHO0RnUNdp9n5tCiwVMBF0MUJL+wZh2jbhUnil6o3g3Tpqe3Kt84lVnB4OlfVDCxx/
 OpvxyhqZiocUKosQXKrdpJyiAsKHe00h80fK4hrgC2zberD9ahWKyH3MLs2MOS5CXiUHJZrmpjD
 6qwv2jc/Faf1k1qiTKILZet5K+pJvH+SvkmYVszSBF5edZmOJ1eXxKuZleD7wI0AxGvElHfC1i5
 0v01+S6m+vXqVoBjn5bIFThZAUfbpYdYKZChoDI3NLBKL3JR2cuNxztkZEMTu75i45kqFohXjQz
 HXxgjAFSEVOAHsD4kKMpN86G4GvDA6cdbCua0xsrQq5VRzhyuoIx9DOLvPoQ4YFA3ukSlymf7CD
 HyGXMXsuyuLDUNVfQ6Zuk63QObJdJkY4Y2ivkvPS03Ut2cGRpOU56cUp+MyO2Egs4PIcCNHFop3
 34yUAHh33rjqmY8b5Ug==
X-Authority-Analysis: v=2.4 cv=cdrfb3DM c=1 sm=1 tr=0 ts=699827db cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=P-IC7800AAAA:8 a=my0msLyqr9YCKrkcl6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: T4uYGP4EC0nre6HZeskOi9zArsqg1CSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200080
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[qti.qualcomm.com,lists.freedesktop.org,vger.kernel.org,intel.com,kernel.org,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,lontium.com,suse.de,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Markus.Elfring@web.de,m:vvalluru@qti.qualcomm.com,m:devicetree@vger.kernel.org,m:andrzej.hajda@intel.com,m:conor+dt@kernel.org,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:rfoss@kernel.org,m:simona@ffwll.ch,m:syyang@lontium.com,m:tzimmermann@suse.de,m:prahlad.valluru@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[web.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 9DCAD166263
X-Rspamd-Action: no action

On Mon, Dec 29, 2025 at 01:40:10PM +0100, Markus Elfring wrote:
> …
> > +++ b/drivers/gpu/drm/bridge/lontium-lt8713sx.c
> > @@ -0,0 +1,682 @@
> …
> > +static int lt8713sx_firmware_update(struct lt8713sx *lt8713sx)
> > +{
> > +	int ret = 0;
> > +
> > +	mutex_lock(&lt8713sx->ocm_lock);
> > +	lt8713sx_i2c_enable(lt8713sx);
> …
> > +	mutex_unlock(&lt8713sx->ocm_lock);
> > +
> > +	return ret;
> > +}
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&lt8713sx->ocm_lock);”?
> https://elixir.bootlin.com/linux/v6.19-rc2/source/include/linux/mutex.h#L253

This function holds ocm_lock across the entire firmware update sequence and has multiple error exits. It is therefore a good candidate for guard(mutex) to simplify error handling and guarantee unlock on all paths. I will convert it to scoped locking using guard(mutex).
 
> Regards,
> Markus
