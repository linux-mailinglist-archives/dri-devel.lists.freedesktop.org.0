Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAarFqtaeGkupgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 07:26:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB1090612
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 07:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5B610E06C;
	Tue, 27 Jan 2026 06:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JV9oOkOV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C22210E06C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 06:26:45 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so3082732f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 22:26:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769495204; cv=none;
 d=google.com; s=arc-20240605;
 b=jmSGQJadR26pCz7eNONdXFRHPxX/Wpd2UrMvLoZ4Kq4llKd7iuHgNFhDdUQs3oUeW8
 hG+zZmqD0Pb8bcRN0P26t6LnpK82oNb0KJOCh+/18KKfgOww2iyxbal4ejolXp3wn6Nu
 itlzq7PKD+Ur2ihDw+Rv4ARsyt6mw16YSKKxXpg5O8PJzpBzjbYl+kRk84w2A6Tq9wUc
 B5uvrhnA2Yd8O73o93FYc1jkzjx4Y7Ainwiqc+GaJhuZjog3Ax7HJexVS5QSyI/4VAzL
 eZppmIn4GlwCM0cjsxsaEn02wYcaTbqmmeUyN08hNi9qOx7jIImTsAaH2LBo1VG8Hum2
 W90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Hcz4oTZY5DQbaUy98BTp/plZEQsZkc9Qo/oLKWh3nDM=;
 fh=aONf+LyY1TeYk9j0Coam18JQ8w0Cqpr7DP1gtGpmpBE=;
 b=anocYYP4KX09mVTVBtvPgJP/6YQrHgO9fx8Ofe39Q486JY4N6Vg/zUDMl0Vnf6/wGd
 j7Tz0FW01AelXgByewK0UYz3+wYb8ckoUYWTt5IU3GhzlFM2DGmCsrpv/VVX+YM1bsA2
 Mg+VjJy7hKQXZyHZfvjKPY87Tqd0mzJREyDS2Nh2zlOMdqJ5ekbbwyWhdJ+7vCnT0OQc
 0Ipagz8XKiPJeva1Xm9IRvZ541OmZCF6CmSNCytI1JnQwQ3QMW6PX74iRIOvlrpmCePY
 eaP2w4b3O+xfHIdPzBBC2ogH8WjFC8fWUjuT5DiCD4F9yKhclYv93RwMYBC/LWbS5IRS
 BvBA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769495204; x=1770100004; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hcz4oTZY5DQbaUy98BTp/plZEQsZkc9Qo/oLKWh3nDM=;
 b=JV9oOkOVOgghfidcQTzp8COTy4OwtvZyZbUNOC97092dRMeAJLc7O5Sko72MgsWw6o
 4kEUbRJkOY1raY7Nrq0lczvOTQo6FtO2LQZJAmIoefBd5da7Lw+aYGOYHVFTP3gGFhfu
 yI+r/BcRJT2708fPFKwpzsfllyHH5WE3jhU8FhXRfS/p2kiDTjNSw2vBF0xqgY9E9whm
 V0J7tBhrU7V6ytY0lHH3mknLK037emIWQQAlxbdaaicM3DrDBVQiA3gc0I5rPfOYj0ot
 MBBGdDmOVYA6V/PObP5u+UZvYpWefqyTVBsktSyC/7W7A85F/duceLU8zVDl2zIZp5+D
 o7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769495204; x=1770100004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Hcz4oTZY5DQbaUy98BTp/plZEQsZkc9Qo/oLKWh3nDM=;
 b=mvXHfFjiTetglibEhfhvDbeCcgttFZfoLtw0/ROgX7Dc6VCCBAGSvt4c6L9ilvZmnp
 +oybZH975nHAWWUO88cME13xleYyU1RQ1NlaaxXgd87ydgxyBIkRKC0UMxXuQ9XX/dBU
 wKzDm6mAVjnNMA6hSQTFN6AoA1lHn1Gm/YeHdv0j3QFvSVHqfxrmHbzMyCnVFsgoko/N
 ACbZigE4yetk/AroKsMxmZtZK9HZMI5Q68hfQRrw8+CjGuw/pUQnBEl2Fhq0H7TvxDPy
 LhAoy+FUctIfa4+JGRtnW77RyW0SyM5xchyKj074u737MEuh9Jc9IbOulMA6QRSh8xSB
 Xz5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUutwpNA2QQjcMM9mTdDot1uUt/qZPd3VRhhHIoe9WbBNEP618jfPlAP3+QeC7Cbty6ilJLQMKi7cQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSgfpNGnzXC8QXLWCUcHwaSCdeEK2pk/8ZJXakQRpZqbfPrK8q
 YHoNFH4+sAPDOY+8mNLZbPTeaO2QsfhZEDxL4b91IDbSgBkhUS7qNfk4g/X889N82UQkRtx/yNZ
 syiv6k6nJ6zNJXumtRYEyznXNtk+lVJ0=
