Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7646E5BA4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121C110E6CD;
	Tue, 18 Apr 2023 08:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D6910E6CD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:09:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 967E6802;
 Tue, 18 Apr 2023 10:09:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1681805350;
 bh=NuC002o01Die+SqNlcXkQatYTWFiikr0m8g660PcWhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fp6/1bosVgjbWXfJW+Rn8RnCehyQAXPszKmTtpnuCHdzOdhbEZatqNfhtgofoSCzu
 oGQWLf7+VpSRdNuL68fkrhFjaloPbB+WVjXxFCr2vhqHXRpegITiDIfLiJuJ2p5BQ0
 l+fOvytPYrXpmZ4GwSxjQCQx+NFj0wTKTvkWIQEo=
Date: Tue, 18 Apr 2023 11:09:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/5] drm: shmobile: Fixes and enhancements
Message-ID: <20230418080928.GA30837@pendragon.ideasonboard.com>
References: <cover.1681734821.git.geert+renesas@glider.be>
 <20230418075000.GF4703@pendragon.ideasonboard.com>
 <CAMuHMdUqKCokNc-phYFoGKa0vFwCMDdy7RZ-kn6F8yqkvtfkfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUqKCokNc-phYFoGKa0vFwCMDdy7RZ-kn6F8yqkvtfkfA@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Tue, Apr 18, 2023 at 10:00:35AM +0200, Geert Uytterhoeven wrote:
> On Tue, Apr 18, 2023 at 9:49 AM Laurent Pinchart wrote:
> > On Mon, Apr 17, 2023 at 03:40:20PM +0200, Geert Uytterhoeven wrote:
> > > Currently, there are two drivers for the LCD controller on Renesas
> > > SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
> > >   1. sh_mobile_lcdcfb, using the fbdev framework,
> > >   2. shmob_drm, using the DRM framework.
> > > However, only the former driver can be used, as all platform support
> > > integrates the former.  None of these drivers support DT-based systems.
> > >
> > > This patch series is a first step to enable the SH-Mobile DRM driver for
> > > Renesas ARM-based SH-Mobile and R-Mobile SoCs.  The next step planned is
> > > to add DT support.
> > >
> > > Changes compared to v1:
> > >   - Add Reviewed-by,
> > >   - Drop dependency on ARM.
> > >
> > > This has been tested on the R-Mobile A1-based Atmark Techno
> > > Armadillo-800-EVA development board, using a temporary
> > > platform-enablement patch[1].
> > >
> > > Thanks for applying to drm-misc!
> >
> > Would you like to request drm-misc committer rights ? :-)
> 
> Don't the listed maintainers for drivers/gpu/drm/shmobile/ don't
> have such access already?

Actually, as you're taking over maintenance for this driver, would you
send a patch to update MAINTAINERS ?

-- 
Regards,

Laurent Pinchart
