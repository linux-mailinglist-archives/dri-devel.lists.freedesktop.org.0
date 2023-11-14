Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0197EB438
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 16:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0850910E459;
	Tue, 14 Nov 2023 15:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2522710E459
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:53:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2FE486126C;
 Tue, 14 Nov 2023 15:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9618AC433C7;
 Tue, 14 Nov 2023 15:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699977225;
 bh=oj0ar3S9udglwAQhzABf2I/Z6VFbHZNzjUYZXB8926k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g+SQHlm6FcPeJKPKFDN+rTIKpfCzlgc4mkxwh5PMhYXOd6gk+Aw68aT2OOUsy5Nca
 RHEqj/a92QcipyRhgY186Ltcmj357ieFbeLL4EgKWtQ6UFfst9HP3MKt0sWOsy43cz
 VUAP9KZD/taENTQbeWQyjaflF8kYYDa/KQTAIc8la5Z8/YFUZ55HLIHgt2S764AnI0
 OKBaz2+Xu/22KbmLFzRILnBzthEGBTG59sMyUG7FrD7IDepvsEePLvkX3yAgBVtv/0
 r273m7wSrbwIuag3Lo+LCD0yURSCsxUt6C80E5CiTPB7h+DpMWJOq2gUudzI9+YnXD
 RZHjbl8tFLYZg==
MIME-Version: 1.0
Date: Tue, 14 Nov 2023 16:53:40 +0100
From: Michael Walle <mwalle@kernel.org>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
In-Reply-To: <11fe6f0e-49e7-44d4-a31a-3b739f77489f@kontron.de>
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <11fe6f0e-49e7-44d4-a31a-3b739f77489f@kontron.de>
Message-ID: <a180549d4fe67492cd2080f807ea3c66@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> My current guess would be that the issue I was seeing was already fixed
> with dd9e329af723 ("drm/bridge: ti-sn65dsi83: Fix enable/disable flow 
> to
> meet spec") and I didn't properly test both changes separately.

I had the exact same thought, as I've found your second patch.

> My cheap scope is not able to capture the DSI signals and I admit that
> we didn't use our more expensive equipment to verify the changes back 
> then.
> 
> Instead, we had an automated test setup to do cyclic on/off switching
> for the display and check for a black screen using a sensor. It is 
> quite
> a hassle to set up and I'm currently not planning to spend that much
> effort to verify this change again.

That is actually, what we are also doing right now and how the issue was
found in the first place.

> Anyway, I currently don't see any reasons to not revert my changes. 
> Your
> revert looks correct and seems to work fine as far as I can tell.
> 
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Thanks!

-michael
