Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F3E734DBC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 10:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F3010E1B3;
	Mon, 19 Jun 2023 08:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4322F10E1B3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 08:32:05 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37A9A547;
 Mon, 19 Jun 2023 10:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687163490;
 bh=iTBmgvKkm/RP71iegbPwrVucLcjIHJ7plxMSPCw6Oc0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=glwrKMUxVkqwUz9nEFWGj2T80a1Nvk35ivf6ESWzFTV80mALHg32mrqOsX0OHUfJI
 0JzSGTjDS/IfNG9jAtaHje1/xD713o0LNc9w66Bvko18xFBtXqGa4zRuwyU6t4aBAL
 2pU790FLQgq7aru38ImrjZSG5qod94QbDxZqlLrE=
Message-ID: <ac326ebe-4d99-e73d-27bf-c21b532f3c4b@ideasonboard.com>
Date: Mon, 19 Jun 2023 11:31:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v9 0/2] Add DSS support for AM625 SoC
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230616150900.6617-1-a-bhatia1@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230616150900.6617-1-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2023 18:08, Aradhya Bhatia wrote:
> This patch series adds a new compatible for the Display SubSystem (DSS)
> controller on TI's AM625 SoC. It further adds the required support for
> the same in the tidss driver.
> 
> The AM625-DSS is a newer version of the DSS from the AM65X version with
> the major change being the addition of another OLDI TX. With the help of
> 2 OLDI TXes, the AM625 DSS can support dual-linked OLDI displays with a
> resolution of up-to 2K or WUXGA (1920x1200@60fps) at half the OLDI clock
> frequency or even cloned video outputs on each of the TXes.
> 
> This patch series acts as a continuation of the patches posted in v3[1].
> The OLDI support patches combined from v5 onwards are now separated
> again. The OLDI support will be added subsequently with a separte patch
> series.
> 
> I have tested these patches on AM625 SK-EVM and AM625 based Beagle Play.
> To test this series on AM625 based platforms, basic display support
> patches (for driver + devicetree) can be found in the
> "next_am62-base_support-V2" branch on my github fork[2].

Looks good to me. I'll pick these up to drm-misc.

  Tomi

> 
> [1]: V3: https://patchwork.freedesktop.org/series/105373/
> [2]: https://github.com/aradhya07/linux-ab/tree/next_am62-base_support-V2
> 
> Previous versions:
> - V8: https://patchwork.freedesktop.org/series/119088/
> - V7: https://patchwork.freedesktop.org/series/113328/
> - V6: https://patchwork.freedesktop.org/series/111106/
> - V5: https://patchwork.freedesktop.org/series/109194/
> 
> Changelog:
> V9:
>    - Edit the commit message for Patch 2/2.
>    - Add Krzysztof Kozlowski's and Tomi Valkeinen's tags.
> 
> V8:
>    - Rebase for current merge window.
>    - Drop all the OLDI support patches.
>    - Update the binding to remove the 2nd OLDI port instances.
>    - Drop the Reviewed-by tags of Krzysztof Kozlowski and Rahul T R
>      because of the changes.
> 
> V7:
>    - Rebase to current linux-next.
>    - Address Tomi Valkeinen's comments.
>      1. Separate the DSS VP and output port coupling.
>         v6 introduced 'output_port_bus_type' in addition to 'vp_bus_type'
>         but having both of the variables was redundant. Hence, in v7
>         the 'output_port_bus_type' essentially replaces 'vp_bus_type'.
>      2. Break Patch v6 2/5 into 2 separate patches (v7 1/6 and v7 3/6).
>      3. Change in name and addition of OLDI mode macros.
>      4. Other minor changes.
> 
> V6:
>    - Rebase for current merge window.
>    - Add 'allOf:' condition in the DT binding.
>    - Address Tomi Valkeinen's comments.
>      1. Combine DT binding patches for new compatible and 3rd DSS port.
>      2. Further separate DSS VPs and output ports.
>      3. Separate OLDI mode discovery logic from the panel/bridge
>         discovery (which allowed support for OLDI bridges as well.)
>      4. Organize OLDI IO control register macros platform wise.
> 
> V5:
>    - Rebase for current merge window.
>    - Add max DT ports in DSS features.
>    - Combine the OLDI support series.
> 
> (Changes from OLDI support series v1)
>    - Address Tomi Valkeinen's comments.
>      1. Update the OLDI link detection approach.
>      2. Add port #3 for 2nd OLDI TX.
>      3. Configure 2 panel-bridges for cloned panels.
>      4. Drop the OLDI clock set patch.
>      5. Drop rgb565-to-888 patch.
> 
> V3:
>    - Change yaml enum in alphabetical order.
>    - Correct a typo.
> 
> V2:
>    - Remove redundant register array.
> 
> Aradhya Bhatia (2):
>    dt-bindings: display: ti,am65x-dss: Add am625 dss compatible
>    drm/tidss: Add support for AM625 DSS
> 
>   .../bindings/display/ti/ti,am65x-dss.yaml     | 18 ++++--
>   drivers/gpu/drm/tidss/tidss_dispc.c           | 57 ++++++++++++++++++-
>   drivers/gpu/drm/tidss/tidss_dispc.h           |  2 +
>   drivers/gpu/drm/tidss/tidss_drv.c             |  1 +
>   4 files changed, 71 insertions(+), 7 deletions(-)
> 

