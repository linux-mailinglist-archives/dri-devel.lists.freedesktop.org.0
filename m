Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BE0A3E0A6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5925A10E9AB;
	Thu, 20 Feb 2025 16:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EXwVsrVK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7B410E9AB;
 Thu, 20 Feb 2025 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eotf4X4yWZCzZmmNzhXG8/clvYwDsnXoUd843iZILzc=; b=EXwVsrVKDlIdDfrYtaclqkAmk8
 CmeyvQU4fIFXtUP33OM6F19wpmb9YLeN6Vlm4C4XjofRWhUK5tTm4IJdiU+Bjq0OKBFdl1vYC8veS
 bcrYzHSiVAXWQTFjsgT619Lpwo2lS/PQ923paHY1/aM3MW/3jUlFUPA7nlGbREPMoRNcxU8rlTXyG
 R323O9tTjaXe52O0Jr3BveZKgHGP/JlV5IOS+7bzf1bVWoatKzpn95XrPN8JHiHMcjiQ1O9TnwXSM
 ewWRT9OwV0qVBZjoXn5eGihVp0zUzu2uk3FNEoYa9nF3dCgMpJqy579onIC6gQEYaMz04npjEoH+j
 JTQZkPVA==;
Received: from [191.204.194.148] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tl9Ow-00FS04-Lg; Thu, 20 Feb 2025 17:27:56 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, siqueira@igalia.com
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v2 0/3] drm/amdgpu: Small reset improvements
Date: Thu, 20 Feb 2025 13:27:47 -0300
Message-ID: <20250220162750.343139-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.48.1
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

This series does some small improvements to GPU reset information collection.

v2: Keep the wedge event in amdgpu_device_gpu_recover() and add and
    extra check to avoid triggering two events.

André Almeida (3):
  drm/amdgpu: Log the creation of a coredump file
  drm/amdgpu: Log after a successful ring reset
  drm/amdgpu: Trigger a wedged event for every type of reset

 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       | 21 ++++++++++++-------
 2 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.48.1

