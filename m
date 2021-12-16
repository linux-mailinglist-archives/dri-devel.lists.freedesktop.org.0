Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6496476CBB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 10:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D10310E4A6;
	Thu, 16 Dec 2021 09:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BADA10E4A6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 09:02:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6FC181F45D58
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639645338; bh=zL+DWDBWAxAva/LZzsV++QwebWTx6OWlGYYwxqnET50=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LeMrGcf6WrFDjr819fF7rrGXdWK1RGXev2g2Fe3BxmKyDKQR58rfPvyPzN/398uVh
 CPSvLQj6GuCESbkLKlzz3Stme+36QzEnpcECCfGeYxDLf2MMatNd93dxTonUZDi9LQ
 BJk0V+FaevjvId9RUuPdCKlt4PGxD7483tAYQqTmZLxdt2B/nlVMwQMAg/01n1itCP
 VMuJkAawvJXjOmy4Hf48QPoiyaeWbMWppDz17sr7FWfUH1c5ceUg3OnezI7T2vEoBb
 STf2TygCvpj5Q0nqFGVUNrzrD/RH+kXoDuAJ9JKsx+VgkEwHKgzfA9KA6a7H8XI5xG
 u7+7A9sC4+qMw==
Subject: Re: [PATCH v15, 10/19] media: mtk-vcodec: Add msg queue feature for
 lat and core architecture
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20211216085745.18732-1-yunfei.dong@mediatek.com>
 <20211216085745.18732-11-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <0eda55f9-6961-0ee5-b7f3-916a4e0a3d7c@collabora.com>
Date: Thu, 16 Dec 2021 10:02:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211216085745.18732-11-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
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
Cc: Irui Wang <irui.wang@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 16/12/21 09:57, Yunfei Dong ha scritto:
> For lat and core architecture, lat thread will send message to core
> thread when lat decode done. Core hardware will use the message
> from lat to decode, then free message to lat thread when decode done.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
