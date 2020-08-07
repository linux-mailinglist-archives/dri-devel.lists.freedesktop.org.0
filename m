Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117D223EAE6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 11:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73A86E9AE;
	Fri,  7 Aug 2020 09:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 656 seconds by postgrey-1.36 at gabe;
 Fri, 07 Aug 2020 09:50:05 UTC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D98E6E9AE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 09:50:04 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0779cwpV020790;
 Fri, 7 Aug 2020 04:38:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1596793138;
 bh=Ci3SQG5GuTu5PfVgX5SPec+hpQmMwKCLgIR+XPhEscc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=V7I86E3He3ICPEnFPJ60kxm8G0x6UY3g4dV1pFfZT51+oR2f1A/swiZ93BNqbwKyN
 wkx2F34f/8JctQbFLF/aANYv6pI+5ECOKkAoxl+djwGg+Poo2BRYurSDgRrxJ1RttI
 gPj0WrXko5rYJXKT6nBt5GeF2mi3XqNd8O5CV3Kc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0779cweJ084121;
 Fri, 7 Aug 2020 04:38:58 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 7 Aug
 2020 04:38:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 7 Aug 2020 04:38:58 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0779csxd102220;
 Fri, 7 Aug 2020 04:38:55 -0500
Subject: Re: [PATCH v8 2/3] drm: bridge: Add support for Cadence MHDP DPI/DP
 bridge
To: Swapnil Jakhade <sjakhade@cadence.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
 <1596713672-8146-3-git-send-email-sjakhade@cadence.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0fe8e670-c9eb-729c-f013-28c53bd65abd@ti.com>
Date: Fri, 7 Aug 2020 12:38:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596713672-8146-3-git-send-email-sjakhade@cadence.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: praneeth@ti.com, mparab@cadence.com, nsekhar@ti.com, jsarha@ti.com,
 yamonkar@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Swapnil,

On 06/08/2020 14:34, Swapnil Jakhade wrote:
> Add a new DRM bridge driver for Cadence MHDP DPTX IP used in TI J721e SoC.
> MHDP DPTX IP is the component that complies with VESA DisplayPort (DP) and
> embedded Display Port (eDP) standards. It integrates uCPU running the
> embedded Firmware (FW) interfaced over APB interface.
> 
> Basically, it takes a DPI stream as input and outputs it encoded in DP
> format. Currently, it supports only SST mode.
> 
> Co-developed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Co-developed-by: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> ---

<snip>

> +	mhdp_state = to_cdns_mhdp_bridge_state(new_state);
> +
> +	mhdp_state->current_mode = drm_mode_duplicate(bridge->dev, mode);
> +	drm_mode_set_name(mhdp_state->current_mode);
> +

current_mode is never freed, so this leaks memory.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
