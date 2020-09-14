Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DBC269496
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 20:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253676E529;
	Mon, 14 Sep 2020 18:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9E46E530
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 18:15:05 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id r25so1179963ioj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 11:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kU/2sZrLzC+Bk/ABMelZP0JnISX9KWlKhr4rvY79f84=;
 b=k5SYhDRnFr9T7frjklvXZV1lNETv16f4eFUwT1Hvjeu3yOiTPSqOao0o/xnFZyCNli
 WpCfGsA4CPb5IVzCzZT57EoB+pC1FtsZ9mwXqeDQ/TBYaW8aCPNU7uSGLPR1xkwuamvW
 CEe19Li4yXQyDFiH9ebkiF8r3/wh3/m7UIcHSFV5vi/G8nfOazoQaHAV8nLwu2kQRWsu
 k4HWM0gqK3MnlevOoMOj9hO1o7ZXJ1FDGgi3ZrAn4Lb8RMR72wZRUh2t3HSrSrzj6qly
 IWYGeD0DlBQduxX81549SPFK1XxTl/NiCCYW4b1IKX0Qzg5ugKhTsKDvSo3NpykOenot
 eB9A==
X-Gm-Message-State: AOAM530ryJYNatD9lk15Bj6gWJZdxHcjhKkyZMCtqTCKBIJayf6yG1V4
 h34D3a4GX+p5HveDVCLMxg==
X-Google-Smtp-Source: ABdhPJwVe+zJQsdM1ytThZGYPxVPTrJFjBf/Wy4kmefHouTjymFTaisrIJZzO8Pc2eYtbsGGwf8edQ==
X-Received: by 2002:a02:605c:: with SMTP id d28mr14120122jaf.12.1600107304504; 
 Mon, 14 Sep 2020 11:15:04 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m12sm7331781ilg.55.2020.09.14.11.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 11:15:03 -0700 (PDT)
Received: (nullmailer pid 4169787 invoked by uid 1000);
 Mon, 14 Sep 2020 18:15:02 -0000
Date: Mon, 14 Sep 2020 12:15:02 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 05/10] dt-bindings: connector: Convert Samsung 11-pin USB
 bindings to dtschema
Message-ID: <20200914181502.GA4169708@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-5-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-5-krzk@kernel.org>
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
Cc: alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Sylwester Nawrocki <snawrocki@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 devicetree@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Aug 2020 16:24:56 +0200, Krzysztof Kozlowski wrote:
> Add Samsung 11-pin USB-C connector into standard dtschema bindings file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../connector/samsung,usb-connector-11pin.txt | 49 -------------------
>  .../bindings/connector/usb-connector.yaml     | 44 +++++++++++++++++
>  2 files changed, 44 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/connector/samsung,usb-connector-11pin.txt
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
