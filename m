Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0730A3949E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 09:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F2210E627;
	Tue, 18 Feb 2025 08:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IQRi2Vmv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B07110E627
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 08:12:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 83434A41DA3;
 Tue, 18 Feb 2025 08:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52511C4CEE8;
 Tue, 18 Feb 2025 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739866356;
 bh=m0uzICN3CTQeSUf/G77xR807tJo8YURiD8Lpz5F3ens=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IQRi2VmvFsxCUwDouh54xRwY0cY4kmYzRFK8LAGBUCczQ5U1izTJrDWOi6rz1KfUt
 goxHiFMqd0AWPpsfvy+HJbCIBsBzEvMlVkm90Hn1Wu6nzQbTorNu8WcFIBAkm9B+HJ
 nbG3WQ385KXyW9FZthjupNrV9+nm6jX5T1yDRGuY0gLKobJmvB1r55CMQt0yH4dOAd
 9yjcdH8R6YIng+qM6PvycbzemR4koU2b8ltMNQg6/jAeUr4gFLTds1CaMoaBBtY0Tk
 klNNYzDYu1BR/pBi1QGxcS8RIlzjmrd391OatYOmQm0ZQtaldWlsb8kDI6FdhI/xEL
 3QlKkcPjc8I7A==
Date: Tue, 18 Feb 2025 09:12:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
 Xavier Chang <xavier.chang@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>, 
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
 Pin-yen Lin <treapking@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: mailbox: mediatek: Add support for
 MT8196 GCE mailbox
Message-ID: <20250218-cryptic-pompous-salmon-d816ea@krzk-bin>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250218054405.2017918-2-jason-jh.lin@mediatek.com>
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

On Tue, Feb 18, 2025 at 01:41:46PM +0800, Jason-JH Lin wrote:
> Add the compatible name and iommus property for MT8196.
> 
> In MT8196, all command buffers allocated and used by the GCE device
> work with IOMMU.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

