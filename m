Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B21942FB28
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 20:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC556E3AA;
	Fri, 15 Oct 2021 18:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1AB6E3AA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 18:39:57 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 4b80d154-2de7-11ec-9c3f-0050568c148b;
 Fri, 15 Oct 2021 18:39:56 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id B82DF194B3E;
 Fri, 15 Oct 2021 20:40:03 +0200 (CEST)
Date: Fri, 15 Oct 2021 20:39:54 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Mack <daniel@zonque.org>
Cc: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RESEND v10 0/2] gpu: drm: add driver for ili9361 panel
Message-ID: <YWnK+rSbOU7Oxbvm@ravnborg.org>
References: <20211015150131.1020878-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015150131.1020878-1-daniel@zonque.org>
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

Hi Daniel,

On Fri, Oct 15, 2021 at 05:01:29PM +0200, Daniel Mack wrote:
> This is v10 of the series.
> 
> Resending without changes.
Hmm...

> 
> Changelog:
> 
> v2 -> v3:
> 	* Turn Documentation into yaml format
> 
> v3 -> v4:
> 	* Fix reference error in yaml file
> 
> v4 -> v5:
> 	* More yaml file documentation fixes
> 
> v5 -> v6:
> 	* More yaml file documentation fixes
> 
> v6 -> v7:
> 	* Fix ordering of patches
> 
> v7 -> v8:
> 	* More yaml file documentation fixes
> 
> v8 -> v9:
> 	* Addressed some minor issues pointed out by Thomas Zimmermann
> 	* Rebased
> 
> v9 -> v10:
> 	* Re-apply the yaml file in favour of the txt file

Applied to drm-misc-next. I fixed the build doing a change similar to:
https://lore.kernel.org/dri-devel/20210222141756.7864-1-tzimmermann@suse.de/

And while writing this mail I realised I forgot to amend the changes.

This is the second time this week I push patches that does not build :-(
I will stop applying patches for today...

	Sam
