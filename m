Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6B841163B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 16:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025156E503;
	Mon, 20 Sep 2021 14:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66656E503
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:03:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x6so29996496wrv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 07:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=W3n8w9GMO9ZUP6NIizriYpOfVN8d8Sg4lM/F77XL2js=;
 b=0uS0NJdvqbTiA5X7oSLxPmR3qgZortNn9BwuEH/w90iK/ObZ67skV2c9PPvJ98h37e
 8zH8fn5kieIv9YOZs9+OK0rh+idSr5UE9UqURkA0L8rvXgwoncLd9ZvmWdPKuDCGTlp+
 KAnqusj+6ilMWfT9S5FUYYaKiOcTHBr17c+NJHKlNz8bEDH06Ekn7VnfPjDR7MBfJgc7
 VYlZdcnkI4A3wF0Ck2NzLyuLq9JuzC3yGkoS90kf2uJb09/rEdGRvb+/H8GB7e2qN5bg
 ZTf92VpBO1N36q/Kv07waXfTMQufq3jKlLz08gBv/xZheDbpecjK6zDAE4PFCsCjRYTc
 YkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W3n8w9GMO9ZUP6NIizriYpOfVN8d8Sg4lM/F77XL2js=;
 b=5hhVBFVZ2hweBVZkHmW56oooHzvG3TqwOPG6rAeOT/WETsJi5y8O5BaQ01KO3VSfiw
 OOyQo9H0M3cLuUeUqK8s165eYjX/TpQYeSgmKAZEIeUNja1LbgitEpMo1Nxbjv4XKCEa
 kPkvuqLylNlRn4VNE1K8pBVLcJKGF2/RSOOF1arY5AaIlsbp61F6R1F0RFcvMEJCUuZk
 1isyhjcUPqnrXQocvjBwPQaVmppyfa4nGpeO7k7T5HOH1Xc+0U85Ffe7LsqdkEAoksXY
 g4CMXTZtHLvHZjbBSpWlkRTP8oNPJe40Egwvo8bDBxkrdCnq2sICl/+dUW1JwFWTX+GQ
 c6Hw==
X-Gm-Message-State: AOAM5335F4GOKlk2aWQhhpUUOUf1IsCAGIy7QIR2JaiWvMET0nmivLps
 m5BDzuuGRG1BrmczS44gQaysgQ==
X-Google-Smtp-Source: ABdhPJwIsEhJ1u+ZIQH+wIG7x20h1MpW9i7GiuQkvX+IiwlLe3UiNLae7fg/R3BufJ9vSa0GVSVkAQ==
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr14693135wmm.49.1632146607247; 
 Mon, 20 Sep 2021 07:03:27 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id q126sm3587985wma.10.2021.09.20.07.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:03:27 -0700 (PDT)
Date: Mon, 20 Sep 2021 16:03:26 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: gpu: drm-internals: Create reference to DRM mm
Message-ID: <20210920140326.ygodeun2qokb6wcw@blmsp>
References: <20210920101334.249832-1-msp@baylibre.com>
 <874kafv7bu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874kafv7bu.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Mon, Sep 20, 2021 at 02:01:57PM +0300, Jani Nikula wrote:
> On Mon, 20 Sep 2021, Markus Schneider-Pargmann <msp@baylibre.com> wrote:
> > This short sentence references nothing for details about memory manager.
> > Replace it with the documentation file for DRM memory management.
> >
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  Documentation/gpu/drm-internals.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> > index 06af044c882f..bdcdfc4ede04 100644
> > --- a/Documentation/gpu/drm-internals.rst
> > +++ b/Documentation/gpu/drm-internals.rst
> > @@ -126,8 +126,8 @@ Memory Manager Initialization
> >  Every DRM driver requires a memory manager which must be initialized at
> >  load time. DRM currently contains two memory managers, the Translation
> >  Table Manager (TTM) and the Graphics Execution Manager (GEM). This
> > -document describes the use of the GEM memory manager only. See ? for
> > -details.
> > +document describes the use of the GEM memory manager only. See
> > +Documentation/gpu/drm-mm.rst for details.
> 
> Please use rst references instead of a file reference.

Thanks for your comment. Could you please explain it a bit more to me?

I am new to the kernel sphinx documentation so I looked it up in
Documentation/doc-guide/sphinx.rst 'Cross-referencing'. It is listed as
the preferred way to reference other documents if I understand it
correctly.

Should the doc-guide be updated then if a rst reference is preferred?

Best,
Markus
