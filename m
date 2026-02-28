Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAa2G0aaomlI4QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 08:33:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6EE1C10DD
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 08:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C539A10E21B;
	Sat, 28 Feb 2026 07:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXXSHULh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvC6bNYs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9399710E21B
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 07:33:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61S6NlVY3132563
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 07:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zS8VjpOwYS3qceyUhmJv3InOcI9yMX8oo15mZd0gqXQ=; b=fXXSHULh8DSy6E+w
 G5Ap2x2llQrMfyieODbBOe0Ad4QwGy6FbQFaEEBqvBp/meZ6MUhsZcRsiumeejQd
 WLH1rbfDBM1GurO45dN4mE9k/c2IzvUFmnq1u8TRQ44pyF49uOxn1a/39XIn54pJ
 zTmf4q2ESkT4+unNCxSbvOILRJX4N4XZUw6BaE+DXfBBpffQmTr8wjltn1xjgOuN
 PBG/5QXurGdgurh8Zhn3fflti6D8+U4BsVKJKdHKgztDp7Uc07IkbBgC/xri+LlX
 gp6HeC+ouGRMACPMAFHilywDM7NDI1E6ZR6sLjBuWmoPmn5b1iJI92mK4OCFh923
 ZrLpWA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshcges8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 07:33:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-8272b6cda29so1597714b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 23:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772264000; x=1772868800;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zS8VjpOwYS3qceyUhmJv3InOcI9yMX8oo15mZd0gqXQ=;
 b=YvC6bNYs6hYUMivAiAkB3KTt23r0Jl61yyCC2E5kPNegaevqNJqdVFQ0qtNUlS52P8
 UjRv9ECqPEnF7347NStWJQ8EnKR/j3dGZ687Jv5qHJTDa8Ld+WiBCTCUdHkBpE5rfLHy
 j2EL41/KPRIflLfkUwborr/Ey7FZvCKhhjnufvCGueDJGtlhPc9Ejdbml4KxhL0o+RbV
 EjxKzdfY4L7WcksNJJtMb2HtPdIq8cNpXD9Fux2dz2mNmWNJdbNWf8NtewJdNzfCbWO6
 BR9+3IlHoTu/s5FW0jZdOGftFnUP+IXQxhYUJ65J7QXKPJfQm+XvF+gz4jxmfeTGhSHR
 rGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772264000; x=1772868800;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zS8VjpOwYS3qceyUhmJv3InOcI9yMX8oo15mZd0gqXQ=;
 b=CcCm/XstcZFWx6dsPirihOxiSKfycIlFHo3fggvODdVLY5EYs4zWnnrN5UuhtixV1t
 6tSWslRSY8M/rqZc+gILQF7jeavvc20ZL7/sgX7pyLdXnG7fVvbkSo1yJ/79o1MH8uWT
 MaYj3h9FfglcGdoWUqDNom9Ynz2HdPc822kWMcdPW2DxFV4CbzQsu0l2myGS/FhKCkSF
 khUucrROE4SKW7qL6FsmiIDmvtnky+TXYgpHpLSsGalsCX7Ed2/wfKdtCX24PYEDmtw7
 uXi69QrE1Fzo5MF39HZ7chiTZaOX//ic+p8Qh5+TTVH2UWM8ubo4U8GWVziBzm9KTzF8
 Oidg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu4in9bG8bs5v6rfoe2JwORZBTc1nz/EVYFQ13CjuIM5LssPM5rLWIomKQNACQm3DKVADmSWtvc10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxocai+2K0dtMYemd2P0xvfqi5mmF8Y7sg3Yutky6K6/rgv2ItA
 oc+2439J9iOwOwtNs9sa2lRu4G5dzp6nzlnFvE1c0iBxIn8VV0VhC4SfaupfkldjpvBQbtp41oJ
 f6HYwmIqnR2BnbUf/K7uhrlLSuBUEWz+UW3iXm4m4DkG78CLVpTOrTCjeBBjZC80eMH51t0M=
X-Gm-Gg: ATEYQzxL1H/Zh8DLO4Fj4fBhtQIsil18myD0FGBgsdJQGg0RGEYOj/MO7uHvobAMm/N
 s5GI7/3fbKGAUClq/dCvCSxlavm2VSsjSMuRi0oYN2xlOyfX+nUGF/C2TA44JE1Af8U2fUrqC0q
 AHAkLI+IkIIsDnHN2eHH2+S39tIqogwm5fNl+CvN1Je8NMUidVvxgL/zrlzxvxbTIyRgXoR2lXo
 lj5fA2lIivP7XycjGoIUhToq4O3T4MVtHbgZTPByfaVB/opMfIZq47cDSc230ug35N+0xkDf0yW
 Etpr5JooeoE5yARe8Kk+dVs2/SCi32j8/WxV33oGW9w1eYLGA0Qiiw4A1CQ9bArRO7U/5c4wNhm
 XsQqGll1Upubjvk4xJvSfsLIR+QflX7e6n0ItCFRsP+umNPiqOwTg3/orDqQGn8umeZ0vM1wlzc
 FqvnEUMv1KTtpPbm9RlU+Y4FTeXba/N0YEeVkzMgQi5g==
