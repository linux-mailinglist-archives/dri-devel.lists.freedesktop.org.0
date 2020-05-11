Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 188CC1CE8AF
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 01:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2DE6E7EA;
	Mon, 11 May 2020 23:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAC16E811
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 23:00:50 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id a68so504289otb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 16:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R2FIzGJ36G+ksaMQBrNC7rs0zXCR6DoaIq7rGb+2bfY=;
 b=LKWZftw9+vIMmon0+tTYPsMHt8I/djIKq9eInqbqvytgWYuPXA+WLa6WFit9aTZh/T
 u0uI7N+WvP3YG1yxlsGZNPSvBFhZlJ0Jk1XzC6WDpZT/lvQcnfJP9nGCF8zRDdacnulS
 ImB6EuCsn5fN8Ra/UjST/BgYdzOczoZIlQbAi79wdcEotMHbMgg6SbR05A1n8akyEI9K
 mJQKhZcQRm0xHjlti9jeD8/WfGDNGhjz9jSLEhE4zAKTjK+Qe3kq1kcGF0nh8fM+FflK
 tYOiuf1WuTluO7uG60ztqKkiU8ke6Z8oUjRtoccX4Klbv7szQTDlppvRoCDDBy6xLwTi
 7gAw==
X-Gm-Message-State: AGi0PuZkvEW9KFB5gbJQpYHULFHdXdV6df6a+MQwSlz9V70W5lIpS7Ic
 QDlXUwFmKqheb8OXFTs/oQ==
X-Google-Smtp-Source: APiQypLIKWVpma3ZFGFIRQeE5SgL6Vd0dRhGSpaABZzl+NCkX37DvuxFgcB65JKK/JvD6gJaUgjqhw==
X-Received: by 2002:a05:6830:1613:: with SMTP id
 g19mr14466894otr.284.1589238049507; 
 Mon, 11 May 2020 16:00:49 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u197sm4933977oie.7.2020.05.11.16.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 16:00:49 -0700 (PDT)
Received: (nullmailer pid 11189 invoked by uid 1000);
 Mon, 11 May 2020 23:00:48 -0000
Date: Mon, 11 May 2020 18:00:48 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 6/8] dt-bindings: i2c: Convert i2c-jz4780.txt to YAML
Message-ID: <20200511230048.GA11123@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-6-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-6-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 Apr 2020 20:58:54 +0200, Paul Cercueil wrote:
> Convert the i2c-jz4780.txt file to ingenic,i2c.yaml.
> 
> Two things were changed in the process:
> - the clock-frequency property can now only be set to the two values
>   that can be set by the hardware;
> - the dmas and dma-names properties are now required.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/i2c/i2c-jz4780.txt    | 33 --------
>  .../devicetree/bindings/i2c/ingenic,i2c.yaml  | 83 +++++++++++++++++++
>  2 files changed, 83 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-jz4780.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
