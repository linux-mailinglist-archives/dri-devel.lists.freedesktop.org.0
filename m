Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDDD4200EC
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 11:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61B86E0C4;
	Sun,  3 Oct 2021 09:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199BA6E0C4;
 Sun,  3 Oct 2021 09:08:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D78961B25;
 Sun,  3 Oct 2021 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633252084;
 bh=PVqEi5vS4sOFikZvEUz9K9XB4b13SG5dvriACizO90o=;
 h=From:To:Cc:Subject:Date:From;
 b=k2BJ8jdGkipevlIeFKbDgD0Xn68LrqPTSXktFty+JhpHrECRhwoX8pTJMs6y9HSri
 YiizPCP00fWnSzdIEGESVGnONvUyYnRRQVBJZx7vgiraxN+6uu02sSlfkw7mJgmsJI
 SKpj6R9AVdrgsItUJh+A8Y6C8IrtQ/I/AZyeKaF4OTTOPrgW+ctx4guBkpTO0pcmUJ
 dQNibzlvbHxUVxmL3WN2MC5Fj+CFgxrxU5EHqnXBrT3CVReaBc2Z1z5ejgUJzvCcG7
 fW/IEnA4mlTZ2crGP+GgET8eVOMDH3+lREtCrJES4jDMmzdf5rusMGCEOVVshWoSBd
 PdtPF3v4zPXyQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, jgg@ziepe.ca,
 airlied@gmail.com
Cc: christian.koenig@amd.com, daniel.vetter@ffwll.ch, galpress@amazon.com,
 sleybo@amazon.com, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
 dledford@redhat.com, alexander.deucher@amd.com, leonro@nvidia.com,
 hch@lst.de, amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v7 0/2] Add p2p via dmabuf to habanalabs
Date: Sun,  3 Oct 2021 12:07:54 +0300
Message-Id: <20211003090756.117809-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.17.1
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

Hi,
I'm sending v7 after the latest review from Jason.
All the changes are detailed in the commit messages.

Dave, I'll appreciate if you can also a-b this patchset.

Thanks,
Oded

Oded Gabbay (1):
  habanalabs: define uAPI to export FD for DMA-BUF

Tomer Tayar (1):
  habanalabs: add support for dma-buf exporter

 drivers/misc/habanalabs/Kconfig             |   1 +
 drivers/misc/habanalabs/common/habanalabs.h |  22 +
 drivers/misc/habanalabs/common/memory.c     | 514 +++++++++++++++++++-
 drivers/misc/habanalabs/gaudi/gaudi.c       |   1 +
 drivers/misc/habanalabs/goya/goya.c         |   1 +
 include/uapi/misc/habanalabs.h              |  28 +-
 6 files changed, 563 insertions(+), 4 deletions(-)

-- 
2.17.1

