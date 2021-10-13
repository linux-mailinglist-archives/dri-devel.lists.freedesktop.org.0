Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC1D42BDEC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 12:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6AD76E86B;
	Wed, 13 Oct 2021 10:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9E36E86B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 10:55:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 376CE1F4415E
Subject: Re: [PATCH v7, 00/15] Support multi hardware decode using
 of_platform_populate
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <73f83f00-5d49-ba77-f46d-9c0855dc5268@collabora.com>
 <11498cb8b7f1754f6134ce8143bd4f81272d0ffc.camel@mediatek.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <e62baef3-3fa6-5dd4-cbd0-026227b4cf7c@collabora.com>
Date: Wed, 13 Oct 2021 12:55:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <11498cb8b7f1754f6134ce8143bd4f81272d0ffc.camel@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi,

W dniu 13.10.2021 o 03:08, yunfei.dong@mediatek.com pisze:
> Hi Andrzej,
> 
> 
> On Tue, 2021-10-12 at 16:27 +0200, Andrzej Pietrasiewicz wrote:
>> Hi Yunfei Dong,
>>
>> W dniu 11.10.2021 o 09:02, Yunfei Dong pisze:
>>> This series adds support for multi hardware decode into mtk-vcodec,
>>> by first
>>> adding use of_platform_populate to manage each hardware
>>> information: interrupt,
>>> clock, register bases and power. Secondly add core thread to deal
>>> with core
>>> hardware message, at the same time, add msg queue for different
>>> hardware
>>> share messages. Lastly, the architecture of different specs are not
>>> the same,
>>> using specs type to separate them.
>>>
>>> This series has been tested with both MT8183 and MT8173. Decoding
>>> was working
>>> for both chips.
>>>
>>> Patches 1~3 rewrite get register bases and power on/off interface.
>>>
>>> Patch 4 add to support multi hardware.
>>>
>>> Patch 5 separate video encoder and decoder document
>>>
>>> Patches 6-15 add interfaces to support core hardware.
>>
>> Which tree does the series apply to?
> 
> I don't understand your mean clearly. Media tree?
> 
> You can get the patches from this link:
> 
> https://patchwork.linuxtv.org/project/linux-media/cover/20211011070247.792-1-yunfei.dong@mediatek.com/
> 

Here's what I get:

$ git remote update media_tree
Fetching media_tree

$ git branch
   master
* media_tree
   mediatek-master

$ git-pw --server https://patchwork.linuxtv.org/api/1.1 --project linux-media 
series apply 6465 -3
Failed to apply patch:
Applying: media: mtk-vcodec: Get numbers of register bases from DT
Applying: media: mtk-vcodec: Align vcodec wake up interrupt interface
Applying: media: mtk-vcodec: Refactor vcodec pm interface
Applying: media: mtk-vcodec: Manage multi hardware information
error: sha1 information is lacking or useless 
(drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c).
error: could not build fake ancestor
Patch failed at 0004 media: mtk-vcodec: Manage multi hardware information
Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Regards,

Andrzej
