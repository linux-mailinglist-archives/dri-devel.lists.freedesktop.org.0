Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59E59E1BB4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 13:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC80210E0D4;
	Tue,  3 Dec 2024 12:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EhuypSiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CE210E0D4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 12:12:09 +0000 (UTC)
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi
 [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57177E1;
 Tue,  3 Dec 2024 13:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733227899;
 bh=GDwPr4QyEhVpjwGfXI94ePk9KDZB32MM6IodRBbOegE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EhuypSiS7ql2Xn5Q089wPUoQSUUfwPanDrw7CAM5AISzigC9L5iI5tC4de3/2x+ZD
 jf/j7zi7jldnWsLdc9EZjC5woenOj+F/3+WK873qFwik2HDngeYWbbaMX4UrgMPcYG
 gUYYYEdi8DcNWtJ/ed2fIF0z2WE3RwJUhruhhAN8=
Message-ID: <8b57d6a4-6bc1-4542-abf4-8bc4a3120c25@ideasonboard.com>
Date: Tue, 3 Dec 2024 14:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] drm/tidss: Add OLDI bridge support
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Max Krummenacher <max.oss.09@gmail.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20241124143649.686995-1-aradhya.bhatia@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20241124143649.686995-1-aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 24/11/2024 16:36, Aradhya Bhatia wrote:
> Hello all,
> 
> This patch series add support for the dual OLDI TXes supported in Texas
> Instruments' AM62x and AM62Px family of SoCs. The OLDI TXes support single-lvds
> lvds-clone, and dual-lvds modes. These have now been represented through DRM
> bridges within TI-DSS.
> 
>   - Some history and hardware description for this patch series.
> 
> This patch series is a complete re-vamp from the previously posted series[1] and
> hence, the version index has been reset to v1. The OLDI support from that series
> was dropped and only the base support for AM62x DSS was kept (and eventually
> merged)[2].
> 
> The OLDI display that the tidss driver today supports, could not be extended for
> the newer SoCs. The OLDI display in tidss is modelled after the DSS and OLDI
> hardware in the AM65x SoC. The DSS in AM65x SoC, has two video-ports. Both these
> video-ports (VP) output DPI video signals. One of the DPI output (from VP1) from
> the DSS connects to a singular OLDI TX present inside the SoC. There is no other
> way for the DPI from VP1 to be taken out of the SoC. The other DPI output
> however - the one from VP2 - is taken out of the SoC as is. Hence we have an
> OLDI bus output and a DPI bus output from the SoC. Since the VP1 and OLDI are
> tightly coupled, the tidss driver considers them as a single entity. That is
> why, any OLDI sink connects directly to the DSS ports in the OF graphs.
> 
> The newer SoCs have varying DSS and OLDI integrations.
> 
> The AM62x DSS also has 2 VPs. The 2nd VP, VP2, outputs DPI signals which are
> taken out of the SoC - similar to the AM65x above. For the VP1, there are 2 OLDI
> TXes. These OLDI TXes can only receive DPI signals from VP1, and don't connect
> to VP2 at all.
> 
> The AM62Px SoC has 2 OLDI TXes like AM62x SoC. However, the AM62Px SoC also has
> 2 separate DSSes. The 2 OLDI TXes can now be shared between the 2 VPs of the 2
> DSSes.
> 
> The addition of the 2nd OLDI TX (and a 2nd DSS in AM62Px) creates a need for
> some major changes for a full feature experience.
> 
> 1. The OF graph needs to be updated to accurately show the data flow.
> 2. The tidss and OLDI drivers now need to support the dual-link and the cloned
>     single-link OLDI video signals.
> 3. The drivers also need to support the case where 2 OLDI TXes are connected to
>     2 different VPs - thereby creating 2 independent streams of single-link OLDI
>     outputs.
> 
> Note that the OLDI does not have registers of its own. It is still dependent on
> the parent VP. The VP that provides the DPI video signals to the OLDI TXes, also
> gives the OLDI TXes all the config data. That is to say, the hardware doesn't
> sit on the bus directly - but does so through the DSS.
> 
> In light of all of these hardware variations, it was decided to have a separate
> OLDI driver (unlike AM65x) but not entirely separate so as to be a platform
> device. The OLDI TXes are now being represented as DRM bridges under the tidss.
> 
> Also, since the DRM framework only really supports a linear encoder-bridge
> chain, the OLDI driver creates a DRM bridge ONLY for the primary OLDI TX in
> cases of dual-link or cloned single-link OLDI modes. That bridge then attaches

