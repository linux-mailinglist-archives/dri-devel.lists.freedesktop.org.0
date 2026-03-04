Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENV1O3SUqGkLvwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:22:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7E3207910
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A402110EAA0;
	Wed,  4 Mar 2026 20:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LXmaWME8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D5410EAA0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 20:22:08 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-38704f70ea3so131125911fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 12:22:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772655727; cv=none;
 d=google.com; s=arc-20240605;
 b=fKja5UKrvIxLNSswkJ0BEtfo+eqbOSSnuCteVnOqYXL9oOffsJtnAPlFgIOfxVxMku
 DQ3KTjPhOVhBVNVZ0pQdS4pVZ5EzlQtCJRsMg5EseQiHRfekVUtya8zuoQauWjvU2Tq+
 A2o1obYBBHew8dYw4Kk9Ap/JCKbu5UaF91CNVHgpyGiutvBH4FWFGNoxi9PP9KptfYNy
 lOmcbkGh+shQoXwG4tAv95RjS6zJgg7NfHHT8Nk6Uk1RSdfrdIzIULkuRWAKLAR2MHCN
 D81g0tLoInP4KgIp+Eh+MnkELY93jZKMWTs1Wr+klSX3oMFBKH8NTmwna+3hexqOAV5F
 00fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1amkl4f/I63ynWII3OMb2zdY1LWEy4GvB4FT/UgM71c=;
 fh=ZRgH5RUZmv8BjhHE7XBk1YcUYMPSyO2+/eWRW4I3AiY=;
 b=SDZk6RcaPws0cfWw7CNakJaC4KoymNPHtUkpc4O3nniCMe/Du37XANDK3vDAWF8UZb
 8h1UFFi80ZYBvheVT2GVGS2FWsTS01xrTuvp6r6vJ10r51LpeK9YpBlD1Si1WqVZW2DL
 phaypbAvQ5HO95aMbxPI6pb/OedbZESHdxYee1Bo3ODYpnjEIP+mG37DYnMELeGhmtfK
 TL3SrPDK5Mcyn/yc4VUHWeaEz3siXZhcGcZgDckevuJ+NBKsOXRaG4ktr2+P/OKW4HNe
 lXOlE4147mK9tOUYrnB8DVegTi2xxVt3OHodojbAmd1cZQAPk9vEjPpFzbgXHxMNIH9s
 C4Qw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772655727; x=1773260527; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1amkl4f/I63ynWII3OMb2zdY1LWEy4GvB4FT/UgM71c=;
 b=LXmaWME8/i8us/RZYR74JzuxKuXzKGoz3Za4s2lYRj0CN+O2gGENxPR7HdCJw/igKh
 lrInzjdtLIR3AbfMOs3LHOXjJfxltlLB1WpNgs0vyHpTMHwWCYgh9JSYaTDLMI0sfPQZ
 oLkDD3yvviW30Wk0BlI+g3RZG4+NbPyj+fKrXel0pBaNCk8y+btqPJ/ML0E498ajeKkG
 dplLosp6ZYTI6f5NN3ZKozKuI5spRXqR3wwW6ZA6dp9kWxCOErBidZdrfQ4dhD2oNd/u
 nkmn/eEMej5NHErlBHCUzsObHZxuhuJHyUfT5/Qk9MnA0VvoMjIlohsrWFMyB+posKN3
 LJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772655727; x=1773260527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1amkl4f/I63ynWII3OMb2zdY1LWEy4GvB4FT/UgM71c=;
 b=fh2xlkkx2SOI6xpgkTD/sysS7AuArJ9nwpuo0KRAFn+uo2WMd180G3AKfPwL8oHGhq
 OZM2iThkPdHzn772BThms/zOoNOQ2GChkUxosaI8LcDkD0aFCI+s32NBtFMLXBBS+eTe
 iMkoG4ylZYdX4kL6+qlxZpetSDVNK4olU0CemjgkAmYouYlWePD8lr6VZ+gQGmBBsqHD
 gEPbsxSK8A5TCHf20Yp7cgvMwVfK/l/kACCSaIsoXSueuQ4KyUu0ugwS7dDO+tUvsf1R
 3sfPsV9Sofzbibk1WCuqSfwg0T0DTYwGtnO1xFOkh3ZjA4NSIS/Gfz78j7JC1ALulax6
 OGLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGcKAm6H3MuJDJMtjXmlCQ0SGGrECvUwQ0ZoY5+P5ECn3jOXTJmJaPSNA0KelU/dDTFhwwlLCcAYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOqhmY5zckBm93EgA04TKmXakHrZqdOVghIIBkCw8bc1lS+ArY
 vc9pv/D00zGayHuv/HGIspP4OrE9c+t2ZLscSUyzzjlXy/yiVP2YliZgtsHEWTP8RjlitmbXXmX
 aLfhdLxr/2k/N3k1dCQXlJi33b5Be9xI=
X-Gm-Gg: ATEYQzxAic/atFqLBNd3GhuMyrZHovzUJLYldZjdyNLcTisBKeyxfJ1trAw17HYtTKG
 7uZccM2YeBEGzk4p9sjFSl7CGhQbbu+xkjnDDgRgN1mghano5MhFtLOXipgwfZa98xFGdr4qbom
 CD8GxePcPAnTfityuCPbsrgRpcSHGOYilg/Lfqcf2L4qx6SpTCettyDtXEodPHwhpMeIaRSXl9l
 CbwN6pmS0X5GOibVTkrB2A91Y3PB2EZclW5a9ijIWgxZF6ShRnl2EpaPWeN3aaoE/W3EQ5IQJke
 6fWZgMQQuyGToQSmO5JRPMy6Mk1TovtR11a3i8Zsu9GSkLLMC9w+D9os9o2pdGdvofn2
