Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8932372BCD3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 11:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37E110E1E8;
	Mon, 12 Jun 2023 09:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B7410E1E8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 09:36:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7F35984682;
 Mon, 12 Jun 2023 11:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686562599;
 bh=AlUcBHOL8pXtm34yWd6JErCfh8dio8BjWUZzaXOwb8Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F473lQhZhpnayMegTy/n654vnFkcLq1C8ao/C9nlzpvqwTNUZkKqh2Wl8p8DZgluu
 wH4aELs0GCbiWImEgmNthizAg34yGqbzkvuuUsLJKlyjyadaxrxe4jL1qAHKbJN21o
 ww5DQZsrdoAjdIRwmT5ZG2m6W+5NKPNeQL8cTJh0pPYVKTG6DMNn/gPs9+FmbjCK1O
 9vBwlayY86Opxie2uGSc5gg1x4yMb4psK7wApigJOZvre/D3L4PR5zB6/7A9bLBjOk
 Sff/MDFPqmH2NzfgzXePthuOXJAIpXofgpWEZZcjpQ/IU9VMl2L8GSUnDXmmqw1hLI
 XBDKqnSshZ4bg==
Message-ID: <111df1a8-2945-3868-6ce3-98dcaa4912df@denx.de>
Date: Mon, 12 Jun 2023 11:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] drm/mxsfb: Disable overlay plane in
 mxsfb_plane_overlay_atomic_disable()
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20230612092359.784115-1-victor.liu@nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230612092359.784115-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: sam@ravnborg.org, s.hauer@pengutronix.de, linux-imx@nxp.com,
 kernel@pengutronix.de, stable@vger.kernel.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/12/23 11:23, Liu Ying wrote:
> When disabling overlay plane in mxsfb_plane_overlay_atomic_update(),
> overlay plane's framebuffer pointer is NULL.  So, dereferencing it would
> cause a kernel Oops(NULL pointer dereferencing).  Fix the issue by
> disabling overlay plane in mxsfb_plane_overlay_atomic_disable() instead.
> 
> Fixes: cb285a5348e7 ("drm: mxsfb: Replace mxsfb_get_fb_paddr() with drm_fb_cma_get_gem_addr()")
> Cc: stable@vger.kernel.org # 5.19+
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Marek Vasut <marex@denx.de>
