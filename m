Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A8E8402F1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 11:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AD4112827;
	Mon, 29 Jan 2024 10:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C48112827
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 10:40:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4FB596203A;
 Mon, 29 Jan 2024 10:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19190C433F1;
 Mon, 29 Jan 2024 10:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706524767;
 bh=ZtUBCi9XIZuwuDTg6s55jPiMw3sTTY6gvTY3F6eAwJQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H9u35mle835jprIpONX2W0+umzTKqsmHhfY+HoJ9nnxxW55pRozt2az/PNp9cFd3x
 f8isKhmOjaP20sip49Y269Fzwful2gHGFn2Ka7cJingoUUZ3ixHYqkFWl8qI4Ea6hB
 3HLufF8lKMJnEJowl5+B9Cag1MJVW5aDEUSVBwQW1qPi5Ct5k8NWwqHJwagI3RZJB7
 5cyZ7fl7w2CLxguhOB238vG9zfnRY7zZ7nuuwQjUoqRe7PlSFQVBMQCF8J78F1fu5w
 R5dZt6CRu1C9ScOCpx9iWMtTqDUEFEmiuybqd5ncgNAoTWTE1BIoxY5Us17cXH6fhn
 /mUqrto5E07ZQ==
MIME-Version: 1.0
Date: Mon, 29 Jan 2024 11:39:20 +0100
From: Michael Walle <mwalle@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
In-Reply-To: <b18d88302acfca001a6693d78909bc2a@kernel.org>
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
 <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
 <CAAQKjZMccDwa63_PNJCP0rNOaHjTwcOz8AbKa=JXLQi-b0QVVw@mail.gmail.com>
 <2400535875c353ff7208be2d86d4556f@kernel.org>
 <ZZ1BBO2nNSp3g-gT@phenom.ffwll.local>
 <CAAQKjZNnJQDn_r1+WNmsxM-2O48O0+yWAUAqpjZRjMYMT3xGwg@mail.gmail.com>
 <CAPM=9tytMB9frxNeD08hu1qsusY=wEE3bJOFmUgA1rSpabwDpg@mail.gmail.com>
 <b18d88302acfca001a6693d78909bc2a@kernel.org>
Message-ID: <795e2da5ae251321279920ee57c3d033@kernel.org>
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

> Also merge commit 663a907e199b (Merge remote-tracking branch
> 'drm-misc/drm-misc-next' into drm-tip) is broken because it
> completely removes samsung_dsim_atomic_disable(). Dunno whats
> going on there.

Actually, that merge commit looks even worse. It somehow folds
the original samsung_dsim_atomic_disable() into
samsung_dsim_atomic_enable(). Therefore, now the enable op
will clear the DSIM_STATE_VIDOUT_AVAILABLE flag?! It will also
never be set. Dunno how to proceed here.

-michael
