Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6BE24284B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 12:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEC36E07B;
	Wed, 12 Aug 2020 10:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178116E07B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 10:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=gP+H8ubPi8ciq3uu0zTjfB2jzrjIOsQl6XOLQ6h/JG0=; b=XWefLAuFbt+O8ayDhWF1acMn6A
 Y1rFJvLv/7b17L23+DcLwp+bPc1qOz0FnRlFrNprE6qoWUTmOAoVXn6x9R1iXkLjAVUdqZJNScPCb
 rUmhoBTq7m5ZO6yun1UpGJABv9wgH1100e/xo+5vl8G3W0PiAQ+NXomZcbtUIAGgmNo148WuL2CJs
 qMnB/wo6DvmijC0l3f0hFrVoaWmJ7N/Kno8To56t7YcteSEULyCc3/CyQAJ9IOLZ8lhGU3V/sjukq
 4kkN+zkeIlK7NwsVMP4DPKvNU2gp7xqz6TO5nBoqniiDphtm7JGyW37g8vfI/kNNI23zcZnwImdjG
 tVXglD1w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5o7R-0008E7-Ix; Wed, 12 Aug 2020 10:36:43 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DD705300238;
 Wed, 12 Aug 2020 12:36:27 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 80FE220EA5AE5; Wed, 12 Aug 2020 12:36:27 +0200 (CEST)
Date: Wed, 12 Aug 2020 12:36:27 +0200
From: peterz@infradead.org
To: christian.koenig@amd.com
Subject: Re: [PATCH] locking/rwsem: remove redundant semicolon of
 down_write_nest_lock
Message-ID: <20200812103627.GM2674@hirez.programming.kicks-ass.net>
References: <20200811111852.190209-1-christian.koenig@amd.com>
 <20200812081057.GJ2674@hirez.programming.kicks-ass.net>
 <8356e96d-8732-0e2e-e962-dec671c19eb2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8356e96d-8732-0e2e-e962-dec671c19eb2@gmail.com>
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
Cc: mingo@redhat.com, will@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 10:36:14AM +0200, Christian K=F6nig wrote:
> Am 12.08.20 um 10:10 schrieb peterz@infradead.org:
> > On Tue, Aug 11, 2020 at 01:18:52PM +0200, Christian K=F6nig wrote:
> > > From: Guchun Chen <guchun.chen@amd.com>
> > > =

> > > Otherwise, braces are needed when using it.
> > > =

> > > Signed-off-by: Guchun Chen <guchun.chen@amd.com>
> > > Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> > Thanks!
> =

> Do you pick it up or can I push it through drm-misc-fixes?
> =

> If the former please let me know when it hits Linus tree since I have a
> driver which contains some extra {} because of this.

Oh, in that case you can take it:

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

and I'll drop it from my quilt series.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
