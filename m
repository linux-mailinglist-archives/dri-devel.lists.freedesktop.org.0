Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2870581A10
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 21:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A561D99B3A;
	Tue, 26 Jul 2022 19:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CDE99B8C;
 Tue, 26 Jul 2022 19:05:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 90DD9B819BF;
 Tue, 26 Jul 2022 19:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7469C433C1;
 Tue, 26 Jul 2022 19:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1658862306;
 bh=8HO1+0RNEW20BOdzYYpK3e0czzp1ctqmJl8m1mL5930=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jtWtbCvK3nAkuqT2HuiCQ7VGsG6UUqOPsV6eZjfDx6mo6ENgUYGB52rsb2vBlQWwz
 w2cz8xupjrK9I0ISykF/uaB+onTvwra4lMAK6ilCsMeHDnXFebfJemPcSOKKQIAeVv
 eDoEcuJScyoa0uvCKR+qZSe8ejnDGj1gw5J79dF0=
Date: Tue, 26 Jul 2022 12:05:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Subject: Re: [PATCH v9 06/14] mm/gup: migrate device coherent pages when
 pinning instead of failing
Message-Id: <20220726120504.39498eff3843baf1d8fd5168@linux-foundation.org>
In-Reply-To: <adb2031b-774d-e645-2aec-f9de433b0a7c@amd.com>
References: <20220715150521.18165-1-alex.sierra@amd.com>
 <20220715150521.18165-7-alex.sierra@amd.com>
 <225554c2-9174-555e-ddc0-df95c39211bc@redhat.com>
 <20220718133235.4fdbd6ec303219e5a3ba49cf@linux-foundation.org>
 <adb2031b-774d-e645-2aec-f9de433b0a7c@amd.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: rcampbell@nvidia.com, willy@infradead.org,
 David Hildenbrand <david@redhat.com>, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Jul 2022 21:22:06 -0500 "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com> wrote:

> >> a) add the || to the end of the previous line
> >> b) indent such the we have a nice-to-read alignment
> >>
> >> if (!list_empty(&movable_page_list) || isolation_error_count ||
> >>      coherent_pages)
> >>
> > I missed that.  This series is now in mm-stable so any fix will need to
> > be a standalone followup patch, please.
> Hi Andrew,
> Just wanted to make sure nothing is missing from our side to merge this 
> patch series.

It's queued in mm-stable and all looks good for a 5.20-rc1 merge.
