Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC872976F2E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 18:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C30110EBDB;
	Thu, 12 Sep 2024 16:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RSkpgXj+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F71C10EBDB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 16:54:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6A97CA45756;
 Thu, 12 Sep 2024 16:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42B2C4CEC3;
 Thu, 12 Sep 2024 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726160052;
 bh=EvuQRTOvCygv4JttyYOrIYG2JZuDMwbgBuOgkBJTeAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RSkpgXj+jtRgdtCiTXLvwsUHUdoe4J25kmlMfVfb1/cYDHZ39VIPLu0B+EVQYrWEg
 eXasDGChp/IqEDddBOUc/14D0P3rUbJEy8ojr8kmWAWhcEzxIidEsLruIsiveCeT/7
 BlQTgenMOoQZz0A1+zCRv5EXrG4ipcfqagMuMEj9+sGrXYxlBljX5jv/saUVLWc63C
 tcH1VSgSzk7SiVByhan7p8/+K8io2ALVDTPqrE6CHWBJxDwKKo++qPawPEqMRdrpOn
 qYlXGo0kJqpyKlp5jnHne3PZ/qwgUGIbicMDDSaRVjD5Tv0fhuY5O5667XleL8Nm6P
 g8cY44G2Vnw+A==
Date: Thu, 12 Sep 2024 17:54:04 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>
Subject: Re: (subset) [PATCH v7 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-ID: <20240912165404.GG24460@google.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
 <20240912145100.GE24460@google.com>
 <10c1217b-d8a3-489c-93fc-6de45dcbe47c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10c1217b-d8a3-489c-93fc-6de45dcbe47c@sirena.org.uk>
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

On Thu, 12 Sep 2024, Mark Brown wrote:

> On Thu, Sep 12, 2024 at 03:51:00PM +0100, Lee Jones wrote:
> > On Wed, 04 Sep 2024, Mark Brown wrote:
> 
> > > [03/16] dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
> > >         commit: 761cab667898d86c04867948f1b7aec1090be796
> 
> > Did you mean to hoover this up?
> 
> It seemed to go along with the series and had a DT review so it looked
> like you'd just left it to the DT people to review, there wasn't any
> other MFD content in the series.

I applied it from this set 6 weeks ago! :)


-- 
Lee Jones [李琼斯]
