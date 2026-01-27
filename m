Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAeCJzsZeWksvQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:59:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CC39A2A3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045A010E5C0;
	Tue, 27 Jan 2026 19:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lDLGDcqu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCDA10E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 19:59:50 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48068127f00so9276125e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:59:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769543989; cv=none;
 d=google.com; s=arc-20240605;
 b=iw0MvkaFz5Xaz7fsr1x8rBrKYYIOhC2b06ZHl+nyMoawiwKo/hnbTbbqwi3r6l0uEn
 njhV8ktyFL0N7bgGysPyKRgxjqfbYvlzeHDmlNGj5if6Ig2XyxvdHWxfn44LzN1enVbh
 8WCxgn8Kwo1G8sxMuBQuS8sji7+yPZqOhmPdCGF02s+2bvgiMJPQgm45HY/MrBgOOCuB
 5R3IE4suqIxhiiHuoWNmqWoN2opVd+gsPpZ3aCBfai1wpqy5FwCenK69snikaBUTVFSw
 RbYXiidB/yyEzGRJsGNWHpKOHwDUl1aduHHpIufyApHmdyVAcuPy1rklXIMlMJ0wW45i
 KqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wdSDlCVVYnDmBRczrvEEXGHbaqZPOoKg/QjHoAiAx4Y=;
 fh=iC9o+jlKwNso/IViR7sXkog9Tz34riAHpAWU1E66g9w=;
 b=DQfJVAxmrY/2h9csP/Nusev/L8GZ2AVF3jYkc6PrKrUtS24cmew9tNm302Vq/zdeRu
 2uryov9F03+9EIVb+KsQ4YHGWBlEtxAex70rJKnzcUz1Yx2+P9zctEzW4XwnOnCzXKYR
 yDanThosF8MJeHoqY8sAamwffD66B5bfExtKlEYuSWRL7blZmDcEaj6y1Tk+zGg7OORz
 1Y2HWeVW6UaiaVDBsfMrCSU5z4zgPHLZt97iVbkyJoOOKizMjyVIPGXGPJcmstv6XnCj
 ZBQy1L7taBnMiCD1haTXUfnXh4Coc8S/WzP9y54aJVNFnX45WSUf+9EAvfsHC6yOlMMM
 1wug==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769543989; x=1770148789; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wdSDlCVVYnDmBRczrvEEXGHbaqZPOoKg/QjHoAiAx4Y=;
 b=lDLGDcquyBTmQLryUi9yn2B8KqSj98VSCtO/J65Ck3KphVTQqTvflTWYWWBZzztIDf
 eULPgaUKufKKZTcm/AYS576X/FnEC/07CCd6la73xgYUyaTTbFEq1oq9Wyg/IV6UgIqV
 90icZ+P39CRIqpglRQooq9KWEc4xcXbYyMJNU2ClAa2rgtVSI4vD7Nw9fftRcPN4Dqrz
 lFMxK+JtBqoec9Yz08GymTwW5B/EljF8O09OdSQFttQT1b3DQA/fpIFnvnXpFZH3Qj3V
 /ygW8QrKgUPVYS779easAxlLTogrErm8BFnkjt7atscph3mwfRSyFeU/6iZB6MHBDlGm
 qXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769543989; x=1770148789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wdSDlCVVYnDmBRczrvEEXGHbaqZPOoKg/QjHoAiAx4Y=;
 b=seXxsmEypLPOLmjWfahRWH4+Gog0AnLcBgL288Cvig6o4+i7q0aF2GuuePjOPcv2Rl
 zywdUxersiOmVLB0BZH8aR3i8bt+0l4YiE7U/WYzEPE7X+Crk6+qKfPCmwji+YBonp32
 qCsv8gsVsyxdRaRCMFYkHx7sf15gPzulMHtVsixnk9bb0xTbbq3oudE2839e/Dnt9NKZ
 NSBLnPwRqjLEvH43DHlelVkAH4NQYUJDPK/2g9U5oXJc6NuFHR/5clY3R4umP9s3c31K
 K9xZQ9yR9CvUFKUVzoJU9UMkpfS03afx4W9RduoBsn+4y6kaeCJCPSLt28ei5OAf0LY3
 g/Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG9OX8TfNGJi59JbQOykYxVeSGJeK8539XH6fOgfz3V4N7juUaihKERmvnfRj7lEfQaupAaPF26mY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzl2ejqQDpmjlQAgMtGW2h9j/0DO/bxdLyNjieg/hcidpdz62GP
 HClLnhRlrT/MW4gFbHueC2bCfFziSoG2vqNraQ4sWPQFJYykQUPm2O2aWpKfjQ637wDYGrIkZu6
 5PgOVo8bT3wVMujum2CrjkHYo0ceoK6U=
