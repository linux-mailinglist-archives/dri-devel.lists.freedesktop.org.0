Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CE41A899F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E9F6E519;
	Tue, 14 Apr 2020 18:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069A36E519
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:33:07 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id z17so707709oto.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CVQ1lZVJvmFaf0NT3MmNSNNJewJxKoRusuaatdtuBxY=;
 b=m6HFlVaipVLouW6Ih/pVyMFm+LzMbxKUvK1zZpGWQq3jHo43Vtk0fLKeJRk/zQW5FR
 GBAhTBsMWj80425CVtpXZfLN/MeItMVefu1P2fNzYwApvxkt4oq+vwLEmM5uq/r3SJph
 /Um5IXzQKsI75y6IJlm57m8hnWKicR/aaYyd5V2pWPJLV37hMRrvxpUYJ5yAdq+xn6zi
 c0nHDdThz6i0Ube28kq7uqJPxHwPCIVlo5j5p75fN6tKfKovlBI1xXIf2m6xBTRO11Rw
 U/gPl20YH9wnFqaJa0WBbz6ExZViqQonhL2vmyuBVH4fzFYqFUEjXoL3QLk2plcygO/D
 V6Kg==
X-Gm-Message-State: AGi0PuaYKiQNpL0E/L3BOph8vHVHkx+6YQKKOFK4KBP1XpW2SAq0YjRD
 7Ra2XeIrKkkoLRUwXvcoZ8tsBEI=
X-Google-Smtp-Source: APiQypIhAXnI56wNah9EwROjasnc8CgJq7BKcU3wY+UxZ3NLs81ZA8SST7QHeqSoYiFBQAZxO8GRYA==
X-Received: by 2002:a9d:6ad8:: with SMTP id m24mr13713732otq.272.1586889186281; 
 Tue, 14 Apr 2020 11:33:06 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l7sm5438984otj.52.2020.04.14.11.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:33:05 -0700 (PDT)
Received: (nullmailer pid 5071 invoked by uid 1000);
 Tue, 14 Apr 2020 18:33:04 -0000
Date: Tue, 14 Apr 2020 13:33:04 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 13/36] dt-bindings: display: convert
 kingdisplay,kd035g6-54nt to DT Schema
Message-ID: <20200414183304.GA5005@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-14-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-14-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:46 +0200, Sam Ravnborg wrote:
> v2:
>   - Drop use of spi-slave.yaml (Maxime)
>   - Introduce unevaluatedProperties (Maxime)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../panel/kingdisplay,kd035g6-54nt.txt        | 42 ------------
>  .../panel/kingdisplay,kd035g6-54nt.yaml       | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
