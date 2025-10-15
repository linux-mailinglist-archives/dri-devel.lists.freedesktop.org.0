Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FBCBE033F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 20:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27EA10E8B7;
	Wed, 15 Oct 2025 18:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nLdR8YRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84B710E8B5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 18:36:05 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-77f67ba775aso9575502b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760553365; x=1761158165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JJWMwls+LAtfP4tAZlyMoRyCGxEoib6nFV8vy2YJhYU=;
 b=nLdR8YRwFfcLGY1/eEyNbFn9UgyRw4hPXds4Tpm6SL9Wlr1/4d7s86yzMA4Q3Xtly9
 u93L6M4DIEAP3OSv2+2G+T5WlsUB37u7mmsuMUO7GVD2HBYdDDInx9yUUp9vsUr9J93D
 PQ29wRs4JNKIhVcI8CmGguOK6IVhkTmJEWtuCL8kZD9EVvSbeFsH/Sa+kH/FdjfK58Kj
 J0Ovg4PiBPmPA+nv+hIgUVkl4c1rg6IFy9bQpQAE+ei12XxIVzRLOKyMDmq0oy9hFVWp
 64mYQ0y3Q4qz7O/pVk3+RLSDXZdMAHZ7ieaGxrh/XTtVRMUv4qw6qJcG7DOBQJp1XS5V
 Oozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760553365; x=1761158165;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JJWMwls+LAtfP4tAZlyMoRyCGxEoib6nFV8vy2YJhYU=;
 b=E8qEdMEnQxLDyIhZiWLMh2diosscM3u0KtLxtON3KwhQyTVIYylPEEjoM0bNBg2F1L
 l4sNBySgJWl7VAyTq2qzVwh76ItwMveesA1o2kNnqEZc5Q26rcsQjGGkBzx8ZEnruz//
 Eud67rmnO6TIvkSlVEcXlw+P+geYNmzqDw88DK59GrUSl2/VsbvCJ9oKslbIgoebJDmE
 Ra6OVn16n1o+0t7uEdjrw7F2JoRbLzOfBy2amN0eNeNqFW8ih9HXI/QLzlPecBthEecO
 vutaucZ2GWx9OCMn5PmQISM7eiv78YASKoP3UyEjzbsHAFc+SAFlMyvtBMrExM297hIG
 DyPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYedBqnu8oM4fCk8cbuOyRM7+S/dlabFl8qEIJ6xizLoS/Eo7zZ+ApVx6L+bu1NkqtINuBUT/w5zM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc26lkYgfvNjOYVE3O1daJCgN6JpiUT0EUEQ4HGBhEuS5SeZL6
 /0FRK6kB1++a5MyIMkO2TvMTUyKToQyTlz/bPaJDUJjqnH+Pl5z6UAr/
X-Gm-Gg: ASbGnctQeDNgAXSUooQMkk7cy6Z60utWIgnd1qANNM2FuLHv4ePmOie3zzVxGSjvGlL
 esoU5z74YMg1nSOrxdPLcfc4dNenQZAhi+K72JxGtlKmQaawaS//mYG+bwUoFNsOtcke6Fh3cnu
 S640XHAHEpMJj1LHvYJnPSnEFifsaNp+AfjMXTZd/4BXqCgvWSoJcK8znVxkYgA6PA17hEvBYyS
 1gTnvRVxDrtrFqeGCo5pOGVirVxMIxvwReVWKuSmVo/oGycouUpJqrBroKR7eW38KTbBpRs7zyn
 +z/r81sUxANjXst4jkMlAPMwh2Dc2xEEvM02nUoomhNhDm2I15ZfE+639gDeUT31naa21RylYME
 iyCowlf8vBSF4qbZEa4lr/GiwRdclLd+zx0OXihj7HacvF7Esu7hADiEPJlvl1WiLnfjCVg==
X-Google-Smtp-Source: AGHT+IFlyCa56i9R5oJazvL2hNHkiDW7KJ+UW8SY3pz99LslbXWkSaiSVgZEMdYa4bSHd+QjdapDNg==
X-Received: by 2002:a05:6a20:3d82:b0:334:97a6:17f2 with SMTP id
 adf61e73a8af0-33497a6182bmr1030221637.14.1760553365032; 
 Wed, 15 Oct 2025 11:36:05 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6a22b9c315sm298122a12.29.2025.10.15.11.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 11:36:04 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 corbet@lwn.net
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kriish Sharma <kriish.sharma2006@gmail.com>
Subject: [PATCH] htmldocs: userspace-api/dma-buf-heaps.rst: fix block quote
 warning
Date: Wed, 15 Oct 2025 18:34:02 +0000
Message-Id: <20251015183402.1649988-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Fix the following warning encountered when running `make htmldocs`:

  Documentation/userspace-api/dma-buf-heaps.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent

Added a blank line before the "Naming Convention" heading to comply with reST

Fixes: 1fdbb3ff1233 ("Add linux-next specific files for 20251015")
Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index a0979440d2a4..c0035dc257e0 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -26,6 +26,7 @@ following heaps:
    ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
    created following legacy naming conventions; the legacy name might be
    ``reserved``, ``linux,cma``, or ``default-pool``.
+
 Naming Convention
 =================
 
-- 
2.34.1

