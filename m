Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCB83C6B00
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 09:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D418C6E043;
	Tue, 13 Jul 2021 07:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01A789F0B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 22:44:44 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id hd33so9005718ejc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 15:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=AtdBxpTbfHI9zbIVsZ9n9GdLQqULdtTSE9Dda28OKGs=;
 b=S4e8xxvOeTsjJRWXeBOxg06Wptzfr/wUdvjfW7pBsIq5xVyAFR5M8UaWP88yJmYZO8
 6P6gjBJWSZqwh3ihQex5EFtiA7cvxakjMnlDcZ/fwD+5J0K1M3PbPd1Vs88IJ4aD0csF
 N1ofgEVv1h5kX2IILYCou7nuDQydxOxrlir97gvAUgVQ4PIQotmZHXFVpQryJ/KomHT2
 8+4GRk9UAZUZ1xNMqw5hVtoh83wBvU+WywzFN+s3eytUgnWbnvugjdj9256PdFw36MiA
 tk+eXQ/jPEVRKxRturtW228mSUXB0Shs4JWHtic/di9hHhKkS59yMUvFYrpJYXKwiAme
 /jAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=AtdBxpTbfHI9zbIVsZ9n9GdLQqULdtTSE9Dda28OKGs=;
 b=SwDVWxdee165akhhwZKcp0ThByEN84XZed8I1xYTSyuKPyy/EaFRrxr1G+jibl9JY0
 BGzWTyEXckIMphpI93hfFMnaqZI6AczDQG36mQmoOqB9+1bSWTcCPlW+lhkpsZDb50Ow
 2mR2jgKryJuDZmeOUN7lvTzjWRl6jnwkgHhBM9Z8aKvT4RriedNgkKTV8l/i1kNt3xQx
 uRHtgIpbeT1cUTzwlhzwbB4UVcKeWgeP+NgspOaeYVWWUrS+zkPUyAzi0/dBRf8sGeHs
 MRNbvox7g33/rTRssqvOaIStCRRdZuPD4quTzDMcVIkOn7O6WkqtjwPoivyPSVHfvqhy
 YijQ==
X-Gm-Message-State: AOAM530UAaE7SXF4RW+gRDqN8DM9C072B9RhWtiTCl0zNAa71SQA5bsY
 AerqS4bgsaYFEjTExbCiu3er05nhXQzESg==
X-Google-Smtp-Source: ABdhPJzBjtupWYnBUEQgMeebH91Cg8fNa6fr/gkwR+g/XTsWEAOareUL1IS8eW+AxsSrrbCh0yrxVA==
X-Received: by 2002:a17:907:7d9f:: with SMTP id
 oz31mr300950ejc.366.1626129883434; 
 Mon, 12 Jul 2021 15:44:43 -0700 (PDT)
Received: from pc ([196.235.212.194])
 by smtp.gmail.com with ESMTPSA id z6sm2181591ejo.77.2021.07.12.15.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 15:44:43 -0700 (PDT)
Date: Mon, 12 Jul 2021 23:44:40 +0100
From: Salah Triki <salah.triki@gmail.com>
To: p.zabel@pengutronix.de
Subject: [PATCH] use swap()
Message-ID: <20210712224440.GA1830070@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 13 Jul 2021 07:09:45 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use swap() instead of implementing it since it makes code more clean.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index aa1d4b6d278f..5f730cd6009d 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -1021,11 +1021,8 @@ static int calc_tile_offsets_planar(struct ipu_image_convert_ctx *ctx,
 
 			u_off = y_size - y_off + uv_off;
 			v_off = (fmt->uv_packed) ? 0 : u_off + uv_size;
-			if (fmt->uv_swapped) {
-				tmp = u_off;
-				u_off = v_off;
-				v_off = tmp;
-			}
+			if (fmt->uv_swapped)
+				swap(u_off, v_off);
 
 			image->tile[tile].offset = y_off;
 			image->tile[tile].u_off = u_off;
-- 
2.25.1

