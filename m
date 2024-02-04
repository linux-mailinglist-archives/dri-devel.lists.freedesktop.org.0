Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B353848C9B
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 10:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097E9112124;
	Sun,  4 Feb 2024 09:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rKIYI/sM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A270A112124
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 09:56:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [109.128.141.99])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D3176F2;
 Sun,  4 Feb 2024 10:54:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707040496;
 bh=bLEtq/aD7sTN15wBQSJLh78FButN/RwMUxQsJv0VAhA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rKIYI/sM/4cVrqaY/OAGrW+iB09FiUc2vW7vBygJHgJ2hN9M67DWj3A35RJ1eMqKa
 QMbT5wsHSNb1f7uie5JbGkh8uAb4FjrEY0TmInHoHzWbgWAEF6BNX/INiv5o1sJ62L
 MERnsPYgjuCvB74aHpPhqxwW20FjGXvCZIkw9A1Q=
Date: Sun, 4 Feb 2024 11:56:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Simek, Michal" <michal.simek@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: RE: Re: [PATCH 0/4] Fixing live video input in ZynqMP DPSUB
Message-ID: <20240204095618.GJ3094@pendragon.ideasonboard.com>
References: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
 <6jhwss2wego6yoo5mwmphwawhsj5bbj62gwrzcpapoixwkrkli@g4fbxdooopby>
 <20240117142343.GD17920@pendragon.ideasonboard.com>
 <u5mngxudtdgy3vqkfbpgqng6tdahijnet2jtj345hrowbt47ce@t3e7hul45mr3>
 <MW4PR12MB7165D35189BEECA8769552AFE6792@MW4PR12MB7165.namprd12.prod.outlook.com>
 <2ytxhpti53e743b5pca3oa5jmscffi4vpsyeh727bcoh4v6cuw@zkz5pqkcv7v2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2ytxhpti53e743b5pca3oa5jmscffi4vpsyeh727bcoh4v6cuw@zkz5pqkcv7v2>
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

On Thu, Feb 01, 2024 at 06:01:01PM +0100, Maxime Ripard wrote:
> On Fri, Jan 26, 2024 at 11:18:30PM +0000, Klymenko, Anatoliy wrote:
> > On Friday, January 26, 2024 4:26 AM, Maxime Ripard wrote:
> > > On Wed, Jan 17, 2024 at 04:23:43PM +0200, Laurent Pinchart wrote:
> > > > On Mon, Jan 15, 2024 at 09:28:39AM +0100, Maxime Ripard wrote:
> > > > > On Fri, Jan 12, 2024 at 03:42:18PM -0800, Anatoliy Klymenko wrote:
> > > > > > Patches 1/4,2/4,3/4 are minor fixes.
> > > > > >
> > > > > > DPSUB requires input live video format to be configured.
> > > > > > Patch 4/4: The DP Subsystem requires the input live video format to be
> > > > > > configured. In this patch we are assuming that the CRTC's bus format is fixed
> > > > > > and comes from the device tree. This is a proposed solution, as there are no api
> > > > > > to query CRTC output bus format.
> > > > > >
> > > > > > Is this a good approach to go with?
> > > > >
> > > > > I guess you would need to expand a bit on what "live video input" is? Is
> > > > > it some kind of mechanism to bypass memory and take your pixels straight
> > > > > from a FIFO from another device, or something else?
> > > >
> > > > Yes and no.
> > > >
> > > > The DPSUB integrates DMA engines, a blending engine (two planes), and a
> > > > DP encoder. The dpsub driver supports all of this, and creates a DRM
> > > > device. The DP encoder hardware always takes its input data from the
> > > > output of the blending engine.
> > > >
> > > > The blending engine can optionally take input data from a bus connected
> > > > to the FPGA fabric, instead of taking it from the DPSUB internal DMA
> > > > engines. When operating in that mode, the dpsub driver exposes the DP
> > > > encoder as a bridge, and internally programs the blending engine to
> > > > disable blending. Typically, the FPGA fabric will then contain a CRTC of
> > > > some sort, with a driver that will acquire the DP encoder bridge as
> > > > usually done.
> > > >
> > > > In this mode of operation, it is typical for the IP cores in FPGA fabric
> > > > to be synthesized with a fixed format (as that saves resources), while
> > > > the DPSUB supports multiple input formats.
> > > 
> > > Where is that CRTC driver? It's not clear to me why the format would
> > > need to be in the device tree at all. Format negociation between the
> > > CRTC and whatever comes next is already done in a number of drivers so
> > > it would be useful to have that kind of API outside of the bridge
> > > support.
> >
> > One example of such CRTC driver:
> > https://github.com/Xilinx/linux-xlnx/blob/master/drivers/gpu/drm/xlnx/xlnx_mixer.c It's not
> > upstreamed yet. Bus format negotiations here are handled by utilizing Xilinx-specific bridge
> > framework. Ideally, it would be nice to rework this to comply with the upstream DRM bridge
> > framework.
> >
> > > > Bridge drivers in the upstream kernel work the other way around, with
> > > > the bridge hardware supporting a limited set of formats, and the CRTC
> > > > then being programmed with whatever the bridges chain needs. Here, the
> > > > negotiation needs to go the other way around, as the CRTC is the
> > > > limiting factor, not the bridge.
> > > 
> > > Sounds like there's something to rework in the API then?
> > > 
> > Adding an optional CRTC callback imposing CRTC specific bus format restrictions, which may be
> > called from here https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/drm_bridge.c#L935
> > would solve the problem.
> 
> CRTCs and bridges are orthogonal. If anything, I'd expect that callback
> to be set at the CRTC, encoder and connector levels and filled by the
> drm_bridge code if relevant.

I'm thinking about a new CRTC operation that would be called by the
bridge chain format negotiation helper
drm_atomic_bridge_chain_select_bus_fmts() (or one of the functions it
calls), to filter the list of formats supported by the chain based on
what the CRTC supports, or possibly to pick a format in that list. This
needs to be prototyped

-- 
Regards,

Laurent Pinchart
