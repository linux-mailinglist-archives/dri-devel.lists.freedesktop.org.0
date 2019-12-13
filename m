Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C3211EBBE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90936EDAC;
	Fri, 13 Dec 2019 20:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A1B6EDAC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 20:15:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p9so81644wmc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 12:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OSjOeT8G41sJUMcGNxAsisj1FiAyZ8f/rHyI40o7EdQ=;
 b=F/Uy17ysVsCxX3vbmQdR9X3Li0fixrsi063fSRObadKL2Wtyc6qZSMbdWVZFW4rd7C
 8dsTaWvnCrnAoEiK+2U8PpopCRm/vseai0riI2WN0irMYcSt/EE8cfY+2lhPb38ceG5n
 s7XddZQDv1gaN5YJmmD822xxN+g2JYoGg5vrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OSjOeT8G41sJUMcGNxAsisj1FiAyZ8f/rHyI40o7EdQ=;
 b=HDHJXCTKvi9iF+tRwM/Kric35d1cubKcBEFWCh2FaOk0EdFKKcKsYJsVK75kWYu81v
 bLjQN6596g4GN/+5AbWn43M7vdRNpLKaI2/YQTII3VMUvQVJCLRuDnC+2moxJP4uLlsr
 b/PFfcFBcHBQQJ69b6OM11TN5BoxzPQEfO947F8e42rbzwz+G8766K6H1Wp/gBRmd2AR
 VB37O4YzAQ2kydseQKhutQBk0BKMfXBX0pJPjIALrBE6OCRdQjhBxiBEKIcAGONuQS3A
 MOXwf4Q6ppoXLMMczDVKLIQ8zoADtlyLOTbHl3oWWuz6TbA+u5W39xE/eIUiH3WudA1t
 464A==
X-Gm-Message-State: APjAAAUCgWqtsr3kooXihVTAWT8ubda4HWTJZpKLHLY65FtAFxq5RQLY
 KiPXTZOR3uAgVV2TIdfj/EcrtA==
X-Google-Smtp-Source: APXvYqzooDTqgGz622+5KcyFt/wyDCN5P5HVJHqSheKFCzLYHUXc3Sh2LPhnXpgOLnBce4bDVKNR1Q==
X-Received: by 2002:a1c:ed0e:: with SMTP id l14mr14848010wmh.74.1576268149794; 
 Fri, 13 Dec 2019 12:15:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id i8sm11349337wro.47.2019.12.13.12.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 12:15:48 -0800 (PST)
Date: Fri, 13 Dec 2019 21:15:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 5/5] MAINTAINERS: add entry for tidss
Message-ID: <20191213201546.GN624164@phenom.ffwll.local>
References: <cover.1576158368.git.jsarha@ti.com>
 <09da3a37ca59bb45bef62f2335a191985363d393.1576158368.git.jsarha@ti.com>
 <20191213103024.GH624164@phenom.ffwll.local>
 <0acedebf-25d9-6ae2-1307-8f764af449af@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0acedebf-25d9-6ae2-1307-8f764af449af@ti.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 subhajit_paul@ti.com, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 robh+dt@kernel.org, Jyri Sarha <jsarha@ti.com>, sjakhade@cadence.com,
 sam@ravnborg.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 01:17:59PM +0200, Tomi Valkeinen wrote:
> Hi Daniel,
> 
> On 13/12/2019 12:30, Daniel Vetter wrote:
> 
> > > +DRM DRIVERS FOR TI KEYSTONE
> > > +M:	Jyri Sarha <jsarha@ti.com>
> > > +M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > +L:	dri-devel@lists.freedesktop.org
> > > +S:	Maintained
> > > +F:	drivers/gpu/drm/tidss/
> > > +F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> > > +F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> > > +F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> > > +T:	git git://anongit.freedesktop.org/drm/drm-misc
> > 
> > Is the plan to also move other TI drivers over (like tilcdc) or just an
> > experiment to see what happens? Asking since if eventually omapdrm moves
> > that might be a bit much (or at least needs a discussion first).
> 
> Hmm, yes, I think we should have a plan for these.
> 
> tilcdc: small, old driver, and I don't see much changes for it. The HW is
> very different from the ones supported by omapdrm and tidss (the two of
> which have many commonalities). I think drm-misc is fine for tilcdc.
> 
> omapdrm: big changes going on for now, but after the rewrite to get rid of
> omapdrm specific drivers is done, I expect the patch count to drop, as the
> HW is "legacy".
> 
> tidss: the "new" driver, which should get most attention in the future (after omapdrm rewrite).
> 
> All in all, sometimes there have been very few patches for many months, and
> then sometimes there's a big series.

Yeah occasionally big series is totally fine for -misc. We're pulling in
pretty big amounts of refactoring all the time, so really doesn't make a
difference.

> I haven't seen a need to have a maintained branch for omapdrm, as multiple
> people working on conflicting items has been very rare (there aren't that
> many people working on omapdrm). So I've picked patches to my private
> branch, which I have rebased as needed. And then I've either pushed via
> drm-misc if there's just a few patches, or sent a pull request if there's a
> lot.
> 
> Is such a mixed model ok?
> 
> I'm not sure how much is too much for drm-misc, but probably omapdrm and
> tidss combined (if pushing everything always via drm-misc) is a bit too
> much. So perhaps a maintained TI tree would be an option too, and pushing
> everything for omapdrm and tidss via that tree.

tbh I dunno either when too much is too much for -misc. I think tilcdc and
omapdrm should both easily fit (maybe after the big rewrite). If the shiny
new one here becomes too big we can always reconsider.

I think the really big drivers like amdgpu or intel don't belong in -misc,
that one is clear. In between I guess we'll see.

> I'm fine with all options, so I think we can go with whatever is most
> acceptable from DRM maintainer point of view.

Whatever floats the boat, with a preference for not having tiny trees
(simply because those pull request tend to get lost in the noise).
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
