Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE96513C0AA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EFF6E93D;
	Wed, 15 Jan 2020 12:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A202D6E93D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:23:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id EEAE320366;
 Wed, 15 Jan 2020 13:22:54 +0100 (CET)
Date: Wed, 15 Jan 2020 13:22:53 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v6 4/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
Message-ID: <20200115122253.GA22854@ravnborg.org>
References: <cover.1579086894.git.jsarha@ti.com>
 <66c57bb30685920f040933ada9ccd4f5035d099f.1579086894.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66c57bb30685920f040933ada9ccd4f5035d099f.1579086894.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=WVcRL-gX3Aqz7jTcpKoA:9 a=_aDu49ajq4D_GkOu:21 a=UD8rQldCOfFGNFSc:21
 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, sjakhade@cadence.com, maxime@cerno.tech
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jyri.

On Wed, Jan 15, 2020 at 01:45:38PM +0200, Jyri Sarha wrote:
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
...
> v6: - Check CTM and gamma support from dispc_features when creating crtc
>     - Implement CTM support for k2g and fix k3 CTM implementation
>     - Remove gamma property persistence and always write color properties
>       in a new modeset

I applied this, just to throw this throgh my build setup.

checkpatch reported:
total: 0 errors, 45 warnings, 46 checks, 4920 lines checked

- space after cast
- CamelCase
- Macro argument
- length warnings
- alignment

I would ignore the line length warnings for the coefficients, but fix the
rest.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
