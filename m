Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D26263F09
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878026E2BD;
	Thu, 10 Sep 2020 07:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA066E2BD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 07:52:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a17so5588031wrn.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 00:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tE6DQ8SZLLPgWBGJo9a/nTN40u5YYVhd6aDbuzEOh2w=;
 b=eNN9CyGUn/W9ZpuMkVKhtaEzg2aIWIXzlA+SLoJV25bUt6ZqlUYZp+NPhFf94+biQI
 Y2QHDkUHbA8Lz3ceuuUYhGpeAXffzb8iUe7Bq1Qa7vaG+9v+w7QAEnz8U0fM4i0ncghE
 zL4Tw3sft7whKSeX3cyOa62nkpoyK6ymWMchc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tE6DQ8SZLLPgWBGJo9a/nTN40u5YYVhd6aDbuzEOh2w=;
 b=MePOeHqTI1ZtR/r4W1rXyRhn8ejPmf6afINL0nfG19MXZoTpH0Y+G88XqINNdTaFGq
 tfryx8BlNRjOTtDWLc4Mb0EfJeprqCDiPHgIbmDKZANqOkXtUYWCoXCmVx2KkjCBQ1M3
 4hvcubBPSMnepnQ1ShGErN16M6CQn1NhO+/0sPTbL6OAgnhhdaGAc8rWDCDqZQ64FLxB
 7Z0Q904lDXJIgJV1ijhQGpY+/1RnaOgP8q1zL5EWQQcBwY8VUIqFw0yq7DEZD0jKUbRj
 gVtV5jq2XDQvmQXB6UaOo6YM5WEHTmvGT/TIioZ8dd+2ChOiAPT4HDZjO55wBw1767dg
 iG1A==
X-Gm-Message-State: AOAM530dIYDKvH4/rLdlcHW1bAuJXn2ohk8DSD/k8Y5iyfHjXTIcJwEt
 XS0P8vPkHRl0NwIypi42SGgvmg==
X-Google-Smtp-Source: ABdhPJx+IgZJYnU6CPQH7TKqyOugg5+frfals5ZcxdKrF5Xx8JCsSp+E/1AZC7qbbgp9OPcoyJ3m4A==
X-Received: by 2002:adf:ed12:: with SMTP id a18mr8218216wro.178.1599724348509; 
 Thu, 10 Sep 2020 00:52:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b194sm2366450wmd.42.2020.09.10.00.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 00:52:27 -0700 (PDT)
Date: Thu, 10 Sep 2020 09:52:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <20200910075226.GF438822@phenom.ffwll.local>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <20200910102543.11dc9fe0@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910102543.11dc9fe0@eldfell>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 10:25:43AM +0300, Pekka Paalanen wrote:
> On Wed, 9 Sep 2020 13:57:28 +0300
> Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
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
> > 
> > Adding CSC and degamma LUT properties for each plane as well as a gamma
> > LUT and CSC for CRTC, would help get rid of the LUT/CSC header and rely
> > entirely on userspace to fill in those tables. But userspace has to know
> > how to generate those LUTs and colorspace conversion matrices in the
> > first place...

I think even if we have userspace doing this, we still need the default
tables so that old userspace keeps working. E.g. I'm assuming this is also
used for yuv->rgb conversion and range limiting and all these things. In
i915 I think we even combine the userspace lut/csc with the one we need
for color space fixes in some cases.

So maybe a helper library which helps drivers do that would also be
needed.

> > So, how should I continue with this one? Any pointers?
> 
> Hi,
> 
> I can't help you, but I can say that we are currently in the process of
> designing a color management and HDR extension for Wayland, and I'm
> sure in the long term I would like to use per-plane color space
> transformation features of KMS in Weston eventually.
> 
> IOW, one more userspace that is going to be taking advantage of such
> features as long as they are not too driver-specific.

Personally I think best to wait for userspace to come up with color
manager protocols, that should give us a much clearer idea of what the
kernel interface should look like. Since hw is pretty special in this
area, I expect we'll have to do a bunch of impendendance mismatching in
the kernel anyway.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
