Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C681A3C1DF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1741710E1D5;
	Wed, 19 Feb 2025 14:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Na6eQl/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F93510E1D5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:20:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6A731A4289F;
 Wed, 19 Feb 2025 14:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C92C4CED1;
 Wed, 19 Feb 2025 14:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739974844;
 bh=tXlCdH0X+xikR3zseXWRre0Ou4/Yp8Pw7Nsiy7ySbig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Na6eQl/uA9zuc0lfzqHgEBKDBNxXa+POV4YGyC7MYTKQgEeIiqC0LwfmCEMI7xaPl
 W14jPeyWZh3KH0yFp2GUqn+n/JygquKIcYT2GdLQNHcndZFCcwajW4ccDus/IVmYHA
 XnaX2P6VoI4YbhQggPkLIiXhfWwoEDOwe8xMIARPegxooK+KEg3vN0GequKbRixfax
 yd7dURDozQQqAqnbAuAe0ig3ChKUWIoRy+13B5BqnVqfnfryZvXSw2Q6mGE7AWr42P
 Hnda7rXxX8eTL5mwbb+nII8mRGSs6Oj0j2Pg4DyMqMIEyzaYRf/r7kzy/b0faJS7bF
 XOVYd78wU1bVA==
Date: Wed, 19 Feb 2025 08:20:42 -0600
From: Rob Herring <robh@kernel.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>
Subject: Re: [PATCH v5 2/3] dt-bindings: display: ti: Add schema for AM625
 OLDI Transmitter
Message-ID: <20250219142042.GA2436009-robh@kernel.org>
References: <20250209160925.380348-1-aradhya.bhatia@linux.dev>
 <20250209160925.380348-3-aradhya.bhatia@linux.dev>
 <16db8f3d-04a2-408a-964f-4cf9478229b4@ideasonboard.com>
 <8c6e790e-f1b6-46ab-9acf-bdea8076405b@linux.dev>
 <cd62bf21-adad-4422-8fac-ebd20e8b39a5@ideasonboard.com>
 <062b78a3-7e83-4202-a753-4e7bd43e8bc2@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <062b78a3-7e83-4202-a753-4e7bd43e8bc2@linux.dev>
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

On Fri, Feb 14, 2025 at 06:11:11PM +0530, Aradhya Bhatia wrote:
> Hi Tomi,
> 
> 
> On 13/02/25 18:50, Tomi Valkeinen wrote:
> > Hi,
> > 
> > On 13/02/2025 14:33, Aradhya Bhatia wrote:
> > 
> >>>> +� ti,companion-oldi:
> >>>> +��� $ref: /schemas/types.yaml#/definitions/phandle
> >>>> +��� description:
> >>>> +����� phandle to companion OLDI transmitter. This property is
> >>>> mandatory for the
> >>>> +����� primarty OLDI TX if the OLDI TXes are expected to work either
> >>>> in dual-lvds
> >>>> +����� mode or in clone mode. This property should point to the
> >>>> secondary OLDI
> >>>> +����� TX.
> >>>> +
> >>>> +� ti,secondary-oldi:
> >>>> +��� type: boolean
> >>>> +��� description:
> >>>> +����� Boolean property to mark the OLDI transmitter as the secondary
> >>>> one, when the
> >>>> +����� OLDI hardware is expected to run as a companion HW, in cases of
> >>>> dual-lvds
> >>>> +����� mode or clone mode. The primary OLDI hardware is responsible
> >>>> for all the
> >>>> +����� hardware configuration.
> >>>
> >>> I think these work, but I'm wondering if we would ever need to check
> >>> something from the main oldi from the secondary oldi. In that case
> >>> "crossed phandles" would be better, i.e. something like:
> >>>
> >>> (in the first oldi:)
> >>> ti,slave-oldi = <phandle-to-second-oldi>
> >>>
> >>> (in the second oldi:)
> >>> ti,master-oldi = <phandle-to-first-oldi>
> >>
> >> When I had first designed the code and the devicetree for OLDI, it was
> >> done so with the belief that we wouldn't reqiure a bridge instance for
> >> the secondary OLDI, at all.
> >>
> >> While that idea holds true for dual-lvds configuration, it doesn't so
> >> for the clone mode configuration. For clone mode, as you pointed out, we
> >> will require a 2nd bridge instance to configure any of the bridges and
> >> panels that come after the 2nd OLDI.
> >>
> >>
> >>>
> >>> Then again, if we ever need that, even with these bindings the driver
> >>> could find the first oldi, but needs to go via the dss's node.
> >>
> >> While it is possible to do it this way, it might not be the cleanest
> >> one. And _if_ there is a ever a DSS in future with more than 2 OLDI
> >> TXes, say 4, then the decipher logic may get too complicated.
> >>
> >> While I cannot think of any case where the secondary OLDI bridge DT
> >> might need to access the primary OLDI bridge at the moment, I wonder if
> >> we should play it safer and have this option anyway.
> >>
> >> Maybe something like this?
> >>
> >> (primary OLDI)
> >> ti,primary-oldi;
> >> ti,companion-oldi = <phandle-to-secondary-oldi>;
> >>
> >> (secondary OLDI)
> >> ti,secondary-oldi;
> >> ti,companion-oldi = <phandle-to-primary-oldi>;
> > 
> > How is this different than my proposal, except a bit more verbose?
> 
> That's all the difference there is. Just an alternative to what you
> suggested.
> 
> > 
> > If you're thinking about a 4-OLDI hardware, how would this work there?
> 
> I didn't mean that my alternative would be more helpful. I meant that
> passing phandles would be a simpler way for 4-OLDI hardware in general.
> 
> We'd have to sift through a max of 4 OLDI nodes to find the right
> primary OLDI for a given secondary OLDI - if we try to find it via the
> dss and oldi-transmitter parent DT nodes. Passing phandles directly
> would save on all that logic.

I prefer the data in the DT be the minimum needed. Parsing the DT 
doesn't need to be particularly fast because you should only do it once. 
There's even a function already to find occurrences of a property name 
all over the tree.

Rob
