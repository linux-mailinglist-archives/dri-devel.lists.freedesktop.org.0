Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE862956920
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 13:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDEB10E22C;
	Mon, 19 Aug 2024 11:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0EA10E22C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 11:15:22 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4280ca0791bso34101785e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 04:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724066120; x=1724670920;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xEnhR+BnZyqhep0tu1+6gKqzWhCmgeh7ON3eSgIapg=;
 b=WUb1RgJFeOKmWZoNPRbxazKAqv6+dRsN4MHIDCe8blGCu5r2d3o+cf/RlqcK9WermE
 Ck3dGar8LRJvmznIOwTdpiioHeAtwIwjJz1YQ2z9NIOSsO1ZMl3op8730TPYOAtHglxX
 OUjsVssmIfkVx40mO7lzLKgyc6tpKKR5kRrS75Cz2oDDl5yRvHA4SusDkbrGTjCFmhQf
 IU42BzYQ+/S+gX2/0oP9waCMaLGHg9T/mN90KOsZFnGg86AO5tO902JZFXzHtNS8vlL3
 G5NQfF0dzdqHepHJtEqyVe7BFo25vlv809gdKe96+i5EVrrOoSW5uphQdicdBKokpv9E
 aGGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKYuNDh68FQ+KZ6RUUOESxRFleKcXgF8nPsg76QoTpheiOdLEdFK74lvXzIV6HcUVEMs6fAt/VXdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxzqpd+WKHZobfAVawBqKXsZTnHPzB+0L86plPdeExgNCTZyBgl
 yxH/KVOci2qo6bPIo/ygoDbQ433zU/MzJUesG8X8wMe7nXqyhe1X
X-Google-Smtp-Source: AGHT+IH8/p+04BfrJXSaCxwKTnTJcsz63gHT8daKI2ZKAyHVF0aeARbyLjNtxUWoElROY9FmJQ+tBw==
X-Received: by 2002:a05:600c:1c24:b0:427:9a8f:9717 with SMTP id
 5b1f17b1804b1-429ed620183mr82675765e9.0.1724066120138; 
 Mon, 19 Aug 2024 04:15:20 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-429ed784171sm105623845e9.38.2024.08.19.04.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 04:15:19 -0700 (PDT)
Date: Mon, 19 Aug 2024 13:15:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com,
 linux-arm-kernel@lists.infradead.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
Message-ID: <l6t47glpxscvbr6rsq67alwpn6mcltjnxrnr3xs4qa3slqezrr@zp6a43hiwq7l>
References: <20240819092037.110260-1-hpchen0nvt@gmail.com>
 <20240819092037.110260-2-hpchen0nvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819092037.110260-2-hpchen0nvt@gmail.com>
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

On Mon, Aug 19, 2024 at 09:20:36AM +0000, Hui-Ping Chen wrote:
> Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.
> 
> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
> ---
>  .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

