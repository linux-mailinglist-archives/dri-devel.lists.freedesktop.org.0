Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A226CC63A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 17:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC6A10E48B;
	Tue, 28 Mar 2023 15:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA4010E07E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:28:10 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BABD66603150;
 Tue, 28 Mar 2023 16:28:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680017289;
 bh=LmvUlEh5ksKEzZpgWt6GAloNsrYbh3aS1Uuprqn7NrQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OxmJNUxnR44yQjrlJub8pgQJ3zvKv/f1CAfrfoWmoakCxVDJPvYH4FZ180Ga1hUcR
 eDIQ2KeX/G1t0RTjMFLIPS2JLqRS2LCwOshmH78KBTpR0QXsscOPkZQWAs8ok6UW9f
 dlddXKT4RQDFsXqzqTdhg3YnbxCYzZF83cyQStM0g5GSgCTE29pC4laMP1NVuWdwFN
 MAHxodsupYCT/aeAcaV4fw7/H09VP4lBrlFdBPlUMB9cbsSwG6DwqmjYrVUq0WZgbT
 e9VVwip0kksvvBDf2xq3hGwxycmw4ypj31cThe6YFFKK0+g+b1z6rqXbzHya6gp2kU
 J8oXU6DFEpOFg==
Message-ID: <fa638276-81d0-734d-92c1-3b72cd70c1ef@collabora.com>
Date: Tue, 28 Mar 2023 17:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/mediatek: Add ovl_adaptor get format function
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230328025126.30341-1-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230328025126.30341-1-nancy.lin@mediatek.com>
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
Cc: shawn.sung@mediatek.com, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/03/23 04:51, Nancy.Lin ha scritto:
> Add ovl_adaptor get_format and get_num_formats component function.
> The two functions are need for getting the supported format in
> mtk_plane_init().
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Change-Id: Ia8e9f6cabcc71b262155a022b103ae81d1616b8f

The code looks good to me, but please drop that Change-Id tag (which has no
meaning upstream) and resend.

Thanks,
Angelo

