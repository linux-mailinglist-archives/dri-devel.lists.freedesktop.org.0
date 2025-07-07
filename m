Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9581AFAB3A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 07:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79D710E402;
	Mon,  7 Jul 2025 05:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dIut4TWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0424810E402
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 05:50:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2F2D1A52C99;
 Mon,  7 Jul 2025 05:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4264AC4CEE3;
 Mon,  7 Jul 2025 05:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751867402;
 bh=H1uS+lRJDdIKeULrbOYxVDA++ia5TLO7SuOj0M3uK/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dIut4TWp53JwMnw9mex2FsExLGQGUavwebot/I3b/t4xvw0IIJk3dPFPV3CAF+0eq
 /fWy9f3vAMXBRl4DZFFWTEuIWnztk0EYLXmHR3yWtFoTjDrL+EKH6KC5VKtTKLMm6T
 HP7sP9REben2i/iLwmdN5Qt5BypVMEu1SN6VYzgZ1Dn+nTCNc06wbkdX5xi3iyD8wd
 KVDuiaTyKjYQIfrZ9ag5OZ+5a13QrodgbuReDEqA61toH6f8R2zvMn++eQwxLnlfUu
 UGa9GPrt5QIX3IBMjkFIrXeLdRFN093xAIhwUFsbAO6t32olgE2lR6y0d46f5wBZys
 +9khuLgxKw+6w==
Date: Mon, 7 Jul 2025 07:50:00 +0200
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
Subject: Re: [PATCH v2 05/13] media: platform: mediatek: add isp_7x seninf unit
Message-ID: <20250707-lavender-peacock-of-patience-fdc712@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-6-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-6-shangyao.lin@mediatek.com>
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

On Mon, Jul 07, 2025 at 09:31:46AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>

My most frequent comment last year to Mediatek. I even asked to come
with some internal procedure so you will not keep repating the same
mistake in author's name.

Any success?

> 
> Introduce support for the MediaTek sensor interface (seninf) in the SoC camera

...

> 
> ---
> 
> Note:
> The PHY operations have been refactored and separated from the seninf driver,
> but there are still some issues to confirm with reviewers in this v2 patch
> (dt-bindings: media: mediatek: add seninf-core binding). The PHY part will be
> moved to drivers/phy/mediatek/ in v3.
> 
> Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>

and here the same.

Best regards,
Krzysztof

