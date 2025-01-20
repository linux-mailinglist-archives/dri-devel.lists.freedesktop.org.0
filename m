Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8414BA170EA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F221910E08A;
	Mon, 20 Jan 2025 17:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eR9xbyjD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A2B10E08A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8kx3CfAHUDi/n2vF1w4I3BPdZbxMPaSjM4G3GSVciEI=; b=eR9xbyjDLbZ5TZuUPCC5Ua8KjT
 ETrmInW7qT5ydUCx7Hz+1/oaLbEW06SKruzt+ulfqhrTGNtLiWENDb2e+anWi3nkhKk6SrMvx5x+U
 MfdYDpclQFArZNlGd2oUoo7RDsj66+Hsz79IDD0XNLuHVQgxxJnOucPySo0mj9Px3z1XF+EYgs/fN
 epfPlZE5v/AeL9j5JEdNuChGVt+9TV6tHDkarJjYFJm9iqLN1PQshXs2sUjGnHEJtSubRR0Z+RHt5
 tjCk9Zp8i47MrbXXkwvIjpnDvtujW6F8whgIzgGZ+9LyI2GTQ0IG5Wq2PTnW04dxyDWDak3p8K3Vg
 8ynyTnPw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tZv8R-000vV9-4w; Mon, 20 Jan 2025 18:00:23 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 0/2] Some entity selection streamlining
Date: Mon, 20 Jan 2025 17:00:18 +0000
Message-ID: <20250120170020.9186-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
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

Two patches extracted from my deadline scheduler RFC. I think they are making
the entity selection logic a bit easier on the eyes but as opinions may vary
please have a look and see what you think.

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>

Tvrtko Ursulin (2):
  drm/sched: Clarify locked section in drm_sched_rq_select_entity_fifo
  drm/sched: Consolidate drm_sched_rq_select_entity_rr

 drivers/gpu/drm/scheduler/sched_main.c | 79 ++++++++++++--------------
 1 file changed, 37 insertions(+), 42 deletions(-)

-- 
2.47.1

