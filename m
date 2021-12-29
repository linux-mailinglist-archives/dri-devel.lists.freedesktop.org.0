Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB76481E8E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16D910E2A5;
	Thu, 30 Dec 2021 17:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A446F10E21C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 17:04:21 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id r22so36642215ljk.11
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 09:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fTrzUJWfhUIkdckLSHMnURIWay1hQkAnOl+6SgL3Qxw=;
 b=iL/eGYu1HjMm8BVvLrWVPKGJwWFEI9BJY8jfbW9O4spm7Y+Rb/nqCE818TUR22pidR
 BTR1QIRah9M8TayWD+Zza7+7pWMSikKh/UxZFvJ8uTqLYCLG7sG2obWMSjN4lzN4KSDq
 JMj4yi+WDUakiXsQfNOA2tjQDQvFGwqUL5N+IvGS+FXtxvM061MQwqPDKLdLtE3mKIGq
 rglor7Q/lh6D9GPYcYyaY6l0JUF869EmDEX4rtGmMbBhCCX/hgNFO/OnZV1Hf4QZeED1
 VApBUUYZ0ZiMXzAGIn1cz8mIO29J6fEWmAGW9jkaRCaqdriZLZCdqt4mUvmLNwo6Zt1W
 qd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fTrzUJWfhUIkdckLSHMnURIWay1hQkAnOl+6SgL3Qxw=;
 b=Bhck4tCEcFrVVryiwftEbK0MEc0PTCzZPMVTuOr62ei+21F1Q2JoYFVeSCSuhSiEpe
 tFhZMECPMGyV4Z9/t5kWvcUa56o/sh6hxMQ+pTg/BQWz5zWSY/5MmBryeN1cdqINZUSu
 KavAoZSa8T9hXMbvHPqn0G8692TFsFI4zuZT7t6E1cjiab66XuHarZFXr+tal/hNaWOf
 jEqVVxUyfeodyg+QLv1a8VO2GU7rdnf3tfLIq4o+JkK1RSmD84NkOVKhVVSgjvEKk87U
 p+a4HIUVZAvJmmf5lUxksZiRXd28b53Tdzh5npPSCcrvQLmo4T0Qtpp5SxOdH0fSK0+p
 xkMg==
X-Gm-Message-State: AOAM531nCqjptMPTaSi1P2/+hOnO1E9JdZ6MPzj3QSIpE5PXqlnoduMy
 OzUsY+GnAxDivMgFpTOXLZkyHw==
X-Google-Smtp-Source: ABdhPJy9XbWrnBPDstakJxVDB050NScEATy/Wshvr7LpHN1RnyZTAAmnTgZ+Ok5FsU0wgvur/5ydjw==
X-Received: by 2002:a2e:9cc4:: with SMTP id g4mr20600989ljj.164.1640797459871; 
 Wed, 29 Dec 2021 09:04:19 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id b26sm2120463lfo.6.2021.12.29.09.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 09:04:19 -0800 (PST)
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
 <YcyTV4fJqMHIeyYB@pendragon.ideasonboard.com>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <87626d61-ada0-c220-bea5-5330f5256629@cogentembedded.com>
Date: Wed, 29 Dec 2021 20:04:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcyTV4fJqMHIeyYB@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi.

Thank you for looking at this.

>> +				port@1 {
>> +					reg = <1>;
>> +					lvds0_out: endpoint {
>>   					};
> 
> Endpoints must have a remote-endpoint property. Let's drop the endpoint
> here and keep the port only, the endpoint can be declared in board
> files.
> 
> If you're fine with this change I can make it when applying the patch.

This empty endpoint is currently defined in dtsi files for other r-car gen3 SoCs.  Goal here is to 
define lvds0_out label that is then used in extension board dtsi files to link to the port.

In this patch I just used the same approach as in files laying nearby.

If this approach is not appropriate, then perhaps need to fix it in files for all SoCs, to make it 
possible for extension board dtsi to be compatible with all of them.

Nikita
