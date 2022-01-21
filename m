Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59AB495F71
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 14:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EEE10EA74;
	Fri, 21 Jan 2022 13:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B7810EA9F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:08:11 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9E90080FAE;
 Fri, 21 Jan 2022 14:08:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642770490;
 bh=S8eg1SDCJDLP/0csEVAuqh8tcZXqbXOm4ziHGou2DsI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Co2RT8HXPaSaJ02b1M4GYt28SdynIijdGUwH98Kd3oWehF6EUc1yZs+H6nWupWQkw
 ZiogeYFr0uVfP2NOmjsni1JNERITliOx7c4bVufug5gzWLRR3xAhAKx+wkf/Dg7xsa
 rEn36hOx7EJ0tZp0N6lEmboo+3P9gj8WjlY7OQCQsyR54AFhF2g9d1UsdpGfw0Bsjf
 hXu0fhm/vM3AgM2Q/Ls9wyylmH+9SM0XI3sBUFx6cxk3CsIWHOPCK5E5MUkXisNM4u
 u0fR3JqUbAwZ9TsiXZm/16tDAJXOissy62HSojC87lpZ2xx+GNa+/7GPrAulNlp2qT
 3Y+CMwnzkbhMg==
Message-ID: <29ee478e-b754-dfbc-f2c6-f522ed597fd5@denx.de>
Date: Fri, 21 Jan 2022 14:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] drm: mxsfb: Use dev_err_probe() helper
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
References: <20220121095644.329256-1-alexander.stein@ew.tq-group.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220121095644.329256-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/21/22 10:56, Alexander Stein wrote:
> Use the dev_err_probe() helper, instead of open-coding the same
> operation. This also adds a nice hint in
> /sys/kernel/debug/devices_deferred.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks
