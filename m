Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01839524E97
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 15:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF14C10E54A;
	Thu, 12 May 2022 13:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D92110E49C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 13:46:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E67851F45583
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652363216;
 bh=RyPWTywraZJdJgYVK8sw+koHjhdtDXtM5n+U7hdW10g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Oq6GZdIajB4EoWPSLSX2K3nhCdJNatj8DY+t3QlCm7Sf2HkKgPTR1YYvAwUVv7mzQ
 CU33zLRb3MTxD4arnPjDX142ekT2S0LaNvjRhwwXOhhmY9+75ThX1kOqyOuDa7ABbF
 ROqJjmt1xcxbdt1bikcynOMY99x99v+aqGzGh7rm3j33Px/QRYloyzcMbjLhvKU8CB
 FOsorcfZyr3Bi9OBOurcWfL3i7KtQgSW17EBnResBz2MNvfyl0ugrCo83btKS6434L
 tTOOhOByAkPA6hXNjsg+s271ZNRUD+d57OOpPoTaIIu+HSdgboPTbM7sRDAIqHvVD/
 FCrABTI9+Dfyg==
Message-ID: <174082e0-4472-9dc8-e7df-dfb45c3760ce@collabora.com>
Date: Thu, 12 May 2022 15:46:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH , v4] media: mediatek: vcodec: Fix v4l2 compliance decoder
 cmd test fail
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220423073531.24749-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220423073531.24749-1-yunfei.dong@mediatek.com>
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/04/22 09:35, Yunfei Dong ha scritto:
> Will return -EINVAL using standard framework api when test stateless
> decoder with cmd VIDIOC_(TRY)DECODER_CMD. Disable them to adjust v4l2
> compliance test for user driver(GStreamer/Chrome) won't use decoder cmd.
> 
> Fixes: 8cdc3794b2e3 ("media: mtk-vcodec: vdec: support stateless API")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

