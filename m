Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A090663CA6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C9810E56F;
	Tue, 10 Jan 2023 09:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73C910E56F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:20:28 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C51C66602D6F;
 Tue, 10 Jan 2023 09:20:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673342427;
 bh=g8LJ5B4rMDQV97cEiwnSy/f5QYjiF15lfCvnnH5n72k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MIjZ3lECCLCdFrjMcSHZqxDoDQhX+9fOc+uBgiIaeRF4QS4av3YE5Ulo2EP8kbeg7
 dwg4uQpknuzd1yNOWl9cHdRqjHuYx93ZhI20G8xOh1DH+wa0wcyTluVjkPNU9OUfqg
 1UdQKLDThtscSBOUrifp0bBug9gZpkxstJywG5V3MbxIneyaYCX8Wht7bW1Rpg+Gbu
 V4mHYQPVATOD60tn2zIW20C1/pl6vUFNz4jzLVJ+oCn0IzsY3lT3cLUaKJddc9vshX
 V8TXLUkKtfU3nHRUDT3Ivb0b6V5iLdljH2nM0YhacL0tijeiG/hEE3j7wOKRPSv3Gs
 MAzaJXyOuQsqw==
Message-ID: <3b6c19a9-66ac-a18c-cb3b-144066077bd1@collabora.com>
Date: Tue, 10 Jan 2023 10:20:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/3] drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to
 send initial code time
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, thierry.reding@gmail.com, sam@ravnborg.org
References: <1673330093-6771-1-git-send-email-xinlei.lee@mediatek.com>
 <1673330093-6771-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1673330093-6771-3-git-send-email-xinlei.lee@mediatek.com>
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

Il 10/01/23 06:54, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Since the panel spec stipulates that the time from lcm_reset to DSI to
> send the initial code should be greater than 6ms and less than 40ms,
> so reduce the delay before sending the initial code and avoid panel
> exceptions.

Please change the commit title to describe what you're doing.

drm/panel: boe-tv101wum-nl6: Remove extra delay in init commands


....and the commit description should also contain something like

Reduce the delay after LCM reset by removing an extra delay in the
initialization commands array. The required delay of at least 6ms after
reset is guaranteed by boe_panel_prepare().

Regards,
Angelo

