Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9408679D9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5613D10E772;
	Mon, 26 Feb 2024 15:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BT4N6xhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C51D10E778
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 15:16:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 798D3611B3;
 Mon, 26 Feb 2024 15:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8BDC433C7;
 Mon, 26 Feb 2024 15:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708960599;
 bh=wG6ILW9J76NMvhlWMdzo6j9cvt1pXIwJxxeQn/w1fh4=;
 h=From:To:Cc:Subject:Date:From;
 b=BT4N6xhCMliOJaKO/J5QdqT8aAP0UuE5SUOJgKoluLLZu5KVUN9kBJnZUJTPLyLZ4
 vcGuNBz0K/rJbYCylR1aXjayEpn+49mSYoBokJ7s+Mu66C5uzRXto37Ii8Qz5Sw9rM
 8VUe4/RQHctyYqDlRydHn9FIOsIU2ketNJB89OkQ072LjnQIytiPyyLsrSOJJHW/NX
 eafL8ev9CweC7fkxhk+oflPv6dYrZ2jeyQn8/NulPsgBTmrVSEMn9J34uiVOpv60y3
 6ZnVpp/XWvkgNHbyZYeOHZ7n+jKp0FC2bJUcZ8BwnTAIitiOhtjxHsEACvWJleG0BV
 25b42qcka2KxQ==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
	David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [rerere PATCH] nightly.conf: Switch drm.git to gitlab
Date: Mon, 26 Feb 2024 16:16:31 +0100
Message-ID: <20240226151631.130754-1-mripard@kernel.org>
X-Mailer: git-send-email 2.43.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Start the big migration with drm.git.

Existing remotes need to be adjusted with

git remote set-url drm ssh://git@gitlab.freedesktop.org:drm/kernel.git

or

git remote set-url drm https://gitlab.freedesktop.org/drm/kernel.git

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 nightly.conf | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/nightly.conf b/nightly.conf
index c189f2ccad17..68ac687a5c7f 100644
--- a/nightly.conf
+++ b/nightly.conf
@@ -45,10 +45,8 @@ https://anongit.freedesktop.org/git/drm/drm-misc
 https://anongit.freedesktop.org/git/drm/drm-misc.git
 "
 drm_tip_repos[drm]="
-ssh://git.freedesktop.org/git/drm/drm
-git://anongit.freedesktop.org/drm/drm
-https://anongit.freedesktop.org/git/drm/drm
-https://anongit.freedesktop.org/git/drm/drm.git
+https://gitlab.freedesktop.org/drm/kernel.git
+ssh://git@gitlab.freedesktop.org:drm/kernel.git
 "
 drm_tip_repos[linux-upstream]="
 git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
-- 
2.43.2

