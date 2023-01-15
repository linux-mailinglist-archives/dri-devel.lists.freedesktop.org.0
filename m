Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B8B66AF98
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jan 2023 08:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A8710E08C;
	Sun, 15 Jan 2023 07:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A27710E08C;
 Sun, 15 Jan 2023 07:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673766960; bh=k5POMcfBwYa5wr18jkQ33y/uNrey1LaJ5KoUUlzdv6A=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=LopZqf+yn1hhl0YuM6zkt2JTOg5AETKGr2sYtd1YDkX3LFcc0/mpG+HA27CTeandU
 C1XwxHwcbLUiL4I9ZHdOABKVLiT7lTn8cV8arwrwZG8YSEgUdOHx4oD+Fi6qYec/uZ
 zq1uKOAPSDBqEoe+qOuT7cZSKA8JFgKO7RAOrxbk=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sun, 15 Jan 2023 08:15:59 +0100 (CET)
X-EA-Auth: pNsW6gMqAA4UK+pay/T5Ic7nnC99FGL29jntdCvEEt0A2pa31p9Ixh21ivPxrrsr4A2rD8nmlS2jy69Y6D2ZZDT3/yrs+LLn
Date: Sun, 15 Jan 2023 12:45:54 +0530
From: Deepak R Varma <drv@mailo.com>
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/amd/pm/powerplay: use bitwise or for bitmasks addition
Message-ID: <cover.1673766696.git.drv@mailo.com>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch series proposes usage of bitwise or "|" operator for addition of
bitmasks instead of using numerial additions. The former is quicker and cleaner.

The proposed change is compile tested.

Deepak R Varma (3):
  drm/amd/pm/powerplay/smumgr: use bitwise or for addition
  drm/amd/pm/powerplay/hwmgr: use bitwise or for bitmasks addition
  drm/amd/pm/powerplay/smumgr/ci: use bitwise or for bitmasks addition

 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c      | 8 ++++----
 drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c      | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c   | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.34.1



