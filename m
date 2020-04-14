Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E110E1A8959
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD6F889A5;
	Tue, 14 Apr 2020 18:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEAB889A5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:27:00 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id m2so714479otr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HczkAF96PjV21rBKVlO4yLKLiFnAi9GZ2pzwLk82GEw=;
 b=SeMnq171RpuNW7DjN/P+iZIclQ7mMItGPQ2sAyBeQqG7znESIbQuDheUkF+D0YZqGP
 4kts5+G+SzzWBtZq2p6HigSJ67X8jBrbYnz3XE2ZLE3JpkM0y/t4om9LOgdvcDzlj3MN
 sWDfMXQpbPKDYyrRj5SkpoQGU6OxbNx6skCy99qN5hnc3C6DEGREo/+gJhlFMPOXu4n5
 TWKbghTCjYGmz/AyF8LJTZTbjWdQqQG+G5fTvp+YA9HUIWqtAlUY+4fUzxTqKHTDT2uj
 qkTFMzh+dbPm6KWjoAimicsi4icEWI7k27F+tTYbeghICwtdLVIZRpgUR7ZrfdyveEyu
 RtWw==
X-Gm-Message-State: AGi0PuaMRdlPhsgyDhdIuXkcOZ8R7HgY7NvFY5+nvrigw/qFZm1WY0TC
 +FOe79zX+jIvT3WMfWFcKQ==
X-Google-Smtp-Source: APiQypInKn60D+JDi5ybryOxLFtnPcaRj9SBi73UtB6B/bEM0EeljKhTMwrxPAOXMnSm0qL8y3soPg==
X-Received: by 2002:a05:6830:17ca:: with SMTP id
 p10mr20146456ota.165.1586888819582; 
 Tue, 14 Apr 2020 11:26:59 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k21sm419642otp.32.2020.04.14.11.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:26:59 -0700 (PDT)
Received: (nullmailer pid 20082 invoked by uid 1000);
 Tue, 14 Apr 2020 18:26:58 -0000
Date: Tue, 14 Apr 2020 13:26:58 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 07/36] dt-bindings: display: convert ilitek, ili9322 to
 DT Schema
Message-ID: <20200414182658.GA19812@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-8-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-8-sam@ravnborg.org>
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

On Wed,  8 Apr 2020 21:50:40 +0200, Sam Ravnborg wrote:
> The .txt binding explains:
> 
> "
>     The following optional properties only apply to
>     RGB and YUV input modes and
>     can be omitted for BT.656 input modes:
> "
> 
> This constraint is not implmented in the DT Schema.
> 
> The original binding from the .txt file referenced
> properties that is included in panel-timing.yaml.
> 
> The properties in question are:
>   - pixelclk-active
>   - de-active
>   - hsync-active
>   - vsync-active
> 
> These properties was dropped in the conversion as they are not relevant.
> 
> v2:
>   - drop properties from panel-timing (Linus)
>   - drop use of spi-slave.yaml (Maxime)
>   - introduce unevaluatedProperties (Maxime)
>   - dropped unused properties (Linus)
>   - delete stray spaces
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/ilitek,ili9322.txt | 49 -------------
>  .../display/panel/ilitek,ili9322.yaml         | 71 +++++++++++++++++++
>  2 files changed, 71 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
