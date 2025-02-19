Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F720A3CB88
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 22:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152A510E069;
	Wed, 19 Feb 2025 21:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U64rNfDn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C1B10E069;
 Wed, 19 Feb 2025 21:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jFbysj/kIakJJpsBhVzm0lzhdukBPqOgudq9jwi4AQA=; b=U64rNfDnyyZ+BnFjQdkFPvHEV3
 As0d9KYr+SI/IvRWMCW0DMvqD3wnUHiNPVf21JKYZIgjAIONznBrPyaeXSVlQCputB7yO3NNI6kLH
 2AQ5RG6ETjQ8zdarAyf/cZugSL/q4GLPOp/ccmpUHWLVOlGhx7eDrujE/7SzSSOpyAUAyN5Vs3+WX
 knd+hrtyUceIN4ZfwTUCwRJOQREwsLGKB4B9xwxwSqzlwWxJPcMaWyZul8Ln4DCpZJ9MPVRtyHmXl
 JQwLwp/25KZcPDJiMyVg/Tmk1C5hjw8jZV2fPmI5Rz8MMiy4Ku5RcKIPcm6hV0FjUp4ViZUZ+hW10
 Rv5DdE1g==;
Received: from [191.204.194.148] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tkrj1-00F1SN-0L; Wed, 19 Feb 2025 22:35:29 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, siqueira@igalia.com
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 0/3] drm/amdgpu: Small reset improvements
Date: Wed, 19 Feb 2025 18:35:14 -0300
Message-ID: <20250219213517.281556-1-andrealmeid@igalia.com>
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

André Almeida (3):
  drm/amdgpu: Log the creation of a coredump file
  drm/amdgpu: Log after a successful ring reset
  drm/amdgpu: Trigger a wedged event for every type of reset

 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c    |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c      |  3 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c         | 17 ++++++++++-------
 3 files changed, 14 insertions(+), 10 deletions(-)

-- 
2.48.1

