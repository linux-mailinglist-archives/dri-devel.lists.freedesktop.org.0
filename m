Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A60E3F2773
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC196EA1B;
	Fri, 20 Aug 2021 07:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA496E4A5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:37:00 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so10928388pjr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 02:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XW9PBRfUXR7lnr+qB3HOr4k2j7y13kRSAoHN05D6Ifg=;
 b=tMJ6T7rZrbMHpuI49MdvPgIw++TqLyvcE52F74ro1cNUFIh3J9cgwyDruxe3emulQ6
 LFLB4m0VGbp+Qu+Pl101VawED6Bnvb249mmHKGfoVyF1OgRCKt7BEIBQYcmWzxl0DZIX
 VBkfC0EewNXZydAcWJ+1LngX/Iqlr6P474cXsIQLJaqI3CXcLdb85YMPDRjf7ksaZCoi
 WaLCrEYUBJQV9QIK+oUkIYXqWVvhUysg22BD/LatL54XVyGiegpznoP70rNol2uYzCrq
 rGJF6aAnL2nvReMQ8d22WVUbY7iskY+OrKtIhIQC0L/x6FrzzW7XEkYm6zAPW1I0eA/O
 pskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XW9PBRfUXR7lnr+qB3HOr4k2j7y13kRSAoHN05D6Ifg=;
 b=FEdT/+qt6G46C9o8P5Uk60nw18X+L8Rjz6nd+a3LBlRlTJxIXDJ5WTRTm5OmDvDkCc
 C8BXu9mB6jDPTLH0JHtI0SnB7mPBR+wZ2Np6H75Ki9wzdot+2WZwzt8MUg4tgbjJihc0
 4ATo+sMQCur9ivmGr+c3FzARsLWlVZb5jIRoN2Hvi1AL8OceTn0rK9QTaWo0FaKSbgcz
 /anZqwJztMqbsl2I9/KvYdyLfMtNaAj4f5rk4tFg1w9Hs+bZ+D34Tv0DR7INudsRjy6R
 seGN9VGB9vymKtJlRtI06SFafl8A+xfqJP/pEIFUqu9ZTdijHV3bDl4iGOeYnSd2duoG
 gEdw==
X-Gm-Message-State: AOAM531l2CLBZaLYx/vI/z5zgAX+xeIYPZMerigZKh5uKylxXwrDyEKZ
 Ian7ZkMsD+tdP4Q2uvuQVoj4Cg==
X-Google-Smtp-Source: ABdhPJwYzT1AYjcTI/b2b9YYKNV2cDJG5ULU7rcqPSEwwwtNM0owY30bfZlrHSISkmu+B/QUtlBRdg==
X-Received: by 2002:a17:902:9b89:b0:12d:7f02:f6a5 with SMTP id
 y9-20020a1709029b8900b0012d7f02f6a5mr10982886plp.39.1629365819935; 
 Thu, 19 Aug 2021 02:36:59 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id u20sm3195378pgm.4.2021.08.19.02.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:36:59 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: yangcong5@huaqin.com
Cc: dri-devel@lists.freedesktop.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] no review: test for uploading patch
Date: Thu, 19 Aug 2021 17:36:54 +0800
Message-Id: <20210819093654.719854-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:16:30 +0000
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

no review: test for uploading patch
---
 drivers/gpu/drm/panel/panel-simple.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 1b80290c2b53..fa4925e5b1bf 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -42,6 +42,10 @@
 /**
  * struct panel_desc - Describes a simple panel.
  */
+ 
+/**
+ * test patch for panel.
+ */
 struct panel_desc {
 	/**
 	 * @modes: Pointer to array of fixed modes appropriate for this panel.
-- 
2.25.1

