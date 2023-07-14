Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99375423E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 20:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213AB10E086;
	Fri, 14 Jul 2023 18:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3560A10E086
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 18:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 4871D4135D;
 Fri, 14 Jul 2023 20:08:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZILn8AJWfuD; Fri, 14 Jul 2023 20:08:20 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1689358100; bh=AyD4lZf37oJAOUxjf86oxTBDGjNewXjocJ9cZ6ds8Qg=;
 h=From:To:Cc:Subject:Date;
 b=fhm8bllji3lR9oQsZJaji6dvsAu8nuYuPpL4rhXz6Zh2ffKaz64C27W4BLyAON4E4
 EreUSMfs/ZU9oSvvA1KiqOWdHe9ndYKLCPv/AWKZ6X7MtRH6XnMnQWTMhuX/J/G/IP
 UhzSIR2ydRSd68tS7l0LDrnpPaAkYiZmIrVTwhDAEAeGJeQEi0oWQ9qXNJNVhM/ZAN
 ywEolaIX7m9419vb7l67/ageBnY9QEcQNY0Ulf+UlF/OZqPisGZ1L5deFZ2APwZAEe
 iHyiy2jtNOMQqWQnhE9nlc4tpckWyg2c1h9IuaixUoMsxxbMfNXa8HrurTUKbkF8ck
 bbwkhGTbdbe0g==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] Add documentation and KUnit tests for functions on
 drm_framebuffer.c
Date: Fri, 14 Jul 2023 15:06:15 -0300
Message-ID: <20230714180619.15850-1-gcarlos@disroot.org>
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

Carlos Eduardo Gallo Filho (4):
  drm: Add kernel-doc for drm_framebuffer_check_src_coords()
  drm/tests: Add test for drm_framebuffer_check_src_coords()
  drm/tests: Add parameters to the drm_test_framebuffer_create test
  drm/tests: Add test case for drm_internal_framebuffer_create()

 drivers/gpu/drm/drm_framebuffer.c            |  16 +-
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 149 +++++++++++++++++++
 2 files changed, 164 insertions(+), 1 deletion(-)

-- 
2.41.0

