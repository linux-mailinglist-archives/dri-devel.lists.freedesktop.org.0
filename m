Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4B02CDA02
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 16:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D164389AAD;
	Thu,  3 Dec 2020 15:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB11489AAD
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 15:19:38 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g14so2215648wrm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 07:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dl8zBZkg6JdSXjH6UWCp8wv6MHNMbG1tRQFCo81eknI=;
 b=JSEC55hR5HyEaDChw/FHOXSr4pqGik1T4r8rTy3lJ0HikxL5J2SQq2OLKQ46d68Xl5
 6+Zs5Nv6tQdr1Qbew9TE1q4TQU38bRi/WGNlOIAQy5+kH5B4XlYLhOWUOi/aomIOpP14
 YbGMEzIxAxdnXjrlFq69FE0zwCQQMzBdD7L73B1pBbjgJCRa2DYPQStj1IrRKJ09wWqI
 YlC7yJBBNRJHAcGslOFJ6aIox/uRq7ncwxloasCujx1TJm9+a+iFREhUw9R2QPIDLUdF
 TLfpNoAAD0fOMa/fQygEGVwPlr+PbhzmnXPzORjvt+bFqO84xu5x+8Ec6ZqFc5BQERsV
 tu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dl8zBZkg6JdSXjH6UWCp8wv6MHNMbG1tRQFCo81eknI=;
 b=eepPhfw+TzPo72yWpLvNULhOUuXk9NnSSWe95RW2OcYETnMmDqZpntmd2Id0JkMZKF
 BKV5J3gpf0VCZjeDERXLOTP0Je64lqO8boP4+h5lOG/xiM+UbP3YewNrpeGUBdeBmxGq
 9q53MZAq66CqRuEvg/chwnc6pJ/m1iBn+uvbTyWm6EreQLVUufAu+Z5s72JMEgUD6wPA
 4yBPAR44SoizPrH4N1ewoWKOpnCioaMlSNHtUFnWCiA/wbweWUI56S4fRB/EpD35OWoA
 Tw7n38NwNrDH+QsZ49fcxCYZzx63sVA19ZQ/HhuAXdKrusHAQ3MXlPc7pd9kc0MOHXfV
 GaaA==
X-Gm-Message-State: AOAM5324s94ks48mWb4GIJWD5GMaWDQE8Xqe053UR+RtREotzOk+4Oi+
 b61OApk5uSc8978R+lPzVapp68HZj0jfBwwurhRlWIcCiaQ=
X-Google-Smtp-Source: ABdhPJzl91Kl3UpES+WVpsftOIdqz1APGypMcKLzOAwj0H4u0CbY4lgmlf0+ZNGsXU6CUXwcJ8Bb67nYa8Rf52MJWKI=
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr4368026wrw.42.1607008777513; 
 Thu, 03 Dec 2020 07:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20201203132543.861591-1-maxime@cerno.tech>
In-Reply-To: <20201203132543.861591-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 3 Dec 2020 15:19:15 +0000
Message-ID: <CAPY8ntBF8fDiOXRexkd_BkscuifBO7T0+_iVJ3S7B030gOBceQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm/vc4: DSI improvements and BCM2711 support
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 3 Dec 2020 at 13:25, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> Here's a series adding support for the DSI0 controller in the BCM2835 and the
> DSI1 controller found in the BCM2711.
>
> Let me know what you think,
> Maxime

Thanks for that series - your using a variant structure is much
cleaner than the hack I had.

For those that I didn't author (ie 1, 3, and 4)
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Dave Stevenson (5):
>   drm/vc4: dsi: Correct DSI register definition
>   drm/vc4: dsi: Add support for DSI0
>   dt-bindings: Add compatible for BCM2711 DSI1
>   drm/vc4: dsi: Add configuration for BCM2711 DSI1
>   ARM: dts: bcm2711: Use compatible string for BCM2711 DSI1
>
> Maxime Ripard (3):
>   drm/vc4: drv: Remove the DSI pointer in vc4_drv
>   drm/vc4: dsi: Use snprintf for the PHY clocks instead of an array
>   drm/vc4: dsi: Introduce a variant structure
>
>  .../bindings/display/brcm,bcm2835-dsi0.yaml   |   1 +
>  arch/arm/boot/dts/bcm2711.dtsi                |   1 +
>  drivers/gpu/drm/vc4/vc4_drv.h                 |   1 -
>  drivers/gpu/drm/vc4/vc4_dsi.c                 | 111 ++++++++++--------
>  4 files changed, 67 insertions(+), 47 deletions(-)
>
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
