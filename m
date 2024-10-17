Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BFD9A23DE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 15:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB4210E83D;
	Thu, 17 Oct 2024 13:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HIVYA2H+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D849E10E83D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 13:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729171992;
 bh=gL7HIZDcngcg38f0O2Ne7G95R5rU2tPl/BIuc0Pcbdg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HIVYA2H+2rTlNkI3CBNX0Oz6XKMOTMy4YUDdvMANFeuRAuTlgX2JEH+DYXrgR+O58
 +3qXEhNm6SX0//tfm1UygavvpxQ8uPmGjHeqzdmrlBttaXEKygadIbg4mufbfDHIrO
 Bhg/WYSGh8TCrIMIWPF5ya6iHiKLTh8vkD7w4QQNNUuStKZ8NL0mlXk04DRkO2i3d5
 VJJsHj+NC1IgmWjNe2URawoY2jCy+MzpGejDlFWJjhyshU9It0Z4O+BAv04cU1dmfD
 bDQuCR+SrcXtrHSfHyz8X/ANEQZpyB6LvRXcCEupWFD4syPZhAAdOz+eFueT0LlWrl
 xjFHeBsL1vQIg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 35DB317E3609;
 Thu, 17 Oct 2024 15:33:12 +0200 (CEST)
Message-ID: <ab80d339-8b7e-4cfa-a3fc-b9f1d295a79c@collabora.com>
Date: Thu, 17 Oct 2024 15:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/mediatek: Fix color format MACROs in OVL
To: Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org
References: <20241016-color-v3-1-e0f5f44a72d8@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241016-color-v3-1-e0f5f44a72d8@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 16/10/24 16:17, Hsin-Te Yuan ha scritto:
> In commit 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in
> OVL"), some new color formats are defined in the MACROs to make the
> switch statement more concise. That commit was intended to be a no-op
> cleanup. However, there are typos in these formats MACROs, which cause
> the return value to be incorrect. Fix the typos to ensure the return
> value remains unchanged.
> 
> Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

