Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E275847D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 20:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFF410E3B9;
	Tue, 18 Jul 2023 18:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F0310E3B9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 18:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 2D6E0414D9;
 Tue, 18 Jul 2023 20:19:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hWmI46mZq8rj; Tue, 18 Jul 2023 20:19:19 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1689704358; bh=2unuaUUBzkJ1ke9rHzkXWZSFjQ+6AAdbMfmqOa2pkbE=;
 h=From:To:Cc:Subject:Date;
 b=UU5qHWPYkTIRpNNzYGeOn5g9DgnRZvtK5wEWPDFbM/NRojgcMlKWhL7AXnkEsxdJZ
 iDlYtLaXjuSnfowW1h8lQXRyZFWyR9lXSc/PcG0okXZVDtSToA9F6SYxiy4Dnu31Co
 UfdVyk1LPRdGss9Gdhbonp5qZGHcApGsgb6pUZYYlT4iAkbCrwehCVPWv3VoUtwTb4
 +kFrztaJf9tvPb1ZMo5w2T8nGYdNkGN/f0uqESaAhCmRovKTB8bUK9S3UvC0s7PICZ
 5hCRZPAKKR+lQTl0CXf4mI1lJE0lCjGVKvsLZ37zvKu/Zi/+LBl3uo23qXhSbm8IzS
 XznynG2+wkXCg==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] Add documentation and KUnit tests for functions on
 drm_framebuffer.c
Date: Tue, 18 Jul 2023 15:17:22 -0300
Message-ID: <20230718181726.3799-1-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: andrealmeid@igalia.com, tzimmermann@suse.de, tales.aparecida@gmail.com,
 mripard@kernel.org, mairacanal@riseup.net,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>, davidgow@google.com,
 michal.winiarski@intel.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds documentation and unit tests for
drm_framebuffer_check_src_coords() and drm_internal_framebuffer_create()
functions on drm_framebuffer.c, including new parameters to the, until
then, only existent test.

Many thanks,
Carlos

---

v2:
    - Replaced strcpy to strscpy (Maxime)
    - Added comments (Maxime)
    - Ordered KUNIT_CASE_PARAM alphabetically (Maxime)
    - Replaced some parameter cases description with more verbose ones

---

Carlos Eduardo Gallo Filho (4):
  drm: Add kernel-doc for drm_framebuffer_check_src_coords()
  drm/tests: Add test for drm_framebuffer_check_src_coords()
  drm/tests: Add parameters to the drm_test_framebuffer_create test
  drm/tests: Add test case for drm_internal_framebuffer_create()

 drivers/gpu/drm/drm_framebuffer.c            |  16 +-
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 178 ++++++++++++++++++-
 2 files changed, 192 insertions(+), 2 deletions(-)

-- 
2.41.0

