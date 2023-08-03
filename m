Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B875776EC76
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 16:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF3C10E1A5;
	Thu,  3 Aug 2023 14:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D251710E1A5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 14:25:40 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 23F4D84698;
 Thu,  3 Aug 2023 16:25:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1691072738;
 bh=dzsMtwHFfR21i5ns4QmpIdyGZAnmLgbPoVQIuyj4pKU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xMJMbXLR3cicJswcqiMBKXfBRU0+cc3ZmFQEu+j/P5d85/BSDNG1dor94DjgOwyvq
 90cs9ZHGulkfgTll2D6t0t6lyXuwQVetVDmlNT62KelaOx96uo7aaPyMcCT7msnIhP
 PEtvLSmIhxPJAfbIM6c7JDOpfvTdBWJ+MBvw2RmSTNdnGuyqjRM1WTuWIEyIpMfURf
 /z+MTnDnnLHb96UA23bdDK+CRZAFcwKQqF+utB6H7Ny0TOP8Q1oNNxKAIbWnfZwGTu
 WAmetm3KX1zSIdxfOJ5sNWEdZY/XA0lFN0LA9Il8WxMiBJ8E0FHBV6RF2otZufVjh+
 GI+WQJxYf9CSw==
Message-ID: <9b236561-36af-da7a-2caf-892be68e2b76@denx.de>
Date: Thu, 3 Aug 2023 16:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 2/2] drm/panel-simple: Add Innolux G156HCE-L01 panel entry
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20230731210258.256152-1-marex@denx.de>
 <20230731210258.256152-2-marex@denx.de> <20230803162314.122fab64@booty>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230803162314.122fab64@booty>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/3/23 16:23, Luca Ceresoli wrote:
> Hi Marek,

Hi,

> On Mon, 31 Jul 2023 23:02:58 +0200
> Marek Vasut <marex@denx.de> wrote:
> 
>> Add support for Innolux G156HCE-L01 15.6" 1920x1080 24bpp
>> dual-link LVDS TFT panel. Documentation is available at [1].
> 
> Interesting, I'm bringing up this exact panel right now and found your
> patch.
> 
>> The middle frequency is tuned slightly upward from 70.93 MHz
>> to 72 MHz, otherwise the panel shows slight flicker.
> 
> Using 70.93 MHz here does not show any flickering. I even tried going
> in the opposite direction and set 70 MHz, and to use different
> backlight settings, all without any flickering.
> 
> Do you think you might be using a defective device? Would you have a
> chance of testing another sample?

I have literally one such display.

Which SoC do you use (and if applicable, which bridge) ?
