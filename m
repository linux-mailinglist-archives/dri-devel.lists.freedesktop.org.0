Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YABKD6Uhk2lJ1wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:54:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06A81443B8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213C710E046;
	Mon, 16 Feb 2026 13:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20ACE10E046
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 13:54:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <m.tretter@pengutronix.de>)
 id 1vrz3e-0003du-HS; Mon, 16 Feb 2026 14:54:38 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <m.tretter@pengutronix.de>) id 1vrz3b-0014kk-2H;
 Mon, 16 Feb 2026 14:54:37 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
 (envelope-from <m.tretter@pengutronix.de>)
 id 1vrz3c-00000005sA5-3uTO; Mon, 16 Feb 2026 14:54:36 +0100
Date: Mon, 16 Feb 2026 14:54:36 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rouven Czerwinski <r.czerwinski@pengutronix.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: add YAML schema for
 LXD M9189A
Message-ID: <aZMhnIE3gmvIr3Aq@pengutronix.de>
References: <20241025141130.3179166-1-r.czerwinski@pengutronix.de>
 <20241025141130.3179166-2-r.czerwinski@pengutronix.de>
 <m2jrr3stleuals5iadxn6yu5j77wxufavvdqo3e7244ckefrk5@kbvo6fbsref2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <m2jrr3stleuals5iadxn6yu5j77wxufavvdqo3e7244ckefrk5@kbvo6fbsref2>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:r.czerwinski@pengutronix.de,m:quic_jesszhan@quicinc.com,m:sam@ravnborg.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:neil.armstrong@linaro.org,m:airlied@gmail.com,m:daniel@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh+dt@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[m.tretter@pengutronix.de,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[pengutronix.de,quicinc.com,ravnborg.org,lists.freedesktop.org,vger.kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: C06A81443B8
X-Rspamd-Action: no action

On Sat, 26 Oct 2024 14:29:27 +0200, Krzysztof Kozlowski wrote:
> On Fri, Oct 25, 2024 at 04:11:28PM +0200, Rouven Czerwinski wrote:
> 
> A nit, subject: drop second/last, redundant "YAML schema for". The
> "dt-bindings" prefix is already stating that these are bindings in
> schema and YAML.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Ack. I'll change the subject to "dt-bindings: display: panel: add LXD
M9189A" in v4.

> 
> > +++ b/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/lxd,m9189a.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LXD M9189A DSI Display Panel
> > +
> > +maintainers:
> > +  - Rouven Czerwinski <r.czerwinski@pengutronix.de>
> > +
> > +properties:
> > +  compatible:
> > +    const: lxd,m9189a
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  standby-gpios:
> > +    description: GPIO used for the standby pin
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description: GPIO used for the reset pin
> > +    maxItems: 1
> > +
> > +  vdd-supply:
> > +    description: Power regulator
> > +
> > +  backlight:
> > +    description: Backlight used by the panel
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +  port: true
> 
> This misses it's definition. You should reference proper panel schema in
> top-level.

Fixed in v3 by referring to panel-common.yaml as base.

> 
> Best regards,
> Krzysztof
> 
