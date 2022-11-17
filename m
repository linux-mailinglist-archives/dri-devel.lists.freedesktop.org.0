Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0904362D375
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 07:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541C710E542;
	Thu, 17 Nov 2022 06:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9E410E544;
 Thu, 17 Nov 2022 06:29:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A3071B81E98;
 Thu, 17 Nov 2022 06:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F55C433D6;
 Thu, 17 Nov 2022 06:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1668666554;
 bh=k7mSpJJ0WM6ewes40AUp3GUJji+8y5DOYEMIWFBBoEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DJ8QBLnMiZ4mKv7YRncrXPoLUYkMOvxv0AEKeJ4mEiAuKHxVrB0jkpuaS0lOdZiS1
 XA6SHPwNyF3LP/PUz9Mrobo6+cO8IozvOnVijp3bf6sBgb1MIIxTBWol7n5CnhOl/2
 IFsAYnPcafc3vKUzAL/IaT97mSlVQg2fjBJZ+rnw=
Date: Thu, 17 Nov 2022 07:29:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH 0/7] DYNAMIC_DEBUG fixups for rc
Message-ID: <Y3XUtx2JUIuQLNmU@kroah.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <20221111221715.563020-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111221715.563020-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 03:17:08PM -0700, Jim Cromie wrote:
> hi Jason, Greg, DRM-folk,
> 
> drm.debug-on-dyndbg has a regression due to a chicken-&-egg problem;
> drm.debug is applied to enable dyndbg callsites before the dependent
> modules' callsites are available to be enabled.
> 
> My "fixes" are unready, so lets just mark it BROKEN for now.
> 
> Meanwhile, heres some other fixes, a comment tweak, a proof of
> non-bug, an internal simplification, and a cleanup/improvement to the
> main macro (API):
> 
> Split DECLARE_DYNDBG_CLASSMAP in 1/2; REFERENCE_DYNDBG_CLASSMAP now
> refers to a classmap DECLARE'd just once.  I think this gives a path
> away from the coordination-by-identical-classmaps "feature" that Jani
> and others thought was "weird" (my term).
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
