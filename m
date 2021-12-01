Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A495465A04
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 00:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F5A6E933;
	Wed,  1 Dec 2021 23:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28C96E933
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 23:50:39 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id bk14so52005952oib.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 15:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0IBjqdZEeeg77iPYkDZoFpBZRuuv2qtLrZudT3FLe2I=;
 b=p1B63y4t0Z9rIlLxIKiwZ2OXP/kM3C/YFyMm/FZS7AunoAaXOJL9qxusymwwkB3EH4
 TvFEF2MXOWMULxi0k3FCrtedkhtXcCkgi+LCrBf1kmVZgtpHErAunVuhFvuv/KHS/aPf
 reBUDeLzsyNQ6AvH92Bv09PLk47LHs196qmnYce3lI8KZ1zaOZRoM6neAtox+Z0ayNpb
 lu9Jsoo6vJDn2KG71HHtr73z9MiRCRkOKqRQhKIEOvAr1DrLubhvGhKsudj/sWZj4fs6
 6Yb9OVK6XmT6D/m1pFwMT+RRUGI2ibioOo2T5WotTME6XOOIKDk997dwlcZPS/rellh7
 H1lg==
X-Gm-Message-State: AOAM5317visPsW3B7gG5UH6aZT0wSK2E5b0dSgiydbCsTloEKfRKNv0x
 8kf0CHWDZ+Sn5bPhvyYfHw==
X-Google-Smtp-Source: ABdhPJwn2VLKRH8+XzlklXlXHqPfdqGlRUdJfpAK+ZeM72wicy129S30tZtgMgot+gs2OS7mx1lWPg==
X-Received: by 2002:a54:4019:: with SMTP id x25mr1569020oie.116.1638402639199; 
 Wed, 01 Dec 2021 15:50:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bh12sm648367oib.25.2021.12.01.15.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 15:50:38 -0800 (PST)
Received: (nullmailer pid 3242597 invoked by uid 1000);
 Wed, 01 Dec 2021 23:50:37 -0000
Date: Wed, 1 Dec 2021 17:50:37 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 03/20] ASoC: dt-bindings: tegra20-i2s: Document new
 nvidia,fixed-parent-rate property
Message-ID: <YagKTc61evfbvhk4@robh.at.kernel.org>
References: <20211126161807.15776-1-digetx@gmail.com>
 <20211126161807.15776-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126161807.15776-4-digetx@gmail.com>
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
Cc: Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Nov 2021 19:17:50 +0300, Dmitry Osipenko wrote:
> Document new nvidia,fixed-parent-rate property which instructs that this
> board wants parent clock to stay at a fixed rate. It allows to prevent
> conflicts between audio components that share same parent PLL. For
> instance, this property allows to have HDMI audio, speaker and headphones
> in the system playing audio simultaneously, which is a common pattern for
> consumer devices.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
