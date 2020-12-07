Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2872D2608
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E6D6E971;
	Tue,  8 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB2489D5C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 11:16:52 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1kmEVa-0000F1-96; Mon, 07 Dec 2020 12:16:46 +0100
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ore@pengutronix.de>)
 id 1kmEVZ-0004Al-68; Mon, 07 Dec 2020 12:16:45 +0100
Date: Mon, 7 Dec 2020 12:16:45 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v6 3/8] dt-bindings: display: simple: Add Kyocera
 tcg070wvlq panel
Message-ID: <20201207111645.htb56uqxf6mp7qcq@pengutronix.de>
References: <20201202081826.29512-1-o.rempel@pengutronix.de>
 <20201202081826.29512-4-o.rempel@pengutronix.de>
 <20201205193639.GH332836@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205193639.GH332836@ravnborg.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:10:44 up 5 days, 1:17, 24 users, load average: 0.37, 0.10, 0.06
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Jander <david@protonic.nl>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 05, 2020 at 08:36:39PM +0100, Sam Ravnborg wrote:
> On Wed, Dec 02, 2020 at 09:18:21AM +0100, Oleksij Rempel wrote:
> > So far, this panel seems to be compatible with "lg,lb070wv8", on other
> > hand it is better to set this compatible in the devicetree. So, let's
> > add it for now only to the dt-binding documentation to fix the
> > checkpatch warnings.
> > 
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  .../devicetree/bindings/display/panel/panel-simple.yaml          | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index 0bb3e67fb58c..8f7a0e409eee 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > @@ -172,6 +172,7 @@ properties:
> >        - koe,tx26d202vm0bwa
> >          # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
> >        - koe,tx31d200vm0baa
> > +      - kyo,tcg070wvlq
> Can you provine a comment here about what panel it is?

By searching for this part I can't find any unified name. Each re-seller seems
to use something own, and inventing one seems to make no real sense as
well.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
