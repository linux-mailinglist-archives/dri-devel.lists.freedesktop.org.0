Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFDA7A4688
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 12:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD64910E257;
	Mon, 18 Sep 2023 10:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1F410E257
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 10:02:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBDA760FCD;
 Mon, 18 Sep 2023 10:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E93EC433C8;
 Mon, 18 Sep 2023 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695031339;
 bh=Je/16HiNm+mVAuAQ2J+Ice+5GbTtVjM5LaV9JBki6y4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SkFvP8Oco1kkq44RFieLc9vcVNvQTX7qenUI9CHhSJ7JUpY5D4d3OgGAkrOSo9s5J
 E3DV0aMAd9L9zUAjYL8MN6LaorwqMF+QC4qCJZMd0eHSNOBsZlMUTyupZNq1yQhP+C
 8w4UN+h1fZAOIKWfWnnKRC4B/FhEcEU0VELB6jr4pqSm+LVz2rdheqoA6x2SzTy7O9
 YXoxFwx4RWQanhhvByggOm4pof6LxvIbhN4S9JZVQVL2wKM85dHOV6DVAEbpIbNWrs
 MpUYnxWn8ZSigzAs/vxqH93BV7hfXa669GyCpZWj4tJgsE9fQBM4IPSTy3d44mooUS
 5B/cDMEmSR+4w==
From: Robert Foss <rfoss@kernel.org>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 hverkuil-cisco@xs4all.nl, Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20230909144432.34972-1-jernej.skrabec@gmail.com>
References: <20230909144432.34972-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi-cec: Add arbitration lost event
Message-Id: <169503133690.2474759.8647020524876306057.b4-ty@kernel.org>
Date: Mon, 18 Sep 2023 12:02:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 9 Sep 2023 16:44:32 +0200, Jernej Skrabec wrote:
> Add handling of arbitration lost event.
> 
> 

Applied, thanks!

[1/1] drm/bridge: dw-hdmi-cec: Add arbitration lost event
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=484281d5436c



Rob

