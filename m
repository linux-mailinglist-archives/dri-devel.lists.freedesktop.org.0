Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ADA70E2B4
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 19:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E168610E481;
	Tue, 23 May 2023 17:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF6110E481
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:21:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26E0463504;
 Tue, 23 May 2023 17:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C999C4339B;
 Tue, 23 May 2023 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684862516;
 bh=VonElC8wOqM+LDZvf96EDpTmmf7XGYZNo7lSoNX7MvE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qgkgY52gosRPlhPkg1lcyCVYJ7yXg4hXYtHMPyRd+JWfGqeP3zQeyTWwo5IeHQaJx
 l2+hWw/h7dl8814tBajCwHeIUSsuF/F+uHBAjWsl4vZ2UKSgMi3zo7ZrwiXm6FBVw0
 qsODYwcepkXjxczxys9GWoEK1o5Ph091t9Q8glEncAhOhas2VdeLt0FFO5qXFMBAAN
 fHLf3iBrfZYxhTfJW9HplhGaLGPEAmc5ec6M2jLvUZfFfwzVe8s/af3IloZ075S803
 wTji+8LNmZpOy934aXtQGDd8qxCTWU7uOdZqGti42iYO5V/dYdnInZPxg4CXbecNwk
 4uju8eX08/OtA==
From: rfoss@kernel.org
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Azeem Shaikh <azeemshaikh38@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Replace all non-returning strlcpy
 with strscpy
Date: Tue, 23 May 2023 19:21:49 +0200
Message-Id: <168486250045.3617730.17499429425987433532.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522155210.2336690-1-azeemshaikh38@gmail.com>
References: <20230522155210.2336690-1-azeemshaikh38@gmail.com>
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
Cc: Guillaume BRUN <the.cheaterman@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Mon, 22 May 2023 15:52:10 +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: dw-hdmi: Replace all non-returning strlcpy with strscpy
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=37cee4876a45



Rob

