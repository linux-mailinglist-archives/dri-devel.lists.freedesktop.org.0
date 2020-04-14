Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 220571A8A3B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318BF6E500;
	Tue, 14 Apr 2020 18:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6696E500
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:51:54 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id o25so11334231oic.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jPaGaQsxKuZGck310qvcXoh0JaiZD966zdpTeNQ7MWo=;
 b=GpgUVTKGGJDlrps8Bdr5JCGwOl1/SxvFIDmI6x330U1yiV+YmT5x/XL++gXyZhITJf
 D8b06b7v2NjRd1g4JLUih/vDLNXYpiXHPFUerV2eZBV22YtgAoVsu0HYoJ/aLK/vNSh6
 a63+qIskwTteRHu0VQEjKa/MA6Cx6U7JWgseBBA2+jfSC8zzJ2sUgWA464RuUrxZX1w1
 fmt+4aWS5BuJMy6azuD4OSe5+5zi8ZlyEBDaAzd5ISyXElkxw3siHlK4xweaUiM22J+p
 fo0n10u9RQ/bLptwZAqLQr5U86m37FraKqQ7xLDr8mFoD1NIJr0cf/vpgheBZkrqm1wg
 SDRA==
X-Gm-Message-State: AGi0PuZEo3nsKNK1T+pEMglBvakLDCr2/DRtl01hCEBG5oGfPoRWt9sL
 06GX3LDxzuoYkED6QkXi04LRbl0=
X-Google-Smtp-Source: APiQypJKmFuJ3x8Jb9ughPgLOGIE8fGBqgK5oPFEQWXlY8sIrOH/jasemv2QDNE2LKOv+i5Ar1Aq7g==
X-Received: by 2002:aca:ecd7:: with SMTP id
 k206mr16411237oih.113.1586890313525; 
 Tue, 14 Apr 2020 11:51:53 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i26sm5887124otr.18.2020.04.14.11.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:51:52 -0700 (PDT)
Received: (nullmailer pid 5673 invoked by uid 1000);
 Tue, 14 Apr 2020 18:51:51 -0000
Date: Tue, 14 Apr 2020 13:51:51 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 25/36] dt-bindings: display: convert
 startek,startek-kd050c to DT Schema
Message-ID: <20200414185151.GA5635@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-26-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-26-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Marek Belisko <marek@goldelico.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:58 +0200, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Marek Belisko <marek@goldelico.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/startek,startek-kd050c.txt  |  4 ---
>  .../display/panel/startek,startek-kd050c.yaml | 33 +++++++++++++++++++
>  2 files changed, 33 insertions(+), 4 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
