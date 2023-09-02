Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7432B790843
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 16:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6DE10E080;
	Sat,  2 Sep 2023 14:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE2810E080
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Sep 2023 14:25:28 +0000 (UTC)
Received: from [192.168.2.205] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D1616607258;
 Sat,  2 Sep 2023 15:25:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693664727;
 bh=d9qvLqBiirDB27VGJkGrPrUfebqxRHHMAwN8YJEHwf8=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=dZIEOp3GjWvoUUqH3TOKsIO65P6n+BvxoxKwfgoap1wtSpzDNC9Bdkm6bNUy2zzXT
 7/U8o9iWbd8N9fw6NSr1LDLVkM964ft+kUfGFAdgAFYZiCd7ItoYEqulfW14mBV0sO
 cmKGl8xhV/Tlir/XZFY5QLA86vGeQs00jpFPMZDqWCE5/Kn8P92GPOnwtGVVkORXou
 Ov8JWtVtUJoT7qjpUEoaWmIBTw2TzdhNcSZpKkCKzTr17IncnURfgyfnAXS4hm9v5Y
 j1KIZ6PNwdE4GAyIGnzV9qViMQpisLr0wK4u0lWF7icYuuIHT9UkwGmzrzeF4TqDbk
 +JSSLQjGXnB1Q==
Message-ID: <0798124d-6d9c-3776-426a-a5bfb1519248@collabora.com>
Date: Sat, 2 Sep 2023 17:25:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] MAINTAINERS: Add Boris Brezillon as Panfrost driver
 maintainer
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
References: <20230822052555.538110-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20230822052555.538110-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/22/23 08:25, Dmitry Osipenko wrote:
> Add Boris Brezillon as Panfrost driver maintainer. Boris is a new lead
> developer of the Panfrost Mesa driver and main developer behind the
> upcoming Panthor kernel driver that will serve next-gen Mali GPUs.
> 
> Remove Tomeu and Alyssa, who left Collabora and stepped down from working
> on Panfrost.
> 
> Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
> 
> Changelog:
> 
> v2: - Added acks from Boris, Alyssa and Tomeu. Tomeu answered with ack
>       to the v1 email, though he answered to me only and not "to all",
>       so it's not visible on the ML.
> 
>     - Made Boris' entry first as was requested by Rob Herring.
> 
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd882b87a3c6..b2fc771e1f2d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1614,10 +1614,9 @@ F:	drivers/gpu/drm/arm/display/include/
>  F:	drivers/gpu/drm/arm/display/komeda/
>  
>  ARM MALI PANFROST DRM DRIVER
> +M:	Boris Brezillon <boris.brezillon@collabora.com>
>  M:	Rob Herring <robh@kernel.org>
> -M:	Tomeu Vizoso <tomeu.vizoso@collabora.com>
>  R:	Steven Price <steven.price@arm.com>
> -R:	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git git://anongit.freedesktop.org/drm/drm-misc

Applied to misc-next

-- 
Best regards,
Dmitry

