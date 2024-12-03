Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF49D9E292B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 18:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD62310EAD7;
	Tue,  3 Dec 2024 17:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="EV/kd2kG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3CD10EAD5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 17:26:50 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-434a9f9a225so56055e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 09:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733246809; x=1733851609;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uM3+RQXTMnOQ47ZFii0e33qP4d5w9EjJgy5PSo8ovks=;
 b=EV/kd2kG2bgtAqhX0Wk9uASPl8r6WsFoAW0ssJoMty01RGfHrhBZMJUb0uEXLGXenl
 P/SB7VnvJXGs1gCjh05Ii5/Din/lRuUoPMl8ZJXodWx3dmQM07IKvbpVVeaREe+ENy5n
 33SXa+d0LURoXLuvih8VdLIckCVDFI+5wbANQ28Q7ai1HGqRj9G49qqCATWo4iupTgPr
 BQCAVAXUKO5Uzk2fSQKnAM/eSdlnoERrRD6/nlh27me1g9IDuW+IONDaMU8MHRmcxGpU
 rb+DPEka0V7gWcvVhRkBXC1LoJxAConLccal05PCJOuevq8vvYfADaimmwFdmpq3IdCP
 icnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733246809; x=1733851609;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uM3+RQXTMnOQ47ZFii0e33qP4d5w9EjJgy5PSo8ovks=;
 b=D5tfrK1zHcsbtZBdiyW5Fy5qF9tq8J4X3EHoCBQS60HCz+iEPyFH3exLPCDM6JexIO
 rQyxlknNj3zKaadLCMsegp3O4gkTZl0GN+v1lqhhz7KLAHjEV2Ds5WQId6XJiJKgLd6V
 q/c44r94H7d9EusZfyY7BM9mwJe1NrleNHI7GRwcxJs6dSx6mof20tcc0ezCaeCw5UuY
 /+W3QAexW4CdirhnDYj4LxRT6HPS5u46VSVKNGY2+26DVtKp3n3tqO1Xl8Ws4KG/8yZt
 WKwF2CkGwtXd4cnq+gEay2WJD08fpB96yeSBw/fnhp6WfCkgcIqLyeAyKHYQipDXhcCO
 sAlg==
X-Gm-Message-State: AOJu0YzimPkQh3ceYmZrJTA/lisEY96NmZoVawGw6ddUA0VhSFiidq04
 gnj96eGsFQruwaYSzdnOtqK4qFBwumgt3L4sbtbynLFa9Gn+9/qRNdM3AHzfNA==
X-Gm-Gg: ASbGncv6IPTypwfeSRrqHWwgTQSgI1HJni8CoiCNuCF7ocVUEEnD/sfySp4mUK1oWv1
 gVdnizLccUFhGWSoJZvU+u8tY7BSufjtoiP2UCVB2/iqOrbB/4EseTgjWqpHwA5b2kDKfYXqHXD
 8FhNFznliWOtwJ0OOuJ0Jc1jPi33YoPgr9pAF31PU/jwEO8hlvFdM/WCajhPoKhUKWeahtCy4IQ
 CKg4SlgaEtCooDnutJLgcQq/3mHsRl6sTDozw==
X-Google-Smtp-Source: AGHT+IHah3tfnWDLN3UKIDFtEX6OxzBKzVPQiPV9mkH1uPluyyoiP9zAGpDGGtbXeYMGH6VNL1bEUg==
X-Received: by 2002:a7b:cc83:0:b0:434:9d76:5031 with SMTP id
 5b1f17b1804b1-434d12b8d88mr1204455e9.1.1733246808530; 
 Tue, 03 Dec 2024 09:26:48 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:92ba:3294:39ee:2d61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd3a522sm15986910f8f.52.2024.12.03.09.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 09:26:48 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Tue, 03 Dec 2024 18:25:36 +0100
Subject: [PATCH 2/3] udmabuf: also check for F_SEAL_FUTURE_WRITE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-udmabuf-fixes-v1-2-f99281c345aa@google.com>
References: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
In-Reply-To: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 John Stultz <john.stultz@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733246802; l=976;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=3m/LMLlH/7jMESx6X9fIIIIib4hfJn5luoPUIkkkDds=;
 b=C68RSNAz5tSn7/At1pT+/cqpyr2/1yVHxrn2ThIXppaycwhw+jpyJIrVQd0vwYT6uWunp7bMu
 gPYbSI141ikD1YI6YQFzt61WVCUN7ejJNigEshkNyhdAZUVB/Jcx0OG
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=
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

When F_SEAL_FUTURE_WRITE was introduced, it was overlooked that udmabuf
must reject memfds with this flag, just like ones with F_SEAL_WRITE.
Fix it by adding F_SEAL_FUTURE_WRITE to SEALS_DENIED.

Fixes: ab3948f58ff8 ("mm/memfd: add an F_SEAL_FUTURE_WRITE seal to memfd")
Cc: stable@vger.kernel.org
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/dma-buf/udmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 662b9a26e06668bf59ab36d07c0648c7b02ee5ae..8ce77f5837d71a73be677cad014e05f29706057d 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -297,7 +297,7 @@ static const struct dma_buf_ops udmabuf_ops = {
 };
 
 #define SEALS_WANTED (F_SEAL_SHRINK)
-#define SEALS_DENIED (F_SEAL_WRITE)
+#define SEALS_DENIED (F_SEAL_WRITE|F_SEAL_FUTURE_WRITE)
 
 static int check_memfd_seals(struct file *memfd)
 {

-- 
2.47.0.338.g60cca15819-goog

