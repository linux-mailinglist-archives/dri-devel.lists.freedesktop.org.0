Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BF772468B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B36810E362;
	Tue,  6 Jun 2023 14:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C29210E362
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:42:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51491b87565so9436633a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 07:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062524; x=1688654524;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i4ao4E8ClCEWNvR/XfEvDsYDmrnpxfLNmNLp5Yh1CHk=;
 b=oT7b3/9/75V60KqSaPd+cOmwPnShxQG+f6TJwy2+61Pb9c7LjDoxPGcY5bi+NYS/iM
 kiNxN3CyZWOJsykVLQT3wHohUlVqwl/1RLtbDD4vHqF+SYTKAWuhv5TYOVR7IEjxu13q
 hsZoY7dgMdzEfWMNSXA8yVrl9GfnkYIQ2bBz2JJghLIE6Gt7qjBRK/8fKG7n7/E11gmL
 v6bPf2yjfgLyT8DZ65JCp5RbjK4NyXJ6Oa5nhGIxyi0haiussC9rbomS6HkbYrfj/9aA
 0fPbyLxdNscmDHrM/H9jULqLdNpgVRYovjX4WAE9A4Zw95447RPlc6J6aWHy9rq/Jxu7
 qc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062524; x=1688654524;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i4ao4E8ClCEWNvR/XfEvDsYDmrnpxfLNmNLp5Yh1CHk=;
 b=ko1t2tA0hvcwvvuf420x6JJjjuS63xJQFj/4lryIxcerzuGUgtwOg+suJRhpK8jrZ5
 hv050pLPe0bqW33ZYsT754KFJDJiJ8cun2pj8VfDNgfbngakjo65IUPCk5bdzPjS8kVf
 tpACoaGYarE4v3H/177QjnGc2NUsYuspuMqeeVpGyI33Va2NVPNuzEBA8R22iiyzrwc6
 XPVtlk55SnlYCEINZroLkwCYT1PlHPvAlGS6oa0+E/ob3E8rTq/eAqk29z9JWoBLwPze
 gytfJzxfidY4krdcCQzaEb/cuYsQtHlg2lMkcOrMiUZv+oGvYuNKKaDOXJtCGISysUHd
 s7Og==
X-Gm-Message-State: AC+VfDweztwkfx/kwROjLJ3murmzmaddEBJ1dBB6mjDksGEz8H7LTODf
 clhNx5kwEHwFZin51GhO2tW6Iw==
X-Google-Smtp-Source: ACHHUZ6uHm1nli0JlYRJ1g5RUUe8qv6iEShPapCQiVoIL3rCcR37gQfcDi4sApHVba6lUE1nRKNpSw==
X-Received: by 2002:aa7:c492:0:b0:514:9c74:4cdc with SMTP id
 m18-20020aa7c492000000b005149c744cdcmr2128278edq.15.1686062523794; 
 Tue, 06 Jun 2023 07:42:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170906374a00b0096f803afbe3sm5606895ejc.66.2023.06.06.07.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:42:03 -0700 (PDT)
Message-ID: <b1a7e0ea-02c1-ee83-dd20-814d257f908a@linaro.org>
Date: Tue, 6 Jun 2023 16:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/3] dt-bindings: add fannal vendor prefix
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>, neil.armstrong@linaro.org,
 sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20230606140757.818705-1-pavacic.p@gmail.com>
 <20230606140757.818705-2-pavacic.p@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606140757.818705-2-pavacic.p@gmail.com>
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

On 06/06/2023 16:07, Paulo Pavacic wrote:
> Fannal is a one-stop-solution provider for touch displays in industrial
> application, committed to delivering a variety of professional high-quality
> products and technical services globally.
> 
> Website: www.fannal.com
> 
> Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

