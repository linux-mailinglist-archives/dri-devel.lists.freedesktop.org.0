Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBA4520237
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 18:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE0B10E0A7;
	Mon,  9 May 2022 16:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E3F10E07C;
 Mon,  9 May 2022 16:23:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41A3761414;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE30C385AE;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652113423;
 bh=iC3L1mwdxdRv4+yqapYKlvqm98z/iTnxl7TCxRZjCrg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lwh+hBiFGkXkVN4r2Q1e+8TZCAw15j7jVUgfyAoUe9I/Xr+kIzFp+Lo0kv7e6RSCr
 OndQHjDXKARhmXni1Z7t3v24nNMx9PkIrY17uBfy8TO6hoepb8YR7D5f6QNR9druaI
 ADuNSRBkty0MvAuAt67PNWekCzNNGvLiQkziHUX2pdWQc4xKYDPOiY8/K1lQQSnQLX
 M4VyWca/fgTaFwUX78XaFgYhqC01rdsDe/xnzaDpPwQYjBsALRTDXc3/RrE//o6SBh
 4PLolukSm0di4QANaIqBKXxgpd0s5LLWrzZrFUsMkB1kplX6CXcfZSIoXKbmVOO2mZ
 9gKUUvOJgYqnQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1no6Ae-006xVP-FW; Mon, 09 May 2022 18:23:40 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v6 1/4] module: drop prototype for non-existing
 __symbol_get_gpl()
Date: Mon,  9 May 2022 18:23:36 +0200
Message-Id: <5f001015990a76c0da35a4c3cf08e457ec353ab2.1652113087.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652113087.git.mchehab@kernel.org>
References: <cover.1652113087.git.mchehab@kernel.org>
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
Cc: alsa-devel@alsa-project.org, mauro.chehab@linux.intel.com,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@intel.com>,
 linux-modules@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no such function, and __symbol_get() is already declared
as GPL. So, this is likely a left-over.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v6 0/4] at: https://lore.kernel.org/all/cover.1652113087.git.mchehab@kernel.org/

 include/linux/module.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index ccfbaec82790..77961f5773b6 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -299,7 +299,6 @@ struct notifier_block;
 extern int modules_disabled; /* for sysctl */
 /* Get/put a kernel symbol (calls must be symmetric) */
 void *__symbol_get(const char *symbol);
-void *__symbol_get_gpl(const char *symbol);
 #define symbol_get(x) ((typeof(&x))(__symbol_get(__stringify(x))))
 
 /* modules using other modules: kdb wants to see this. */
-- 
2.35.3

