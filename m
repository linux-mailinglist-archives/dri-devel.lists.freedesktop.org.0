Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98FF11EAF2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 20:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9C36EC3C;
	Fri, 13 Dec 2019 19:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921146EC3C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 19:08:00 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id n184so282857ywc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 11:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=u53//nJmFj2HBNjimHgZzz/H3aQ8IHW4a1APpS8BYfM=;
 b=MY+TQkdaRjVlLRvBizfJDqVPaatex44xkXlQOYb7AAMLUiTs1GaolNIqRwaLS1uTd9
 6ZwZLE4qWu+24JGSEngt6vH27gY2A6kthi9KAyFwP577+lVUFrq81DNFN4A+DmJni6qP
 N155Cs+kaazV9NFMguyMMrkP4eK/QVSTuNlcPGgscSdMoOSnUCuM5sMOyiNYg5ysHin7
 rQgSP6+OYAJaKiJ1ELbTyNrePb5ayIyg8fm/dslZNEAm4b1O/Pzb/E7JkBnTeFwgMLWV
 maS6FYiyXG6+jzVvE8/RZmHifc+ryvb9BWYVT5OEhvC2E13LnpKYekM6+s6cZvTHBE8Q
 +jhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=u53//nJmFj2HBNjimHgZzz/H3aQ8IHW4a1APpS8BYfM=;
 b=mM5PEQ21lUna/Bg62nRyvDT6aBPAzF3dPVEqgpBFFlZ72yKRA6QVwwzvPv3h1vh4bq
 YyRs9LCpd/nril9YorqorgOUDK31xg1QXAoLaQV5ZM/DtUD49hO3VGMabZ6JOvQLxFKN
 4ns4cxx2EVjF/tbB7GbGijFQQ618aGa0jFACyBje32fRMuF5JCTiFDRuxv7Ujl0Ekeyy
 CPeWJczRZkYh3GioqUVgdZ0Jf+tXlxTZyhs1GactGfdNz6CJZJO9U7x1mQBevos4C5YG
 p+/3gAWs4HILiU2RoBLqJYch+6CySuvzSL98dJpz6yzBqDHukQJydFHBHTNFQUTKMTn6
 nXdw==
X-Gm-Message-State: APjAAAUnt3LaOIfuc61e/toPSULjcrPWqN06WRKF9PUDJfJAJONuOIsf
 69j+xzYoW7GCjeoFn13hfF8v+Q==
X-Google-Smtp-Source: APXvYqxFc2CHCXF5UsXT4xLnxzOdiit2wth1jH63/Sx6XhBDUwTcCUgBkFwlsQt0W6DshPcrFLNBxQ==
X-Received: by 2002:a81:3a06:: with SMTP id h6mr9494402ywa.170.1576264079756; 
 Fri, 13 Dec 2019 11:07:59 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id p133sm4527617ywb.71.2019.12.13.11.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 11:07:59 -0800 (PST)
Date: Fri, 13 Dec 2019 14:07:58 -0500
From: Sean Paul <sean@poorly.run>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v2 02/12] drm/i915: Clear the repeater bit on HDCP disable
Message-ID: <20191213190758.GG41609@art_vandelay>
References: <20191212190230.188505-1-sean@poorly.run>
 <20191212190230.188505-3-sean@poorly.run>
 <20191213102902.GB3829@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213102902.GB3829@intel.com>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, stable@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 03:59:02PM +0530, Ramalingam C wrote:
> On 2019-12-12 at 14:02:20 -0500, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > On HDCP disable, clear the repeater bit. This ensures if we connect a
> > non-repeater sink after a repeater, the bit is in the state we expect.
> > 
> > Fixes: ee5e5e7a5e0f ("drm/i915: Add HDCP framework + base implementation")
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: <stable@vger.kernel.org> # v4.17+
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > 
> > Changes in v2:
> > -Added to the set
> > ---
> >  drivers/gpu/drm/i915/display/intel_hdcp.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index eaab9008feef..c4394c8e10eb 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -773,6 +773,7 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
> >  	struct intel_digital_port *intel_dig_port = conn_to_dig_port(connector);
> >  	enum port port = intel_dig_port->base.port;
> >  	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
> > +	u32 repeater_ctl;
> >  	int ret;
> >  
> >  	DRM_DEBUG_KMS("[%s:%d] HDCP is being disabled...\n",
> > @@ -787,6 +788,10 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
> >  		return -ETIMEDOUT;
> >  	}
> >  
> > +	repeater_ctl = intel_hdcp_get_repeater_ctl(dev_priv, cpu_transcoder,
> > +						   port);
> > +	I915_WRITE(HDCP_REP_CTL, I915_READ(HDCP_REP_CTL) & ~repeater_ctl);
> Do you think it will help to (double) clear HDCP_REP_CTL when detect a
> sink which is non repeater!? But yes disable will be executed on all
> HDCP exits.
> 

Yeah, that's probably a better idea. I was a little undecided on where to put it
and I think I settled on the disable path since that matches the way we handle
HDCP signalling. However if we always write REP_CTL, that cuts our callsites
back down to 1, which seems like a Good Thing.

Will revise.

Sean

> > +
> LGTM
> 
> Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> 
> >  	ret = hdcp->shim->toggle_signalling(intel_dig_port, false);
> >  	if (ret) {
> >  		DRM_ERROR("Failed to disable HDCP signalling\n");
> > -- 
> > Sean Paul, Software Engineer, Google / Chromium OS
> > 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
