Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89CF7B171F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 11:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B880810E0DF;
	Thu, 28 Sep 2023 09:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382FC10E0DF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 09:21:22 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 625E866072A2;
 Thu, 28 Sep 2023 10:21:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695892881;
 bh=Wmquj5k4fklJequpW25oG3UqElIMnj5aU5gGo6GvfPo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IdwzOkViI7b01dmD/jSIGztbSZy8my/DLSq8JYYnbUNRkXGxcWIOVNEs4cI3i0f0r
 7/oHFzMzIbMckadZBqwEZFxEeHtzRvXvusNobcukQ3kKjsujIPq5M30Uk5u3lIK+2Z
 RR/KurrUr8vTRwOhrKo4fbvooJ28zmgEEDbXCFHFCr8VXpnyJJ+rL9bd9JcwNxnjTQ
 F1khGrj12qpMR7o333RvE1Qt6zHGV693XjeEef2a9GimV7+GPtPpdgCgmODmhqWdK5
 ApgZ5V4yh3Ef19LQtoDZnWgICGesO5a7a8WDxgOlOfmg4C1pL1qM6YCwNneD2bjsvY
 pJ+suxthfAoNg==
Message-ID: <79c0e8b7-11b1-7025-47e0-402c95007824@collabora.com>
Date: Thu, 28 Sep 2023 11:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 2/9] drm/mediatek: Add crtc path enum for all_drm_priv
 array
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
 <20230927153833.23583-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927153833.23583-3-jason-jh.lin@mediatek.com>
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
Cc: Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/09/23 17:38, Jason-JH.Lin ha scritto:
> Add mtk_drm_crtc_path enum for each display path.
> 
> Instead of using array index of all_drm_priv in mtk_drm_kms_init(),
> mtk_drm_crtc_path enum can make code more readable.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


