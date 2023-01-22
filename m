Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA9A6772C1
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 22:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DBB10E2FF;
	Sun, 22 Jan 2023 21:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D5B10E2E1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 21:36:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F44BB80B6A;
 Sun, 22 Jan 2023 21:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2893CC433A1;
 Sun, 22 Jan 2023 21:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674423417;
 bh=mjT5HyfVWuQ9qPsnmeirI8u/EIvVyfvfGP/qw6kfgyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l1BlawAvBv+/slEpknH0YdhR1WriSmtSkV5iz/dLWTjuMJjkx/UdwtFlylB/RAYG/
 bD+tEs0zj+Xt0hIDVu4xN7kexsT2TvRoMusUQUzt4tNQ517VpQM4KMENQDijNXVq90
 NJBYzoOdrZQIGw7I513XlUwLPWbp+Cdiq/QSpwlCEYwLWzWJdfnkmkr7tKi7WnmVUt
 ZGbz2S+2OVbEc57nqQBxYXX4NKb3X+IU1ioB+xnLSJGJP9O2RT4KjFRqWuuCjEhd5m
 dvSs3ukw2W9Y+CPYEM+liZipLWrWv9joFP2Uc3Neu1bCZewcWAzkmrCX6M0k/lgiAE
 4QFNiG02isuKw==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 3/8] Docs/gpu/index: Add missing SPDX License Identifier
Date: Sun, 22 Jan 2023 21:36:45 +0000
Message-Id: <20230122213650.187710-4-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230122213650.187710-1-sj@kernel.org>
References: <20230122213650.187710-1-sj@kernel.org>
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
Cc: SeongJae Park <sj@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing SPDX License Identifier for gpu documentation index file.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/gpu/index.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index eee5996acf2c..9a6c7831d7fe 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: MIT
+
 ============================
 GPU Driver Developer's Guide
 ============================
-- 
2.25.1

