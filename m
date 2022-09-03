Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA6C5ABB9B
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 02:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B9E10E95F;
	Sat,  3 Sep 2022 00:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9066A10E960
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Sep 2022 00:18:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EEA9F6DD;
 Sat,  3 Sep 2022 02:18:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1662164323;
 bh=OT3pideVW9wQf6dzmZ7U3efQM84d+33gHRypMcDXdD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sj+q2WyfV/dW6iwDRwEOYjRu1dG0YUNB57RbWzhkhSCaqZnb9Efw1CMlKcl0dCtZb
 y1DTmPvunENcOM8zE5E0U4cwhseEb2eP9JuR8cX2e9KceUpCcUfY64ksGha+8U/rvT
 X2eYahVw/gaQJOCbuTsCHJ5kzkIiIA9uooXYUPSI=
Date: Sat, 3 Sep 2022 03:18:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH V2 0/2] chrontel-ch7033: Add byteswap order option
Message-ID: <YxKdVl6e2nB2AJvO@pendragon.ideasonboard.com>
References: <20220902153906.31000-1-macroalpha82@gmail.com>
 <CAG3jFytU6J34J5cEfLR+S=Q_dMB5x5ti_xfLMtLwThLYuJAeZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAG3jFytU6J34J5cEfLR+S=Q_dMB5x5ti_xfLMtLwThLYuJAeZw@mail.gmail.com>
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 lkundrak@v3.sk, andrzej.hajda@intel.com, robh+dt@kernel.org,
 jernej.skrabec@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Fri, Sep 02, 2022 at 06:21:50PM +0200, Robert Foss wrote:
> On Fri, 2 Sept 2022 at 17:39, Chris Morgan <macroalpha82@gmail.com> wrote:
> >
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > This series adds the ability to set the byteswap order in the chrontel
> > ch7033 driver via an optional devicetree node. This is necessary
> > because the HDMI DIP of the NTC CHIP requires a byteswap order that
> > differs from the default value of the driver.
> >
> > Changes from V1:
> >
> >  - Updated devicetree documentation to be easier to understand.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> >
> > Chris Morgan (2):
> >   dt-bindings: Add byteswap order to chrontel ch7033
> >   drm/bridge: chrontel-ch7033: Add byteswap order setting
> >
> >  .../bindings/display/bridge/chrontel,ch7033.yaml  | 13 +++++++++++++
> >  drivers/gpu/drm/bridge/chrontel-ch7033.c          | 15 +++++++++++++--
> >  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> Applied to drm-misc-next.

I've just reviewed the series, and I don't think this is right. Patch
2/2 has a small issue that could be fixed on top, but more importantly,
I don't think this belongs to DT. See the reply to 1/2.

-- 
Regards,

Laurent Pinchart
