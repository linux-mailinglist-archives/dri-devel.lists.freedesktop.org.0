Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95957204378
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 00:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EB26E1D8;
	Mon, 22 Jun 2020 22:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A946E1D8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 22:20:37 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id n2so8178048pld.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=mikDJjTv3iBXAil2F4gJwj77CVERBi3Vn6zbk95TUlA=;
 b=Qg9ZfZoPFXmlSNKhq0zAE4/MoLjPryElQwaPFpqSWwAFzbvQd0uCAy1wNdspJM4Act
 ycmO5BTppQHX8UcA6kOdeMSg7fnhQmA8NWD4v8bMnFWh8m5j4qZlIIbhL+jznYae2EEX
 Jq3K5dnxMKw/jlRxOmHn6r/5FxDQHU0jiOCeMmpPG14b/Hgeeqx5NQ8/9USZKUnZcrvP
 LPV0w+kgFjV1wqN5oQcHxNPzuGGzhbNiU+hjx9ihiG7BThLBzBR9rl59SyCVOZRgnrD9
 /prVspOKE3Iu3pU605j5wWnXu07CHO6rzP3iaVpa84xibUbfuDp/anCgv/KrskmrsyiP
 U4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=mikDJjTv3iBXAil2F4gJwj77CVERBi3Vn6zbk95TUlA=;
 b=dyhcbl23olrjo/rVcVNgt8QNSOC+8YMuIBtQ1dZmsME+sg9AOxsnYmCmjd/YR9IoPT
 gRaojKJuTHeFydHZkEE9RvzwXqh7Fj2s/vRDXbJnE3/+n6qfr7KGd1+nq0U5HWDT6kGQ
 2t0TSBcXupnviscRatWIatjWtMNeQW7G6n08KMOzD6QrR4sNMY2ktUBxyf57yhBLtuAd
 ncB1GQeLh2W8yMLNVfqCOnUHwge8jimKxxr3mXuOrTwSd09z/FnodxzJ4t+0qpIHONnH
 ItAqvVgR2r5+vaq7s3k1yOH35o8RuabhTCjIBqOhnpJ/QkwEUzNG3RrrER5yZ3HJsoVA
 N8aw==
X-Gm-Message-State: AOAM531cZD11VxdApokLOTeDVxpPP5/YJlZyX9Ul84GhoU56iQGHLado
 h6DJp0vLvZ0J9Ah8kbRG3yU=
X-Google-Smtp-Source: ABdhPJwWqgYGd+aoe2YVkfvuD1whrh9WyIk5ZmjHTAZDIVp6POEhKEyMfKtpkHOmdo/rvBUlkutnKw==
X-Received: by 2002:a17:902:7008:: with SMTP id
 y8mr22046673plk.84.1592864437239; 
 Mon, 22 Jun 2020 15:20:37 -0700 (PDT)
Received: from arch ([2601:600:9500:4390::d3ee])
 by smtp.gmail.com with ESMTPSA id o20sm448930pjw.19.2020.06.22.15.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 15:20:36 -0700 (PDT)
Message-ID: <f6923296368dc676df10e75593ebc18575efc476.camel@gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Date: Mon, 22 Jun 2020 15:20:34 -0700
In-Reply-To: <20200622124622.yioa53bvipvd4c42@sirius.home.kraxel.org>
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
 <20200622124622.yioa53bvipvd4c42@sirius.home.kraxel.org>
User-Agent: Evolution 3.36.3 
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Jork Loeser <jloeser@microsoft.com>,
 Wei Hu <weh@microsoft.com>, K Y Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-06-22 at 14:46 +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > +/* Should be done only once during init and resume */
> > +static int synthvid_update_vram_location(struct hv_device *hdev,
> > +					  phys_addr_t vram_pp)
> > +{
> > +	struct hyperv_device *hv = hv_get_drvdata(hdev);
> > +	struct synthvid_msg *msg = (struct synthvid_msg *)hv->init_buf;
> > +	unsigned long t;
> > +	int ret = 0;
> > +
> > +	memset(msg, 0, sizeof(struct synthvid_msg));
> > +	msg->vid_hdr.type = SYNTHVID_VRAM_LOCATION;
> > +	msg->vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
> > +		sizeof(struct synthvid_vram_location);
> > +	msg->vram.user_ctx = msg->vram.vram_gpa = vram_pp;
> > +	msg->vram.is_vram_gpa_specified = 1;
> > +	synthvid_send(hdev, msg);
> 
> That suggests it is possible to define multiple framebuffers in vram,
> then pageflip by setting vram.vram_gpa.  If that is the case I'm
> wondering whenever vram helpers are a better fit maybe?  You don't
> have
> to blit each and every display update then.

Thanks for the review. Unfortunately only the first vmbus message take
effect and subsequent calls are ignored. I originally implemented using
vram helpers but I figured out calling this vmbus message again won't
change the vram location.

> 
> FYI: cirrus goes the blit route because (a) the amount of vram is
> very
> small so trying to store multiple framebuffers there is out of
> question,
> and (b) cirrus converts formats on the fly to hide some hardware
> oddities.
> 
> take care,
>   Gerd
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
