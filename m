Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB801B61F9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 19:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFA46E5D4;
	Thu, 23 Apr 2020 17:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD126E5D4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 17:32:28 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A77520736;
 Thu, 23 Apr 2020 17:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587663148;
 bh=w7GOTzU61w5iz2sI2oB4nl36pNz0/hQHD6NjHrABKvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aSvY0ir9c0SUohXTKU7lIoUdA78xgQ1DWN/047qt8+5lPcvrX0Jj2Ve7lY20CQ+vW
 g7xI0a6sc4ouVkqww9/DTv0z1SWdC1muAW45goUiUkj8Xi2HNlvMGY4cCV0XtDoOpg
 Lc0ZVGD0H/uosKy/yWr8AiwduhdHcMWjdNuo0xcU=
Date: Thu, 23 Apr 2020 19:32:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dejin Zheng <zhengdejin5@gmail.com>
Subject: Re: console: Complete exception handling in newport_probe()
Message-ID: <20200423173226.GA75304@kroah.com>
References: <c62ec54f-348b-2eae-59eb-374dde4d49ad@web.de>
 <20200423142909.GB1562@nuc8i5>
 <f054f00c-b813-e0c2-fe2e-30ccdec1ff46@web.de>
 <20200423170245.GA3417@nuc8i5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423170245.GA3417@nuc8i5>
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
Cc: linux-fbdev@vger.kernel.org,
 Thomas =?iso-8859-1?Q?Bogend=F6rfer?= <tsbogend@alpha.franken.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Markus Elfring <Markus.Elfring@web.de>,
 Ralf =?iso-8859-1?Q?B=E4chle?= <ralf@linux-mips.org>,
 Thomas Gleixner <tglx@linutronix.de>, Coccinelle <cocci@systeme.lip6.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 01:02:45AM +0800, Dejin Zheng wrote:
> On Thu, Apr 23, 2020 at 05:23:29PM +0200, Markus Elfring wrote:
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/scripts/coccinelle/free/iounmap.cocci
> > >>
> > >> How do you think about to extend presented software analysis approaches?
> > >>
> > > Sorry, I am not familiar with it, I don't know.
> > 
> > Do you find the comments helpful at the beginning of this SmPL script?
> >
> Sorry, I do not know how to use the SmPL script. 

<snip>

Please note you are responding to someone who many kernel maintainers,
myself included, have on their blacklist as they are totally unhelpful.
Please feel free to ignore them like the rest of us do.

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
