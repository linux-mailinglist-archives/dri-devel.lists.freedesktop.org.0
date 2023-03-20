Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C936C2581
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 00:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B445610E351;
	Mon, 20 Mar 2023 23:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960A110E340
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 23:15:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EF57496;
 Tue, 21 Mar 2023 00:15:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1679354145;
 bh=XRjK9CJ6isf0mjfxxYy6mzpEELiXCoJXO5EhXcXwDqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=syUE2xgQCJgs0AEsXUDlyukkStaQk7axNoMUFhqyf9+DhmNLysUyVzdwdMmkCKGoq
 APGQFPPTs9EU2o3x0oJTW9pKOmAMvbzA68346SX9AKbOZEC5NKf8e7iCx6KcMxCTE7
 FbQVK0/Bsjqk9IXEqRpINvm7CB1K/gJTRRGkjcHA=
Date: Tue, 21 Mar 2023 01:15:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 02/37] drm/xlnx/zynqmp_disp: Use correct kerneldoc
 formatting in zynqmp_disp
Message-ID: <20230320231551.GQ20234@pendragon.ideasonboard.com>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-3-lee@kernel.org>
 <20230319142432.GM10144@pendragon.ideasonboard.com>
 <20230320081700.GH9667@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230320081700.GH9667@google.com>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Simek <michal.simek@xilinx.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee,

(CC'ing Jon and Mauro)

On Mon, Mar 20, 2023 at 08:17:00AM +0000, Lee Jones wrote:
> On Sun, 19 Mar 2023, Laurent Pinchart wrote:
> > Thank you for the patch.
> >
> > On Fri, Mar 17, 2023 at 08:16:43AM +0000, Lee Jones wrote:
> > > Fixes the following W=1 kernel build warning(s):
> > >
> > >  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'blend' not described in 'zynqmp_disp'
> > >  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'avbuf' not described in 'zynqmp_disp'
> > >  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'audio' not described in 'zynqmp_disp'
> > >
> > > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Michal Simek <michal.simek@xilinx.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Signed-off-by: Lee Jones <lee@kernel.org>
> > > ---
> > >  drivers/gpu/drm/xlnx/zynqmp_disp.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > index 3b87eebddc979..63358f4898625 100644
> > > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > @@ -128,9 +128,9 @@ struct zynqmp_disp_layer {
> > >   * struct zynqmp_disp - Display controller
> > >   * @dev: Device structure
> > >   * @dpsub: Display subsystem
> > > - * @blend.base: Register I/O base address for the blender
> > > - * @avbuf.base: Register I/O base address for the audio/video buffer manager
> > > - * @audio.base: Registers I/O base address for the audio mixer
> > > + * @blend: .base: Register I/O base address for the blender
> > > + * @avbuf: .base: Register I/O base address for the audio/video buffer manager
> > > + * @audio: .base: Registers I/O base address for the audio mixer
> >
> > This is a hack, it won't work properly if the nested structures get
> > extended with more fields.
> 
> The original doc is a hack, for it is not recognised kerneldoc format.  :)

I'll claim it's a bug, not a hack :-D

> > Is there a correct kerneldoc syntax for this code construct ?
> 
> Not that I'm aware of.
> 
> Unless it's been added since my last round of this stuff.

I haven't seen anything either. I tried moving the documentation inline,
and the scripts/kernel-doc script ignores the comment blocks for the
inner fields.

Mauro, Jon, is this a known issue ? If so, are there plans to fix it ?
What's the recommended way to proceed here ?

> > >   * @layers: Layers (planes)
> > >   */
> > >  struct zynqmp_disp {

-- 
Regards,

Laurent Pinchart
