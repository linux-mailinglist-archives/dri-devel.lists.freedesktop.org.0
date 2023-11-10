Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBF77E7C05
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 12:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2E710E0E6;
	Fri, 10 Nov 2023 11:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C6B10E0E6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 11:57:19 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4221E66073D6;
 Fri, 10 Nov 2023 11:57:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699617438;
 bh=yxdMDAZYCs0R8XzpVH/gErPFhSqVtu/4cjaOro2h2b4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WO3nx56UqM87HIFLLfwM2R/w0GJjvdvHpUw6z00XcHu2y+woW1xgDbCtxrNmbLnbJ
 etYOhBicHSRnRFOrs2OtpBKDwUUt9BfIC3SdbIFpOsOY4xeruQuEjin51sL+msfcei
 YBN3so3JS8iJzJFVY+/AApKOYN90tP2IjNQqKDQEWW2QDN9BMANB9IYjCTtcRL3pnd
 WoI/wxS/kE1UcePbmj8LvrfvAQRYxzvvExRX/UMuIATNSVY5Ros/TWFcBGBnIfYLWD
 JqSK3iHF+sNyUgbFzfiPuY4mwZYYtZjL7xfp6qqLvVs3XA4C6in3jGgh9NvlYbCwze
 jbVQZPB/+a2jg==
Message-ID: <b56b155c-25c0-4958-9f59-20669ee2ea01@collabora.com>
Date: Fri, 10 Nov 2023 12:57:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/mediatek: Fix access violation in
 mtk_drm_crtc_dma_dev_get
Content-Language: en-US
To: Stuart Lee <stuart.lee@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20231110012914.14884-1-stuart.lee@mediatek.com>
 <20231110012914.14884-2-stuart.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231110012914.14884-2-stuart.lee@mediatek.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lancelot Wu <lancelot.wu@mediatek.com>, stable@vger.kernel.org,
 Shawn Sung <shawn.sung@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 10/11/23 02:29, Stuart Lee ha scritto:
> Add error handling to check NULL input in
> mtk_drm_crtc_dma_dev_get function.
> 
> While display path is not configured correctly, none of crtc is
> established. So the caller of mtk_drm_crtc_dma_dev_get may pass
> input parameter *crtc as NULL, Which may cause coredump when
> we try to get the container of NULL pointer.
> 
> Fixes: cb1d6bcca542 ("drm/mediatek: Add dma dev get function")
> Signed-off-by: Stuart Lee <stuart.lee@mediatek.com>
> Cc: stable@vger.kernel.org

Reviewed-by: AngeloGioacchino DEl Regno <angelogioacchino.delregno@collabora.com>


