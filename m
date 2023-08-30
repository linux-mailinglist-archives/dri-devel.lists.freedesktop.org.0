Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739DD78D549
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 12:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2289010E11A;
	Wed, 30 Aug 2023 10:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E933910E4F6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 10:56:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 55A8A60F29;
 Wed, 30 Aug 2023 10:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0459C433C7;
 Wed, 30 Aug 2023 10:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693392960;
 bh=Qmj5BFfzATwiV9vaUhtiqnZF81rYO34Lo+8rLqUFuRQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PPgfgzXj75LN3zMV5Fa2zBOZc5G5C3Gj7mYPrwl+CnzU26tuqtCMonnL6DNAvzV79
 PKYHXvtsxWDL0tb2L4itEOPSbwFK6xOYcdm3oyX7LxnL8epupDsf1b4pbUH8DWBO73
 VrAFRwHyNhr7Ap6UruV3O/Jaw3Mtk3JshOJO6hiaAMQBa5B+SboXuavA+8N55zlb8u
 Jb3ZG7Clkebd0Vl2GIArs/gyLB1Yv0ks0fTaXsgzTPGugfl/demP9SzWCslB1aN80K
 AA5OKwqoeEsASc9/I1/4jYmdR69jse6lyT6Nopf6zk++vqhxbOF9Nlu3EWXswqzTSm
 3J/PRWID5ZfDQ==
MIME-Version: 1.0
Date: Wed, 30 Aug 2023 12:55:55 +0200
From: Michael Walle <mwalle@kernel.org>
To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: Re: [PATCH 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs calculation
In-Reply-To: <fca464b9-9f32-4420-90fd-05e851871c25@notapiano>
References: <20230829131941.3353439-1-mwalle@kernel.org>
 <20230829131941.3353439-2-mwalle@kernel.org>
 <fca464b9-9f32-4420-90fd-05e851871c25@notapiano>
Message-ID: <acec69f943f85b02909d8ce3e4d538c3@kernel.org>
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
 Frank Wunderlich <frank-w@public-files.de>, Stu Hsieh <stu.hsieh@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy
 . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> This won't work. On MT8195 there are two display IPs, vdosys0 and 
> vdosys1,
> vdosys0 only has the main path while vdosys1 only has the external 
> path. So you
> need to loop over each one in all_drm_private[j] to get the right crtc 
> ID for
> MT8195.

Ahh thanks, got it.

-michael
