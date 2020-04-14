Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93371A8A39
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D966E52F;
	Tue, 14 Apr 2020 18:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1036E52F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:51:12 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id i27so745387ota.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=raTWEup8fmKQExYZrBvEOi6xqIpPvBYCwGUHV8bR+o4=;
 b=EvbmTZyqT//c+fT+u8Yxr7Qhe6fQuMdeEMAzhs5y4wjcg1GrLNJoVteX7dT/Smvp/Z
 oW2cWNudF0OCT+ErmxIWxo7hrXQo3xyu1ZebzjcHIas4WZJfz4U6UNC792Qivw4kzXXY
 +h4OAmDf2CCbmSZy5tHIVGZbo6RxWHHsVj69vVlaYC7FO9SUS0K4AVAK8Embrc4ITmAU
 qt46mdbb5EzEnSy680O0uClsbr8UyNBcebvA9frQmzZ3mCetSWvJInJ4hF8Dw3kDfC/W
 YNyhmSaNxxpZVoaefvkT5w1TaCfspG1Ue2lxZoMRjNw7LSOuA5FAQT9oYyBzPSpzD/8L
 erAw==
X-Gm-Message-State: AGi0PuZhcS0KKszTOKVz833pGOeqjOiFVqXciUZz5h2qK4+vNt9zysJ0
 GJ0muO+7fslAadCLynZRcw==
X-Google-Smtp-Source: APiQypImkltWUAAeN+b/so7FfCNZ37nToUuwwwDbT8q/KQPG1mg4+ZhHbz5Xr6LcVwyMthM9+X2CEw==
X-Received: by 2002:a4a:be89:: with SMTP id o9mr13383278oop.20.1586890272229; 
 Tue, 14 Apr 2020 11:51:12 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t203sm441256oib.52.2020.04.14.11.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:51:11 -0700 (PDT)
Received: (nullmailer pid 4562 invoked by uid 1000);
 Tue, 14 Apr 2020 18:51:10 -0000
Date: Tue, 14 Apr 2020 13:51:10 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 24/36] dt-bindings: display: convert toppoly panels to
 DT Schema
Message-ID: <20200414185110.GA4465@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-25-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-25-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, "H . Nikolaus Schaller" <hns@goldelico.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Marek Belisko <marek@goldelico.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:57 +0200, Sam Ravnborg wrote:
> v2:
>   - dropped use of spi-slave.yaml (Maxime)
>   - added unevaluatedProperties (Maxime)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Marek Belisko <marek@goldelico.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/tpo,td.yaml        | 65 +++++++++++++++++++
>  .../bindings/display/panel/tpo,td028ttec1.txt | 32 ---------
>  .../bindings/display/panel/tpo,td043mtea1.txt | 33 ----------
>  3 files changed, 65 insertions(+), 65 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
