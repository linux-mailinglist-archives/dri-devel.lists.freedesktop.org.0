Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4344166D6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 22:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BCF6E102;
	Thu, 23 Sep 2021 20:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188CB6E102
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3tKQMrIJ551WGJlqF6WtKU9DV9+1deJXwM7B3gltK04=; b=RFNGvxVdqQH96jAQBBR1dSwCc7
 lPm22qhq3ZwZLbi6zTeNqbkuLzmHbTs2b4c8rD9zAio4MSkiIBB3iDy09Gsu6rfOuBhNoatEu4tYN
 EVjzc9LJ967Rn1bn23bB4e3GO6chcT/eIDKLHxmMDXXgLSdvzRbdfeMAmYInXN7muCybZb+IyJRyD
 shJWHk11wivMyROMfOZw3f9iXCYWHkigxz7JmjEeFHmYswFD9eRo9sCP396hVbQmoAT3KIoQeM6EW
 atUvyJ3d1sZARPKx1m79X86ueMUDc6Xh5CniGLbNFWA0VkDNJsaFp8F5IqU3T6USizHoAZBCSfgXi
 iaKgp4Vw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mTVUs-006L13-Bp; Thu, 23 Sep 2021 20:39:17 +0000
Date: Thu, 23 Sep 2021 21:39:10 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: Linux MM <linux-mm@kvack.org>, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>,
 Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Theodore Ts'o <tytso@mit.edu>, Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 Peter Zijlstra <peterz@infradead.org>,
 "Phillips, Daniel" <Daniel.Phillips@amd.com>,
 "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: Re: BoF at LPC: Documenting the Heterogeneous Memory Model
 Architecture
Message-ID: <YUzl7qywbtVHipUT@casper.infradead.org>
References: <23aeacb6-0cd9-d10f-76bc-3c9d33905daa@amd.com>
 <ca132183-e778-4a86-c81e-4d292e9d41a7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca132183-e778-4a86-c81e-4d292e9d41a7@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 23, 2021 at 04:25:08PM -0400, Felix Kuehling wrote:
> Change of plan: Instead of a BoF, this is now a session in the "GPU/media/AI
> buffer management and interop MC" micro conference. Thank you Daniel Stone
> for making that happen.
> https://linuxplumbersconf.org/event/11/contributions/1112/
> 
> It is scheduled for tomorrow (Friday) 08:40-10:00 Pacific, 11:40-13:00
> Eastern, 15:40-17:00 UTC.

That's up against:

 Direct map management
Vlastimil Babka, Mike Rapoport, Rick Edgecombe  11:30-12:15.

Seems like a lot of the same people would want to be in both sessions.
Maybe one could be moved?
