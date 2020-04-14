Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B393C1A8939
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19186E171;
	Tue, 14 Apr 2020 18:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEA56E171
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:22:40 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id l21so628854otd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uZUhJk9RG4n2nHH8maECnVbbQCyLJ6sX2FQBvOd5hJM=;
 b=Rf10Q/IKBnc8JKINdEyMHFBCnl3AqZx7G3eYNSTa8zM2k2vUPxCyIgevY/InQ138Wr
 IXyxcST/VO6QZkYutWhLrl0ejc9oyFEeRkvYYKWh9zqAW+g1wNvoORtcxI+1CMKG9ggh
 R3sSlbkZnnfSofY7puRkXVuX2dCMiJ9elAkIQ5Uv2H1W+TCHfl+5Gt2+L//0pChGiwlB
 +cgcN4gmHR/Ozy3qCywS7WMF+f0Hx2mlWQZpTmriTSntk41DsOpzcs6RaCU7WAx+Ky7E
 C0CbXh4mBgWRO/F4xWo4XU4wzqPlCGcTtd7uEVrb8All+eTQ/rD0KeoS04RYQwxBsC6/
 pUCw==
X-Gm-Message-State: AGi0PuYMQttefY/foh8RN2uiNNyeOfmN/ZGsVXgIAyf/Q1qt8xqC3peo
 yprbWj+PihZL31UZRqInZA==
X-Google-Smtp-Source: APiQypIr3jipNBz31YgokkRv69rs1cbC//NOXH/M/K/yHL4tIy/S0qNCBdt9QZbOIx23krkPaZW6Lg==
X-Received: by 2002:a05:6830:2152:: with SMTP id
 r18mr20378428otd.338.1586888559597; 
 Tue, 14 Apr 2020 11:22:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p5sm154543ooa.14.2020.04.14.11.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:22:38 -0700 (PDT)
Received: (nullmailer pid 7604 invoked by uid 1000);
 Tue, 14 Apr 2020 18:22:38 -0000
Date: Tue, 14 Apr 2020 13:22:38 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 04/36] dt-bindings: display: convert samsung,s6e63m0
 to DT Schema
Message-ID: <20200414182238.GA7528@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-5-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Bakker <xc-racer2@live.ca>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:37 +0200, Sam Ravnborg wrote:
> The binding for this panel is a SPI slave.
> 
> v2:
>   - Drop use of spi-slave (Maxime)
>   - Introude unevaluatedProperties (Maxime)
>   - Drop reg entry in example (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Jonathan Bakker <xc-racer2@live.ca>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/samsung,s6e63m0.txt         | 33 ----------
>  .../display/panel/samsung,s6e63m0.yaml        | 60 +++++++++++++++++++
>  2 files changed, 60 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
