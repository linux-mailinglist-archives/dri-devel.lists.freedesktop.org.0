Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EDB682686
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 09:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC8210E348;
	Tue, 31 Jan 2023 08:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAA510E348
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 08:34:44 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B26816602EB0;
 Tue, 31 Jan 2023 08:34:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675154083;
 bh=gk51BAwxxzzaABKBP2WotRoLxqVnUC7sVm/G4eOrCFY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R9VyU3qxX7AEcl+PjF66YNawyr36hWB9F55uHVuLiAbGrkePSC81KWH58V7Hb0S13
 n2Wx5Udk36QZ3VnRQD+l6xdtFo2kYsZJ0tdYjm0jcoHKiRXPII/vIIs+WZUWV8SyvF
 rMRipUurAvVndfWvlesKQ8I7l54ZEXEd6EqdLbhYxlyN8TFB+ZANflibWBccuFDCQE
 wyFSU/yc7vPAGKiAniknm4FNgnXjSzqddtADpBpNu6ilj5gwc8l8SZJksYSy+ZREMT
 DLzp4//yT96L9QvSUmrQhrzigRkkNinrXhNp7Blx2Y4NeN71T6IFLGgo6TJynialHF
 0ked1AunctcKQ==
Message-ID: <ff2862aa-288d-7c81-8867-521f62b6042a@collabora.com>
Date: Tue, 31 Jan 2023 09:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/2] drm/panel: boe-tv101wum-nl6: Fine tune the panel
 power sequence
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, thierry.reding@gmail.com, sam@ravnborg.org
References: <1675130359-24459-1-git-send-email-xinlei.lee@mediatek.com>
 <1675130359-24459-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1675130359-24459-3-git-send-email-xinlei.lee@mediatek.com>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 31/01/23 02:59, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> For "boe,tv105wum-nw0" this special panel, it is stipulated in
> the panel spec that MIPI needs to keep the LP11 state before
> the lcm_reset pin is pulled high.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


