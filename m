Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AEF5F3D95
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 10:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8547810E088;
	Tue,  4 Oct 2022 08:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366B910E088
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 08:01:00 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C4D546602294;
 Tue,  4 Oct 2022 09:00:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664870458;
 bh=SDMWB8XjZ0n+CSi3wdjdLQk9+vNLQ8oA05TKi8n5FGM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V0ZShRd4nsC+dmi0mCoEL+FS+iAH4oz4LzHi0OP/CAl5X3Y2+mvHiPU0f3+eebHMo
 b9KBHlZtV8Ip/dPU8QBZLeL0xAX1uE/kIWvEKKb8jHf+mmygg7MrHWCN3HrTZXpPEU
 9J18m2Cjj9gGhhEEvHEg8u2UINIHnEwz9qzSwk3P2me4U7lsi5us7sK4dB3z0HIl5D
 L5dcLH7/v3gPY3cCVV92OrOjvy1ZNJEbbrBCDIjimusuNJSDIPHZ144KsARwSRod9Y
 jujP1dYICUBLTOcUd5+PQjJ6o1jyiVKE8av5No2MW1AbO5hEk2LJt5juc5K9vQSsTT
 3XX/OPXgHHQ9w==
Message-ID: <c92314a0-8843-fe50-aebe-7c94d278f115@collabora.com>
Date: Tue, 4 Oct 2022 10:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 1/2] drm/bridge: it6505: Adapt runtime power management
 framework
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20221004044943.2407781-1-treapking@chromium.org>
 <20221004044943.2407781-2-treapking@chromium.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221004044943.2407781-2-treapking@chromium.org>
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
Cc: Allen Chen <allen.chen@ite.com.tw>, Hermes Wu <hermes.wu@ite.com.tw>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 04/10/22 06:49, Pin-yen Lin ha scritto:
> Use pm_runtime_(get|put)_sync to control the bridge power, and add
> SET_SYSTEM_SLEEP_PM_OPS with pm_runtime_force_(suspend|resume) to it6505
> driver. Without SET_SYSTEM_SLEEP_PM_OPS, the bridge will be powered on
> unnecessarily when no external display is connected.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