X-Gm-Gg: AZuq6aLiYGnvooDaN9Do6mkEicjt4UuT0n9BzzllPxVQKyzyw2uqVaN5FzjKBpNbknK
 9wL7khjBJC5sE7oTRGmJFcIGtglmtrMAK6AqQa0YgWdrvARRE8+EqGw7ULD/JhIE8CDW1R0wFBL
 d+ip0TKrdP2ufjGaPI/ukUSwacyf5TI5Uz02KJIHxwKO5I9My2DYA43Op/S2ykltGhuc+F+DZwa
 Wkm81p1wTm6wNm+O2t9+EEvffYLKb+cVON05dZ8+An2hfw3XnmhBmGu9g9kTnOptAHR9aTysgYc
 H2jmVsg=
X-Received: by 2002:a05:600c:1e0d:b0:480:4a90:1af2 with SMTP id
 5b1f17b1804b1-48069c86e2amr42770425e9.35.1769543988628; Tue, 27 Jan 2026
 11:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20260125131904.45372-1-clamor95@gmail.com>
 <20260125131904.45372-2-clamor95@gmail.com>
 <20260126-patchwork-cofounder-8b7bb715556a@spud>
 <CAPVz0n1hBof7_eB6D39zZd5EfC2dL5-Ngf0ja7+kkcwQnnr7Mg@mail.gmail.com>
 <20260127-myself-sinless-95525b4c78ec@spud>
In-Reply-To: <20260127-myself-sinless-95525b4c78ec@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Jan 2026 21:59:36 +0200
X-Gm-Features: AZwV_QjpzuxykG7q-Vlx0dRpKjGyYo65SrJbrKEMORq5A6xryrhIt3lUTXkoXp8
Message-ID: <CAPVz0n0kqRJWrfC=iXEsmeBtnq1vn_ZYUQo+YzPREjJhgR3HoQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: document Atrix 4G and
 Droid X2 DSI panel
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:neil.armstrong@linaro.org,m:jessica.zhang@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 04CC39A2A3
X-Rspamd-Action: no action

=D0=B2=D1=82, 27 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 21:41 Cono=
r Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Jan 27, 2026 at 08:26:32AM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 26 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 22:45 =
Conor Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, Jan 25, 2026 at 03:19:03PM +0200, Svyatoslav Ryhel wrote:
> > > > Atrix 4G and Droid X2 use the same 540x960 DSI video mode panel. Ex=
act
> > > > panel vendor and model are unknown hence generic compatible is used=
 based
> > > > on board name it is used with.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../display/panel/motorola,mot-panel.yaml     | 68 +++++++++++++++=
++++
> > > >  1 file changed, 68 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/panel=
/motorola,mot-panel.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/motoro=
la,mot-panel.yaml b/Documentation/devicetree/bindings/display/panel/motorol=
a,mot-panel.yaml
> > > > new file mode 100644
> > > > index 000000000000..2326a83bc405
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/panel/motorola,mot-=
panel.yaml
> > > > @@ -0,0 +1,68 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/panel/motorola,mot-pane=
l.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Atrix 4G and Droid X2 DSI Display Panel
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +description:
> > > > +  Atrix 4G and Droid X2 use the same 540x960 DSI video mode panel.=
 Exact
> > > > +  panel vendor and model are unknown hence generic compatible is u=
sed.
> > > > +
> > > > +allOf:
> > > > +  - $ref: panel-common.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - const: motorola,mot-panel
> > >
> > > What's a "mot" panel? If that's short for motorola, wouldn't it be
> > > better to conjure up something at least more specific to these
> > > particular users? The commit message has some info, but I still dunno
> > > where "mot" comes from.
> > > Seems okay otherwise..
> > >
> >
> > "Mot" is how motorola called tegra20 board files which were base for
> > Atrix 4G and Droid X2 in their downstream sources, specifically
> > board-mot-panel.c. Since both devices use the same panel I used board
> > name. Hopefully, at come point I will be able to name it properly.
>
> Can you put this explanation in the commit message please? Without being
> familiar with the platform, it's nigh impossible to know how "mot"
> relates to Atrix 4G or Droid X2.

Sure, if v2 is required, I will update commit message.
