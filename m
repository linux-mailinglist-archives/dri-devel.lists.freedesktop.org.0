Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE9479238D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 16:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C5B10E545;
	Tue,  5 Sep 2023 14:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 476 seconds by postgrey-1.36 at gabe;
 Tue, 05 Sep 2023 14:35:02 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E568D10E545
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 14:35:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A78FFCE10E7;
 Tue,  5 Sep 2023 14:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1BEC433C7;
 Tue,  5 Sep 2023 14:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693924019;
 bh=JTMR51obR6EYPhug45RQ+7RA0Wf7YLMTHtRR/RYHKjU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dnhRRS9HLnrSB1DBbYSCM/h2W/y9CJvmevRjFGDHezagB7rgP7Ett4E8ioEkwHHqq
 5gv3kahK0t21oVAyXErnvKD5vltpUgLTYAoxpRk0eG2RykpLoYY1JibzXyp6OyiMnv
 Psmj64WxAyLmtjmcR7D2Hlvy9Kha40ougiGgghEfPrGVIPE56k6+ipdiMfuq8o08A7
 sWeWg5LwMKMCNER8EfIdlU1JHQ77aTxYtHJJ5AUFN4SRVchM/tOKlIPrvmYJDz5BKd
 +NgtrJx6tOS4b5aItz7yl5UfQebX18kMx3WGDzgBGcvRny8TVVwZSOuseOPFVqLWTP
 lgigJb3mEAbqQ==
From: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nicolas Belin <nbelin@baylibre.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jai Luthra <j-luthra@ti.com>,
 "Andy.Hsieh" <Andy.Hsieh@mediatek.com>, 
 Phong LE <ple@baylibre.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230901-it66121_edid-v2-1-aa59605336b9@ti.com>
References: <20230901-it66121_edid-v2-1-aa59605336b9@ti.com>
Subject: Re: [PATCH v2] drm: bridge: it66121: Fix invalid connector dereference
Message-Id: <169392401621.1005565.3123120180972167667.b4-ty@kernel.org>
Date: Tue, 05 Sep 2023 16:26:56 +0200
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
Cc: nm@ti.com, Aradhya Bhatia <a-bhatia1@ti.com>, devarsht@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Helen Koike <helen.koike@collabora.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 15:01:23 +0530, Jai Luthra wrote:
> Fix the NULL pointer dereference when no monitor is connected, and the
> sound card is opened from userspace.
> 
> Instead return an empty buffer (of zeroes) as the EDID information to
> the sound framework if there is no connector attached.
> 
> 
> [...]

Applied, thanks!

[1/1] drm: bridge: it66121: Fix invalid connector dereference
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d0375f6858c4



Rob

