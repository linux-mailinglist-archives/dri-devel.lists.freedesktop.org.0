Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67432405FB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 14:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9987F6E444;
	Mon, 10 Aug 2020 12:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4621B6E437
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 12:34:58 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 88so8006823wrh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mNu0044hd7zMyg8gy+6ZC5f1UxT3rb9zNuHQYJhU8jU=;
 b=VTJrN3qPEK8OZ+52GT/lHzakYVNOZVyDUZz/i83r7FuggMIejEdcvxDO3FjRBORg0m
 iqUM6iVRy5Xw/gg8bSudpKlAI1VMmk5j6AaflYQm3zBSu+A8U63lyNDYNfniwjG03vnr
 o+i3NQJMXmocZB5bpjYGzEAwzNQDN/o/Vk4cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mNu0044hd7zMyg8gy+6ZC5f1UxT3rb9zNuHQYJhU8jU=;
 b=h0MTmQR2KZ6RQn9DsBpy4D+fhPJsZ1ApJKrA6YcCdMFpZksV7S7n/GFRQD2X9xyKdw
 8MVkwIlPvYX1zJvLVT+gP5JoZgtKh+hhPOdraISIzTjapgN0bgKq2o5X0NfWJvwIjgQN
 S/bOmKwZjaBvw7C3cFSWHAZv+drFmVXfqcuKtHs6+RXxHsER9JnC+gNRS534v2l8nojG
 gssue3UCemBSPZVWD+QGwrzqqPLJwfrlnUtisRlM+i2IGrqPiH+HUX3dWn3AKDJuODFY
 d5gwVakVwdzw1Kno8fb0DSiQT5KW476EaPA92yJwoJteUBl2BoSj0xQNYMDMFFpaWr/v
 bZLA==
X-Gm-Message-State: AOAM533YcMBnXi5Kv93GHOQqcpPUbtGo+vFaXK3RvFSWNFZjB5bSWhLG
 c0AuRkmmFiBJLhZWcF8dqMrCvQ==
X-Google-Smtp-Source: ABdhPJxqUxniiIiu3b4UpvXghdcPivkQQ+ASWszKMo1vXxd3axuIke5NaHvRUXdMC2EkRoLrfIsKKw==
X-Received: by 2002:adf:9ec1:: with SMTP id b1mr1257133wrf.171.1597062896956; 
 Mon, 10 Aug 2020 05:34:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x6sm19549362wmx.28.2020.08.10.05.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 05:34:56 -0700 (PDT)
Date: Mon, 10 Aug 2020 14:34:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH 7/7] drm/amd/display: Replace DRM private objects with
 subclassed DRM atomic state
Message-ID: <20200810123454.GM2352366@phenom.ffwll.local>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-8-nicholas.kazlauskas@amd.com>
 <20200807085214.GP6419@phenom.ffwll.local>
 <88c15278-9510-c7b9-76ff-62d425d721ed@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88c15278-9510-c7b9-76ff-62d425d721ed@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 07, 2020 at 10:32:11AM -0400, Kazlauskas, Nicholas wrote:
> On 2020-08-07 4:52 a.m., daniel@ffwll.ch wrote:
> > On Thu, Jul 30, 2020 at 04:36:42PM -0400, Nicholas Kazlauskas wrote:
> > > @@ -440,7 +431,7 @@ struct dm_crtc_state {
> > >   #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
> > >   struct dm_atomic_state {
> > > -	struct drm_private_state base;
> > > +	struct drm_atomic_state base;
> > >   	struct dc_state *context;
> > 
> > Also curiosity: Can't we just embed dc_state here, instead of a pointer?
> > Then it would become a lot more obvious that mostly this is a state object
> > container like drm_atomic_state, but for the DC specific state structures.
> > And we could look into moving the actual DC states into drm private states
> > perhaps (if that helps with the code structure and overall flow).
> > 
> > Maybe as next steps.
> > -Daniel
> > 
> 
> It's the refcounting that's the problem with this stuff. I'd like to move DC
> to a model where we have no memory allocation/ownership but that might be a
> bit of a more long term plan at this point.
> 
> Same with dc_plane_state and dc_stream_state as well - these could exist on
> the DRM objects as long as they're not refcounted.

Hm what's the refcounting problem you're having? Or is it the lack of
refcounting, and dc having different ideas about lifetimes than atomic?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
