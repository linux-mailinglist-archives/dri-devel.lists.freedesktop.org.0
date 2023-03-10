Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA40E6B3A3E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 10:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D00810E99A;
	Fri, 10 Mar 2023 09:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC2A10E998
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 09:22:31 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B1D68660305C;
 Fri, 10 Mar 2023 09:22:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678440150;
 bh=JMXL243jAxlm4gqHeJ2NFg+6tI8MwEQEYrunSWbmeoA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HpyEfn34ugkCE8oge3WFGbbnnpHIyaPeh9Nszz0ZpgBSRM+eNVG+ru93CZVHgrJVQ
 dXrFVQoI/a4siJ8RXW7YvKuTiDGFE6cBYegiuIIPMnsLPDVmqxb9KzDjUH89RzO8sb
 b06Lj1a06p/GU+EQ7WAxKsckq39wAdNq0hoiUPcOTX2crVBdnAnjhIGJt0SaP5oLRY
 d0PqvHzNxl7VFcfK7MCtnPupHNavTvcPtnk6gt89scX1eoyQfbN8/s/6a0FsamvUfM
 NMkWoVBi6H+7i+1YwnuU/Od1WKRQvYOv8Xug03hvMTaevyb0OyKoDQRw7tNFBYErPU
 HSh39OoPfN39g==
Message-ID: <1e06e948-9871-cca8-fd56-5d32442003d9@collabora.com>
Date: Fri, 10 Mar 2023 10:22:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/3] drm/mediatek: Refactor pixel format logic
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20230309210416.1167020-1-greenjustin@chromium.org>
 <20230309210416.1167020-2-greenjustin@chromium.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230309210416.1167020-2-greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 wenst@chromium.org, matthias.bgg@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/03/23 22:04, Justin Green ha scritto:
> Add an DDP component interface for querying pixel format support and move list
> of supported pixel formats into DDP components instead of mtk_drm_plane.c
> 
> Tested by running Chrome on an MT8195.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


