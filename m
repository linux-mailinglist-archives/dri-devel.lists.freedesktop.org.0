Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4903C7142
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 15:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66230898F1;
	Tue, 13 Jul 2021 13:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F6089807
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:32:56 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id hd33so12807587ejc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 06:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=AtdBxpTbfHI9zbIVsZ9n9GdLQqULdtTSE9Dda28OKGs=;
 b=arzhzSexletdezrIX00iuWr6PXJClFcKap26bWzVnlSQOe40YBLQ+Ssz06kLN81keY
 SzBy6GrM9I484ZCUT/RaDs/JKgEjCjqVddj2WSlUR6bAgNPMQIxA/ijqm05+wAyCskr2
 oDnNb2WqeTPBMEUJGHMkAukjp8LnJB2v+FK6FkLoVPY1NbvJ3UmNzJiW9w0Sn4DZ4BwW
 s40mMKANdb1ifp+jqTKko1fHxb3/O84blBxJRC06alA7IBVyHr1NQ03PFUCtegIBpE7T
 ntKeAxPAHTWiUOnm532AIFrbSQYkCla5mwQlLqAps0Cb13KmQ7LhibDVYMDkQvPDpFcD
 K/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=AtdBxpTbfHI9zbIVsZ9n9GdLQqULdtTSE9Dda28OKGs=;
 b=pmdDf5u53Gi4o0i9WTP89/vYe9y9ZMvCg6myisrkHXjTa9r5SJI+npJ6HWk4trFWZ2
 RhUYxaNdG4N1bgWiMTnFulyMKKpiDBO9VIgz+v+DWI+PV7Z6Hul1v/hs4EHwqXMnP7EA
 AXaWhunwLFsrehGaJYbXKyk3ZmCEy5ebxxn0cBvwHmWVVQzUTphFqYI5PFkPzn5kVrsf
 FTjMWfms4aBCZm3FL/l1t00DSqypG7NOAHPRQJ7fyAZn1+Ji7z/MkiKnSPrFMwKNH6vo
 egxU7mAh3ei6bVgIl0miN0GLirmgHMTN4rOnuqYlGbh7pPpMEjQpBy/5dkT2HNGF5Hxn
 gbuA==
X-Gm-Message-State: AOAM532sdQ+aqIvLCpSjnnVMBmEA2xtFwqZwmCTn3jfscvVOt/1jUibp
 l64nbdEMmBIX1dcbfs/c/gWjbFrdTG7pbA==
X-Google-Smtp-Source: ABdhPJyQoK9u/72BsU0I0QMdIqlx68r8g6oAyZCK2X65NMlI3FjZ3gohRyrOA83oHhj6A11h+OJfuw==
X-Received: by 2002:a17:907:7608:: with SMTP id
 jx8mr5613677ejc.233.1626183175273; 
 Tue, 13 Jul 2021 06:32:55 -0700 (PDT)
Received: from pc ([196.235.212.194])
 by smtp.gmail.com with ESMTPSA id gg26sm7500555ejb.103.2021.07.13.06.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:32:54 -0700 (PDT)
Date: Tue, 13 Jul 2021 14:32:52 +0100
From: Salah Triki <salah.triki@gmail.com>
To: p.zabel@pengutronix.de, alexdeucher@gmail.com
Subject: [PATCH] gpu: ipu-v3: use swap()
Message-ID: <20210713133230.GA1872993@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

