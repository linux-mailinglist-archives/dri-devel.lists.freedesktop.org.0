Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA8E77E81B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 20:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247F710E397;
	Wed, 16 Aug 2023 18:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B9F10E396;
 Wed, 16 Aug 2023 18:02:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0A5A62DBC;
 Wed, 16 Aug 2023 18:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EC3C433C7;
 Wed, 16 Aug 2023 18:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692208925;
 bh=gp3yZZEYckBcBiq4VFVIch47+nBca1xYajti9VUSwiI=;
 h=Date:From:To:Cc:Subject:From;
 b=HBWJCVNUjtLnjIq8WbmJ2KGhH+Kd7ZW9c3uIHfULCLaiVFas0AR7vH0HmvENgyIiv
 tB8w0MflSTiexZe2Jx7YA+npAHAxRSy/sPomD/YPO7JQrBNY5m2jMSHvQ/DjeE1rFA
 BEHdJTWG5Qspj3bn0WMUS6AMEAAcTNKYb05Luu+QFRHcuTlbYC+JkU36dUDt0VS0Ti
 oq0WTMdD7IdOCLr7kMbz+fYq3ZITmkBI7fPuCgJI4VJ/ifMB2heemvLgZQWvn8wxqc
 +wXYcc4r0VRUoy/+1b//G4oBQWnrt74O8tF0B26JhrzLjJeTEHhvDFzQAgVP+Q8RoP
 v719CEBxHNTzA==
Date: Wed, 16 Aug 2023 12:03:06 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2][next] nouveau/svm: Replace one-element array with
 flexible-array member
Message-ID: <cover.1692208802.git.gustavoars@kernel.org>
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
Cc: nouveau@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This small series aims to replace a one-element array with a
flexible-array member in struct nouveau_svm. And, while at it,
fix a checkpatch.pl error.

Gustavo A. R. Silva (2):
  nouveau/svm: Replace one-element array with flexible-array member in
    struct nouveau_svm
  nouveau/svm: Split assignment from if conditional

 drivers/gpu/drm/nouveau/nouveau_svm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.34.1

