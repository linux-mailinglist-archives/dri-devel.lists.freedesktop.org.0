Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDE4615069
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 18:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A22410E407;
	Tue,  1 Nov 2022 17:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9591810E407
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 17:18:51 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7E1EC806D8;
 Tue,  1 Nov 2022 18:18:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667323130;
 bh=tVFyrrfPDGROcVwH7NHbzPvhkLMftrTR9ezNAqribh0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rpF1laJDC+2lYjyq72rZb7Mf4p1gvaNAmIcHTZco5+O0gFzylk1FOww/TvmHld2bB
 LuLfXgZY4W3ygcUn9Mrek7kbjYi2XhJVF8LFRGX/yh+5GIW8KPk4VG6+5M8NpwXggM
 tyNOYwZ77gnTAMh0HoqN/QQ0tx8U/awtJJbctakFYAUKWOx+KybGOaYjMZBNTAb0cY
 uKxOJoqV9qkM/6SCGdh6m9S+TyaZ6EaobKKTKAZ5TRU1nB+p1iXLPyoiDrcSU3ng3z
 2HM6vY6w0jjZTDeSStrqbMlnrtLrJ5oNQFwaKRmeRFxrv46X24dU67ISAqkFlJkXS+
 Bzs7v/0o8IT/Q==
Message-ID: <9e7b7793-e9c7-6d9b-e1f9-90c1899ee68a@denx.de>
Date: Tue, 1 Nov 2022 18:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] drm: lcdif: change burst size to 256B
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>, stefan@agner.ch,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org
References: <20221101164615.778299-1-m.felsch@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221101164615.778299-1-m.felsch@pengutronix.de>
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
Cc: kernel@pengutronix.de, linux-imx@nxp.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/1/22 17:46, Marco Felsch wrote:
> If a axi bus master with a higher priority do a lot of memory access
> FIFO underruns can be inspected. Increase the burst size to 256B to
> avoid such underruns and to improve the memory access efficiency.
> 
> Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog:
> 
> v2:
> - added fixes tag

Re-adding from V1 my:

Reviewed-by: Marek Vasut <marex@denx.de>
