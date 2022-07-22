Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9651457D7FC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 03:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659AC8DE68;
	Fri, 22 Jul 2022 01:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4758B2AB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 01:23:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5A6F681877;
 Fri, 22 Jul 2022 03:23:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658452991;
 bh=n+TuF69VM7FqxvvtQUeiEtkg/7O9n2NGtPWyJzarXpY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kkFvrJkZJ1avi7zMrT1u61/xUZn1bowoXNDgYZSnhHd/UFv8uw6jJempoBLl8tYK4
 MroQB+shDmEGSCYdNBJxn9L930PSs+Jcmfn1sdGBxPVi61MplckulYBwcuZuQpmcjY
 RTuoQQgH5nbbaEH3Nf58TIbhH1m02e7TKveFSYaFbDCWEynhhkdHOp2JTiBmKhxY3s
 47BOyhRxP2+wZSCoz6fk5x1cnoeBgrK/YwlS0GUDffL6Ympg2hCN2mc6T++tImSVZF
 GzJ4pwOZtM2WguqpLyQ8uByK2qKw/hFiAdb3Ik45El2iikl+5FyTeu8uS3REzZ8mLx
 S4ZWmu1bAsQ4A==
Message-ID: <f46c37c2-2d05-523c-d9c7-bf0d751a7a7b@denx.de>
Date: Fri, 22 Jul 2022 03:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] drm/bridge: tc358767: increase CLRSIPO count
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220706132812.2171250-1-l.stach@pengutronix.de>
 <20220706132812.2171250-2-l.stach@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220706132812.2171250-2-l.stach@pengutronix.de>
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
> The current CLRSIPO count is marginal and does not work with high
> DSI clock rates. Increase it a bit to allow the DSI link to work at
> up to 1Gbps lane speed.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Marek Vasut <marex@denx.de>
Tested-by: Marek Vasut <marex@denx.de>
