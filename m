Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB743850E8D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 09:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1098B10E6FD;
	Mon, 12 Feb 2024 08:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n6HCQplX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BB610E6FD
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 08:05:29 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-410ec928b83so1085925e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 00:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707725127; x=1708329927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jfCaG4VvMyKMzOb/1e6Q0Brw7CIgAIOkySvxonDdoYQ=;
 b=n6HCQplXsrU1n/ekPXXanKbfgld1cq6hw3MH0sv9CbRr4oCcxyKyy2mwUqOAM4ZvQ1
 lcx3odc7b1U83PWca9Qkh98zq1lwu72K05xuaSGquiLcDgwQkT4JiKymt//oHsvJxrgh
 hTOZAaVURdRPmJJPo97qvvkOWWvfOSV5vGP8uBCfCSq8X2+BQkJlgAeCFQvRYV8bjLJk
 GC0vx40iCSYsiVIzLE80N1a3wARjW8bfRSaYky5HSLZHiKAZ3is+rZVD8Fqw+LOEmyuR
 Rpv0LwAzhVtUvf0RI+Bz7ruKlh70lR4n9oodJphaZ2uZK0WY2L8xm6jD3kNSqSe6BEwJ
 UP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707725127; x=1708329927;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jfCaG4VvMyKMzOb/1e6Q0Brw7CIgAIOkySvxonDdoYQ=;
 b=KRPDf9eTnnvVQBfuFuQ0uTyzwSfR4AGDJsYonYk1jsiM9pXFLpu23MB4/cFt8kbuGk
 RqMZonx6FZbIat9DTdbYqH0BUvCkQIsgnpoflDR+q02vqdN66BkWu825p7A2fTbEbrQq
 ITubFgNKFVMsG4bCXZEsYSrFGRvrMONNxuP/L09w7N/7L4yyHuKZVRbbTlQLkDhH554G
 IBd6ScFlunQsxYYiH7d+L54R1UW1OgZ5omfe2mCy8IqZvl1dMzpJgN66Qq/cpIPutbkz
 ZFRgQU9A4SZlptlPZCHZcWNyg/2ZHwCOpgRmYg+vhtbaROpcJsbxsSGvzlA6nuRnaRnM
 cudg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7me8u61Ow2MEd+REsqYbdkq0CHv0W4u8JEO0UzLO52DJUTLvQcBUgGYMJNucZLPeHecaZNggOucHJVy0JlZt5QablmAMxEgQ4Mf4djrd5
X-Gm-Message-State: AOJu0Yw0RT4JOBoHMMhyG8EloH4Kg1h6VQKP1R85ErNwbrU3Boae7aZs
 B84FoBmRJ+EHwBvpMxGHHKEi7U9vGQP1zDa5jDg2ru2LGkNwwIN0vCOIm7kY/Eg=
X-Google-Smtp-Source: AGHT+IGFvpZ+DhrGn6aZ+iLL7W/S1HVWUzzzGBjdqb6If0h2Pd3HSrWq3vtSqF7tA5j4lFTjtbBcUA==
X-Received: by 2002:a05:600c:5192:b0:411:2e20:fce4 with SMTP id
 fa18-20020a05600c519200b004112e20fce4mr209864wmb.29.1707725127609; 
 Mon, 12 Feb 2024 00:05:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCULvRkI3fws/kkH0muhMSkByhjEhxf06pagPgVPje9ftMMUJxmk6jnNoJYVxURzaVaHWy5utV/EM05HRJz0ztPSKrW7sa31qVOBQJuqUoKAtH2QI+/WM7WLgPdxSxJwOrr2F2vi9SEUbu6PzBczhTT25A3fjPlX2l25hK1FgfFarR4NbCWZ913JGjMu+zBC8qe1tMbEKIx6d3GDIxvJ+mvHPmLW9jY7XFycrfP1nhiP9GJe35IPLhmJ44WFLHPjd3ygpxJt2Lt36PyqXLe9XDlOCSlrwLTRxsTcwDuecesRfPPtP79IV79RW1i8n/eGqNxXGA/4VfjB+2hHLvin27N73b/7lNyXUaewuBgYkqghqnf8hoHI1Q6nxTWCfNCYtLqK4mxz7M3kuqzZE1V3khBLJq4zglEl2dNvJ4lYxNpMS8NEqudR+EuHW/jUUuBb/Zih1grNi1E8laLTufkeT4kMDuf1wCynzkeouWkfI1/7HkKupi8AOq3eNyaapBxm1zh53rrj0EJlaTI5zyhiyqGn8/FG2P7LIbD02gHjay5mzPhRwb/8aEwwp7IgKDVEOihhScq1YEt3H8Dm9Mvmh7BHIqCEiF02AHhq3aV61hNLWVOUaEjdNCvQL8yfNg3uqPv1dIclBwFShQSDTc2vFNF7XPVAwA==
Received: from [192.168.1.20] ([178.197.223.6])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c351000b00410e6a6403esm980417wmq.34.2024.02.12.00.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 00:05:27 -0800 (PST)
Message-ID: <de359646-2bf2-4fd9-9b98-c6fb809b2de6@linaro.org>
Date: Mon, 12 Feb 2024 09:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] dt-bindings: display: bridge: tc358775: Add
 data-lanes
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Walle <mwalle@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20240211095144.2589-1-tony@atomide.com>
 <20240211095144.2589-3-tony@atomide.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240211095144.2589-3-tony@atomide.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/02/2024 10:51, Tony Lindgren wrote:
> The device uses a clock lane, and 1 to 4 DSI data lanes. Let's add the
> data-lanes property starting at 1 similar to what the other bridge
> bindings are doing.
> 
> Let's also drop the data-lanes properties in the example for the DSI host
> controller to avoid confusion. The configuration of the DSI host depends
> on the controller used and is unrelated to the bridge binding.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

