Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679C663C1B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE7C10E47F;
	Tue, 10 Jan 2023 09:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5579810E47F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:02:07 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 24EC7660230B;
 Tue, 10 Jan 2023 09:02:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673341325;
 bh=oIJ9/QBPo+xtU86fwp39bkctw5qjqzfW5/QtYhI/UrA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZoHFvuUlrlcCMArQ3GE28bgB1BiUBSZDanmJGf7TWfHY4HaHXUcudf10Rd93by/kd
 wNt3BBx48a8dJafvq5xB6miHFUNTlPoxz/F7ao8C73nHZ9M+E/xDUz0vYPerumNN68
 DtE4SFGZGw2dcjFtslquD0T19onZDeDPPR2I94vtK5wJBq8ZxSOcvetqyzG/xJejpi
 5Y+cqlGuvMJ8jQHvERWSYSTc706+gVaIJTzTtig3ctZa5fwil4+/jo5J6i9ffWpJAZ
 IEuiabxTn9aLxWEfO1HD9AHFy5PIRnK6bBM351pG7ByKNLUHT/bPqgNk+ePACC74NA
 EiNs5iHBL0x0Q==
Message-ID: <fc950d71-29da-dce6-3c81-578362a78f78@collabora.com>
Date: Tue, 10 Jan 2023 10:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH] drm/mediatek: Add support for AR30 and BA30
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <CAHC42ReC+pkKxkHdagfpQ5-hLWGAad5nWtdd4uZTDhuQz_bwMA@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAHC42ReC+pkKxkHdagfpQ5-hLWGAad5nWtdd4uZTDhuQz_bwMA@mail.gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, airlied@linux.ie,
 jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 Chen-Yu Tsai <wenst@chromium.org>, matthias.bgg@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/01/23 19:26, Justin Green ha scritto:
> Add support for AR30 and BA30 pixel formats to the Mediatek DRM driver.
> 
> Tested using "modetest -P" on an MT8195.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Hello Justin,

this commit does not apply against next-20230110 because of your own AFBC support
addition :-)

Can you please rebase and send a v2?

Cheers,
Angelo

