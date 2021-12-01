Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E903C464D99
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 13:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080526FAD0;
	Wed,  1 Dec 2021 12:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708B06FAD0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 12:09:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 35A941F458EB
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638360569; bh=0YgzXkVV1X/IZvgSoD4iMcxH7QCuIHr0V9DiB0TY+bw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fHJpzr6GCyngtbkTI3bZ9s8It12v3Wnta73EBxeK78/mXmFFIQAhUW+aPYgf15Lix
 qU9X+8gQ9SQPYplpZSYBeuAyt576NfriyKed5C0OiWnis3cbYOa4PAZooZ/gui3Dcx
 7PZNt+K/7zYMeIpzd1AXGmOsxU5YMpM9yEl2GLrYUWcl4czFsSVolJ97VJrUAIsGGk
 sE7qlHEhjtla7xqwYXNhAFcUgCXka2QbsZBEDVkYr9TnNHwXn/eDzP6KIe1VBAJb9m
 A5V09mWUabZkMfXlBHoswoM0onIcwQy+aOUhXcGnYiJaSfVImhOqelwoXQhXVgwbKN
 DOjX6FhZaNBXA==
Subject: Re: [PATCH v11, 04/19] media: mtk-vcodec: export decoder pm functions
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-5-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <8a5afa81-71b7-ba42-d1ce-2bbf82a7e557@collabora.com>
Date: Wed, 1 Dec 2021 13:09:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211129034201.5767-5-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 29/11/21 04:41, Yunfei Dong ha scritto:
> Register each hardware as platform device, need to call pm functions
> to open/close power and clock from module mtk-vcodec-dec, export these
> functions.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
