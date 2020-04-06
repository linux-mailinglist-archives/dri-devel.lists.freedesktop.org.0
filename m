Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F2F19F655
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 15:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B48E89D56;
	Mon,  6 Apr 2020 13:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0170.hostedemail.com
 [216.40.44.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B09C89D56
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 13:03:19 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 1E2261800468C;
 Mon,  6 Apr 2020 13:03:18 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1981:2194:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:4250:4321:5007:6117:6120:6691:6742:7514:7875:7901:7903:8957:10004:10400:10848:10967:11026:11232:11473:11658:11914:12296:12297:12438:12555:12740:12760:12895:12986:13069:13101:13311:13357:13439:13972:14181:14659:14721:21080:21627:21740:21990:30012:30029:30030:30054:30060:30080:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:3, LUA_SUMMARY:none
X-HE-Tag: uncle16_1c73d53e8c256
X-Filterd-Recvd-Size: 3467
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Mon,  6 Apr 2020 13:03:15 +0000 (UTC)
Message-ID: <ea5e4d82e78140de6591889430a4ded351b18e89.camel@perches.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
From: Joe Perches <joe@perches.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Date: Mon, 06 Apr 2020 06:01:17 -0700
In-Reply-To: <CAHp75Vdp+PXaJxrm99DgpJSS+6PcD1FfAfE3U1auFr2oxk5-tA@mail.gmail.com>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
 <b1e6213ba9f67da8278dd5c5f5e4def8ab927c83.camel@perches.com>
 <20200403193242.38611906@coco.lan>
 <2751400ae13b25d8259a8a9d7b36caf98ec2d367.camel@perches.com>
 <CAHp75Vf+m_qzOwZb38dObLpKV2N27-J_7beqffhFVoSHaNV2vg@mail.gmail.com>
 <20200406094645.5f96457a@coco.lan>
 <CAHp75Vdp+PXaJxrm99DgpJSS+6PcD1FfAfE3U1auFr2oxk5-tA@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
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
Cc: Petr Mladek <pmladek@suse.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-04-06 at 13:44 +0300, Andy Shevchenko wrote:
> On Mon, Apr 6, 2020 at 10:46 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> > Em Fri, 3 Apr 2020 21:32:42 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> > > On Fri, Apr 3, 2020 at 8:54 PM Joe Perches <joe@perches.com> wrote:
> > > > On Fri, 2020-04-03 at 19:32 +0200, Mauro Carvalho Chehab wrote:
> > > > > Em Fri, 03 Apr 2020 09:56:42 -0700
> > > > > Joe Perches <joe@perches.com> escreveu:
> > > > It _might_ be useful to use a CONFIG_MEDIA_SUPPORT guard
> > > > in lib/vsprintf for this.
> > > 
> > > No need. FourCC, if Sakari makes it more generic, can be used for
> > > other purposes, e.g. printing component names from the chips (not
> > > related to media at all).
> > > 
> > 
> > Hmm... not 100% sure about what you're meaning with "component names".
> 
> 4cc is pretty much wide standard, media is just one of (famous) users of it.
> 
> As I emphasized the example I referring to has nothing to do with media.
> 
> Now, I have already two examples:
> - component name inside hardware register (used by Synopsys DesignWare)
> - CSRT table in ACPI uses this code for vendor ID.

So if this is really u32_to_ascii, perhaps the "-BE" bit
should be separated and "%4pEp" could be used with some
renamed inline used like ERR_PTR so maybe something like
this might work?

static inline void * __must_check FOURCC(u32 val)
{
	return (void *)(unsigned long)cpu_to_be32(val);
}

void test_4cc(void)
{
	u32 val = 0x41424344;

	printk("4cc like: %4pE\n", FOURCC(val));
}


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
