Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745503E8D67
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 11:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301B06E0FD;
	Wed, 11 Aug 2021 09:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C816E0FD
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 09:43:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m12so2118356wru.12
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8qsJMoMusEBZS1skzUgBSb+YWAAoCzV88LAQW/oYAvk=;
 b=knBiwVWfL/31M4lVR+QMzuhoxLsMAAIch55NOr1iXuHTchgDAPv5Fxczt6K1gQGEWN
 wNpSDaLaMDdy18qIL4TSU+sfaP5XqEuqSKO1mjPP1Iv5rPhOE3diAiY5RO9cJExPoSmf
 6GnpD8PIC9tIfNsfcBPzNFlYT9RtNrYgLEm0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8qsJMoMusEBZS1skzUgBSb+YWAAoCzV88LAQW/oYAvk=;
 b=Pq0cEZ54nBYpvNczjuXAuv47oKI8c0YlCndvAGQASDtCVtVIJxZGJlH1pInl6PqQup
 GTkUWCmlLDWKtBfpis0I+O3t/Eh7c/x3c2gjS74ubJS/0BRLhr2bScprPUpWccjXQwQx
 NMht/6MOihOS1SkxiBlndOQdjtZBpz/Hm/tMxXDXWUb6fCAFLs4Kg58DyuqzpXcQCtua
 ZWyPlbJnO9pcsiPhXCKuEhRBcWZYKGE8dgCtjymlKGaP/d49pfDYkBbUt5fhlT0Uipif
 TLjrRbdRKfo4v8+52T8V9kNtarmoBsnWaYt1Ftv8oiLqDV2zKYLu1XlRIYNTJmvxQZcU
 xMLg==
X-Gm-Message-State: AOAM5323o/04/KkS8ZqR3jSAw9DapCXX6cWkcqB+rJInDBes/h5n7FgO
 DaFirNmWb4ooqz4pC8pv4eKzxr+mE3N3Rg==
X-Google-Smtp-Source: ABdhPJzZZAJQm721ShL9/Zid8bjOQA9pWiqq4MpRuhY9YE0xxBxcgxURy8RzCn/1KXAtaiyymqbCtg==
X-Received: by 2002:a05:6000:1805:: with SMTP id
 m5mr20950375wrh.265.1628674997315; 
 Wed, 11 Aug 2021 02:43:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v17sm26275917wrt.87.2021.08.11.02.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 02:43:16 -0700 (PDT)
Date: Wed, 11 Aug 2021 11:43:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Cox <jc@kynesim.co.uk>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: How to obtain a drm lease from X for overlay planes as well as a
 primary plane?
Message-ID: <YRObs1/iDhgCbMo8@phenom.ffwll.local>
References: <34a5hg1rb804h8d1471apktsgl5v9n9u1e@4ax.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34a5hg1rb804h8d1471apktsgl5v9n9u1e@4ax.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 10, 2021 at 05:57:31PM +0100, John Cox wrote:
> Hi all
> 
> I am on a Raspberry Pi, I want to display fullscreen video and have a
> couple of overlay planes to display controls / subtitles etc. The h/w
> can certainly do this.  I need to be able to do this from a starting
> point where X is running.
> 
> I can successfully find X's output & crtc and grab that using
> xcb_randr_create_lease and use that handle to display video. So far so
> good.  But I also want to have overlay planes for subtitles etc.  The
> handle I've got from the lease only seems to have a PRIMARY & a CURSOR
> plane attached so I can't get anything there.

I think X just gives you a legacy lease for the crtc, and the kernel
automatically adds the primary plane and cursor plane (if they exist) to
that lease. Unless X is patched to enable plane support and add those all
explicitly to the lease I don't think there's a way for that.

For wayland this is still in the works, so might be good if you check
there that your use-case is properly supported. Protocol MR is here:

https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/67

> How should I be going about getting some more planes to use for
> overlays? Pointers to documentation / examples gratefully received - so
> far my google-foo has failed to find anything that works.
> 
> I'm sorry if this is the wrong place to ask, but if there is a better
> place please say and I'll go there.
> 
> Many thanks
> 
> John Cox

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
