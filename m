Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD4179A6D1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE6810E207;
	Mon, 11 Sep 2023 09:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F11510E207
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:41:54 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-52a1ce529fdso5587234a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 02:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694425312; x=1695030112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UXHJJdbxzqcIQ7/jV1cMbzvwmre8W6Km5hkF3onYKso=;
 b=tIsTkZEvNnzdkFbF4GvGhwbW/7xhAh9XnTxoi23Db5K2DLIJufsXpOOiocsXgduZBE
 TEH5GPVkCPbGgBaxaAf9oAoKniDBoek/JlXvhBr3PsE94b8Ctwah/GbDKs43mZXFmTGh
 VSL7rdncgfkz1BZPHi9QGfBinjuZW2r0cpqGX7rpJxW/q+Xtb6UWO3GSKhfHBt3EDQqQ
 UBu+52TUYqkkLkBJdvKR4MVsuVztLBRHekm53lH2TJlJ1WyVzSd7C1NlZpGZXVpbLPga
 TYcoiqTY4fFkQmrIwYS34ti5OJV4Rcg6UeMuF2mJ2RCLQuJK7xCNTxxdkKPr3Os8vq/x
 Pm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694425313; x=1695030113;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UXHJJdbxzqcIQ7/jV1cMbzvwmre8W6Km5hkF3onYKso=;
 b=AylPXhvFlM0ggCByq3GgMZ4iepyA4l+XJFY35+Qzyxo9TRdHEsIMAYQtD6dAOylokY
 6FxO+uEAvSFKWIpKgs0ySxyjLV8bsCXt4E14yScCO3hLjcsE8Kmk0441giK/KUdvfBHu
 2CL5XwaoSzDGMFGhtDTvV6oVDLXQSVGE1wWjC0Zz6Jycto8rmn/x7RVnZ23CQw4VBDNI
 U5m6gCd4FLj7uqSriQfcgZqwSLRebpib9cvz7hsKaoLSwgt1DK7d1OeKs6/+2lFo4sfV
 9RND2JSgWtMZ328DuoOQgr7qhErG2L3N/a40OkOBwD0N7IxGNyX5zZThmvoiAcgWM07N
 MT3Q==
X-Gm-Message-State: AOJu0YyOEgA/et3Vro0uKpE1bg98D52bnFIEqoj9rukqvh6CIrsUBlWy
 HpJU4FT5NcZhTsCylBYLOseDdw==
X-Google-Smtp-Source: AGHT+IE7iZHF6KNh3bEWf9qZmU+mUmpM+L0mGI9OUUdk7KwOQH7iMgOFaFRxWJXmczhwjhmbN6mLiQ==
X-Received: by 2002:aa7:de02:0:b0:525:6ab3:dd22 with SMTP id
 h2-20020aa7de02000000b005256ab3dd22mr7721098edv.38.1694425312792; 
 Mon, 11 Sep 2023 02:41:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 r25-20020aa7d599000000b005256d80cdaesm4311321edq.65.2023.09.11.02.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 02:41:51 -0700 (PDT)
Message-ID: <d35a0c54-531a-24a1-dbf6-2b40eac12081@linaro.org>
Date: Mon, 11 Sep 2023 11:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 7/8] dt-bindings: vendor-prefixes: Add fascontek
Content-Language: en-US
To: John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-8-contact@jookia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911090206.3121440-8-contact@jookia.org>
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
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/09/2023 11:02, John Watts wrote:
> Fascontek manufactures LCD panels such as the FS035VG158.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof

