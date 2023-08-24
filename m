Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5C878753F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 18:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D25310E11B;
	Thu, 24 Aug 2023 16:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D6410E092;
 Thu, 24 Aug 2023 16:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4WCvUtoFCzfEaXTzDHEDx1Go5TnHh8xSA7VOtwux7Hc=; b=Z/P7jfA+3uYmzGkm9ZCk+mf5tN
 ZlqdaVcNcElZXD5ffqCKLbgyl6WSJWmPIW2v6G4CHAtsaBh/JDb5VwpDGqsTIZHW9p5Ga59cx592i
 /yvF+m1utkowhKBIbk+Yr/2Cl+CMcNW/VALJA5Nid9LicPCUHCf6KdRIM6Ge8B2CABeThr0I8773g
 TPNvDKg/1GuEGKDL+plOKVx7h8yFOLCEVESFeNat8Cwpf3S2hpB99hC2BOjVMZuYi3v0CA+ToowZ4
 jbJezR5GtJ9dO2T1Fosuwzd+HX/iwVAjVDkFt2vcllwu7n93NL8Tytn1CV6/XPtvRtvF52HPvBpmq
 dTI/GVJg==;
Received: from [187.35.42.59] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qZD94-00F0DK-Ra; Thu, 24 Aug 2023 18:25:19 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/amdgpu: Merge all debug module parameters
Date: Thu, 24 Aug 2023 13:25:03 -0300
Message-ID: <20230824162505.173399-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As suggested by Christian at [0], this patchset merges all debug modules
parameters and creates a new one for disabling soft recovery:

> Maybe we can overload the amdgpu_gpu_recovery module option with this. 
> Or even better merge all the developer module parameter into a 
> amdgpu_debug option. This way it should be pretty obvious that this 
> isn't meant to be used by someone who doesn't know how to use it.

[0] https://lore.kernel.org/dri-devel/55f69184-1aa2-55d6-4a10-1560d75c7324@amd.com/

André Almeida (2):
  drm/amdgpu: Merge debug module parameters
  drm/amdgpu: Create an option to disable soft recovery

 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 30 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c |  6 ++++-
 drivers/gpu/drm/amd/include/amd_shared.h | 10 ++++++++
 4 files changed, 46 insertions(+), 1 deletion(-)

-- 
2.41.0

