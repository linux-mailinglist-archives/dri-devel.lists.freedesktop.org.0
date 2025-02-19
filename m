Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60F8A3C1EF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A18710E82A;
	Wed, 19 Feb 2025 14:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uzVFdQA1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D796310E823
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:22:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 47C8AA428C6;
 Wed, 19 Feb 2025 14:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8078AC4CEE0;
 Wed, 19 Feb 2025 14:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739974961;
 bh=L9cXmlOzsS72RtfjvOGSFezFI8Z+PKWtlvupHDV8mXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uzVFdQA1Km9wft+L5wvygubV3B/Fz2QcpdIz+JXKjuuFKnitm6lsvXeidMhpBV0LQ
 JK7WsHfxN8G2YeOy5B+9gUafcBqnx9y+tYC8QTMCkx3oDabU8J2PwGuLciLpoTljGi
 gJ2Q5aCQBqTYAs6WoDUu08uUDQgR/mbz9D7iLK4Gu0fEoFGiZAqW1Lx+RYPlqEvgJI
 y/xh4EDCHkbz5JvAxxpBrpg6l4iuwb1aVlZU2jLWIfQxcryta/MKtPr3q6ZMKGzGLz
 8dL1VqT+19PvE3dY40ZyWWFPkALgUxwWrBUdbR75savI5R5YgGRmUeyjJ9krfrBvnQ
 FB6wgG5Bc48ow==
Date: Wed, 19 Feb 2025 08:22:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Linux Kernel List <linux-kernel@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>,
 Nishanth Menon <nm@ti.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Praneeth Bajjuri <praneeth@ti.com>, Maxime Ripard <mripard@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Udit Kumar <u-kumar1@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Devarsh Thakkar <devarsht@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v5 2/3] dt-bindings: display: ti: Add schema for AM625
 OLDI Transmitter
Message-ID: <173997495988.2526899.9124442481347234668.robh@kernel.org>
References: <20250209160925.380348-1-aradhya.bhatia@linux.dev>
 <20250209160925.380348-3-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209160925.380348-3-aradhya.bhatia@linux.dev>
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


On Sun, 09 Feb 2025 21:39:24 +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> The OLDI transmitters (TXes) do not have registers of their own, and are
> dependent on the source video-ports (VPs) from the DSS to provide
> configuration data. This hardware doesn't directly sit on the internal
> bus of the SoC, but does so via the DSS. Hence, the OLDI TXes are
> supposed to be child nodes under the DSS, and not independent devices.
> 
> Two of the OLDI TXes can function in tandem to output dual-link OLDI
> output, or cloned single-link outputs. In these cases, one OLDI will be
> the primary OLDI, and the other one, a companion. The following diagram
> represents such a configuration.
> 
> +-----+-----+         +-------+
> |     |     |         |       |
> |     | VP1 +----+--->+ OLDI0 |  (Primary - may need companion)
> |     |     |    |    |       |
> | DSS +-----+    |    +-------+
> |     |     |    |
> |     | VP2 |    |    +-------+
> |     |     |    |    |       |
> +-----+-----+    +--->+ OLDI1 |  (Companion OLDI)
>                       |       |
>                       +-------+
> 
> The DSS in AM625 SoC has a configuration like the one above. The AM625
> DSS VP1 (port@0) can connect and control 2 OLDI TXes, to use them in
> dual-link or cloned single-link OLDI modes. It is only the VP1 that can
> connect to either OLDI TXes for the AM625 DSS, and not the VP2.
> 
> Alternatively, on some future TI SoCs, along with the above
> configuration, the OLDI TX can _also_ connect to separate video sources,
> making them work entirely independent of each other. In this case,
> neither of the OLDIs are "companion" or "secondary" OLDIs, and nor do
> they require one. They both are independent and primary OLDIs. The
> following diagram represents such a configuration.
> 
> +-----+-----+               +-------+
> |     |     |               |       |
> |     | VP1 +--+----------->+ OLDI0 |  (Primary - may need companion)
> |     |     |  |            |       |
> |     +-----+  |            +-------+
> |     |     |  |
> |     | VP2 |  |
> |     |     |  |
> | DSS +-----+  |   +---+    +-------+
> |     |     |  +-->+ M |    |       |
> |     | VP3 +----->+ U +--->+ OLDI1 |  (Companion or Primary)
> |     |     |      | X |    |       |
> |     +-----+      +---+    +-------+
> |     |     |
> |     | VP4 |
> |     |     |
> +-----+-----+
> 
> Note that depending on the mux configuration, the OLDIs can either be
> working together in tandem - sourced by VP1, OR, they could be working
> independently sourced by VP1 and VP3 respectively.
> The idea is to support all the configurations with this OLDI TX schema.
> 
> The OLDI functionality is further supported by a system-control module,
> which contains a few registers to control OLDI IO power and other
> electrical characteristics of the IO lanes.
> 
> Add devicetree binding schema for the OLDI TXes to support various
> configurations, and extend their support to the AM625 DSS.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  .../bindings/display/ti/ti,am625-oldi.yaml    |  88 ++++++++++
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 154 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 243 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

