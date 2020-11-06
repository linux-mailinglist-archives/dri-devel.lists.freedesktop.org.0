Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF4B2A9F5B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2916EB20;
	Fri,  6 Nov 2020 21:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011276EB1E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:49:56 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c16so2655698wmd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X9TskLA8s6lsCaAvrmgVECkRi2+nWhb2pEMdbcj9ssA=;
 b=pfSMSQscAEe73YfdvPqoah0YUiDgsKi5tci2ntaEc+AOw7EFT/Rjz/9yaQ8JOlnuqg
 sjsCyUHP2m7SSEbuESRncBhPT0/U3T3mBIzd8oVeLEgQ2vkMSiXn6iU/egwDLfoCiHID
 WmKn5aUfrKNLjV/95GLV+jN/7folMFY6MmdF8W3AabVdy+YgBrI2xYHqDVVSIRcuwwv9
 7dq40V4sfIu+gPKsuuqemhSRIdc1Eep9RErKn3hNocCTBW1i6HuUBuK9rWOqxqyRQcK7
 fTuXB9watBMFV0B7V0N9jyN5D+ISmPnGsOhSY4Me+8AK107zbLEUh25TPoiu4oaoxKn3
 ZN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X9TskLA8s6lsCaAvrmgVECkRi2+nWhb2pEMdbcj9ssA=;
 b=YX9+FD5ZInkF7qEhJXJkUcKqK6POiKZXvmqXAq7Se6gVlxRq/5dFJvsexdnZ5A0mZb
 sgTDoT+B+yoyIJi/Q9p7qBHkqA7gqGewjpDr5wEEIxCgUB5ZGSuSv3WJipEJ3Hk4Mt4S
 Hv4dQukrvMrlsmXQd89y2FCSYmL+2/AKShkvD4WtFweo5LQRUaX73U/vNdVKtKmFxNgg
 SNKJPp2LFr6AA08aQOCua1o2SnU2nlo79kI1ULBhi+nGfwn+MHBDjYnIDI/B88kIu4HN
 9JJK44NTk4/+wRSRlKNRdeNfpH/2psLPj64Xt1JplGyEUQkf4fck+4EhAZJ5j12wu2Ck
 yAbw==
X-Gm-Message-State: AOAM531OJ2nbNwu8ALf5CJS86RcZIyqwMu7j8OxiAx9cX4kib0x4h2in
 C+K3e+Qj/LNOc0+Ga4TCd/DcvQ==
X-Google-Smtp-Source: ABdhPJxn99JQzzfmUo/MAhbXVAzso9ShMGAbXLKB/8lXMZUdXlGssig7MHgAIaoRjLEwdk1EBgNFyw==
X-Received: by 2002:a1c:e056:: with SMTP id x83mr1688640wmg.83.1604699395695; 
 Fri, 06 Nov 2020 13:49:55 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:49:54 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/19] drm/r128/ati_pcigart: Source file headers are not good
 candidates for kernel-doc
Date: Fri,  6 Nov 2020 21:49:32 +0000
Message-Id: <20201106214949.2042120-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gareth Hughes <gareth@valinux.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/r128/ati_pcigart.c:2: warning: Cannot understand  * file ati_pcigart.c

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Gareth Hughes <gareth@valinux.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/r128/ati_pcigart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/r128/ati_pcigart.c b/drivers/gpu/drm/r128/ati_pcigart.c
index 3e76ae5a17eea..1234ec60c0aff 100644
--- a/drivers/gpu/drm/r128/ati_pcigart.c
+++ b/drivers/gpu/drm/r128/ati_pcigart.c
@@ -1,4 +1,4 @@
-/**
+/*
  * \file ati_pcigart.c
  * ATI PCI GART support
  *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
