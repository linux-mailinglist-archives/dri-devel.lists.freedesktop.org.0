Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09C27D651
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 21:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD7F89A16;
	Tue, 29 Sep 2020 19:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
 [209.85.161.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B6489A16
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 19:00:57 +0000 (UTC)
Received: by mail-oo1-f65.google.com with SMTP id t3so1553871ook.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 12:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6sxjm/h53ZlWGhKVi/BI1snEk9zxjIfEAdpeaGtQZss=;
 b=ltw61M/PXWjqsbEHCQrTIrhiY7HKkfzQHskYxUcYLNh/sBxe5tjDQ2VVRLvMOe6vLg
 6tyaCKrS+ATaSKfbdSrFZcAYu5HusI2/cl/hLzAybWAk6tIGq+gqVEsuXGn0iqJsVzax
 z2fzgIbWRLaip9X3myDALqQma6p0X3VHGj0MZE+PG9Vh3STjxP62hyfOPjZcdAB5SLhw
 Sbwj03QjFlMXZn4TQgfVEe//Or7PBNOlP0r7C9zGB3JLuadndoHYoDXGxWVfgAWdWDN2
 Bee3nhpF5o/B1cfoAJImcQe9d6HqlJ0XSiYZd9R5uId2fi8hUINl1IdVaeKFP2pSu3v7
 NinA==
X-Gm-Message-State: AOAM530nKMtjMqAzJmi7ZdE90LxRAWsqrVgJIk5O6L2z3V8VWJBHzJTx
 YXE22p6cLh2OahAaHcTiCw==
X-Google-Smtp-Source: ABdhPJygoarE7ZwUXPOTJGxm/lFQ5wLlJdb3eJvCxODi77a6glDpIAOe4kc8T1X/FTVh57MwugQfSA==
X-Received: by 2002:a4a:d38c:: with SMTP id i12mr5643217oos.81.1601406057182; 
 Tue, 29 Sep 2020 12:00:57 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c12sm1194876otm.61.2020.09.29.12.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:00:56 -0700 (PDT)
Received: (nullmailer pid 968417 invoked by uid 1000);
 Tue, 29 Sep 2020 19:00:55 -0000
Date: Tue, 29 Sep 2020 14:00:55 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/2] drm/vc4: hdmi: Disable Wifi Frequencies
Message-ID: <20200929190055.GA962101@bogus>
References: <20200925130744.575725-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925130744.575725-1-maxime@cerno.tech>
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
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 03:07:43PM +0200, Maxime Ripard wrote:
> There's cross-talk on the RPi4 between the 2.4GHz channels used by the WiFi
> chip and some resolutions, most notably 1440p at 60Hz.
> 
> In such a case, we can either reject entirely the mode, or lower slightly
> the pixel frequency to remove the overlap. Let's go for the latter.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        |  6 ++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     | 14 +++++++++++++-
>  drivers/gpu/drm/vc4/vc4_hdmi.h                     |  8 ++++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> index 03a76729d26c..63e7fe999c0a 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> @@ -76,6 +76,12 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  raspberrypi,disable-wifi-frequencies:
> +    type: boolean
> +    description: >
> +      Should the pixel frequencies in the WiFi frequencies range be
> +      avoided?

Based on googling the issue, perhaps should be a common property?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
