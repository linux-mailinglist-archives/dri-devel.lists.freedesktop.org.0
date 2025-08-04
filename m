Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7198B19CF1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 09:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6ED10E412;
	Mon,  4 Aug 2025 07:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="X7yZLNHL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE95510E40D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 07:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1754293819;
 bh=BnROzuyXaP1UwzsNHCzraWROM8wBopZw3oc70QdaeLY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X7yZLNHLr5r4UBsZrUZv1Fye/q81mMRCYpkb5sYPybsalpnFBh7oVBKEL22Uj+Fsv
 OAdjfNL3sn+doU+cV8IywTM0GTsdUtBTkaFYv6v8TzdkykYmFqt4QwkiHvuIt+B2Qs
 fToBWzRC9+/zfxonJUmzfUr2S6v08U0E4y9UlVdzacKGXHYF4vBYkXvfshKcJLfduy
 mJtSitKhRYiO71CMnuMvOXGLtXyc8oGbPhtsvLHVUjsJCgr7aW+kWoDbtmctSC24K6
 cYviCWyOellTh9LYIQTy7hFs3Cm8IXtlwqTkuqu+eoLw0+9ZgM0Z2qKexnnn+EYQ4Z
 F9TjvuSZUm4Rw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 12EE217E04DA;
 Mon,  4 Aug 2025 09:50:18 +0200 (CEST)
Message-ID: <d030ed4a-bb43-4f24-82c9-6106209013b9@collabora.com>
Date: Mon, 4 Aug 2025 09:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/23] Add support for MT8195/88 HDMIv2 and DDCv2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
 <2eq5je6xk4ly5lxijit3ufor7pmm7mgivbuigzr35lrbe2ryvr@3axnsyabigm7>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2eq5je6xk4ly5lxijit3ufor7pmm7mgivbuigzr35lrbe2ryvr@3axnsyabigm7>
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

Il 03/08/25 00:23, Dmitry Baryshkov ha scritto:
> On Tue, Apr 15, 2025 at 12:42:58PM +0200, AngeloGioacchino Del Regno wrote:
>>
>> This series adds support for the HDMI-TX v2 Encoder and DDCv2, and for
>> the direct connection DPI as found in MT8195, MT8188 and their variants.
> 
> Angelo, just wanted to check, what is the fate of this series? I think
> it wasn't updated since April. It was a really good example of utilizing
> the HDMI framework(s). Wink.
> 

Even though it was fully reviewed, everything but the actual driver was picked
for whatever reason.

I am about to go on holidays for the entire month, but I asked Louis (added to the
loop) to resend the driver while I am away... :-)

Thanks for the reminder and especially for the appreciation, btw.

Cheers!
Angelo

>>
> 

