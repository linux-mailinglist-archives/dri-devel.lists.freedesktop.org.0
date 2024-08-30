Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FB4966A8F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 22:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6EF10EAE8;
	Fri, 30 Aug 2024 20:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l1gTFH/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DC710E6B8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 20:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725049943;
 bh=rOtkussEVvEtJaYYLqRR1742JXpbhS+YhqlnswW9ZG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l1gTFH/043LrvIs3MAkQBN3SS90BvwS3PZwIsSVvAt841aCoqoEpMc7aFPtO7AW1d
 EwxHd+cBGOUuHl25xHzE4Uy2jzmDNPTulvRK8mo/gCrEhiI77vuu4MwDakXCPXzY9y
 hCw4Tshns0hj6Xy+Tw+XkZwSlCxGK/PJH4Go/aX1Y9C0tQh6hMmNMDSIJKlvk2fi47
 4HnFcMCjhwwH4eQFuqP3b2giom53ZFykytaVA+7vRtkMxs9tdKSYaCEtXzdU1MYXRb
 IZ1dhBVg2qePGDmC4EshaD8jMQ/ARgcSmf28iNda3Jfj+Bw7j0cQ0z2rAmbuaCSeWL
 JWUNJaSINFxqg==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 34D2D17E121B;
 Fri, 30 Aug 2024 22:32:22 +0200 (CEST)
Date: Fri, 30 Aug 2024 16:32:20 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 5/5] soc: mediatek: cmdq: Remove cmdq_pkt_finalize()
 helper function
Message-ID: <7a5a4d9f-f22f-433a-87a3-7df7ae4f8cd3@notapiano>
References: <20240810090918.7457-1-chunkuang.hu@kernel.org>
 <20240810090918.7457-6-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240810090918.7457-6-chunkuang.hu@kernel.org>
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

On Sat, Aug 10, 2024 at 09:09:18AM +0000, Chun-Kuang Hu wrote:
> In order to have fine-grained control, use cmdq_pkt_eoc() and
> cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().

This commit description doesn't match what you're doing. What about

Now that all occurrences of cmdq_pkt_finalize() have been switched to
cmdq_pkt_eoc() and cmdq_pkt_jump_rel() for more fine-grained control, remove
cmdq_pkt_finalize().

> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
