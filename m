Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C3275D5C2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 22:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987EB10E6FD;
	Fri, 21 Jul 2023 20:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9714310E6F4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 20:30:48 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5B92386272;
 Fri, 21 Jul 2023 22:30:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1689971446;
 bh=xTrGVD7+bkOviFXiYwHLUWWPwC/O6Nq0Qwk/zZiNaNo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=sTdpc+XFMm1cp6NKXTptJ8XeTYvwcZ5h4yq41sVJ1F51sOipQH0On67LX4RuRd/VQ
 r9EKDpqH+5JfuCCbJ4z3ybigXqJJeIxRB6WyFzztzcRs+adgFknIo/IXgZjztUdNyo
 DmaitR4veBNedIL3AhrZFzJvINx37cCYumYnDhNIknieyCZ/RcTus+TLoB5vQ+azJn
 z3ansqpmk/7MAWhsZYcob5UtqHDSCGaanzEl2RfLUOljqRKsQFzMuGU55VGvE2YAAG
 IKa7oPhX7+F6TVr/WM+p0UIuKQo7Lkb7aJ7db0dPReBmkuf0ZwRzGEczCS0l7le9vZ
 wWLXSp/M7ZsfQ==
Message-ID: <4ae73bf7-c2f0-0082-8aae-c57440653416@denx.de>
Date: Fri, 21 Jul 2023 21:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: give VSDELAY some positive
 value
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20230721165328.3968759-1-l.stach@pengutronix.de>
 <20230721165328.3968759-2-l.stach@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230721165328.3968759-2-l.stach@pengutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/21/23 18:53, Lucas Stach wrote:
> From: David Jander <david@protonic.nl>
> 
> The documentation is not clear about how this delay works.
> Empirical tests have shown that with a VSDELAY of 0, the first
> scanline is not properly formatted in the output stream when
> DSI->DP mode is used. The calculation spreadsheets from Toshiba
> seem to always make this value equal to the HFP + 10 for DSI->DP
> use-case. For DSI->DPI this value should be > 2 and for DPI->DP
> it seems to always be 0x64.
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Marek Vasut <marex@denx.de> # TC9595
> Reviewed-by: Marek Vasut <marex@denx.de>

Applied both to drm-misc-next , thanks !
