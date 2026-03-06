Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCiSFKqUqmkkUAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:47:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEA021D517
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44F310E3BF;
	Fri,  6 Mar 2026 08:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0A110E3D0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 08:47:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1vyQpn-0003Ng-6C; Fri, 06 Mar 2026 09:46:59 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vyQpj-0041QC-2g;
 Fri, 06 Mar 2026 09:46:57 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
 (envelope-from <mfe@pengutronix.de>) id 1vyQpl-00000004801-0Cgq;
 Fri, 06 Mar 2026 09:46:57 +0100
Date: Fri, 6 Mar 2026 09:46:57 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, imx@lists.linux.dev, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Marek Vasut <marex@denx.de>, 
 dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/9] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
Message-ID: <dmqbmmpyi3ssvq67iqwbt6ww7tsaik7ifi5dnupmuhep7u5saz@ads5g7ette3y>
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
 <20260304-dcif-upstreaming-v8-1-bec5c047edd4@oss.nxp.com>
 <b7968f1a-c4bc-4bad-bcf8-407ff2d8db27@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7968f1a-c4bc-4bad-bcf8-407ff2d8db27@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
X-Rspamd-Queue-Id: 2AEA021D517
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:laurentiu.palcu@oss.nxp.com,m:imx@lists.linux.dev,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:marex@denx.de,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[m.felsch@pengutronix.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.nxp.com,lists.linux.dev,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,denx.de,lists.freedesktop.org,nxp.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:email]
X-Rspamd-Action: no action

On 26-03-06, Liu Ying wrote:
> On Wed, Mar 04, 2026 at 11:34:10AM +0000, Laurentiu Palcu wrote:
> > i.MX94 has a single LVDS port and share similar LDB and LVDS control
> > registers as i.MX8MP and i.MX93.
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> > index 7f380879fffdf..fb70409161fc0 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> > @@ -20,6 +20,7 @@ properties:
> >        - fsl,imx6sx-ldb
> >        - fsl,imx8mp-ldb
> >        - fsl,imx93-ldb
> > +      - fsl,imx94-ldb
> 
> Cc'ing Marco.
> 
> Recently, Marco said that LDB node should not have a reg property...
> 
> https://lore.kernel.org/all/4sofljffovrorpxe2os3jl745qfjoglvl54oqf3v7r5bk5f6aq@6y3jwn4abiqy/

Yes, this has to be dropped. All variants of this specific "IP" use the
same approach. This "IP" is part of a general purpose register layout
with very loose reg-field definitions: e.g. resets and clk-gatting share
the same register. Or a mux reg-field shares the same register as a
MIPI-{C,D}SI configuration reg-field. Therefore this "IP" is part of a
syscon and should be abstracted as such within the DT.

Regards,
  Marco

> >    clocks:
> >      maxItems: 1
> > @@ -78,6 +79,7 @@ allOf:
> >              enum:
> >                - fsl,imx6sx-ldb
> >                - fsl,imx93-ldb
> > +              - fsl,imx94-ldb
> >      then:
> >        properties:
> >          ports:
> > 
> 
> -- 
> Regards,
> Liu Ying

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
