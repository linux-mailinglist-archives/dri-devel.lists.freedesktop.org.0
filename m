Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA1C8770F6
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 13:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFFE10E408;
	Sat,  9 Mar 2024 12:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paroga.com header.i=@paroga.com header.b="fKWSQkd6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paroga.com header.i=@paroga.com header.b="fKWSQkd6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx101.easyname.com (mx101.easyname.com [217.74.15.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7E310E408
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com; 
 s=easyname;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w4ocZVhEdKKPZzJiQi1Os36YGF2u8UmwpmBh4wF94S0=; b=fKWSQkd6emr+rkBfyho12CbqhA
 SPKYMOToBfuYlZ/LVWg60EcYRZyOQPRozGlG/8984+ELG50NVyWvJP7+1WgNcfjdkpYwSWOvA6pPD
 m+UwWtG+LR1GAOn8fepJuUPECAbdRW1W7whE2JPabxkgBvdfO2+EMtp4X/g/6fkQb8KTNsHKZKvup
 2LAkUVB7FxLnn7P8PuqkxUzGmH7l9ROzgWyGn3beyFKzs+AJ0KLNGOSUR8LvoX3lWSSoZ0WeUOVXe
 dYcrYQkY+x0gCDILJ2PHEPNaonXVKJS7oZz4scbuvqdGYPv2oQVhthpUZuxuXEzDW+osYZMpTM5JV
 BaJypPSQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com; 
 s=easyname;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w4ocZVhEdKKPZzJiQi1Os36YGF2u8UmwpmBh4wF94S0=; b=fKWSQkd6emr+rkBfyho12CbqhA
 SPKYMOToBfuYlZ/LVWg60EcYRZyOQPRozGlG/8984+ELG50NVyWvJP7+1WgNcfjdkpYwSWOvA6pPD
 m+UwWtG+LR1GAOn8fepJuUPECAbdRW1W7whE2JPabxkgBvdfO2+EMtp4X/g/6fkQb8KTNsHKZKvup
 2LAkUVB7FxLnn7P8PuqkxUzGmH7l9ROzgWyGn3beyFKzs+AJ0KLNGOSUR8LvoX3lWSSoZ0WeUOVXe
 dYcrYQkY+x0gCDILJ2PHEPNaonXVKJS7oZz4scbuvqdGYPv2oQVhthpUZuxuXEzDW+osYZMpTM5JV
 BaJypPSQ==;
Received: from 84-115-228-205.cable.dynamic.surfer.at ([84.115.228.205]
 helo=[192.168.0.94])
 by mx.easyname.com with esmtpsa (TLSv1.3:TLS_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <paroga@paroga.com>)
 id 1rivWR-0002vO-09; Sat, 09 Mar 2024 12:09:55 +0000
Message-ID: <f97b4a8e-7944-496d-9bed-20e8076a327b@paroga.com>
Date: Sat, 9 Mar 2024 13:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: Add Texas Instruments
 LM3509
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240308215617.1729664-1-paroga@paroga.com>
 <cb220c6f-086c-4995-b2e2-bce78b9a4b04@linaro.org>
From: Patrick Gansterer <paroga@paroga.com>
In-Reply-To: <cb220c6f-086c-4995-b2e2-bce78b9a4b04@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 09/03/2024 12:53, Krzysztof Kozlowski wrote:
>> +  - compatible
>> +  - reg
>> +
>> +patternProperties:
>> +  "^led@[01]$":
>> +    type: object
>> +    description: Properties for a string of connected LEDs.
> 
> Are you sure this is a string of LEDs? How does a string/tape work with
> a backlight, I mean physically? How could it look like?

I just took most of the descriptions/names from lm3630a-backlight.yaml. 
I understand it in this context as multiple serial connected LEDs (as 
shown in the circuit diagram in the datasheet), so that each of them 
gets the same current when connected to the output of the chip.

Maybe a more general question: Is there any easy accessible information 
about which code is the best used as example/reference? I tried to align 
my code very close to the LM3630, but you gave me a bunch of comments on 
that ;-). And would you like see patches cleaning up some of the code 
with bad/outdated style?

- Patrick
