Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3DC2CFEBC
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 21:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34C36E446;
	Sat,  5 Dec 2020 20:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B566E446
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 20:18:54 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 624B3804CE;
 Sat,  5 Dec 2020 21:18:45 +0100 (CET)
Date: Sat, 5 Dec 2020 21:18:43 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 27/28] video: fbdev: cirrusfb: Fix kernel-doc and set
 but not used warnings
Message-ID: <20201205201843.GK332836@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-28-sam@ravnborg.org>
 <c8f1f756-15eb-cc50-caad-2a9391481884@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8f1f756-15eb-cc50-caad-2a9391481884@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=ELFGstoh8s1JMG3t_vcA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
 a=cvBusfyB2V15izCimMoJ:22
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

Hi Thomas.

On Tue, Dec 01, 2020 at 03:21:59PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> > Fix warnings:
> > - drop kernel-doc for the two debug functions to avoid the warnings
> > - delete unused code
> > 
> > v2:
> >    - Updated subject (Lee)
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thomas Zimemrmann <tzimmermann@suse.de>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > ---
> >   drivers/video/fbdev/cirrusfb.c | 20 +++++++++-----------
> >   1 file changed, 9 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
> > index e9027172c0f5..93802abbbc72 100644
> > --- a/drivers/video/fbdev/cirrusfb.c
> > +++ b/drivers/video/fbdev/cirrusfb.c
> > @@ -2463,8 +2463,6 @@ static void AttrOn(const struct cirrusfb_info *cinfo)
> >    */
> >   static void WHDR(const struct cirrusfb_info *cinfo, unsigned char val)
> >   {
> > -	unsigned char dummy;
> > -
> >   	if (is_laguna(cinfo))
> >   		return;
> >   	if (cinfo->btype == BT_PICASSO) {
> > @@ -2473,18 +2471,18 @@ static void WHDR(const struct cirrusfb_info *cinfo, unsigned char val)
> >   		WGen(cinfo, VGA_PEL_MSK, 0x00);
> >   		udelay(200);
> >   		/* next read dummy from pixel address (3c8) */
> > -		dummy = RGen(cinfo, VGA_PEL_IW);
> > +		RGen(cinfo, VGA_PEL_IW);
> 
> I hope these kinds of changes do not turn into an endless stream of warnings
> from static ananlysis. I git an email with that today about such a call.
Got the same mail, will type a patch for it.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

This and the other acked patches are now applied to drm-misc-next.
Building for a few more architectures turned up new warnings, so I will
prepare a new set of patches with comments addressed.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
