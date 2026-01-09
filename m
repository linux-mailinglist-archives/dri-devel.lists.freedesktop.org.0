Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEBAD0BDD8
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A9410E91F;
	Fri,  9 Jan 2026 18:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cKq/4w7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7884210E91F;
 Fri,  9 Jan 2026 18:37:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A08460160;
 Fri,  9 Jan 2026 18:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602F1C4CEF7;
 Fri,  9 Jan 2026 18:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1767983862;
 bh=ARzqSTrB4mFRoJEjpwqfD7XvlHCDD3ZE6XeoURLYd8g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cKq/4w7gGX95/qxZpKSvwIsa09ufoQFCR4/Y9FL0I8olI1SnCnQzQpwg1S3mCWVVs
 fajeQx6jMNNGo8G7kMsAbEd0MC7fMHF/ztwPL66zbVw9ppWO5gaoYQ86zcxHeG59MP
 FlZEs7fuDVbcUF9xgvE6Fs9QTch66UtAMgMDUxjk=
Date: Fri, 9 Jan 2026 10:37:41 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Matthew
 Brost <matthew.brost@intel.com>, Balbir Singh <balbirs@nvidia.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 1/7] mm: Add folio_split_unref helper
Message-Id: <20260109103741.533c1b807f3ccf9a6f0264de@linux-foundation.org>
In-Reply-To: <59fb1669-2908-4cab-b3c0-b97479da3fb9@kernel.org>
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-2-francois.dugast@intel.com>
 <59fb1669-2908-4cab-b3c0-b97479da3fb9@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 9 Jan 2026 14:19:16 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:

> I'm not CCed on the other patches in the series or the cover letter, so 
> I don't see the context.

Both linux-mm and I received a random subset of this series.  Something
went wrong.
