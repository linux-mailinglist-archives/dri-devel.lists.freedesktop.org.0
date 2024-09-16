Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F19897A292
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 14:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550F410E35B;
	Mon, 16 Sep 2024 12:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="itD/OWPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.math.uni-bielefeld.de (smtp1.math.uni-bielefeld.de
 [129.70.45.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD1C10E35B;
 Mon, 16 Sep 2024 12:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=math.uni-bielefeld.de; s=default; t=1726491258;
 bh=/Z5Nn18wF5NFp17J1Z5FLfwLIoP3zSuoMbx4aP+cBHo=;
 h=From:To:Cc:Subject:Date:From;
 b=itD/OWPKAKUj+wCKHLBgTm39Polq9kxX0othsq+7RXf1tn1Cq2a6hqbB/2ow1AutG
 CBjfADJU6M9Je2HhqrDr3IJMSaDJpuuaz1t41tVDwaxmm5i5D33ACJjfcxCsgsz4aG
 lj7BqqTqp4Nxus2WpetvIEiRFmVJqKjLupkXAQIV0SbVNYB0RWTaEf+Kk3SqMoywd0
 ieANETr9Y6lLvS7MzkT0Ox74I7zJ5/11624wm9cwGR2Q/9NBAXlIpk2NAdPEraGoT3
 jRXuNvCQOUj81nmG/uHLixQhhZY52Oj1Zy2R3nbfXx8YyCu2XkHHoz8xLAtsX+r9l1
 lmlTSlWXsct6g==
Received: from localhost (dslb-088-074-203-146.088.074.pools.vodafone-ip.de
 [88.74.203.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by smtp1.math.uni-bielefeld.de (Postfix) with ESMTPSA id E994B20359;
 Mon, 16 Sep 2024 14:54:17 +0200 (CEST)
From: tjakobi@math.uni-bielefeld.de
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 0/1] drm/amd: more VRR race fixes during IRQ handling
Date: Mon, 16 Sep 2024 14:54:04 +0200
Message-ID: <cover.1726490926.git.tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.44.2
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

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello,

this is a follow-up for these (already merged) patches:
https://lore.kernel.org/all/cover.1725269643.git.tjakobi@math.uni-bielefeld.de/

A user on the GitLab issue tracker pointed out that the problem
also manifests itself on DCE110 hardware.

This is a straight port of DCE10/DCE35 code.

With best wishes,
Tobias

Tobias Jakobi (1):
  drm/amd/display: handle nulled pipe context in DCE110's set_drr()

 .../amd/display/dc/hwss/dce110/dce110_hwseq.c | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

-- 
2.44.2