X-Received: by 2002:a05:651c:1545:b0:386:91a1:f207 with SMTP id
 38308e7fff4ca-38a2c55f9cfmr25464581fa.2.1772655726349; Wed, 04 Mar 2026
 12:22:06 -0800 (PST)
MIME-Version: 1.0
References: <20260222-ch13726a-v1-0-e501d78e105a@gmail.com>
 <20260222-ch13726a-v1-1-e501d78e105a@gmail.com>
 <933fd2e0-46ff-4ab8-b98a-554ac46982c5@linaro.org>
 <CALHNRZ_TdVDy93uvM=p7ht50v0Y2W4Ji4ZsFwPFAgR8FZh=myw@mail.gmail.com>
 <8e7cff06-4b6a-4034-9b9a-1d4ae69a9bab@linaro.org>
In-Reply-To: <8e7cff06-4b6a-4034-9b9a-1d4ae69a9bab@linaro.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 4 Mar 2026 14:21:55 -0600
X-Gm-Features: AaiRm51a4a5JRKhJpY9ftKBkw147QWoOleIMQvVrf_n00Ax6xrGrXqj2VAN1vgg
Message-ID: <CALHNRZ_JC=tNOXJ29POCB2Ln-SZLHK+FfrP_GjXQNAmc2YyF6g@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] dt-bindings: display: panel: Add ChipWealth
 CH13726A AMOLED driver bindings
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
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
X-Rspamd-Queue-Id: 0E7E3207910
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[webgeek1234@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org,sobir.in];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,devicetree.org:url,0.0.0.0:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 2:10=E2=80=AFPM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> On 3/4/26 18:56, Aaron Kling wrote:
> > On Wed, Mar 4, 2026 at 10:32=E2=80=AFAM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> >>
> >> On 2/22/26 23:26, Aaron Kling via B4 Relay wrote:
> >>> From: Aaron Kling <webgeek1234@gmail.com>
> >>>
> >>> The Chip Wealth Technology CH13726A display driver is a single chip
> >>> solution for AMOLED using MIPI-DSI. This is used for the AYN Thor bot=
tom
> >>> panel.
> >>>
> >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>> ---
> >>>    .../display/panel/chipwealth,ch13726a.yaml         | 66 ++++++++++=
++++++++++++
> >>>    1 file changed, 66 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/panel/chipweal=
th,ch13726a.yaml b/Documentation/devicetree/bindings/display/panel/chipweal=
th,ch13726a.yaml
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..890984b00c34128506617=
6995e6a973c5607cbde
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/display/panel/chipwealth,ch13=
726a.yaml
> >>> @@ -0,0 +1,66 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/display/panel/chipwealth,ch13726a=
.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Chip Wealth Technology CH13726A display driver
> >>> +
> >>> +maintainers:
> >>> +  - Place Holder <place@holder.com>
> >>
> >> ??
> >
> > Please see my reply on the cover [0].
>
> Sorry my bad, yes add me it's fine
>
> >
> >>> +
> >>> +description:
> >>> +  Chip Wealth Technology CH13726A is a single-chip solution
> >>> +  for AMOLED connected using a MIPI-DSI video interface.
> >>> +
> >>> +allOf:
> >>> +  - $ref: panel-common.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: ayntec,thor-panel-bottom
> >>
> >> ??? why not chipwealth,ch13726a ??
> >
> > Because this is a driver chip that supports multiple panels. The
> > driver code I based on also supports the retroid pocket 5 panel, which
> > has a different resolution. Similar naming is used in the rocktech
> > jh057n00900 binding, which is why I picked this compatible.
>
> It doesn't work like that, add a compatible per physical device, not
> by driver. You can add common fallbacks if the panel is the same as anoth=
er.

So what should it look like then? The ch13726a is a chip that supports
multiple panels. The one I'm adding here is a 1240x1080 panel, no idea
what the manufacturer or model number is, just that it's used as the
bottom panel in the AYN Thor. The chip also supports a 1080x1920 panel
as found in the Retroid Pocket 5. Among many others. If the compatible
is chipwealth,ch13726a and nothing else, then how is the driver to
know what's plugged into the chip and what to report as the supported
modes?

> >
> >>> +
> >>> +  port: true
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +    description: DSI virtual channel
> >>> +
> >>> +  vdd-supply: true
> >>> +  vddio-supply: true
> >>> +  vdd1v2-supply: true
> >>> +  avdd-supply: true
> >>> +
> >>> +  reset-gpios: true
> >>> +
> >>> +  rotation: true
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - vdd-supply
> >>> +  - vddio-supply
> >>> +  - vdd1v2-supply
> >>> +  - avdd-supply
> >>> +  - reset-gpios
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/gpio/gpio.h>
> >>> +
> >>> +    dsi {
> >>> +        #address-cells =3D <1>;
> >>> +        #size-cells =3D <0>;
> >>> +        panel@0 {
> >>> +            compatible =3D "ayntec,thor-panel-bottom";
> >>> +            reg =3D <0>;
> >>> +            vdd1v2-supply =3D <&vreg_l11b_1p2>;
> >>> +            vddio-supply =3D <&vdd_disp_1v8>;
> >>> +            vdd-supply =3D <&vreg_l13b_3p0>;
> >>> +            avdd-supply =3D <&vdd_disp2_2v8>;
> >>> +            reset-gpios =3D <&tlmm 133 GPIO_ACTIVE_HIGH>;
> >>> +        };
> >>> +    };
> >>> +
> >>> +...
> >>>
> >>
> >
> > Aaron
> >
> > [0] https://lore.kernel.org/dri-devel/20260222-ch13726a-v1-0-e501d78e10=
5a@gmail.com/
>
