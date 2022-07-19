Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 720AA5794A0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 09:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74CE11326A;
	Tue, 19 Jul 2022 07:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AFD11325A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 07:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=RuSrJlegEwSOSCPkuaUGz0F0qjumKjebhldkR5cmk2s=;
 b=HuiNwxviV7raCwwWfJMWrxbvEH3trtPUeRDd2NwItBjQ2gwcl6yP2BwVMzF11WG2e0k5ge81o3Uos
 xz4++JqPLF2eQK/NffXkDTfBSQ99UgkJXlEd65ppP+Vj8iU2Pu6Tmw+E4/00leL86cQJBNnIR1XcC+
 usRAzsseXBSIM2vpB9RiugJbT0blFQY7d967TWdUTl1x7+NA2NNQDMXWTtDYn7/kq8BDiQRTLKj3/m
 W2dDP9hCLa7vRtoAuVaYnHJoDpEVPMU23s2K1GbwQSInUUwHRsjF2h4+6kUIWrK0so+AldJAIJhN6x
 LeHisHBHXY9bYcvh5HnP3q8NrOBfoUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=RuSrJlegEwSOSCPkuaUGz0F0qjumKjebhldkR5cmk2s=;
 b=efnTQl/13NSJqhDVKlo0jCXhvad65HU0GUwBwKBVCgci/9GPRyBsxL2epgtBW42k4MVGP1LJAa1cv
 aG3jOEwBg==
X-HalOne-Cookie: 9566d02068e038c4a5c209f0be7fc6ab5144ee01
X-HalOne-ID: 353d019c-0738-11ed-a6c8-d0431ea8a283
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 353d019c-0738-11ed-a6c8-d0431ea8a283;
 Tue, 19 Jul 2022 07:55:51 +0000 (UTC)
Date: Tue, 19 Jul 2022 09:55:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v1 0/11] drm: move dri1 drivers to drm/dri1/
Message-ID: <YtZjhaFVHJJi5OSo@ravnborg.org>
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
 <88df6527-7ff0-c69a-69ca-dbd1e4322bea@redhat.com>
 <0cb7b85a-d629-b5e9-4ab7-fcf7ce0e018f@suse.de>
 <b7bd3635-56c7-a1af-4d9e-70ad2c91f388@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7bd3635-56c7-a1af-4d9e-70ad2c91f388@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier, Thomas,

On Mon, Jul 18, 2022 at 02:18:13PM +0200, Javier Martinez Canillas wrote:
> On 7/18/22 12:50, Thomas Zimmermann wrote:
> 
> [...]
> 
> >>> To be honest, I still don't like this rename. Especially in the case of
> >>> via, which has a KMS driver coming up. It will now have an include
> >>> statement that crosses several levels in the directory hierarchy. And
> >>
> >> That could be avoided by moving drivers/gpu/drm/via/via_3d_reg.h and other
> >> header files to include/drm/via_3d_reg.h for example. Other drivers (i.e:
> >> i915) do the same for headers that are shared across different subsystems.
> >>   
> >>> what about the other DRI1 drivers? If we ever get KMS drivers for those,
> >>> do we want to move some header files back into their original locations?
> >>
> >> I believe for these we could also move them to include/drm/ if needed.
> > 
> > That pollutes these shared directories at the expense of everyone else. 
> > If anything, we want to move files out of the shared include paths.
> >
> 
> Yes, every option has a different set of trade offs.
>  
> > It would make sense to me if we'd have two distinct drivers. But here, 
> > the new and the old driver is really just one DRM driver with badly 
> > organized source code.
> >
> 
> I see. I haven't looked at the via drivers in detail.
> 
> >>   
> >>> Patches 1 and 2 look reasonable to me. The other driver patches have
> >>> basically zero upside IMHO.
> >>>
> >>
> >> I disagree with the zero upside. It may be that the trade offs are not
> >> worth it but there are upsides of having all DRI1 drivers and core DRI1
> >> bits in the same place. It makes grep-ing and reading files easier if
> >> one doesn't care about legacy DRI1 drivers.
> > 
> > The grep-ability is a minor point. It does come up, but is usually 
> > sorted out easily.
> > 
> > If we want to improve grep output, we should consider applying Sam's 
> > via_dri1 changes to all DRI1 drivers. So we'd end up with a single 
> > mga_dri1.c, tdfx_dri1.c, savage_dri1.c and so on. If the core/helper 
> > code is also in a _dri1-named source file, grep runs can filter out 
> > those filenames.
> >
> 
> Having everything with a _dri1 suffix would be an improvement I agree
> and if that's the consensus then I'm OK with that approach as well.
> 
> [...]

I will update the series with the following:
- Drop drm/dri1/
- Keep the CONFIG_DRM_* change and keep the DRIVER_DRI1 change
- All config options for DRI1 drivers will get a CONFIG_DRM_DRI1_*
  prefix
- Convert at least some of the drivers to single file drivers named
  foo_dri1. 
- I may add SPDX for licenses when I am touching the files
- I may try to concatenate all dri1 specific drm core files to drm_dri1.
  It is easy to do but I will take a look at the result before posting
  anything. 

When I have posted the above let's see what we all agree on.
May take a couple of days before I get back to it.

	Sam
