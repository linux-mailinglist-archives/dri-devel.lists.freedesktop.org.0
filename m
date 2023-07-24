Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D96675EDF2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 10:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C8A10E288;
	Mon, 24 Jul 2023 08:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4781710E288
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 08:40:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEA7160FD6;
 Mon, 24 Jul 2023 08:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E84C433C7;
 Mon, 24 Jul 2023 08:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690188030;
 bh=C+g9lG7y+eHxmO1DwvFohayuG7Vw2U1uWFRqR4wxhvc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zp+lKC9DOiigHNG7q4UTl4zLFUZ3u+UJNI538qU43plYIE2VKFmGOeZwCOSS2BZ3d
 e0l45C0PzhcsLBN6UWj1A/25BZUQ70BgTD4hItlo290nJWbMz0WGz6pHnJ54dcIfvm
 C62bJnH8MiuHNRXx7UK4PYWEM0ryG7KIrngsSzGw3aLlzPLpzdqdah9OEgees9xN2Q
 pUq06vnn8fJ03YBc9HGWqzBs03qgNBstAWgQ9Se6Y7BlVaFOYsiTAo3K7DCancBEQ9
 F/OMBfgBU5JMeLtMYsMHLEWZzT8Ry7KLMpjDqO8DBztR4FyjKSIFbEvRx7gHVZ3uu0
 DtVthmtXskZCw==
From: Robert Foss <rfoss@kernel.org>
To: Xin Ji <xji@analogixsemi.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v13] drm/bridge: Remove redundant i2c_client in
 anx7625/it6505
Date: Mon, 24 Jul 2023 10:40:22 +0200
Message-ID: <169018800611.622568.1753290816240362291.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718110407.1005200-1-wenst@chromium.org>
References: <20230718110407.1005200-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Robert Foss <rfoss@kernel.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Jul 2023 19:04:05 +0800, Chen-Yu Tsai wrote:
> From: Pin-yen Lin <treapking@chromium.org>
> 
> These two drivers embed a i2c_client in their private driver data, but
> only strict device is actually needed. Replace the i2c_client reference
> with a struct device one.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: Remove redundant i2c_client in anx7625/it6505
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d65feac281ab



Rob

