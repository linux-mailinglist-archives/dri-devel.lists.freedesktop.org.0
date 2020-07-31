Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4F82346B0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C136EA9A;
	Fri, 31 Jul 2020 13:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73DE6EA9A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:18:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r2so22897440wrs.8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 06:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9uRwfVGee9z4gDePaB/iWGL6DLKzkkwcOKMgo2dfRkE=;
 b=DOSytCciSHME/c0tQQp2S3zY3t1yf/zkVKuztdxuHlxOJ+LupGx/KT8BQlgcd3cF9C
 ZJOhE3MmQqV4vL9nh0unXADaOnKb6v7S27c2VLEeWF6+fJUlHY4PXdXmN54B0aATyZKk
 zjXtuwiTsePmBrTVvJ+CeIl5vnBtux5+67Q0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9uRwfVGee9z4gDePaB/iWGL6DLKzkkwcOKMgo2dfRkE=;
 b=mPaeDOhEj3bw2+1shRLM55xFYEUrL2op97mEUtoaa4lwVVNvo/gNu9GZrutCaJUiXW
 DmuABc2+VlsyROBQ7gmXLSEicZgc9/N4Hwh9cd7PBglSAvdEUZu6HZfwDTv0IUoC84zv
 b21xmEzQfvkk4trbIg3nwfMZx01MnJaDJwcwvTPsXYkhf4qHjrg6zgcP4j/R8i5IzWPg
 /KLpmLn8y5jRjOhr37s2LjoImziOwY9b2t/30l0iXv80N+kB5jAH3lG8duFKwOpi7xcM
 X+o8bPX2oFtK4sAcy7bctz5emQ69IeWUde03gm5C5ZihnEJ9XzlKA7RJbNTDxOh2wVhF
 mVFA==
X-Gm-Message-State: AOAM531LdlV6iVTxtFlp+6iZv641mPXxdjPEi1hZa01pSQKplbM5H8CF
 Pnt7M2kiARjGgBw2dSjfW9JekA==
X-Google-Smtp-Source: ABdhPJzJzzng7GsXStbODXQYeEtc9yyc+9/R5XjKD0lT0kYVbRdzKRKf/RVWN62F1qfE2iAlUX2qUw==
X-Received: by 2002:adf:f341:: with SMTP id e1mr3749588wrp.207.1596201488371; 
 Fri, 31 Jul 2020 06:18:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h23sm11985829wmb.3.2020.07.31.06.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 06:18:07 -0700 (PDT)
Date: Fri, 31 Jul 2020 15:18:05 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 26/49] drm/ttm: add wrapper to get manager from bdev.
Message-ID: <20200731131805.GD6419@phenom.ffwll.local>
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-27-airlied@gmail.com>
 <43f848a2-579a-873f-4271-7bff0968888b@suse.de>
 <CAPM=9twAMwKsx_nSYz5tSFAb=Pp0m_SVWt+rewMk3RFVoUM4+A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9twAMwKsx_nSYz5tSFAb=Pp0m_SVWt+rewMk3RFVoUM4+A@mail.gmail.com>
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Koenig,
 Christian" <christian.koenig@amd.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 31, 2020 at 05:21:38PM +1000, Dave Airlie wrote:
> On Fri, 31 Jul 2020 at 17:14, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi
> >
> > Am 31.07.20 um 06:04 schrieb Dave Airlie:
> > > From: Dave Airlie <airlied@redhat.com>
> > >
> > > This will allow different abstractions later.
> >
> > You should consider moving this patch to the beginning of the series, so
> > that patches 1 to 25 can benefit from it.
> 
> I did consider it, but I'd have to move all the follow on patches as
> well, and it got messy in rebase land, and I started introducing
> errors, so I left it alone, and it's not necessary until the patch
> that changes it's definition anyways.

I like this ordering a lot better, it gives a clear separation between the
different steps. Some code gets touched multiple times, but interleaving
the demidlayering would only make this worse I think.
-Daniel
> 
> Dave.
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
