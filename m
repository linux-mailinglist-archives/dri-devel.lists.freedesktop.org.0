Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9EB7E7DD7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 17:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E116C10E119;
	Fri, 10 Nov 2023 16:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A1710E0CD;
 Fri, 10 Nov 2023 16:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uffhhOub3wQ/yKz/mQn5/txkTtSa80EFiqctxpL3IrI=; b=q4EqI2Bx08GGtv6aA+0GAbsPq5
 WyqwXRt8DlckUnnjxSXZOv7GIBs0B4TlWTvLv8ofH3NLlEEGb4hqan7+PROt9CtkYIzq3pm2foAtB
 haOf3Ymq+HxaiSOTKH1Iop0OJLvQG3VVMzDpAU+lKSNTRJHM8gfSrTtjXwjuO8qQEQpLMYC8mcB2P
 s9V1+TkyF/a1cxBDqlnoampsxr97HVx7c2OEGUR7HM+yTnC8mFrKF839jWYZg5AglrGD5EqzSsGxa
 APTzDkHyTPUrMsr6MgQSxfVLlaKivmQDklvnprvdUlPRvHBbNB0Rz3PPlESq4HWV6rklt/Fy06Zi0
 lVmRsK2Q==;
Received: from pool-96-246-156-208.nycmny.fios.verizon.net ([96.246.156.208]
 helo=X1.myfiosgateway.com) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r1UWN-001hxO-IV; Fri, 10 Nov 2023 17:38:15 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, contact@emersion.fr,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] Add test for atomic async page flip
Date: Fri, 10 Nov 2023 11:38:09 -0500
Message-ID: <20231110163811.24158-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds tests for async page flip for DRM Atomic API. Kernel patches:
https://lore.kernel.org/dri-devel/20231025005318.293690-1-andrealmeid@igalia.com/

André Almeida (1):
  tests/kms_async_flips: Add test for atomic prop changes

Simon Ser (1):
  tests/kms_async_flips: add atomic test

 include/drm-uapi/drm.h  |   8 +++
 tests/kms_async_flips.c | 105 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

-- 
2.42.1

