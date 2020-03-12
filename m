Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96A718354C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 16:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82B16E21B;
	Thu, 12 Mar 2020 15:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC166E21B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 15:45:20 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id g15so6751950otr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 08:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=omZBFYa2QsjHQtBNswRRHIFur2RG8M6Zjr+ms/JBsZg=;
 b=m9FUmQtbAtJdwYWyEJHXzE0Y5/iO2DXJULpfDL5aomxebDCzg+OT7QhOcNew6H1Lsa
 DZb+OD3mDp3ywHP7xcbr0tjJ9z8AdwblgE0BoB81otlgUnOeiblugeVEzZNMurCd/kYR
 NUETv+b2P1CP37bNn4opTzUgDx8l/qDjA0ZyrEkGzrBaMbKw7IP+tp1ZX8GXmQc/1uMc
 d6DakWjUUncHPqh2PjGJkOIiVFPov8b9NuTNnargX4BREMn+CRTkM354DhTsO5YU9pTH
 dgtgyBTfopqdJAHCuYL2kdrVnYKDu1iu3T3h2j2xtXrx3Tz4RRKZFbaxPydG/8h/8m8Q
 9ZpQ==
X-Gm-Message-State: ANhLgQ2ldMZfvbIxD8YvCzR34q41jVPzZtpFDSPlbrv5tX8eLVGQO5np
 wsmpIUD9cH6SLSaaNW8AJw==
X-Google-Smtp-Source: ADFU+vuRP1xVylZgCCtabXwadQXw7mcqdokmzky4hJinvtfoqJ4Nvw8V3ns+ImZHIsyS57UPZPelDw==
X-Received: by 2002:a9d:18f:: with SMTP id e15mr6454176ote.42.1584027919060;
 Thu, 12 Mar 2020 08:45:19 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k25sm12639065otl.34.2020.03.12.08.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 08:45:18 -0700 (PDT)
Received: (nullmailer pid 17128 invoked by uid 1000);
 Thu, 12 Mar 2020 15:45:17 -0000
Date: Thu, 12 Mar 2020 10:45:17 -0500
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 2/5] dt-bindings: panel: add binding for Xingbangda
 XBD599 panel
Message-ID: <20200312154517.GB15635@bogus>
References: <20200311163329.221840-1-icenowy@aosc.io>
 <20200311163329.221840-3-icenowy@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311163329.221840-3-icenowy@aosc.io>
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Mar 2020 00:33:26 +0800, Icenowy Zheng wrote:
> Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI LCD panel.
> 
> Add its device tree binding.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../display/panel/xingbangda,xbd599.yaml      | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.example.dts:17.1-5 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1253057
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
