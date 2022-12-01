Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7FC63FBBA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 00:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F07D10E684;
	Thu,  1 Dec 2022 23:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1257810E684
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 23:12:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9F142CE1DCC;
 Thu,  1 Dec 2022 23:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16768C433C1;
 Thu,  1 Dec 2022 23:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1669936341;
 bh=edIThsRidex8fbJz68mBlOwb6JtXO7RHbQdCrilbD2A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XQoMqD7P287J4tXoAX4GpDndW13s1Jy7uwWEaF2I46mnhcrsyWrjUgI8PEYHsBEHD
 3eo70ZQSoxt54NZHbf7vbW5TfHtkDLtQEbDjSnD2gtbhIB8QS8VbanAaAvDjFirG8q
 4sR93Xngv9Ri8x6DgLZ7wWFiMNa8jKYHGDQHN+FM=
Date: Thu, 1 Dec 2022 15:12:20 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] mm/memremap: Introduce pgmap_request_folio() using
 pgmap offsets
Message-Id: <20221201151220.10408e67b4949ea307492e79@linux-foundation.org>
In-Reply-To: <6387f3dabd16e_c95729461@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <166630293549.1017198.3833687373550679565.stgit@dwillia2-xfh.jf.intel.com>
 <Y1wgdp/uaoF70bmk@nvidia.com>
 <6387f3dabd16e_c95729461@dwillia2-mobl3.amr.corp.intel.com.notmuch>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, nvdimm@lists.linux.dev, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Jan Kara <jack@suse.cz>,
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 "Darrick J. Wong" <djwong@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alistair Popple <apopple@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-mm@kvack.org,
 =?ISO-8859-1?Q?J=E9r?= =?ISO-8859-1?Q?=F4me?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Nov 2022 16:22:50 -0800 Dan Williams <dan.j.williams@intel.com> wrote:

> I think since there is no urgent need for this series to move forward in
> v6.2 I can take the time to kill the need for pfn_to_pgmap_offset() and
> circle back for this in v6.3.

I'll drop v3 of "Fix the DAX-gup mistake" and "mm/memremap: Introduce
pgmap_request_folio() using pgmap offsets".

a) because Stephen says "no next-next material in next" and

b) because its presence in -next might invalidate testing of other
   things we have queued for the next merge window.



