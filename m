Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FBF1796A6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 18:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFF689BF3;
	Wed,  4 Mar 2020 17:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E7D899F0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 17:25:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7EE3F80679;
 Wed,  4 Mar 2020 18:25:54 +0100 (CET)
Date: Wed, 4 Mar 2020 18:25:52 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 28/33] drm/panel-simple: Fix dotclock for Sharp LQ150X1LG11
Message-ID: <20200304172552.GA4587@ravnborg.org>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-29-ville.syrjala@linux.intel.com>
 <c9f756da-ba54-bfd6-87e4-4e52e3e7cecd@axentia.se>
 <20200303142031.GA2856480@ulmo>
 <eacb0bee-730e-edea-3c60-88dcdc67f604@axentia.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eacb0bee-730e-edea-3c60-88dcdc67f604@axentia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=N1j5SN3wW4WsjxMcbIkA:9 a=CjuIK1q_8ugA:10
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
Cc: Thierry Reding <treding@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter.

> >>
> >> That said, I have no idea whatsoever if others have started using this
> >> panel entry. My guess is that it has zero users, but who can tell?
> > 
> > A quick grep shows that arch/arm/boot/dts/at91-nattis-2-natte-2.dts is
> > the only device tree that uses this panel in the upstream kernel.
> 
> This is our design, and what made us originally add the entry to simple
> panel, but as I said, we no longer need simple-panel support for it...

With the only upstream user using panel-lvds we should delete
it from panel-simple.
With all the features it does not belong in panel-simple anyway.
Peter - care to send a patch for that?

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
