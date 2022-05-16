Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2975D527D34
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 07:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E4D10F354;
	Mon, 16 May 2022 05:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1719510F354
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 05:54:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y32so23912724lfa.6
 for <dri-devel@lists.freedesktop.org>; Sun, 15 May 2022 22:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iQu4lukAu6aND/lSxHXOC9CQZKXgScz0FZajkncufEw=;
 b=WOTncPc2v5NZjRnTIJIh4IXO1dj9ckDUzbSMpFADqaVVFteQj9TEczbboaO7BSW2/s
 XISBzIocyQtoLTgR7gWJ/xy+YDxJlUaAAnAbtnBo+Ja4yyTkPE3dNrqwQyJL1N6Lt4H0
 ++LYr9UXQs5/Qplz1Zqp2mpf5Mt3r7P9Z9O4UHYmkTLk3lPXMJ1Bwkihocd9f4kVWpdk
 3IzpmTfXxrlrmJeAStqS0d+5hFCtGcTIYjrwdLrzg/HL53pH2ksHGVkx5ljLbGLK0EZE
 n33jLIToD1mvWSg0ZTsItxhaHXXnCYpgLBJ7kwzcMxk9kRkJfIChVs5xPxBONi0DnCfU
 rI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iQu4lukAu6aND/lSxHXOC9CQZKXgScz0FZajkncufEw=;
 b=D8tV8/JHvNMzLhmV3OGIlPp1vEwwwxNoDwcC2zVX50tHfXhvpFMN3gZI6C2z2OEGPF
 sGrPhRRj8t8cqebrJEslyucmIhwLcJFxlsnD0fsS9HZWyYsuTvraC7breJpzpvj/i3Hs
 7np/XZk5OCcpLTsjovazAXV3cz6cQrJArFNwqA3dMpbShYHMSQ/X7XjmcE3OQMnWlS7f
 MbP5+snGuzLXevtOPHZFXf9reK5aw36HrKT3D0exE/fekugsht0eqVfhYdI6g+vIxiYO
 Sg9i5/sScQPdfraTWi8u4VQsssixYgqbPPsHoiYNJDznrfFkC2V2OGGwI8p6rsjSAJ0v
 pDkA==
X-Gm-Message-State: AOAM5318N6GO99gdQz0Z0pbSwSVhRo2F0cR5jabYC1jYmBqeSZ671wsC
 6k9+D9x0VkglvCFeV5r6fQ6OiQ==
X-Google-Smtp-Source: ABdhPJxDB/Sa5OHAguWRCgpV67m8ipVKXudtdyV00vw1QteYiiQh9fRXMYiofl5SGOVzWKsH/Wkjhg==
X-Received: by 2002:a05:6512:228d:b0:473:f729:3219 with SMTP id
 f13-20020a056512228d00b00473f7293219mr12132861lfu.428.1652680445339; 
 Sun, 15 May 2022 22:54:05 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 m20-20020a2e9114000000b0024f3d1daeb5sm1384293ljg.61.2022.05.15.22.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 May 2022 22:54:04 -0700 (PDT)
Message-ID: <3499cca2-1d7b-12f5-adbe-0c9b279cc51a@linaro.org>
Date: Mon, 16 May 2022 07:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/3] dt-bindings: usb: add documentation for aspeed udc
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
References: <20220513065728.857722-1-neal_liu@aspeedtech.com>
 <20220513065728.857722-4-neal_liu@aspeedtech.com>
 <da78aaf6-c9ae-d591-fdc4-723f097ace2c@linaro.org>
 <HK0PR06MB3202679A7FABAF7D0D045F0880CA9@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <567d135b-3d40-9958-e000-1357020b5650@linaro.org>
 <HK0PR06MB32020539063F8A7C5D56E0B980CF9@HK0PR06MB3202.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR06MB32020539063F8A7C5D56E0B980CF9@HK0PR06MB3202.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2022 03:59, Neal Liu wrote:
>>> Okay, I could rename it for next patch if you preferred.
>>> But there are lots of yaml files which are not named as first compatible.
>>
>> Yes, I know, I quite likely I also produced such bindings, but a specific name is
>> rather preferred. Otherwise you will have a difficult naming choice when your
>> next Aspeed UDC requires new bindings file because of some differences (not
>> yet known now).
>>
> We can rename the bindings if next Aspeed UDC needs, don't you think?
> Currently, Aspeed has no requirement.

So just use proper name from the beginning....


Best regards,
Krzysztof
