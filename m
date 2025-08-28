Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA6DB39E10
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 15:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566E989FA5;
	Thu, 28 Aug 2025 13:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="dLrzlf2v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB5C89FA5;
 Thu, 28 Aug 2025 13:04:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756386268; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=csnNT2V5O/weQ37OjUKmud7xFK5iN6x4+NYeN2hT6TLerMpt2vINqpus/GI6nwvUWQgQm5AytDKke7xLBwFhtbvd+5cWoMffx5olUhInKGrRi40zLqhpmnkmV91Cs/9QH5m5JWbjWsB8Q9YvlxOvpXkJ2lWjX/U4kuYJGPRDKCc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756386268;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=oB8UEk1UXs11oWU5zM1XCwjRVX/YkLCvELRxa6BXhUw=; 
 b=jqipcGR9jQyj1ZvKNqJhTVJ7Z3XvXrmN9JQAsyz1dQNhHk6kmfmTjc3FkFWzIwRxWA04O82ZAmMt/x56lOPTZvhiwEFb1MWeb8W2jnwKApmM4vjGEpGwl42GdKYVCnIy39hT5BZdutO31UEZ3LzgLco6oppgFpQ7JKaBBclQkDY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756386268; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=oB8UEk1UXs11oWU5zM1XCwjRVX/YkLCvELRxa6BXhUw=;
 b=dLrzlf2vwUi/DFw1kext2roHGWwzy6XLGNKZPptYBYvKnxxkT/IxR3+s9AMSHMLd
 SoaVHu3r3jg76pntd9nnnxIdZz7T6MXbiBFfSvi7v1p3h6Iah3rrCtNOHsrznBFlkBz
 zMZZXjtbBW+t1v7JJeJeFzxGC9xOnhcE0uhcaCcg=
Received: by mx.zohomail.com with SMTPS id 1756386266810603.6137903602568;
 Thu, 28 Aug 2025 06:04:26 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t 0/4] Add initial Panthor tests
Date: Thu, 28 Aug 2025 10:03:56 -0300
Message-ID: <20250828130402.2549948-1-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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


This series adds basic Panthor tests. In particular, these are being
used to test both Panthor and Tyr, i.e.: the new Rust GPU driver that
implements Panthor's uAPI. Most of the initial tests were chosen in
order to have something to test Tyr with, but this series lays the
groundwork so that more interesting tests can be added to test more of
Panthor itself.

Also, please note that this is my first IGT patch, so apologies in
advance in case I forgot to follow any IGT-specific workflow when
submitting this. I don't see a checkpatch.pl equivalent, so there was
nothing to check this submission with as far as I am aware.

Daniel Almeida (4):
  lib: add support for opening Panthor devices
  tests: panthor: add initial infrastructure
  lib: initial panthor infrastructure
  tests/panthor: add panthor tests

 lib/drmtest.c                 |   1 +
 lib/drmtest.h                 |   1 +
 lib/igt_panthor.c             | 150 +++++++++++++++++++
 lib/igt_panthor.h             |  28 ++++
 lib/meson.build               |   1 +
 meson.build                   |   8 ++
 tests/meson.build             |   2 +
 tests/panthor/meson.build     |  15 ++
 tests/panthor/panthor_gem.c   |  59 ++++++++
 tests/panthor/panthor_group.c | 264 ++++++++++++++++++++++++++++++++++
 tests/panthor/panthor_query.c |  25 ++++
 tests/panthor/panthor_vm.c    |  73 ++++++++++
 12 files changed, 627 insertions(+)
 create mode 100644 lib/igt_panthor.c
 create mode 100644 lib/igt_panthor.h
 create mode 100644 tests/panthor/meson.build
 create mode 100644 tests/panthor/panthor_gem.c
 create mode 100644 tests/panthor/panthor_group.c
 create mode 100644 tests/panthor/panthor_query.c
 create mode 100644 tests/panthor/panthor_vm.c

-- 
2.50.1