X-Received: by 2002:a05:6a00:bd9:b0:824:91f5:aa2d with SMTP id
 d2e1a72fcca58-8274da05bc6mr2419452b3a.5.1772264000169; 
 Fri, 27 Feb 2026 23:33:20 -0800 (PST)
X-Received: by 2002:a05:6a00:bd9:b0:824:91f5:aa2d with SMTP id
 d2e1a72fcca58-8274da05bc6mr2419433b3a.5.1772263999702; 
 Fri, 27 Feb 2026 23:33:19 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739d8c5bdsm7155131b3a.19.2026.02.27.23.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 23:33:18 -0800 (PST)
Date: Sat, 28 Feb 2026 13:03:10 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony <syyang@lontium.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com,
 Prahlad Valluru <vvalluru@qti.qualcomm.com>,
 =?utf-8?B?5pyx5pmT5piO?= <xmzhu@lontium.corp-partner.google.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: bridge: lt8713sx: Add bindings
Message-ID: <aaKaNlwj3yR5jLgj@hu-vishsain-blr.qualcomm.com>
References: <20260224-lt8713sx-bridge-driver-v4-0-b5603f5458d8@oss.qualcomm.com>
 <20260224-lt8713sx-bridge-driver-v4-1-b5603f5458d8@oss.qualcomm.com>
 <20260225-agile-godlike-orangutan-07abad@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225-agile-godlike-orangutan-07abad@quoll>
X-Proofpoint-ORIG-GUID: 2b7iz3oSaZ8zvoWYV6wvxuIueybABNDZ
X-Proofpoint-GUID: 2b7iz3oSaZ8zvoWYV6wvxuIueybABNDZ
X-Authority-Analysis: v=2.4 cv=SO9PlevH c=1 sm=1 tr=0 ts=69a29a40 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8
 a=Kz8-B0t5AAAA:8 a=_dxOVl7cOmLWDdFjOvsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA2OCBTYWx0ZWRfX/6/HAtezmDV3
 CzD1tTq2AgEXwC4uu1GeW1cNKVEVRP4MmpEPOJ3JjYuzApCYFbSHM1cUiuWmr4VRH1tqiBy1wBv
 Zf5OHINo8R76faxRdk2jj+GV8MZb6F73xH6uuoqGj61RL+31RLJVzOLzWE3POffIeXxl6IUZIxx
 y0M3TxAedOy/z0o6k5tmxYpT/jpoDlZWkZ3XKwC5eu0OntZU5CLJTtWt9bFCfv/0hkOw9pYip5M
 a1qrqHctWhm/NBpfUHxilerLlVHQGGnKoh5V3kI9TcMIqWjIyd9QPz5fDrFtEzTBvnBPVoVZO92
 cE/PZpSknDvV97ZqpJYD0pepASinQLlWukH9vH0ztRJU8iYZa7GJ4RZ/0pTFlO0JQaSIHZqNqFj
 kZ+2KxJwXwe/fa7Cvnvwbm9+UDeiDXgRG3PgWCANOrRe3IO4q44Rr0qRSXmS7/6TiJZSLrG8VDT
 m+MyI2IWGiUg8smbTRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280068
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lontium.com,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com,lontium.corp-partner.google.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:syyang@lontium.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prahlad.valluru@oss.qualcomm.com,m:vvalluru@qti.qualcomm.com,m:xmzhu@lontium.corp-partner.google.com,m:jernejskrabec@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8A6EE1C10DD
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 11:35:45AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Feb 24, 2026 at 11:25:35PM +0530, Vishnu Saini wrote:
> > Add bindings for lt8713sx.
> > 
> > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > Cc: 朱晓明 <xmzhu@lontium.corp-partner.google.com>
> 
> Please use latin transliteration/translation, if possible.
> 
> > ---
> >  .../bindings/display/bridge/lontium,lt8713sx.yaml  | 113 +++++++++++++++++++++
> >  1 file changed, 113 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
> > new file mode 100644
> > index 000000000000..29a773154b39
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
> > @@ -0,0 +1,113 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/lontium,lt8713sx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Lontium LT8713SX Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0/DP++ bridge-hub
> > +
> > +maintainers:
> > +  - Tony <syyang@lontium.com>
> 
> Is Tony full legal name, transliterated to Latin alphabet?
> 
> Also Tony, please kindly ack this change.


Lontium has confirmed that I am allowed to use my full legal name and email address as Author and Maintainer.

Their response was:
"After we provide the drivers to other customers, they modify them according to their needs and submit
them to the community, all using their full names and email addresses.
We think you can also use your full name and email address."

In the next revision, I will update the Author and Maintainer fields accordingly.
Apologies for not proactively confirming this with Lontium earlier.

 
> You already received such question at v3 :/
> 
> Also not sure why I am spending my time SECOND time on it. Read very
> carefully all the rules:
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Best regards,
> Krzysztof
> 
