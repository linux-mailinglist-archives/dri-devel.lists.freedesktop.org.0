Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPS3OUEDn2mZYgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 15:12:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36863198894
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 15:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273B310E884;
	Wed, 25 Feb 2026 14:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zvdmcl6Q";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BmloyK/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4721810E884
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 14:12:12 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9SsKA2691966
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 14:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D/tdRG/a6yLtpVfy8PztF2ki7pTLjIQWmR0qzyE7NZw=; b=Zvdmcl6Q2vScmYbm
 O5pNlk7bx3nXRQ97tj7oSCoV4KF/4VHAsDDN/as2Y0gw8bndw/yP66rZKCQC//s3
 d5usxQ9wQdxP3Ks5UeXyzoXI/0CbiqUuWkoeBNOd76o7i0BmvEDNtoo6uAOz90Lm
 Mya7iOZBZZ6iA8856Ln2H/qk3+UuPURrzWru6P6QNXUEoA7GSsBUbZmCXNHhoRwR
 qB8jCOeLFxUP9u+irk5fxNC0qKPaLMkR5tM3NsY1Qblbu2gntzf+Zn8vsuHqRjp6
 uVgeWPj6Ywnau0ImCdA1Aw68ulWBdTkbBuKE49QqXWURuNhVn1yUxMdT9kMsMZzx
 cE25dQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg2gueym-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 14:12:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c70ecaef21eso153222a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 06:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772028730; x=1772633530;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=D/tdRG/a6yLtpVfy8PztF2ki7pTLjIQWmR0qzyE7NZw=;
 b=BmloyK/fROd0atW3KsED9dQjLp8XMgO23Opy1qAyQ+3mIh07jKGjt+/xAm1LhX9tml
 JELGvcwfRnWM6t5WJGFTauajS2GwpR8+XZGFKI4yxa8+WWljm6L1z4o4SNwIpvJ1oE/E
 isB8IZcaG5G3U/O1Fh1AizpmW/bHSdt8mVjxMItq6meXAtyPxfLR9u1SGCV2hwXilRSd
 QmTFELvpWIe3+0CwR5dh1k//ir+J5dCS2GL/7whALCNR4+pPHax50b08QQ9/BinUhN0R
 NipCZiuWfqjqYcbGgl9PVwWpIYDJfZWhLZOPu7s9b9Ec+2vnyxjJpwgiKNzSdbDXNIJo
 Fy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772028730; x=1772633530;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D/tdRG/a6yLtpVfy8PztF2ki7pTLjIQWmR0qzyE7NZw=;
 b=NijHqUUJXge0rugaHzo5ntt3MM0lIvBWANa2AsMy9yXkRtXzZgYbXbE0N8toPfHab1
 FTCzyW7NRrqK5X7O2tnV4PcgdPktl4GTby39XSqKBwKXnwBBIgU/dQ770xu6rijgh8PC
 QjF5DLdLZuG+inJQa9h5BHahePURcR37QGUBUisIXk0wXJm3kfkHIaT5mfgBWwcZeWNW
 EOt+6L/6tLISf2tNtLcHhdHXwWYge7TTi3sWOGojMtxDoTWxtQ9dMhlxV2Z64Q1DbzEi
 7nLgEEcyQEGXD8QWiWyc4DZDt88yps8VV4ZZ81sTSG+XXPcg679pk5InesiBHIon3kRH
 cXXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl7jgHp0zirkmj5nxSwfXAHS+1q+K9/QIwf+AIqs5yfFzmX7Yiv7Eqon7BRBvaAJRdZFMAywCL0jY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh5mSfG4nOsYWqhBNTF1wzrmChqGNdKhUinVm304/P/rvOrxZE
 WdSSlA+GK8nvSxHP0td+LWrqjRjFkaNAH8P/AFMBCLHwsn/58Hskazna7mLTgk50KV6b76jgLMd
 7rE7BoIfAaBpavvuydMGB1aNMvyt+PFCzW5qhppVXkWocqYqduHTyP9dgjgOVQnm/gA5hsms=
