Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E819D092
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 08:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E346EB0D;
	Fri,  3 Apr 2020 06:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C272C6EAEA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 04:25:11 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id kx8so2395129pjb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 21:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AyD2kX0rtGFxJhOxxjgdsGTPUrD/FjXjSvw4eMWluYU=;
 b=I+Q5xBnw6OlNyc1WeYEuiKJUTVH7pscJdTTt0CEbl2LzbrJ9EOwk04CgLOETAycBeQ
 0GyVQ2DWmVk0q5GewcChYtUHbGpq2sr/KkEvTTeZjZ99GSl3oVE6JvDmWhDwOoRGvmdl
 HwBKGy5bBPEL9ZB6jGxhb+k02kWIErPtOdWSmKDH8nRok/kagwYsZGxVIE4MS1O2VyDc
 nyI5qdFNfX4MZMNJQnuvlHqjiol3dLFc7SDOUYIbG25OJs3onxxEG09q5xMyM6LlD0wD
 YFsyfoxiBFCX/BaijsYn8l830uwB5L/C1MAJL0M0D7psWtuGNZwy2sBzuQFIFFPUcABL
 4dEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AyD2kX0rtGFxJhOxxjgdsGTPUrD/FjXjSvw4eMWluYU=;
 b=uX2wzNzujWa2zGOPM253BlDaG2I+PZexDqLZNF2Z2d0yhbxaj0KLPL6Nm5vFmbw4S6
 7xcMd0dDJ2H0bYSJ2fDvKrHX9mjrFS0MOtxx4+1GL6SXDJCHUDmjepRzI46TkMuYqY+V
 jwW/g8iNvCg/Dk1QcQSSC795tv+5chhnmHFdvf/QwgFq3OQYV9ZutskNBwurXPrxeRwF
 Hq5+JUgGMG4RbVqPhZWPwxTlSJVvE5960By74KZBMXKiQet2gDSPOYDkHq4Rn3QM9z8u
 dGk6HDxPyDBPzBTkeQsC0Nr6iqQ86IVBRvTyV0vao3VlWEodAK4Z378gjLsKthlhwQ2F
 GjfQ==
X-Gm-Message-State: AGi0PuabKYsvMGx0JuTyziBcMg1gd6p81xtANuw+BNYGLxQqM9u9Mag9
 cXothjeYYROHfl/HJnBp/hw=
X-Google-Smtp-Source: APiQypLUFoTcgC53/RD9U2GcTptF5bIO1QeLIw/HD5iIXFZnYExMi6C3tKHE3v7Uavp2U/mKA1dw5Q==
X-Received: by 2002:a17:902:82c5:: with SMTP id
 u5mr6320102plz.254.1585887911382; 
 Thu, 02 Apr 2020 21:25:11 -0700 (PDT)
Received: from OptiPlexFedora.fios-router.home ([47.144.161.84])
 by smtp.gmail.com with ESMTPSA id l190sm4760286pfl.212.2020.04.02.21.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 21:25:10 -0700 (PDT)
From: "John B. Wyatt IV" <jbwyatt4@gmail.com>
To: outreachy-kernel@googlegroups.com, Julia Lawall <julia.lawall@inria.fr>,
 Laura Abbott <labbott@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>, devel@driverdev.osuosl.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: android: ion: Align with parenthesis
Date: Thu,  2 Apr 2020 21:24:48 -0700
Message-Id: <20200403042448.863689-1-jbwyatt4@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 03 Apr 2020 06:54:15 +0000
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
Cc: "John B. Wyatt IV" <jbwyatt4@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Align two different lines of arguments with the parenthesis
of their respected function definitions. Fix style warnings
of matching alignment.

Reported by checkpatch.

Signed-off-by: John B. Wyatt IV <jbwyatt4@gmail.com>
---
v2: Change comment title and summary
    Suggested-by: Julia Lawall <julia.lawall@inria.fr>

 drivers/staging/android/ion/ion_page_pool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/android/ion/ion_page_pool.c b/drivers/staging/android/ion/ion_page_pool.c
index f85ec5b16b65..0198b886d906 100644
--- a/drivers/staging/android/ion/ion_page_pool.c
+++ b/drivers/staging/android/ion/ion_page_pool.c
@@ -37,7 +37,7 @@ static void ion_page_pool_add(struct ion_page_pool *pool, struct page *page)
 	}
 
 	mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
-							1 << pool->order);
+			    1 << pool->order);
 	mutex_unlock(&pool->mutex);
 }
 
@@ -57,7 +57,7 @@ static struct page *ion_page_pool_remove(struct ion_page_pool *pool, bool high)
 
 	list_del(&page->lru);
 	mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
-							-(1 << pool->order));
+			    -(1 << pool->order));
 	return page;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
