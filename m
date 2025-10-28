Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B177CC14F33
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3D310E3FF;
	Tue, 28 Oct 2025 13:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nbIWaBei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CEA10E3FB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 13:46:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9499248E48;
 Tue, 28 Oct 2025 13:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D961C4CEFD;
 Tue, 28 Oct 2025 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761659173;
 bh=LlBb+fjEXY7pk5bLYeRPSGKs235lp02bYGC9Yerww5s=;
 h=From:To:Cc:Subject:Date:From;
 b=nbIWaBeiEYMseuyMZPlLpTCcCAWZ+d4qj/0opPJvaTB2UecTlKEnY6AYxodojKA0d
 aFE6qBst7TuCBV7AxhcfHz30XbTxNSxPDF1JGJ2UWSOkwyxUFP1SXCpRUYMylpbOuJ
 5Q0smUVG9B+sThYBACe8XjEpLS71QsDLltnxN9+fU/KVq6DPtDYzjBHcfHj+ckGLOn
 cAX2xGsD+u8ObwTRKPDjk2BDQON/feCriS2me2CXM8oLBAIz4JfZW11p1NvXZPtENZ
 505iBHXpxsc41AfzpS3FSrLENLGuL/fQ7ale6Tpvo10kZtnJi15LyJM7GJsKtD0qfU
 md7OiTlGssrqA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/sched: Document potential forever-hang
Date: Tue, 28 Oct 2025 14:46:00 +0100
Message-ID: <20251028134602.94125-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While implementing a similar feature for drm_jobqueue I was looking for
inspiration in drm_sched and found this problem here. Now I have two
problems instead of one ^^'

Anyways, this is not a huge issue since it's unlikely to occur – but we
should document it.

Philipp Stanner (2):
  drm/sched: Fix comment in drm_sched_run_job_work()
  drm/sched: Add FIXME detailing potential hang

 drivers/gpu/drm/scheduler/sched_main.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

-- 
2.49.0

