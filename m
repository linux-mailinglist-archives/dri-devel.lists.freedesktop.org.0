Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E92781D3B
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 11:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBBF10E065;
	Sun, 20 Aug 2023 09:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr
 [80.12.242.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B315C10E065
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 09:51:29 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id Xf5hqwKJwP8tnXf5iq04g0; Sun, 20 Aug 2023 11:51:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1692525087;
 bh=Mh61Dvqgft6jmx3lrPrBaNnQEkuCgovy2orBj5LwvkM=;
 h=From:To:Cc:Subject:Date;
 b=P66eIAB0ilchO3DxiGNwVbTmhNv/U6gsfPkzH9QXC3zpFhFiqJlCIeA2dACx9CTzS
 pi3tnzo/2pz2MaKGt0p0iOAXeuU62m/eL8HyaDsqyxj8KtWSqE6uodGkbrE2tTdsZb
 1V/gkLCuVTQStoff3xpdxZZ3nLK4j5mE7JZrLDVP/yYLzLGWWOW0kdxjWqjhnA2W+4
 yfiwiTnPTRSzI2tlirYSSxMSH6pXgGrhkhzZjpKVrdN4cGXVnJsqGXYf6wQY1Tuh3s
 QC5mSwfHYVj+/Vyfr30UDwPNZU9IV7Hm6Uzz90Rfq0nrhcmpNzhaA6s99jQo1Kt3xB
 XCjra/tiLPySQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 20 Aug 2023 11:51:27 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Felix.Kuehling@amd.com,
 Arunpravin.PaneerSelvam@amd.com
Subject: [PATCH 0/4] drm/amdgpu: Explicitly add a flexible array at the end of
 'struct amdgpu_bo_list' and simplify amdgpu_bo_list_create()
Date: Sun, 20 Aug 2023 11:51:12 +0200
Message-Id: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This serie simplifies amdgpu_bo_list_create() and usage of the 'struct
amdgpu_bo_list'.

It is compile tested only.

Christophe JAILLET (4):
  drm/amdgpu: Explicitly add a flexible array at the end of 'struct
    amdgpu_bo_list'
  drm/amdgpu: Remove a redundant sanity check
  drm/amdgpu: Remove amdgpu_bo_list_array_entry()
  drm/amdgpu: Use kvzalloc() to simplify code

 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 15 ++-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 18 ++++++------------
 2 files changed, 8 insertions(+), 25 deletions(-)

-- 
2.34.1

