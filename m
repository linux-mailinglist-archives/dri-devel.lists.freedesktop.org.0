Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7CB7A4575
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E93F10E22B;
	Mon, 18 Sep 2023 09:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6536F10E22B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:06:25 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7C1106607038;
 Mon, 18 Sep 2023 10:06:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695027984;
 bh=oof1nHN9tACZ947GQ2VLhaMIPFEc3JBhMrlsL+95qgg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U1vLZxQ3EcYiAWrB8+o60kkPxM97CglJ+EQd37dILEc0/AzOfm6wypcZrRrlt5YUo
 ilRMcrPjveo4nygcDiR1xXg+hjneKx7zXYkIFHhdlIZi7anpFq6MFRof8xI45YAiri
 QxXRESlGO0G2ncft8/IRDKM9be5NKd9bCbWSpxu3M+6P+e23W+B4hqhZ5hnq86iZ9E
 bkwHeC+ac6JtKmCMrfvc2SRCpDVZu4x5KdUTTTbIqA7Xm1NggQcn7RGQiFp1DlKDjt
 /f/nA/IvnOwrtUT0xEZGqJTyBWW5kvprNEvXbp4C+GqXNIP85hXeh0CS4XVVLwoZb/
 v2/BvcIvIzcOA==
Message-ID: <f2d33884-ca33-9255-5d88-64ad4c6d117b@collabora.com>
Date: Mon, 18 Sep 2023 11:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 03/11] soc: mediatek: Disable 9-bit alpha in ETHDR
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
 <20230918084207.23604-4-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230918084207.23604-4-shawn.sung@mediatek.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/09/23 10:41, Hsiao Chien Sung ha scritto:
> ETHDR 9-bit alpha should be disabled by default,
> otherwise alpha blending will not work.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

