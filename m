Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCC68402D7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 11:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A699010E175;
	Mon, 29 Jan 2024 10:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2CC1127F2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 10:32:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9E383CE10F6;
 Mon, 29 Jan 2024 10:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4E2C433F1;
 Mon, 29 Jan 2024 10:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706524329;
 bh=7fLEgPW31efWOOXOHma0dNe+BBLJztyy7yEteG0nros=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mm5o0S5ZjktyVsqkONkDIeBoOE29IMeCZNdeSjs4574n4ib8eL1hipCuQDWlEnAVv
 jvy0c0gJb2sXupexgcdbCsSAvYHcGhCZnhKVoSLA2ID+CmYSpN5llINhCH/+nsBJau
 yj6spJCc7kbbTyudkydqCUA9CNKWuQkdyJeqYhtj4ur2iA38RJa8z8sIGZo3yhvyJA
 /hp7vH3IdXSjEApdpGh6YmLvuVyxwBh4PAdUxZ0P7UqLcMGtKaSvBZG5IDC1WfeMpd
 /zqkXVY+1uv/zTwm8BPwQpmH7JooG2G87xdH43szh3SRV4+zjeTdAwScAnUV0LHh85
 VCHdHPpAIbRZQ==
MIME-Version: 1.0
Date: Mon, 29 Jan 2024 11:32:02 +0100
From: Michael Walle <mwalle@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
In-Reply-To: <CAPM=9tytMB9frxNeD08hu1qsusY=wEE3bJOFmUgA1rSpabwDpg@mail.gmail.com>
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
 <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
 <CAAQKjZMccDwa63_PNJCP0rNOaHjTwcOz8AbKa=JXLQi-b0QVVw@mail.gmail.com>
 <2400535875c353ff7208be2d86d4556f@kernel.org>
 <ZZ1BBO2nNSp3g-gT@phenom.ffwll.local>
 <CAAQKjZNnJQDn_r1+WNmsxM-2O48O0+yWAUAqpjZRjMYMT3xGwg@mail.gmail.com>
 <CAPM=9tytMB9frxNeD08hu1qsusY=wEE3bJOFmUgA1rSpabwDpg@mail.gmail.com>
Message-ID: <b18d88302acfca001a6693d78909bc2a@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Tim Harvey <tharvey@gateworks.com>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <daeinki@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Just FYI this conflictted pretty heavily with drm-misc-next changes in
> the same area, someone should check drm-tip has the correct
> resolution, I'm not really sure what is definitely should be.

FWIW, this looks rather messy now. The drm-tip doesn't build.

There was a new call to samsung_dsim_set_stop_state() introduced
in commit b2fe2292624ac (drm: bridge: samsung-dsim: enter display
mode in the enable() callback).

Also merge commit 663a907e199b (Merge remote-tracking branch
'drm-misc/drm-misc-next' into drm-tip) is broken because it
completely removes samsung_dsim_atomic_disable(). Dunno whats
going on there.

I'm just about to look at getting it to compile again and
I'm trying to retest it.

-michael
