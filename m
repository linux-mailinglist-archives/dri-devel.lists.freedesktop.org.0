Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F29866CAA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 09:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D62C10E66C;
	Mon, 26 Feb 2024 08:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cjNQTnUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ADA10E664
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708937001;
 bh=7tWk0zhZOW2AyHeE8JN2hmS9AUeGcPyEShuN2Nk8GSc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cjNQTnUGWeXLKtjG32spXHpy9A7jLY9HdhXy6zZARpW+f90xV0zkxfsHgC8Ix5Ygv
 xZ0/fSF5kOpWfz3INhZO/yKEHjP93N8jl6/lTRvhO0Ki16AnsNdZHpXlfvH7Foktb8
 JYHFVTkUb0DW/KLDf3eoMGDpnM6/h1iC/b+rnbZjL2UuGr1iUoPf+GWVD3M4ncsHkI
 9r9BQdpIS8oPDAWZs12IANBFXuX2HsCFMMsreXBZQxmvMmgo3cU29/KrmoIgVxKZiy
 Y+gV/tAYmmbZ41iy9r/bnffpLKroJ21Hrzw6gOEM+DEH1WFUC+rGKBokwzPw8SyVkE
 gSyrzBdrBMCVQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A97523781183;
 Mon, 26 Feb 2024 08:43:20 +0000 (UTC)
Message-ID: <c4814e25-42c9-4604-b86a-8ef0bd634f78@collabora.com>
Date: Mon, 26 Feb 2024 09:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Add MT8188 Overlay Driver Data
To: Fei Shao <fshao@chromium.org>
Cc: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 chunkuang.hu@kernel.org
References: <20240221165643.1679073-1-greenjustin@chromium.org>
 <c7d6259b-90e7-41a3-998f-a12edf7c1554@collabora.com>
 <CAC=S1njw4JM++D4kYyi4Z2rcDTsvqD1b0VtpQ5A071dgvtVGdg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAC=S1njw4JM++D4kYyi4Z2rcDTsvqD1b0VtpQ5A071dgvtVGdg@mail.gmail.com>
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

Il 26/02/24 09:21, Fei Shao ha scritto:
> On Thu, Feb 22, 2024 at 4:43 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 21/02/24 17:56, Justin Green ha scritto:
>>> Add MT8188 overlay driver configuration data. This change consequently
>>> enables 10-bit overlay support on MT8188 devices.
>>>
>>> Tested by running ChromeOS UI on MT8188 and using modetest -P. AR30 and
>>> BA30 overlays are confirmed to work from modetest.
>>>
>>> Signed-off-by: Justin Green <greenjustin@chromium.org>
>>> Tested-by: Justin Green <greenjustin@chromium.org>
>>
>> Hello Justin,
>>
>> I'm 99.9% sure that you don't need this, you can just use compatibles
>>
>> compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl";
>>
>> as they *are* indeed compatible, and MT8188 does support AFBC as well.
> 
> Hi,
> 
> I confirmed that I can lit up the MT8188 display with that plus a
> follow-up patch [1].
> Otherwise a compatible sequence of mt8188, mt8195 and mt8192 would be
> needed, but that would be somewhat redundant.
> 

Actually, that wouldn't be MT8192, but MT8183 - following MT8195's devicetree,

so it would be

compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl",
              "mediatek,mt8183-disp-ovl";

And yes that could be redundant, but I'm not sure that adding a compatible
string to the mtk_drm_drv matches is a good idea.

I'd be more for using the triple compatible strings in there instead, as it'd
be like that for only *one* node and not more than that - IMO, that is totally
acceptable and it's also the best (and lightest) solution.

Cheers,
Angelo

> [1]: https://lore.kernel.org/all/20240226080721.3331649-1-fshao@chromium.org/
> 
> Regards,
> Fei
> 

