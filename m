Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E38A0A8A6
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 12:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E75110E23F;
	Sun, 12 Jan 2025 11:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QHvQyr2n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A79F10E23F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 11:39:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6152AA400E0;
 Sun, 12 Jan 2025 11:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF090C4CEDF;
 Sun, 12 Jan 2025 11:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1736681987;
 bh=8IypaYh4K3zDyThWiWzbqnXIzxzIHhRJYQ+yKKDwBMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QHvQyr2nQuZB7Y+XV1BgTLNwnI02J26Y5Z6ucPbNg47uEQc4YTHrCHnH8r9Qw9Q6K
 FtaO66hbdg31keJvideJ5NrIgC4rfcO4qc9E7un+sKedYKeiCjxex4AWd2ffcmDXi9
 Tut/N5xgMjkt93WL5hgzHP69jzVu+f/jt3OJ8moo=
Date: Sun, 12 Jan 2025 12:39:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode of
 operation for OAR/OAC)
Message-ID: <2025011215-agreeing-bonfire-97ae@gregkh>
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
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

On Fri, Jan 10, 2025 at 12:53:41PM -0800, Umesh Nerlige Ramappa wrote:
> commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 upstream

<snip>

> Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close")
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: stable@vger.kernel.org # 6.12+
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20241220171919.571528-2-umesh.nerlige.ramappa@intel.com
> (cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> (cherry picked from commit f0ed39830e6064d62f9c5393505677a26569bb56)

Oh I see what you all did here.

I give up.  You all need to stop it with the duplicated git commit ids
all over the place.  It's a major pain and hassle all the time and is
something that NO OTHER subsystem does.

Yes, I know that DRM is special and unique and running at a zillion
times faster with more maintainers than any other subsystem and really,
it's bigger than the rest of the kernel combined, but hey, we ALL are a
common project here.  If each different subsystem decided to have their
own crazy workflows like this, we'd be in a world of hurt.  Right now
it's just you all that is causing this world of hurt, no one else, so
I'll complain to you.

We have commits that end up looking like they go back in time that are
backported to stable releases BEFORE they end up in Linus's tree and
future releases.  This causes major havoc and I get complaints from
external people when they see this as obviously, it makes no sense at
all.

And it easily breaks tools that tries to track where backports went and
if they are needed elsewhere, which ends up missing things because of
this crazy workflow.  So in the end, it's really only hurting YOUR
subsystem because of this.

And yes, there is a simple way to fix this, DO NOT TAG COMMITS THAT ARE
DUPLICATES AS FOR STABLE.  Don't know why you all don't do that, would
save a world of hurt.

I'm tired of it, please, just stop.  I am _this_ close to just ignoring
ALL DRM patches for stable trees...

greg k-h
