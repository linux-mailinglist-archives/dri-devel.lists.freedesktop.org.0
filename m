Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2F18C8E87
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 01:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9543610E1AE;
	Fri, 17 May 2024 23:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="JcJJl6aT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05A910E1AE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 23:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=AFHUEHUttj3PoDuFCI71PF6Zpu8Q0rUHLf9AFzmuamw=; b=JcJJl6aTOkVL2qMk
 w/Qqk7ciOT38iPUKRy5V8z+nchHOBlmKyuKX0CnGtg0fv+GwO7rzW1Tzk8OlX0qIhnBKiJkKmLANk
 J79CYmxhfdiJA8cADzk/l4KKsIwP86XOujSozL0/cGO4NY4TMcYa+jbWdv6tmblR3EAMywomH4hUf
 sIIfCU9rW8tmIPSEV7/GM16V7K/KpIWUaq1LDw1JJgavsy9dQfZRYKS6R1GIkNu2J5PbYk6+IYb0G
 1HP5npgnQzBmyCXXo9NC9xdck6GVeRK7JwniOn0LWhzWtcDbbztaDOalmoJnlUmQS6p9p9FF+zoBv
 cG54J1QEoF9Av3ZPpw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1s877A-001TpV-1f;
 Fri, 17 May 2024 23:35:53 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/3] A bunch of struct removals
Date: Sat, 18 May 2024 00:35:45 +0100
Message-ID: <20240517233548.231120-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

A bunch of deadcode/struct removals in drm/amd

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (3):
  drm/amdgpu: remove unused struct 'hqd_registers'
  drm/amd/display: remove unused struct 'aux_payloads'
  drm/amd/display: remove unused struct 'dc_reg_sequence'

 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c         | 38 -------------------
 drivers/gpu/drm/amd/display/dc/dc_helper.c    |  5 ---
 .../amd/display/dc/link/protocols/link_ddc.c  |  4 --
 3 files changed, 47 deletions(-)

-- 
2.45.1

