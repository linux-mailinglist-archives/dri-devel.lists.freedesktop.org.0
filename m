Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812535772A2
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 03:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A819D112054;
	Sun, 17 Jul 2022 01:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A973E112054
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 01:03:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA798B80D25;
 Sun, 17 Jul 2022 01:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3D9C34114;
 Sun, 17 Jul 2022 01:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1658019800;
 bh=6lc/voAQIIG/VXdHbLyxYL355ctKMSS9UlOTlBJJc5M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Sw9ul5PuP/4fE7uKc3VlIVRaBEoakbFDaYCGWJHTFjycO+AgF6qNbNi5u2iBJeXDp
 sYnWDsGhwiTkyThp5t5aQ0C/lMHv6VuJ0Z6rME8aCGUX4MXpTjLcr+Kletb3vec3he
 80zU0cipj0Hxdfz/9huBPSv3Dls8N5M6qQ90iIlY=
Date: Sat, 16 Jul 2022 18:03:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 4662b7adea50bb62e993a67f611f3be625d3df0d
Message-Id: <20220716180319.dcb09d8ce9519368695c1108@linux-foundation.org>
In-Reply-To: <62cf77c3.3T/sxYUjJq0ImGp4%lkp@intel.com>
References: <62cf77c3.3T/sxYUjJq0ImGp4%lkp@intel.com>
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
Cc: kvm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-can@vger.kernel.org, linux-mm@kvack.org,
 Liam Howlett <liam.howlett@oracle.com>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Jul 2022 09:56:19 +0800 kernel test robot <lkp@intel.com> wrote:

> lib/maple_tree.c:1522:52: warning: Parameter 'gaps' can be declared with const [constParameter]
> lib/maple_tree.c:1871:21: warning: Array index 'split' is used before limits check. [arrayIndexThenCheck]
> lib/maple_tree.c:2033:55: warning: Parameter 'mas' can be declared with const [constParameter]
> lib/maple_tree.c:2426:8: warning: Redundant initialization for 'r_tmp'. The initialized value is overwritten before it is read. [redundantInitialization]
> lib/maple_tree.c:2427:8: warning: Redundant initialization for 'l_tmp'. The initialized value is overwritten before it is read. [redundantInitialization]
> lib/maple_tree.c:3160:22: warning: Found suspicious operator ',' [constStatement]
> lib/maple_tree.c:3208:11: warning: Size of pointer 'pivs' used instead of size of its data. [pointerSize]
> lib/maple_tree.c:326:2: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
> lib/maple_tree.c:4266:15: warning: The if condition is the same as the previous if condition [duplicateCondition]
> lib/maple_tree.c:4302:23: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
> lib/maple_tree.c:694:59: warning: Parameter 'pivots' can be declared with const [constParameter]
> lib/test_printf.c:415:11: warning: Local variable 'addr' shadows outer function [shadowFunction]
> mm/highmem.c:737:13: warning: Uninitialized variable: pam->page [uninitvar]
> mm/migrate.c:355:53: warning: Parameter 'mapping' can be declared with const [constParameter]
> mm/migrate.c:875:7: warning: Redundant initialization for 'rc'. The initialized value is overwritten before it is read. [redundantInitialization]
> mm/mlock.c:230:20: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
> mm/slab.c:1635:24: warning: Uninitialized variables: slab.__page_flags, slab.__unused_1, slab.freelist, slab.units, slab.__unused_2, slab.__page_refcount [uninitvar]
> mm/slab.c:3289:7: warning: Redundant assignment of 'objp' to itself. [selfAssignment]
> mm/slab.c:3509:8: warning: Redundant assignment of 'p[i]' to itself. [selfAssignment]
> mm/slab.c:405:9: warning: Local variable 'slab_size' shadows outer function [shadowFunction]
> mm/vmstat.c:1409:53: warning: Parameter 'pos' can be declared with const [constParameter]
> mm/vmstat.c:1650:68: warning: Parameter 'zone' can be declared with const [constParameter]
> mm/zsmalloc.c:2019:15: warning: Uninitialized variables: zspage.huge, zspage.fullness, zspage.class, zspage.isolated, zspage.magic, zspage.inuse, zspage.freeobj, zspage.first_page, zspage.lock [uninitvar]
> mm/zsmalloc.c:2060:16: warning: Local variable 'obj_allocated' shadows outer function [shadowFunction]

urgh, thanks, lots of stuff to go through here.

Liam, I suggest we worry about the mapletree things at a later time ;)
