Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B48081C113
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 23:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEE010E707;
	Thu, 21 Dec 2023 22:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9315310E707
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 22:29:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6FEFBCE203C;
 Thu, 21 Dec 2023 22:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227AAC433C8;
 Thu, 21 Dec 2023 22:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703197774;
 bh=3olSdqCH1RJ2MPrPxBn2yqWGIxPoGVfij5wrm0E4WBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WQmpAzbQVhum7pt8MnB5a/VRcUcuMzWWOygOildljSPEjspTWsN83Xs3do5JEyt4B
 wOCQgDpqhdFiW0WB/4sfRaIcd+qt5e7eTZSHRVCWTIFXFmZWl3uUc4gJ5glMTBM9pC
 8opfAwrvBB5vm3T4T6bfmRyk3L3xtHbGRrKQgs+ztgCeb9W7qwzwX0LS/nQOPDFmk/
 1J9++p45KKmNAvXL4jeQgaDDYSYHdw4nnmacHwrGB/e20j87aqa572TAD0p2q4cdB8
 Q8cHuXjlwkKXyyGPSr03UR34eKjWumho6+z1zy94B2cm6b2v72lysJKg8LDsDKrji0
 zqwj9JXTs/AeA==
Received: (nullmailer pid 205437 invoked by uid 1000);
 Thu, 21 Dec 2023 22:29:32 -0000
Date: Thu, 21 Dec 2023 16:29:32 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v10 02/16] dt-bindings: media: mediatek: mdp3: merge the
 indentical RDMA under display
Message-ID: <20231221222932.GA196757-robh@kernel.org>
References: <20231220100853.20616-1-moudy.ho@mediatek.com>
 <20231220100853.20616-3-moudy.ho@mediatek.com>
 <250fead9-868b-4063-a054-4cb966dc4ba3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <250fead9-868b-4063-a054-4cb966dc4ba3@linaro.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 21, 2023 at 10:28:52AM +0100, Krzysztof Kozlowski wrote:
> On 20/12/2023 11:08, Moudy Ho wrote:
> > To simplify maintenance and avoid branches, the identical component
> > should be merged and placed in the path belonging to the MDP
> > (from display/* to media/*).
> 
> Combining bindings into one bigger meta-binding makes it usually more
> difficult to maintain and review.

Yeah, but these mediatek blocks appear to be used for both display and 
video codec pipelines. So having different bindings was probably wrong 
to start with.

Rob
