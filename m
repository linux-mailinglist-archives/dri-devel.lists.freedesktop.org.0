Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F8C8964F4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 08:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDB310E26F;
	Wed,  3 Apr 2024 06:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="ywIH0Mpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCB610E26F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 06:53:02 +0000 (UTC)
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 39C031F9B3;
 Wed,  3 Apr 2024 08:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1712127179;
 bh=v3b+8QaTlALli4d5q1lR+Tk4QvcKg7ry9GG0WZA9FgU=;
 h=Received:From:To:Subject;
 b=ywIH0MpzDo9EpbfI3KmGMd0njsOf/Hts2pTnq9bsOUgodetFUv8P/GtgWiLLZ6V1v
 /c4TgNyOFsYB5DJtRu8o+PJThGg7S6UBusd8CUIvuXrwaLQ07iJFx1BuFWdEqcBMpQ
 CfSzsdNIvKYHc1jA6oE3h4onrsLfDCIebD4Q3tpD6TXRLnQxg/H9MSR3mL6yWKYewu
 rLfZzcKkz9iCAJXfK04Y7UkD09vqH398moGSd34ko4mSskjI5XpfgmYmDHV9lRQ0r9
 AFj4amrSNyqbb79a3wFCo3wM/sXiIQDgVEglU6Qbv6n7FdBpoyUniWEKFHjVl5hAvc
 LobwXwmHgJJOA==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
 id B9C667F989; Wed,  3 Apr 2024 08:52:58 +0200 (CEST)
Date: Wed, 3 Apr 2024 08:52:58 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Alexandru Ardelean <alex@shruggie.ro>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 adrien.grassein@gmail.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com,
 marius.muresan@mxt.ro, irina.muresan@mxt.ro
Subject: Re: [PATCH 1/2] drm/bridge: lt8912b: add support for P/N pin swap
Message-ID: <Zgz8yvj2gSNk-0KU@gaggiata.pivistrello.it>
References: <20240402105925.905144-1-alex@shruggie.ro>
 <20240402165307.GA31874@francesco-nb>
 <CAH3L5Qr-sT+Q9ZvNSxHKwVMr8-3fU5WPvvaccEWWH49x7oWMyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH3L5Qr-sT+Q9ZvNSxHKwVMr8-3fU5WPvvaccEWWH49x7oWMyQ@mail.gmail.com>
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

On Wed, Apr 03, 2024 at 09:32:41AM +0300, Alexandru Ardelean wrote:
> I did it like this, because I don't have a board with the P/N in the

You use this 'P/N' both here and in the binding document, to me this is
just too generic and confusing.

Just use some wording that people familiar with the topic can easily undestand,
the Lontium datasheet uses MIPI RX DP/DN, MIPI DSI DP/DN would also work fine
for me, or at least DP/DN that is the working used on some MIPI documentation.

This comment applies to both the changes in the driver and the binding.

Thanks,
Francesco

