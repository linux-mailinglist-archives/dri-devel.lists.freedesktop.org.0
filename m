Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAF2AFAB21
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 07:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3D010E3FF;
	Mon,  7 Jul 2025 05:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UYcuETOe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BCD10E3FF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 05:42:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8675C46179;
 Mon,  7 Jul 2025 05:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA5EC4CEF4;
 Mon,  7 Jul 2025 05:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751866958;
 bh=DYxEwke6KQfAip5v2Jtz2Vpn6CF/js+HUrRQ9qzGcvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UYcuETOeDFCBCzio5Luj3iLUeQLKqO/4YJ1FYL51lb8F6z4FScS+B5tMnBlkGb9yP
 5Mpfej0WC0NLKucQ356U0gDdjukScfT9PYSkMWfSwx4gZncxmpOCjHoNJg61j0NWsO
 aAGd4L5BUsSj57XbmIzaW/1O9ZArSNS6czEXW6URDSIi/cJ44ylnOBp1EYe5Lv7Rh8
 lp1v2kAYD6dsgyz3FvizlRcsBl/I0FJLiKvJjMVl+/v1vJqRYIzJZUrqI9NVHVezBL
 9PSM4lSFImsSeG/Yd3d7I6xw2wUTLhPwWxagCH/XScIHGIJI/WZ76JEhntsIZ9Y2W8
 UnJ/ARQ9SWzRA==
Date: Mon, 7 Jul 2025 07:42:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shangyao lin <shangyao.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 01/13] dt-bindings: media: mediatek: add camisp binding
Message-ID: <20250707-amazing-catfish-of-reward-f4c5ba@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-2-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-2-shangyao.lin@mediatek.com>
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

On Mon, Jul 07, 2025 at 09:31:42AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> Add camera isp7x module device document.

Missing SoB, missing checkpatch.

> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-camisp.yaml
>   - Split bindings into four separate patches (one per YAML file)
>   - Various fixes per review comments
>   - Update maintainers list
> 
> Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>

Apply this patch and see by yourself.

This wasn't tested either, so I will skip review.

Best regards,
Krzysztof

