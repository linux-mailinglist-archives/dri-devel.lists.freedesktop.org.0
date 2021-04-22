Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F13684A1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 18:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4496E3F5;
	Thu, 22 Apr 2021 16:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC3E6E3F5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 16:16:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3209082B11;
 Thu, 22 Apr 2021 18:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1619108194;
 bh=7ahP0wfJl7a6tjL58phrBFy+ms6ZDLS8ik7E40g21eE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rY5eA85yGT1XaJVNr+uB89ZiPxCXuLeKgR7qytzwkoyrGChe819SA2j7lWkm/Iofi
 MmU/NMnknOS32PeU5lHozgQpdM4E1jNLdmwlX75CsUB5tUj6YQ9IOmE/ai8To1TcYF
 blFJOwIjFBx+5gIYqKVIVcqN+glYXBI/JIRevaXQ9L3pzt9do6o0zqBucwoPfHGoay
 JkWOWr8F3EKZn8dVWoYu5THJ6yU9OO4M5j1LvihC4xhC+pw8zjdlu2dvaKEPLOfiNC
 o7BarV1sE8o++iH/8D+iZStnQbF72eJpUosTvThllyEKNn7FoeZQjstKcVyOvn+koD
 nebQZUK8NJ0Bw==
Subject: Re: [PATCH V2 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 and SN65DSI84 bindings
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
References: <20210421223122.112736-1-marex@denx.de>
 <9ffbea6e-c341-4a43-3c9e-0b177cfe98d5@baylibre.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <23d965f2-991c-8330-ba6e-7a42723f51c3@denx.de>
Date: Thu, 22 Apr 2021 18:16:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <9ffbea6e-c341-4a43-3c9e-0b177cfe98d5@baylibre.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
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
Cc: devicetree@vger.kernel.org, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/22/21 10:38 AM, Neil Armstrong wrote:
[...]
>> +      port@1:
>> +        type: object
>> +        additionalProperties: false
>> +
>> +        description:
>> +          Video port for LVDS output (panel or bridge).
>> +
>> +        properties:
>> +          reg:
>> +            const: 1
>> +
>> +          endpoint:
>> +            type: object
>> +            additionalProperties: false
>> +            properties:
>> +              remote-endpoint: true
> 
> Similar to Jagan's serie, would be great to add bindings for the dual-link LVDS even if not supported
> by the driver (the driver can fails with a verbose error).

I don't want to add any sort of bindings which I cannot validate against 
real hardware. I would argue that adding the 2x single / dual link LVDS 
DT property could be added when someone has a need for it and can test 
it on real hardware, and such a binding should be simple develop and 
add. And that is better, because we won't end up with some possibly 
misdesigned untested DT binding which would become part of the ABI and 
would have to be supported forever.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
