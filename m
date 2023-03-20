Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BBF6C0C00
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 09:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2331410E23D;
	Mon, 20 Mar 2023 08:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695EF10E23D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 08:17:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E014DCE105B;
 Mon, 20 Mar 2023 08:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA08C433D2;
 Mon, 20 Mar 2023 08:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679300225;
 bh=iZAKpv9vKw6j8ES7LbS+7gcVnQibaYrm2GKpFO8qiCM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mp4Li1+mqjOh2qGIThWxOMMCBh2CVurF0VOnG573Cpb4Y6uCl7hLqgprMs+PFIAYR
 uXBu4DVOlr/5w8mfpvflZdDSlulC7E3D4KqQIY4dAhRyXBMc7KiVJ3lern27/TKzjq
 +AGoeRvbxFIruWCOJDM82SjqAScBi71byVCU9ZQ9EFsOGNCeWhohP4Kh6CT9mgmEpv
 EGPyTwlzxcOM7hf5xGyZzkbVBiqOaLtnCRBfY1DoZ+BwNgKdrbrczRKN4XbxBEkekL
 JZvGHTPRm8YU7pOL59mUElW+PcHoHrD40uRDyJjwZJjr7Ruf+5XwC2KdnEl8sQJUSf
 0iZq6TBCV+AEw==
Date: Mon, 20 Mar 2023 08:17:00 +0000
From: Lee Jones <lee@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 02/37] drm/xlnx/zynqmp_disp: Use correct kerneldoc
 formatting in zynqmp_disp
Message-ID: <20230320081700.GH9667@google.com>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-3-lee@kernel.org>
 <20230319142432.GM10144@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230319142432.GM10144@pendragon.ideasonboard.com>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@xilinx.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 19 Mar 2023, Laurent Pinchart wrote:

> Hi Lee,
>
> Thank you for the patch.
>
> On Fri, Mar 17, 2023 at 08:16:43AM +0000, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> >
> >  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'blend' not described in 'zynqmp_disp'
> >  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'avbuf' not described in 'zynqmp_disp'
> >  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'audio' not described in 'zynqmp_disp'
> >
> > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Michal Simek <michal.simek@xilinx.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Lee Jones <lee@kernel.org>
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_disp.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > index 3b87eebddc979..63358f4898625 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > @@ -128,9 +128,9 @@ struct zynqmp_disp_layer {
> >   * struct zynqmp_disp - Display controller
> >   * @dev: Device structure
> >   * @dpsub: Display subsystem
> > - * @blend.base: Register I/O base address for the blender
> > - * @avbuf.base: Register I/O base address for the audio/video buffer manager
> > - * @audio.base: Registers I/O base address for the audio mixer
> > + * @blend: .base: Register I/O base address for the blender
> > + * @avbuf: .base: Register I/O base address for the audio/video buffer manager
> > + * @audio: .base: Registers I/O base address for the audio mixer
>
> This is a hack, it won't work properly if the nested structures get
> extended with more fields.

The original doc is a hack, for it is not recognised kerneldoc format.  :)

> Is there a correct kerneldoc syntax for this code construct ?

Not that I'm aware of.

Unless it's been added since my last round of this stuff.

> >   * @layers: Layers (planes)
> >   */
> >  struct zynqmp_disp {
>
> --
> Regards,
>
> Laurent Pinchart

--
Lee Jones [李琼斯]