X-Gm-Gg: ATEYQzw7tBkORXhPeUjZIp0Cq9MGtqdEoMtwPWXHPY3VhcuFoFis+rpXl3bKySwBJ8j
 4EAqp3ooGo5k/iHWvXBF/tPXtcc3kONORBhIkHKs0Vc/zaTM1JSf2CaIMkWQ2xfjbht4ZxY0xH0
 o/S8t+3U6TCvvlQ7ywuJYqtUA0Mi2Yk6WHGYpRzdoFPKq7A5gKsSnb902KUalhJ9TioOW+IfALd
 vilFEyFaZ140oqTnZP7Dt4FjkBAlLPCcXQIpE/Lo0o3JSAMicNh6rzq3j2gSIOCJCGWEnVrDZr8
 HLHCJo1DvW9ixaaTIFfsaZB7Gu7B7jPKoGrIFFIPRrOZAjR+NAj7Gb8mUscXv3c4jul6etmwEWP
 sv3EEfPIZjS1kgQMvqEG5N6wB5ZduAxZJa8+UIcltmDaliQeXAXJHDj97KgbHv836r/56HTAjj1
 4NkwLskpGN2FduhOarhGjnr1Uojjus1Pk0tvjGM0awhQ==
X-Received: by 2002:a05:6a20:258d:b0:35e:11ff:45bd with SMTP id
 adf61e73a8af0-39545f7a3aemr10149915637.5.1772028730047; 
 Wed, 25 Feb 2026 06:12:10 -0800 (PST)
X-Received: by 2002:a05:6a20:258d:b0:35e:11ff:45bd with SMTP id
 adf61e73a8af0-39545f7a3aemr10149892637.5.1772028729571; 
 Wed, 25 Feb 2026 06:12:09 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-826dd63f1b3sm13722907b3a.3.2026.02.25.06.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 06:12:09 -0800 (PST)
Date: Wed, 25 Feb 2026 19:42:00 +0530
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
Message-ID: <aZ8DMPRqKWvxKIFC@hu-vishsain-blr.qualcomm.com>
References: <20260224-lt8713sx-bridge-driver-v4-0-b5603f5458d8@oss.qualcomm.com>
 <20260224-lt8713sx-bridge-driver-v4-1-b5603f5458d8@oss.qualcomm.com>
 <20260225-agile-godlike-orangutan-07abad@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225-agile-godlike-orangutan-07abad@quoll>
X-Proofpoint-ORIG-GUID: zYendWXxW5rLqJrByVQfL0YdF0Lq4uoS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNSBTYWx0ZWRfX3utMsShIKtKt
 cxmdiD7TY1no5tvmWcCpRifZ+MTGMwscRs3WZtMAYOyCOzUuDwUhPoIjt/I2wAkbJw5O6tGSbY9
 phr9aEhrH19pMmcC1GcAP2HptJypLsAwxxvMKTZb0Fsk+94HXKmaN1pkFRXrxPfTpXlmM+9WbLY
 svgxShLWM+sr7C4T3H5WtwXuxmfqsLQCbmBx2OhsrXJG1w7j/A7xCB057IBGWNLNbY/O37aPtOW
 DTWk6RHfgLI0/OLxnXXcj0IaRFQaqdmmxNWaVuJ2nIWOxpgkVFSgx/4wsHjtb2pOEZ/gy6ASK/d
 mCf24BtKmE4S0pvT+p8DpOAQyEIKblEb6lFYiZyqYbaG9J1nMiinC7jpwZ7RXcbh2ZvgjB4DZny
 lWZEz560YVSlSToC+CGgHofiY0XdaoAu7tV8UDJlSzKb7pNsjNOg3qYnK2ghm4OB3oB3qB6mOEj
 wcFM6SJs83+0gS7C9XA==
X-Authority-Analysis: v=2.4 cv=ftHRpV4f c=1 sm=1 tr=0 ts=699f033b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8
 a=Kz8-B0t5AAAA:8 a=8oXlZb-C5KnNZdz608wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: zYendWXxW5rLqJrByVQfL0YdF0Lq4uoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250135
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lontium.com,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com,lontium.corp-partner.google.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:syyang@lontium.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prahlad.valluru@oss.qualcomm.com,m:vvalluru@qti.qualcomm.com,m:xmzhu@lontium.corp-partner.google.com,m:jernejskrabec@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,devicetree.org:url,oss.qualcomm.com:dkim,bootlin.com:url,lontium.com:email]
X-Rspamd-Queue-Id: 36863198894
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

I will fix this in next revision.
 
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

"Tony <syyang@lontium.com>" is Author in original reference driver shared by lontium so i added him.
Will cross check with lontium on this and update in next revision.

> Also Tony, please kindly ack this change.
>
> You already received such question at v3 :/
> 
> Also not sure why I am spending my time SECOND time on it. Read very
> carefully all the rules:

Sorry, for missing the Reviewed-by tag, the v4 patch is not significently changed.
i will add Reviewed-by tag in next revision.

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
