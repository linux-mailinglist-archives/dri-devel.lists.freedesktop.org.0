Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A911A89C4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FDD6E25E;
	Tue, 14 Apr 2020 18:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B276E25E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:38:43 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id j26so502098ots.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DJ6qutt9QAJXdSjtS7AiyWEiRTP/1mJ7eO7lJ6/te3M=;
 b=S4lcRh4eGOxbTeBDXvVo91sN1ULkpRors+TmYTdY/O2uoVLRRtUvyfNYAK5+aOYg2e
 PXLRZdTLLustprvj8mJEmwV8UdwrFmbjgc2yhsz23wm+txT8VzLaA0kpUBacmQUMfBEY
 GZfqMPL0bPo/nmMxBHVKQDNvhGGuTsQrUMDkFQ9JWheoVM9TCqW95KEKDO3Mog7KCWC/
 /7lCM26T8+gJmL9Omm8K/4CFSVkNGjvHZbK779OdAmyrEXQ5QQrfV4Dg1HI2+uSzjr1d
 GtZogpF8RjM9oHY/RIcONY38CHabMqnOpBgySKrd11p3++TsZhXQAmxn0TSlvMg7fHkt
 JRlQ==
X-Gm-Message-State: AGi0PuYSOb/apehit1C0XFwl6Z7n8UF22GlzPYZWWSxWEeDyfnhDYBU7
 zoKXG/p4CsJnAsAjipTRPg==
X-Google-Smtp-Source: APiQypJF2iwEBUqeei9FlSDy4sc9fA3N7uV/9740Mn9KpGuZHZ9c2PF8pIusgP7rg//TsoPHjFw7vA==
X-Received: by 2002:a9d:134:: with SMTP id 49mr11644354otu.57.1586889522906;
 Tue, 14 Apr 2020 11:38:42 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k132sm5817615oih.9.2020.04.14.11.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:38:42 -0700 (PDT)
Received: (nullmailer pid 18913 invoked by uid 1000);
 Tue, 14 Apr 2020 18:38:41 -0000
Date: Tue, 14 Apr 2020 13:38:41 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 20/36] dt-bindings: display: convert samsung AMOLED to
 DT Schema
Message-ID: <20200414183841.GA18856@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-21-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-21-sam@ravnborg.org>
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
 Sam Ravnborg <sam@ravnborg.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:53 +0200, Sam Ravnborg wrote:
> For samsung there was two AMOLED panels with the same
> description.
> Collect them in one binding file.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../panel/samsung,amoled-mipi-dsi.yaml        | 65 +++++++++++++++++++
>  .../display/panel/samsung,s6e3ha2.txt         | 31 ---------
>  .../display/panel/samsung,s6e63j0x03.txt      | 24 -------
>  3 files changed, 65 insertions(+), 55 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,amoled-mipi-dsi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63j0x03.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
