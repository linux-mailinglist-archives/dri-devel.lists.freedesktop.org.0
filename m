Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03668FBCD8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 21:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0776510E444;
	Tue,  4 Jun 2024 19:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="1c7rpUHe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1DA10E5DE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 19:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717531186;
 bh=EpLslpOhbstzvxy+NYlgIPTSA2o5f/zg2UQ0tpvgRHM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=1c7rpUHesbw02lPnXOn8AFTz4w1v0JZu/mrxPQ+jL0jaBE0t4CjPp62zwGXNaxSK4
 T6SdFlgfPy/ZSmbCWTvZj7JfIzl394TtBTuKEVF0oygF768FXSmwJNXmlAeFWZpsKI
 y3ztlP96IL25CLWxwVLz/mMuf6nzvfWXknnxPAs+T5SiMidC3RjOW+Osx7gNmFeri8
 XAEUFD5QU6XjQswu+Bg7UGJGvPuDNggK5Ergy7KIzhI3QwA6ZYBe6r89IlidQCPKqp
 /RhulzRfkZWkIKflPQ2r924/wpKExYCfeAu9ygr/vvxUpxi7qCnA2fYf0T1bbv1jpj
 hBxPrjzz7teJA==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5A9A63782172;
 Tue,  4 Jun 2024 19:59:44 +0000 (UTC)
Message-ID: <4e683887-d963-40f8-89de-c7f7d9d0cab9@collabora.com>
Date: Tue, 4 Jun 2024 22:59:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Add initial support for the Rockchip RK3588 HDMI TX
 Controller
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <E1316DC2-0822-4B82-BCD0-99904D4741EF@gmail.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <E1316DC2-0822-4B82-BCD0-99904D4741EF@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/2/24 10:59 AM, Piotr Oniszczuk wrote:
> (resent as plain text instead of html)
>  
> Cristian,
> 
> I was awaiting over year for this work!
> 
> I’m devel. 2 distros where single mainline kernel serves 2835/2711/2712/h6/h313/h616/h618/rk3328/rk3399/rk3566/rk3568/rk3588/s905/s912/sm1/g12.
> 
> Before this work rk3588 was excluded because rk3588 hdmi was regressing hdmi on other socs.
> With this code all other socs seems work ok now. Perfect.

Many thanks for giving this a try on a broad range of SoCs, especially
considering my limited testing capabilities!

> As one of my project is multimedia appliance - good news is that now i can nicely play hdtv on rk3588 using mainline common 6.9.3 kernel and….started to hear from my users a lot of Qs like: „ah so nice! rk3588 now works nicely….but where is hdmi audio and cec?”
> 
> It will be fantastic to add (e.g. by backport Detlev https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/tree/rk3588-hdmi-audio?ref_type=heads ) audio code to get basic support hdmi audio?

The main focus is now on upstreaming the basic support. This should
further facilitate adding the missing features, so we will slowly get
there, eventually.
