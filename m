Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3EB743F9F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 18:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B821410E4B4;
	Fri, 30 Jun 2023 16:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80FB10E4B4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 16:21:16 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-57704af0e64so19751997b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688142075; x=1690734075;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tmI1or0XTS7Hn6WBYUj9O4F+BRUYRNflOyMy4FV7LJM=;
 b=Wl2L6CE38QgBvIOu5iEIjH1dP66LLE6Ms7p8AfxgJ0snRicrG3kjNt5lF/w/oYArpt
 snZHK2JWiwKS1vQx/3eCgThyxArpAuKoJ7mDJtjQrfP6AYk6/pPEMsEDGAhnR6uoa5zF
 mKTGKUQmqz6eBx4jb9FRuD/3TMadTlPhYL39dXT0XLIwLcUBv2V3r+FZ2J+ua4UpSl9F
 b3gF2oAF/bW+84N2cy4PdiNse71SUaZwtxO6U5N6J1YyTXWDWm5f3M0fyNms5gJFwZoX
 9A1lgtm1u0UFRsMW+oMy1/UC52IZlHh+5j2QcoEsSh/UdfYlVJT0TtS55byoHtaee9Z9
 PbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688142075; x=1690734075;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tmI1or0XTS7Hn6WBYUj9O4F+BRUYRNflOyMy4FV7LJM=;
 b=N0m1hJx+XuJ7mK6SHce0ghVROg7jYGn0jTVxus2VzkBA0kcdWcR4jCSEn0JgmvmFOI
 wyQE87TjVbe/eCAgrL2B/j1ufGjvpwi6n8RN8TQEYHbkdPupQn3nfzSw8ibEJWas7E11
 DrDVDnsGfLR/cHs1VXHg1DDoUI/I3mjcm34jRm4bIMUhjWrfFfxTsI3cawW4t8BwTT+J
 D5WdnwEfc6t0sMNKFLEosoPpBTjwAi+wAeUD48KyOTuIuyGlF0Ve5jTm/S8mL+JnM7Kz
 tD8CtiSF4HTLiQj+wbAXI3aUMG7+9JH35K5EXjCuyxwbcn0kd6FS5BK7u95RbkiYES7c
 C1Ug==
X-Gm-Message-State: ABy/qLaG43m50/4F61XKkf51oMuYnSJjIov0py9eJ1B+dXxVUeOcVsDS
 JhiKbHcWVQsNhEWNZVKpqDfJDtLqHas=
X-Google-Smtp-Source: APBJJlHD9CFDbrXlL1q/Tx0IjaqkF0QgIxLv3w4dEKVcSLFdBqoW9yS9DDKgdFV6JkUafSPiOI3r9J/kKFKe
X-Received: from jstultz-noogler2.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:600])
 (user=jstultz job=sendgmr) by 2002:a25:6b12:0:b0:c24:7d1c:6145 with SMTP id
 g18-20020a256b12000000b00c247d1c6145mr27237ybc.2.1688142075426; Fri, 30 Jun
 2023 09:21:15 -0700 (PDT)
Date: Fri, 30 Jun 2023 16:20:33 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230630162111.3051783-1-jstultz@google.com>
Subject: [PATCH] MAINTAINERS: Remove Laura Abbott from DMA-BUF HEAPS FRAMEWORK
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, Laura Abbott <labbott@kernel.org>,
 kernel-team@android.com, Sumit Semwal <sumit.semwal@linaro.org>,
 "T . J . Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Laura's email address has not been valid for quite awhile now,
so wanted to clean up the reviewer list here.

I reached out to Laura who said it made sense to drop her from
the list, so this patch does that.

I do want to recognize Laura's long time contribution to this
area and her previous ION maintainership, as this couldn't
have gone upstream without her prior efforts. Many thanks!

Cc: Laura Abbott <labbott@kernel.org>
Cc: T.J. Mercier <tjmercier@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: John Stultz <jstultz@google.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: kernel-team@android.com
Acked-by: Laura Abbott <labbott@kernel.org>
Signed-off-by: John Stultz <jstultz@google.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f4e92b968ed7..6b28b59cbdb9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6181,7 +6181,6 @@ F:	kernel/dma/
 DMA-BUF HEAPS FRAMEWORK
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 R:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
-R:	Laura Abbott <labbott@redhat.com>
 R:	Brian Starkey <Brian.Starkey@arm.com>
 R:	John Stultz <jstultz@google.com>
 R:	T.J. Mercier <tjmercier@google.com>
-- 
2.41.0.255.g8b1d071c50-goog

