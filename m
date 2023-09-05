Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088427920E9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E5710E17C;
	Tue,  5 Sep 2023 07:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E818D10E17C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 07:58:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B67F7B81097;
 Tue,  5 Sep 2023 07:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81992C433C8;
 Tue,  5 Sep 2023 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693900729;
 bh=Dnlu1SDu2v2QnFOKA53mp8v1htY/lKtNTEha/hvocxc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BsAmLrNAK3vRW/Ymrt8hnLJqZhHBqtc+z93aKmix89cbGbhO2h2ccpOS4/emu37Cm
 qZ+cQ1oNKl378LvaB9nSaSmHygFW1LhtwTaYl0ydUbXhifhmuQiUVSJR28StLntCxv
 qXB92+lnyhBs4cNDyi6aUVcHKJq4qDPK28NvR7GyfZ2+9rHjVXdxWW/srzQMqfWB2u
 F/QpNxnAGoYouTTd9HyrWrxWrcDW8A7QqArEMDyudwVNB9vu8ILYYIIwQovFT/zcai
 vRq5UGfIkVUDpxpL7p1Jkm1ESvxYR1epeYhWTQ3opxRexM98a1st/YvMkEAHrpyM6H
 DveQ0u/e2HqQg==
MIME-Version: 1.0
Date: Tue, 05 Sep 2023 09:58:44 +0200
From: Michael Walle <mwalle@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs
 calculation
In-Reply-To: <d7e6917d-7315-12d6-d7d4-dc7ea8c58dc9@collabora.com>
References: <20230901174557.3617839-1-mwalle@kernel.org>
 <20230901174557.3617839-2-mwalle@kernel.org>
 <d7e6917d-7315-12d6-d7d4-dc7ea8c58dc9@collabora.com>
Message-ID: <cf7d01700f5e5adf2f28b0376451143b@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>, Stu Hsieh <stu.hsieh@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy
 . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> At this point, I think that it would be sane to change this function to
> return a signed type, so that we can return -ENOENT if we couldn't find
> any DDP path (so, if we couldn't find any possible crtc).

Fair enough, but should it be part of the fixes commit or a different 
one?

-michael
