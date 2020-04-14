Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F62A1A8A43
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7822B6E53C;
	Tue, 14 Apr 2020 18:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835D16E53C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:53:19 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id x21so5154353oic.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DnUIm0pCTMjrJlKf0PE9TFv9cjSyYhQx6LzvNIdhMAk=;
 b=nIF4upxkEayV9Q4cjXwDgb+a/vXieC4CiqO2qaRkWxb9fwAyXTinN/sBD2ezEvdmbv
 VcUXFO/L9XmzYIJhFXnDiqsS6VXMYTf0bcdM9TwIL1muoDz0c2sLsNotdHX2CmlXko6W
 OyRBXuiYCIG2rbCUiRPicEeJoDZkz/+aNx/HKguhSZxa4Rm5r2Mpu8U1dxSOJ504s217
 QsJkBEZ+rzf+4KggH76u71Dwaq2iwMu52NA+d2qoyv/thz+IO/frKL1zwjjYcdl36cQ1
 S1DMp0IX5jdTdeuv+erjDUN1Hx0fcMYXO+k7+0vcp4rb4iDXIg06uiYJj+4wlN+XImJZ
 EGOA==
X-Gm-Message-State: AGi0PuY6+ZXay58i70HpZTzPG5+TkeeA3DHg3QpAAT5Z1hVyeAfpBeon
 YnpQxTrt8EEqNAU+bGrRsg==
X-Google-Smtp-Source: APiQypJO2aj/ViwEJv6VhOEdbrE3T0CJhw4JlEHWkOQn2ENl7Wbc+x7CT6tgWq3Ota34btutjtgABQ==
X-Received: by 2002:aca:b143:: with SMTP id a64mr6140775oif.1.1586890398871;
 Tue, 14 Apr 2020 11:53:18 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v15sm6372807ook.37.2020.04.14.11.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:53:18 -0700 (PDT)
Received: (nullmailer pid 8012 invoked by uid 1000);
 Tue, 14 Apr 2020 18:53:17 -0000
Date: Tue, 14 Apr 2020 13:53:17 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 28/36] dt-bindings: display: drop unused
 simple-panel.txt
Message-ID: <20200414185317.GA7959@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-29-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-29-sam@ravnborg.org>
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

On Wed,  8 Apr 2020 21:51:01 +0200, Sam Ravnborg wrote:
> There are no more references to simple-panel.txt.
> Delete it.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  Documentation/devicetree/bindings/display/panel/simple-panel.txt | 1 -
>  1 file changed, 1 deletion(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/simple-panel.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
