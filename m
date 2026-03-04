Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNwrI1lyqGl6ugAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 18:56:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D692057F2
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 18:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40C610EA89;
	Wed,  4 Mar 2026 17:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iMl3Zeas";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03DF10EA89
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 17:56:37 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-389f200c26eso12396551fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 09:56:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772646996; cv=none;
 d=google.com; s=arc-20240605;
 b=R+vsZjU3Be1HN+DMI9N+q+9QyOxUa8diSPYDjxhdPgAIaOEBPeWMqvoLRyH6pJagdJ
 +sWhx21hvQ2ReZiba2Dve7lge+L4qwjIZcpDx+4VT/OHmLBalY2f1aMXaaKV9AjLA4bB
 +8dQq35W25Qn8yicz/CQSibcC/f6cq4Fy5TaHr+pUU+CH8o5G29rC09DNx7kvIrimHTI
 u3cZLrzxSooQHTvqVgdHcRvb3tU7sFTeQtA0O5b3XaZ0KAN8Q5+HDUaQvwPAKz/sy3hF
 LUaTbiAMpWghnys6zyEFhiaFtEbxUQ2zZX7Fal5IlmyO9RZld5x90C0YKxTlKkP/SKGI
 Pxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+ZQ03CfiCaXKd5772pu8fN/18x8WZSaiPx+JJp6vfUA=;
 fh=S2bCU+YSmzQ/L1k01BkloW5ATxLeV5cMFBKDg34R1cw=;
 b=JhQL8ahodSRmzzBowdwXy0sGfCKcjCKQzwdVGenAy981fBoxm6oD8ZL4VBTsk+TdEH
 qJbMJeUcODkUeaHlE8+FAKDROmE4sYPa5Uh0IQAPdbL/YtBQLg3uh90VALNOxvyinIkW
 nxQTd12YxojpdvF0Q4eUQDiV3S5bcRZgqfHvD8npOtbmQPQsdoGw51TQeEMF8gFBxtsM
 lVU4ufUdFlgh/q9rdyLeTZZnRsKH0JERZzBPJLoCgRVE3Ug8pzrvRo5WAhXX6zg7yCJH
 183yLYOutV0cyDRS4x+btX7F5YYRiJH9Iq1w5tucnislIvrzAMYYayVBloMCQwjRJJwz
 YhSw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772646996; x=1773251796; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ZQ03CfiCaXKd5772pu8fN/18x8WZSaiPx+JJp6vfUA=;
 b=iMl3ZeasPYdplHo8r9IWFlU2rnKTlNLULQFdgyzV7nRvfdSgbXKH4JtRbJt7hnDpFw
 aZG0SEmuV0HGYBSObw+9Ym+t/yOJAwqXYNqYZZKZjv9dXKP7RyCIpDiHWBwmN+gXozX5
 FbnLS2pNWYkJ3RAPEiQ52olTENM1Eavz221ifShoLMTsfBVmJB9Hv2Uq0hFYBbJqgyIa
 hEbjFEGc32I5BEVg6LrC2FDsHPKbnozcN2FDwIjhDyzdp6yxHCY9I5ctn/R37TywXZ7V
 VEfD/+SanlPPn+Edog4DAq+6eyXMGhQH0B4o6S/TNyyhAgNa/CHLLfMMYRpOUF4wUZhO
 7Vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772646996; x=1773251796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+ZQ03CfiCaXKd5772pu8fN/18x8WZSaiPx+JJp6vfUA=;
 b=GxncgkgAb5yN5QX9nRpH5G2BodaGbd890dQ1uEW+2xEH2SQs1vcl+VlJJ2Qdek74tW
 pm+2m/5R/3Csv74IZLcaqOlLDUSrEB9ieWf8ydEKbmwHksUCEr0Yb/iIAyE391GhJTaC
 MhzoO8spL7/GkA1/Lyo/FRwUy++esV9Oq4CLWgdIZirXfDdeQCVpEORQw2iCNNRfBfMQ
 SWKErDAdfwE0fmxmqpBHPBuiXOtVuNJoY9VqZZSDfPJysnzS5Ews7+RVtxDenC5Ecj/O
 1yh8a7MXEsdNR8GUYqyDzI1CMf/BmjB72exkS8dij9SD+ENhnfs3SP7s54qvBe3yvQgY
 dikQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDlziyahb3qUM/zODMgVTuIRvu4bncEe7CZTVKxogG6BPa1hD7imHlRy2hu7nMYlcBkLEaPrIWoGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk9d1sO/qNvfbyyQX3BiOh0afzcf+N/CtzddKUvirtdzUs6HMM
 SlYSmnIP4R0wbBmIdA3w1k+WahYkvyyuC3wkzWOzH80O/52s2DoX7aME67jbz4INnYRw6l6RHjG
 9vyXlKUs3rJRQP9IaJzUSLu1iuSI3Y8U=
