Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887069EC94C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 10:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965CD10EAB8;
	Wed, 11 Dec 2024 09:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OtAXYuje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347BC10EAB8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 09:39:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EA3E8A41FDB;
 Wed, 11 Dec 2024 09:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FD0C4CED2;
 Wed, 11 Dec 2024 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733909956;
 bh=CSDhiOEmbfrkwtGpS8rSLIKuetIToYhzF+eZR29YgAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OtAXYuje0C0W2XsEKYln45lBU/EFfMLyJZqXQmHotXtIwH27nE4f0HZBJlpUs4D8m
 7lcuS70CTinpynbUtwW5HEJoQ1yZ4WAAL134eDLuXdEOgobZcSiQrPzqwmNOv1Xp1W
 XQsOKSo3GsSoVSRhaZoVb9D11MJhEmleTLCRzbzDk9JNE9egOHimNP4/0IXiOplxCs
 dDS9mMw9TI+88mDzdk3qrJ0FaEe95qXFd6Bzvsd+BjcFKSJjxyw2Om70/wT6uCGizp
 yW30CeMS3HTD7cWWxfwYPvZZ+dB9NjLKwASqxUDnS5XLC188u0ONd7gmhIV3Mpe0Bm
 GaMAI7SaSecyQ==
Date: Wed, 11 Dec 2024 10:39:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
 Xavier Chang <xavier.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 2/8] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Message-ID: <yhfxpflyumevs66sdwgiiyuablpfxfxw3e7ybrxju7ssicmnu5@truuiuvxlq6e>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
 <20241211032256.28494-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211032256.28494-3-jason-jh.lin@mediatek.com>
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

On Wed, Dec 11, 2024 at 11:22:50AM +0800, Jason-JH.Lin wrote:
> Add compatible name and iommus property for MT8196.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)

Headers are never separate from the bindings patch...

And you reveived exactly the same comments before which you just
ignored.

NAK.

Best regards,
Krzysztof

