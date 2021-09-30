Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B15841D32F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 08:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E912D6E2E6;
	Thu, 30 Sep 2021 06:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDE96E2E6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 06:20:30 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so6000854otb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 23:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=HiybMtL3oTOqhfbzpPHAJ82Ac6PGi35Tix6YKtj/MUY=;
 b=WnAs56WTHuame0wISzaU1D/eX+SGWlP7Wu3CcXRT8U/GA+4+dJsAhPvIUpWlUbmiaa
 Ka2IEb9O73r4piCt3uIbjVrzgZ3ZqBUFwTME0twyG3c/DAXz8SMaFRIBFNeMbyhHYACd
 JgwFyW8o4Lz3jabhEMLRfcYvkJa/ZsEotAS/f/VS41cm3So6figvx1bZdZHhRbw1g3el
 7Xcce7AmZlP8QEeOTg+QFHr4dekxE/H5fzFiXUsmBtS6YFs6HVJL0Q9FbVpkNXz0qNLu
 ZuDK57bK2dXOtyEZyiheD+y+PlkB2BsGjuh/nJtgnuKuerKK38ZBod/Rvur1I8wc99wW
 EAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HiybMtL3oTOqhfbzpPHAJ82Ac6PGi35Tix6YKtj/MUY=;
 b=3iKAGC8kvdFjEGf/cxxlDmb7/YGnAva92uPW0ubct456UiU0jFoaToke93sR9kA21E
 u4kgKlI7mzw3oQ/VVLjM8151PlKke0Z3CIl57wJ6NSmJwu0Sy0cRJywHKl63cVaxiX6Y
 cdiVjiLFMPCeDkSuI7QZ4MwDbw4qDb2DwjF8S2Up7VE5kNwpCNuOWnMgqVILrreOpMV/
 VtaV0o07R9T0UbQySNvyHFkgss8j7fTU0qnIoqFVFxzzIihK21T42xdLteQ+SkU38z0P
 XHI3qOGxbi/ToyJttz0m20yZIwpnduqSBezVM6I6bL+okxmwPm12XpNOWFi97UWkqWXd
 2sJA==
X-Gm-Message-State: AOAM530NlohKKV9f1tuIsKwaC9ycFzPA7iOMj/Pr6VGe8pGLi2ynbWAw
 xKfM07D1tLKHDoNVJQflm8D9bQ==
X-Google-Smtp-Source: ABdhPJy3Nqgd6MRL81ECqIQqY6DRWIZ+hD9vIeH8yHHvPsFEreTwXeQsyGNYWH6if9e/Wa/v1gWXLQ==
X-Received: by 2002:a9d:1913:: with SMTP id j19mr3740651ota.166.1632982829691; 
 Wed, 29 Sep 2021 23:20:29 -0700 (PDT)
Received: from tyrell.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id x4sm421228otq.25.2021.09.29.23.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 23:20:28 -0700 (PDT)
From: Shunsuke Mie <mie@igel.co.jp>
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: Shunsuke Mie <mie@igel.co.jp>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jianxin Xiong <jianxin.xiong@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Sean Hefty <sean.hefty@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, dhobsong@igel.co.jp, taki@igel.co.jp,
 etom@igel.co.jp
Subject: [RFC PATCH v2 0/1] Providers/rxe: Add dma-buf support
Date: Thu, 30 Sep 2021 15:20:13 +0900
Message-Id: <20210930062014.38200-1-mie@igel.co.jp>
X-Mailer: git-send-email 2.17.1
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

This is an user space counter-part of the kernel patch set to add
dma-buf support to the RXE driver.

Pull request at GitHub: https://github.com/linux-rdma/rdma-core/pull/1055

This is the secound version of the patch. Change log:
v2:
* Fix code formats that were indicated by Azure CI
v1: https://www.spinics.net/lists/linux-rdma/msg105380.html
* Initial patch set
* Implement a callback function for reg_dmabuf_mr

Shunsuke Mie (1):
  Providers/rxe: Add dma-buf support

 providers/rxe/rxe.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.17.1

