Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4739A502856
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 12:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE6110F333;
	Fri, 15 Apr 2022 10:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F65310F332
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 10:32:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 528AC1F47E6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650018763;
 bh=o3B0CJoa73EGtPrdPd8q/dHzTCP0JQ19PFMotaGHh2Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YqgqgY818zgL/yZrmonREhd9kAKts0WzHOubFJUu6GJkIk56jwELmHZwGW5VYtRyN
 vk20W1Xz3jFZrrMXKKDlutccF5JiELA6uk2VtqhTeWAQpcHMlooYZnKuqHZdAKu0aI
 roIEvtF1YVIzj0EkC02uolZ1tMmxsSmUEZoUgr2MFmt0PpA5HONPJ3JFmBkrhUnrjx
 iLqX24u0djPJhCFfXhV2wg6BbnUdVRpjxLePK9fu95GRGHWrZu2cTd6k4ILRikTXTO
 fy3juF6JCaeYmbnKptYT/3SK+dqUws7nHZhwuaHwAmkv0KbVPW5IIUgWZVfCCi5b+W
 GMe2ZE3qfHHUw==
Message-ID: <387ede3f-20be-cb84-f343-f68c75eaf5fd@collabora.com>
Date: Fri, 15 Apr 2022 12:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 10/10] soc: mediatek: remove DDP_DOMPONENT_DITHER enum
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
 <20220415083911.5186-11-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415083911.5186-11-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/04/22 10:39, jason-jh.lin ha scritto:
> After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
> mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

Can you please fix the commit title with:
soc: mediatek: remove DDP_DOMPONENT_DITHER from enum

that "from" is important, as you're not removing *an enum*, but *from an enum*.

After that:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks!
Angelo
