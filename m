Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A432C78CB
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 12:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F1D6E1D6;
	Sun, 29 Nov 2020 11:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E986E1D6
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 11:22:10 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9F9A620026;
 Sun, 29 Nov 2020 12:22:07 +0100 (CET)
Date: Sun, 29 Nov 2020 12:22:06 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 01/28] video: Fix kernel-doc warnings in
 of_display_timing + of_videomode
Message-ID: <20201129112206.GB1094053@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-2-sam@ravnborg.org>
 <ca28a1e4-3e73-fdfc-e288-eaac4b228610@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca28a1e4-3e73-fdfc-e288-eaac4b228610@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=gzKDScf-u2H0hSbXR7QA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=cvBusfyB2V15izCimMoJ:22 a=AjGcO6oz07-iQ99wixmX:22
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
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Lee Jones <lee.jones@linaro.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 29, 2020 at 11:01:13AM +0100, Thomas Zimmermann wrote:
> 
> 
> Am 28.11.20 um 23:40 schrieb Sam Ravnborg:
> > Fix kernel-doc warnings reported when using W=1.
> > 
> > v2:
> >    - Improve subject (Lee)
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: linux-fbdev@vger.kernel.org
> > ---
> >   drivers/video/of_display_timing.c | 1 +
> >   drivers/video/of_videomode.c      | 8 ++++----
> >   2 files changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
> > index abc9ada798ee..f93b6abbe258 100644
> > --- a/drivers/video/of_display_timing.c
> > +++ b/drivers/video/of_display_timing.c
> > @@ -52,6 +52,7 @@ static int parse_timing_property(const struct device_node *np, const char *name,
> >   /**
> >    * of_parse_display_timing - parse display_timing entry from device_node
> >    * @np: device_node with the properties
> > + * @dt: display_timing that contains the result. I may be partially written in case of errors
> >    **/
> >   static int of_parse_display_timing(const struct device_node *np,
> >   		struct display_timing *dt)
> > diff --git a/drivers/video/of_videomode.c b/drivers/video/of_videomode.c
> > index 67aff2421c29..a5bb02f02b44 100644
> > --- a/drivers/video/of_videomode.c
> > +++ b/drivers/video/of_videomode.c
> > @@ -13,10 +13,10 @@
> >   #include <video/videomode.h>
> >   /**
> > - * of_get_videomode - get the videomode #<index> from devicetree
> 
> What's wrong with this line? We use the dash in lots of places?
I think my OCD kicked in and I made all lines use ':'.
I will re-add the dash when I apply.

> 
> Besides this,
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

	Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
