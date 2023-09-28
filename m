Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20357B1738
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 11:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403CC10E5F2;
	Thu, 28 Sep 2023 09:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6840910E0DA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 09:24:39 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6193B6607336;
 Thu, 28 Sep 2023 10:24:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695893078;
 bh=90qF0JONfyTIpjPjha6pxFcSPf8q+bYBcasiV6AC/Lg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NvnPBOkADSUaW55IC8fDbA6G7I72J9az9eTx7GvhpdjNJDb1jvku8R8LRt4s6TbC8
 GkeMuciCmReU1Kq5qm8S1b3WwXL886siidlEZ8cjVvF9Pj/h2np7bGkleM0I+3NNPN
 uNGnpUIDz717uwbwMwbjJCckfdPReiG0XoqsKtBh4BwGj56soFBDAQMwjBHHlqAy/y
 t8CJeM60tq/sUuM9b/g++gojCw9OUjvsES2Qnjs/Qo6A9yhGjUh825f68K7ROrk8Tq
 /ahrpJp+wh+30R37uLVt3q0WTKQeRdpyQa0TCBHKc4SF4S9EOMLoXhP+4QzxF2wHpG
 rDaSYmK2/0Kcw==
Message-ID: <bde3f76a-6cc8-e92c-0b35-d6edbe87c014@collabora.com>
Date: Thu, 28 Sep 2023 11:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 4/9] drm/mediatek: Add encoder_index interface for
 mtk_ddp_comp_funcs
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
 <20230927153833.23583-5-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927153833.23583-5-jason-jh.lin@mediatek.com>
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
> To support dynamic connector selection function, each ddp_comp need to
> get their encoder_index to identify which connector should be selected.
> 
> Add encoder_index interface for mtk_ddp_comp_funcs to get the encoder
> identifier by drm_encoder_index().
> Then drm driver will call mtk_ddp_comp_encoder_index_set() to store the
> encoder_index to each ddp_comp in connector routes.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


