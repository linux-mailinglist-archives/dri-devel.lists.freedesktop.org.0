Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D2B9D8AB3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 17:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7058A10E6C1;
	Mon, 25 Nov 2024 16:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pKlPL3UH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4D010E6C1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 16:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732553735;
 bh=//wcGNDgkKJhEcsL6/bLzbAQhVjBzr+yn+0R5uStrWc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pKlPL3UHpB8l7XWkaiSMuQ9IqOqvEXqQp6eObj5qA7ldtinYx1s8aAGLeTTqPcGyc
 GG5Xs3EEJ6CHd0hLSSA3JGTV4HzPmNDL1qRcLPYqFWJrF45veVJ/jL+ARVzveFzVN9
 fTKK/3FTVBEvDkrok8mFH3kee+POj1DXyPS50j9gRDYuJNHZPKV/47QbT0+vA96D4C
 UztlYHYlvAeZUshwzPIhSI3QFaK/gVyf6lJ2dV2f4bcs9PvV0C49ZSi9QP1NjVaZr+
 LIni6+VQyjLawEW18eVjAUZcQpllZGCMXmLXOgbFs7XLrxzBB4iXjIJ0/1TfQczCpd
 g8aYD2EzEJfWw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BDDF17E376B;
 Mon, 25 Nov 2024 17:55:35 +0100 (CET)
Message-ID: <33acccd3-e543-493e-a61c-282d894ef2b1@collabora.com>
Date: Mon, 25 Nov 2024 17:55:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] drm/mediatek: Add support for MT8195 Digital
 Parallel Interface
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
 <20241120124420.133914-7-angelogioacchino.delregno@collabora.com>
 <1b966a136f02b5586749a9c3d0bcec6c75224e49.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1b966a136f02b5586749a9c3d0bcec6c75224e49.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Il 22/11/24 08:23, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Wed, 2024-11-20 at 13:44 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Add support for the DPI block found in the MT8195 and MT8188 SoCs.
>> Inside of the SoC, this block is directly connected to the HDMI IP.
> 
> In MT8173, DPI0 is directly connected to HDMI.
> The first version of this driver is just for MT8173 DPI0.
> Does MT8173 DPI0 need this modification?
> Or this modification is just for MT8188 and MT8195, then the description should be more than 'directly connected'.
> 

This is only for MT8188 and MT8195, and MT8173 does *not* need any modification.

Please, what would you like to see in the description of this commit?

Cheers,
Angelo

> Regards,
> CK
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---


