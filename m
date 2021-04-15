Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2DA3613C8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 22:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041EB6EAE1;
	Thu, 15 Apr 2021 20:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39B16EAE1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 20:59:07 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id l4so38887526ejc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 13:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VqKz8czkX08y+e0ZGB+BKN4E0AUfG/jjvVBjvYwbxEo=;
 b=jMZz9gs7T0dcqwOzyzvkwp25WVb21FxR5488j9S4IMasAYzixOvsc+7S7cdby6wqbR
 4o5JV77+RUfCLdY74Y3mRpcl0JRoy9xRFI4gfLy0n4MZQkYif9Yb+jF7Xzauon2Nk0QT
 0LoTSBipANi90LMvCIn/Ir1IYzqLYglDkg3xJp1JSJl34xulCJzKJnEYHrCTQ9/qIoHW
 udFCW2Uqvipaie60nJm60NeMj35uAMW5gryuit1w+5bjJmOBOQS+7WgCHSLjCgy/O1xI
 v3ljN/DFle6LGTrx4+62y1g7lMLGFk/A7nyQwjp7zZUm3RvjAvWu7FVnu2iyuBi4oKUp
 G3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VqKz8czkX08y+e0ZGB+BKN4E0AUfG/jjvVBjvYwbxEo=;
 b=HxPTcbcwx4QfdVlMaKJJZQywxyS/TlFs/2Xaxes106NAeNQ27v5tXEtqQ6sw8dZa6t
 VUsaC+N5rHNLA7ax+y4XwI370gpTaGwyNDQnlbC5eJ1pkIRFzR/UibRf3NVeyNmpHsoq
 hP0fcKJ09JpXz0zhApmLrXZkXlp0g50rHEWIK/WWv14kGXK5SfDqkRppd+J9qch7dPsU
 i38gShYr04SP0XFPYCnRex/x3dsDCPsDnXmyGfPDZT56lWvSqF5UUifyNWJ4DNtM+V5A
 /Bdoq8yCyzPAv6PlUv7lKXMYrLJB1JTm3Dami0+LIUlPfZkJJBmyUSF9imTCRTURoPv2
 aBiQ==
X-Gm-Message-State: AOAM533vcSylOe0DViIFjPtvW7SrBE2pIjRH0Vw0er/uxYd2r9dUhJIT
 OIHrufRRrsnb8bO+Jk7+zpw=
X-Google-Smtp-Source: ABdhPJwwWBS7OiWmrlt85gxxhTtBMyP3ZqTv9+mRKh+xkbN5/yo4Xi4MBrei4GGl2Po6lgfdHakGMw==
X-Received: by 2002:a17:907:7745:: with SMTP id
 kx5mr5353769ejc.3.1618520346259; 
 Thu, 15 Apr 2021 13:59:06 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it.
 [95.237.55.30])
 by smtp.gmail.com with ESMTPSA id h15sm2735858ejs.72.2021.04.15.13.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 13:59:05 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [Outreachy kernel] [PATCH] drm: nouveau: dispnv50: disp.c: Remove
 set but unused variables
Date: Thu, 15 Apr 2021 22:59:04 +0200
Message-ID: <3639521.dS9dJRvPBs@linux.local>
In-Reply-To: <alpine.DEB.2.22.394.2104152156530.32851@hadrien>
References: <20210415194423.4880-1-fmdefrancesco@gmail.com>
 <alpine.DEB.2.22.394.2104152156530.32851@hadrien>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 outreachy-kernel@googlegroups.com, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, April 15, 2021 9:57:07 PM CEST Julia Lawall wrote:
> On Thu, 15 Apr 2021, Fabio M. De Francesco wrote:
> > Removed two set but unused variables.
> 
> Would it be useful to use the values?
>
It would be useful if one wants to check returns for errors (which are 
signaled by res different than 0). 

However most other drm code never checks it (as in drivers/gpu/drm/radeon/
radeon_dp_mst.c: lines 424 and 453).

Differently, drivers/gpu/drm/i915/display/intel_dp_mst.c does some logging:

ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
        if (ret) {
                drm_dbg_kms(&i915->drm, "failed to update payload %d\n", ret);

I could do like the second example, but I'm not sure maintainers would like 
it.

What do you think about it?

Thanks,

Fabio
> 
> julia
> 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > b/drivers/gpu/drm/nouveau/dispnv50/disp.c index
> > 196612addfd6..828f48d5bdd4 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -1386,12 +1386,11 @@ nv50_mstm_cleanup(struct nv50_mstm *mstm)
> > 
> >  {
> >  
> >  	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
> >  	struct drm_encoder *encoder;
> > 
> > -	int ret;
> > 
> >  	NV_ATOMIC(drm, "%s: mstm cleanup\n", mstm->outp->base.base.name);
> > 
> > -	ret = drm_dp_check_act_status(&mstm->mgr);
> > +	drm_dp_check_act_status(&mstm->mgr);
> > 
> > -	ret = drm_dp_update_payload_part2(&mstm->mgr);
> > +	drm_dp_update_payload_part2(&mstm->mgr);
> > 
> >  	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
> >  	
> >  		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
> > 
> > @@ -1410,10 +1409,9 @@ nv50_mstm_prepare(struct nv50_mstm *mstm)
> > 
> >  {
> >  
> >  	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
> >  	struct drm_encoder *encoder;
> > 
> > -	int ret;
> > 
> >  	NV_ATOMIC(drm, "%s: mstm prepare\n", mstm->outp->base.base.name);
> > 
> > -	ret = drm_dp_update_payload_part1(&mstm->mgr);
> > +	drm_dp_update_payload_part1(&mstm->mgr);
> > 
> >  	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
> >  	
> >  		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
> > 
> > --
> > 2.31.1
> > 
> > --
> > You received this message because you are subscribed to the Google
> > Groups "outreachy-kernel" group. To unsubscribe from this group and
> > stop receiving emails from it, send an email to
> > outreachy-kernel+unsubscribe@googlegroups.com. To view this discussion
> > on the web visit
> > https://groups.google.com/d/msgid/outreachy-kernel/20210415194423.4880
> > -1-fmdefrancesco%40gmail.com.




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
