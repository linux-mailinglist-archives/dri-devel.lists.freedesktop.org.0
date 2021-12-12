Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E614F471A61
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 14:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D342210F457;
	Sun, 12 Dec 2021 13:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FFD10F457;
 Sun, 12 Dec 2021 13:21:13 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id l7so20163697lja.2;
 Sun, 12 Dec 2021 05:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OqbqU4KpmW/3a9GBJWdom5eobHCfr5y41fxq+2EJ74o=;
 b=FbCKqnEsfyakFxGNKJN3vDPQJyZz7PHJFIodMKcNY3Pdkgz7FXGzy0L7ocJr8COiWK
 MBmU/+89VqUS8h9PpPiRVMzqJjelW71Q2NYaiJFNG5GYdAIaq+273py08Q91+Svverty
 XPUIyiv41KHyqC4/mDtYdK3vVA3bq5A1QPph1wcgVybmiUXSWCJPMqMw72ipNLMUcoyP
 mwdeS0XnWgKi4u3TLeMTT5kqNpOKE+2Ndhl912oxMuEyxgXvKVSshHkqGJ8Z/ZkcJh9K
 myT62odNsUV0nn/h7yy/3p4UnYAYI2nvrvAqVqT0JS3DR0G3bKRkP2GkPEYHrmcAUOef
 Owrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OqbqU4KpmW/3a9GBJWdom5eobHCfr5y41fxq+2EJ74o=;
 b=tmxsQtUybbfsg1TamxhUUyicDPLEk5R8rH/Q0WJqOfjfm8C5EgpkPyRs3/gPmut4dU
 IpMa02qZyh2yc/qDhNJs/xBPZo9KyAOEyODmAUIAu5hKlw2erw2qaLasjflrPx1x5sza
 djPMQzlN+5BPJjCKgEKX7TVzRNk/+dI9IiBwoliqu7W6NBA6fSrH34Q/YhDpt2vNJ8vQ
 ptrUq9SyOUa4ZlGVBTYhbyqi4J2HXvbS9YFakYTRXzs8xAtT3+CM5TUYxTjWqmC6ye78
 +yMLdHPVoGxFle40bIGyqs/OWGl/7ldXEN1dk0rDQOZHBaLbQFAhkgZ0XdSZjHhjt4Gm
 EJyA==
X-Gm-Message-State: AOAM530vl6bxc4DXeezQqNpqWlL4r2cqAfg9mhmW4Eumc+nSSe+EJlqq
 4ij//kwFTr1n38Ag/ZnK8MY=
X-Google-Smtp-Source: ABdhPJxyMcH3Sd75rK2a3m8f127DepuJ+gI6/b3Mxv85uX5aWMYqdyERzLWhjqz8aK60GNb8C9maDw==
X-Received: by 2002:a2e:9b17:: with SMTP id u23mr24197847lji.258.1639315271757; 
 Sun, 12 Dec 2021 05:21:11 -0800 (PST)
Received: from rikard (h-155-4-221-129.NA.cust.bahnhof.se. [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id s4sm1040386ljp.73.2021.12.12.05.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 05:21:11 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
X-Google-Original-From: Rikard Falkeborn <rikard.falkeborn>
Date: Sun, 12 Dec 2021 14:21:08 +0100
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PATCH 7/9] drm/i915/gvt: Constify formats
Message-ID: <YbX3RPtqtGhoRSV1@rikard>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
 <20211204105527.15741-8-rikard.falkeborn@gmail.com>
 <6e73f014-730c-3334-c0e6-7e0665f47fec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e73f014-730c-3334-c0e6-7e0665f47fec@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 08:20:22AM +0000, Wang, Zhi A wrote:
> On 12/4/2021 12:55 PM, Rikard Falkeborn wrote:
> > These are never modified, so make them const to allow the compiler to
> > put them in read-only memory. WHile at it, make the description const
> > char* since it is never modified.
> >
> > Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> > ---
> >   drivers/gpu/drm/i915/gvt/fb_decoder.c | 24 ++++++++++++------------
> >   1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/fb_decoder.c b/drivers/gpu/drm/i915/gvt/fb_decoder.c
> > index 11a8baba6822..3c8736ae8fed 100644
> > --- a/drivers/gpu/drm/i915/gvt/fb_decoder.c
> > +++ b/drivers/gpu/drm/i915/gvt/fb_decoder.c
> > @@ -40,12 +40,12 @@
> >   
> >   #define PRIMARY_FORMAT_NUM	16
> >   struct pixel_format {
> > -	int	drm_format;	/* Pixel format in DRM definition */
> > -	int	bpp;		/* Bits per pixel, 0 indicates invalid */
> > -	char	*desc;		/* The description */
> > +	int		drm_format;	/* Pixel format in DRM definition */
> > +	int		bpp;		/* Bits per pixel, 0 indicates invalid */
> > +	const char	*desc;		/* The description */
> >   };
> Thanks so much for this. According to the code of i915, we prefer using 
> one space as seperator.
> >   

Thanks for reviewing. Just to clarify, is this how you want it to look:

struct pixel_format {
	int drm_format;     /* Pixel format in DRM definition */
	int bpp;            /* Bits per pixel, 0 indicates invalid */
	char *desc;         /* The description */
};

Rikard
