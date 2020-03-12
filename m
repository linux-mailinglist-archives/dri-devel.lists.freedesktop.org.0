Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21391183440
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 16:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D3B6EAE2;
	Thu, 12 Mar 2020 15:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7A16EAE2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 15:16:38 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id p125so5792984oif.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 08:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2nVd6kVQeC4fmgj6PS1Xm+z10xV+uawDTTNUDTAtSz0=;
 b=c9o5STg3q7slHYVJv7f+uFsMy6jtZ7Y88XR/Y2JQ6Czniv0oDMJNtITtpUxqUkRzue
 hQNpwNtnz/e5OfoTC8OuhFL+g+P01jSGhxrfBnltnXiKjdZs/JoOdcrbdA5G45kH21TA
 vsArmeC4PsTqzJ1jqJDaIZkkhTRBtIRna3AP5yrhPU4yYbk2Vjjwzq7haXmGcqOGNdtI
 xC+ne1NEIq0nm2KUfX4WpN4yf10+AzZqidx7Vdi8fYCZoSqiA0A+kNMPXbSnM33pZmKG
 LBb7FA8UfEXmz3X4rfMJ5wjzBCZGNRyUBUp2xj2LN7oY0DuLyfJKav+1cWDjo1m2Qhim
 s+LQ==
X-Gm-Message-State: ANhLgQ22M+60n5Ruz4YJAVJGkI5EbRuothvHKF+GCOXRs9Q2Dvj6qg5M
 3WUTy18Uw9WdX0Vq1cuSTA==
X-Google-Smtp-Source: ADFU+vtpLTSI6Asr97Z+Fb8vk1osZZ4RtTebCFker8BuzujVU9OrD/qT5bTh+3jkwn/IuxGrg+rn8Q==
X-Received: by 2002:a05:6808:651:: with SMTP id
 z17mr2882892oih.160.1584026197598; 
 Thu, 12 Mar 2020 08:16:37 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r20sm4604114oic.56.2020.03.12.08.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 08:16:36 -0700 (PDT)
Received: (nullmailer pid 6272 invoked by uid 1000);
 Thu, 12 Mar 2020 15:16:35 -0000
Date: Thu, 12 Mar 2020 10:16:35 -0500
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v8] dt-bindings: display: Add idk-2121wr binding
Message-ID: <20200312151635.GA5799@bogus>
References: <1583869169-1006-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583869169-1006-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 Mar 2020 19:39:29 +0000, Lad Prabhakar wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Add binding for the idk-2121wr LVDS panel from Advantech.
> 
> Some panel-specific documentation can be found here:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> 
> Hi All,
> This patch is part of series [1] ("Add dual-LVDS panel support to EK874),
> all the patches have been accepted from it except this one. I have fixed
> Rob's comments in this version of the patch.
> 
> [1] https://patchwork.kernel.org/cover/11297589/
> 
> V7->8
>  * Dropped ref to lvds.yaml, since the panel a dual channel LVDS, as a
>    result the root port is called as ports instead of port and the child
>    node port@0 and port@1 are used for even and odd pixels, hence binding
>    has required property as ports instead of port.
> 
> v6->7
>  * Added reference to lvds.yaml
>  * Changed maintainer to myself
>  * Switched to dual license
>  * Dropped required properties except for ports as rest are already listed
>    in lvds.panel
>  * Dropped Reviewed-by tag of Laurent, due to the changes made it might not
>    be valid.
> 
> v5->v6:
>  * No change
> 
> v4->v5:
> * No change
> 
> v3->v4:
> * Absorbed patch "dt-bindings: display: Add bindings for LVDS
>   bus-timings"
> * Big restructuring after Rob's and Laurent's comments
> 
> v2->v3:
> * New patch
> 
>  .../display/panel/advantech,idk-2121wr.yaml        | 122 +++++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property

See https://patchwork.ozlabs.org/patch/1252386
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
