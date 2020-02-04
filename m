Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A671527AC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 09:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D1C6F4CA;
	Wed,  5 Feb 2020 08:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4424B6E8D3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 19:31:00 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Feb 2020 11:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,402,1574150400"; d="scan'208";a="263956574"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2020 11:30:49 -0800
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iz3uM-000100-VD; Tue, 04 Feb 2020 21:30:50 +0200
Date: Tue, 4 Feb 2020 21:30:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1] drm: shmobile: Platform data shan't include kernel.h
Message-ID: <20200204193050.GN10400@smile.fi.intel.com>
References: <20200204161916.28744-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW8kgnw4k9-jpronxDMmeZ7NJkc4Anwmc5G247QyX80GQ@mail.gmail.com>
 <20200204182621.GE20396@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204182621.GE20396@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 05 Feb 2020 08:52:53 +0000
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 04, 2020 at 08:26:21PM +0200, Laurent Pinchart wrote:
> On Tue, Feb 04, 2020 at 06:39:34PM +0100, Geert Uytterhoeven wrote:
> > On Tue, Feb 4, 2020 at 5:20 PM Andy Shevchenko wrote:
> > > Replace with appropriate types.h.
> > 
> > Thanks for your patch!
> > 
> > I have only one very short question: why?
> 
> Likewise :-) The patch itself looks fine, but the commit message is a
> bit terse.

The kernel.h for a long time being a dump of a lot of things. I started
cleaning it up a bit. During this I notice that developers too far too lazy to
use appropriate headers. For platform data kernel.h by definition is not
appropriate.

Any suggestion what should I put to commit message?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
