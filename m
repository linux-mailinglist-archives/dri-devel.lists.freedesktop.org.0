Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B95992846
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 11:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1524F10E33D;
	Mon,  7 Oct 2024 09:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Cp3e9gJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7CF10E33D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 09:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1728293880;
 bh=tBr82LXAC10QRWO1nQyfOJTIr5Jby9xgM3gFPqrBWGY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Cp3e9gJlsas+5EhyPBb2wlNAegDhPVzZKTsBY6mUFKLJuxyL47Fy8kUR0sdmEQGnl
 B265NHP2FdfTzzjMfq8gFkCMf4nwgQi8/4Uxu55acLXsNSBMbM5DFx3gvugPoHNwwv
 Az6fSWf0fc9KMKCy2XFidA/Y2gHe/9snPTL+3vqtz78wMyrm+D+TqYZ09QdKJ/HdXs
 bhN3QN9M1IyO7/KGApIl8nlO8FY1Q8f3Mtlv8UIhMo6VVnhWvNcu9kiok3o25qw5ua
 cDuuCuaB6PlScOo1ATIuYCoAnH9JweCcGnB2Y3dBzy7Ov7DVZcsyT8E1ydCUEBfXEX
 KnUYKLc7DbVqw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4230617E11F6;
 Mon,  7 Oct 2024 11:38:00 +0200 (CEST)
Message-ID: <80d1b219-5362-4ba8-9c06-f9b811ff0f83@collabora.com>
Date: Mon, 7 Oct 2024 11:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] drm/mediatek: ovl: Refine ignore_pixel_alpha
 comment and placement
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Adam Thiede <me@adamthiede.com>, Yassine Oudjana
 <yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
 <20241007070101.23263-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241007070101.23263-3-jason-jh.lin@mediatek.com>
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

Il 07/10/24 09:00, Jason-JH.Lin ha scritto:
> Refine the comment for ignore_pixel_alpha flag and move it to
> if (state->fb) statement to make it less conditional.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>


