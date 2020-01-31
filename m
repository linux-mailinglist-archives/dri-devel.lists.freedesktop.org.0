Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F3414EE5D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 15:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09126FB67;
	Fri, 31 Jan 2020 14:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AFF6FB67
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 14:25:14 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id c16so7401655oic.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 06:25:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CY7J+IlecaG8nz6DPJS4G/LtHnWj0sEM0OBoR5NJd0k=;
 b=VzwRHqMZUOxCnYodLOjGSTZedaQYMrfRGyW5lCWwrKKA6vQ7LHernBX7qm5R8uT09n
 BIaxP+sZXit8pMeClTUc1LlKGagCCHKy63/Al0+TyqKdHrrGruFyYG459nZ8Zu5TnCdD
 8vFg8KXa7pFM92ypXtu1rUpO44X8cgEb8/rfIqOZwMg0jT3XO/ADknW7PpfAw6qMwmF9
 ptu0bXgZnm3egODRuXfY23bb17Rwla37B8abuJoEfnZyWpl6rlh1k/qkXRLf51a5iv4Y
 PweGG0q6Gq4NY/jmf2KGg7hiMXFg8Ql+GXEnYfC6an9kCOAR7WCV3UAVBOc0WHENbZaN
 0Dew==
X-Gm-Message-State: APjAAAVf85HSGyKq+YjDKaivVvxYvO6Pfm9uqEEEqXuZmYVBb+ucOv9j
 gPPeRI8C4Kh6Z08lvS1tLA==
X-Google-Smtp-Source: APXvYqwP4UCqynTaGuEXM1pVcinpeQ7FXXcHK8C275p9lQJe8/rqR+GKzHezIpMqcGLexQe+mA4tIw==
X-Received: by 2002:a05:6808:315:: with SMTP id
 i21mr6201353oie.139.1580480713686; 
 Fri, 31 Jan 2020 06:25:13 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d131sm2709089oia.36.2020.01.31.06.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 06:25:13 -0800 (PST)
Received: (nullmailer pid 7140 invoked by uid 1000);
 Fri, 31 Jan 2020 14:25:11 -0000
Date: Fri, 31 Jan 2020 08:25:11 -0600
From: Rob Herring <robh@kernel.org>
To: michael.srba@seznam.cz
Subject: Re: [PATCH v3 1/2] dt-bindings: display/panel: add bindings for
 S6E88A0-AMS452EF01
Message-ID: <20200131142511.GA6222@bogus>
References: <20200130203555.316-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130203555.316-1-michael.srba@seznam.cz>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Michael Srba <Michael.Srba@seznam.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Jan 2020 21:35:54 +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds dts bindings for Samsung AMS452EF01 AMOLED panel, which makes
> use of their S6E88A0 controller.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
> Hi,
> I recall now that tabs cause a syntax error in yaml, should be easy to check 
> in checkpatch.pl?
> I hope there are no more embarassing oversights left.
> 
> Changes in v2: use yaml format for the binding
> Changes in v3: fix oversights too embarassing to admit here
> ---
>  .../panel/samsung,s6e88a0-ams452ef01.yaml     | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml: $id: 'http://devicetree.org/schemas/display/panel/samsung,s6e88a0-ams452ef01#' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1231597
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
