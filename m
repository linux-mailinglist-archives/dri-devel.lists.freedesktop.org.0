Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770FCA4BE46
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 12:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611D910E224;
	Mon,  3 Mar 2025 11:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EShFM9A4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1318110E224
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 11:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741001041;
 bh=b11YAUOR3ELvh8yV5kuXlG74Flyo1oLkSgGTNOWxpHM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EShFM9A42uZ7Vz4T9j3Jmo+iyh7kxW7mRYbjM75c6oD5HNR3/XHMP7w/mYWLe0+DT
 XmVdN2tHNPxPv35oenT/KsaJsRZObXeKzFOm3+DHYfUIyz3aAKdZYjM41iaAr5hw7M
 Ykffl/Fz0cKV8LmmrurltgAzNnq6IiYG/VqBGPwEOMKf6H5XGFvpC+2Y0TEVrGTY0g
 vOESWMMWGajsI34F5l3GwXU5nOTgurpPYU0+mR8lbkA+WwT60rr67pT3SgU2O3DSBx
 9lpAsGY+Tu4NgwP/PfgVIjPltJxCp73P2AwuQfBFYSq7Wa9c+kTNNbmbn/jYWIFXYd
 yaYJj+E5qmhYA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 85B9817E0881;
 Mon,  3 Mar 2025 12:24:00 +0100 (CET)
Message-ID: <c48b28a3-3277-475a-aca2-c55b9b67e4f5@collabora.com>
Date: Mon, 3 Mar 2025 12:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add driver for Himax HX8279 DriverIC panels
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com, pablo.sun@mediatek.com,
 christophe.jaillet@wanadoo.fr
References: <20250218143952.84261-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250218143952.84261-1-angelogioacchino.delregno@collabora.com>
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

Il 18/02/25 15:39, AngeloGioacchino Del Regno ha scritto:
> Changes in v2:
>   - Removed unneeded mipi_dsi_device_unregister() call for secondary
>     DSI: as the driver is using devm, that's not necessary (CJ)
>   - Removed superfluous if branch as pointed out by CJ
> 
> This series adds a driver for DSI panels using the Himax HX8279 and
> HX8279-D DriverICs, and introduces one panel using such a configuration,
> the Startek KX070FHFID078.
> 

Hello,

friendly ping for this series - need to know if this gets pulled in for this
merge cycle as to understand if I can take devicetree commits enabling display
on MediaTek Genio boards.

Thanks!
Angelo

> This panel is found on the latest hardware revisions of some MediaTek
> Genio Evaluation Kits, and specifically, at least:
>   - Genio 510 EVK
>   - Genio 700 EVK
>   - Genio 1200 EVK
> 
> This driver was tested on all of the aforementioned boards.
> 
> AngeloGioacchino Del Regno (2):
>    dt-bindings: display: panel: Add Himax HX8279/HX8279-D
>    drm: panel: Add driver for Himax HX8279 and Startek KD070FHFID078
> 
>   .../bindings/display/panel/himax,hx8279.yaml  |  74 ++
>   drivers/gpu/drm/panel/Kconfig                 |  11 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-himax-hx8279.c    | 905 ++++++++++++++++++
>   4 files changed, 991 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
>   create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8279.c
> 



