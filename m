Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB75296FC13
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 21:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F58E10EA31;
	Fri,  6 Sep 2024 19:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k/2tmJK0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142D810EA31
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 19:23:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ABD6BA4525B;
 Fri,  6 Sep 2024 19:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB13C4CEC4;
 Fri,  6 Sep 2024 19:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725650606;
 bh=/n96Kto0JZug0XlU6wzixOGIsRQmVNlzwkTH7ThriiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k/2tmJK0ZIGo88O1HE1+DTpj1x8V/ZUa4loaN18gbxhwGafooIAqA0snN6lcl3BnD
 tHGE/I27eRUfMvwbykJyJz4R5y41Et/JERKNFdNNQwHmMIeHki8cANYcXazZnf5bFQ
 AE9wie939zT1oHWDiUVa8OHBh0oQyXZ8xyRTob6KHrC7StGbvtaImoy5BYCRh4/U5I
 9eTWosx5C2OjaGnyRbPv2SM6zvdG01EPnLVnA89qjv14/y1d9VyD33syg1md8p3YOm
 xPuHIAUAEc5KRrU3fHSddFxZOPySfzxiUImK1OTpqXdwpxgdHvplkDXMmvWA71/DcN
 rKlzHB0YmkzPg==
Date: Fri, 6 Sep 2024 12:23:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>
Subject: Re: (subset) [PATCH v7 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-ID: <20240906192323.GA3160860@thelio-3990X>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
 <20240906180348.GA1239602@thelio-3990X>
 <ZttJdexQFOq2Q9iQ@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZttJdexQFOq2Q9iQ@finisterre.sirena.org.uk>
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

On Fri, Sep 06, 2024 at 07:27:01PM +0100, Mark Brown wrote:
> Are these just warnings introduced by recent versions of the toolchains?
> These commits passed an x86 allmodconfig with GCC 12 at each step (I did
> catch one warning there with another patch in the series that didn't get
> applied) and 0day didn't say anything at any point.

Not sure, I did not look too hard. At cursory glance, I am not sure x86
allmodconfig would catch these, as this code depends on ARCH_MEDIATEK
(not COMPILE_TEST), which only exists for arm and arm64.

> > Clang 19:
> 
> That's relatively modern, though some of the warnings don't look
> particularly new and exciting.

Fair although I still see some of them on old versions too:

https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/10738441894

> >   sound/soc/mediatek/mt8365/mt8365-dai-adda.c:93:8: error: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551614 to 4294967294 [-Werror,-Wconstant-conversion]
> >      91 |                 regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
> >         |                 ~~~~~~~~~~~~~~~~~~
> >      92 |                                    AFE_ADDA_UL_DL_ADDA_AFE_ON,
> >      93 |                                    ~AFE_ADDA_UL_DL_ADDA_AFE_ON);
> >         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   1 error generated.
> 
> That's a bit surprising, regmap_update_bits() takes an unsigned long?  I
> suspect the constants need to be defined as unsigned.

Does it? I see it taking 'unsigned int' for all of its parameters.

$ sed -n '1242,1250p' include/linux/regmap.h
int regmap_update_bits_base(struct regmap *map, unsigned int reg,
                            unsigned int mask, unsigned int val,
                            bool *change, bool async, bool force);

static inline int regmap_update_bits(struct regmap *map, unsigned int reg,
                                     unsigned int mask, unsigned int val)
{
        return regmap_update_bits_base(map, reg, mask, val, NULL, false, false);
}

Cheers,
Nathan
