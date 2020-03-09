Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E2F17EA10
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 21:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AA76E575;
	Mon,  9 Mar 2020 20:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB6D6E575
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 20:32:45 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id f21so10946625otp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 13:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TPaozqX6hcrQl8MvSCKkCToz6ciR60p3BFFfuKRb91M=;
 b=LY/qydvUkbZXZXQ51IIHeH8Kr2woqUhglL5koRoXyk2o41RtvCA5jX2d7NGhl9ETuz
 iN0jtmsp1qzt640FdgEYB6FvAYARp8bOTLzgTNt2BdYSILEwOa0jEnFCgbBBKjQoyr3T
 QAhnG3KrNfsOkKZB+P8YjsOZo9HD4Q6a/eb176NcckxplTPGNyB1BwysRu2kGeNK2Hzy
 5mxJeIOUr8XbstGXmiVi7PjJiYoYr31FiMtTnbKQvcKBRk6DhPSAbi8jb6mqRDODMHOM
 6kpMjAl2zcB7JlWlatWFp2/70nrVNRyub6xj852+mJfmjJDYuTC07EnvWrLVERlFAoZ2
 mUOw==
X-Gm-Message-State: ANhLgQ1vulV/WXp1cW6p+4XZPAC/GIqIyPuMMFB1tyvZrLyV/rY2Q+YH
 bZMDaG5vpRjLvoSY0f/itWY4Vl8=
X-Google-Smtp-Source: ADFU+vsR/WR3wizvIH1E4Drwx3TUV8dEzHnollfDTSSj6qrdLWlT3UkvH/z3CQ6DeACwVFzb8TLSTQ==
X-Received: by 2002:a9d:6654:: with SMTP id q20mr1223294otm.180.1583785964227; 
 Mon, 09 Mar 2020 13:32:44 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m15sm15202144otl.20.2020.03.09.13.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 13:32:43 -0700 (PDT)
Received: (nullmailer pid 15518 invoked by uid 1000);
 Mon, 09 Mar 2020 20:32:42 -0000
Date: Mon, 9 Mar 2020 15:32:42 -0500
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [RESEND PATCH v7] dt-bindings: display: Add idk-2121wr binding
Message-ID: <20200309203242.GA14486@bogus>
References: <20200306152031.14212-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200306152031.14212-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 Chris.Paterson2@renesas.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  6 Mar 2020 15:20:31 +0000, Lad Prabhakar wrote:
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
> Apologies for flooding in I missed to add the ML email-ids for the earlier
> version so resending it.
> 
> Hi All,
> 
> This patch is part of series [1] ("Add dual-LVDS panel support to EK874),
> all the patches have been accepted from it except this one. I have fixed
> Rob's comments in this version of the patch.
> 
> [1] https://patchwork.kernel.org/cover/11297589/
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
>  .../display/panel/advantech,idk-2121wr.yaml        | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property

See https://patchwork.ozlabs.org/patch/1250384
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
