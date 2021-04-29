Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2385C36F5F8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 08:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893176E491;
	Fri, 30 Apr 2021 06:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 378 seconds by postgrey-1.36 at gabe;
 Thu, 29 Apr 2021 20:05:05 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF606F49D;
 Thu, 29 Apr 2021 20:05:05 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id C43DD1C0BA2; Thu, 29 Apr 2021 21:58:44 +0200 (CEST)
Date: Thu, 29 Apr 2021 21:58:43 +0200
From: Pavel Machek <pavel@denx.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 000/190] Revertion of all of the umn.edu commits
Message-ID: <20210429195843.GA1067@bug>
References: <20210421130105.1226686-1-gregkh@linuxfoundation.org>
 <CAKMK7uFONR-12CZEGJLrjgS0N-kF_v7_cXJEiSBPFoBbyRHn0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFONR-12CZEGJLrjgS0N-kF_v7_cXJEiSBPFoBbyRHn0w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Fri, 30 Apr 2021 06:53:27 +0000
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
Cc: Jean Delvare <jdelvare@suse.com>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Kangjie Lu <kjlu@umn.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Aditya Pakki <pakki001@umn.edu>, Alex Deucher <alexander.deucher@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

> >   Revert "drm/radeon: Fix reference count leaks caused by
> >     pm_runtime_get_sync"
> >   Revert "drm/radeon: fix multiple reference count leak"
> >   Revert "drm/amdkfd: Fix reference count leaks."
> 
> I didn't review these carefully, but from a quick look they all seem
> rather inconsequental. Either error paths that are very unlikely, or
> drivers which are very dead (looking at the entire list, not just what
> you reverted here).
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

So you are knowingly acking patch re-introducing bugs into kernel, because 
the bugs are minor? I don't believe that's an okay thing to do.

Maybe something needs reverting, but lets not introduce bugs into kernel because they are
"minor".

Best regards,
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
