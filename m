Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B94586C417
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4333210E316;
	Thu, 29 Feb 2024 08:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QqUeHf2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438A710E316
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709196486;
 bh=9+dpCXx7x8UpSu3QuELJTExwI0UUO/emZ4rDeXtx924=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QqUeHf2gm7ya25wnu6E/Surks4FtpIdhdpaTZtIqhLZqXWuCUT1rBSm4Fz3y7d51H
 qiPLYiz55uYSQgit4TpXAEG795vs9TecMRbNmJA6lBvIS6WuFj40bGj3PvTX/ENsH1
 3LkJ8YBut8oDlQjXc6MymbwST6AFCZbuQoBPhA1Q92Zz7BGQzIp4Cv0IbFW6JoGNNe
 o9QnxE9hcQ1JoySzCi4ROL5ssEd6l5UC6w+Ni3Kia6CrJWtqSiTMTmmSxkcD0I5+zX
 lL6i6Y+xIn0Tu+a2V0txcd6imogZVCvUX1jg1UssxaH5faNL9I4HFAj324mBBBjKMc
 KjzC8ZLfoDOcA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 39C3037810EF;
 Thu, 29 Feb 2024 08:48:04 +0000 (UTC)
Message-ID: <e1f772b3-cbe5-4d6b-b2cd-d6e10bd2121a@collabora.com>
Date: Thu, 29 Feb 2024 09:48:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/mediatek: Add gamma support for MT8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fei Shao <fshao@chromium.org>
References: <20240229023522.15870-1-jason-jh.lin@mediatek.com>
 <20240229023522.15870-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240229023522.15870-4-jason-jh.lin@mediatek.com>
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

Il 29/02/24 03:35, Jason-JH.Lin ha scritto:
> Since MT8195 compatible is in the single enum group, we have to add its
> compatible into mediatek-drm component binding table to ensure that
> it can be bound as a ddp_comp.
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>

