Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A6FBC8C98
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A2E10E9B6;
	Thu,  9 Oct 2025 11:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kszlChMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FEB10E9B5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 11:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760009233;
 bh=IArN+RtuYOyMN6ifHcTZqjTU9T5GXTomdxvkjyTpvog=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kszlChMxGCiSID1BGesFoQO5o1WuBuD0hz3VjE50XvSAyfFhRQA/CGlbeNy5kT/K+
 RFtHcv4v29QHI5tgz6rZLLlDBlYm0o9gXfXFgIP5rmcjK6iH9iJ2YIZMn+Dz8I1qfG
 VN1yJ+X/m/FE8MQxNJbhJjzZigYMZ1XKcuiFDo0TYhE1KnIybMG7ucfgiuj66F3g1X
 m1RrZ0qyxwuB02TWCt60RmfvNckDCiHqVbnhtq3u8u19gIkG2rzV8Qu8qnUFHJodZu
 62Z5BSDKJgef74B5rK+9oBx2Yo+m+44xk9WUhZqDP0WLploZa+xYYq9gB8hRo5tXZq
 jFyJoQsjtdklQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E97CA17E01F5;
 Thu,  9 Oct 2025 13:27:11 +0200 (CEST)
Message-ID: <2834b895-d4e5-44f4-b8b3-c892f84ccffe@collabora.com>
Date: Thu, 9 Oct 2025 13:27:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/20] mailbox: mtk-cmdq: Add driver data to support
 for MT8196
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 CK Hu <ck.hu@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-9-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-9-jason-jh.lin@mediatek.com>
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

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> MT8196 has 2 new hardware configuration compared with the previous SoC,
> which correspond to the 2 new driver data:
> 
> 1. mminfra_offset: For GCE data path control
>     Since GCE has been moved into mminfra, GCE needs to append the
>     mminfra offset to the DRAM address when accessing the DRAM.
> 
> 2. gce_vm: For GCE hardware virtualization control
>     Currently, the first version of the mt8196 mailbox controller only
>     requires setting the VM-related registers to enable the permissions
>     of a host VM.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


