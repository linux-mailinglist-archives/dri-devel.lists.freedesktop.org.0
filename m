Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8815FE9CA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 09:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA5810EA97;
	Fri, 14 Oct 2022 07:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36E610EA97
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 07:46:31 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 716326602329;
 Fri, 14 Oct 2022 08:46:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1665733590;
 bh=Ie8n8azEe/zRMQeb35yxJBatp70DLtiAWtHsYslKQRs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z6utxoiC6ugvWq6s7NFir29tiytZyGOmJ6Ikd0hccyb5gAdFaED9rRWcalxExGcKu
 Sp+9PVpw/0DlDV+uFxRpH3nn8QHGPIYyPj5orluHDXl7oIt2+XdUao7hQ6SyKp9gKn
 ricQerJkCCBwWPRGl3civp5+v9PL6NrSaFG3PsVK4+fp7e10cThsyb535tYwRhuRjD
 eOjQHHA6hqtlGNxckdrYMwW7jRoThwVGF99vDqtRXMfz7Dotrv0Gn0y1Sp/OcB6l1v
 X2cEPH38DxOgpz/TP5YWAKftZyA8c+Gwhad86suqEHuhrcDdkXWLxpBzgBwSKuyMM5
 E6DmRF+C1vPqQ==
Message-ID: <5723fa3f-033b-07f6-6774-cd5df97d5cbb@collabora.com>
Date: Fri, 14 Oct 2022 09:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v4] drm/mediatek: Add AFBC support to Mediatek DRM driver
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org
References: <20221013193148.2027842-1-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221013193148.2027842-1-greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, wenst@chromium.org, matthias.bgg@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/10/22 21:31, Justin Green ha scritto:
> Tested on MT8195 and confirmed both correct video output and improved DRAM
> bandwidth performance.
> 
> v4:
> * Move modifier validation to format_mod_supported function.
> * Add modifiers to drm_universal_plane_init() call.
> * Make comparisons to DRM_FORMAT_MOD_LINEAR explicit rather than relying on
>    DRM_FORMAT_LINEAR being equal to 0.
> * Gate AFBC control bit writes on device compatibility.
> 
> v3:
> * Replaced pitch bitshift math with union based approach.
> * Refactored overlay register writes to shared code between non-AFBC and
>    AFBC.
> * Minor code cleanups.
> 
> v2:
> * Marked mtk_ovl_set_afbc as static.
> * Reflowed some lines to fit column limit.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


