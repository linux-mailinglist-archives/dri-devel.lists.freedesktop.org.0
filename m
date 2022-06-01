Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1021539EAD
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 09:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A755C113394;
	Wed,  1 Jun 2022 07:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9636C113394
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 07:46:30 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id b8so983560edf.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 00:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T6fxYgINWBY11Dni0RdPgNMNlUUQKxzxAv4RKjFNoh8=;
 b=ssAjHW1BeAwXHaBfJEtFzqK3YHHy2KjzIBif5IWHtpiL1VbzWcaVUh4js9Djhqmali
 u4KB8OezdhL1Zo+ygWK8iiZcby1EM6gpkv7MPuTiSE7VfNe7FpM6e5oRIN0Pf/4kcoUJ
 4YEuKryEr+wQPbii/Di3yMa7YA4EGzhLX4n+v5FcL64flYBaHTN+PiK2ffwiNoNEdvXJ
 Rhs9MPPwL6YmubnygHTzCrLbWudSIXTcnGD8ptwWMjfJIb6L+TOcuR36XmCZVbMcvWay
 gNMmR82Cj7wt7REuYXgffWhE04Y4cDkX3G4IfHNI0QelpgKhf59ckWEbgXP6vkdngc14
 xW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T6fxYgINWBY11Dni0RdPgNMNlUUQKxzxAv4RKjFNoh8=;
 b=k8GCUaE+rrpufEMsCeE6rPvyHcXpKRU6cHJkcNNme7EjxHQfotPLfFxiNU/FqfZCvg
 TkWIML1jVVDsn8TK7j7YTAlp3AOLYEagZ/K/ymhmRqAsTC9tBGNIo8NzwzWEjzMnt9EV
 XOh/dVxUPCy1tND+hDu/eC0bN4ufsMpkNDXjMlzJDk+gqlGu01FgULxQwPKc/GtuBmDY
 CqBQ2G3QpSpS5mdEYLHGvhsTpTd49K0ONKBnOCMzqErNck0h93nLZgM3oQngpb43lyGa
 4UZh5qHzIuqnQbtgGabNsZV8UtSztdH7j1+YHfH8NngVw6GwGAzleDz7h1AMbSJ+W2UT
 BfGw==
X-Gm-Message-State: AOAM531aLrsL2T1OUtjKV7ZlE0eG1sQhIIINc1hVenhAavnaWG8jkRm0
 v1FUp6+XXFILlItalVTyuMeXWw==
X-Google-Smtp-Source: ABdhPJx674EkevDvreeBjkA9QX9V23D5lA0OtNhSm7nrHja+xIv/fZuP1EBU8ne7sB2l4OcKJzSTBg==
X-Received: by 2002:aa7:ca1a:0:b0:42d:e1b0:2dd2 with SMTP id
 y26-20020aa7ca1a000000b0042de1b02dd2mr8295939eds.157.1654069589129; 
 Wed, 01 Jun 2022 00:46:29 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ec2-20020a0564020d4200b0042aaaf3f41csm532956edb.4.2022.06.01.00.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 00:46:28 -0700 (PDT)
Message-ID: <903f926c-4977-9e0f-0e40-53cdc164e9b2@linaro.org>
Date: Wed, 1 Jun 2022 09:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add prefix for
 ClockworkPi
Content-Language: en-US
To: Max Fierke <max@maxfierke.com>, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220601051748.1305450-1-max@maxfierke.com>
 <20220601051748.1305450-2-max@maxfierke.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601051748.1305450-2-max@maxfierke.com>
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

On 01/06/2022 07:17, Max Fierke wrote:
> Add a prefix for Clockwork Tech LLC, known as ClockworkPi. They
> produce a number of hobbyist devices, including the ClockworkPi
> DevTerm and GameShell.
> 
> Signed-off-by: Max Fierke <max@maxfierke.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
