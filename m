Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1776F62E048
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 16:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5736210E63C;
	Thu, 17 Nov 2022 15:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A09E10E63C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 15:49:41 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD412929;
 Thu, 17 Nov 2022 16:49:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668700179;
 bh=dCq7BZPM04IF4OeB3g2d9it3HFFw4GKBrkhYKw2JoRo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IB5dcSr96oKd9sKI0F7g5DLossoqeaf9tf9nTzk42f/d5Eb+BTxPEwRI99NIjQCtZ
 U5SdPo1Z2NG3RYLGpF9KcwnvNf9RYaWt4K5x7qTXmEj2kN1ge4QtUrO/gqes5oQG6r
 0x5PKybo+JmpOk1c9P8gqBYWSqFcUl8hM/M+NtRY=
Message-ID: <8d848493-24a8-4ffb-239e-9e7baa232a42@ideasonboard.com>
Date: Thu, 17 Nov 2022 17:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 7/8] drm: rcar-du: dsi: Add r8A779g0 support
Content-Language: en-US
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-8-tomi.valkeinen@ideasonboard.com>
 <166869996543.50677.17182739414507530884@Monstersaurus>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <166869996543.50677.17182739414507530884@Monstersaurus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/11/2022 17:46, Kieran Bingham wrote:
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (setup_info->hsfreq <= MHZ(1000))
>> +               ret = WRITE_PHTW(0x01020100, 0x01910170, 0x01020171,
>> +                                0x01110172);
> The <=1Gbps reads:
> 
> <=1Gbps
> 
> Set PHTW=H’01020100
> Set PHTW=H’01010172
> Set PHTW=H’01570170
> Set PHTW=H’01060171
> Set PHTW=H’01110172
> 
> Is it clear why theres a difference here?

What doc is that? Mine (R19UH0172EJ0054 Rev.0.54) says:

Set PHTW=H’01020100
Set PHTW=H’01910170
Set PHTW=H’01020171
Set PHTW=H’01110172

  Tomi

