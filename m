Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4756660BC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 17:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AD310E796;
	Wed, 11 Jan 2023 16:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020C610E796
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 16:39:14 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 06F996602D3E;
 Wed, 11 Jan 2023 16:39:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673455153;
 bh=gia7NHJzP8vCL5xfKWqDX1VgVkCNInSkGk4TT8KZ0DU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hZX55ayKE7k7KQ5VJ/4r36NFhQpP986LaAfX+U7vW0ZnoIx3bbomN4QN44XMOV8h6
 BVnCQV0/HNPKk132jafEaeGZlZ7ClF+Oivq2V1MC333ZF9EfwTbdIJOB1vlnfOxMdE
 ulDd7/3bMdLGs5nbBHw5gQFx6TvgkmZKoZSTnbSffHT5+9ZT6asuoOL1CeF1dlvFQH
 TlVEijrDu7Ish1bPoIts58YrultpQ8b6uSggwDWvDhYW5W+UgUcrGXnw65Q65vdT3g
 qP1OkLQ76SqPJGw5xeGfWLk76pwnU2M4Gwzd8AoT8P8xly3SnGVZ5NeEi09oc+4vtU
 Qf7enchWfu+/g==
Message-ID: <e7bcf53a-0d01-4e40-e609-c1cd9b5a9ef3@collabora.com>
Date: Wed, 11 Jan 2023 17:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] drm/mediatek: Add support for AR30 and BA30
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20230110204742.1354797-1-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230110204742.1354797-1-greenjustin@chromium.org>
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

Il 10/01/23 21:47, Justin Green ha scritto:
> Add support for AR30 and BA30 pixel formats to the Mediatek DRM driver.
> 
> Tested using "modetest -P" on an MT8195.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


