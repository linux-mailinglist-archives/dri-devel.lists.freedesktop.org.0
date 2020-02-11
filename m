Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73FC15A333
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F846E9B3;
	Wed, 12 Feb 2020 08:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 004496E4FE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 16:05:28 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 2E6E680D4;
 Tue, 11 Feb 2020 16:06:11 +0000 (UTC)
Date: Tue, 11 Feb 2020 08:05:24 -0800
From: Tony Lindgren <tony@atomide.com>
To: Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
Message-ID: <20200211160524.GE64767@atomide.com>
References: <20191114093950.4101-3-tomi.valkeinen@ti.com>
 <20191202130459.GH4929@pendragon.ideasonboard.com>
 <20191211165331.GC43123@atomide.com>
 <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
 <20191212203550.GB4892@pendragon.ideasonboard.com>
 <add3d8af-6977-68e6-fb77-2fa748c4714a@ti.com>
 <b39e52f1-3e73-5f26-6206-0956cf482631@ti.com>
 <20200211110712.GB28355@pendragon.ideasonboard.com>
 <3b4d10c6-7cb2-af53-3a39-31eef441bfdd@ti.com>
 <98da360f-880b-af56-b285-4d9b39f8a342@wizzup.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98da360f-880b-af56-b285-4d9b39f8a342@wizzup.org>
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Cc: devicetree@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Merlijn Wajer <merlijn@wizzup.org> [200211 12:54]:
> Hi,
> 
> On 11/02/2020 12:08, Tomi Valkeinen wrote:
> > On 11/02/2020 13:07, Laurent Pinchart wrote:
> > 
> >>> Hopefully soon (in five years? =) we can say that omapdrm supports all
> >>> the boards, and we can deprecate omapfb.
> >>
> >> I'd love to send a patch to remove omapfb, but I'll let you do the
> >> honours :-)
> > 
> > Not before we add DSI support to omapdrm...

Hmm do your mean RFBI? The DSI support we already have :)

> This is probably known, but for devices that would like use PowerVR SGX,
> there sometimes is only userspace available that works with omap(l)fb,
> and not with DRM. The Nokia N900 is such an example.
> 
> There might be a newer release of (closed) userspace coming for the
> aging device(s), but as it stands, I don't think it's possible to do 3D
> with PowerVR SGX on omapdrm currently.
> 
> But I might be wrong...

Yes SGX is a bottleneck currently for omap3 users. And I think
RFBI is blocking n8x0 from moving to omapdrm and finally leaving
drivers/video/fbdev/omap2 behind.

With those blockers fixed, I'd also be happy to just get rid of
drivers/video/fbdev/omap2 as there should be no reason to
keep using it.

Regards,

Tony


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
