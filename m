Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0523EF0F8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 19:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC926E214;
	Tue, 17 Aug 2021 17:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB186E214
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 17:34:45 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso2476472wmg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 10:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dzfhaMDtK0Ye+zUuvV7wuHrtwGmS9fpv0a8hAoUkTu4=;
 b=Qjpe4xum3r88LA9oxgZ2IIdzP943P/55b7u/TkNNssGn+RUOXaR5mgUpcuNmVvQA5E
 xNxqRbwIsAmAnUDJkpUONHTKU/GxwXPLBpVjPxunxiJU0OTW15BbG2YyTH1KcCj6NT13
 cHmhUa3SHL1bm4gvx2hnNpYxHgOYw9voLYmqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dzfhaMDtK0Ye+zUuvV7wuHrtwGmS9fpv0a8hAoUkTu4=;
 b=eiDFm8ASoGLVc+nF/QZJimDoQA3BNatE6yNpbbF+eVDvNDNX3kZelTwkrAdnYzi0uV
 kgJtusHKxCqs3L1Ps8jH0ycXRX3zJgA/NEt6ZcIWlf0uZSBEYRxVN3ncSAD2uKls52Mk
 4SAG79WqZJsDKnIelmjtDDtU3w/gNnAEMmTFlLVYleuYCs4BhoAGy8JAwv1uwfXEn9zS
 l/XHGqgSihd2ukV1B1zGWWyRrP9l0yMkIeiRkbC3eV0AowLVS4eJb0MrXlxaNyDp1Gjc
 gTQDdrW3A20mpbQ1OsOTjwpOo3Mc2JejMRxP8swnCshKHx2dEq17+/oL0UY5bSKEIi+D
 Zb8Q==
X-Gm-Message-State: AOAM532QC9ED864MgbJElJZpEl8AtRdFN4dMS8zj9u/ztgkWGsgEqPYP
 B64JVLRok/tKVwVlRuiAFBcHig==
X-Google-Smtp-Source: ABdhPJw1AZMT9msnFo7pm/FX64I+UJPudPSJt5NGlr+gmOprS2seFoRfOq6yMkJvB+FBuN2El01XHA==
X-Received: by 2002:a1c:4c:: with SMTP id 73mr4520558wma.139.1629221684422;
 Tue, 17 Aug 2021 10:34:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w14sm3070462wrt.23.2021.08.17.10.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 10:34:43 -0700 (PDT)
Date: Tue, 17 Aug 2021 19:34:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [PATCH 22/22] drm/i915/guc: Add GuC kernel doc
Message-ID: <YRvzMkaqPbQjvIlW@phenom.ffwll.local>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-23-matthew.brost@intel.com>
 <YRuZbTJmeUAElOZj@phenom.ffwll.local>
 <20210817163647.GA30445@jons-linux-dev-box>
 <YRvv3Sbihp5ogz2u@phenom.ffwll.local>
 <d239000d-0382-2bd5-ff92-80c0925bfd92@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d239000d-0382-2bd5-ff92-80c0925bfd92@intel.com>
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

On Tue, Aug 17, 2021 at 07:27:18PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 17.08.2021 19:20, Daniel Vetter wrote:
> > On Tue, Aug 17, 2021 at 09:36:49AM -0700, Matthew Brost wrote:
> >> On Tue, Aug 17, 2021 at 01:11:41PM +0200, Daniel Vetter wrote:
> >>> On Mon, Aug 16, 2021 at 06:51:39AM -0700, Matthew Brost wrote:
> >>>> Add GuC kernel doc for all structures added thus far for GuC submission
> >>>> and update the main GuC submission section with the new interface
> >>>> details.
> >>>>
> >>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>>
> >>> There's quite a bit more, e.g. intel_guc_ct, which has it's own world of
> >>> locking design that also doesn't feel too consistent.
> >>>
> >>
> >> That is a different layer than GuC submission so I don't we should
> >> mention anything about that layer here. Didn't really write that layer
> >> and it super painful to touch that code so I'm going to stay out of any
> >> rework you think we need to do there. 
> > 
> > Well there's three locks 
> 
> It's likely me.
> 
> There is one lock for the recv CTB, one for the send CTB, one for the
> list of read messages ready to post process - do you want to use single
> lock for both CTBs or single lock for all cases in CT ?
> 
> Michal
> 
> disclaimer: outstanding_g2h are not part of the CTB layer

Why? Like apparently there's not enough provided by that right now, so
Matt is now papering over that gap with more book-keeping in the next
layer. If the layer is not doing a good job it's either the wrong layer,
or shouldn't be a layer.

And yeah the locking looks like serious amounts of overkill, was it
benchmarked that we need the 3 separate locks for this?

While reading ctb code I also noticed that a bunch of stuff is checked
before we grab the relevant spinlocks, and it's not
- wrapped in a WARN_ON or GEM_BUG_ON or similar to just check everything
  works as expected
- there's no other locks

So either racy, buggy or playing some extremely clever tricks. None of
which is very good.
-Daniel

> 
> 
> > there plus it leaks out (you have your
> > outstanding_submission_g2h atomic_t which is very closed tied to well,
> > outstanding guc transmissions), so I guess I need someone else for that?
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
