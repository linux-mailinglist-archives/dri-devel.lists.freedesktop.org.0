Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC7A3F2726
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F556EA09;
	Fri, 20 Aug 2021 07:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F65B6EA09
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 07:01:20 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id w68so7796640pfd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 00:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uizvbGrAGell6LdMB1pzSSzYApXRoXyVsqw6ZRcvWA4=;
 b=BJYUrFZ9DKhzh2jtjSHliM/sUyutwap8kXXatN7VNsHRkqUaEMHI0mgCMg71KIsfIa
 sHRABIlGwPDk9U0wuYM7nD9ZR46XCJioaK4B5M/3w3M2PRk0dfwS2cFFuiRlKqQjW8jY
 tvZDca81USJumwU1FGDACrFZ+43bz8u1lL07+03u9dIifBvSyzwbnCfMQm07mzorr11t
 DKZ+yQZNPVjLx4uPTkwnmb+bTrN7j6PhdX1zZtn2NitTfqZE3ykeUOOd4xGx1vKMKsgQ
 IGRajXCJ7KpvmH0bjca2WfCe2Myw5sbtCIvu7VnhYNcor6UlH+TBB08ZRrgl5tkerJw6
 YpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uizvbGrAGell6LdMB1pzSSzYApXRoXyVsqw6ZRcvWA4=;
 b=qmFOAwQg4SfnWrGnxu7Z9I0CKwyopTEY3i3esgXL0L0/04VdMSQ+BHuGvd+ljOy3xK
 LAByFeDDjD16I8/8a+iU/lSQyqGl5unY+ecSTl6DCfIoJLeZk01zd67SjY36lkCTyahr
 UYv+cw466NxoygMSKg1Hix/2/LU+GAKno/XZIfR3OzewZiGuhNDnb+VTiXkHOWeJAEEg
 QSqXzN1j3E3N+0KPNK9muMv1LRKxQ3WaSFgqdayC2iN82R7K/Z2KuuEOioEUUTVdbK0U
 DyIxJ3dvUU3IcXIXW8CiFpCtAfiG5xvCQOvQeuEHyPAmRrDDOmlPhvky6dbXO1HBJHWo
 g46w==
X-Gm-Message-State: AOAM533IVnCjcLPLNcCd6gBqMXkifJ8BvTXXLVa4azx9vD3BbiCoOf7n
 6O6J+qMPGkcg0gA5u6dQWJ2hQw==
X-Google-Smtp-Source: ABdhPJzfJ+DCZPI4sqU98a4xQTh0riCfmuT/fjUp76IHPE4Py5imMiqbWi4NOtRQ499oi0xCi3x/GA==
X-Received: by 2002:a63:5445:: with SMTP id e5mr17406690pgm.100.1629442879762; 
 Fri, 20 Aug 2021 00:01:19 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id hd21sm10539997pjb.7.2021.08.20.00.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 00:01:19 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v2 0/2] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
Date: Fri, 20 Aug 2021 15:01:11 +0800
Message-Id: <20210820070113.45191-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819124844.12424-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210819124844.12424-1-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compared to v1, "pp3300-supply" is removed in the required list:
dt-bindings: drm/panel:
   - reg
   - enable-gpios
   - pp1800-supply
-  - pp3300-supply
   - avdd-supply
   - avee-supply

yangcong (2):
  drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
  dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail

 .../bindings/display/panel/boe,tv101wum-nl6.yaml      |  3 +++
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c        | 11 +++++++++++
 2 files changed, 14 insertions(+)

-- 
2.25.1

