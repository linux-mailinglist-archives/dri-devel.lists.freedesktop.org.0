Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED1EA14E72
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 12:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07B410EACD;
	Fri, 17 Jan 2025 11:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qp1R4vDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACA710EAC3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 11:25:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0D7E2A42BE3;
 Fri, 17 Jan 2025 11:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4E5C4CEDD;
 Fri, 17 Jan 2025 11:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1737113140;
 bh=H7A2hqMxKZYMX9asT2op2wIPHhhvQn1el8J9qlmdtis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qp1R4vDKGsYVTSE+0Gmin5L01IIwaxm5u81jCuOsFQ0XP0R1hyps7+7dMVFT6mVvD
 k6hfLf0C4qF0PVm4QKvSTXV+V7or4SoDBK36qLYRrOHb7iowfvuQvJHkyAZjOjhwpZ
 xte/EL3Lqrew7nv5rkRqZZ1UPD6dNbL1JjtDFtaE=
Date: Fri, 17 Jan 2025 12:25:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Dave Airlie <airlied@gmail.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
Message-ID: <2025011749-pueblo-brought-3107@gregkh>
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
 <2025011244-backlit-jubilance-4fa1@gregkh>
 <jwnn3zov3akpnqzbk5lss3r6q4yupj6indmmapwvh6hadcdycg@pvquyntsvqpe>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jwnn3zov3akpnqzbk5lss3r6q4yupj6indmmapwvh6hadcdycg@pvquyntsvqpe>
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

On Fri, Jan 17, 2025 at 12:01:01PM +0100, Uwe Kleine-König wrote:
> On Sun, Jan 12, 2025 at 10:06:42PM +0100, Greg KH wrote:
> > That's fine, the issue is that you are the only ones with "duplicate"
> > commits in the tree that are both tagged for stable, every release.
> 
> Isn't a solution as easy as teaching your tooling not to create/accept
> commits on -next with Cc: stable? This way folks intending to push a
> change will notice it should go to the fixes branch. And if only
> afterwards you notice this is a critical fix that should get backported
> at least the commit that takes more time entering mainline doesn't have
> the stable tag.
> 
> Maybe additionally make sure that Fixes: and revert notices only point
> to commits that are an ancestor.

The commit is always an ancestor, the "trick" is which one when the
ancestor was cherry-picked previously?  That's the real problem here..

gre k-h
