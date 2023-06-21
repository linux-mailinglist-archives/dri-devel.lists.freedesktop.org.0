Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99995738431
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 14:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5415C10E45E;
	Wed, 21 Jun 2023 12:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAA810E45E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 12:58:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF6F8601D3;
 Wed, 21 Jun 2023 12:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC261C433C0;
 Wed, 21 Jun 2023 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687352321;
 bh=0wuMaCipc6KtZD0Xh4BIPnRA9SQTgc4eexJxe2sb/h4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DnIxgLCUvIzh7oUiE4sXzvtmMB8eohVtfVw3ccGZjd20l8Pfov8YBblQ2I5AieLqO
 8rYxI4a6G/6pPnuG7XNOjo3uWQVoRTyBIyDu8XYVsbRRvFAqz6gQDRBpvQiwBw1vOP
 v1nRx4Hi8TzBJcjaQdtfEJqfWp/eIQkkbhoVJkt8eCHWJaa+wZ0pqgBvmOU61nEQvB
 t8Yo02QHYnakBa22j44k/ai3AMOxTzRzzqLL6HEW4sLOA7xaWRyjrrcPwAruk3tvgu
 LGmQHAdg+wQvuxH935NPBC0OY0BXRK6WbqF6LPllU4Dh5fb2+Jakhu/hm8g/9Q4UcB
 dEKpBDjARxHew==
From: rfoss@kernel.org
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: Re: [PATCH v2] drm/bridge: lt9611uxc: Add MODULE_FIRMWARE macro
Date: Wed, 21 Jun 2023 14:58:34 +0200
Message-Id: <168735229147.2587713.1545878591431982417.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620061254.1210248-1-juerg.haefliger@canonical.com>
References: <CAN6tsi4jdDD20DY5sKL+ALC_Mk2UHRArOrQnjzKoyF30QZi8jw@mail.gmail.com>
 <20230620061254.1210248-1-juerg.haefliger@canonical.com>
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
Cc: neil.armstrong@linaro.org, Robert Foss <rfoss@kernel.org>, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, andrzej.hajda@intel.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Tue, 20 Jun 2023 08:12:54 +0200, Juerg Haefliger wrote:
> The module loads firmware so add a MODULE_FIRMWARE macro to provide that
> information via modinfo.
> 
> 

Applied, thanks!

[1/1] drm/bridge: lt9611uxc: Add MODULE_FIRMWARE macro
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=354c0fb61739



Rob

