Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1B570B611
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 09:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E249410E251;
	Mon, 22 May 2023 07:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0644810E1CC
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1684672002; bh=KtMGBmMO0x04rPjr03IiYFmnN0Ei1SnWJQQGsBfVTEQ=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=sGuzil0NVXvYwSqFq4oBkoTtK9HFbNSrVXIBm8HUpP2C0X2TnMcTjWB7F8VXkUiPN
 bHuW7dNZsGYXjanhcyG77tDCsRQNqo1SmYU0DyS+U6lyv3qTxF+0wrGz5rYfnFpucE
 dYm21YdXF4o9EaqggWUK+nH78PbPI4ai53wjzSGo=
Received: from [100.100.57.122] (unknown [58.34.185.106])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4BCAF6006F
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 20:26:42 +0800 (CST)
Message-ID: <5e1cace3-6216-df2e-0883-5caecd781a85@xen0n.name>
Date: Sun, 21 May 2023 20:26:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v14 2/2] MAINTAINERS: add maintainers for DRM LOONGSON
 driver
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20230520105718.325819-1-15330273260@189.cn>
 <20230520105718.325819-3-15330273260@189.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230520105718.325819-3-15330273260@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 22 May 2023 07:13:28 +0000
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



On 2023/5/20 18:57, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> This patch add Sui Jingfeng as maintainer to drm/loongson driver, also
> invite Thomas Zimmermann as co-maintainer.

Hmm, it could be more polite to perhaps wait a bit longer? If I didn't 
see it wrong you posted v14 after no more than 2 days since v13.

> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>   MAINTAINERS | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 70d4385fd5ef..1ec3179c01ed 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6938,6 +6938,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	drivers/gpu/drm/lima/
>   F:	include/uapi/drm/lima_drm.h
>   
> +DRM DRIVERS FOR LOONGSON
> +M:	Sui Jingfeng <suijingfeng@loongson.cn>
> +M:	Thomas Zimmermann <tzimmermann@suse.de>
> +L:	dri-devel@lists.freedesktop.org

Maybe add loongarch@lists.linux.dev for notifying the LoongArch folks 
too? AFAIK this list is most effective at grabbing the attention of devs 
interested in Loongson and/or LoongArch.

> +S:	Supported
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	drivers/gpu/drm/loongson/
> +
>   DRM DRIVERS FOR MEDIATEK
>   M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
>   M:	Philipp Zabel <p.zabel@pengutronix.de>

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
