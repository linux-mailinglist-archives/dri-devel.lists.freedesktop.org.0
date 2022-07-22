Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B166357D7FB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 03:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A5A8BDCB;
	Fri, 22 Jul 2022 01:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1E48B449
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 01:23:14 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8647682105;
 Fri, 22 Jul 2022 03:23:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658452993;
 bh=ymIEf274lGLimo1Aw0JXTG51e4EeMGHKmbhXdvltdaE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QZW3iI69JcFE9lTff1noqYgindDol4REgMgBkn6gohkrvU6DSaWdwCFz1yXjZxNVu
 QEdQaqBF/0ARev0hTvC7zwNGEU/P2ziMK1UJjG0PDqUTkkgJXNv9/iibuRssQE2545
 OjrIorHr/+TjDw/UQmeDrnSu55syJSlrixleR4Lc0LCpMu98R3rGD2HwQboMJ+bcnz
 crDDzLqb8s6f9PvS9ocAz0vPgHsf7eiOi4bDREGNN+DYdnf1oGgIXJ8r6Mraa2Bq6h
 2BYPRjj3XAMy9c9G399Ydkrn4JyIKWmjFXswhD6OxnM0DInxUOHAJF+e4d7rHyLsK/
 7jP/WjXhkQ5Yg==
Message-ID: <443d682e-1767-a22d-4abc-84a6a17ef833@denx.de>
Date: Fri, 22 Jul 2022 03:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] drm/bridge: tc358767: disable main link PHYs on main
 link disable
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220706132812.2171250-1-l.stach@pengutronix.de>
 <20220706132812.2171250-3-l.stach@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220706132812.2171250-3-l.stach@pengutronix.de>
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
> Disable the main link PHYs and put them into reset when the main link
> is disabled. When the PHYs stay enabled while the rest of the DP link
> circuits are disabled there is some noise on the data lanes, which some
> displays try to lock onto, waking them up from their low power state.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Marek Vasut <marex@denx.de>
Tested-by: Marek Vasut <marex@denx.de>
