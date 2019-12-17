Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE3124144
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD8C6E265;
	Wed, 18 Dec 2019 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07006E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:01:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 57EC5214CE;
 Tue, 17 Dec 2019 11:01:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 17 Dec 2019 11:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=Y
 HIMCc3/SwCjYhzOqSCPEnWxTwNP453CayjjOfzEEEA=; b=DEshovlqPlbPnnl9W
 rWoscm41p9R2HT2FQnZBMF4K0Mpu56k1+I9PssBwz8lAzJvBnluCvLnhLc7dqoeL
 51vb/t1EAhPtWEEa90JLYh+KIzs0rqEW2XLvNRZqrmERzvzjqL1Cqphon1Fw5Ycj
 AeZ71M9TU6bNOM1xV9iJmsxN4Wktw43AVts4EjK3itzRCEHfAaYNVPZEvDxyJDwB
 czWGpI/RnGNKTZv6GPd/SoAjZIuCIWt2GCoq1Bgu83hbglfBkskhnm/812sw09Vy
 jmKJj+aCByaAnC4QrCvfs2vk1YlDpE6C7itDOLq+iI99l6mjDpAMV0n3YY3oyfFZ
 9Ylzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=YHIMCc3/SwCjYhzOqSCPEnWxTwNP453CayjjOfzEE
 EA=; b=SSfPjRs0n/teT+8ELHDjqJexAvfcNzNmZXDYI7Mo0h4yKN1C2Mssv7OjL
 c8LYIqcqAExc4nubBM7ACNdlf6K3gOEADVaFFB10PlwZstixjjPHJ5V8DNtKvlUI
 3W0GbmK1V7iE3C+MIKFCzulP7mJ73AV1x9TpV1jA/p6vqKT1bdxCDZJhcfw5LJ5R
 y+Kqhe2r816Qi/FQe4201wPVOrsZpuCYm+wxQBvH4O98+D50QA83W9jsTgPaxghO
 wgtSPJqE1k7+PNxd2FMsvfi1WpxqFDoUsmNZ+Eyyc3Nr1YWBkR3WS/UEUfiWZLbz
 Qj9okuoKoasEkoLrSalsjxmAQm0sg==
X-ME-Sender: <xms:1Pv4Xdd_GwUuGLKbzYRLs9N4olWgj3iJRHwAiBQw6ecosSp_wgtHtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtjedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrg
 hinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghhnecuve
 hluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:1Pv4XQesoeRACw8dYH21Py4H-7RCKANRMLsA7d0IE6GAye0-PUzZaw>
 <xmx:1Pv4XZLYJGYeWjURFkBwAnS09OKATB7Ih86x8BvrwriOnPIOmq-zMg>
 <xmx:1Pv4XWp-opwi82fJNStAcAVPMPxNXGd5_klApx4v54kev_5BUv-NlQ>
 <xmx:1vv4XZIX-GxCFKrlIxmkBMRJBCLp8nccp0qQgjyGeC6lKVhRBkku9w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 84A338005A;
 Tue, 17 Dec 2019 11:01:24 -0500 (EST)
Date: Tue, 17 Dec 2019 17:01:22 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: panel: Add binding document
 for Xinpeng XPP055C272
Message-ID: <20191217160122.psxwdd6accn7soed@gilmour.lan>
References: <20191217140703.23867-1-heiko@sntech.de>
 <20191217140703.23867-2-heiko@sntech.de>
 <20191217142446.yexcmh5ox4336qmd@gilmour.lan>
 <1823876.MjdJyG0ANN@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1823876.MjdJyG0ANN@diego>
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:02 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 04:08:49PM +0100, Heiko St=FCbner wrote:
> Am Dienstag, 17. Dezember 2019, 15:24:46 CET schrieb Maxime Ripard:
> > Hi,
> >
> > On Tue, Dec 17, 2019 at 03:07:02PM +0100, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > >
> > > The XPP055C272 is a 5.5" 720x1280 DSI display.
> > >
> > > changes in v2:
> > > - add size info into binding title (Sam)
> > > - add more required properties (Sam)
> > >
> > > Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > ---
> > >  .../display/panel/xinpeng,xpp055c272.yaml     | 48 +++++++++++++++++=
++
> > >  1 file changed, 48 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/x=
inpeng,xpp055c272.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,=
xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,x=
pp055c272.yaml
> > > new file mode 100644
> > > index 000000000000..2d0fc97d735c
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c=
272.yaml
> > > @@ -0,0 +1,48 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#
> >
> > The ID doesn't match the file name.
> >
> > Did you run dt_bindings_check?
>
> Thanks for that pointer ... I did run dtbs_check on the binding and was
> sooo happy to not find any panel errors in the pages of other dt errors
> but till now didn't realize that there's also a dtbinding_check.

dt_bindings_check is a sanity check on the bindings
themselves. dtbs_check is using those bindings to check the device
trees.

dtbs_check used to have a dependency on dt_bindings_check, but it got
removed recently.

Maxime

>
> Will keep that in mind for future bindings  - and of course fix things
> in the next version.
>
>
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Xinpeng XPP055C272 5.5in 720x1280 DSI panel
> > > +
> > > +maintainers:
> > > +  - Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: xinpeng,xpp055c272
> > > +  reg: true
> > > +  backlight: true
> > > +  port: true
> >
> > What is the port supposed to be doing?
>
> Hooking the display up to the dsi controller. But you're right,
> works without port as well with these single-dsi displays.
>
> I just remember needing one for the Gru-Scarlet display that needed
> to connect to two dsi controllers.
>
> So I'll drop the port node here and from my board devicetree.

It's not really what I meant though :)

If it's needed then we should definitely have it, but we should
document our expectations here: is it the input port ? output? in
which case do we want to use it since it's optional, etc.

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
