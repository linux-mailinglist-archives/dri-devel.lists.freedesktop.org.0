Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690A3AFAB29
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 07:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA5310E2EA;
	Mon,  7 Jul 2025 05:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qVvdJli/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA86110E2EA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 05:44:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CAFB36112D;
 Mon,  7 Jul 2025 05:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC0AC4CEF4;
 Mon,  7 Jul 2025 05:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751867088;
 bh=eu+GHjOCvCqVRqoV63kexKMOhEID9n+g92CJ/14sRIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qVvdJli/K1bLN5V7IZXJn+i7qVsLuHc04/BVVu7V5YFQuxNYCzJnanl9TJV2s4u4O
 ZrYzzUNlEbYPm0iGu0leOc9FRhDw1RzZ2Y6QTKnld3ga1v9KY2GDAaTyTYJSTkHeMJ
 9/5sMnr7/NfIVCuOUImcIEz2yItPERe5vrvxp6l+UPoNO6hbUu3po9+7pQSM5/H8jn
 4jqrYKWakPv7gzCU0XmEon3BoGMGnE8P7Ek6epBomcO3UUGVX8Nw0TSz3Yowxp32xi
 Wz9AIqm0PqpNKmKRUHwkmq7CDwGSve7eYuOwikbIAg+ux1ePKm0yvT7jTY6YnLAHyA
 y1GFlrPylvORg==
Date: Mon, 7 Jul 2025 07:44:45 +0200
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
Subject: Re: [PATCH v2 02/13] dt-bindings: media: mediatek: add seninf-core
 binding
Message-ID: <20250707-merciful-electric-jerboa-bb5bae@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-3-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-3-shangyao.lin@mediatek.com>
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

On Mon, Jul 07, 2025 at 09:31:43AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> 1. Add camera isp7x module device document
> 

Still no SoB, still not tested, still no checkpatch...

and also:

...

> +
> +...
> \ No newline at end of file

Look, you have patch warnings. Review your patches before you post them.
You should reach internally to mediatek colleagues to explain you how
this process works. I really do not understand why mediatek has so poor
quality of work and cannot improve over last 1-2 years!

> -- 
> 2.18.0
> 
