Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8F44EA8DD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 09:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B418810E782;
	Tue, 29 Mar 2022 07:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9760010E782
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 07:59:02 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E050483F89;
 Tue, 29 Mar 2022 09:58:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648540740;
 bh=Dl5aW+p6ujDDIBhmIjAGVk0SesW4NTiEgTEsRGSkdrM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=o8d2sV8U293oZDzf0/t7BqeScYboCJ375tOnFTPmCsOt/PITe8mXcCe3NLGgoVlZ/
 rwdjRpNb0Lu7sSCBojCCSi8O3YwxcMscOu1kEuaREMz0pFASBKfbefnG2VnUGzagGA
 pr7ajQ7Pe/1sFTeKDwHSzd6IHkFsqS6CQiDEgJ/6oRvedpxnb9PzeZQZs3TD40c6Yt
 YXe9mTKjKh9aQRZUXT8vx0Y9Od0x9HGOPhc+folKXyybfVqoRBnrGJ7qFT4ZqWZivO
 BqCK2Gx4U5RaYgTrTjYceDj0wZTPcAjRnK4g4kWgWx6etXtP2AGvMS74QE5iboBWN5
 AwKILjBCKN+cw==
Message-ID: <3cafab3a-de04-bfb2-acba-bc5dff96932d@denx.de>
Date: Tue, 29 Mar 2022 09:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 00/11] drm/bridge: tc358767: Add DSI-to-DPI mode support
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220328214324.252472-1-marex@denx.de>
 <b2fd62b4d3fa0eeb49d1f374cb2ae2687e6626b6.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b2fd62b4d3fa0eeb49d1f374cb2ae2687e6626b6.camel@pengutronix.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/29/22 09:47, Lucas Stach wrote:
> Hi Marek,

Hi,

> Am Montag, dem 28.03.2022 um 23:43 +0200 schrieb Marek Vasut:
>> The TC358767/TC358867/TC9595 are all capable of operating in multiple
>> modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Clean up the driver,
>> switch to atomic ops, and add support for the DSI-to-DPI mode in
>> addition to already supported DPI-to-(e)DP mode.
>>
> Not sure if anyone else has any more comments. For what it is worth, I
> just skimmed through the series again and it looks good to me now.

The robot does, but that should be easy to fix.
