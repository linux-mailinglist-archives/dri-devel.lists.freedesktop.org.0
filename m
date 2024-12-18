Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327CB9F69AA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 16:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60AC10EBD8;
	Wed, 18 Dec 2024 15:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="N1zSb1NH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB7510EBD8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 15:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734534767;
 bh=/WpAFEF2F//sHkizT2Rkt9wmQRdw0Tc769M5Q7NH2Dw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N1zSb1NHDcwcImQKkK83d7SaYQbZ8eq6iwR4QFs1Ej1e7qzGO+fiIay3UHVzKMvLR
 SyrLlrBr+wIOpIEr1LJYA0Ps4cfi8Ul7yvoZTXB/6uBrbCi+il25h0iXOnBA2vgHCE
 aod8nZ/Mi9QTMSp2cZfr4NMBM4oGhnU2weBvvGYqlp9Y/zZ0u5QztQYqoPWg4lTT8v
 9hdh6s3vDmjM+Ft3GkrvQ8MJOpxs4taQhPJDrlQW5b9hr6aaebQraCzXpxxLAZbRlr
 QDdC4Xc+RHiviMQBrFQQKM8pJGFNJwa+DtT4Jek0LCzw7brmg6luNZQQ52Xe5YBODp
 fOzcjDefCp4Sw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 43AFB17E377F;
 Wed, 18 Dec 2024 16:12:46 +0100 (CET)
Message-ID: <db89c62e-5346-4e46-b6b3-6cc6b3e5a256@collabora.com>
Date: Wed, 18 Dec 2024 16:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: stop selecting foreign drivers
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>, Chen-Yu Tsai <wenst@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241218085837.2670434-1-arnd@kernel.org>
 <46f871e3-bb1e-4bee-95f3-2121c6a6eef7@collabora.com>
 <1d8c6f65-5baa-459e-ba34-4e45ca20baf6@app.fastmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1d8c6f65-5baa-459e-ba34-4e45ca20baf6@app.fastmail.com>
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

Il 18/12/24 12:44, Arnd Bergmann ha scritto:
> On Wed, Dec 18, 2024, at 11:50, AngeloGioacchino Del Regno wrote:
>> Il 18/12/24 09:58, Arnd Bergmann ha scritto:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The problem is - no PHY no party, it's not going to work without... but
>> I get the
>> reasons behind this change.
>>
>> Are we sure that we can't just add a `depends on PHY_MTK_xxxx` (or extend
>> depends on DRM_MEDIATEK && PHY_MTK_xxx)?
> 
> Doing this wouldn't cause any problems, but it also doesn't
> really help much, you just have to know which devices are
> present and enable all their drivers anyway.
> 
> We used to just select all drivers from arch/arm/mach-*/Kconfig
> on some older platforms, but this was too much of a hassle.
> 
>        Arnd

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

