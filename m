Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5E683ECEF
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 12:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4204410E4C3;
	Sat, 27 Jan 2024 11:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA0A10EC75
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 11:36:32 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TMXZk1VqjzDqFf;
 Sat, 27 Jan 2024 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1706355391; bh=DwL4arpEzXWec++owa4mghw2Jbc0zA8jYLA9Oc9uFco=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B1cO5iICyRmgAJiJG9CFWboHg9qYa2wTt56r24VzWxhNPvQyh3G6YLKd8ycOTZGpA
 EXvdnQ04gJc0HuOXoK3pubBBkT9OGygapXT3To0cQTnNFzoHpdiPKCJPmoLliKPNzP
 lrBDkjOpiPoWx/gtI3RPuqzNLSla2qC0h6IxBquU=
X-Riseup-User-ID: DEFF9060E8EA107706D83953584E1815F0490610DEB87FA764577ACB26A6E682
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4TMXZF6PvXzJp9g;
 Sat, 27 Jan 2024 11:36:05 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>,
 Ondrej Jirman <megi@xff.cz>, Manuel Traut <manut@mecka.net>
Subject: Re: [PATCH v4 0/4] arm64: rockchip: Pine64 PineTab2 support
Date: Sat, 27 Jan 2024 18:35:50 +0700
Message-ID: <6035442.lOV4Wx5bFT@melttower>
In-Reply-To: <20240127-pinetab2-v4-0-37aab1c39194@mecka.net>
References: <20240127-pinetab2-v4-0-37aab1c39194@mecka.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, Manuel Traut <manut@mecka.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Manuel,

Since the BOE patches have been accepted to next, you do not need to include 
it in this patch series.

Best regards,
Dang

On Saturday, January 27, 2024 4:48:41 PM +07 Manuel Traut wrote:
> - BOE TH101MB31IG002 LCD Panel:
>   * Picked patches from https://anongit.freedesktop.org/git/drm/drm-misc.git
> (drm-misc-next)


