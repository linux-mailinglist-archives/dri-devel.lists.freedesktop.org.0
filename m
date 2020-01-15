Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3DA13C65C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 15:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4300A6EAC5;
	Wed, 15 Jan 2020 14:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BDF6EAC5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 14:43:14 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1ECBB2002F;
 Wed, 15 Jan 2020 15:43:10 +0100 (CET)
Date: Wed, 15 Jan 2020 15:43:09 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v6 4/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
Message-ID: <20200115144309.GA20850@ravnborg.org>
References: <cover.1579086894.git.jsarha@ti.com>
 <66c57bb30685920f040933ada9ccd4f5035d099f.1579086894.git.jsarha@ti.com>
 <20200115122253.GA22854@ravnborg.org>
 <848720ca-6062-8314-e874-3a36f8aee1da@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <848720ca-6062-8314-e874-3a36f8aee1da@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=DS-CZ__rylYsUGF3V18A:9 a=AQiqg4VX56o5Sd8s:21 a=xfkTRcJW48Ixwwvu:21
 a=CjuIK1q_8ugA:10 a=1BnFAEYpt1gA:10 a=Vxmtnl_E_bksehYqCbjh:22
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

> >>
> > ...
> >> v6: - Check CTM and gamma support from dispc_features when creating crtc
> >>     - Implement CTM support for k2g and fix k3 CTM implementation
> >>     - Remove gamma property persistence and always write color properties
> >>       in a new modeset
> > 
> > I applied this, just to throw this throgh my build setup.
> > 
> > checkpatch reported:
> > total: 0 errors, 45 warnings, 46 checks, 4920 lines checked
> > 
> > - space after cast
> > - CamelCase
> > - Macro argument
> > - length warnings
> > - alignment
> > 
> > I would ignore the line length warnings for the coefficients, but fix the
> > rest.
> > 
> 
> You are using --subjective, or are there new warnings turned on since I
> rebased?
This was the warnigns that appearted when I did
cat patches | dim apply

So the defaults in dim was used - which is:
-q --emacs --strict --show-types

As dim is the tool used when applying patches to drm-misc-next then
whoever ends up applying the patches will see the same warnigns from
checkpatch.

You can find more info on dim here:
https://drm.pages.freedesktop.org/maintainer-tools/dim.html

As maintainer of this driver you will need to learn the basics.

My dim vocabulary are:
dim apply
dim fixes
dim push
dim update-branches
dim checkpatch

dim can do much more, but this is the ones that I use most.
In your case you would like to use "dim checkpatch HEAD~5"

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
