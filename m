Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4249987082
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 11:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8C610EB75;
	Thu, 26 Sep 2024 09:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YiSTg62k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AA010EB75
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 09:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727343771;
 bh=VRydMshYTcpp89zwvgwY5jyig5NMTUMTx57WtTy7YHY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YiSTg62kMzECHoXWZCj628zq47jQgcqJs9vcJnYXQ6S8GTuRu0MlvBicXD6jKohaC
 EtP+4NYFwKGTQXiPGYeaAQH3XW4TpRdouBMhdzrlct1AVkgwAXSXiyyPoopM8SWKnC
 MukYsrPKIHdmiiRSPvjmtsDWwTw3PUqsbFowxKCft/pFX9xMg8bJS/8pf6qyA4ltIq
 3O9w+qOT3BesCIpOfbmNmhbV2yZ/0yUljpxTE7w3CHQrj3eGWPbUCM4cqUvGhtHOSJ
 UNBDfZlG7ea9EcLk+olkbtSGJ1++AGR41is/A0mkXqmfvweTNJqyKxn8Wx/AHH0NDl
 x2B21tKXnTQzw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 67ADA17E10AF;
 Thu, 26 Sep 2024 11:42:51 +0200 (CEST)
Message-ID: <e44cafc1-b350-4058-976e-13d6fe4fd4b2@collabora.com>
Date: Thu, 26 Sep 2024 11:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/mediatek: Add blend_modes to mtk_plane_init()
 for different SoCs
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240926083526.24629-1-jason-jh.lin@mediatek.com>
 <20240926083526.24629-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240926083526.24629-3-jason-jh.lin@mediatek.com>
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

Il 26/09/24 10:35, Jason-JH.Lin ha scritto:
> Since some SoCs support premultiplied pixel formats but some do not,
> the blend_modes parameter is added to mtk_plane_init(), which is
> obtained from the mtk_ddp_comp_get_blend_modes function implemented
> in different blending supported components.
> 
> The blending supported components can use driver data to set the
> blend mode capabilities for different SoCs.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


