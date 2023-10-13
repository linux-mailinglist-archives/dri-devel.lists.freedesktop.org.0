Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ACB7C87E5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB6910E0BF;
	Fri, 13 Oct 2023 14:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E8310E0BF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:33:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 240B4B82B40;
 Fri, 13 Oct 2023 14:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419B1C433C9;
 Fri, 13 Oct 2023 14:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697207597;
 bh=OuJxYVBWncqFXkoBmqFPr0LnuPnHwk7N6zjGsoHy3QY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TVU+bAhReRuuXZjA0inXvWXoGNC/qf+BEAz7bxLb8tW6r08QduJOOSLrSgW9fj1ON
 LDUUpV1dyQTWumCU2XtOmtX592jKHETRW/5uElaCJ4fSdJa1HV2E6j1cvHTQTn7zgv
 HuqpxkCRwF+dkWnS3xlWc2Djj+bAbPlInbexOz810sKag1dWi+8C0E8zzH2RqcbEW3
 T5KeGy8uxaets/NRsGIvkhZyKtAx4xYLSuVWfD119svnwVstd8io6gHWi47ZhAuInD
 ridWU2lEsAISm2KbjpA7vU4gbeuemZrsRreDXPDPWZSVJygr4oSYIjv/eK4yKpjMmy
 hzTlDxZYYRZVg==
From: Robert Foss <rfoss@kernel.org>
To: martyn.welch@collabora.co.uk, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 neil.armstrong@linaro.org, 
 Ian Ray <ian.ray@ge.com>, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, daniel@ffwll.ch, 
 airlied@gmail.com, peter.senna@gmail.com
In-Reply-To: <20230921104751.56544-1-ian.ray@ge.com>
References: <20230921104751.56544-1-ian.ray@ge.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw:
 switch to drm_do_get_edid()
Message-Id: <169720759497.204789.9896444402167504321.b4-ty@kernel.org>
Date: Fri, 13 Oct 2023 16:33:14 +0200
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Sep 2023 13:47:50 +0300, Ian Ray wrote:
> Migrate away from custom EDID parsing and validity checks.
> 
> Note:  This is a follow-up to the original RFC by Jani [1].  The first
> submission in this series should have been marked v2.
> 
> [1] https://patchwork.freedesktop.org/patch/msgid/20230901102400.552254-1-jani.nikula@intel.com
> 
> [...]

Applied, thanks!

[1/2] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: switch to drm_do_get_edid()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e0eb7db49764
[2/2] MAINTAINERS: Update entry for megachips-stdpxxxx-ge-b850v3-fw
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e755d439c1b7



Rob

