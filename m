Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10641A8991
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B946D6E513;
	Tue, 14 Apr 2020 18:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406816E513
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:30:17 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k133so10585906oih.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qH846DX8SuZHIg4MDwM4mGfj6vm/yMN7Fl0H1/gCSbs=;
 b=nloQ/Vw9EFbext5hRli+7jMp4+3vRpfZ3Ym5yEYC5EmZsY0HELuIsTYWNx/sjgHQDs
 yfsE7luyEOUkRdlyYAH/whSgs0FXaYC487OX38Jithoo20VaQWpGFUOY6fvwfsNaQwuY
 Wcn6OEKTfC2b0Z20QyTOnVES8IcXH0v3E/hh8hrxslNS/i0b0pxnu7vIxoJEH6nxJktR
 7o7CC/NN4zaQ8YvwCJVK2+JsaWdkcDustABNwu199DEkP3qwKGrXys8g6s8rbNuqmdA8
 OBLRO/w4cLD1/NnHbRFxD/aM/QKq92XlS1EKsIw7dWxn4QhtxuedtU0j+4HBWNyIt9+z
 WQsA==
X-Gm-Message-State: AGi0PuYzf8Afx8cK6SLtJTxZpWIrqDykgS6Ps9RIkHijxIXkU1Zckot5
 RRAUjX7M/REbq5Eg9j3nS/ZgZjc=
X-Google-Smtp-Source: APiQypJDFx8EXF6c/4XmAxCmXZFTT5v01zGCk2LK8Zby1AxQ3UiHpf9oFhFZ5t/v3UT1FNQib8lX8g==
X-Received: by 2002:aca:488a:: with SMTP id
 v132mr16774171oia.166.1586889016479; 
 Tue, 14 Apr 2020 11:30:16 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f1sm6363852ooj.38.2020.04.14.11.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:30:15 -0700 (PDT)
Received: (nullmailer pid 29259 invoked by uid 1000);
 Tue, 14 Apr 2020 18:30:15 -0000
Date: Tue, 14 Apr 2020 13:30:15 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 10/36] dt-bindings: display: convert innolux,p097pfg
 to DT Schema
Message-ID: <20200414183015.GA29198@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-11-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-11-sam@ravnborg.org>
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
 Sam Ravnborg <sam@ravnborg.org>, Lin Huang <hl@rock-chips.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:43 +0200, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lin Huang <hl@rock-chips.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/innolux,p097pfg.txt         | 24 --------
>  .../display/panel/innolux,p097pfg.yaml        | 56 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
