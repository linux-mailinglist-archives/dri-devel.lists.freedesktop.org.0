Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF981658DD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 08:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D766ECE7;
	Thu, 20 Feb 2020 07:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04336ECE7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 07:59:03 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20283602-1500050 for multiple; Thu, 20 Feb 2020 07:59:01 +0000
MIME-Version: 1.0
To: Alex Deucher <alexdeucher@gmail.com>, paulmck@kernel.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <CADnq5_OJSHV5XotA6hORgQSrC4A-ZFzfXN_NRMGYFka+MTyjGg@mail.gmail.com>
References: <20200220004232.GA28048@paulmck-ThinkPad-P72>
 <CADnq5_OJSHV5XotA6hORgQSrC4A-ZFzfXN_NRMGYFka+MTyjGg@mail.gmail.com>
Message-ID: <158218553821.8112.10047864129562395990@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: drm_dp_mst_topology.c and old compilers
Date: Thu, 20 Feb 2020 07:58:58 +0000
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Alex Deucher (2020-02-20 02:52:32)
> On Wed, Feb 19, 2020 at 7:42 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > Hello!
> >
> > A box with GCC 4.8.3 compiler didn't like drm_dp_mst_topology.c.  The
> > following (lightly tested) patch makes it happy and seems OK for newer
> > compilers as well.
> >
> > Is this of interest?
> 
> How about a memset instead?  That should be consistent across compilers.

The kernel has adopted the gccism: struct drm_dp_desc desc = {};
git grep '= {}' | wc -l: 2046
git grep '= { }' | wc -l: 694
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
