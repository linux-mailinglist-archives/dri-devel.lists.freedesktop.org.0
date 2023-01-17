Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2881C66E3A5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB2A10E188;
	Tue, 17 Jan 2023 16:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215EC10E188;
 Tue, 17 Jan 2023 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HvfSDUM7klsKahX/nOAuRsWnPJafumSV3ao8UaWB83I=; b=ptaJrX5m0yz26EhNMcl/jPDGaB
 4rLhsv6L9koT2KfgsVWtQoczlm+LyJ/WivakHmuHUEWZl+XAxrIUBEtTxzB4WVn6afLZvSrIjLozm
 q19U5kRcTAwnAyeS8jrQ1PKe0TgbBPImETcQMVTzEdKaJ6IXIkGhHOHcKrHRRQ0QxU6TdrjyoeiGp
 xaOzg8rZe7JP72rXzcuK1vQ3FqIC+CNxCQAZwJcdbk0bY2j0ELH1pp0mSeN8JRof7YIf+g1Bdt1cT
 M9OxM+qN88GZiYOoyNZsv9XKtWv3fqqrP+N/hzN3B5+EpOe5WwfgJUNS/LNYymkFAy0uqF5MuxT4T
 GxEgMdCQ==;
Received: from [187.56.70.205] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pHovO-00AmiQ-J8; Tue, 17 Jan 2023 17:35:02 +0100
Message-ID: <97e63839-ae89-7bc5-ce10-0a45a1071a5c@igalia.com>
Date: Tue, 17 Jan 2023 13:34:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force (en/dis)abling
 indirect SRAM mode
Content-Language: en-US
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-3-gpiccoli@igalia.com>
 <CADnq5_Oh5Vdygo12evQKxw3w-ipRoQMvSNFHGcKtBNbSmtW7GQ@mail.gmail.com>
 <DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19@DM8PR12MB5399.namprd12.prod.outlook.com>
 <b8a7253e-6902-e143-1bf2-ff107f25fd2b@igalia.com>
 <CADnq5_NJ7Kjoi7d+8bL2KNY3Leg8Jy7QL5reDS_dyEt7MUB0wA@mail.gmail.com>
 <a6680b24-372f-673c-4b3c-1fd3c309f242@igalia.com>
 <968afa8d-d402-311f-cf14-fd2dd27bf385@amd.com>
 <16d17ee0-bda7-af95-b148-df5ce649336f@igalia.com>
 <CADnq5_OzgMy3s_w4Aa-+51PqJHG+iBeaHYu2gv2t3J-5tExGmw@mail.gmail.com>
 <MN0PR12MB6101E722B07AC8C46BC3D22CE2C69@MN0PR12MB6101.namprd12.prod.outlook.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <MN0PR12MB6101E722B07AC8C46BC3D22CE2C69@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang,
 Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Pierre-Loup Griffais <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/01/2023 13:24, Limonciello, Mario wrote:
> [...]
>>> Though I see two problems with that: first, I'm not sure what's the
>>> impact in the GPU functioning when I disable some IP block.
>>>
> 
> It depends on the individual block what the impact is.  For example
> if you don't have VCN, then you can't do any accelerated video playback.
> 
>>> Second, the parameter is a bit hard to figure - we need to clear a bit
>>> for the IP block we want to disable, and the doc suggest to read on
>>> dmesg to get this information (it seems it changes depending on the HW
>>> model), but I couldn't parse the proper bit from dmesg. Needed to
>>> instrument the kernel to find the proper bit heh
>>>
> 
> Isn't it this stuff (taken from a CZN system):
> 
> [    7.797779] [drm] add ip block number 0 <soc15_common>
> [    7.797781] [drm] add ip block number 1 <gmc_v9_0>
> [    7.797782] [drm] add ip block number 2 <vega10_ih>
> [    7.797783] [drm] add ip block number 3 <psp>
> [    7.797783] [drm] add ip block number 4 <smu>
> [    7.797784] [drm] add ip block number 5 <dm>
> [    7.797785] [drm] add ip block number 6 <gfx_v9_0>
> [    7.797786] [drm] add ip block number 7 <sdma_v4_0>
> [    7.797787] [drm] add ip block number 8 <vcn_v2_0>
> [    7.797788] [drm] add ip block number 9 <jpeg_v2_0>
> 
> So for that system it would be bit 8 to disable vcn.
> 
> In terms of how debugging would work:
> I would expect when you get your failure it will have been the previous
> block # that failed, and so you can reboot with that block masked and
> see if you get further.
> 

Thanks Mario, much appreciated! You're totally right and I messed up not
seeing these obvious messages...

So, I'll just drop the parameter on V2.
Cheers,


Guilherme
