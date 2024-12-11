Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CECF9EC57F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 08:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36D610E09F;
	Wed, 11 Dec 2024 07:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mBqFIaAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A348510E09F;
 Wed, 11 Dec 2024 07:25:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF0DF5C5B83;
 Wed, 11 Dec 2024 07:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E296C4CED2;
 Wed, 11 Dec 2024 07:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1733901902;
 bh=Jc7NBA6iFYqiFX4bva67wMYBujSaLL3/1bTRUq794Tg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mBqFIaAznil7vHbBnOA/3mZfdlg/n9e7d+/Qj50dNvQab47RUx+WaRG3SeDLhDXZY
 luoyAxHvlQgOWUkC+04g4umXaQQUpDpTnhyA9OwXZfTrX92AzIAns3XCrEuUkguAmt
 YSt1BlZnGdT10r1WfajsB2nNQjLSi8hG7E8jbhIQ=
Date: Wed, 11 Dec 2024 08:24:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ed Maste <emaste@freebsd.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 chris.p.wilson@intel.com, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Update license on selftest lists to MIT
Message-ID: <2024121153-shawl-spearman-8e5f@gregkh>
References: <20241208151727.71695-1-emaste@FreeBSD.org>
 <Z1jMZNgMssHyAzg2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1jMZNgMssHyAzg2@intel.com>
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

On Tue, Dec 10, 2024 at 06:19:00PM -0500, Rodrigo Vivi wrote:
> On Sun, Dec 08, 2024 at 03:17:27PM +0000, Ed Maste wrote:
> > These two files (i915_live_selftests.h, i915_mock_selftests.h) were
> > introduced in commit 953c7f82eb89 ("drm/i915: Provide a hook for
> > selftests") and are effectively just a list of selftests.
> > 
> > The selftest implementation itself is largely in i915_selftest.c, and
> > uses a MIT license.  Graphics drivers are shared with other operating
> > systems and have long used a permissive license (or dual license) to
> > facilitate this.
> > 
> > The two selftest list files carried no license when introduced in
> > 953c7f82eb89, presumably as they were considered trivial.  Notably the
> > general selftest header i915_selftest.h (which does have non-trivial
> > content) also has an MIT license.
> > 
> > The GPL-2.0 SPDX tag in these two files came from b24413180f56, where
> > Greg Kroah-Hartman added the tag to all files that had no license.  This
> > makes sense in general, but it is clear from the context of the original
> > selftest commit here that these files are a trivial part of an otherwise
> > MIT-licensed patch to a MIT-licensed component, and should have an MIT
> > license.

No, that is not clear, by default, anything without a license gets the
GPL2 license as that is the license of the entire body of code.

> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Chris, do you confirm your intention of MIT and not GPL for these files?
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> 
> Greg, is this acceptable?

You need to get a signed-off-by from everyone who has touched these
files, which is not what you have done here :(

good luck!

greg k-h
