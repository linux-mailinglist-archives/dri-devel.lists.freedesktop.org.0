Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2503B72BBAA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 11:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2D310E1D2;
	Mon, 12 Jun 2023 09:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C39410E1D2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 09:06:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F154880F53;
 Mon, 12 Jun 2023 11:06:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686560764;
 bh=H3onNSyMZ4Is7DqAGpEKNDETzpomuzHRht8ciZTDDh0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vAx41pir9NPvHn0LPtEyAhr2dE+vTgiT5V6pqK02jd2cw+WIPGqpQuOqkc/jy3Uxd
 GWyxQCafh7Ynlmih0DqOSnEiMwpcJmyvLzcgNncLnZsOoJJbVvgeNXIsdd3Fuliuav
 RAGR4RXi26dZEMrP7DSlma2yYzQwvz6z3BAI3he/y3elUby5k6MWiSfHHi65nm+UYq
 ft7Dlozq47eGaECvmOuRiyc9Jmtvx5twdZ/GUMjau+ljE9tragWTZVUktyfEpWZ750
 n1qfQQmlvCNjMAv8eobpzE2qzsyBpdVVJok1jrVNWVCIcYIvyWIpDWfwrAAzs2dTOB
 0dmZsTTc9Luig==
Message-ID: <c11788bb-9974-3fb9-7cac-db7d55cfde9e@denx.de>
Date: Mon, 12 Jun 2023 11:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/mxsfb: Disable overlay plane in
 mxsfb_plane_overlay_atomic_disable()
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20230612075530.681869-1-victor.liu@nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230612075530.681869-1-victor.liu@nxp.com>
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
 kernel@pengutronix.de, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/12/23 09:55, Liu Ying wrote:
> When disabling overlay plane in mxsfb_plane_overlay_atomic_update(),
> overlay plane's framebuffer pointer is NULL.  So, dereferencing it would
> cause a kernel Oops(NULL pointer dereferencing).  Fix the issue by
> disabling overlay plane in mxsfb_plane_overlay_atomic_disable() instead.
> 
> Fixes: cb285a5348e7 ("drm: mxsfb: Replace mxsfb_get_fb_paddr() with drm_fb_cma_get_gem_addr()")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Should this be Cc: stable too ?
