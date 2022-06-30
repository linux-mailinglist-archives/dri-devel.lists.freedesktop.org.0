Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8451562129
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 19:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4C711B4BC;
	Thu, 30 Jun 2022 17:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBD111B4BE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 17:23:11 +0000 (UTC)
Received: from [192.168.2.145] (109-252-118-164.nat.spd-mgts.ru
 [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 45383660196C;
 Thu, 30 Jun 2022 18:23:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656609790;
 bh=LJhSooS9IKyrkGhIs6fkyHnN38CkHuggqq2CmdQEVaA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ER4ulT9P0QybLv69xoZ3bZoWAVUKLsOeSv8QTbdsK6cDJ/3bo5P7LUiuZBlAoFbFN
 Uj1hg6uWtiZ1iT1CsAZxQ0PUekp2vXJuOZhOvoGKvb1tMWvzB9CD33W7ci9TN3pI/5
 GoxZ48aTIyjQmVlakrGpyAD/baZpWpMhvp3J/EuCd4LGUzCqE2Ujzg31TQHm6VIR5U
 gljtZPg8RhCeRcUomsL02VE1yajs06QiDFYvlHqqrKdnOhoO6IB56eAW+4zfphZyAb
 BH+uc+zEGV9idmOCa++Jj/FHMkHPDDhvjg4lcR7sygCZbfjyS3pAgcvGZivvHvLAWs
 S/4WJqwMriGKA==
Message-ID: <b7715f7d-c69d-2bb0-8226-bcb29e5bf91c@collabora.com>
Date: Thu, 30 Jun 2022 20:23:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 0/3] Support Sharp LQ101R1SX03 and HannStar HSD101PWW2
 panels
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220529180548.9942-1-clamor95@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220529180548.9942-1-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, Svyatoslav Ryhel <clamor95@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

On 5/29/22 21:05, Svyatoslav Ryhel wrote:
> This series adds support for Sharp LQ101R1SX03 and HannStar HSD101PWW2
> display panels that are used by Asus Transformer tablets, which we're
> planning to support since 5.17 kernel.

The tablets now supported since 5.17 and awaiting for the panel patches.

> Changelog:
> v5: - previously patches were sent by Dmitry and he asked me to resend them
> 
> v4: - Added r-b from Rob Herring that he gave to the LQ101R1SX01 DT patch
>       of v2. I missed to add it to the v3 by accident.
> 
> v3: - No changes. Re-sending for 5.18. Device-trees of devices that use
>       these panels were merged to 5.17, so we're missing the display support.
> 
> v2: - Added ack from Rob Herring to the HSD101PWW2 binding.
> 
>     - Updated LQ101R1SX01 binding, like it was suggested by Rob Herring,
>       making LQ101R1SX03 directly compatible with the LQ101R1SX01.
>       Such that ["sharp,lq101r1sx03", "sharp,lq101r1sx01"] could be
>       used in DT. This removes need to update panel driver with the new
>       compatible.
> 
>     - Improved commit message of the LQ101R1SX03 patch.
> 
>     - Added my s-o-b to all patches.
> 
> Anton Bambura (1):
>   dt-bindings: sharp,lq101r1sx01: Add compatible for LQ101R1SX03
> 
> Svyatoslav Ryhel (2):
>   dt-bindings: display: simple: Add HannStar HSD101PWW2
>   drm/panel: simple: Add support for HannStar HSD101PWW2 panel
> 
>  .../bindings/display/panel/panel-simple.yaml  |  2 ++
>  .../display/panel/sharp,lq101r1sx01.yaml      |  7 ++++-
>  drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
>  3 files changed, 36 insertions(+), 1 deletion(-)
> 

Sam, could you please take a look at these patches? They missed two
kernel versions already because there was nobody to apply them. Thanks
in advance.

-- 
Best regards,
Dmitry
