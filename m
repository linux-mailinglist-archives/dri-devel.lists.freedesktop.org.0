Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD9996658
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 12:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5162410E138;
	Wed,  9 Oct 2024 10:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CDxfKj1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA4210E138
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1728468094;
 bh=HcDAYIWRb7ZSj+0+ipjYB5c/7wdOcwxEV1HjEhIn0z4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CDxfKj1FcxD9FXXQQlKYbc0NAXjhykFMk7AA+jo3Te9KnUf3ZUwLPzcr5pz8VrQiO
 k4f9ahsmQMStM+BKLJgLVrYxzYhzznIeMujcgP1ywXpf8CLbAy5jIHocmR1Nb3jav5
 h2sNBtGCteaUk0+qAsWmK8Hcbd9GQtkT8eqiUUlELYSBv7x4DBjHjc4AGcbKL5QYBF
 nRrgLnVMXLi51m/YgrgFBUljtOA3GL8zzg7hPd8+ouaZCo8LL/o/bh0ZS+Ii7ksz3M
 3sYPoeAbnXx0iqkuBJ5+f3+1VnprrB3Eu+VKuH0hx8aHsa7PXWpIfXb5x6n+9xC9uO
 jaC7mQBaEMz3w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 13B6417E1221;
 Wed,  9 Oct 2024 12:01:34 +0200 (CEST)
Message-ID: <972a9ad2-c362-40ea-8fe7-c1d75cb5978a@collabora.com>
Date: Wed, 9 Oct 2024 12:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/5] drm/mediatek: ovl: Remove the color format
 comment for ovl_fmt_convert()
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Adam Thiede <me@adamthiede.com>, Yassine Oudjana
 <yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241009034646.13143-1-jason-jh.lin@mediatek.com>
 <20241009034646.13143-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009034646.13143-4-jason-jh.lin@mediatek.com>
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

Il 09/10/24 05:46, Jason-JH.Lin ha scritto:
> Since we changed MACROs to be consistent with DRM input color format
> naming, the comment for ovl_fmt_conver() is no longer needed.
> 
> Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


