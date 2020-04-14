Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4E71A8920
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167F16E40A;
	Tue, 14 Apr 2020 18:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3E96E40A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:21:08 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id 8so1046676oiy.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=C3XC4lka+6lPx/IJaKXJqbBCR05aTe7VCHCfbQMTeSo=;
 b=m1KuEmrrAiu6Um71l3wt7aA3znfT37zEV6KBKDx01ZsQBTbjx6UWt8satu3QuKQzaC
 VTD9usWk/LSM9VC9Nn2FX4o74uf497yAQlXWNLj40zAv8+mkvt+tVmkLVWIT1cJDkLsd
 gac1PAxC5Hb9aQuSCeJzYcJSGHeAKM9x1AMRrd8JgRHzN3gnNMKNlv2YWKCrN7vhAX78
 Ciz+9S9qJ3C1/dJpDFZPcdc6xGCLABtO8HrGvq4+z90Q0exNcyMpK/82cJUdSEOERWuz
 U9kI8tsPGA7jNvNUQ7y1DnpfpIJBYGEWq9bGXJOhRLoCXhMoTnbtQe/tGAoC06enXTzE
 i01A==
X-Gm-Message-State: AGi0PuaUZ3gQB3jfY5C9z1WZnvccP9GeX1SNwGdLS2ZbBEJd538rUTwu
 TkSXddME1Okn1lO+b1H1gdnvU1E=
X-Google-Smtp-Source: APiQypKGoXdQXTffNoeAEhi8FQ34A34jOLZSNxBrDyNAdbcppMHyC9UJ3RJJV/wqdeM2qxDOej2A6w==
X-Received: by 2002:aca:682:: with SMTP id 124mr16665721oig.69.1586888468143; 
 Tue, 14 Apr 2020 11:21:08 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v21sm5655243oic.4.2020.04.14.11.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:21:07 -0700 (PDT)
Received: (nullmailer pid 934 invoked by uid 1000);
 Tue, 14 Apr 2020 18:21:06 -0000
Date: Tue, 14 Apr 2020 13:21:06 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 02/36] dt-bindings: display: look for dsi* nodes in
 dsi-controller
Message-ID: <20200414182106.GA867@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-3-sam@ravnborg.org>
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

On Wed,  8 Apr 2020 21:50:35 +0200, Sam Ravnborg wrote:
> Rob wrote:
> 
>     Uhhh, it's looking for dsi-controller(@.*)? which is not the common
>     case found in dts files. We should fix that to dsi(@.*)?.
> 
> See: https://lore.kernel.org/dri-devel/20200319032222.GK29911@bogus/
> 
> Fix it.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/dsi-controller.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
