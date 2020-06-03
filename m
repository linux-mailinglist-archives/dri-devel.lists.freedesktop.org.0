Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07EE1ED11B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 15:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1328289B9F;
	Wed,  3 Jun 2020 13:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59B789B9F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 13:44:31 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r15so2125637wmh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 06:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wlyKA4Bua/35RYvsorF/aSvaZvpEfS1WUq4eGYd+ass=;
 b=NpWopXpQNKeVFVJsLKg0mbHTFMI3veHFo/a8zaiz1IPJg1ICSHnB+MJuEyGDtxX1Ec
 ucBuQMTmrzpuIlANJBTcvUQBbgW2wpWHtUajlrWfE2pQ5CB8rcr1d8ER8z7s4qREL3Qi
 aSHj+fFBDSzjwkTzR8mee5IXiT+ShEsXExrhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wlyKA4Bua/35RYvsorF/aSvaZvpEfS1WUq4eGYd+ass=;
 b=JUO2p8zuvWlMaBbQNGFlvyRnPYgIjO9z2Fr6cWmbK7whZQS4zCe5iW4gyQAsTdXqCg
 zBm69ZBolDvbyCMCsguCbISeqzXa5JFQMtPuEm9l4R4Q6uonKID76mnptpO2QusaFb8d
 nYFVF9Q9djB2BbyyvNWe5nLYXdhiMOYk0eLeIlCqAVgEgbqiK3ToGsFngEFy82coLh2z
 DsA7G20XRF8WEMs5LcTCEAR9La5BwA2jKpcj+HMAdgmqI7aXLMYmA1ActtaL+CLE4+VU
 YioSryjLdhSTz5AL5O9P5lGQhIxRn81Fe/CYFD6I9wz8WM2jRSl0NBRCM3neBOK/rFQ9
 qI0Q==
X-Gm-Message-State: AOAM5303S+U6OX2BWVPdcj/Wri/uBbI7ruLPgoZTbXpsXTYjK3PqlCSA
 D42dyoIHz/gGa76+Cvob2JrDaQ==
X-Google-Smtp-Source: ABdhPJzjv44qpfuN/FRpKDtgqY18M21OcepceFHznuUuZeV0BGGr4cS3sZ6cpgYAi8RpNhNB90swiQ==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr9381167wma.118.1591191870559; 
 Wed, 03 Jun 2020 06:44:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d13sm2940762wmb.39.2020.06.03.06.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 06:44:29 -0700 (PDT)
Date: Wed, 3 Jun 2020 15:44:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: document how user-space should use link-status
Message-ID: <20200603134427.GO20149@phenom.ffwll.local>
References: <a3tPhSgOvV4Vn3if_Bqhg-QDwCIVZfHc99EeOVWLRkxOWQoF2tL3QSz-6SLEv3pIJRg2VANaS5rmZUkTkyqi3y0PO9qY84oOa7v_yNFpauY=@emersion.fr>
 <20200603123204.6ef5f6b1@eldfell.localdomain>
 <M7Ja_vtKU8uXTBBAW_4XJJAeG4Tq-ftcqJEZ_DtlSPqx_yS_zCnYFnKtB5WQQpxz-2hylwWMlDmSKfZz9IkevX4BjXIuj17UyfRwyNSrWL8=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <M7Ja_vtKU8uXTBBAW_4XJJAeG4Tq-ftcqJEZ_DtlSPqx_yS_zCnYFnKtB5WQQpxz-2hylwWMlDmSKfZz9IkevX4BjXIuj17UyfRwyNSrWL8=@emersion.fr>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 03, 2020 at 01:27:55PM +0000, Simon Ser wrote:
> > > + *      When user-space performs an atomic commit on a connector with a "BAD"
> > > + *      link-status without resetting the property to "GOOD", it gets
> > > + *      implicitly reset. This might make the atomic commit fail if the modeset
> > > + *      is unsuccessful.
> >
> > I think this was what Daniel was saying that the kernel should require
> > ALLOW_MODESET to be set for the automatic reset, right?
> 
> Actually this paragraph isn't true. link-status is only reset to GOOD for
> legacy modeset.
> 
> But right now this doesn't matter since no driver reads the link-status
> property value as far as I can tell. Note, only i915 sets link-status
> to BAD.

It's magic ... change in link status results in connectors_change (or
something like that), which forces the modeset (and first recomputation of
mode state) that fixes everything up.

But yeah I entirely missed that the autoreset to GOOD only happens in
legacy modeset.

I guess we might have some atomic compositors with slightly suboptimal
handling of link status failure :-/

> > I'm fine with how the doc is written now. But if ALLOW_MODESET becomes
> > a requirement for the automatic reset, I suspect there is a risk to
> > regress Weston, assuming the automatic reset used to be successful.
> 
> Right now a commit without ALLOW_MODESET won't reset link-status to GOOD,
> but also won't re-train the link on i915. So I think it's fine to require
> ALLOW_MODESET.
> 
> Should drivers read the value of the link-status property? Or should we
> ignore user-space writes to the property and only require ALLOW_MODESET
> to re-train the link?

Well without allow_modeset it'll fail, that's the problem. But since we
dont automatically restore, I think the only problem is that existing
atomic userspace might be stuck on a bad link for a while ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
