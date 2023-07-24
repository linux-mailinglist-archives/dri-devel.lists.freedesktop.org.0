Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E63875EE12
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 10:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A2F10E289;
	Mon, 24 Jul 2023 08:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EF010E289
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 08:43:16 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A58DF6607029;
 Mon, 24 Jul 2023 09:43:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690188195;
 bh=+Va/lv+kY8+mB74j/EALrVluhW0bxzE0CAwbF8R0KO8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OMSi/64LbAElUJL4T6UTLVQD7Il2GFk+KZ4ei/CZraSh2Wpkigf1azw5E96NQKroI
 e/DVJNeTJKwdAyd7iijx7YdT9EtJxHUjFejPF0ApdhaofDoCOQ0WXPWbuTX7mJJaAu
 u0oUpWySsMsScs5+NBFrOhnwo9ljcgTH8ed51Rk+jQBou13STRgZ1eiEDuo3mc03f/
 /br4FVRSZ7CknKjli+vyu6KIPQEb82PDCYpvzEnVepvbXlXrH7860++PjplWzkY2XR
 TK0PqYpsG2/Qm2Zh9etD6pCm2l7bhU75DvqDovULup3ASTYCycoxqle1JErDja/mjh
 7FRfTLVwS9yJA==
Message-ID: <c484069d-f41b-1abe-e17d-2a7624964724@collabora.com>
Date: Mon, 24 Jul 2023 10:43:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/panfrost: Sync IRQ by job's timeout handler
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230723000142.206908-1-dmitry.osipenko@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230723000142.206908-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/07/23 02:01, Dmitry Osipenko ha scritto:
> Panfrost IRQ handler may stuck for a long time, for example this happens
> when there is a bad HDMI connection and HDMI handler takes a long time to
> finish processing, holding Panfrost. Make Panfrost's job timeout handler
> to sync IRQ before checking fence signal status in order to prevent
> spurious job timeouts due to a slow IRQ processing.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Also, on MediaTek MT8192 and MT8195 Chromebooks:

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

