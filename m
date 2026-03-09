Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLcFC0TsrmmSKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA2B23C127
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49F910E55D;
	Mon,  9 Mar 2026 15:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="biLaHrSl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2100C10E515
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1773067925; x=1773327125;
 bh=K3Nznu+/0RcPCwpyvD2MPBrVSW3dHPifrwUThhMa12o=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=biLaHrSlcOp9bSjOsu/CJTRBf+wMkLdAP4MEug9n0xV1Z+wyw9AQgkMrRfvwJbfc8
 A7BFcLsXpnENpQAioWTMlxGyZyM7fiozXTpKyy+ZmejxYi0iMwaQ0uRPaNbJ3kXeTe
 eqJPO+MUQN5hLaTuX39w41h5tV4GtRwZIQB4M6v2BzbB/JcArTSCQDQ5a2AUddK7xf
 j1GXWcPVwCuwtJgfb54lG6j82j82E+PLarQODre2iAyvVInGztjV6TGKFjBlwiBoOU
 9P5G7dTUcFK5L0yoHF2lBeLg0XzGHytUw4zadswoO+3z15ffhKsPK8cSlWl1/GbxPP
 pU7OyVVPiwl2A==
Date: Mon, 09 Mar 2026 14:52:01 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: display: panel: Add Novatek NT35532 LCD
 DSI
Message-ID: <7Ft_cDw10-3MmNTrKncMut5g08sodd9CL7r7AGXAtPPqZpXtHEgmqm05WhEpYMZzFEs4B0KWz-LU27Z0_YDnc44nXhdUrUt5X2dWK7D6pYM=@protonmail.com>
In-Reply-To: <369b48d9-f089-49a2-89cb-a4e0c68f92fa@kernel.org>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-1-aa2c330572c0@protonmail.com>
 <369b48d9-f089-49a2-89cb-a4e0c68f92fa@kernel.org>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: fc565aee6ed89af7a60918254dc78e3c50d606fe
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Mar 2026 15:50:13 +0000
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
X-Rspamd-Queue-Id: AFA2B23C127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[cristian_ci@protonmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian_ci@protonmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Sunday, March 8th, 2026 at 17:13, Krzysztof Kozlowski <krzk@kernel.org> =
wrote:

> > +  vsp-supply:
> > +    description: positive voltage supply for analog circuits
>=20
> Both are odd. Datasheet says vci, vddi, vddam and optional avdd, avee.
>=20
> There is no VSN and VSP. Otherwise please point the page in datasheet or
> some schematics.
>=20
> Best regards,
> Krzysztof
>=20

I'm not sure about that. Writing panel dt-bindings has been based pretty mo=
stly on vendor devicetree - which also describes somehow the panel and make=
s that working with the final product released to the market - so I've to n=
ecessarily consider that.
Then, I could agree that vendor devicetree might be not compliant with upst=
ream rules and could possibly make mistakes with describing the hardware, s=
o I'd like to find a way to describe that in a more proper way, according t=
o upstream rules.

That said, vendor devicetree describes lists four power supplies for  DSI: =
'vdd', 'vddio', 'lab' and 'ibb' (which have the following property names, r=
espectively, in qcom,mdss_dsi_ctrl node: 'vdd-supply', 'vddio-supply', 'lab=
-supply' and 'ibb-supply'.
Two of these are related to ds/controller (apparently, 'vddio' should match=
 VDDI power supply in NT35532 datasheet.

The remaining two supplies are related to panel ('lab' and 'ibb'). These on=
es are two 'external ' regulators ('external' from NT35532 perspective), wh=
ich provide power supply to display, located in the qcom PMIC (in this case=
, that should be PMI8950). WRT to power supply names described in the bindi=
ngs ('vsp-supply' and 'vsn-supply') are the same as 'lab-supply' and 'ibb-s=
upply', just named differently in the vendor devicetrees.

Usage of 'vsp'/'vsn' naming for power supply properties is grounded on they=
 commonly being used at upstream (different panel bindings make use of thes=
e properties), on one side, and also described on schematics of devices wit=
h the same hardware configuration (LCD_VSN and LCD_VSP), on the other.

In the meantime, I've found out schematics for 'xiaomi-mido' (another MSM89=
53 device) - a variant of this device is shipped with a panel also using NT=
35532 IC (just like my device) - and LCD_VSN/LCD_VSP are clearly shown ther=
e too.

I couldn't find much more information about the display on my device and th=
e only resources available about that are those listed above, as of today. =
In light of my reply, I ask if it is still necessary to describe, in the bi=
ndings, power supply properties properties not used currently in the board =
DTS file.

Regards,

Cristian.
