Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNDtKJxAi2mfRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:28:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FD311BE7D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9427510E1B9;
	Tue, 10 Feb 2026 14:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CYwTvshU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C0410E1B9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 14:28:39 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id
 38308e7fff4ca-385b6e77ef9so34240691fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 06:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770733717; x=1771338517; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=jJiTIxfPBm25e93CFQ56nmStRzngUVIEZWb2GhG+yqk=;
 b=CYwTvshUpcfKErQ25eMgrC92BfjHmzZesHWnAdLGCOHgYys8Q38oQM/VV7e3wBqm5V
 QwmOhCPih+dC7Ve82PKMp3rgNR9P02JbmZlD7/7eb0tm54ZPM2uUXQl6oPXBlNltDnKh
 K8jMKUM3yHijTr56tVW3kxbcZtygBG2U5sGtQ8UEiuxQHJlmkSIaj22HigkxExZG0cY8
 PGOPGLeGtf4/0O0CyaHZRDabSY4pIg4qZJZF4BsQ8aPCju152joIZBeQ9uZ8YVSBHdUO
 Q9T/AXr4WkqYFIq6WQPTYuxSng1gzNyQn3JHFNeQuHgr9w+aSgtM6SKpRhHtoZmlMOgC
 i6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770733717; x=1771338517;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jJiTIxfPBm25e93CFQ56nmStRzngUVIEZWb2GhG+yqk=;
 b=Xn06emhbZVUagI4+xYRs7+3TJPOSE6+H/vLnLCLLKxO6ZxOeSFngi5h9IPL7zxkD79
 I8IqELceyHecnjhts0k/5J/Fskd5jFWjp8QZmZABwUy4Flj/rx3jaV05IzrXlvzZ22IM
 hCtEyK85O3nVvPk0a/vyd/Jnn5t6+57puSGKOXBHMP/l19kzTKbJQV5jMci0n3dX1zTh
 mthLxsSR2k16JJxFEF/EHFM0xzr4wgWzdBNCFAoNWaAiygWiyBxhER9bqS0ox107Ndrl
 neqCTd3JmWk11LNs2KCBLRAkyv1dodyf8JVsh/pLbDmETHpvAkOE8IVMLh1qEuJ76+Kv
 lFTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhkswlfXUKB/njBzSTsyEQg0xLc8/VkncYdSZ0Dx9wGYiG+PEkmG9YVjW4ISmSyW64NhGsKjuFI4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM//KuGw0TXLpSwFknDR1NtF3hUFGyLKx+OgmbShBk+rOAbhBz
 RSHL6OoL6sOTpbxH3J+dWUqLvcdAyGFLUqKPsHnQ5zKqUYuxNZXt2sBY
X-Gm-Gg: AZuq6aJmD78r5NU3FUDe8oJ7/CHg+YuVKFRohheQd9WcVqg0r+M+N2z6QSGMslBm1P8
 vqokt1Bf1kkNbQBnU5SehKecMbD3akM522RxHfVdZ++3ACOIPn6tIu/IqWiwkqT6riRJw5g67cE
 hmzT/5AmnhpNUPEAJquYzNfAgRBpSZ1WHlkprzc7hmmvdz7TmoXpIu4Zmsx+n0kyHVrDTnRRxfa
 h43nOFp60MVnRaP6leBojMg1itPiT10WecIxBNIELTwMw6ea1i0vlawdyJ1nihVlHLUuLUeDNXW
 +x7Kg6t6rx8f6f0ZgKa62CJHYuf+qNrLGd6YyPVF5ov0sDwJ+1pxDOoXX0JKQ5RzKrpBj3WWI9U
 RMyNOmrEFxAZEw9+0Fq8p//fi4QRtMH+ZO/9JyMCMF55FiW2PTAzmKt1DhrtgB2e4fIR+P2Aag/
 h7p9IQdOiilXYG/VzpZDUgSdyLJu0FA5gIXs//6qj2EQ==
X-Received: by 2002:a05:651c:3048:b0:383:1737:5ae1 with SMTP id
 38308e7fff4ca-386b4ed29e9mr47903091fa.11.1770733716944; 
 Tue, 10 Feb 2026 06:28:36 -0800 (PST)
Received: from ehlo.thunderbird.net ([178.137.45.117])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-386fb4662bdsm985391fa.29.2026.02.10.06.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 06:28:36 -0800 (PST)
Date: Tue, 10 Feb 2026 16:28:35 +0200
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_1/2=5D_dt-bindings=3A_displ?=
 =?US-ASCII?Q?ay=3A_tegra=3A_document_Tegra20_HDMI_port?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260210141917.GA2659856-robh@kernel.org>
References: <20260210094908.14276-1-clamor95@gmail.com>
 <20260210094908.14276-2-clamor95@gmail.com>
 <20260210141917.GA2659856-robh@kernel.org>
Message-ID: <DB13921D-05FC-4A6C-B5D0-D23D5B47063B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E6FD311BE7D
X-Rspamd-Action: no action



10 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80=2E 16:19:17 GM=
T+02:00, Rob Herring <robh@kernel=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5:
>On Tue, Feb 10, 2026 at 11:49:07AM +0200, Svyatoslav Ryhel wrote:
>> Tegra HDMI can be modeled using an OF graph=2E Reflect this in the bind=
ings=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/bindings/display/tegra/nvidia,tegra20-hdmi=2Eyaml | 13 +++++=
++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-hdmi=2Eyaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra20-hdmi=2Eyaml
>> index f77197e4869f=2E=2Ef33b700bf0ee 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hd=
mi=2Eyaml
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hd=
mi=2Eyaml
>> @@ -82,6 +82,10 @@ properties:
>>      description: phandle of a display panel
>>      $ref: /schemas/types=2Eyaml#/definitions/phandle
>> =20
>> +  port:
>> +    description: connection to controller receiving HDMI signals
>
>Describe this in terms of this block, not what it is connected to=2E It=
=20
>could be an hdmi-connector node or a bridge=2E
>

Isn't the idea of port to provide connection to the remove device=2E How s=
hould I word it: "links HDMI host with the receiver" or "output of HDMI"? I=
 don't quite understand what you mean=2E Maybe I should remove description =
entirely, HDMI has a single port and its function is pretty strait forward=
=2E

>> +    $ref: /schemas/graph=2Eyaml#/properties/port
>> +
>>    "#sound-dai-cells":
>>      const: 0
>> =20
>> @@ -97,8 +101,13 @@ required:
>>    - reset-names
>>    - pll-supply
>>    - vdd-supply
>> -  - nvidia,ddc-i2c-bus
>> -  - nvidia,hpd-gpio
>> +
>> +anyOf:
>> +  - required:
>> +    - nvidia,ddc-i2c-bus
>> +    - nvidia,hpd-gpio
>> +  - required:
>> +    - port
>> =20
>>  examples:
>>    - |
>> --=20
>> 2=2E51=2E0
>>=20