X-Gm-Gg: ATEYQzxk95oxUOEWh7Zs8HO+o+cre6/c/yOzzGAzOjN+FznGnHOlSCCzMKCR4/i3UJ3
 ppEHGtIA7dkjZ4RxMMGRTM0Tnz1waPk0d9OkFjPxa936LFlRqzVx1FuOxnLW4SBsBiorwL+8blg
 kE47aXVtgo5ykR7ICaql3FhzA1gPlUd+TQDRWwvK5emz07dG3vRqfve0PNiQrHBuYuIizMsDJgO
 yJQMMe00Jv0CoGGmgtn13KhV/fGuqa/+b6j1bVFJDQ2nXUoOat55knIwVd8qnb0DfCKVPyd0B1o
 5I7qOLW3wiH6jNF1DlHsYH2qXNEVbSwKdVVi79jMf0wnV6JjB5Fvz38H4CySMxVpvtYf
X-Received: by 2002:a05:651c:2359:10b0:389:fc6b:9454 with SMTP id
 38308e7fff4ca-38a2c583467mr22109951fa.13.1772646995873; Wed, 04 Mar 2026
 09:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20260222-ch13726a-v1-0-e501d78e105a@gmail.com>
 <20260222-ch13726a-v1-1-e501d78e105a@gmail.com>
 <933fd2e0-46ff-4ab8-b98a-554ac46982c5@linaro.org>
In-Reply-To: <933fd2e0-46ff-4ab8-b98a-554ac46982c5@linaro.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 4 Mar 2026 11:56:24 -0600
X-Gm-Features: AaiRm503dwPO8RgKvk7vgqamLzghT_hAE_djuV6DTVOJQl-B8hBdPQJ9jubqRSA
Message-ID: <CALHNRZ_TdVDy93uvM=p7ht50v0Y2W4Ji4ZsFwPFAgR8FZh=myw@mail.gmail.com>
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
X-Rspamd-Queue-Id: E7D692057F2
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
	FORGED_SENDER(0.00)[webgeek1234@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org,sobir.in];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 10:32=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 2/22/26 23:26, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The Chip Wealth Technology CH13726A display driver is a single chip
> > solution for AMOLED using MIPI-DSI. This is used for the AYN Thor botto=
m
> > panel.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >   .../display/panel/chipwealth,ch13726a.yaml         | 66 +++++++++++++=
+++++++++
> >   1 file changed, 66 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/chipwealth=
,ch13726a.yaml b/Documentation/devicetree/bindings/display/panel/chipwealth=
,ch13726a.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..890984b00c3412850661769=
95e6a973c5607cbde
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/chipwealth,ch1372=
6a.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/chipwealth,ch13726a.y=
aml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Chip Wealth Technology CH13726A display driver
> > +
> > +maintainers:
> > +  - Place Holder <place@holder.com>
>
> ??

Please see my reply on the cover [0].

> > +
> > +description:
> > +  Chip Wealth Technology CH13726A is a single-chip solution
> > +  for AMOLED connected using a MIPI-DSI video interface.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: ayntec,thor-panel-bottom
>
> ??? why not chipwealth,ch13726a ??

Because this is a driver chip that supports multiple panels. The
driver code I based on also supports the retroid pocket 5 panel, which
has a different resolution. Similar naming is used in the rocktech
jh057n00900 binding, which is why I picked this compatible.

> > +
> > +  port: true
> > +  reg:
> > +    maxItems: 1
> > +    description: DSI virtual channel
> > +
> > +  vdd-supply: true
> > +  vddio-supply: true
> > +  vdd1v2-supply: true
> > +  avdd-supply: true
> > +
> > +  reset-gpios: true
> > +
> > +  rotation: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vdd-supply
> > +  - vddio-supply
> > +  - vdd1v2-supply
> > +  - avdd-supply
> > +  - reset-gpios
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
> > +        panel@0 {
> > +            compatible =3D "ayntec,thor-panel-bottom";
> > +            reg =3D <0>;
> > +            vdd1v2-supply =3D <&vreg_l11b_1p2>;
> > +            vddio-supply =3D <&vdd_disp_1v8>;
> > +            vdd-supply =3D <&vreg_l13b_3p0>;
> > +            avdd-supply =3D <&vdd_disp2_2v8>;
> > +            reset-gpios =3D <&tlmm 133 GPIO_ACTIVE_HIGH>;
> > +        };
> > +    };
> > +
> > +...
> >
>

Aaron

[0] https://lore.kernel.org/dri-devel/20260222-ch13726a-v1-0-e501d78e105a@g=
mail.com/
