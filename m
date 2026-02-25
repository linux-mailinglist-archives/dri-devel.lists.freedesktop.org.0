Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEzRJ/yMoGkNkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF1D1AD5A5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17FA10EA07;
	Thu, 26 Feb 2026 18:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hph6Hh7q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com
 [74.125.82.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E84E10E366
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 15:29:51 +0000 (UTC)
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2bdca815fdfso924253eec.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 07:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772033391; cv=none;
 d=google.com; s=arc-20240605;
 b=biEGabbTjPwgGTn4DtIJei705bu6p7TL6BnFX4ElsOCt1JVcEeXkvC5rDjf9NULsks
 XC4upioplD0i9eYJK468qaECg2VyMyHNMvnzfWnuFJKyaMd7RC8OWczQlpKifBwYMjyC
 Qh9rjQ0ap+/oIXCwvIZesloP9CNsUS/CGn7hy+1cu2GgB5B8zoenHpELxEPiZZjtbBz5
 bMz8zRdJ5bRULuHIk5ZxN6dI6OigTKT/fmJ03wMwRQQIFeal0tgTZDkMg1n4A+DI0KMS
 k3Jc8ma4MjRTme3NcVg9CUyWIAqVwdIXZ8QQ9Dr1it3TKVLuqg8zijCTKdsS8YmYRdC6
 d/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bQ5YNTgeCggafYTqJ1Vg5khBu90oyOTzWNTsAXkO2LI=;
 fh=+DOIRki5HmJT969Fq3YVjaFRZBP9qx68DYK+5hdBKOs=;
 b=IzsBfJPqn1T1FHgaWnGsxlNSUByMWSPrAiLVxPZPk/9JbhfkAd7SPBxOydPW0wsgJO
 rNK8OwT4hsv7nV4GIYuqSYTawxqJFLooZDYxGsaW5LC5KtLOesZnNnXUdWhgI7M4ECJU
 /JnUxvBFTPY3sGfaOxzkdid+dQlovuGAdaYQ6fNCOUMiInp4berIJFN8m3/aDSI+tmDS
 T7i87XAPBVd20zI3D1oRem8zE/G5OECTs3TLhfxYKq1hOTbpdZQw3EP/HWKHaNWXKjaJ
 zvViK+CCIZd4CWeW/hrOVCnVsaZM2a0QiSFV1Z4DYlbbsrsghksoFkRc66omr7zzC0Ix
 0ftg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772033391; x=1772638191; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bQ5YNTgeCggafYTqJ1Vg5khBu90oyOTzWNTsAXkO2LI=;
 b=Hph6Hh7q3J6ps0hGU5QJBUaD/DfARUM7QK3VswDjYI8ak0LbApgorDxgILg5Z3KSvc
 zk97n3sa6nxlyz0ff2MwKXUbxqaiFfbIGwQ3WsfhvE7+4Utav+2w5zDS9jd+ZvkkBaj2
 BmOcepQVBUvuyjRt80JkqNBlR6SEYLE4CUALf2ZCRV+WkfybptnIlf7q5V2IR6RH1Swb
 O1O9jkGu+6flMPsTvEsr+z7vC9/eQFeGa6TB4vQEmD20Sz9WXxOHYDNvOspLLA7dLiaM
 uiEOPeFbePbypVLdgvhD8OlZ1lX31P5iJdDJRLlw6EXygl7tEl2nHeFHGCJDaxjG+PU9
 NsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772033391; x=1772638191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bQ5YNTgeCggafYTqJ1Vg5khBu90oyOTzWNTsAXkO2LI=;
 b=rxviXHs03LHTjJm8ZMsDkmHBzwsz+2uLybvKcGcdWveZFVqYFSE7op5Byp4gaB3Hg7
 z0aWWlV/gTqkb1TdF7a4+S8c32Ppjj4WEqc3ImY68F3yGYO5bg20hbjWDJjq8f+/qrFm
 P6RxbH4AyyGlvXwNinQzQzgxclFr2I38J/fx+L71drkYzr32Zsdscz9eJBfc7vlBkY77
 PJivA1nrzNboHH+hZ//x4d1jvVT4xh3YqUBCpJ5a/ko+ekr7Lav1WWk7u0B7JXIeGGDc
 guCXxDWIQilr2fRVJkxOzQamAKwoubUVCw4POaN7Rc3/FPDZLIaYa7TboFRxpwjoJnil
 mx2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2Gd7WEBSeU1jcO2cdOcRa/mZJRQfVKMs3kFXoi/0W8lJPoRq4WfjSfmat5HQBtt+Zy7lqn/4KIyM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+UuiI6EODcEMMpG19WIT7ngzulg6HX28gKDU+7Pq2y8GMgzG1
 RwhF9jf7phBCb6+3q165lHrPQ/8llW3WfbK31E54pesJxOWAnp9zII0X+4psDaDo0SkwrEIuSzb
 /4EBggqt7qoqRbNDsDQjQ/T4LAOdm9is=
X-Gm-Gg: ATEYQzyD5K2hpatovZNu3PROdJrQqhTFuD0K7ts/NWOfqfxLJt9CapLQzE9NktzmdVU
 sCtFQ1R3l8Fz8cYoVogW3XUY3bzfmahTQXnpY29TQSzUugGnTtf7/Kl80NvuF39tFWjGhX1P0ix
 TQU8NjoNjHPjzID9dXuZheWNt4i6m2aST3gjtcMu6vEsILnE6ekWpPoJ412EiVDf2xy9Oo5ccgQ
 J/zt5lSXa9tPE03a9uo1KPen/8xIJssa3S2rEDGFOFfScbi+sgJvRmg92UMHMMmYyaBtNiEAMcU
 36ZMEYc=
X-Received: by 2002:a05:7301:4090:b0:2b7:112:42af with SMTP id
 5a478bee46e88-2bd7bb4b16emr7182670eec.12.1772033390504; Wed, 25 Feb 2026
 07:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
 <20260223-panel-patches-v2-1-1b6ad471d540@gmail.com>
 <20260224-bulky-rabbit-of-courtesy-83fabc@quoll>
In-Reply-To: <20260224-bulky-rabbit-of-courtesy-83fabc@quoll>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 25 Feb 2026 17:29:39 +0200
X-Gm-Features: AaiRm53vrrlGAFjFL5krtfYKIvvyN9BeLRAbF1DkgFNXMhAuE4jNnWbMUA7sWZA
Message-ID: <CAHuF_Zq=Rpg0HoRJv-BSREEhT8tYH4r+BCbZ7obrG36vSmwMQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Add Samsung S6E8FCO
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 =?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DATE_IN_PAST(1.00)[26];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,devicetree.org:url,bootlin.com:url,protonmail.com:email]
X-Rspamd-Queue-Id: 0FF1D1AD5A5
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 09:27, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Feb 23, 2026 at 10:26:20PM +0200, Yedaya Katsman wrote:
> > Document Samsung S6E8FCO 6.09" 720x1560 panel
> > found in the Xiaomi Mi A3 smartphone.
>
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/su=
bmitting-patches.rst#L597
Will do in the next version
> >
> > Co-developed-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> > ---
> >  .../bindings/display/panel/samsung,s6e8fco.yaml    | 64 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  5 ++
> >  2 files changed, 69 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6=
e8fco.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fc=
o.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..8c042ce5f65bf317df48e10=
9d88ebdc87ef5d5ed
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.y=
aml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/samsung,s6e8fco.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung S6E8FCO AMOLED Panel
> > +
> > +maintainers:
> > +  - Yedaya Katsman <yedaya.ka@gmail.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: samsung,s6e8fco
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vddio-supply: true
> > +  ldo-supply: true
>
> LDO is the name of the type of regulator. Why is it called as name of
> the supply?
Can you explain more what you mean? Do you mean to change the name of
the property? It seems that all the regulator properties are named
foo-supply.

> Isn't this binding exactly the same as s6e3ha8, s6e8aa5x01, sofef00 or
> any others?
Yeah they follow the same pattern. Is there something missing in this
one? I will add descriptions to foo-supply properties
> > +  iovcc-supply: true
>
>
> Best regards,
> Krzysztof
>
