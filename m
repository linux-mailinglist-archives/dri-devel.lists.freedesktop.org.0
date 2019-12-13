Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5FA11E869
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E946E090;
	Fri, 13 Dec 2019 16:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 419 seconds by postgrey-1.36 at gabe;
 Fri, 13 Dec 2019 16:34:23 UTC
Received: from smtprelay.hostedemail.com (smtprelay0063.hostedemail.com
 [216.40.44.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB6E6E090
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 16:34:23 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 909321802EC88
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 16:27:24 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 669ED182CF669;
 Fri, 13 Dec 2019 16:27:22 +0000 (UTC)
X-Session-Marker: 6E657665747340676F6F646D69732E6F7267
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, rostedt@goodmis.org,
 :::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:541:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1567:1593:1594:1711:1714:1730:1747:1777:1792:2393:2553:2559:2562:2901:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3871:3873:5007:6120:6261:6742:7514:7875:7901:10004:10400:10848:10967:11232:11658:11914:12043:12297:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21433:21627:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: price69_4021a926f8638
X-Filterd-Recvd-Size: 1814
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225]) (Authenticated sender: nevets@goodmis.org)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Fri, 13 Dec 2019 16:27:20 +0000 (UTC)
Date: Fri, 13 Dec 2019 09:55:14 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v3] drm: Funnel drm logs to tracepoints
Message-ID: <20191213095459.5e520ae5@gandalf.local.home>
In-Reply-To: <20191213133446.392c9045@eldfell.localdomain>
References: <20191212203301.142437-1-sean@poorly.run>
 <20191213133446.392c9045@eldfell.localdomain>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Dec 2019 13:34:46 +0200
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> Is there a way to pull out messages
> from /sys/kernel/debug/tracing/trace and filter them on reading instead
> of on writing?

FYI, you can mount the tracing directory without having to mount the
debug directory.

 mount -t tracefs nodev /sys/kernel/tracing

This way you don't need to mount everyone's debugging features just to
access tracing.

-- Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
