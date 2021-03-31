Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BB3350146
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 15:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F4D6E1D3;
	Wed, 31 Mar 2021 13:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA206E1D3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 13:33:17 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 z6-20020a1c4c060000b029010f13694ba2so1161521wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zT0meLCA0VO/9EkvNU2dr3oa0gbeQ37UKIYD0VY/kcE=;
 b=E4zMGA8DAjXcpEWG0RKe7cBN8786lVoc6g0q0Evz6FFA/87yW9aCvow5u0mDmu0ea4
 9Be38h77572bqcsFutNsQs+fxbeqlxN7DQQJ8O/1vG45CiiSBWkZC3VRzpNIm+TxmNIM
 4NbSMsTI4Zixi5egy04aHjCmMD62otoN5UUkez/xF38aIEPc0eQnREuilmgLRvnOOKj4
 td0iXrUBsozCVmMnTiLmX/DJlD2HXDcrAZXimsTDVoiaXfWE5HeUlrVrD7Ck4XLLr8Hc
 o/22xdCTPsgYor/Oux0gL8Doxgq/q7XwxB0Niaq/DnIz5n8z2Q3DM21N3XzJKIsoPw/A
 E7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zT0meLCA0VO/9EkvNU2dr3oa0gbeQ37UKIYD0VY/kcE=;
 b=tphj3eKEHfvUKQNessW37B0at/kmwy8fwVXQwBkhDluSiz0fgIPhcFf0YLHlcHG2tB
 FZhjEFNuKgqL6kNu8N5Uwf3hbJF+FkUTIjsgDVhWt++12cZIsagUeLOfSh6pBEfckBPU
 EtoF6umCero9a5/C6AiaSiCsX83Qy719D30mw/VLTY9luWg2nA6LoZprN4N9LiMmDmoE
 z3x1WEqFZtVKjVsdneqaUQJFIgyde6KXdo2oNnp8OYFCKNdq70S56ycbBtzkmWZfutdl
 iCgQDEnUa51vlWrd9GOtVa/XsCxRPK1RyKr7KpGxSuHtIg35+LJaA+LkzRCYPpPhKHcT
 5fXw==
X-Gm-Message-State: AOAM5317MHQuEwirbPK9dUDCel1bRgl8SN85MkWOFTik0HCJNAoDpRS9
 RZMw2oFS9KqD0DnGUnUF3ik=
X-Google-Smtp-Source: ABdhPJyxlEo/itD/dJAdKZgVzdEf6F+hwFaikXnZvwfZaZn/6JuYdXkjQedmDocFirG973iTdO+PPg==
X-Received: by 2002:a7b:c04d:: with SMTP id u13mr3164003wmc.83.1617197596186; 
 Wed, 31 Mar 2021 06:33:16 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb0008bd27007d57ea0d08d946c1.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:7d57:ea0d:8d9:46c1])
 by smtp.gmail.com with ESMTPSA id i17sm4567100wrp.77.2021.03.31.06.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 06:33:15 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v5 0/1] Fixes 30e2ae943c26 "drm/bridge: Introduce LT8912B DSI
 to HDMI"
Date: Wed, 31 Mar 2021 15:33:12 +0200
Message-Id: <20210331133313.411307-1-adrien.grassein@gmail.com>
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
Cc: a.hajda@samsung.com, dri-devel@lists.freedesktop.org,
 dan.carpenter@oracle.com, Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch fixes issues found by a static checker:
  - Bad handling of handling of of_* return values.

Thanks,

Adrien Grassein (1):
  drm/bridge: lt8912b: fix incorrect handling of of_* return values

 drivers/gpu/drm/bridge/lontium-lt8912b.c | 32 +++++++++++++-----------
 1 file changed, 17 insertions(+), 15 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
