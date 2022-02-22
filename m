Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF454BF900
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4723910E62D;
	Tue, 22 Feb 2022 13:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E9210E644
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:18:22 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 p12-20020a05683019cc00b005af1442c9e9so5734702otp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 05:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sDN/q36ne++w24m6ta6Mu8DvTucc3A8JRf+sG15A4uk=;
 b=gwNgQ82BffFNGYRWppEJcVbH9lkHH4pDVyKTZaRhGLp+f2xO5A1Rx15s9yci3hHm4w
 FR1uQhg8pvxh6Nres53U9+5PeQJjeY4FqukANXW+8jQxQv139/laPSL8d4aiynsMT7my
 oM5Wamd+Hc1OYtVIoCGTe5UqhD9E3zG6UB+aAagv3NxkPhAqTy845/1Yegz+Ca/xHwmK
 YaQM48FZyG/26ee4ISyofDBH3oxrbmeQdpILyFa49nlOGi9EKrN2uGD9mf6DccDzN5M1
 DUU+/U+aSWi9pPrfoohDvEJclSE8CUZvlfVrqhZg4DwOkDj8i05D6c/wK2OrBZbxVyJ3
 DXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDN/q36ne++w24m6ta6Mu8DvTucc3A8JRf+sG15A4uk=;
 b=5+TkUAUoGipfE4/Ae+MO//QOejgNEQJeNrlaVM6YRzlz/rezEV/gnzJSWRRJzQx6sy
 yoMQV6KKXnpeng3i1PenS1A8VFvP6bARwn3GiN2WLnZYl6ckbetgKaiAa/idFU+Fzg1+
 qXj2GLbv+6V8YUpTG3mzSxk0er/POvZIeOcPC5/gdMKDK221dgkNABq+atajmn6jpuBj
 S5TSLZRX5KD1AP4QOt4fnmf92nWtwurJ9XkjdRTZkkrm+szgw4gGK1JK3ps7aG5lCAbj
 REuwarUmunhICyGmeTBELBiKFoArml0Fecwb0ZxM5gAcIWS+O17p2/FqW9SBBz1QcBgJ
 jO2A==
X-Gm-Message-State: AOAM532t4XujCF8PUxDow84sU2JZ0PrMCCjoywetD9QYpveJ/fupDfXq
 aww8ZUC/quhLcohXNnZWxFnIWQ==
X-Google-Smtp-Source: ABdhPJyc2O86+E0dEG/No0hmALq+XxmG2EgDiNrBeWwpqJKHrw0001sfFqK9Y7CYkpxQ9BvdfQuGzg==
X-Received: by 2002:a9d:714a:0:b0:5ad:f8f9:b50d with SMTP id
 y10-20020a9d714a000000b005adf8f9b50dmr4817459otj.47.1645535902206; 
 Tue, 22 Feb 2022 05:18:22 -0800 (PST)
Received: from fedora.. ([187.36.236.204])
 by smtp.gmail.com with ESMTPSA id c9sm6325050otd.26.2022.02.22.05.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 05:18:21 -0800 (PST)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 Hawking.Zhang@amd.com, john.clements@amd.com, tao.zhou1@amd.com,
 YiPeng.Chai@amd.com, luben.tuikov@amd.com, Stanley.Yang@amd.com,
 Dennis.Li@amd.com, mukul.joshi@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, Anthony.Koo@amd.com
Subject: [PATCH 07/10] drm/amd/display: Remove unused
 dmub_outbox_irq_info_funcs variable
Date: Tue, 22 Feb 2022 10:16:58 -0300
Message-Id: <20220222131701.356117-8-maira.canal@usp.br>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131701.356117-1-maira.canal@usp.br>
References: <20220222131701.356117-1-maira.canal@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: magalilemes00@gmail.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, isabbasso@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the unused struct irq_source_info_funcs
dmub_outbox_irq_info_funcs from the file, which was declared but never
hooked up.

This was pointed by clang with the following warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:141:43:
warning: unused variable 'dmub_outbox_irq_info_funcs'
[-Wunused-const-variable]
static const struct irq_source_info_funcs dmub_outbox_irq_info_funcs = {
                                          ^

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 .../gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c   | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
index aa708b61142f..45f99351a0ab 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
@@ -138,11 +138,6 @@ static const struct irq_source_info_funcs vupdate_no_lock_irq_info_funcs = {
 	.ack = NULL
 };
 
-static const struct irq_source_info_funcs dmub_outbox_irq_info_funcs = {
-	.set = NULL,
-	.ack = NULL
-};
-
 #undef BASE_INNER
 #define BASE_INNER(seg) DMU_BASE__INST0_SEG ## seg
 
-- 
2.35.1

