Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DBE65BC13
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 09:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83BA10E23D;
	Tue,  3 Jan 2023 08:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCB110E23D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 08:22:04 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id z26so44657694lfu.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 00:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hnNplO8zsSj05CAnhZjssEtarwgdK7a3BUAmXeHqfTE=;
 b=IRDYFhgv7CWgApeZ9OhEzu4ziX6vYEoYanJOwxAVtNXXyq/6zS+qWU0v9JYWo+nTfr
 75SUTilDQ6Wappp/0y36aU6HUHsoldMMAZOoCVs0bccvE8mHrAOQHuKhfI2OI8VjT+09
 UU8jLYsLpZFuNwRey5xq1BPaD4oO9teX0QXKL95viaZ5J/EdMvJtY3X+lQMZB4tbEvGN
 /tRbizkhie2NJuQiN0F8URex/wWIwEaW+ujREEPAJu8xRf2wnNfu8nz62Yr7iXHXrzLL
 WwePuWhjeCaZvvfrBZH3flKA+v9TKZBDYwjyDQyhGYOqRV99y8Jyq0EJw3wNGjPhG68b
 WQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hnNplO8zsSj05CAnhZjssEtarwgdK7a3BUAmXeHqfTE=;
 b=wXQLTG4me3bYFlnnY76Wap2HcxM/2JxCxRwlM0tRJnfgg3y8aauXphDqGHHl4fU3Nq
 XqoKCa/EWrbaqjKAT9Sk4n59JZhtIdzBvxeN7flBqBVNY/OqgNXrlwx/1m8VCrYe54kf
 cM5kLLixk4epdBB1RPuOoIaQtnlB4yNBBV6P9zHctpS8qq1LheK3TJuUJUUc7W30c8VJ
 ij0DqlCEs6vhbYnYh9DkgsEQZ2zq/jJwWRCltE1VAATC8XkuuJP/f8PmrCeUBVCGNZGb
 0CK2gQr1DavLLwyp/9VFpwkzrTmLO8qZsbDeyKTDneFUMMr4NkviReRkFOsUwyOfXBba
 /d3Q==
X-Gm-Message-State: AFqh2kpF4RihjhMt35zRK6ElW6xiVWeSAbTVDJUfl4QWtz/sNPQypjPE
 YPnqEdd9YAYv1jdny5jWq4a2uQ==
X-Google-Smtp-Source: AMrXdXvbZP6isWmvcJTEe2l329jkWLKnwxKfmHzK41+F7rk8tb5+8boVcvSBIznNrbeyntQ/Q+zNzQ==
X-Received: by 2002:ac2:490f:0:b0:4b6:eca8:f6ca with SMTP id
 n15-20020ac2490f000000b004b6eca8f6camr10992900lfi.67.1672734122520; 
 Tue, 03 Jan 2023 00:22:02 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a056512139700b004b577085688sm4757340lfa.82.2023.01.03.00.22.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 00:22:02 -0800 (PST)
Message-ID: <dccc7a0f-9eaf-24ca-e800-8ee1417e74f9@linaro.org>
Date: Tue, 3 Jan 2023 09:22:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 2/4] dt-bindings: vendor-prefixes: Add lincolntech
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
 <20230103064615.5311-3-a-bhatia1@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103064615.5311-3-a-bhatia1@ti.com>
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
> Add document vendor prefix for Lincoln Technology Solutions
> (lincolntech).
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

