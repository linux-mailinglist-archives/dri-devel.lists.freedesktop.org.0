Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B51204E32
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 11:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A576E98A;
	Tue, 23 Jun 2020 09:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F39B6E98A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 09:42:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q5so7402898wru.6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 02:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VzNSsdeUH8JNw88cmIzOtYPBzpzKsJvphsT+xrVMiHQ=;
 b=OOgJZnFE49aFE/I7hbWmMS9hh9nzMs281n8olVKh8YTFHWdYuItpydCFunIKoJE3Fm
 16jqzbTcyshM7imZHCSbbTpf6kC2Vd1tkifRRjl/sez3Q3RbMZjZFOJOi2SPcuVowLej
 IyYgSv5zAPXSnIhuEa4QgTkDKxuu0BX5EO5O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VzNSsdeUH8JNw88cmIzOtYPBzpzKsJvphsT+xrVMiHQ=;
 b=lkjUUSswxKtdaBh3zO8dydDtxakM6UZ6VM/yhm97TZv1PXsmMB4OxIwiPhhSJbsb2d
 LHcAhJlHhguHdfEknlTyF9YAW1jdHDXWNnC04f4Px0zUAFH0tQEQ+9Cz5HAn7fsOLG1D
 27x4Pmxw/hRpraWkYptg6l1lMYqMa3iQklB8Wmx8qpl4dy8d7XF2f0D1xy3OCw7MiMZD
 Sjpoq1gds8qtF/C4fPUe6maBu09CvDoo73kf96XwAvkXeh4WGVX2waIGMg92EigkV3XL
 OctXe4sx0kTIcvU5Mu8KpRq7LwAoKw4tzcdYRwZN/S8h/73RgUmTcJ4SWcg402n0iTe4
 dZYA==
X-Gm-Message-State: AOAM531dBtGgUZj0Sb91nY0LRwVVhVP8tbLuVarm3cUTv4SNaJjJag13
 itU384J+mDEjpAyWZMkgYqwakg==
X-Google-Smtp-Source: ABdhPJwPPueVqvUOzPzdk2c9vaBHBEksacY4IoP/Pq0cPyhqF5ia0SGWfVr8kta8laPZCFdjyR2bcg==
X-Received: by 2002:adf:a34d:: with SMTP id d13mr23196016wrb.270.1592905348437; 
 Tue, 23 Jun 2020 02:42:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l17sm3043454wmh.14.2020.06.23.02.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 02:42:27 -0700 (PDT)
Date: Tue, 23 Jun 2020 11:42:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Deepak Rawat <drawat.floss@gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Message-ID: <20200623094225.GJ20149@phenom.ffwll.local>
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
 <20200622124622.yioa53bvipvd4c42@sirius.home.kraxel.org>
 <f6923296368dc676df10e75593ebc18575efc476.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6923296368dc676df10e75593ebc18575efc476.camel@gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Jork Loeser <jloeser@microsoft.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Wei Hu <weh@microsoft.com>,
 K Y Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 03:20:34PM -0700, Deepak Rawat wrote:
> On Mon, 2020-06-22 at 14:46 +0200, Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > +/* Should be done only once during init and resume */
> > > +static int synthvid_update_vram_location(struct hv_device *hdev,
> > > +					  phys_addr_t vram_pp)
> > > +{
> > > +	struct hyperv_device *hv = hv_get_drvdata(hdev);
> > > +	struct synthvid_msg *msg = (struct synthvid_msg *)hv->init_buf;
> > > +	unsigned long t;
> > > +	int ret = 0;
> > > +
> > > +	memset(msg, 0, sizeof(struct synthvid_msg));
> > > +	msg->vid_hdr.type = SYNTHVID_VRAM_LOCATION;
> > > +	msg->vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
> > > +		sizeof(struct synthvid_vram_location);
> > > +	msg->vram.user_ctx = msg->vram.vram_gpa = vram_pp;
> > > +	msg->vram.is_vram_gpa_specified = 1;
> > > +	synthvid_send(hdev, msg);
> > 
> > That suggests it is possible to define multiple framebuffers in vram,
> > then pageflip by setting vram.vram_gpa.  If that is the case I'm
> > wondering whenever vram helpers are a better fit maybe?  You don't
> > have
> > to blit each and every display update then.
> 
> Thanks for the review. Unfortunately only the first vmbus message take
> effect and subsequent calls are ignored. I originally implemented using
> vram helpers but I figured out calling this vmbus message again won't
> change the vram location.

I think that needs a very big comment. Maybe even enforce that with a
"vram_gpa_set" boolean in the device structure, and complain if we try to
do that twice.

Also I guess congrats to microsoft for defining things like that :-/
-Daniel

> 
> > 
> > FYI: cirrus goes the blit route because (a) the amount of vram is
> > very
> > small so trying to store multiple framebuffers there is out of
> > question,
> > and (b) cirrus converts formats on the fly to hide some hardware
> > oddities.
> > 
> > take care,
> >   Gerd
> > 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
