Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A8554D193
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 21:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56BF11211F;
	Wed, 15 Jun 2022 19:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A92D10E637
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 19:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=eQUW8Hi6c05/NnOba5U4Uk34R0WZORAUIgFaS1C3x60=;
 b=vN1t71HGkyTgvFSW4lKaqZQJ4z2pRzpi+JgLC8SXrL+kHLTTNOZxLxIWSjqEpLUGuU3IJ8/6KuPDl
 6a8zLaVVNGziySLg3qxm778+HPJl85Bco6aV3WUzFmqIQJPXYc4y0Vlf1ERPzAulQeiEEhzt9sjy+o
 kvZkGOFdVEBUPcyzfEI++Ft6WVBvWLzPh6PpmQP5D/IWnxI0P+YfLXJadJyWmeVmvqwm0DVqYzIsws
 fhDmpxDeI0nhidfqgM5c205LelmgXA4slYLPdCeNEKbXENfLpNloIPwryvLVywA8ila8IomPRj2uR8
 gfwQ0SoOErc02Gj5pcKhrh3YqN0cRUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=eQUW8Hi6c05/NnOba5U4Uk34R0WZORAUIgFaS1C3x60=;
 b=p2oTf9kHjrtSzdWYsTJXYmtiyBPspd0d1SyPDojiBCKdDvFlP9RVVLhgukGVyScQvhM7tWXrR1XKy
 2ZU0dADBg==
X-HalOne-Cookie: 29ab9cea97a1b489cc2f5b758f658d90cf105e6e
X-HalOne-ID: 275b4e50-ece1-11ec-be78-d0431ea8bb03
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 275b4e50-ece1-11ec-be78-d0431ea8bb03;
 Wed, 15 Jun 2022 19:27:11 +0000 (UTC)
Date: Wed, 15 Jun 2022 21:27:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH 01/19] drm/gma500: Unify *_lvds_get_max_backlight()
Message-ID: <YqoyjsYAMO0Ol0Og@ravnborg.org>
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
 <20220613123436.15185-2-patrik.r.jakobsson@gmail.com>
 <YqdvDI59JRfsZiut@ravnborg.org>
 <CAMeQTsa1DbDQLBOEQQyNBQzf-YOJVhbQS2ikPAsVavm_JXy5Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMeQTsa1DbDQLBOEQQyNBQzf-YOJVhbQS2ikPAsVavm_JXy5Eg@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Patrik,

> >
> > With or without this change the patch is:
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Hi Sam,
> Thanks for having a look.
> 
> I've intentionally tried to change as little as possible from the
> version I copied so that any functional change is easy to spot and the
> series becomes easy to review. Would it be ok if I do cleanups as a
> followup series?
That would be perfect!

	Sam
