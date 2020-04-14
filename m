Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B82901A8943
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D146E506;
	Tue, 14 Apr 2020 18:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18B46E506
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:23:48 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id g14so627303otg.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vE8vmZI0BB9tFkvbTeYrvpIJ3QhmUUq6yg01errvdiI=;
 b=Gso8U9hgNoMG78bJEXD4gj/BvO/bVcFhoehc+qfAn5EyaZ/lFM5M23KTezZnDXccZ1
 9qiFFd8HauOhta72iWY/+v2VruD5ikk+Ay2GgIcnaRjElqbfreP63Ji8+dLaq2739GKe
 5uVe6E0uZLHH9GfBkGNnFZCjWkQ8y+1pizdz3L4mGW0TveRLvHDOPV566GDoF4sPG1Fs
 +ujzba6U4uWDIYc2zKCIN2mdYNAPFV+uFwLpPu8rWiUmigJKrka1KbX1m1RlNn0FZKfa
 2LT6e7G5ddyLIKrlZIBzdiCwclqnbZbJyv8oaOdyja1XXOOKi4A4Su9ael2+D7ttXbF/
 JSFg==
X-Gm-Message-State: AGi0Pub/E9LBF3d9QSM4mYOJEPAiFg8N6iW5osupGbyUBWlb6PY3KbSF
 lQdT/Ujd0jjYIEwxfw4iYw==
X-Google-Smtp-Source: APiQypIxJTGIaG1krNnZWqAF9NmqWlxqIU/qCQ1d0ZpuL4DOEynXczR+G/xrRg6Cpl5ZzN0+IvkwEA==
X-Received: by 2002:a9d:6b13:: with SMTP id g19mr9443493otp.249.1586888627995; 
 Tue, 14 Apr 2020 11:23:47 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q12sm5656192otn.43.2020.04.14.11.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:23:47 -0700 (PDT)
Received: (nullmailer pid 10828 invoked by uid 1000);
 Tue, 14 Apr 2020 18:23:46 -0000
Date: Tue, 14 Apr 2020 13:23:46 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 05/36] dt-bindings: display: convert
 arm,versatile-tft-panel to DT Schema
Message-ID: <20200414182346.GA10724@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-6-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:38 +0200, Sam Ravnborg wrote:
> v2:
>   - Fix entry in MAINTAINERS
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/arm,versatile-tft-panel.txt | 31 -----------
>  .../panel/arm,versatile-tft-panel.yaml        | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 52 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
