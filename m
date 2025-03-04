Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B49CA4D891
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 10:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ABA10E538;
	Tue,  4 Mar 2025 09:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="owCgTfZu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FF710E538
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 09:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741080933;
 bh=5J3RCvW8I/AvYVkLawf1nfGsr7tulDAIHBWxPLYvq1A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=owCgTfZuYvHdiCtMekSe4va90H4jc/rJkzQnWkBlm3uAn8SpeyTuN9tRrZvUR2nU8
 2smnVSWVBc0Eki9A7tT5rcg78qn85Hn7hb+JBdN2+p/34LEpPkm4R83k14lXPqhAQe
 I+R4CFLdvVN+owGce33sePsnqHwTaZrZ3Zo9C0JO85T5LGb+ziDCQD7SgDj6eXQAEN
 i05nACIW9LxJDMR72jUixCt8G27A3/hYnhBz5sBsKNqcRohgDua1l7ZOgYfZLptC5J
 asqXkAUT7/7Ex0KPX1JMwYcpRLSH2qh4BnJIg5F9BefxtqmsakhzPmrlytPNxDRyft
 z+DOsT2m25NGA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 22C2317E0607;
 Tue,  4 Mar 2025 10:35:32 +0100 (CET)
Message-ID: <581fc075-25d8-4104-a4ee-8c97e1a017e6@collabora.com>
Date: Tue, 4 Mar 2025 10:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 unsupported subsys ID hardware
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-5-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250218054405.2017918-5-jason-jh.lin@mediatek.com>
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

Il 18/02/25 06:41, Jason-JH Lin ha scritto:
> When GCE executes instructions, the corresponding hardware register
> can be found through the subsys ID. For hardware that does not support
> subsys ID, its subsys ID will be set to invalid value and its physical
> address needs to be used to generate GCE instructions.
> 
> This commit adds a pa_base parsing flow to the cmdq_client_reg structure
> for these unsupported subsys ID hardware.
> 

Does this work only for the MMINFRA located GCEs, or does this work also for
the legacy ones in MT8173/83/88/92/95 // MT6795/6893/etc?

In order to actually review and decide, I do need to know :-)

Thanks,
Angelo


