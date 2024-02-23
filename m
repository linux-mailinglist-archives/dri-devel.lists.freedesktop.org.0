Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3092860F49
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 11:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B03010EB8A;
	Fri, 23 Feb 2024 10:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="tU/pwnqt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0009A10EB88
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 10:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708684211;
 bh=oksfU+fjc/xYMcDn3tKuSUAuIA25aWOSa7trmb9oheE=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=tU/pwnqtf19cXHHYt1duEeCMAfVyO//g1/TgqsTYB9Ebx++6plCrQCDjvstojhAf5
 v0ukIqQhDkyu7HyZQflSangDQJCtC/Ey+OqWJiwsAc6s8uowzyP1mv9npoCgUC7Vd1
 2VbYQVbaQvZL1Y0mxRy9+VSh4SoEFHDnOySXbHTbcKcjvg0fBw7uWUG9xFjy0ddhbW
 YJJLWBlqzX2QFtOrFB0Y/+sIv83593pRK/y/aeFVWIrsqFvCtByXlaSGP4C9WbCX7A
 +sU/xobO40rWRVkhw2q+wWX04YQr6hnsF4KXBp5TbfYr6eZ3lgRSnEtQshhnBWpyA+
 w4PfC7SSPL6sA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 25C5637820DC;
 Fri, 23 Feb 2024 10:30:11 +0000 (UTC)
Message-ID: <0a09cbe4-3a36-4d44-a826-5b1dbab6dd49@collabora.com>
Date: Fri, 23 Feb 2024 11:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] soc: mediatek: cmdq: Add cmdq_pkt_jump_rel()
 helper function
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
 <20240222154120.16959-5-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240222154120.16959-5-chunkuang.hu@kernel.org>
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
> cmdq_pkt_jump_rel() append relative jump command to the packet.
> Relative jump change PC to the target address with offset from
> current PC.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

