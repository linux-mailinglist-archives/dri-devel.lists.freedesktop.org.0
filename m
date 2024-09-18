Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 008EC97B794
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 08:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C0E10E032;
	Wed, 18 Sep 2024 06:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0700310E032;
 Wed, 18 Sep 2024 06:05:00 +0000 (UTC)
X-UUID: ec40523c758311efa216b1d71e6e1362-20240918
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:0f166acb-9a92-4197-92f2-9b0a98694fed, IP:15,
 URL:0,TC:0,Content:1,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:13
X-CID-INFO: VERSION:1.1.38, REQID:0f166acb-9a92-4197-92f2-9b0a98694fed, IP:15,
 UR
 L:0,TC:0,Content:1,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:13
X-CID-META: VersionHash:82c5f88, CLOUDID:dcecfe3cf5121096a31c13c67478d6f1,
 BulkI
 D:240917202609BZ64102R,BulkQuantity:2,Recheck:0,SF:42|66|17|19|101|74|64|2
 5|100|102,TC:nil,Content:4|-5,EDM:-3,IP:-2,URL:1,File:nil,RT:nil,Bulk:40,Q
 S:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS, TF_CID_SPAM_SNR, TF_CID_SPAM_FAS,
 TF_CID_SPAM_FSD, TF_CID_SPAM_FSI
X-UUID: ec40523c758311efa216b1d71e6e1362-20240918
X-User: yaolu@kylinos.cn
Received: from [10.42.20.76] [(111.48.58.10)] by mailgw.kylinos.cn
 (envelope-from <yaolu@kylinos.cn>) (Generic MTA)
 with ESMTP id 1928682378; Wed, 18 Sep 2024 14:04:53 +0800
Message-ID: <ac7350bd-d29b-7f3f-1de5-e95b0d968e18@kylinos.cn>
Date: Wed, 18 Sep 2024 14:04:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/amdgpu: add dce6 drm_panic support
To: Alex Deucher <alexdeucher@gmail.com>
Cc: ckoenig.leichtzumerken@gmail.com, daniel@ffwll.ch, jfalempe@redhat.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 srinivasan.shanmugam@amd.com, sunil.khatri@amd.com
References: <20240802071752.116541-1-yaolu@kylinos.cn>
 <20240812060914.102614-1-yaolu@kylinos.cn>
 <CADnq5_OcUgV9dgAynDCQnm9NS+QCvhBiHvxWnhWqi2qqhh=zXg@mail.gmail.com>
Content-Language: en-US
From: Lu Yao <yaolu@kylinos.cn>
In-Reply-To: <CADnq5_OcUgV9dgAynDCQnm9NS+QCvhBiHvxWnhWqi2qqhh=zXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 2024/9/17 21:21, Alex Deucher wrote:
> On Mon, Aug 12, 2024 at 2:10 AM Lu Yao <yaolu@kylinos.cn> wrote:
>> Add support for the drm_panic module, which displays a pretty user
>> friendly message on the screen when a Linux kernel panic occurs.
>>
>> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> Patch looks good to me.  Any chance you want to convert the other
> non-DC dce files (dce_v8_0.c, dce_v10_0.c, dce_v11_0.c) while you are
> at it?
>
> Alex
>
I don't have any hardware with those dc ip blocks.
Although the code logic looks consistent, but it still needs to be 
tested, right?  ; )

Lu Yao
> ---
> Changes in v2:
> 1. Drop include "drm_internal.h"
> 2. Add disabling DC tiling ops.
> Per suggestion from previous thread:
> https://patchwork.freedesktop.org/patch/606879/?series=136832&rev=1
> ---
>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 48 +++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> --
> 2.25.1
>
