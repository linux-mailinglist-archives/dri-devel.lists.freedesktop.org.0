Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841E32C7B71
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 22:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25C689ABE;
	Sun, 29 Nov 2020 21:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A1C89ABE
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 21:45:21 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 23BE720031;
 Sun, 29 Nov 2020 22:45:19 +0100 (CET)
Date: Sun, 29 Nov 2020 22:45:17 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 02/28] video: fbcon: Fix warnings by using pr_debug()
 in fbcon
Message-ID: <20201129214517.GC1162850@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-3-sam@ravnborg.org>
 <9fbdaff8-18af-223d-6cec-4b44aeb94fec@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9fbdaff8-18af-223d-6cec-4b44aeb94fec@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=IJv9LcIfAAAA:8 a=ag1SF4gXAAAA:8
 a=hD80L64hAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8
 a=3hxhl-9mIZOli96NArIA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=cmr4hm9N53k6aw-X_--Q:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Lee Jones <lee.jones@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peter Rosin <peda@axentia.se>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 29, 2020 at 11:03:25AM +0100, Thomas Zimmermann wrote:
> 
> 
> Am 28.11.20 um 23:40 schrieb Sam Ravnborg:
> > Replacing DPRINTK() statements with pr_debug fixes set but not used
> > warnings.  And moves to a more standard logging setup at the same time.
> > 
> > v2:
> >    - Fix indent (Joe)
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Joe Perches <joe@perches.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Jiri Slaby <jirislaby@kernel.org>
> > Cc: Peilin Ye <yepeilin.cs@gmail.com>
> > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Cc: George Kennedy <george.kennedy@oracle.com>
> > Cc: Nathan Chancellor <natechancellor@gmail.com>
> > Cc: Peter Rosin <peda@axentia.se>
> > ---
> >   drivers/video/fbdev/core/fbcon.c | 25 ++++++++-----------------
> >   1 file changed, 8 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index bf61598bf1c3..44a5cd2f54cc 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -56,8 +56,6 @@
> >    *  more details.
> >    */
> > -#undef FBCONDEBUG
> > -
> 
> I guess this was added for quick debugging during development. Anyway, I
> never liked these kinds of hacks.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks, applied to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
