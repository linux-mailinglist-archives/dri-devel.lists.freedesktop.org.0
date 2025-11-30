Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FC6C94EA5
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 11:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FB410E26F;
	Sun, 30 Nov 2025 10:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XtpoDg6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8E910E260
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 10:54:50 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-37a3a4d3d53so24820091fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 02:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764500089; x=1765104889; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dOSBjcoOnlyTQvfFFh+eu9Zfh6ZQd1i1HR+OFbVxZQc=;
 b=XtpoDg6uWXEboh6F8B29IOUya6mKgGO0RHXGESE+4cbkr8dROmMdu/Bbl2lc+JKlSZ
 TlzLvTRcyJhxGVOCN37yMhtMNsbq8qYV6hDT/eJcPgKOpk4cIW01MFR3ZaZ+emgVUJ5q
 kxhHR+EbjLqkYZJrMewoEDe4OWRU8ik7SzcHaMZDyQVKvh12j+XC+j2+8CTMMXX51RSE
 Jzlu0nBwJcb+nH/Mz0GmlZ1DxiLjM2nkEh7TFmetKbFLDVYprURKJnJXGR6OBJfA4dls
 Os1dmTZ1kUh2McOVN/vrF4z5J0F36m06RkkFaPbawovLcZonnXCn5zwg2uHfKpiH2JIR
 F9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764500089; x=1765104889;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dOSBjcoOnlyTQvfFFh+eu9Zfh6ZQd1i1HR+OFbVxZQc=;
 b=P1A8zNNhgTPllquBjmvr1w43aLnWnSTGeVBjed+tC/ADFYHJ4FBQPMCj8dwphXKxu1
 xNBNZNxcIUI6PHiro5c/lvupc2hbxIMDin6732ebwLzU48D/t+4ypAyaQwI4CqJstSuw
 y9WwD+xS2j1W3uc9YxF1klhnL/29pjnwf4jAn4a6gtqE/c0f2ZCbNNe6//qGHuW4S5SB
 oA8mlcRMOuWm3BdSGPRIQaLCMIisKueV/8ysSYgRFLtD0A7nAMkNpKpRDq7qnRTrVDYQ
 RWmCuCvoB1EEiA3/tmuhtrCPOESLgXZ8d+c2fkoZcj3SEpiT8k35aJBFDqLc7oR7x1bL
 ywPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPN6JimKpDM3bi1SSKLxyjSnMpEghZzWgVGCAwG2EaYGfuqo17S2IX6AwbKCDG74nvyNeEkv4f9dM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxY+qmBjgFS3pHXCKdf2BwbfVdZ0AFFXA25w2+Z4f5AoUnWsmCF
 Ui0KtgffXNlUHS2uUxgnPcgGgviQ2HgM8Stj91FH6Is9Moa0uwIRZ8RyyeoQFKbeb2Y=
X-Gm-Gg: ASbGnctqA/MryVngTezWQWlkC/CDK9RxXS1RFfDSagyRRc5nMh+RT4B8ozzSbuj5eCX
 17MyJ1zKrdKcweDIROPE6mvXJdE05viLSHv5XIL43PJpgn/DGGgll9uhuWb+8sDtA9TC01dw8eB
 ZOXcQEHaEhDscoAaK2AJjPg1BLFXztfVmAH+n0BxqLZk1cCqmXYR5mgtKk2u80tUuc7MWxZYkgh
 gpbzvGbOaMdj6N/YI03BvTsvxOR4dj+Rzdap5nhsnAetfNW4Xtv4eYiZdhFIHFC6FsEALbfTEl1
 oAsFu+BfSV9PASasp4tBEzCNpXGPnKscILKaDg28epVHEgw/zv2gvFCxJcCz4W2SHd5OjOqnFeH
 h3xWQ1we7a+w08/kDpnADanC9iAT1coynkLWUohyLR70PMB1NJMMTpSAIdE4Eggw883FQbYqm9R
 Lbewtq7H8Nf0u1ib5ywyYffw==
X-Google-Smtp-Source: AGHT+IFq1IN29e+3yywBpe9PVvbAinfdw0+qXi1MtIWv/v8nCdlDFCMMUU2tdkAh+KiyaMZkqBd+jw==
X-Received: by 2002:a05:6512:3096:b0:594:546c:431f with SMTP id
 2adb3069b0e04-596a3ee5548mr11152417e87.49.1764500088979; 
 Sun, 30 Nov 2025 02:54:48 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596bfa48cc8sm2710565e87.83.2025.11.30.02.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Nov 2025 02:54:48 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Nov 2025 11:54:48 +0100
Subject: [PATCH] dma-buf: heaps: Clear CMA pages with clear_page()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-dma-buf-heap-clear-page-v1-1-a8dcea2a88ee@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDMBAAvyJ7dsFsU7F+RXrYxE2zYDUkWAri3
 w0eB2bmgCJZpcDYHJDlp0W3tYJpG/CR14+gzpWBOnoaQy+cv4xuDxiFE/pFOGPiqpEdnKNHL9Z
 bqHXKEvR/n6f3eV4/1KeyaQAAAA==
X-Change-ID: 20251129-dma-buf-heap-clear-page-248bb236e4c4
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3
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

clear_page() translates into memset(*p, 0, PAGE_SIZE) on some
architectures, but on the major architectures it will call
an optimized assembly snippet so use this instead of open
coding a memset().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 0df007111975..9eaff80050f2 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -315,7 +315,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 		while (nr_clear_pages > 0) {
 			void *vaddr = kmap_local_page(page);
 
-			memset(vaddr, 0, PAGE_SIZE);
+			clear_page(vaddr);
 			kunmap_local(vaddr);
 			/*
 			 * Avoid wasting time zeroing memory if the process

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251129-dma-buf-heap-clear-page-248bb236e4c4

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

