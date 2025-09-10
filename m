Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46F8B5148A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 12:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E66310E8CD;
	Wed, 10 Sep 2025 10:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bregans-1.gladserv.net (bregans-1.gladserv.net [185.128.211.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E7710E8CD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 10:52:54 +0000 (UTC)
Date: Wed, 10 Sep 2025 12:52:41 +0200
From: Brett A C Sheffield <bacs@librecast.net>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Murad Masimov <m.masimov@mt-integration.ru>,
 Yongzhen Zhang <zhangyongzhen@kylinos.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 1/1] Revert "fbdev: Disable sysfb device registration
 when removing conflicting FBs"
Message-ID: <aMFYeV4UdD7NnrSC@karahi.gladserv.com>
References: <20250910095124.6213-3-bacs@librecast.net>
 <20250910095124.6213-5-bacs@librecast.net>
 <87frcuegb7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frcuegb7.fsf@minerva.mail-host-address-is-not-set>
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

On 2025-09-10 12:46, Javier Martinez Canillas wrote:
> Brett A C Sheffield <bacs@librecast.net> writes:
> 
> Hello Brett,
> 
> > This reverts commit 13d28e0c79cbf69fc6f145767af66905586c1249.
> >
> > Commit ee7a69aa38d8 ("fbdev: Disable sysfb device registration when
> > removing conflicting FBs") was backported to 5.15.y LTS. This causes a
> > regression where all virtual consoles stop responding during boot at:
> >
> > "Populating /dev with existing devices through uevents ..."
> >
> > Reverting the commit fixes the regression.
> >
> > Signed-off-by: Brett A C Sheffield <bacs@librecast.net>
> > ---
> 
> In the other email you said:
> 
> > Newer stable kernels with this
> > patch (6.1.y, 6.6.y, 6.12,y, 6.15.y, 6.16.y) and mainline are unaffected.
> 
> But are you proposing to revert the mentioned commit in mainline too
> or just in the 5.15.y LTS tree ?

Only the 5.15.y tree. Sorry - that could have been clearer.  There's no
regression anywhere else. Mainline and other stable kernels are all ok.

Cheers,


Brett
