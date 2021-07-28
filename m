Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968703D8DE8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 14:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91976E123;
	Wed, 28 Jul 2021 12:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5086E062;
 Wed, 28 Jul 2021 12:34:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A710E60F9E;
 Wed, 28 Jul 2021 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627475682;
 bh=2wKeig8qmDRZeeiIJGk5x5q7NdKFK9WJTk7jPfELINU=;
 h=From:To:Cc:Subject:Date:From;
 b=h2jpE/un8sDwiSUvsAyJRH2B6/0t7DfcPb/dZMdPwDgM35PXurqzYneTIjAhnZw2h
 YHckVIRd/1UlbM9UYusDYl//ESgrEhFMEG+jo6JEuN/XPKyEvBJ1dabIgB+QNjuEhl
 RNBBR99lMKO6KC2Nwrq3wNMOmz42WlCoDF8hs5v7/SR04+LdfiUOV8IrT1D9tBB4XA
 /Bcq0uKTGoXtB2QWlbU1OHw4lww5fgb53xNGFKhsjxQN1ZO9fPaEqIZWlgTe0gO0vI
 RfLQBzuJXHqVebUlWdXxR6ttcSnev4Th4sR4f+tS3H0RL6+GgbjkzsFO+g0ePkD/5N
 HSiBpHY/2d6+A==
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Leung Martin <Martin.Leung@amd.com>,
 Solomon Chiu <solomon.chiu@amd.com>, Mark Morra <MarkAlbert.Morra@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>
Subject: linux-next: build failure after merge of the amdgpu tree
Date: Wed, 28 Jul 2021 13:34:31 +0100
Message-Id: <20210728123431.32687-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
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
Cc: dri-devel@lists.freedesktop.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

After merging the amdgpu tree, today's linux-next build (x86
allmodconfig) failed like this:

ERROR: modpost: "dc_dsc_stream_bandwidth_in_kbps" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

Probably caused by commit

  b6b76b0315ed7b ("drm/amd/display: Fixed EdidUtility build errors")

I've reverted to Monday's tree.
