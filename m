Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E446488ACF
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 18:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650E310E7F4;
	Sun,  9 Jan 2022 17:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25D610E7F4
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 17:09:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 637D01F437F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641748166;
 bh=8W7vBIEgSnoCkPMKRIa5QuPFZzJdKKSxbNZQLAq5WS8=;
 h=From:To:Cc:Subject:Date:From;
 b=orqjbdhdJuzL5HMSFOiSCRnMmdn5Fxos4p/nbM0D204YVG9TkYv0wRScQsjK5Ru+p
 fK5BHNKQmmE805OlbwoDPUSTDF1wv0uoQOPeA8sWslJCiyuUhu6WSQhT8SRJ4pedI0
 QUZ6GeqbBGXfBlQmcLdYB/fHJGvuSlIYThxLhHMssyJdyXuRsN2mPv79ARcbb6ws8p
 8dAI7jdWcmaeTiUmj1oajpzRM6hoR9hDyy+1+M+B+tNKRbnowfh4TwEJP0LlieW6gH
 pYsH3J2KTl143grl2tHwCVftv87mDKCpoGk7VR+4BWm7IqF/ZQlSrghhBw1QjRx40e
 x3vReOwgRkt9w==
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/panfrost: Clean up our feature lists
Date: Sun,  9 Jan 2022 12:09:17 -0500
Message-Id: <20220109170920.2921-1-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've cargo culted a large number of useless feature bits from kbase.
We're about to add support for a number of new Mali GPUs into mainline.
Let's cut down on the copy-paste required and clean up the feature lists
first.

Alyssa Rosenzweig (2):
  drm/panfrost: Remove features meant for userspace
  drm/panfrost: Merge some feature lists

 drivers/gpu/drm/panfrost/panfrost_features.h | 212 +------------------
 1 file changed, 7 insertions(+), 205 deletions(-)

-- 
2.34.1

