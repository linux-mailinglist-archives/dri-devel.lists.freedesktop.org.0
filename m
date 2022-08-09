Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60258E0F2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 22:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF36113FA9;
	Tue,  9 Aug 2022 20:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388CB91632
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 20:19:59 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id h22so9706151qta.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 13:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Zskxu9RM9shgea48JfI0eSWUYjVUqMyTAyaPDWwmlU0=;
 b=kFCwD+DpUN0EwFzR28qExjm2BnXYAC8giMKPpQfMl0bR1MUO5ERvIFY7F/bw4Ykm+l
 MgDD5sM/XrtEuYBjftTOyPgB71BHKViJJ2qjokw6OVghWl+blrHCDC6cajDrFX634lxI
 4M9gkhHZq4hEoOnOK8gF2wphr3psgAUFMcEv26Qiq6CeAjyZGdKFhT4iJSER3bun/ZID
 YoMxZOBCJzgvS4aVOy1vA91FGzUx62vayQrCLliF/D6Ve4LmDvNUUMm5a3HhrVJbqRuJ
 q+wQU3s3UXvFWLm4KqnHEz2BsAGa/DhBvNaIvSdA1IQVtSXbyHaSw6jWMyuGnogzGdz8
 rz0w==
X-Gm-Message-State: ACgBeo3dVFuOgM0D3GSfeT8ZoFWomXJWuai32kO4W8QSgXkQKf3A+QIm
 ILegNX/UmIZMM0YHRtFricUHDl6hEQ==
X-Google-Smtp-Source: AA6agR7JlRVRwfkkAMUq/uYFIjTvCyOZ3vlkrOzYv/HhQul/99ZRx/tch/zjFCjHPfvagIqDVoDy8w==
X-Received: by 2002:a05:6638:14d5:b0:33f:8a96:c59c with SMTP id
 l21-20020a05663814d500b0033f8a96c59cmr11480702jak.254.1660076387557; 
 Tue, 09 Aug 2022 13:19:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a5d9ed7000000b00684a65f0c36sm1525213ioe.45.2022.08.09.13.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 13:19:47 -0700 (PDT)
Received: (nullmailer pid 2326180 invoked by uid 1000);
 Tue, 09 Aug 2022 20:19:45 -0000
Date: Tue, 9 Aug 2022 14:19:45 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/3] dt-bindings: display: simple-framebuffer: Drop
 Bartlomiej Zolnierkiewicz
Message-ID: <20220809201945.GA2326091-robh@kernel.org>
References: <20220808101526.46556-1-krzysztof.kozlowski@linaro.org>
 <20220808101526.46556-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808101526.46556-3-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 08 Aug 2022 13:15:26 +0300, Krzysztof Kozlowski wrote:
> Bartlomiej's Samsung email address is not working since around last
> year and there was no follow up patch take over of the drivers, so drop
> the email from maintainers.
> 
> Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I assume that if other change was preferred, there was quite enough of
> time to send a patch for this. :)
> ---
>  .../devicetree/bindings/display/simple-framebuffer.yaml          | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!