How does the clone case work, then? There are two panels, what does the 
second one connect to?

> to the tidss's display core - which consists of a CRTC, an Encoder (dummy) and a
> bridge (dummy). On the other end, it attaches to OLDI sinks (panels or other
> bridges).
> 
> Since the OLDI TX have a hardware dependency with the VP, the OLDI configuration
> needs to happen before that VP is enabled for streaming. VP stream enable takes
> place in tidss_crtc_atomic_enable hook. I have posted a patch allowing DRM
> bridges to get pre-enabled before the CRTC of that bridge is enabled[0]. Without
> that patch, some warnings or glitches can be seen.
> 
> These patches have been tested on AM625 based Beagleplay[3] platform with a
> Lincolntech LCD185 dual-lvds panel. The patches with complete support including
> the expected devicetree configuration of the OLDI TXes can be found in the
> "next_oldi_v4_tests" branch of my github fork[4]. This branch also has support
> for Microtips dual-lvds panel (SK-LCD1) which is compatible with the SK-AM625
> EVM platform.
> 
> Due to lack of hardware, I haven't been able to test single-link / cloned
> single-link OLDI modes. I have only used a sample cloned single-link DTBO and
> booted the board with it. I didn't see any probe_deferred errors (as seen
> previously), and the `kmsprint` utility enumerated the display details fine.
> 
> Regardless, I'd appreciate it if somebody can test it, and report back if they
> observe any issues.
> 
> Thanks,
> Aradhya
> 
> 
> Additional Notes:
> 
> * Important note about a false positive in dtbs_check *
> Both the ports, port0 and port1, are required for the OLDI functionality to
> work. The schema suggests this condition too. Additionally, the OLDI devicetree
> node is expected to be defined in the soc.dtsi file, and kept as disabled.
> Over the current platforms (Beagleplay and SK-AM625 EVM), the OLDI panel is not
> always attached, and hence we use a DT overlay to add panel details - which is
> where we enable the OLDI nodes. The structure of files is like this -
> 
> - soc.dtsi                  (OLDI disabled)
> - soc-baseboard.dts         (OLDI disabled)
> - soc-baseboard-panel.dtso  (OLDI enabled)
> 
> During dtbs_check runs, it was observed that the check was not able to rule out
> OLDI issues even when its DT was disabled in the soc-baseboard.dts. It is
> impractical and impossible to add OLDI ports prior to the panel overlay file.
> While the dtbs_check usually ignores checking disabled devicetree nodes, it was
> unable to do so in the OLDI's case.

While there might be something amiss with dtbs_check, what's the problem 
with adding both port nodes to the soc.dtsi? If you have no endpoints 
there, it's not connected to anything.

  Tomi

