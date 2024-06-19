Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC0090E386
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 08:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FDD10E950;
	Wed, 19 Jun 2024 06:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="GOSAHsTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341E610E8CD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:34:54 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718778883; bh=qoJqzIBgnbAnMYwE3UnTc3QEPRz4TplW8Gl8EJKReTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GOSAHsTldYDQFBKElaoR0Xea8jsPwQPLlhtutY7IxGZsYVZD68Xin63t6iRPy3yGQ
 lNXk/3SRC/iEL2CG22n212fyuFOLROYJEfHS7fhOdAbcNKRFy4BiEGptbwBeREEEt9
 c0MQVxTG2hA+d/uo7hWbqAFdjNn2bHeTXK9NEuAUUFsx48jFPSLw+P5y7yJjpBULXU
 oE/++HFSwLH5GOmJmiFD1sYl2lRA7ycx0brHFnI/FwZnC3hBwTUsRok28Ocl4mhNE5
 CKsyPmvyi+IPnTZL7v//UcQ3qmHzg2/0iBGfZqK3YXCGf+oIZB7DtmJtubzU22pl+1
 l+uYu2nzA6nfA==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 45J6YQB21377354; Wed, 19 Jun 2024 09:34:31 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Oded Gabbay <ogabbay@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 2/9] MAINTAINERS: Change habanalabs maintainer and git repo
 path
Date: Wed, 19 Jun 2024 09:34:18 +0300
Message-Id: <20240619063425.1377327-2-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619063425.1377327-1-obitton@habana.ai>
References: <20240619063425.1377327-1-obitton@habana.ai>
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

From: Oded Gabbay <ogabbay@kernel.org>

Because I left habana, Ofir Bitton is now the habanalabs driver
maintainer.

The git repo also changed location to the Habana GitHub website.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7cfe9895a44..0f645095d22f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9449,11 +9449,11 @@ S:	Maintained
 F:	block/partitions/efi.*
 
 HABANALABS PCI DRIVER
-M:	Oded Gabbay <ogabbay@kernel.org>
+M:	Ofir Bitton <obitton@habana.ai>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 C:	irc://irc.oftc.net/dri-devel
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git
+T:	git https://github.com/HabanaAI/drivers.accel.habanalabs.kernel.git
 F:	Documentation/ABI/testing/debugfs-driver-habanalabs
 F:	Documentation/ABI/testing/sysfs-driver-habanalabs
 F:	drivers/accel/habanalabs/
-- 
2.34.1

