Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4458AE9A4E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 11:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430A410E848;
	Thu, 26 Jun 2025 09:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WD+Wu4IS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7B510E848
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 09:40:38 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CE7D6AE;
 Thu, 26 Jun 2025 11:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750930816;
 bh=hwH19nwvwO6slOQgDApnai5TTXnX5OAFjCQVpybxW8w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WD+Wu4ISKsK05FUl604Ur1YX1jsTrOEUhKNHBMWuluw6wmDeWguxQvx3GT4ArRdX5
 QNiD+AxcJKWDXMa4x9s152jkLy+ujZsKuzUH2Z8vbErBImrO+epL9kRBSexrf9eFCA
 5ZDYtSRRyHYEzY+u51v8Eeqwpa0rc3r8DkfBj+G8=
Message-ID: <465b2e73-d1b6-4ef5-8afc-375a01329aaa@ideasonboard.com>
Date: Thu, 26 Jun 2025 12:40:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] drm/tidss: Add OLDI bridge support
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Michael Walle <mwalle@kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>
References: <20250528122544.817829-1-aradhya.bhatia@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250528122544.817829-1-aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset=UTF-8
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

On 28/05/2025 15:25, Aradhya Bhatia wrote:
> Hello all,
> 
> This patch series adds support for the dual OLDI TXes supported in Texas
> Instruments' AM62x and AM62Px family of SoCs. The OLDI TX hardware supports
> single-lvds, lvds-clone, and dual-lvds modes. These TXes have now been
> represented through DRM bridges within TI-DSS.
> 
> * Some history and hardware description for this patch series *
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
>    single-link OLDI video signals.
> 3. The drivers also need to support the case where 2 OLDI TXes are connected to
>    2 different VPs - thereby creating 2 independent streams of single-link OLDI
>    outputs.
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
> 
> * Regarding the Dependency Patches *
> Since the OLDI TXes have a hardware dependency with the parent VP(s), the OLDI
> configuration needs to happen before that VP is enabled for streaming. VP stream
> enable takes place in tidss_crtc_atomic_enable hook. I have posted patches[0]
> allowing DRM bridges to get pre-enabled before the CRTC of that bridge is
> enabled. Without those patches, some warnings or glitches may be observed.
> 
> 
> * Regarding the Drop of Clone Mode support *
> Another key point to note is that the support for clone mode has been dropped
> from the tidss OLDI driver, from v5 onwards. If the DT is configured for a clone
> mode, the driver will report an error and exit. This has been done because the
> driver was not supporting a specific case of clone mode where 2 OLDI sink
> bridges connected to the 2 OLDI TXes require active programming (unlike the
> simple-panels which do not). The driver does not support creation of two
> encoder-bridge pipelines (along with the parent tidss driver) to allow program
> any subsequent bridges (OLDI sinks and bridges thereafter).
> The code fragments that write the OLDI config to enable clone mode have been
> kept as they are, for future, but the driver will not continue to probe if it
> detects a clone mode configuration, for the time being.
> This drop of clone mode support can be undone by applying this _soft-tested_
> patch[6] on top of this series. This patch will revert the driver to previous
> revisions and will allow OLDI sinks that don't require active programming (for
> example: simple-panels) to work with the driver. Note that this isn't the ideal
> way to run clone mode, but it just works for any bridge pipeline after OLDT TX
> that does not require additional configuration after the OLDI (for example: a
> couple of simple lvds panels connected directly to the OLDI TXes in clone mode).
> 
> 
> These patches have been tested on AM625 based Beagleplay[3] platform with a
> Lincolntech LCD185 dual-lvds panel. The patches with complete support including
> the expected devicetree configuration of the OLDI TXes can be found in the
> "next_oldi-v9_1_tests" branch of my github fork[4]. This branch also has support
> for Microtips dual-lvds panel (SK-LCD1) which is compatible with the SK-AM625
> EVM platform.
> 
> I'd appreciate it if somebody can test it, and report back if they observe any
> issues.
> 
> Thanks,
> Aradhya
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

Thanks! I will pick these up to drm-misc-next.

 Tomi

