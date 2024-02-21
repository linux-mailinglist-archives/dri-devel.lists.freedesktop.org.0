Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829A085D520
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 11:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D0610E6D7;
	Wed, 21 Feb 2024 10:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B61B10E6E5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 10:05:37 +0000 (UTC)
X-UUID: f8f4a4c73756420db3cf6e8ab271d598-20240221
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:134349bb-e8f3-4364-ab0f-8b59cd6c96bd, IP:10,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-5
X-CID-INFO: VERSION:1.1.35, REQID:134349bb-e8f3-4364-ab0f-8b59cd6c96bd, IP:10,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:5d391d7, CLOUDID:0bf7a480-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:240221180023CP571469,BulkQuantity:0,Recheck:0,SF:66|38|24|17|19|44|1
 02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: f8f4a4c73756420db3cf6e8ab271d598-20240221
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <chentao@kylinos.cn>) (Generic MTA)
 with ESMTP id 1544235045; Wed, 21 Feb 2024 18:00:21 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id F037FE000EBC;
 Wed, 21 Feb 2024 18:00:20 +0800 (CST)
X-ns-mid: postfix-65D5C9B4-760618111
Received: from kernel.. (unknown [172.20.15.254])
 by mail.kylinos.cn (NSMail) with ESMTPA id 9FBA0E000EBC;
 Wed, 21 Feb 2024 18:00:18 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH 0/3] drm/amdgpu: Use KMEM_CACHE instead of kmem_cache_create
Date: Wed, 21 Feb 2024 17:59:04 +0800
Message-Id: <20240221095907.172408-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

For where the cache name and the structure name match.
Use the new KMEM_CACHE() macro instead of direct kmem_cache_create
to simplify the creation of SLAB caches.

Kunwu Chan (3):
  drm/amdgpu: Simplify the allocation of fence slab caches
  drm/amdgpu: Simplify the allocation of mux_chunk slab caches
  drm/amdgpu: Simplify the allocation of sync slab caches

 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c    | 4 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c | 4 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c     | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

--=20
2.39.2

