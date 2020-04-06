Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCFA19F0A8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC0089DE3;
	Mon,  6 Apr 2020 07:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE4A89DE3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 07:17:22 +0000 (UTC)
IronPort-SDR: S2qPXafej1sfB8VO7R/VGo/tf3ASE38tESt892a+/v0e83HvvsBJxN9K1WOI8+FW3uY58jY2BS
 D8zKlfM12qbQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 00:17:21 -0700
IronPort-SDR: FEJR2FRvCVFKSwmReGQsjKk0QKS6dLx8bmdH7ksbClhJxkKpCvimLHb1uWvWq7vUFHmXtFfgfv
 anum9QaXZ/fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="268991943"
Received: from unknown (HELO kekkonen.fi.intel.com) ([10.252.48.155])
 by orsmga002.jf.intel.com with ESMTP; 06 Apr 2020 00:17:17 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
 id EE74421D18; Mon,  6 Apr 2020 10:17:12 +0300 (EEST)
Date: Mon, 6 Apr 2020 10:17:12 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20200406071712.GC5835@kekkonen.localdomain>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
 <b1e6213ba9f67da8278dd5c5f5e4def8ab927c83.camel@perches.com>
 <20200403193242.38611906@coco.lan>
 <2751400ae13b25d8259a8a9d7b36caf98ec2d367.camel@perches.com>
 <CAHp75Vf+m_qzOwZb38dObLpKV2N27-J_7beqffhFVoSHaNV2vg@mail.gmail.com>
 <20200404001425.GC4394@kekkonen.localdomain>
 <20200404002147.GG9690@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200404002147.GG9690@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Sat, Apr 04, 2020 at 03:21:47AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Sat, Apr 04, 2020 at 03:14:25AM +0300, Sakari Ailus wrote:
> > On Fri, Apr 03, 2020 at 09:32:42PM +0300, Andy Shevchenko wrote:
> > > On Fri, Apr 3, 2020 at 8:54 PM Joe Perches <joe@perches.com> wrote:
> > > > On Fri, 2020-04-03 at 19:32 +0200, Mauro Carvalho Chehab wrote:
> > > > > Em Fri, 03 Apr 2020 09:56:42 -0700
> > > > > Joe Perches <joe@perches.com> escreveu:
> > > 
> > > > It _might_ be useful to use a CONFIG_MEDIA_SUPPORT guard
> > > > in lib/vsprintf for this.
> > > 
> > > No need. FourCC, if Sakari makes it more generic, can be used for
> > > other purposes, e.g. printing component names from the chips (not
> > > related to media at all).
> > 
> > Could you elaborate?
> > 
> > This could be already used on DRM, presumably, and that does not depend on
> > CONFIG_MEDIA_SUPPORT. I don't know how much there would be a need for that,
> > though, but this remains a possibility.
> 
> /**
>  * drm_get_format_name - fill a string with a drm fourcc format's name
>  * @format: format to compute name of
>  * @buf: caller-supplied buffer
>  */
> const char *drm_get_format_name(uint32_t format, struct drm_format_name_buf *buf)
> {
> 	snprintf(buf->str, sizeof(buf->str),
> 		 "%c%c%c%c %s-endian (0x%08x)",
> 		 printable_char(format & 0xff),
> 		 printable_char((format >> 8) & 0xff),
> 		 printable_char((format >> 16) & 0xff),
> 		 printable_char((format >> 24) & 0x7f),
> 		 format & DRM_FORMAT_BIG_ENDIAN ? "big" : "little",
> 		 format);
> 
> 	return buf->str;
> }
> EXPORT_SYMBOL(drm_get_format_name);
> 
> I'm not advocating for one approach or the other in this case, but we
> should standardize 4CC printing between the two subsystems.

IMO this format (with spaces removed from 4cc) would be fine for V4L2 as
well.

-- 
Regards,

Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
