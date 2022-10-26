Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065D860EAAB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 23:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D4510E315;
	Wed, 26 Oct 2022 21:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DB010E315
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 21:06:08 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1E24280375;
 Wed, 26 Oct 2022 23:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666818366;
 bh=tlGLkNN0WByzhGBm0a8Sw3faCn3HcnFQUyx9lMm+p1w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cHlHEfUUa3+6pjnwJqU0NyWB56P3qwPenlwo/+8HIo+pjy6epnawWZBzl3ipSFISy
 8x6+QfB+Y1RLZTA2rXyBJ/2o5LB7Q693d2e1uyqRKCnhwOW9OTPADQmw77n6+fOF2f
 KOwDZyoZZx68f03hYyWbHjA4y2ZQmToKfRECgrVNeXM3j8ne81Wma429br51nwXuwf
 CJaB0pGPsJI/Pz/4BVq+heDU7oUW23ytrY7pd47ftLU0Q/3WWQ8WfYnY2HbVYe/adj
 AhaC9RIvMWNIqq8IqHPG7c2RQZXwm3AEP3liYRG/CoSULcCsdjG+HmqRcCwQXohnXo
 kin/pfnW9nNaw==
Message-ID: <a2e1a3b8-7fb0-5d53-f590-429453f9c569@denx.de>
Date: Wed, 26 Oct 2022 23:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm: lcdif: change burst size to 256B
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>, stefan@agner.ch,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org
References: <20220726094302.2859456-1-m.felsch@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220726094302.2859456-1-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/26/22 11:43, Marco Felsch wrote:
> FIFO underruns are seen if a AXI bus master with a higher priority do a
> lot of memory access. Increase the burst size to 256B to avoid such
> underruns and to improve the memory access efficiency.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Uh, this fell through the cracks, sorry.

Can you please collect my RB, add:

Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")

and send V2 ?

btw. the Panic mode seems to work on this IP with 4k displays and HDMI.
