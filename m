Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD91C1F4963
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 00:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77716E34C;
	Tue,  9 Jun 2020 22:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E1D6E34C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 22:31:28 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id u13so18454718iol.10
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 15:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZBhOP7AY8qGsl+2qKTjU0GQAyY1lme2FBPs/pfwfrHY=;
 b=HQ33dkY+jpiKoBH2SVTK1ezLuJiOSIR8Ela4nhbDw00vkRd002V/iz9NxU8hPynW59
 dy7GS4T0R6UCXhtuvwijL8eYiSUnRdWhuvOroDBNXpBAXC+cWiSlv1PMJ6dInxj5WJOy
 HRYcdlX4RSkRoxwKL+m7KDqL933ElYt9pAKFqq/u6GRInHLo6BBXgreTfA+T2KmVn36x
 DAGwdIhFLIsDA3GOy+yDszIqxwJp3Lcf7arKlsW3CYs75a5zClqQfRUs0D367jSEKtI/
 2JasZrcwbNtU0vmeJYrZCy/GkPuizL4PlgAlLsrUQyBAugbsmDezZ4cz5hj5+8qPwrcm
 44Lw==
X-Gm-Message-State: AOAM531MGnqKFMb1kX47MQsIMa9ZRl9hRApmVZX8w00yORrlfC2iPvTh
 6kS6nBdNbhpkKMCfvXj+7A==
X-Google-Smtp-Source: ABdhPJxcqqsRWJbto+HhyUaH7RE5t0x6X83/eTTC/7UnsSHgtliRRQ67qNyyvwt/RmFuNjl1gqQbzQ==
X-Received: by 2002:a02:cd1b:: with SMTP id g27mr361030jaq.61.1591741888289;
 Tue, 09 Jun 2020 15:31:28 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id 2sm10334192ila.0.2020.06.09.15.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 15:31:27 -0700 (PDT)
Received: (nullmailer pid 1618796 invoked by uid 1000);
 Tue, 09 Jun 2020 22:31:24 -0000
Date: Tue, 9 Jun 2020 16:31:24 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 3/6] dt-bindings: panel: add Hitachi 3,5" QVGA panel
Message-ID: <20200609223124.GA1618745@bogus>
References: <20200601083309.712606-1-sam@ravnborg.org>
 <20200601083309.712606-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200601083309.712606-4-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 01 Jun 2020 10:33:06 +0200, Sam Ravnborg wrote:
> This panel is used on evaluation boards for Atmel at91sam9261 and
> at91sam6263.
> 
> The panel is named: TX09D71VM1CCA
> 
> The panel is a dumb panel that matches the panel-simple binding
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
