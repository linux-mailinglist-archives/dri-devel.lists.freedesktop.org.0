Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8361E320D
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 00:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C1C897F0;
	Tue, 26 May 2020 22:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BEE896ED
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 22:08:12 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id f3so23847268ioj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 15:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mXe3eMhOfw8Yi0mzveU2UUdf9WbJiPX68762lf2f3m8=;
 b=aiQqJzH3csypKshEFU/st5GYfCn2xHMlmZ4/r7T94Ld/daYlHgtWnOlS4vNqyXH5Ps
 KGi67AROX+ENUfWLR+bjmtRRrv52smItRL9HHdux08nOwG0iFeBS/6GT13nBHzF0JaJ7
 YJ1AAxB4RvKkuzMn5A6ad3wldNquaeWuFy9e6BKqHte9g0kdPeQEoIfC0g32+jwzBPyz
 9w8gExXXg4PR4G0z/dix4VwrcNJtWfJoSv8CKcK1wU2EpmYbvRJfqMFR7wIv9FY++gvd
 6vZ/quWPsNOCyCLNFK/pZ6634RCUDqP1C/QjEH7CEZWSpT4IVnJ/uxSlAVHgM8YbGanS
 /exg==
X-Gm-Message-State: AOAM531CzPThmMqs4ZZvCyTNjC6QEGfoyzlHiZp0Ulr+r9cRmVdeAFLR
 9sBR6VkwTG/EEDLEtlSnsg==
X-Google-Smtp-Source: ABdhPJxua5/2ASeh+JDi3H6ENvlO5duKzfxD0bd/FxftWvnUVDU7fZZVP6RJWTWfF7tnoEbMyFvyDA==
X-Received: by 2002:a02:b782:: with SMTP id f2mr3009396jam.91.1590530891856;
 Tue, 26 May 2020 15:08:11 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id o70sm677282ild.3.2020.05.26.15.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 15:08:10 -0700 (PDT)
Received: (nullmailer pid 467130 invoked by uid 1000);
 Tue, 26 May 2020 22:08:08 -0000
Date: Tue, 26 May 2020 16:08:08 -0600
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v6 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to
 yaml
Message-ID: <20200526220808.GA467074@bogus>
References: <20200513215902.261547-1-dianders@chromium.org>
 <20200513145807.v6.2.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513145807.v6.2.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, spanda@codeaurora.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, robdclark@chromium.org,
 jeffrey.l.hugo@gmail.com, Krzysztof Kozlowski <krzk@kernel.org>,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, linux-gpio@vger.kernel.org,
 robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 jernej.skrabec@siol.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 May 2020 14:59:01 -0700, Douglas Anderson wrote:
> This moves the bindings over, based a lot on toshiba,tc358768.yaml.
> Unless there's someone known to be better, I've set the maintainer in
> the yaml as the first person to submit bindings.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> I removed Stephen's review tag on v5 since I squashed in a bunch of
> other stuff.
> 
> Changes in v6: None
> Changes in v5:
> - Squash https://lore.kernel.org/r/20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid/
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - specification => specifier.
> - power up => power.
> - Added back missing suspend-gpios.
> - data-lanes and lane-polarities are are the right place now.
> - endpoints don't need to be patternProperties.
> - Specified more details for data-lanes and lane-polarities.
> - Added old example back in, fixing bugs in it.
> - Example i2c bus is just called "i2c", not "i2c1" now.
> 
>  .../bindings/display/bridge/ti,sn65dsi86.txt  |  87 ------
>  .../bindings/display/bridge/ti,sn65dsi86.yaml | 285 ++++++++++++++++++
>  2 files changed, 285 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
