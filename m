Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA6ACF23E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 16:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EA810E056;
	Thu,  5 Jun 2025 14:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WzNbi196";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2902510E056
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 14:41:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C7E8F6112E;
 Thu,  5 Jun 2025 14:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4351AC4CEEB;
 Thu,  5 Jun 2025 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749134506;
 bh=yO5fqt9HuK0kjVxjDKW2m26zjnbn/JAZBHwnXsXNWqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WzNbi196JZko7WsBkAtNHT7clAsU2rlKFe1W4Ry43owbvfA8kIZMgoGmnSVuNUUiR
 nQSF0LTyLqzNrTrYsEqDG9WyrzGG61wZbmz9OA7zpuKH+w5roTplYwUmuAJ3TXMn3e
 TjrRtqrKO03hyYGUMpmOeRbhP+RfHMaHWyW9NnZBJdkNVOe3rr/NP2zbYtZJ824rzG
 k2YcvaO3jN12B6d51/qRc1iqAOyCz9w/5igBEMxnvPP7CrQkOaBKpDUaCBnbxxQ4s/
 F5WixNznQg7yOHqPGtqPl4wUUU6tkw2Sl6Y0mWVChw92iJAZ4Gnn6IhXQ6QI92r/ZI
 n1XAME+AgMzUQ==
Date: Thu, 5 Jun 2025 09:41:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Devarsh Thakkar <devarsht@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Vignesh Raghavendra <vigneshr@ti.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Nishanth Menon <nm@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v9 2/4] dt-bindings: display: ti: Add schema for AM625
 OLDI Transmitter
Message-ID: <174913450088.2539370.15860584421984514366.robh@kernel.org>
References: <20250528122544.817829-1-aradhya.bhatia@linux.dev>
 <20250528122544.817829-3-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528122544.817829-3-aradhya.bhatia@linux.dev>
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


On Wed, 28 May 2025 17:55:42 +0530, Aradhya Bhatia wrote:
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
> Changes Log:
> V9:
>   - Reword the "ti,companion-oldi" property description.
>   - Fix the missing "ti,companion-oldi" property in the schema example.
>   - v8 of this patch: https://lore.kernel.org/all/20250525151721.567042-3-aradhya.bhatia@linux.dev/
> 
> V8:
>   - Drop the condition that made the "secondary-oldi" and "companion-oldi"
>     properties mutually exclusive.
>   - Add "ti,am62l-dss" compatible to the list of compatibles that cannot
>     use the multiple endpoints or have "oldi-transmitters", on port@0.
>   - Because of above, drop R-b tags from Tomi Valkeinen, and Rob Herring.
>   - v7 of this patch: https://lore.kernel.org/all/20250329133943.110698-3-aradhya.bhatia@linux.dev/
> 
> ---
>  .../bindings/display/ti/ti,am625-oldi.yaml    |  79 +++++++++
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 157 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 237 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

