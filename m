Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E348AD974
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 01:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8ECD112E62;
	Mon, 22 Apr 2024 23:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IAf5XJqc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8B3112E60
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 23:54:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DFA9DCE0EC2;
 Mon, 22 Apr 2024 23:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2212BC32782;
 Mon, 22 Apr 2024 23:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713830079;
 bh=7liINkEU1emdMgsHVMwI/aHr5XR3muay1ef3hai/zVU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IAf5XJqc6EiEqLxSSoFuvAowUmfCX32Qb1UjCxFzcmwfJYn7rOIflHOB5G+Nrlxf5
 DtXw7ax3joZ1N7sAWA5qEetpPF3AS/z3fM5W0dQOZVmquTBhYPwbJzDHYoH9rS0keI
 c1BFq3e+eZz5+PNaWOd6kfRuW5T5f8LecDtGAGYCanyfuriSkS2xK7eu7gCz/aDPEP
 UOVhWVwV15iEWXaaLII2OGOjONPsxTZVe9KfnfwwdqKvg5W6yqr2pH9Vt317cmtIfL
 F4bXyNPoN5wC+hbinNYDBrA+oPBEaiRDpdZAW5lF4im7g9DykolPzXe82MHfmUNt8+
 5OFadbQAtUwaQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Sasha Levin <sashal@kernel.org>,
 stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 19/43] accel/ivpu: Fix missed error message after
 VPU rename
Date: Mon, 22 Apr 2024 19:14:05 -0400
Message-ID: <20240422231521.1592991-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422231521.1592991-1-sashal@kernel.org>
References: <20240422231521.1592991-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.7
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

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

[ Upstream commit 0d298e23292b7a5b58c5589fe33b96e95363214f ]

Change "VPU" to "NPU" in ivpu_suspend() so it matches all other error
messages.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240402104929.941186-8-jacek.lawrynowicz@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/ivpu/ivpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 2d706cb29a5a5..64618fc2cec40 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -62,7 +62,7 @@ static int ivpu_suspend(struct ivpu_device *vdev)
 
 	ret = ivpu_shutdown(vdev);
 	if (ret)
-		ivpu_err(vdev, "Failed to shutdown VPU: %d\n", ret);
+		ivpu_err(vdev, "Failed to shutdown NPU: %d\n", ret);
 
 	return ret;
 }
-- 
2.43.0

