Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C6B4B6441
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 08:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BF610E395;
	Tue, 15 Feb 2022 07:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7059410E31A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 22:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bR7fehLtd9M9qTlT7VF3MZCfD/oznbKy8d/rqBxhceI=; b=b6x2pgLOdjZzH5KLlIZgvJyoXv
 GKkZ3K/n17R148WZDlU1eruFAgIM7qcQ0yNXDJgq+kpCvYb0IUdkgTZfYmAJINSaDOyqX0mYh9Lmj
 INu+sZAUB3/X7OsoDFup9tB0VoLt3zT08ktodD/o+h4VgRv0JGAFH6LrxWCGAVyFb2TM=;
Received: from p200300ccff09cb001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff09:cb00:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1nJk5u-00041L-DZ; Mon, 14 Feb 2022 23:45:18 +0100
Date: Mon, 14 Feb 2022 23:45:17 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 1/6] dt-bindings: display: imx: Add EPDC
Message-ID: <20220214234517.121e1167@aktux>
In-Reply-To: <YgaE06Ktabpf2dJC@robh.at.kernel.org>
References: <20220206080016.796556-1-andreas@kemnade.info>
 <20220206080016.796556-2-andreas@kemnade.info>
 <YgaE06Ktabpf2dJC@robh.at.kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Tue, 15 Feb 2022 07:25:06 +0000
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 letux-kernel@openphoenux.org, tzimmermann@suse.de, samuel@sholland.org,
 airlied@linux.ie, s.hauer@pengutronix.de, alistair@alistair23.me,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 josua.mayer@jm0.eu, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Fri, 11 Feb 2022 09:46:27 -0600
Rob Herring <robh@kernel.org> wrote:

> On Sun, Feb 06, 2022 at 09:00:11AM +0100, Andreas Kemnade wrote:
> > Add a binding for the Electrophoretic Display Controller found at least
> > in the i.MX6.  
> 
> The first version was in i.MX50 (I helped design the register 
> interface). Is that version compatible?
> 
it has some differences, but that could be detected by EPDC_VERSION
register. I do not own such a device, so I cannot fully check. I have
not seen any driver with devicetree for IMX5. For now I am rejecting
anything which has a EPDC version which I cannot check. 

> > The timing subnode is directly here to avoid having display parameters
> > spread all over the plate.
> > 
> > Supplies are organized the same way as in the fbdev driver in the
> > NXP/Freescale kernel forks. The regulators used for that purpose,
> > like the TPS65185, the SY7636A and MAX17135 have typically a single bit to
> > start a bunch of regulators of higher or negative voltage with a
> > well-defined timing. VCOM can be handled separately, but can also be
> > incorporated into that single bit.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  .../bindings/display/imx/fsl,mxc-epdc.yaml    | 159 ++++++++++++++++++
> >  1 file changed, 159 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> > new file mode 100644
> > index 000000000000..7e0795cc3f70
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> > @@ -0,0 +1,159 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/fsl,mxc-epdc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX6 EPDC
> > +
> > +maintainers:
> > +  - Andreas Kemnade <andreas@kemnade.info>
> > +
> > +description: |
> > +  The EPDC is a controller for handling electronic paper displays found in
> > +  i.MX6 SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx6sl-epdc
> > +      - fsl,imx6sll-epdc  
> 
> Not compatible with each other?
> 
differences are detectable by EPDC_VERSION register, so probably so
problem. NXP/Freescale kernel uses
fsl,imx6dl-epdc
and 
fsl,imx7d-epdc (used also by imx6 devices with EPDC_VERSION = 3.0)
in their drivers.

fsl,imx6dl-epdc
fsl,imx6sl-epdc
fsl,imx6sll-epdc
fsl,imx7d-epdc
in their dtsis.

But the general rule is to use as less as possible compatible strings
if differences can be probed properly, so only one should be
sufficient? Which one?

Regards,
Andreas
