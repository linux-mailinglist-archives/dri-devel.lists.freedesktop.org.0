Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2491A8A63
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 21:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C006E550;
	Tue, 14 Apr 2020 19:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C03C6E550
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 19:00:31 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id z17so803989oto.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=diOnrilqyhMixuCeCVV10cOvtKIOS1g+rB5Tm2kZ1Ho=;
 b=FjTXF+IAworBJGtWpS6Nf5tu9r5qmnwEMw++rOJdBMgVg0z4CPSjvSV6uFED9k8Df9
 NDEJYxh6+c545j5k029cJH0HjO6Epi4UJKFxFOcUA8hsmY47kUK2TLbhiM6KeihC8j/F
 gdBsD/A0A7bmDJe24hb1ia8Alxu4DiuMqDIngIxo32TMc/9/ghipk3DWh/N7GPm2MypE
 YKmurDrOJc1AgMF94ztguYhw6q9pBw8b+KjzH1YrWnYzNUo103nakF60eLR/UhDmzALl
 3scbNU+BwXkRAV794H3aeUIyraZCM5xvF4lHxmQKb9lgBhszHOTOMqqVautUTKF67b0/
 62FQ==
X-Gm-Message-State: AGi0Puagm//WQlhNGuRv/oy6nS/98ENDRzDkgU/Eun1LJqDv5eiPQK5L
 9hUhGex6gCesGFIIe83COw==
X-Google-Smtp-Source: APiQypJqWT0BmQ3hoaaMIjIPu3yfNZz/Yfg6+ZKV5zYoLyRFpL7stRCpFQfXCEFDuKZXBohAlkUfUQ==
X-Received: by 2002:a9d:4792:: with SMTP id b18mr13376781otf.308.1586890830860; 
 Tue, 14 Apr 2020 12:00:30 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h11sm6328390ooj.17.2020.04.14.12.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 12:00:30 -0700 (PDT)
Received: (nullmailer pid 18530 invoked by uid 1000);
 Tue, 14 Apr 2020 19:00:29 -0000
Date: Tue, 14 Apr 2020 14:00:29 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 34/36] dt-bindings: display: convert
 lgphilips,lb035q02 to DT Schema
Message-ID: <20200414190029.GA18497@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-35-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-35-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:51:07 +0200, Sam Ravnborg wrote:
> v2:
>   - drop use of spi-slave.yaml (Maxime)
>   - added unevaluatedProperties (maxime)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/lgphilips,lb035q02.txt      | 33 -----------
>  .../display/panel/lgphilips,lb035q02.yaml     | 59 +++++++++++++++++++
>  2 files changed, 59 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
