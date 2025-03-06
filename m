Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B5EA55781
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 21:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E94A10E32E;
	Thu,  6 Mar 2025 20:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q/k6vPYS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6850E10E32E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 20:34:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D2FEE5C5871;
 Thu,  6 Mar 2025 20:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261BBC4CEE0;
 Thu,  6 Mar 2025 20:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741293286;
 bh=fEVqDpO/35p9tPuJm0FDXst+QSbIafm5kupIMkvxhnQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q/k6vPYSqWwRQhS7/u2j8QqVXHeuWI04eHC5KytFd2rzRfGsd7eMdaAsMibXVP2+d
 3B1GpEA50uo8ieggb/YjUxeowxQVSFaMLIrjvxkT1k0pbYkkFOuidxM/FVO1NmbEuC
 1G82vpWUsAwohCSOW1ZzXlzzm8ihnJeMnnFQJ+DM/K84Ohw2lFJ9NnOSnXDbWp5HD9
 gw2sCUt9p6GcIeBs401NZqj0Hd9nZpa/HKyP3ymDlmw3O/GgzaYqBquk1BOKoyH4WT
 eY1n2Dduk1IQrA0FRVSpwI2rJKVYDvXNgVDpxm11dQtlaa2UXA7NbWf4U2QxcqPAWv
 BEYm9LTCCQQBw==
Date: Thu, 6 Mar 2025 14:34:44 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH 3/5] dt-bindings: display: simple-bridge: Document DPI
 color encoder
Message-ID: <20250306203444.GA570402-robh@kernel.org>
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-4-victor.liu@nxp.com>
 <20250304152320.GA2630063-robh@kernel.org>
 <1891036.atdPhlSkOF@steina-w>
 <20250305163805.GA2071011-robh@kernel.org>
 <7d98163d-10c8-457d-92e7-6a1d6e379beb@nxp.com>
 <20250306-kangaroo-of-pastoral-typhoon-8aefb2@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306-kangaroo-of-pastoral-typhoon-8aefb2@houat>
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

On Thu, Mar 06, 2025 at 12:35:49PM +0100, Maxime Ripard wrote:
> On Thu, Mar 06, 2025 at 03:02:41PM +0800, Liu Ying wrote:
> > On 03/06/2025, Rob Herring wrote:
> > > On Wed, Mar 05, 2025 at 10:35:26AM +0100, Alexander Stein wrote:
> > >> Hi,
> > >>
> > >> Am Dienstag, 4. März 2025, 16:23:20 CET schrieb Rob Herring:
> > >>> On Tue, Mar 04, 2025 at 06:15:28PM +0800, Liu Ying wrote:
> > >>>> A DPI color encoder, as a simple display bridge, converts input DPI color
> > >>>> coding to output DPI color coding, like Adafruit Kippah DPI hat[1] which
> > >>>> converts input 18-bit pixel data to 24-bit pixel data(with 2 low padding
> > >>>> bits in every color component though). Document the DPI color encoder.
> > >>>
> > >>> Why do we need a node for this? Isn't this just wired how it is wired 
> > >>> and there's nothing for s/w to see or do? I suppose if you are trying to 
> > >>> resolve the mode with 24-bit on one end and 18-bit on the other end, you 
> > >>> need to allow that and not require an exact match. You still might need 
> > >>> to figure out which pins the 18-bit data comes out on, but you have that 
> > >>> problem with an 18-bit panel too. IOW, how is this any different if you 
> > >>> have an 18-bit panel versus 24-bit panel?
> > >>
> > >> Especially panel-simple.c has a fixed configuration for each display, such as:
> > >>> .bus_format = MEDIA_BUS_FMT_RGB666_1X18
> > >>
> > >> How would you allow or even know it should be addressed as
> > >> MEDIA_BUS_FMT_RGB888_1X24 instead? I see different ways:
> > >> 1. Create a new display setting/compatible
> > >> 2. Add an overwrite property to the displays
> > >> 3. Use a (transparent) bridge (this series)
> > >>
> > >> Number 1 is IMHO out of question. 
> > > 
> > > Agreed.
> > > 
> > >> I personally don't like number 2 as this
> > >> feels like adding quirks to displays, which they don't have.
> > > 
> > > This is what I would do except apply it to the controller side. We know 
> > > the panel side already. This is a board variation, so a property makes 
> > > sense. I don't think you need any more than knowing what's on each end. 
> > 
> > With option 2, no matter putting a property in source side or sink side,
> > impacted display drivers and DT bindings need to be changed, once a board
> > manipulates the DPI color coding.  This adds burdens and introduces new
> > versions of those DT bindings.  Is this what we want?
> 
> There's an option 4: make it a property of the OF graph endpoints. In
> essence, it's similar to properties that are already there like
> lane-mapping, and it wouldn't affect the panel drivers, or create an
> intermediate bridge.

Yes, that's actually where I meant to put the property(ies).

Rob
