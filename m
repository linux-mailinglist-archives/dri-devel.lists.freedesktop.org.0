Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFB0C702AD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 17:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6DD10E66C;
	Wed, 19 Nov 2025 16:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jsCS+yAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD52D10E036;
 Wed, 19 Nov 2025 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763570625;
 bh=i0zurEnSwsPcjxf6RAxHlGjp6670nPJPxV5R4vji840=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jsCS+yAWjRAXIaj62KXyowPtCG/qJKRZ/mQ1dtyFVlxbIPYAnt+KxVmnfa43Rcdoj
 HWfxrMDqhbmViLAYZnqfZZ+dP7mWgdd1GlTbhQ1NszcrnyUM1CRkdOorvrFUWoTcPO
 C7ieos+9ppayawOwRVya0T00y4MVT/8Jkar2Z6oeG3oVL9Kgk9hMsnhUk3P2F7dN+s
 820gN/ftXFhsJDDGgXXav5S6W97wGOrnhIOsfDxre4gO13qaiz179vAPU62y86VJZi
 kB9YQ9ZTMBKQ823RX0Sp8XyYFpVf0rdLZ7iCWgpOtRpgTj+PAZDN+H2XGpwaLJj3aC
 zkgq43X14nfNQ==
Received: from localhost.localdomain (unknown [92.206.121.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gerddie)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F2DFA17E07EE;
 Wed, 19 Nov 2025 17:43:44 +0100 (CET)
From: gert.wollny@collabora.com
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] drm/etnaviv: Add support for running a PPU flop reset
Date: Wed, 19 Nov 2025 17:45:46 +0100
Message-ID: <20251119164624.9297-1-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110144625.18653-1-gert.wollny@collabora.com>
References: <20251110144625.18653-1-gert.wollny@collabora.com>
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

Dear all, 

this is the fifth version of the series to add PPU flop reset.

Changes w.r.t. the previous version are:

  * Apply all changes suggested by Christian Gmeiner:
   - fix a memory leak that would occure when PPU data 
     initialization fails
   - remove unneeded includes
   - move includes to the files where they are actuall needed
   - fix include style for "linux" headers
   - fix typo in error message 

  * add Reviewed-by tags to the according commits 

Many thanks for any comments,
Gert

