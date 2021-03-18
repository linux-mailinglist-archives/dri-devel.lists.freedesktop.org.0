Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C73340CBA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 19:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3316E90C;
	Thu, 18 Mar 2021 18:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CF76E90C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 18:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=uy/e6z9+oJp6vKoPGBExi+Rrh2Bm3IFId6EhyarhNcU=; b=WPv6p3JfvQc55Ue08vc8arTJGC
 9vFa8DEA/PVKHwRrjMEKuqv1IO0H+1OLCWkbDnZ/tCAYvnxlQzT5QyOWiwkZz5VvXVZyhGEGfY8uQ
 G9uNC66nRG8TwswKbMaboIcvFvb+miVS9HlZ1pPpxuYKY4I+/LOkJyncbZfEG0/FVNti1jlpDsqJI
 Kaiwizog0c/339kfPUW5jeia5GFoEkpFRoX9+hmKCkwpvx/mavnLNV8JmAnb+2t2VH3nRTPhYmmrY
 4Lgx8nMPRt/fv1NVtgAS/JVowTpKCplyHZW/100uQ6qgBjwzYT56OssyWpDvxJOOV4x38ognQTbLF
 GLnPc0xw==;
Received: from [2601:1c0:6280:3f0::9757]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMxCM-003L3E-WF; Thu, 18 Mar 2021 18:16:53 +0000
Subject: Re: [PATCH] drm/meson: Fix few typo
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, narmstrong@baylibre.com,
 airlied@linux.ie, daniel@ffwll.ch, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210318110046.14830-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a7c40d1a-053c-9e49-cb04-684c47abffa2@infradead.org>
Date: Thu, 18 Mar 2021 11:16:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318110046.14830-1-unixbhaskar@gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/18/21 4:00 AM, Bhaskar Chowdhury wrote:
> 
> s/initialy/initially/
> s/desined/designed/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/gpu/drm/meson/meson_venc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 5e2236ec189f..3c55ed003359 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -45,7 +45,7 @@
>   * The ENCI is designed for PAl or NTSC encoding and can go through the VDAC
>   * directly for CVBS encoding or through the ENCI_DVI encoder for HDMI.
>   * The ENCP is designed for Progressive encoding but can also generate
> - * 1080i interlaced pixels, and was initialy desined to encode pixels for
> + * 1080i interlaced pixels, and was initially designed to encode pixels for
>   * VDAC to output RGB ou YUV analog outputs.
>   * It's output is only used through the ENCP_DVI encoder for HDMI.
>   * The ENCL LVDS encoder is not implemented.
> --


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
