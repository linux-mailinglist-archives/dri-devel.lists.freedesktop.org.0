Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726CC2F804A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 17:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6FE6E0C1;
	Fri, 15 Jan 2021 16:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416E36E0C1;
 Fri, 15 Jan 2021 16:10:31 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8331238A0;
 Fri, 15 Jan 2021 16:10:29 +0000 (UTC)
Date: Fri, 15 Jan 2021 11:10:28 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [BUG] on reboot: bisected to: drm/i915: Shut down displays
 gracefully on reboot
Message-ID: <20210115111028.76aec4ac@gandalf.local.home>
In-Reply-To: <87mtxaprjy.fsf@intel.com>
References: <20210114163206.4a562d82@gandalf.local.home>
 <20210114163435.767ccbb0@gandalf.local.home>
 <87mtxaprjy.fsf@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Jan 2021 09:50:25 +0200
Jani Nikula <jani.nikula@intel.com> wrote:

> >>   fe0f1e3bfdfeb53e18f1206aea4f40b9bd1f291c
> >>   ("drm/i915: Shut down displays gracefully on reboot")
> >> 
> >> Which makes sense, as it happens on shutdown.  
> 
> Please try this pull, heading to -rc4, which cointains "drm/i915:
> Disable RPM wakeref assertions during driver shutdown":
> 
> http://lore.kernel.org/r/87sg73pz42.fsf@intel.com


Yep, Linus pulled in 057fe3535eb3 last night and it appears to fix the
issue in mainline.

Thanks!

-- Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
