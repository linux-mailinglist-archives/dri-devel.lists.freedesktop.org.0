Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6722D4C92
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 22:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9891689CB9;
	Wed,  9 Dec 2020 21:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550D889CB9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 21:13:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a3so3180775wmb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 13:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/tMNSx9b5JKWa7pwqbw7OWqi8KNDRLRSscaj+SWQIzM=;
 b=YXm6uRY9yswti1HOhL8kyT9qWf2X5k05/1DKHS3KXewbNfGMjhfrtO1TzVtwzzAJYj
 wBfuSBbrL9yj5Ds6Xv/zcn35r2Kl/egBA6w4OcV1WRzl1NcSfl9QPpGSZ88JVlj3J0Ev
 4JssAb5prCmMRugqs/aOGFy65PeTVCqU4ZzIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/tMNSx9b5JKWa7pwqbw7OWqi8KNDRLRSscaj+SWQIzM=;
 b=ecOpz+QjGn3ECAn6z9S73zaQUfp76IavKb+DItJXE3wJTvRSHt8ilRaKz9dMH9j4Op
 4GcQj9bfF4zpZosAWyNHTqYZFHODlAO8GGdLPAekQtl3YMt8R8x2Tg1eQXQafcxP7hvG
 DVnUvDG7XlW0XlaUlWrd7ZZx2jm1lIR+Lft0Pfdg0MtvxnzbR3BVFybkwjXcYipvlfw4
 u3POYpzXh+snZdCEu6xxtNw+CBiWrNW9r2weUtpW3QE46IfV409OSqTjf+NH+fKuk8al
 4nUuK3DebYxk/e/TppQy+H9/DiIrT7yZNaL+P8T7JxfGO07z2pQaG9oSZ9+MeEUCEDRi
 Fa7g==
X-Gm-Message-State: AOAM532Tid7gy2mnF5OB5d7qdiv4QtRFfZUtST0DHsKwsdHomrtkB556
 9f0FjqCLVYZ37E2y/k1+xZD7dhNupDGlPw==
X-Google-Smtp-Source: ABdhPJxmI0cKalij3+R0i/6KHY/JRzrV6R3Vjdz3GmPE2EpbvB3jRQjW04eyNtKgjkC5YLkliMIUyA==
X-Received: by 2002:a1c:4d0c:: with SMTP id o12mr4886107wmh.134.1607548437091; 
 Wed, 09 Dec 2020 13:13:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t16sm5791210wri.42.2020.12.09.13.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 13:13:56 -0800 (PST)
Date: Wed, 9 Dec 2020 22:13:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 00/19] drm: managed encoder/plane/crtc allocation
Message-ID: <20201209211354.GB401619@phenom.ffwll.local>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <4dbb86ffa92f7e1ab0a628a5ab09b91a265e64fc.camel@pengutronix.de>
 <20201209211047.GA401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209211047.GA401619@phenom.ffwll.local>
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
Cc: kernel@pengutronix.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 09, 2020 at 10:10:47PM +0100, Daniel Vetter wrote:
> On Tue, Dec 08, 2020 at 04:59:16PM +0100, Philipp Zabel wrote:
> > On Tue, 2020-12-08 at 16:54 +0100, Philipp Zabel wrote:
> > > Hi,
> > > 
> > > this is an update of the drmm_(simple_)encoder_alloc(),
> > > drmm_universal_plane_alloc(), and drmm_crtc_alloc_with_plane()
> > > functions in v3 [1] together with the imx-drm managed allocation
> > > conversion from [2] as an example usage.
> > > a bit.
> >   ^^^^^^
> > this is a left-over of ", reordered an squashed a bit." before I decided
> > to move it into the list of changes below.
> > 
> > > 
> > > Changes since v3:
> > [...]
> > >  - Reorder and squash the imx-drm managed allocation conversion patches
> > >    to use the new functions directly.
> 
> imx parts all look good. One thing I spotted is that you could use
> devm_drm_dev_alloc instead of drm_dev_alloc, at least my tree here doesn't
> have that one yet. Feel free to add a-b: me on top of the imx patches too,
> but probably not worth much :-)

Oh also for merging, ack for merging through whatever tree you feel like.
Since 5.11 merge window is done already if you go through imx please make
sure to send a feature pull soon after -rc1 so it's not holding up
Laurent. Or coordinate with Laurent (and maybe others).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
