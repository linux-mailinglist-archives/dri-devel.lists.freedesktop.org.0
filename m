Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6C86D1A8E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 10:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112D110E0AA;
	Fri, 31 Mar 2023 08:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B607410E0AA
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 08:41:53 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id c9so17525718lfb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 01:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680252112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=09swxF+Nj+Xdb2rdxxkyYt+YX5gFiLq7X+YfiiWATXU=;
 b=QqMdhWIYeCm7i8YTYpM6RTk4uC3USAlhTr1cbH11KJzV70SFd4sr2hgHWMw2UjUj/U
 z9fnbpijZSSSITJsrKuqjMYuvd+ru/dyQTxa9YMHLNEdILQnpyPXtXlO6iGnl2QY329h
 W5qR4DcjiGRpZmHCwQg0gyllLQivP7vSYPu2Ai9hLrfj2Su8eCmUv0j5ZAviYJ2sryxN
 kizDPi1nH8rNUNBNnoZfKQT7Qr1BBuRF5/NXd4l0RJAHrZAj/SZ3DJiIMMBRIMI5zr7u
 tjZIxMfkczi6OIUJO0GPfbXsSXtnDgwwhToBLl5sigKMFUejTJp5IuTaqgUGa+f7T4So
 QZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680252112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=09swxF+Nj+Xdb2rdxxkyYt+YX5gFiLq7X+YfiiWATXU=;
 b=oZTmsTRro9SfsmU8hcI6nnzm3f/1GKY46g+0DmXopfTYbi5SiOiF4iHYTsxBxvhNPq
 0sqAyDnuyTyvLSuNpaq5fgB3dXYtZMeStNkbpMqSwWIiv/lYy3CQ4OhYH92h+KjPfjKn
 Yr6BvESB8XrqyKW+mlclMnbtVXlNtl9MxlQ8JUtyAoyjjUay2n/tRTxtbsybQF5FLYoe
 hmccmtk1UzZg6VLC6TYQBsCRee3+SSmRAE9kkhQ5fnjRvHzM3KrpBiaPxdqO44cC+yaJ
 GGryVTu1sGgTOowg15UQMSoxaiU4fAkHzLGoh+URWzAJdxcG03LAzO9jtBVXZoLPkgEI
 FTBA==
X-Gm-Message-State: AAQBX9er0aeUVC/Ezogj+iBk71IwGsfDhzcWxcDQuRPoDz+4MikGFh2V
 3sBaNWG1530AIlCtdZbo1F0OwQ==
X-Google-Smtp-Source: AKy350ZEcpE2BiiN8ZXisNpNjVKAac7e7IUuT1hTuHLZ5NdGEbP+EmXcWQS8P1hRsVOlFWGNCkkPSQ==
X-Received: by 2002:a05:6512:513:b0:4dc:790c:910b with SMTP id
 o19-20020a056512051300b004dc790c910bmr2583994lfb.20.1680252112037; 
 Fri, 31 Mar 2023 01:41:52 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u12-20020ac2518c000000b004cb43eb09dfsm288838lfi.123.2023.03.31.01.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 01:41:51 -0700 (PDT)
Message-ID: <e775c230-7092-df3d-35bd-77fd83a41529@linaro.org>
Date: Fri, 31 Mar 2023 10:41:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/6] dt-bindings: display: bridge: toshiba,tc358768:
 Fix typo
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org
References: <20230330095941.428122-1-francesco@dolcini.it>
 <20230330095941.428122-2-francesco@dolcini.it>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330095941.428122-2-francesco@dolcini.it>
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 11:59, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Correct Toshiba spelling.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

