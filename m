Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904675A0B3D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 10:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E3510E046;
	Thu, 25 Aug 2022 08:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7354610E046
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 08:22:18 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d23so22882018lfl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 01:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=FyQKxEzJPLBTQnte3dv1CLlOWzBU0+b5BmjFLEtuJsA=;
 b=UULiU0EFuK3+E2dvoW+xc5zr4vyow0oTphJLZxlMK+pOfWQ0pg4bx3BEGuEqKZO+JC
 tiPakBxSr8iX86/9KWfwXHztHmr48INFEWsKx+f3g3ERMLNMTKXLWhZi6D5SJ0gXKpTg
 gGgZknWrZ0Z4CGQ0HArogrl3juntWE7nJ5JcgNrA+AQXLdPxxVh6rwq7Bw4uzbbf6/hR
 egaUbqD0gqXS9mvHgh/bxX6cM7sLCotB0BGD1KHjjYLNkkD9I8Nq9zhA5nscn3N7ehtd
 rS+NUQG9ap6/qzaw4QqZjHvbMQfmj4r95xauxFA4rUwj9460LEBc+Ku2/tbtI8WK3dDi
 q99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=FyQKxEzJPLBTQnte3dv1CLlOWzBU0+b5BmjFLEtuJsA=;
 b=SGQnsAeDP2j2z6NTLtCWD0kI+1SoYMHJYlF9NBCQtEyTlxDWbkGZUoZqqxOMJ3jC60
 mbspmJD2e2FjpC98JpvQpR8r+zoeQXulhOL36mL525ANdKf1KCWAhGqSnCAnnheIEOHg
 wVuAMUIk3Ut/p8VW5xbjSzOyO9M5huA/OBrwuGSs5GCkVvMn2ysc3tJvZxoFZi/zpQHT
 vj8pK+3jw8+R81B+/GNE89KcE/LgU6XkpS7ynrCh+FPZqmHmoUB31wQuOeiQb9+u3g+s
 Hk8ZJZuuH9dajwjuYEa1WXdo6B+mEk4GvVnNS+Q0vlRyWeaU967a+2XIx7w0wawVVYmg
 s3Pw==
X-Gm-Message-State: ACgBeo15K5n9WkIdoOWZJi6WODuz9Uu3WR+aJAvrXPW2gk3f669MJiPM
 UsKtBAQmODSQkTpDHSE6LS8cDg==
X-Google-Smtp-Source: AA6agR6rCHKklWzPVJqc5DPkHhh0ceITvsb+iGIHVzK0U5kb1ieRgRzkVG9VWI41ICO7nCFdZcIrAg==
X-Received: by 2002:a19:e00d:0:b0:492:e5a5:588b with SMTP id
 x13-20020a19e00d000000b00492e5a5588bmr757025lfg.243.1661415736811; 
 Thu, 25 Aug 2022 01:22:16 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 r2-20020ac25c02000000b0048a9e899693sm381394lfp.16.2022.08.25.01.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 01:22:16 -0700 (PDT)
Message-ID: <d142dc97-4842-eaa8-482f-4b2f08c20931@linaro.org>
Date: Thu, 25 Aug 2022 11:22:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: display: adi,adv75xx: Add missing graph
 schema references
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220823145649.3118479-12-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823145649.3118479-12-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/08/2022 17:56, Rob Herring wrote:
> DT bindings using the graph binding must have references to the graph
> binding schema. These are missing from the adi,adv7511 and adi,adv7533
> bindings, so add them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