> 
> 
> * Important note about the authorship of patches *
> All the patches in the of this series were authored when I owned a "ti.com"
> based email id, i.e. <a-bhatia1@ti.com>. This email id is not in use anymore,
> and all the work done later has been part of my personal work. Since the
> original patches were authored using TI's email id, I have maintained the
> original authorships as they are, as well as their sign offs.
> 
> I have further added another sign off that uses my current (and personal) email
> id, the one that is being used to send this revision, i.e.
> <aradhya.bhatia@linux.dev>.
> 
> ---
> 
> Change Log:
> V4:
>    - Implement fixes suggested by Krzysztof Kozlowski:
>      - Squash patches v3:2/4 and v3:3/4 to v4:2/3, and add more hardware details
>        in commit description.
>      - Change the serial clock name for OLDI, from "s_clk" to "serial".
>      - Fix the required condition in the OLDI schema.
>      - Other minor fixes.
>    - Change "oldi-txes" OLDI DT node name to "oldi-transmitters".
>    - Update secondary-OLDI property requirements to be more relaxing for AM62P
>      DSS configuration.
> 
> V3:
>    - Fix the dt_binding_check warning in patch 3/4[5] by adding
>      "additionalProperties" constraint.
> 
> V2:
>    - Add all the R-b and A-b tags from Laurent Pinchart, Rob Herring, and
>      Tomi Valkeinen.
>    - Reword the subject for patch 1/4.
>    - Reword the commit descriptions to add proper hardware detail.
>    - Drop the change in schema reference for port@0 in patch 3/4.
>    - Lots of improvements for patch 4/4.
>      * Refactor OLDI selection logic in tidss_oldi_tx_power().
>      * Add "companion_instance" support to identify the OLDI index in
>        dual-link or cloned sinle-link modes.
>      * De-initialize tidss_oldi during tidss removal.
>      * Use dev_err_probe() instead of dev_err().
>      * Drop OLDI(n) macro.
>      * Move OLDI Config register bits to tidss_dispc_regs.h.
>      * Drop oldi bridge atomic_check().
>      * s/%d/%u for all print instances of "oldi_instance".
>      * Move OLDI init after DISPC init in tidss_probe.
>      * Use devm_drm_of_get_bridge() instead of
>        drm_of_find_panel_or_bridge() to find the next bridge and drop all
>        the drm_panel support from tidss_oldi.
> 
> Previous revisions:
> V3: https://lore.kernel.org/all/20240716084248.1393666-1-a-bhatia1@ti.com/
> V2: https://lore.kernel.org/all/20240715200953.1213284-1-a-bhatia1@ti.com/
> V1: https://lore.kernel.org/all/20240511193055.1686149-1-a-bhatia1@ti.com/
> 
> 
> [0]: Dependency Patch:
> ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> https://lore.kernel.org/all/20240622110929.3115714-11-a-bhatia1@ti.com/
> 
> [1]: AM62 OLDI Series - v7
> https://lore.kernel.org/all/20230125113529.13952-1-a-bhatia1@ti.com/
> 
> [2]: AM62 DSS Series - v9
> https://lore.kernel.org/all/20230616150900.6617-1-a-bhatia1@ti.com/
> 
> [3]: TI AM625 SoC based Beagleplay platform
> https://www.beagleboard.org/boards/beagleplay
> 
> [4]: GitHub Fork for OLDI tests
> https://github.com/aradhya07/linux-ab/tree/next_oldi_v4_tests
> 
> [5]: ("ti,am65x-dss.yaml: oldi-txes: Missing additionalProperties/
>        unevaluatedProperties constraint")
> https://lore.kernel.org/all/172107979988.1595945.9666141982402158422.robh@kernel.org/
> 
> Aradhya Bhatia (3):
>    dt-bindings: display: ti,am65x-dss: Re-indent the example
>    dt-bindings: display: ti: Add schema for AM625 OLDI Transmitter
>    drm/tidss: Add OLDI bridge support
> 
>   .../bindings/display/ti/ti,am625-oldi.yaml    | 119 ++++
>   .../bindings/display/ti/ti,am65x-dss.yaml     | 195 ++++++-
>   MAINTAINERS                                   |   1 +
>   drivers/gpu/drm/tidss/Makefile                |   3 +-
>   drivers/gpu/drm/tidss/tidss_dispc.c           |  20 +-
>   drivers/gpu/drm/tidss/tidss_dispc.h           |   4 +
>   drivers/gpu/drm/tidss/tidss_dispc_regs.h      |  14 +
>   drivers/gpu/drm/tidss/tidss_drv.c             |   9 +
>   drivers/gpu/drm/tidss/tidss_drv.h             |   5 +
>   drivers/gpu/drm/tidss/tidss_oldi.c            | 537 ++++++++++++++++++
>   drivers/gpu/drm/tidss/tidss_oldi.h            |  51 ++
>   11 files changed, 935 insertions(+), 23 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
>   create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.c
>   create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.h
> 
> 
> base-commit: cfba9f07a1d6aeca38f47f1f472cfb0ba133d341

