Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 696113D2B05
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 19:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48B26F482;
	Thu, 22 Jul 2021 17:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67416F482
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 17:21:06 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id p9so1685740wmq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=XiPHw5u5dlUXQvtcPtPmrVrUeEK7JBvZbFg3RjLxVe0=;
 b=k8adYkRqg+0Yq3FALuAPTAWEbM9vSz4+e7CarbPmwL1yyhJGq51cZ3TDvE/KeJv625
 vRdiuTvNUz1z0V63eKFM6GvXaKbqgxJu50/ENoSrI0PPmgb9hSGZqsAaqshJJWt9sNDq
 gpx8Czg+hBn0oM1+9G9C8mnZDKfnKsmyiKvVVF5GUESeyq4OPxNHjTr3YiFHfPAffWsN
 DSEJmdWJNUJn5AS8TGlcdRQzcJujc8dTTfIVMl7knMYsCKklTBffMKe8BJ3uLE4rWvdH
 64eB4mzs5ZJ+hMz2ipFiomIZcfRYlsEoiCDaHFlgQAfWUSF09xrMiypGWorc4mj/aMfK
 gBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=XiPHw5u5dlUXQvtcPtPmrVrUeEK7JBvZbFg3RjLxVe0=;
 b=qE1EDgtAzQwme/X0LXdECNsMH8OCRhuoFQvZAhKaEH5b4zutwmilAabU021wZRFUWi
 JxFAg3IDL2DzQXV91KjXcf8tDtKWHvoCNCtmpD0BIuPhiG2Gti6PwKmYas5KP0YaJnD/
 2je0r2mtx+wSeVo5c7/4Ht/OpcNGG1Mw8lkksekfXsiQ2iCCOKmzjtrfWtbZfzbSTQtz
 lGtOe/rjq8mu4g2hy/9xCiK5AtdcpQ4POeXaIx0b2/g3kPjoc0AArH37fXNnmwFacKjQ
 LfFNAXbe+miqDEzW7nYwy905TYy0NW7fZ2El6d3hE3eRVXrTdkZ/VcBqyckw88R59Ehi
 0fyA==
X-Gm-Message-State: AOAM533jyjexzo1Qzof9j8m3A9RADtJ1OoRKhIiMHqSD1QB59SHb3CkH
 I7fpNyVks3oXOWQ9KucZB2I=
X-Google-Smtp-Source: ABdhPJxGDjTtVBS4MxpPGbs38jJgXZud7Y5wLWAUhuFTV9hppvYsbdtWn2t8FCI0kezAPH/6+Yhk9g==
X-Received: by 2002:a1c:2282:: with SMTP id i124mr632948wmi.166.1626974465657; 
 Thu, 22 Jul 2021 10:21:05 -0700 (PDT)
Received: from pc ([196.235.233.206])
 by smtp.gmail.com with ESMTPSA id d29sm37221986wrb.63.2021.07.22.10.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:21:05 -0700 (PDT)
Date: Thu, 22 Jul 2021 18:21:02 +0100
From: Salah Triki <salah.triki@gmail.com>
To: p.zabel@pengutronix.de, gregkh@linuxfoundation.org
Subject: [RESEND] gpu: ipu-v3: use swap()
Message-ID: <20210722172102.GA5144@pc>
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

Use swap() instead of implementing it since it makes code cleaner.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index aa1d4b6d278f..af1612044eef 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -990,7 +990,7 @@ static int calc_tile_offsets_planar(struct ipu_image_convert_ctx *ctx,
 	const struct ipu_image_pixfmt *fmt = image->fmt;
 	unsigned int row, col, tile = 0;
 	u32 H, top, y_stride, uv_stride;
-	u32 uv_row_off, uv_col_off, uv_off, u_off, v_off, tmp;
+	u32 uv_row_off, uv_col_off, uv_off, u_off, v_off;
 	u32 y_row_off, y_col_off, y_off;
 	u32 y_size, uv_size;
 
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

