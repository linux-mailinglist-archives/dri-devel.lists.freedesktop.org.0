Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83741174E83
	for <lists+dri-devel@lfdr.de>; Sun,  1 Mar 2020 17:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93F26E4D7;
	Sun,  1 Mar 2020 16:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106756E4C5;
 Sun,  1 Mar 2020 16:33:11 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20404260-1500050 for multiple; Sun, 01 Mar 2020 16:33:09 +0000
MIME-Version: 1.0
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <74b581c4-2e5b-6455-63d3-351635820a4b@intel.com>
References: <20200301155248.4132645-1-chris@chris-wilson.co.uk>
 <20200301155248.4132645-2-chris@chris-wilson.co.uk>
 <74b581c4-2e5b-6455-63d3-351635820a4b@intel.com>
Message-ID: <158308038685.3365.12116750291008658412@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH 2/2] RFC drm/i915: Export per-client debug
 tracing
Date: Sun, 01 Mar 2020 16:33:06 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-03-01 16:27:24)
> On 01/03/2020 17:52, Chris Wilson wrote:
> > Rather than put sensitive, and often voluminous, user details into a
> > global dmesg, report the error and debug messages directly back to the
> > user via the kernel tracing mechanism.
> 
> 
> Sounds really nice. Don't you want the existing global tracing to be the 
> default at least until a client does a get_trace?

We've currently in the middle of an awfully spammy regression :(

And I think the user's debug information does not belong in the global
dmesg.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
