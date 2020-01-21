Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1A01439A6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 10:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07F26EC1A;
	Tue, 21 Jan 2020 09:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D52F6EC1A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 09:39:31 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00L9dR66062753;
 Tue, 21 Jan 2020 03:39:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1579599567;
 bh=JCpIWpKZmeZ+Ms921F9R3mQuzoHIAVicFLQDZsZzNhE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Rrg59eJV5PuvreL+/N0kkFvZN7EHJCCZNfiXRFMjJk/CJLOb3gDPsc0ZbzDAveb1s
 5CThyPJu53v+wBLTd2X4FfsJfyZt1P5knAjxGl5zDplHPNMHAX9KgM4vr2yx2NekcV
 3YUYP7qDHUQjw1iUkR9zWZ1iHgO9u36EVcksCM6Y=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00L9dRg3035119
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Jan 2020 03:39:27 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Jan 2020 03:39:26 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Jan 2020 03:39:26 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00L9dNBu024317;
 Tue, 21 Jan 2020 03:39:24 -0600
Subject: Re: [PATCH v8 4/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
To: Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>
References: <cover.1579553817.git.jsarha@ti.com>
 <96c8aa362a426a64086da92cb3b486c6cdce3e7f.1579553817.git.jsarha@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a54d264d-ea83-3fb7-399d-58e84ed20058@ti.com>
Date: Tue, 21 Jan 2020 11:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <96c8aa362a426a64086da92cb3b486c6cdce3e7f.1579553817.git.jsarha@ti.com>
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
Cc: yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com,
 peter.ujfalusi@ti.com, laurent.pinchart@ideasonboard.com, subhajit_paul@ti.com,
 sam@ravnborg.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2020 23:02, Jyri Sarha wrote:
> This patch adds a new DRM driver for Texas Instruments DSS IPs used on
> Texas Instruments Keystone K2G, AM65x, and J721e SoCs. The new DSS IP is
> a major change to the older DSS IP versions, which are supported by
> the omapdrm driver. While on higher level the Keystone DSS resembles
> the older DSS versions, the registers are completely different and the
> internal pipelines differ a lot.
> 
> DSS IP found on K2G is an "ultra-light" version, and has only a single
> plane and a single output. The K3 DSS IPs are found on AM65x and J721E
> SoCs. AM65x DSS has two video ports, one full video plane, and another
> "lite" plane without scaling support. J721E has 4 video ports, 2 video
> planes and 2 lite planes. AM65x DSS has also an integrated OLDI (LVDS)
> output.
> 
> Version history:
> 
> v2: - rebased on top of drm-next-2019-11-27
>      - sort all include lines in all files
>      - remove all include <drm/drmP.h>
>      - remove select "select VIDEOMODE_HELPERS"
>      - call dispc_vp_setup() later in tidss_crtc_atomic_flush() (there is no
>        to call it in new modeset case as it is also called in vp_enable())
>      - change probe sequence and drm_device allocation (follow example in
>        drm_drv.c)
>      - use __maybe_unused instead of #ifdef for pm functions
>      - remove "struct drm_fbdev_cma *fbdev;" from driver data
>      - check panel connector type before connecting it
> 
> v3: no change
> 
> v4: no change
> 
> v5: - remove fifo underflow irq handling, it is not an error and
>        it should be used for debug purposes only
>      - memory tuning, prefetch plane fifo up to high-threshold value to
>        minimize possibility of underflows.
> 
> v6: - Check CTM and gamma support from dispc_features when creating crtc
>      - Implement CTM support for k2g and fix k3 CTM implementation
>      - Remove gamma property persistence and always write color properties
>        in a new modeset
> 
> v7: - Fix checkpatch.pl --strict issues
>      - Rebase on top of drm-misc-next-2020-01-10
> 
> v8: - Remove idle debug prints from dispc_init()
>      - Add Reviewed-by: Benoit Parrot <bparrot@ti.com>
> 
> Co-developed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Benoit Parrot <bparrot@ti.com>

You can add my SoB too:

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
