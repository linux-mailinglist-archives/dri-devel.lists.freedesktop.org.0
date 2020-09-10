Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0006263F8A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 10:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F5E89ECD;
	Thu, 10 Sep 2020 08:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE77689ECD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 08:18:40 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id q9so4712763wmj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 01:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yScbcLel7MNf7Zdmbp9xu1mxk80Bsk+DQMhRbFM4vbM=;
 b=C6ULO9CEHYnlTucPz93kvdJZj1bmfArc0DnC/QMXVY3GHfLCqEX5PeYVsOev6TnoHd
 5kWKYouBFzw9rjK2Ls6rdSZF9LKdwEGJGoeS9kDruGqF6OEz9Svf/WzECxZEtLl2zNxC
 4J8/jMM40wlutk/rncYN4RSya3NmDDFfQRqiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yScbcLel7MNf7Zdmbp9xu1mxk80Bsk+DQMhRbFM4vbM=;
 b=Y1HcL32PrRtEWUkc6bvLFQ9p0FffsalCdt0ceQISRNrab4sOSZ3h2O9GCz9JzhZxfU
 CVO3Z1eeHx0PywEsDz7LPTuVly1shlhUELRzyPAI7lrMLPqbqqjyi0fAuFNJDVGPWEsy
 YOql7nGeju7rnag4to7dW6PyipYxQTgORBkujqJ2JPteuFVhOZp1WSjnGPEURkQ2GiUh
 ar/EHfKSk7hO21wSBzGXZ5WI4GZeF/0ZAv4pk1n5BsOkpUDg+bvs+JF8J1Dh4puF3aus
 0WBzUuNxsvnLIMqAtleuxNHgPXQGzaK4JDTbGGChMmSwRIlU58CD4vxpTg+CpXq9XiPO
 JyvA==
X-Gm-Message-State: AOAM531ZhqSObGRTXz6ezcUe9Zs0nv5U1LtMGTKVRFBfR0289n6HU0zb
 u8JHD1rj/neDDnBq53OL9HVqAg==
X-Google-Smtp-Source: ABdhPJy4exBbrr+IaEp6MKLsdWA673qt14mXj+QfPvFQHcmPEDH8JtdkUg89jsyt06aBzRBoof1Wuw==
X-Received: by 2002:a1c:5a56:: with SMTP id o83mr7542813wmb.77.1599725919484; 
 Thu, 10 Sep 2020 01:18:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q12sm7697297wrs.48.2020.09.10.01.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:18:38 -0700 (PDT)
Date: Thu, 10 Sep 2020 10:18:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <20200910081836.GG438822@phenom.ffwll.local>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <n5uMyyDW2WrhtODRwgsqla2mU-pP-gLV4vHHoIZzjvmzG17epyoBjSh8HxIcnaPAwIlRQZ7Aj7cuUz_iby97UlRMw-WAOss7k0oPQD8YPaQ=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <n5uMyyDW2WrhtODRwgsqla2mU-pP-gLV4vHHoIZzjvmzG17epyoBjSh8HxIcnaPAwIlRQZ7Aj7cuUz_iby97UlRMw-WAOss7k0oPQD8YPaQ=@emersion.fr>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 07:50:59AM +0000, Simon Ser wrote:
> On Wednesday, September 9, 2020 12:57 PM, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> 
> > Hi all,
> >
> > I was wondering whether you could give me an advise on how to proceed further
> > with the following issue as I'm preparing to upstream the next set of patches
> > for the iMX8MQ display controller(DCSS). The display controller has 3 planes,
> > each with 2 CSCs and one degamma LUT. The CSCs are in front and after the LUT
> > respectively. Then the output from those 3 pipes is blended together and then
> > gamma correction is applied using a linear-to-nonlinear LUT and another CSC, if
> > needed.
> >
> > Currently, downstream, we have all those CSCs and LUTs hard-coded into a header
> > file. Based on the colorspace, range, gamut selected for the output and/or
> > plane input, we pick up the right CSCs and LUTs from that header file to
> > configure our pipes... I guess this solution does the job, userspace doesn't
> > need to care much about how to generate those tables. But, it's also not very
> > flexible in case there is an app smart enough to know and actually generate
> > their own custom tables. :/
> >
> > Looking through the dri-devel archives, I've seen that there was a tentative to
> > implement a more or less generic per-plane LUT/CSC solution but it didn't make
> > it in due to lack of userspace consumers...
> 
> Apart from full color management mentioned by Pekka, are there other
> use-cases for these per-plane props?
> 
> One thing I can think of is that some drivers annoyingly only apply the
> per-CRTC gamma LUT to the primary plane. I think it would make more
> sense to not attach a gamma prop to the CRTC and instead only attach it
> to the primary plane to make that clear. But I guess that would also
> break existing user-space?

Uh, which drivers? This would be a driver bug (and there's been plenty of
those where the cursor has the wrong color temp and fun stuff like that).
We need to fix these driver issues instead of lamenting in userspace that
it's all kinda broken :-)
-Daniel

> 
> The gamma LUT is currently used by some compositors to implement "night
> light"/redshift-like features.
> 
> > Adding CSC and degamma LUT properties for each plane as well as a gamma
> > LUT and CSC for CRTC, would help get rid of the LUT/CSC header and rely
> > entirely on userspace to fill in those tables. But userspace has to know
> > how to generate those LUTs and colorspace conversion matrices in the
> > first place...
> 
> So it wouldn't be enough for user-space to fill these gamma LUTs with
> linear ramps and get colors that look fine? Would the process be more
> involved? Would user-space need to know about the driver and generate
> gamma LUTs depending on the driver?
> 
> That would be a show-stopper.

Yeah we can't expose such an uapi, instead what I have in mind that the
in-kernel lut/csc for yuv/broadcast rgb and whatever else are mixed in
with what userspace provides. That means a slight loss of precision and
we'll have to have a nice fixed point math library for this stuff in the
kernel. But color correction hw is too special between vendors that I
don't think there's any other solution. E.g. even on intel we sometimes
have dedicated register bits/hw functions for yuv/rgb broadcast value
range and whatever else, and on other platforms we need to do that by
adjusting the lut/csc.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
