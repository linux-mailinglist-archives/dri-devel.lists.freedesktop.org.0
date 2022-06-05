Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DB653DC70
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 17:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9C111A236;
	Sun,  5 Jun 2022 15:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C0211A236
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 15:08:26 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id r206so16691408oib.8
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 08:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O/5Kk8YxDjFostjbu27e4DNO545UqELI2BQbep59s2c=;
 b=kRKl4ogCajrgbsAm8ZjXAi+SeS/BSoHZTXF5zfKfIJOW7kFfS1xh2cmTW9fvtrcoyY
 1jq4lCB8Wtg32Ricy2g9t1LIyY+bsdVFJNfAgGJTKB8jBfQnwfnOGUII+TZO3tPVRlYq
 lDpt3BZ8bEjwPhejPzMCWe9ivJgCKTnscFKoNZE01Ul/FA4KKptXy8uQuPEFVBfp5JNT
 +HqXAh8HxSGHHU1akAD/SbwSmQvdyBR1fqywlFy0qBpVAbHej1s83Jz7/5vGLPDJm6S3
 st/jv47fxBjBLg7uo0DFJ2ArXwNeBd9SxKJ6D1/q3UlO56sjR7Dpt4v4ArR3ag6ElsEF
 Q9iw==
X-Gm-Message-State: AOAM533Vdp+VrrGHvdiBmhBPb7qpUCYH2DSmJI+jTUBJx6VUpRlYcTPu
 q8yslvvaYljrAAv/gUzQuA==
X-Google-Smtp-Source: ABdhPJx0T/nvzT6nuhRLT97FJIW+iCS0LZ2al+osTrqDlbdxxKFzs9RA6AGcv/KMr5AHyyry1BS3pA==
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr8305390oil.193.1654441705815; 
 Sun, 05 Jun 2022 08:08:25 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:20d2:7c7e:bed3:ffa4:df1c:4ad2])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a0568302a0e00b006060322127bsm6312321otu.75.2022.06.05.08.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 08:08:25 -0700 (PDT)
Received: (nullmailer pid 3508795 invoked by uid 1000);
 Sun, 05 Jun 2022 15:08:23 -0000
Date: Sun, 5 Jun 2022 10:08:23 -0500
From: Rob Herring <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: add EDT ETML0700Y5DHA
 panel
Message-ID: <20220605150823.GA3508729-robh@kernel.org>
References: <20220530122407.918874-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530122407.918874-1-m.felsch@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 May 2022 14:24:06 +0200, Marco Felsch wrote:
> Add binding for the Emerging Display Technology ETML0700Y5DHA panel.
> It is a 7" WSVGA (1024x600) TFT LCD panel with:
>  - LVDS data interface,
>  - backlight and
>  - capacitive touch.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
