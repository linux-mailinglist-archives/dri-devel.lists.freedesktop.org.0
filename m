Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FCF860F47
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 11:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95A710EB86;
	Fri, 23 Feb 2024 10:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AITRzPou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F9C10EB86
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 10:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708684210;
 bh=a5wsB2yzzq4HgC/3HlvIPTX8LqprZF/u+NXqYmbqYW8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=AITRzPoueMRYeP57son9yL6hAeAgXHSh8sWxepR3jEGc2Mp36bHj3vHMYYi+J7aEx
 tFcIxI397gK1+nh3flb50/8ug7TbRyAyDAKtTc4o3yOzg3wdF1pRBPZ2/OfekKUju1
 ib3ph1KHl+R3jvap1mX0iSkEOpiech1UU5Us0C8emgMpSqp23Pk19Mwm1epvnxJLST
 GmWULOC0PkTfYbbYBfgWC6aKawmvgh0wS9L4yjWUNTrzcbFvi90WHpE8nnT5bXg0uS
 1EumBITbZZDinPGrDEzkCaNX87LUD4sUdF/qvawmv+5EhkewYtAlW8QFmdr3MEu3aD
 1rsOgo4/wQfkg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E127E37820CF;
 Fri, 23 Feb 2024 10:30:09 +0000 (UTC)
Message-ID: <c365c2c8-8211-4e36-8ba1-8b4638e81039@collabora.com>
Date: Fri, 23 Feb 2024 11:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] soc: mediatek: cmdq: Rename cmdq_pkt_jump() to
 cmdq_pkt_jump_abs()
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
 <20240222154120.16959-4-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240222154120.16959-4-chunkuang.hu@kernel.org>
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

Il 22/02/24 16:41, Chun-Kuang Hu ha scritto:
> In order to distinguish absolute jump and relative jump,
> cmdq_pkt_jump() append absolute jump command, so rename it to
> cmdq_pkt_jump_abs().
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


