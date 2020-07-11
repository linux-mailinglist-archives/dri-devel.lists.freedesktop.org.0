Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EA621C5A4
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 20:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A606E1B3;
	Sat, 11 Jul 2020 18:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0121.hostedemail.com
 [216.40.44.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9A86E1B3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 18:16:36 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id EFC91180A7FFC;
 Sat, 11 Jul 2020 18:16:35 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:960:966:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2525:2553:2560:2563:2682:2685:2828:2859:2895:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3871:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4385:4605:5007:6119:7903:9025:9592:10004:10400:10848:11026:11232:11658:11914:12043:12048:12296:12297:12555:12740:12760:12895:13018:13019:13439:14180:14659:14721:21060:21080:21433:21451:21627:21939:30054:30070:30075:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: pear57_100d03026ed9
X-Filterd-Recvd-Size: 3417
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Sat, 11 Jul 2020 18:16:34 +0000 (UTC)
Message-ID: <04ce5199522b4136909fa4926282b7da8abddc4a.camel@perches.com>
Subject: Re: [PATCH 0/4] drm: core: Convert logging to drm_* functions.
From: Joe Perches <joe@perches.com>
To: Suraj Upadhyay <usuraj35@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Date: Sat, 11 Jul 2020 11:16:33 -0700
In-Reply-To: <20200711151126.GA12262@blackclown>
References: <cover.1594136880.git.usuraj35@gmail.com>
 <20200710175643.GF17565@ravnborg.org> <20200711151126.GA12262@blackclown>
User-Agent: Evolution 3.36.3-0ubuntu1 
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2020-07-11 at 20:41 +0530, Suraj Upadhyay wrote:
> On Fri, Jul 10, 2020 at 07:56:43PM +0200, Sam Ravnborg wrote:
> > Hi Suraj.
> > 
> > On Tue, Jul 07, 2020 at 10:04:14PM +0530, Suraj Upadhyay wrote:
> > > This patchset converts logging to drm_* functions in drm core.
> > > 
> > > The following functions have been converted to their respective
> > > DRM alternatives :
> > > dev_info()      --> drm_info()
> > > dev_err()       --> drm_err()
> > > dev_warn()      --> drm_warn()
> > > dev_err_once()  --> drm_err_once().
> > 
> > I would prefer that DRM_* logging in the same files are converted in the
> > same patch. So we have one logging conversion patch for each file you
> > touches and that we do not need to re-vist the files later to change
> > another set of logging functions.
> 
> Agreed.
> 
> > If possible WARN_* should also be converted to drm_WARN_*
> > If patch is too large, then split them up but again lets have all
> > logging updated when we touch a file.
> > 
> > Care to take a look at this approach?
> > 
> 
> Hii,
> 	The problem with WARN_* macros is that they are used without any
> drm device context. For example [this use here](https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_edid.c#n1667) in drm_edid.c,
> doesn't have a drm device context and only has one argument (namely !raw_edid).
> There are many more such use cases.
> 
> And also there were cases where dev_* logging functions didn't have any
> drm_device context.

Perhaps change the __drm_printk macro to not
dereference the drm argument when NULL.

A trivial but perhaps inefficient way might be
used like:

	drm_<level>(NULL, fmt, ...)

---
 include/drm/drm_print.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 1c9417430d08..9323a8f46b3c 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -395,8 +395,8 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 /* Helper for struct drm_device based logging. */
 #define __drm_printk(drm, level, type, fmt, ...)			\
-	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
-
+	dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt,	\
+			  ##__VA_ARGS__)
 
 #define drm_info(drm, fmt, ...)					\
 	__drm_printk((drm), info,, fmt, ##__VA_ARGS__)




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
