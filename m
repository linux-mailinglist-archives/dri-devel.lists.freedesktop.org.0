Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B3818DD90
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 02:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750736E23F;
	Sat, 21 Mar 2020 01:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD1D6E23F
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Mar 2020 01:58:31 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 230C120732;
 Sat, 21 Mar 2020 01:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584755910;
 bh=YEVYwaejFBzGEXNFaWiuLbxaJ4BGLIC5QyGZnjM/uo0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RZBrwTSPlNUeboMWDgxFW9/pgAyKTv7Gm65/9TZYqo4ptZco9VEBv8l6Zy+4cM+Pz
 +uW9uwS1Fw99/2H+5V1rLO1p1+Gx2g9+vL3832F6xKwF/XI58HVnn4IrgpwkQ6CGrq
 r4Ytpzf2jx53HjebxJSlXnwiE12m7WCG5ocoakYA=
Date: Fri, 20 Mar 2020 18:58:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= (VMware) <thomas_os@shipmail.org>
Subject: Re: Ack to merge through DRM? WAS [PATCH v6 0/9] Huge page-table
 entries for TTM
Message-Id: <20200320185829.2e4fc07db5610999e7b32d7e@linux-foundation.org>
In-Reply-To: <5054bb71-b5b4-11a9-1c4e-487a7adf3177@shipmail.org>
References: <20200304102840.2801-1-thomas_os@shipmail.org>
 <9eb1acd3-cded-65f0-ed75-10173dc3a41c@shipmail.org>
 <20200318162721.9b8a4d0ef7036ad93261f859@linux-foundation.org>
 <5054bb71-b5b4-11a9-1c4e-487a7adf3177@shipmail.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Mar 2020 11:20:44 +0100 Thomas Hellstr=F6m (VMware) <thomas_os@s=
hipmail.org> wrote:

> On 3/19/20 12:27 AM, Andrew Morton wrote:
> > On Mon, 16 Mar 2020 13:32:08 +0100 Thomas Hellstr=F6m (VMware) <thomas_=
os@shipmail.org> wrote:
> >
> >>> _______________________________________________
> >>> dri-devel mailing list
> >>> dri-devel@lists.freedesktop.org
> >>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >> Andrew, would it be possible to have an ack for merge using a DRM tree
> >> for the -mm patches?
> > Yes, please do.  It's all pretty straightforward addition of new
> > functionality which won't affect existing code.
> =

> Thanks Andrew. Can I add your Acked-by: To the mm patches for Linus' =

> reference?
> =


Please do.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
