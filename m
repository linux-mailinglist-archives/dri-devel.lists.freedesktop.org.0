Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77A8704768
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 10:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245CF10E31B;
	Tue, 16 May 2023 08:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D96810E31B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:08:42 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bc37e1525so25418294a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 01:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684224520; x=1686816520;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9XW4XZAnemNwxZmDnCKO7GuXOkgFIvhJMeXABYP2D9k=;
 b=uB9hFvEGL38+U9DWhxt7On6x2Ke+O1i2LdhWkl64bS4R4gDJNy/h//Uhn8RFxDUbY7
 Xzia57KugNQPS9u0Do/hn0fORZYHQ4zqL7Hp+TpcfJkXEMdAvdHR9rlvn07I785pPvIo
 fZMUGH/mg4KR9qL3QdQkI9Sxggg4M6MBZcWTFCik+BOYqK7GYJUOJMtK6pI9dc5glb2/
 g/DJ/+rbOx4FywAmxoD/rug8gn42/9K54WdI2qZH72nqAmoy3uVcslvCod70ZDzAlNTz
 bpMmExj7594E0Z41yC+UhEWp0AHL4X+5qmNd+nMiMCvjkPsdyrkqRvYyz5n8f6qyrX59
 V/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684224520; x=1686816520;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9XW4XZAnemNwxZmDnCKO7GuXOkgFIvhJMeXABYP2D9k=;
 b=j/5RZtRY6Lgb2zvcCreIOVUcBSSudYE/DvoLg+RaOHSjY0/z/eCHRBNHdp926kRuP7
 7skNt4PF2hvMKV5opyF00GH+GI9gGucxUccMVoW66fwXMvG666/O46viTSrqjjn2MCQt
 FgRdiYgz5YScjUDIn7YX11OB/Xt5Y4GV9PddWshLKgpHbLDOIO/fpwRNvhripLUhVMlI
 SziVjkVGso0F2S4qT1uBhd0al6w1h10IFNsNmRFkw/5MDTWqDKcQXa3BSgrSBwEBwVm5
 pcOrX0HamfJGQrzJQ5Fkh8Glyh7eWCaN7pRIB1p8rm7VkhpjlUORYchjDM+OAcGSHgF7
 HcQg==
X-Gm-Message-State: AC+VfDz91L0F3qlbXXX9P2zo125LkWqYLa+DxuoFXxamg77AAuRngnNC
 5s8Nmb3nhRRK3UxtqkjfbNSrXw==
X-Google-Smtp-Source: ACHHUZ72d+H/5xaxXybFu5FAabyCtks0yuSgACMr71nuX82KUfSm4g+hd2pSdXEoSCNE9OHTlUOfEA==
X-Received: by 2002:a17:907:6287:b0:94f:29f0:edc0 with SMTP id
 nd7-20020a170907628700b0094f29f0edc0mr35474416ejc.44.1684224520325; 
 Tue, 16 May 2023 01:08:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4d4a:9b97:62e:1439?
 ([2a02:810d:15c0:828:4d4a:9b97:62e:1439])
 by smtp.gmail.com with ESMTPSA id
 lv4-20020a170906bc8400b00966293c06e9sm10448443ejb.126.2023.05.16.01.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 01:08:39 -0700 (PDT)
Message-ID: <eb0e4ce0-f754-8381-49e5-97dcc4a980a7@linaro.org>
Date: Tue, 16 May 2023 10:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: display: bridge: tc358867: Document
 TC358867/TC9595 compatible
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
References: <20230515162033.66986-1-marex@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230515162033.66986-1-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2023 18:20, Marek Vasut wrote:
> The TC358867/TC9595 devices are compatible with the predecessor TC358767.
> Document compatible strings for the new devices, so they can be discerned
> in board DTs. Update the title to match description in the process.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

