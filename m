Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 329256D1ACD
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 10:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFC510F153;
	Fri, 31 Mar 2023 08:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA34C10F162
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 08:50:48 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id br6so27938162lfb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 01:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680252647;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fdp8vdGW+YLTG1BB3JW7Fr8RajkHODRqHKvUiYYfQUQ=;
 b=We753QmPXYE3q0LjNpkAdBaBVojKlF1ElQi/OkqGnh6F2L+avM/A72EzOkW8BMuX+3
 R1H04uXJsdlz7jr3JiKjs+mAZPwlXXBcUOKtVXuoYy15LmMrmMPzHhy/peO59j5VzORb
 SRp2L8oItUiYPsj3rHOu7inYRmGsYOxhQLAJvAMJzVlkFyzn4CongHxA76KgCSoxX6J2
 ISQaS8jHDNYEurFladp43q/r3hs3aYlCmDiCBYbqeGwM7xJGSil0ppuMvIP6bTuIrszx
 cEk5MtRP0bzvHA+C39nltJfEJwhlAG+n3oOX7EYEff3qnOYOmxOXgDu9ZTQr38FEVK2t
 2sZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680252647;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fdp8vdGW+YLTG1BB3JW7Fr8RajkHODRqHKvUiYYfQUQ=;
 b=1/1P3Y4a8Hzd3HCgIAd5Zia7k1zKjvqB6N4LAbX58sARyDKVLdBnzMsE9BQ8XiC46E
 9s4BYgpdMULb3GYxsow9gs1nY/cZNMkU9iWvDie607d8y8Z46+32rcDKptznRhJHcocj
 SOjDOx0pGihDVvPOK/sOcYp0Al656YGllGxIfWBJOukU2YNHXoY6PQOVFc/iw32+peb6
 xE1uYN2DEfz9To3Pwy5kUpLzCFThiwNjv3JFrBRgIklSosQyRC3QjpeMhETS7ng3s2sB
 MeFccQwrziwO8mqR6lrv4/11AsqEl7XCxDOR4KX4w0UBMTJPZ9CBddHENeh3erA2ISy8
 ZNVg==
X-Gm-Message-State: AAQBX9dh4VJ5rHXngvO5wjQ67ioCIR+C7FTynbhmpva9n06Axeza+w0p
 nbaZDdC8gpoBzEbM0DQgtX42+w==
X-Google-Smtp-Source: AKy350bDYXT2GC7+PqbQLv5V6PQTZCxRn9SZBcOrgl2QdPWUKJa+3waLxJKJA5G6HKBEgSHL0aBpzQ==
X-Received: by 2002:ac2:5159:0:b0:4e0:ee54:fa23 with SMTP id
 q25-20020ac25159000000b004e0ee54fa23mr7797113lfd.8.1680252646848; 
 Fri, 31 Mar 2023 01:50:46 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u5-20020ac243c5000000b004cc82b70809sm290259lfl.150.2023.03.31.01.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 01:50:46 -0700 (PDT)
Message-ID: <1716b085-7471-16c3-7753-992db83348f1@linaro.org>
Date: Fri, 31 Mar 2023 10:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: ldb: Add i.MX6SX
 support
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230330104233.785097-1-festevam@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330104233.785097-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 12:42, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> i.MX6SX has a single LVDS port and share a similar LDB_CTRL register
> layout with i.MX8MP and i.MX93.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Do not duplicate the entire if. (Krzysztof)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

