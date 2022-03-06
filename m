Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 684F74CE8C3
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 05:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B37610E385;
	Sun,  6 Mar 2022 04:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803CC10E385;
 Sun,  6 Mar 2022 04:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Y6IRrwM9XbIc9OImDeEJKAn2uhHKqiedoDrNGSRpu4g=; b=AQmadDiwfjVWyyySRxV//3KZkQ
 aeexEdj4JEOcM1yo4N01ZtuJZjeiXCI+Fu7Zhusm/7TAW9P1aJYk0pxa5axDFl4nn/J3FeC6PUrUl
 N8sncEvKispevm1wo87a51sQE2cJsFpitIHcgsPWcN+2AJkLqf51AJEjYSaE+R/b01eeVWYeFNPkc
 DNJK7pw49C8yrGasV2lIGCIyKVRv8Z2wDMCXZKRg2njCqG1PTggVp/a/2bYkQGuD+fX58FvN36ve7
 qFf0PwLnd0ZG3KvxgZWH0plfkNICc1nmffc1bUj/AciAx1GKmfKFENeGVZ0VhMoau0IRhs0WFYtCq
 bQtR54ZA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nQicl-00E6AT-2W; Sun, 06 Mar 2022 04:36:03 +0000
Date: Sun, 6 Mar 2022 04:36:03 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [PATCH RFC] mm: Add f_ops->populate()
Message-ID: <YiQ6M/FsdHRV41DF@casper.infradead.org>
References: <20220306021534.83553-1-jarkko@kernel.org>
 <YiQjM7LdwoAWpC5L@casper.infradead.org> <YiQop71ABWm7hbMy@iki.fi>
 <YiQv7JEBPzgYUTTa@casper.infradead.org> <YiQ0aWhwY4BGLEMK@iki.fi>
 <YiQ2ThvkvnBBFRzD@casper.infradead.org> <YiQ30O/5LGh84z3t@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiQ30O/5LGh84z3t@iki.fi>
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
Cc: Nathaniel McCallum <nathaniel@profian.com>, linux-unionfs@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Reinette Chatre <reinette.chatre@intel.com>, codalist@coda.cs.cmu.edu,
 linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 06, 2022 at 06:25:52AM +0200, Jarkko Sakkinen wrote:
> > Are you deliberately avoiding the question?  I'm not asking about
> > implementation.  I'm asking about the semantics of MAP_POPULATE with
> > your driver.
> 
> No. I just noticed a bug in the guard from your comment that I wanted
> point out.
> 
> With the next version I post the corresponding change to the driver,
> in order to see this in context.

Oh, good grief.  Don't bother.  NAK.
