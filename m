Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77D757D7FA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 03:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417EE8B449;
	Fri, 22 Jul 2022 01:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCA48B2AB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 01:23:12 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AB90880029;
 Fri, 22 Jul 2022 03:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658452990;
 bh=EEDccMeFugdBfoJiamzQIfK4wWHBogxwYb01Q2xUruk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MMMM9dFNrMH1xtXS0e8XqB27T90wrTnN3Ez20StHSzT5VDn2wobmm8aUSAhe7WuHR
 /zRZFczjQgOZDswLXVVA5QBLG23ygYEo/cO6vSW3SNTDvdppk0DEcjpxB3ycmjb2WC
 AymahLFq0R34BQOwPZxu/6WQpNwDK0TICUFXVreNzkOyJaX5h99BHQcTCScihEmrJm
 zPrGryEJJZ0GGw3/oMxy+UztmhtnUuQSHC6WUMBU0/ngWyiB32ufV24+ttRASKwqun
 4U8dwx2dEjMa/NYBrKbek1Y1c9GapEvZVe46mMkQSepGoO5PJBGsa0Oo5keGITVQsU
 W3tO/PfR3ftUQ==
Message-ID: <e2f94a21-cf7a-6b29-2237-b58b8c45afa8@denx.de>
Date: Fri, 22 Jul 2022 03:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] drm/bridge: tc358767: don't fixup mode sync polarity
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220706132812.2171250-1-l.stach@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220706132812.2171250-1-l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/6/22 15:28, Lucas Stach wrote:
> There is no need to enforce a specific sync signal polarity on the
> DPI interface, as we can simply tell the TC358767 which polarities
> it should expect on the input interface.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Marek Vasut <marex@denx.de>
Tested-by: Marek Vasut <marex@denx.de>
