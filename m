Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F20802E96
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C995F10E1A1;
	Mon,  4 Dec 2023 09:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B0010E1A1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 09:29:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0C50CB80CC1;
 Mon,  4 Dec 2023 09:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B65C433C8;
 Mon,  4 Dec 2023 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701682149;
 bh=DRrtkbyTCk/Szcs4W+WPrKgFw32MQUyWR0BepZqZsWY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BdoyKckAMdmgjJfAclrg7sdkZAlWGxpnKh3Ned1JjAuYE6BTUryT3Jo24+YEFFeeC
 kea4bv+VHJKcIWLBOiugfosfpB1PIsqy2ocDZvjns0TUP5YlKJbx2yCcaG/1WAlcCh
 v/VekiHlrm0KMHK59SL33uuR5m+TpNPAv7FBc2nWaWETp7AxSkrkOFHYp6OJBE/dHM
 /l8b7PCaaavd2lWER99C4KRKDNrof5EbR9dlqiiNuQKCvo6vORmmUAqGwiC0A7h3LN
 QE+ln42Kjkhr631aP5myZZA43zhKQfHzHUXLvwktm6rvHqc23E9SYEcJJEhLd3AjC3
 C5tlaX7Rbg7Dg==
MIME-Version: 1.0
Date: Mon, 04 Dec 2023 10:29:01 +0100
From: Michael Walle <mwalle@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2 05/10] drm/bridge: tc358775: make standby GPIO optional
In-Reply-To: <20231202075514.44474-6-tony@atomide.com>
References: <20231202075514.44474-1-tony@atomide.com>
 <20231202075514.44474-6-tony@atomide.com>
Message-ID: <c833e94366ced6e2f36765ddcc65dd5c@kernel.org>
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
Cc: Pavel Machek <pavel@ucw.cz>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Simha BN <simhavcs@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Merlijn Wajer <merlijn@wizzup.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Carl Philipp Klemm <philipp@uvos.xyz>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sebastian Reichel <sre@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The stby pin is optional. It is only needed for power-up and down
> sequencing. It is not needed, if the power rails cannot by dynamically
> enabled.
> 
> Because the GPIO is not optional, remove the error message.

I just noticed a typo: "is *now* optional.

-michael
