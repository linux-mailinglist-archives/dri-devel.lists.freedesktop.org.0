Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9269934BFF0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67366E182;
	Sun, 28 Mar 2021 23:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE3C6E182
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:56:52 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id c3so10930203qkc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FFq3P7yiseEEIQs2lgtrYVJcUzd7SMyJml+jQ6mPYF4=;
 b=uqre0zmSKtKLv++i82S0mbofGjuwskwC3CvMsmMtmcwjGtVJxeycjVJ6RpN1VYBSe+
 0CQzJMu7PEalUVZXmadGM2px6kQtZ3N7tNZA8m0dvlRcCIAf2qxYblhfj3libS6ly7pM
 7cP6Y7jQrTC4iCIUP2k8mrM8YO2OpsBVZioO1TYaUyX8FXX33csqU52/jNiOF/7HzRdW
 h0q2j3ogjbDgvmDtoSNvMcXXBHSfFF65U6v9ngv5ZS5aXjxah14f4OMwQwxkXQDvmGYq
 AtbeqfKk09GWR+OXgzvinDBtt6Vlb1woQTa7OM74PpgkMbt4TVzXSvTJ5IGTkC59YqDm
 2KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FFq3P7yiseEEIQs2lgtrYVJcUzd7SMyJml+jQ6mPYF4=;
 b=h3NRm+qjmGgIrvF/MVlGj2AN4EKNeMefqbsv//7vAxFUFptk2/FQftY1Ac3CcUXANw
 GKCqMDy/yizycJVAZmzeStUKuHb/DUy3671qGWOUbniRx2U1MUGiI+ulB/OpZAOAehtm
 EGUtLGOPrbcWxAXSs9QO+PZjSVAACOm2BuMFwcZipsnEBfLc2rvK0Zn2bBI3RBjsSJCi
 jjt5caaPBXbTowM1GOJNmh2ZXTY0OVtagfZW67i2cbEGLtTFNVYkXg5DDOIwUkHnDtHz
 ZM9HKR5m8cm1WC6l+V74xPzFh/NJ+4y/suL81Voip11rOm0taM4GuBFWUwnQ3sbWpvUT
 vj7Q==
X-Gm-Message-State: AOAM5324HXttO/GCHSm2lmbLHo1WVAw/ewRFvMXH9ioPN1tlBkknE87g
 /pezcLW2pTANlFpwm2ZKZN0=
X-Google-Smtp-Source: ABdhPJyLHhya4uvoU4yUX2xpbMzIUxvQ1LFqJZoKSNEtSVlVs50tStFXatwwOAyjof/U/tKgBPUUrw==
X-Received: by 2002:a37:a10a:: with SMTP id k10mr22547586qke.171.1616975812145; 
 Sun, 28 Mar 2021 16:56:52 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:51 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 11/30] nbpfaxi.c: Fixed a typo
Date: Mon, 29 Mar 2021 05:23:07 +0530
Message-Id: <4171b74a36b486ce83fd019e654660d7cbe2dae0.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/superflous/superfluous/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/nbpfaxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 9c52c57919c6..9eacaa20ddb3 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -898,7 +898,7 @@ static int nbpf_config(struct dma_chan *dchan,
 	/*
 	 * We could check config->slave_id to match chan->terminal here,
 	 * but with DT they would be coming from the same source, so
-	 * such a check would be superflous
+	 * such a check would be superfluous
 	 */

 	chan->slave_dst_addr = config->dst_addr;
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
