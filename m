Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C7192BDA3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 17:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544D810E590;
	Tue,  9 Jul 2024 15:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="AzZ4p/1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C6D10E59D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 15:00:58 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C46D7885A5;
 Tue,  9 Jul 2024 17:00:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720537257;
 bh=drnLt1b1BmTFLCLihLElO36n1bFhH7KTbcwXYuUra4Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AzZ4p/1UriwwwQz6i5ha/gIYsThJk8EAZl1hYrRahDLWWeMNwFom64hSOevZAa6w5
 ylnMGCw6SX+/6Opd4jjtceI/HKg/ke05ahV23OylQDb8Ow04aYwiXCQeJeUOWHFHqI
 20BtFFctc5S0OAUwo3maMdwItjhRFYQNyOC9pMgftNdii8Qy5f/g7QOrF1GiPCtM8U
 /JrP+jdjNQadsuLGk9Nhpr1FJkjwBLehYZUJ2zmOSGTLOO6hLFR94MzKNISbPexyUd
 Z95NedLf+n+KNrHargWVDdOZgHybQ8Sg+NfD2zFuziAtWsqj+VTTNtP+6QvI9U/CW0
 thzM3Eq0uk4Kw==
Message-ID: <223b287f-4da6-4ec1-be7c-6135215c5551@denx.de>
Date: Tue, 9 Jul 2024 17:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: bridge: ti,sn65dsi83: add
 burst-mode-disabled
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 "Noah J . Rosa" <noahj.rosa@gmail.com>, linux-kernel@vger.kernel.org
References: <20240708151857.40538-1-stefano.radaelli21@gmail.com>
 <172045725750.3389992.15451403448241421795.robh@kernel.org>
 <CAK+owohBrewYFpDKjsE5iWC5OQ3p6S_9fwj7DWa1Ux2h8CXcAw@mail.gmail.com>
 <944ecc41-9ef7-4d9e-9d96-3c5c0cdb71b5@denx.de>
 <CAK+owoiQY8OYiZofyq4jj2S3Mg6ub88DF5V52JcppxhWbUsWgg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAK+owoiQY8OYiZofyq4jj2S3Mg6ub88DF5V52JcppxhWbUsWgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/9/24 4:44 PM, Stefano Radaelli wrote:
> Hi Marek,

Hi,

> Actually this property is specific also to DSI8x bridge, as you can see
> from the screenshot below taken from official datasheet:
> 
> [image: image.png]
> 
> And it's the sn65dsi8x driver that tells MIPI driver which flags to use
> during attachment.

There are other bridges and panels which support both DSI burst and 
sync-pulse/sync-events modes, so a property which selects the mode is 
generic, not specific to this particular bridge . The bridge driver 
could parse such generic property, although it would be better if the 
core code parsed it instead.

> So, for example, this bridge can work also for MIPI interfaces which don't
> support burst-mode.
> Also, as a value-added benefit, I found non-burst mode better for some
> 1920x1200 LVDS panels I'm testing (Of course with more energy consumption).
> That's why I though it could be useful have this option, since SN65DSI8x
> supports both modes.

Can you share which panel model this is ?