X-Gm-Gg: AZuq6aJuz87n8jHO1MZVi9N8G/0yHMI4/qrtg6rS1sKaQ/R2P/rnnLQbJb+Am67km9u
 hAkdjwTJr4d51NupSZoxsCE55QSStiXGEgoMy3+XJ7Axvc8vLaFpZntQtjyZqBOv4/1nvL/Awuz
 8DhXQfcnmOGDuUohiO+8JaCKh7S5XHOkIuTudAP269EuD2FWC+R8919Za+zIslCcwKhCaeelq81
 Xw3IICwi59zUIwsea4nMzGIKmMMzVAe2d576uX4SBbZi3vXf50bETExxtPEqA3Znz8olN/E
X-Received: by 2002:adf:f842:0:b0:435:dd81:4f4b with SMTP id
 ffacd0b85a97d-435dd8150b0mr354677f8f.22.1769495203600; Mon, 26 Jan 2026
 22:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20260125131904.45372-1-clamor95@gmail.com>
 <20260125131904.45372-2-clamor95@gmail.com>
 <20260126-patchwork-cofounder-8b7bb715556a@spud>
In-Reply-To: <20260126-patchwork-cofounder-8b7bb715556a@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Jan 2026 08:26:32 +0200
X-Gm-Features: AZwV_Qh8Okkp0ZKwUp_Q1LdogBWpv0JfM08wTd5rb20Zn0_7R87Omepl7HoCeOY
Message-ID: <CAPVz0n1hBof7_eB6D39zZd5EfC2dL5-Ngf0ja7+kkcwQnnr7Mg@mail.gmail.com>
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
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:neil.armstrong@linaro.org,m:jessica.zhang@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BCB1090612
X-Rspamd-Action: no action

=D0=BF=D0=BD, 26 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 22:45 Cono=
r Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Jan 25, 2026 at 03:19:03PM +0200, Svyatoslav Ryhel wrote:
> > Atrix 4G and Droid X2 use the same 540x960 DSI video mode panel. Exact
> > panel vendor and model are unknown hence generic compatible is used bas=
ed
> > on board name it is used with.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/panel/motorola,mot-panel.yaml     | 68 +++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/mot=
orola,mot-panel.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/motorola,m=
ot-panel.yaml b/Documentation/devicetree/bindings/display/panel/motorola,mo=
t-panel.yaml
> > new file mode 100644
> > index 000000000000..2326a83bc405
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/motorola,mot-pane=
l.yaml
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/motorola,mot-panel.ya=
ml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Atrix 4G and Droid X2 DSI Display Panel
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  Atrix 4G and Droid X2 use the same 540x960 DSI video mode panel. Exa=
ct
> > +  panel vendor and model are unknown hence generic compatible is used.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: motorola,mot-panel
>
> What's a "mot" panel? If that's short for motorola, wouldn't it be
> better to conjure up something at least more specific to these
> particular users? The commit message has some info, but I still dunno
> where "mot" comes from.
> Seems okay otherwise..
>

"Mot" is how motorola called tegra20 board files which were base for
Atrix 4G and Droid X2 in their downstream sources, specifically
board-mot-panel.c. Since both devices use the same panel I used board
name. Hopefully, at come point I will be able to name it properly.

I have device trees for both devices prepared and I will submit them shortl=
y.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vdd-supply:
> > +    description: Regulator for main power supply.
> > +
> > +  vddio-supply:
> > +    description: Regulator for 1.8V IO power supply.
> > +
> > +  backlight: true
> > +  reset-gpios: true
> > +  port: true
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        panel@0 {
> > +            compatible =3D "motorola,mot-panel";
> > +            reg =3D <0>;
> > +
> > +            reset-gpios =3D <&gpio 35 GPIO_ACTIVE_LOW>;
> > +
> > +            vdd-supply =3D <&vdd_5v0_panel>;
> > +            vddio-supply =3D <&vdd_1v8_vio>;
> > +
> > +            backlight =3D <&backlight>;
> > +
> > +            port {
> > +                panel_in: endpoint {
> > +                    remote-endpoint =3D <&dsi_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > --
> > 2.51.0
> >
