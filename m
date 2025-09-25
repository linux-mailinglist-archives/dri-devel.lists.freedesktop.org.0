Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2E6BA012E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 16:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA85310E953;
	Thu, 25 Sep 2025 14:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcAVEzwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2911510E951;
 Thu, 25 Sep 2025 14:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758811902; x=1790347902;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=itDrxc/TcXnBOULL6eGeEvbOMWOPB5gMkVvr0xkGyBI=;
 b=GcAVEzwB/q+XgDJDe4Lp4YnKS9elRAy36VU6q2JMbzNfPqBItRv2ISX8
 jkDzfbG7iq8d0mNdg60IufSu60+yWspgsNSFsrVFULZPvFGfH0lD1KQD+
 va0KoDo+C5wDnOtk0wVYm2LH5wIC4sTi70lwjPjE5lhrbBi9JraYV/DDR
 K4f0Lu6EF9Pbt432V70wyIEF7FjMmWVdtMBpAoutynRlA6KVEW37AfbuZ
 bVxWt/0SH0KLYJP3GHel1ensdY0G4TFJ0V32flqm01cvWBZBnTt2sN500
 WQU0eLx7mE0DN0bFByGkg0wiznDDFRY5bbA7uwessLmk0dk2/cP7B9u1S Q==;
X-CSE-ConnectionGUID: Hfu1tvjZSomoZgazm6X9RA==
X-CSE-MsgGUID: 0J0N6jrWRxijIDEmXsP2jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72490882"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="72490882"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:51:42 -0700
X-CSE-ConnectionGUID: JCyi4401SvugapAIO+pfTA==
X-CSE-MsgGUID: pp83npX7SIKVS5JN4e0bCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="177743163"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 07:51:38 -0700
Date: Thu, 25 Sep 2025 16:51:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: adrinael@adrinael.net, arek@hiler.eu, juhapekka.heikkila@gmail.com,
 bhanuprakash.modem@gmail.com, ashutosh.dixit@intel.com,
 karthik.b.s@intel.com, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, steven.price@arm.com, aliceryhl@google.com,
 jeffv@google.com, intel-gfx@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 2/3] panthor: add initial infrastructure
Message-ID: <20250925145136.acjctff76tgonyrh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 adrinael@adrinael.net, arek@hiler.eu, juhapekka.heikkila@gmail.com,
 bhanuprakash.modem@gmail.com, ashutosh.dixit@intel.com,
 karthik.b.s@intel.com, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, steven.price@arm.com, aliceryhl@google.com,
 jeffv@google.com, intel-gfx@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250912181931.3738444-1-daniel.almeida@collabora.com>
 <20250912181931.3738444-3-daniel.almeida@collabora.com>
 <20250916121240.3e7eideofkifj2hd@kamilkon-DESK.igk.intel.com>
 <A6EF2C90-617D-4EE3-83E1-5D6CE3857F66@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A6EF2C90-617D-4EE3-83E1-5D6CE3857F66@collabora.com>
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

Hi Daniel,
On 2025-09-25 at 14:42:44 +0200, Daniel Almeida wrote:
> Hi Kamil,
> 
> > On 16 Sep 2025, at 14:12, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > 
> > Hi Daniel,
> > On 2025-09-12 at 15:19:29 -0300, Daniel Almeida wrote:
> >> Add the necessary code needed to compile panthor tests as well as the
> >> basic infrastructure that will be used by the Panthor tests themselves.
> >> 
> >> To make sure everything is in order, add a basic test in
> >> panthor_query.c.
> >> 
> >> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> >> ---
> >> lib/igt_panthor.c             | 41 +++++++++++++++++++++++++++++++++++
> >> lib/igt_panthor.h             | 12 ++++++++++
> >> lib/meson.build               |  1 +
> >> meson.build                   |  8 +++++++
> >> tests/meson.build             |  2 ++
> >> tests/panthor/meson.build     | 12 ++++++++++
> >> tests/panthor/panthor_query.c | 25 +++++++++++++++++++++
> >> 7 files changed, 101 insertions(+)
> >> create mode 100644 lib/igt_panthor.c
> >> create mode 100644 lib/igt_panthor.h
> >> create mode 100644 tests/panthor/meson.build
> >> create mode 100644 tests/panthor/panthor_query.c
> >> 
> >> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> >> new file mode 100644
> >> index 000000000..0b690f796
> >> --- /dev/null
> >> +++ b/lib/igt_panthor.c
> >> @@ -0,0 +1,41 @@
> >> +// SPDX-License-Identifier: MIT
> >> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> > 
> > We use SPD for licence because they are long texts. I do not
> > see any benefit of SPDX for copyright lines, it makes it even
> > longer than needed. It could stay if you want.
> > 
> > Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > Regards,
> > Kamil
> > 
> 
> I’d rather keep it. I tend to favor standardization and having a standard
> way to declare copyrights seems beneficial to me. What are the next steps here?
> Should I send a new version to pickup the tags, or can this be merged already?
> 
> Same for the other patch.
> 
> — Daniel
> 
> 
Will anyone familiar with Pathor do a full review or are you ok
with only my ack? If ack + tested-by is ok I could merge it.

Regards,
Kamil

