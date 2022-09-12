Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDD95B62D9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 23:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C7A10E317;
	Mon, 12 Sep 2022 21:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A9F10E321
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 21:35:52 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-11eab59db71so26919409fac.11
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 14:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=/o3x3HJJvyFzRpNNCPC85nRj+zJ3gyuFs0jeQWhGJmw=;
 b=juYaYKhrF7cl0EaKYaWZ+AS2Kstij6b2t45dYf+NYCpf1G0dMMWSYSrMvXLotkY9Px
 CBBOwsrvYqBIbOhvKXR3688Rti0rZUiUoAEve5Rs2+yFLM672o1WCzQnB6Dn62+C9/BF
 tL3igihIXZ73g7Eq6LNME/dpsWqfqItJgn3j/EW5GDiMtswOwh05xBsrhqqa8pU4wVK4
 LGMsdYOMTYfd2JNDsyeKuUHwWnqH5aE/XVFbMBfPjCNMpeqZ0wPOTXZI3tANZJAWvB4f
 4bp7UK5qMcC0agm4EWYRzAWhL3BrXNkatylqbMOhaSER9FEaEC8wyFbql5BXG5Yml7VI
 a3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=/o3x3HJJvyFzRpNNCPC85nRj+zJ3gyuFs0jeQWhGJmw=;
 b=oT/heHTf2h4UWRd6pya+XyexambhOayUdHGk8bg9tzN3nXm0ktH9DfZsSF4SBUKUWw
 WK+fdIOBWRt9cYXOHvcBVM0wH0Ry8ff2YEWSp9Gk+/LPrTxl1VROJYo4+eW9HqWFGQ3z
 mWWnYuPGAUcUrRzcw59H93jBgn6qQzJkjB/ZgG6/A3YU7K0WkD/Vx2XRTO4RlcuiudDM
 SfwdwkGQ9HI+7Ze5wKMs3CNoUvh0ap55K0o2fadcefQMl+U6U+M6IxW6LGCYd1DdHJuB
 OKgtAfC/d/pjEXGHdT60YZCVtQ9vcVIeJf0Cq0B/Gz/iXefxTBD8LaOV+kb1hKB4mKrW
 velg==
X-Gm-Message-State: ACgBeo3PrjXYLLsi1pzOQj5J215pKbW/lpnQ/8S1YHo7W2H5ODFzK1E8
 UxISBaZfM9qzVAN2UbeGjwA=
X-Google-Smtp-Source: AA6agR7OE+87SRc4MPIhGnL6cCMzVvYQe3e6nMRpyLIY5RBCxJbTrkn+IJpD7vA73ULAoKLnIkwcbg==
X-Received: by 2002:a05:6870:e413:b0:127:2f43:af44 with SMTP id
 n19-20020a056870e41300b001272f43af44mr174675oag.175.1663018551656; 
 Mon, 12 Sep 2022 14:35:51 -0700 (PDT)
Received: from wintermute.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 eq22-20020a056870a91600b0012779ba00fesm6426446oab.2.2022.09.12.14.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 14:35:51 -0700 (PDT)
Date: Mon, 12 Sep 2022 16:35:47 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v1 0/2] Revert chrontel-ch7033 byteswap order series
Message-ID: <20220912213547.GA6141@wintermute.localdomain>
References: <20220912113856.817188-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912113856.817188-1-robert.foss@linaro.org>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, airlied@linux.ie, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, dianders@chromium.org,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org, lkundrak@v3.sk,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 01:38:54PM +0200, Robert Foss wrote:
> After applying the "chrontel-ch7033: Add byteswap order option" series,
> Laurent reported an issues with the approach. Since no fix has been submitted
> for the issues outlined in time for the next kernel release, I'd like to
> revert this series for now.
> 
> Just to be clear I would very much like to see a v3 of this[1] series, where the
> issues outlined have been fixed.

I will work on a v3 soon, I just have to finish a few other things first.

That said, I'm not very familiar with what we're trying to do in an automated
fashion. In my use case I have DPI output (from an Allwinner R8 to this bridge)
which then connects via HDMI. I'm aware that we should be able to get the color
space information from the HDMI connector, correct? Is it that information I
would then need to use to set the bridge colorspace, or is it the color info
from the DPI connector I'm using?

I'm still pretty new to DRM drivers so this is mostly new to me. Thank you.

> 
> [1] https://lore.kernel.org/all/20220902153906.31000-1-macroalpha82@gmail.com/
> 
> Robert Foss (2):
>   Revert "dt-bindings: Add byteswap order to chrontel ch7033"
>   Revert "drm/bridge: ti-sn65dsi86: Implement bridge connector
>     operations for DP"
> 
>  .../display/bridge/chrontel,ch7033.yaml       | 13 ---------
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 28 -------------------
>  2 files changed, 41 deletions(-)
> 
> -- 
> 2.34.1
> 
