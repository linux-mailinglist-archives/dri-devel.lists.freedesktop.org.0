Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5C7860F4A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 11:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCA110EB90;
	Fri, 23 Feb 2024 10:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="h8KqeDAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FB410EB88
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 10:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708684213;
 bh=lG1vOEdIEIT+tsgIXj2hsQ9c8Cdoi+8MMRDj+wt4ZPE=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=h8KqeDAWWeFaJpGwqiONHdV9Xi3WVCrM6hy6olAK3cb+8vBzr5zL2QvguPXI79lol
 DOC2+LkW9RCSc4fVFNJd3Xc9D4EC+R6UDL8zbO19mNWsuiR3LAah8rdWRwIZ5L+Pd2
 rhjrnKX9CQkip2+pMvdRnU3CxYACKGgiNzu9FOgXPEf2wvWvZ2mFOow2PmxGrg9jka
 d4pMInAoS+wdvHHVYYRkmfd7/wgVfSAYqazaT0JsXb86XSj/LzJVFerOZ/Sa6TgWsT
 YwBT/vSGwpV/OcPIN6FYWuXR3XZ5cedN5BpwO2gY9+TBkCVHTUZ+aF3AH7tCkkxyVk
 CTZmlupxnvnLw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9174C37820DF;
 Fri, 23 Feb 2024 10:30:12 +0000 (UTC)
Message-ID: <0a98ae3c-6d89-4a93-94bf-542092ae8e1d@collabora.com>
Date: Fri, 23 Feb 2024 11:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] soc: mediatek: cmdq: Fix typo of
 CMDQ_JUMP_RELATIVE
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
 <20240222154120.16959-2-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240222154120.16959-2-chunkuang.hu@kernel.org>
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
> For cmdq jump command, offset 0 means relative jump and offset 1
> means absolute jump. cmdq_pkt_jump() is absolute jump, so fix the
> typo of CMDQ_JUMP_RELATIVE in cmdq_pkt_jump().
> 
> Fixes: 946f1792d3d7 ("soc: mediatek: cmdq: add jump function")
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

