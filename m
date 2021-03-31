Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 804D634FE3F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779016E1B4;
	Wed, 31 Mar 2021 10:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6772A6E1B4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:43:16 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b9so19135524wrt.8
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qwynp6ONyLsCD+/E+FpuwoxOP1M0d6Gsgz8DtcDSpgk=;
 b=XUvi76u930hP1v7YpjqPIaYTCmdIWC1BVDYuKkjJC8/AQc8sCk3g7UAaShf94yWRLW
 mwJNxm6Et8yDOXWxaLF/6gUPs956/RLUEOhwRYS8trqrLKDqMabWQ0UF3MQ6lwrSHFBx
 MD0wU81teNj7MW0tLo8/krwkPZyRSd9uF0Mtu/MW/Y8pM8YHsJ+Z+GZLPELJdm3Tglrm
 nShApeZGLfILLg8u2j0YKWWoj8lnPIiyPZUhu6k5aKoE3TpvxGiTY14CFDf0xIAlyWg3
 +sbIMJTjv76yJF+xVGshEWijGBROfo8et0fr6Xc0a5BqbgQl8xmBIb5EbYUdrbqHawUS
 Bs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qwynp6ONyLsCD+/E+FpuwoxOP1M0d6Gsgz8DtcDSpgk=;
 b=mzzt7vO+FNG0WjyeM/QdoZ7CJ98VZh2hinlhobkp9H6UyQf4BvIzKD2tUKuqWWqdck
 TeDsIbSWueulpav3nvUDIDdIxsuChQng2ZeKSv2A6aIZfoUz66UeSF6ImRFwyicBG3VU
 0Ms1vv+TnQLIqN1PkMouFlVqla5fLjo1xz/HsfUnh57Wg2Y0pVU2M1vDjhZB++TvmuyA
 X4QbMd/iczGoZiucLV7CCWr18a32bd4+sxch9mRt+mOehXNR/WxPvGlpaKZzxoQH5pfF
 tdcKoMhLTVUMk4xa1cjRX6UMJO/gC+WS1vx4lat7SnYuJ6F6JwOD4Sv39p0iqLFUDH1A
 ILSg==
X-Gm-Message-State: AOAM530/9AwzyLkSqIGmG8TWx5I91aV9M4HRYeEh1yvupLESfiC4hNkC
 WpqaJDdV7sFKS+hxEyBFlBw=
X-Google-Smtp-Source: ABdhPJzjfKjHlkIqEPpf/4hP5pjMTRNOyC61nAjtFMMrP6SMao7qdxvEMasMwmgjhDvK1aQR1q7nXw==
X-Received: by 2002:a05:6000:18ab:: with SMTP id
 b11mr2859126wri.403.1617187395206; 
 Wed, 31 Mar 2021 03:43:15 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb0008bd27007d57ea0d08d946c1.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:7d57:ea0d:8d9:46c1])
 by smtp.gmail.com with ESMTPSA id l8sm3780872wrx.83.2021.03.31.03.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 03:43:14 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v2 0/1] Fixes 30e2ae943c26 "drm/bridge: Introduce LT8912B DSI
 to HDMI"
Date: Wed, 31 Mar 2021 12:43:11 +0200
Message-Id: <20210331104312.328820-1-adrien.grassein@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, dan.carpenter@oracle.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch fixes issues found by a static checker.

Thanks,

Adrien Grassein (1):
  drm/bridge: lt8912b: Fix issues found during static analysis

 drivers/gpu/drm/bridge/lontium-lt8912b.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
