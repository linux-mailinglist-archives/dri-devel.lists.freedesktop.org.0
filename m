Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398EE97C9C6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 15:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4480410E2BD;
	Thu, 19 Sep 2024 13:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="T74+YVZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB66410E2BD
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 13:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1726751555;
 bh=mbKPeHX5dPDsgxkJ1kYk8sbygspVme8Eho7Kxjhv+gE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T74+YVZUmPw6cCqQlEIa43Em8BrGfi1YTE7GEDSgxOkWRHnWKKsm6PuemZ/v1gq52
 X5ZGvb3IBCm3dSE+4ADp62mOBKgjDL9X8esS3O45+2ci7/eaL+kBP3f3H+lgpsExia
 NnoAkuz35WnhQ052/t8gpCqaRiqxwXgtgqUfEiQ38tKG50zw8FQ1b92iguajWxENuH
 zoRjcpzBpvy0uAigH03DnHc4n512HX2T80jGl0tmDhDq7Iuvd2kwS540eojo/2GCEg
 5kHE+ppWrQX6hH/JaKLqNd8kfScBTdpPBU3wwlKrX4TqxS8mh87eq1zbwTN8eaCORz
 BYDX4AW2s3xXg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 91A6917E14F9;
 Thu, 19 Sep 2024 15:12:34 +0200 (CEST)
Message-ID: <ff80024a-90b2-4a19-b827-23be69352f78@collabora.com>
Date: Thu, 19 Sep 2024 15:12:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/mediatek: Adjustments for mtk_gem_prime_vmap()
To: Markus Elfring <Markus.Elfring@web.de>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Alexandre Mergnat <amergnat@baylibre.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <254d16d9-d56a-4f26-9914-db75e7aa4287@web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <254d16d9-d56a-4f26-9914-db75e7aa4287@web.de>
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

Il 17/09/24 19:34, Markus Elfring ha scritto:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 17 Sep 2024 19:16:45 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.

Hello Markus,

In my opinion, the suggested changes aren't bringing any improvement, not
in readability nor performance ... nor anything else, really.

For how I see it, the code is fine as it is, but then, that all boils down
to code style preferences and nothing else.

Cheers,
angelo

> 
> Markus Elfring (2):
>    Avoid duplicate sg_free_table(sgt) call
>    Use common error handling code
> 
>   drivers/gpu/drm/mediatek/mtk_gem.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> --
> 2.46.0
> 


