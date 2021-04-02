Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E73527CF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 11:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1756E093;
	Fri,  2 Apr 2021 09:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3E26E093
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 09:05:08 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id w11so2267192ply.6
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 02:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mCA52LnxgW5hjAvuxDGqbFSlZckDKlP65WIWKRvVIMU=;
 b=TaCV4uSnwrBEc8SboS0N1TQdq8jwpEVYiDzgV5Q/c0YHQHpVCNRvIgyrdwveKwTU+I
 ep4cMO5W2F4RfJnybDv/gK0MwddSRNWo3GTxLhM93agea/BZUqBwWd+16kJ7f2zrneDN
 pHby7c88i1xudNizZfIzh8rTXHh89Ig0Aed2I8MOU2KGZptsPQIwpJ/pC0uDJ4Oun7h5
 dUEw2bKQQ2UyyGrPs8FUCGQP2LVFfd32EODNdqmHiEGo/mqN+NmujuF6Lv1BeKFxLZDV
 fwTQupw84ZmUQwqeKtiGxg+jtD4icdRuktt2nBedEQAja9maMTjJuussoT3C8USaR4Wb
 5ojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mCA52LnxgW5hjAvuxDGqbFSlZckDKlP65WIWKRvVIMU=;
 b=V9eCxlocW20nMbBlw7mn3jFqand8XtZFyWPduF5OGSSvo6P2XrRfrbh2GxXCEZnK4K
 Z9u847Rp1lIn8P4nD19ZG3noLABa7/U/jhPczm74rSuTcDF6a8v4g2KKZ22RxNRsz0Dj
 GYOQ2n/xrymlnPaMTlihirTlz0iX9tHVhyb/O0NVSR8Ox5pv3mvtwDMzECK0Ra47PKj3
 MbPHMlLg/ViCv0WtxzE0T2yghonzCOmhwDzlNf6XICB/Lih8dTdD2gPC2xaoh9sRZTgb
 Tvf7Ue7ehs/nVK8Id9e2XlQ5CqDJrqTGYEOq9imw0Ym2Yj8Jk1XvgRVkeWiTKoaWtvTo
 BICw==
X-Gm-Message-State: AOAM532yIa/dVjzKnQ9rbYNa3ADuSdbxxf6Og8qHGHlshWYnCx2Z1+XT
 IclwOKq7pfLPJAfFptooYiY=
X-Google-Smtp-Source: ABdhPJwIE6dwJAZoV9M0FQR6LMsf6SjAEgt6wCg4eBQ8RCoATEiQSmZjb26E50hwZ7zQmqh0kHm3yg==
X-Received: by 2002:a17:902:a585:b029:e7:3d46:660d with SMTP id
 az5-20020a170902a585b02900e73d46660dmr11634771plb.12.1617354308017; 
 Fri, 02 Apr 2021 02:05:08 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id js16sm7332353pjb.21.2021.04.02.02.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 02:05:07 -0700 (PDT)
From: Carlis <zhangxuezhi3@gmail.com>
To: gregkh@linuxfoundation.org,
	zhangxuezhi1@yulong.com
Subject: [PATCH] staging: fbtft: change snprintf() to scnprintf()
Date: Fri,  2 Apr 2021 09:05:01 +0000
Message-Id: <20210402090501.152561-1-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@yulong.com>

show() must not use snprintf() when formatting the value to
be returned to user space.

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
---
 drivers/staging/fbtft/fbtft-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index 26e52cc2de64..7df92db648d6 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -199,7 +199,7 @@ static ssize_t show_debug(struct device *device,
 	struct fb_info *fb_info = dev_get_drvdata(device);
 	struct fbtft_par *par = fb_info->par;
 
-	return snprintf(buf, PAGE_SIZE, "%lu\n", par->debug);
+	return scnprintf(buf, PAGE_SIZE, "%lu\n", par->debug);
 }
 
 static struct device_attribute debug_device_attr =
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
