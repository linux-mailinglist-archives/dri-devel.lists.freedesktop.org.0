Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE06E9394
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 14:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2321210EC19;
	Thu, 20 Apr 2023 12:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3B610EC19
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 12:02:03 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3537E66030CC;
 Thu, 20 Apr 2023 13:01:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681992120;
 bh=LcRVmUKZzFzapPfbEEWSGRzomqHZShG7TMdpFQ+vpIc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GORNTUxT1VHh3euff+j8a13k52+aTqkVMsuz1x1LzNAFAahj0yoL8uOpiQSeqRNXj
 1szidLMLsTiCUsmzl4bSFzO9shZA0zd7dxfHrrtfyj7yQrTZNrIBQZI/CEiDkYCLf+
 6m1W1fgMroNvvcqMYs77NxhI78iIsBKWP6gK3XeO2qNIlcMr2YKIBDS4GDzTzkDUXk
 Y5qf5kpZ/sauS6jc+9L3j6wkyU2CX0Vqd+E+OxgNKlrTeCUfW2vLD8avtzPp917EJ0
 jZTGmIKLgdnMo4xy4+8GUKuVIBl/1q3XQGN0vGS+ECeZqrwxqNlDkpmOAiC97jElhS
 y6yxn4DufQnOg==
Message-ID: <e1619d7a-2ac3-55bf-bcf1-cad3f07d20fe@collabora.com>
Date: Thu, 20 Apr 2023 14:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/mediatek: fix uninitialized symbol
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230420105115.26838-1-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230420105115.26838-1-nancy.lin@mediatek.com>
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
Cc: singo.chang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 20/04/23 12:51, Nancy.Lin ha scritto:
> fix Smatch static checker warning
>    - uninitialized symbol comp_pdev in mtk_ddp_comp_init.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

I agree with this commit, but please add a Fixes tag.

Thanks,
Angelo
