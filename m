Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D861A89A8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2926E51C;
	Tue, 14 Apr 2020 18:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0266E51C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:34:53 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id x11so696679otp.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YaA1doZo6XeG3a/kjw3o15hxftnD9UG0Sj5L9mPEsis=;
 b=JonUAkONbD3NH/UHktUisSZ/lJC/A0o2SA/RD/P250g1THjQEaHwc9T/RHTZbMuEEk
 ra7LMaJIYn8937gddmsfOBFb/VWnSO2JtabTpl53nOrFwbxJe141sSUWubaA14841OAZ
 1Ss0JKDR6QC+S5OkFQwo4Cs3mxcdBd09bygQ1FJGfOkBB72Jnl3alv8KVe3ByJBhFoup
 KchAixoTLkNOyKox2K5Oqa8EjSfX3TJd+vAIAEeTAFO7r8/5YKp8mUTxQhpMkvVBz70h
 BvODb7RzOZ7MkG53CNP1Bt79Wdu8M6Wf2pICZiGZUTN6VOulSfCXC4QVJmaYszw3vj9k
 WzUQ==
X-Gm-Message-State: AGi0Pubue/1xvRQlxfzNGejPk1KL1VshXPmSpi/oKxZNMTYOxR2TkKPc
 KwmLJ0pAK6KA60PEwhNJM6XlEqQ=
X-Google-Smtp-Source: APiQypL6Fe1HDUNpz669SwTSzUB6G9QhuQv7sSJxBX3BK1gqEAGSUwypmrn/VxXVGSXj6DK5rQU7Hw==
X-Received: by 2002:a4a:a126:: with SMTP id i38mr19808895ool.11.1586889292391; 
 Tue, 14 Apr 2020 11:34:52 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c15sm6341423oot.23.2020.04.14.11.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:34:51 -0700 (PDT)
Received: (nullmailer pid 10111 invoked by uid 1000);
 Tue, 14 Apr 2020 18:34:51 -0000
Date: Tue, 14 Apr 2020 13:34:51 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 16/36] dt-bindings: display: convert lg,lg4573 to DT
 Schema
Message-ID: <20200414183450.GA10047@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-17-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-17-sam@ravnborg.org>
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
 dri-devel@lists.freedesktop.org, Heiko Schocher <hs@denx.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:49 +0200, Sam Ravnborg wrote:
> v2:
>   - Dropped spi-slave (Maxime)
>   - Added unevaluatedProperties (Maxime)
>   - Deleted needless compatible from example (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Heiko Schocher <hs@denx.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Heiko Schocher <hs@denx.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/lg,lg4573.txt      | 19 --------
>  .../bindings/display/panel/lg,lg4573.yaml     | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lg4573.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
