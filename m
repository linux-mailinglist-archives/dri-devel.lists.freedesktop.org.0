Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1509895FC7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 00:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3040F11212C;
	Tue,  2 Apr 2024 22:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="SwvVNHVe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231EA10EEB4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 22:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1712097819; x=1712357019;
 bh=MR7zmTwADGewdo6zllRIZ/UTARO0kkmfGknWcirmVYw=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=SwvVNHVeQJJLFM/VFfha1Ro2bdtkvE5DpYjEM//3CSt7emQnfjGMN3H8Jh9Th1BpZ
 sOMXFe42Ta/5TWlWUm2Pm5Z3YpV+dv1CPiUEbtSHWM/VQ4gwcdG+45l7GQZw07geXP
 5v33aTQ5VxoWG/NUBE0tzO7FAuVwsgnehs17WP8Z2WSSfm1AY1spHktsK0VFKDMmxU
 rU4lRvX2DR+Vl55p7RNoB+75Z8cCpMxMVS6O8W2tSFnpZsnb1dziTx+uZ0U76iknzn
 pKA4KLXlhGAsBr14vknhm26iFGg+oOZoB1Vq7IPZpuAX+1qW8zEF8QigG7rTl/nE/S
 5J5UaalFVPJNg==
Date: Tue, 02 Apr 2024 22:43:30 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Nicolas Devos <ndevos-dev@pm.me>
Cc: Nicolas Devos <ndevos-dev@pm.me>
Subject: [PATCH 0/4] gpu/drm: Fix checkpatch warnings in drm_connector.c
Message-ID: <20240402224320.12146-1-ndevos-dev@pm.me>
Feedback-ID: 76711691:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 02 Apr 2024 22:48:59 +0000
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

Hello,

First time contributor here, I am getting familiar with the flow by
fixing some checkpatch warnings. This patch series fixes the warnings of
drivers/gpu/drm/drm_connector.c.

The result is 4 patches that each address a separate issue raised by
the checkpatch.pl script.

My initial attempt [1] was not accepted, this patch series addresses the
given review comments.

Please, let me know if something is not as expected.

[1]: https://lore.kernel.org/all/20240222204450.7943-1-ndevos-dev@pm.me/

Nicolas Devos (4):
  gpu/drm: Add SPDX-license-Identifier tag
  gpu/drm: Remove unnecessary braces
  gpu/drm: Prefer `unsigned int` over `unsigned`
  gpu/drm: Replace tabs with spaces in comments

 drivers/gpu/drm/drm_connector.c | 722 ++++++++++++++++----------------
 1 file changed, 361 insertions(+), 361 deletions(-)

--=20
2.42.0


