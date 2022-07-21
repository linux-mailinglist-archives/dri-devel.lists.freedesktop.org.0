Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFB157CA96
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 14:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9241890733;
	Thu, 21 Jul 2022 12:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F1090742
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 12:25:00 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 19C178410E;
 Thu, 21 Jul 2022 14:24:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658406298;
 bh=kVU3LCCaFqk6ZRlu2YlBGkJm43796tQBABKUWsWvgyA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lJkhS2z7Eay4/EyRmaOHPrcAmsRzW+H24EaW0OW7JTXB5xPoHL0TGkOuNd1HkQ3iE
 GKymbc3rQpwjYXgxpX7KAmxt7OPO8cX577qQo/ejqrfn6NVSKqLGfgxyXJb+gydH8m
 jGkNH18g4hh2R05CZd2J9ow3ML7zUuT3n2XVWHirD8PGT1/rumVJFpT2MEL+Z7yhAG
 Af9mEGUWTEW4xI22ijSJNwmhHsO4MtdQuxj7z7PeHhdPCH51xdmMGhS0379ZQi6BfK
 Xf+sI9a6msiHxzrnN/S+dP5Jc0rRaLG8j9+F6fv+jNuaS1R3G7NgKzF7W8XQk8bpa7
 upX0ONPqIgF8g==
Message-ID: <0b4927f7-f1e4-60a8-1eaf-6d4cbc38daec@denx.de>
Date: Thu, 21 Jul 2022 14:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: add Densitron
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220721030327.210950-1-marex@denx.de>
 <YtjnFxA66V6bMePa@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YtjnFxA66V6bMePa@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, robert.foss@linaro.org,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/21/22 07:41, Laurent Pinchart wrote:
> Hi Marek,
> 
> Thank you for the patch.
> 
> On Thu, Jul 21, 2022 at 05:03:27AM +0200, Marek Vasut wrote:
>> Densitron is a manufacturer of LCD panels.
>> https://www.densitron.com
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Guido Günther <agx@sigxcpu.org>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index 88859dd4040ee..6277240536b44 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -312,6 +312,8 @@ patternProperties:
>>       description: Dell Inc.
>>     "^delta,.*":
>>       description: Delta Electronics, Inc.
>> +  "^densitron,.*":
> 
> How about "dsn", to follow the practice of using stock names as vendor
> prefixes ?

Is there any benefit to that ? All I can see is that it's making DTS 
less clear and more difficult to read. It is easy to map "densitron" to 
"densitron" when it is spelled out like so in the DT, but it sure isn't 
immediately obvious that "dsn" means "densitron" without extra look up. 
And even that extra look up of "dsn" does not return densitron, but some 
woodworking company and other totally unrelated results.
