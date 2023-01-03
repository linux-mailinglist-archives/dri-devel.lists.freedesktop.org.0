Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C00965BC12
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 09:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCDB10E1CC;
	Tue,  3 Jan 2023 08:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301DB10E1CC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 08:21:59 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id f34so44615739lfv.10
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 00:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ifCo5FOIwokCxO0n+MVhGa5ic/79OUh35i/SK2lVaA=;
 b=kM1Xdn4x5u6DrIrS/Lk4CaxK0H3MZ4Xp/ynvK1cN29tFo8bDKerM/ZQKiYqxpqY9PH
 nlzMLn8ProPaLuBjJbDnbGjOSiWb+I7LAceEs8MygPjHLyKU7GYQenpv5h1e4rsZHBAx
 y7lpwEEU9ofPxj+lOSkdri4oTD8h/6Ay13EB8ZuAXYJaj931itWDGFWUyX9FmBzzPpBa
 yzegMbb9ZM3AaO9+EspKdwrAyRuZTd0QEthQZUd74xx1An9Z8HmA96R94ntQ3dwwtmLq
 uVNMB4du7aOPVeNwxPx+YdWIhe2vImH5zh0ZV28Ur3ClE75235Cv2XpEkZLfhDBlfDpg
 4OEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ifCo5FOIwokCxO0n+MVhGa5ic/79OUh35i/SK2lVaA=;
 b=zz5sb+PYX9NMHXi4W60Yt7yTEsiiZb8Ch03QLisOMCKr0+OAVjiPknqqi1FuPLl2zj
 UmZ0G8SIhZyX92lUWViYR7n5FhP7DgZoRJnaMEUu7WtiXeCdq6u+BYi4iehUlD1VrFUy
 KQWMGrovF9tv4bVuo5+hl+OFrHvedWDNIq2HTiWAce543hSWdy4R2QurpKIuOA46UMub
 olzQY4yf0KiU+u6lEgakE4Gk51HCdoHQ1ulzNVO9/S4FVvF4h9cwkd/wYdnAljjFo1ib
 hQIXR0spsQVP273d9ziAGPVqI9Uf7gZOjzn/ioPopAzsnH7FEbgGW5nILYytf7UVTHc3
 pLJA==
X-Gm-Message-State: AFqh2koiOHAHodChlqR/0wAdzsm7eg24N7PYmvJdj9qlAiRrdD1XgvE+
 QzM1j0Yv3uIiNOaERCLp9G/F2Q==
X-Google-Smtp-Source: AMrXdXtsbVV3d08q2p6h3Fhxh5/w6BwJ0fVyFb+0dMKZcc2dYyw/NiHcC+TEEXH5jwusbWDSDl+m1A==
X-Received: by 2002:a05:6512:b0c:b0:4b5:97cf:8f1a with SMTP id
 w12-20020a0565120b0c00b004b597cf8f1amr14197071lfu.40.1672734117561; 
 Tue, 03 Jan 2023 00:21:57 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a056512075300b004cafa01ebbfsm4286973lfs.101.2023.01.03.00.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 00:21:57 -0800 (PST)
Message-ID: <3f484fa3-680a-5f7f-c824-ec0cbd305d55@linaro.org>
Date: Tue, 3 Jan 2023 09:21:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 1/4] dt-bindings: vendor-prefixes: Add microtips
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren <guoren@kernel.org>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-2-a-bhatia1@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103064615.5311-2-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/01/2023 07:46, Aradhya Bhatia wrote:
> Add document vendor prefix for Microtips Technology USA (microtips).
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

