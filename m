Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAAEA4987E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2C110EC69;
	Fri, 28 Feb 2025 11:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rz.uni-freiburg.de header.i=@rz.uni-freiburg.de header.b="Tl235hVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c1422.mx.srv.dfn.de (c1422.mx.srv.dfn.de [194.95.239.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11B410EAA1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 rz.uni-freiburg.de; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received; s=s1; t=1740654236; x=1742468637;
 bh=mZHf/5mA+it8u9rABQpoXpNp2EGQfobBJtDxxa+otXs=; b=Tl235hVV0Nai
 VJz55e6rB9iQs76Cq1biPoiJFvVCUq4KfzgOL5TQnWNibYH2lByrqOJJ/Bnmysir
 5tGbs+av+J42NoGNlSlDloXo3qhbxt1jH2YINnu8ktyvbX1/AHYylpBb2hVQ/58/
 N0UcsBbgoIAjNPEo/slxF7vCPyKsG8U=
Received: from fe1.uni-freiburg.de (fe1.uni-freiburg.de [132.230.2.221])
 by c1422.mx.srv.dfn.de (Postfix) with ESMTP id 30FC42C013F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 12:03:56 +0100 (CET)
Received: from [2001:7c0:2517:a:4b56:9ec4:d188:b1a0] (account
 michael.scherle@rz.uni-freiburg.de HELO rz-10-126-20-105.eduroam-rz.privat)
 by mail.uni-freiburg.de (CommuniGate Pro SMTP 6.3.19)
 with ESMTPSA id 46276626; Thu, 27 Feb 2025 12:03:50 +0100
From: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
To: dri-devel@lists.freedesktop.org
Cc: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
Subject: [PATCH 08/10] Update spice-common submodule
Date: Thu, 27 Feb 2025 12:03:30 +0100
Message-ID: <23dcc5422093345fab0b9c8122fc807d5243a41f.1740651328.git.michael.scherle@rz.uni-freiburg.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740651328.git.michael.scherle@rz.uni-freiburg.de>
References: <cover.1740651328.git.michael.scherle@rz.uni-freiburg.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Feb 2025 11:42:15 +0000
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

This brings in the following changes:
      common: Add a udev helper to identify GPU Vendor
      build: Avoid Meson warning
      Drop Python 2 from m4/spice-deps.m4
      Stop using Python six package
      codegen: Use context manager when opening files

Signed-off-by: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
---
 subprojects/spice-common | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/subprojects/spice-common b/subprojects/spice-common
index 58d375e5..8c0319e3 160000
--- a/subprojects/spice-common
+++ b/subprojects/spice-common
@@ -1 +1 @@
-Subproject commit 58d375e5eadc6fb9e587e99fd81adcb95d01e8d6
+Subproject commit 8c0319e31df967e41c74f4121cbdb3b785fe114e
-- 
2.48.1

