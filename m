Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4CC5B5875
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 12:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C1510E37D;
	Mon, 12 Sep 2022 10:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A9010E37D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 10:30:25 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 266576601FD2;
 Mon, 12 Sep 2022 11:30:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662978623;
 bh=VxPiZ9dZ9acjfZPEAOYMYeBii8gbW8AfBShA+LhDdYg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AiDbBEUo0Aem90pzTbMOxyzSd1FzyRk4uKl2qd8lphZ8NVamc0TCZI+5+bCXU2yHz
 GYOmZtPgqTtiNkUT2zzAdIT442Ke+904r76ELYMLVusyAAa8Y+acEeMGaT6QKI165w
 YI1bo4a54Ljd/x8vDAoIQqiuYPiubDAeUm32sp1/j8dIP9LS88sfnS2slucMj3a4dq
 /FJENgOKhd7tWltLw74VWQPixXRX+TTTs9cykX+tkkjALtxfQm5hfUIIa6mxE8jTej
 kRisyfrmCToyMQ5muwNWodbxE9M82d0vD3KxYTP60HfQKFIiOsLF+OXE75jBQAxcix
 mYs46vwtbO8Qw==
Message-ID: <eb8173f6-74cb-3010-f1c2-5eac6939e1f7@collabora.com>
Date: Mon, 12 Sep 2022 12:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/bridge: it6505: use drm_debug_enabled() in
 it6505_debug_print()
Content-Language: en-US
To: Hamza Mahfooz <someguy@effective-light.com>, linux-kernel@vger.kernel.org
References: <20220910224816.15058-1-someguy@effective-light.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220910224816.15058-1-someguy@effective-light.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Hermes Wu <hermes.wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Allen Chen <allen.chen@ite.com.tw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/09/22 00:48, Hamza Mahfooz ha scritto:
> As made mention of in commit 9f0ac028410f ("drm/print: rename drm_debug
> to __drm_debug to discourage use"), we shouldn't explicitly refer to
> __drm_debug in this context. So, use drm_debug_enabled() instead.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


