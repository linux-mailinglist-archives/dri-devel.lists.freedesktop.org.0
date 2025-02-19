Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDB2A3AF22
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 02:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCB010E04A;
	Wed, 19 Feb 2025 01:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CKOS8Ra2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D671810E04A;
 Wed, 19 Feb 2025 01:53:06 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-abb97e15bcbso486689866b.0; 
 Tue, 18 Feb 2025 17:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739929985; x=1740534785; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OnpzSA5D0da2E5gXfZgyp2SBMpmIY3Lp+T05uMZIIZY=;
 b=CKOS8Ra2tDRNy4ndvq1tFHmpipIV+2K8sHJAzaRqqkJbpgBBE/WKeAiw42TQi4PZRn
 nqWb9PxY6b7FRQ0IL7GCv6x0qL06PBfBiej8qXxHVex6RQf1TKRICarodPNhrxBDCJCi
 ryj/3YQnbs+hCRv9jf1Ghnmt+gvDaLRqO/JDoMHPfL5d8lKNT/T3ahJHGi44bndm86Tg
 n5KmjPoiwXXpBmI4zEUpfLV6v5vIqIfmzIPsV56GR3UNRJ1WciiUE2z8yTSitu1+Tf9R
 BKiIjp6ydYZmC/p4i6kMKHcxOdutEvCf3F2EIJg7IpVaqK6sF7JyBPRYImm1DmGfQjUH
 eSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739929985; x=1740534785;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OnpzSA5D0da2E5gXfZgyp2SBMpmIY3Lp+T05uMZIIZY=;
 b=i3RGkiCyotjFBvM1/nsYp0Md5dgEayeT4Y9fUwcoq/gvQkBCZQP1uHZpf+QUhk78To
 0SUbaU1EeoZAF/bOvBObm3TWKftLcGe7mAcXOMbozsAjoXiRlFby00xaJ9DvtHgWCNgD
 yozqMy+e8b8N0JAebaK32H+1HimCv2lI7VPGxZEDr9dl+3TvgUTaQ5CND5J7TfZYt/mZ
 7pJ1EnI/Flt0AVNLaeqyBFgAXIKsZNGXTmKfxyZnQDwy6mMbGtK/FDoLO1HV3UNHSIXH
 Rxqw1JOtNFhtlr4ZKwp5/j0fZkXiGvbK9Rr3Mv6aH4ycruQKAk1caEBPXDJVCIWlnoqj
 Jqqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkd9/g8EnmkULzbQ359hstcEHFxiWxhXiRZ+UN7+crzaJFfiBR4PGSWfUVfQycqNWbZZg1uWopVQ==@lists.freedesktop.org,
 AJvYcCWtm4W6a3RuGZlR/P7B6kSpOJv4MCbcqq4ocN2Tga7khy/3UKPiQg0BPoHMCEV9PzGLf3QtYznSUqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt9IfSf+LPPvFDwuOmiw0PiSjFj+LppoCDQwRlnfFInCro42/6
 AEVoI+RU7lvKW3DOeMPvCli0XffwVfUAVAryMTf1Ge+h4ecei5MfRcB2CUvf0wdSptQVPGaDqD/
 PDJkHNZeY20uUwxnm7fK+y5D/QxE=
X-Gm-Gg: ASbGncsgO4g4Ia9IG1znE4SUNNoyOHDispkuTnRgHI+xsE7aVjnh05egz+R/UkoaWKg
 oTat75naAR4kOhArVBSZ2OkWiMJzDtUQNBNLa5X6muEY4A/11pMecBAucGsI9IgWxju0ZItQ=
X-Google-Smtp-Source: AGHT+IFbsmzek5Cr7bOkU9l46C/zdEYMwnp3M1nmKvqxmpXQuk7dO+yYbbsR2A3drTFMMwE8eQOvSROyJdMhCw8qX6U=
X-Received: by 2002:a17:907:9717:b0:abb:c647:a4bf with SMTP id
 a640c23a62f3a-abbcce890a2mr157794366b.23.1739929985179; Tue, 18 Feb 2025
 17:53:05 -0800 (PST)
MIME-Version: 1.0
References: <20250207012531.621369-1-airlied@gmail.com>
 <Z68_m1iHYN_7a_hH@cassiopeiae>
 <Z69Awxng8zedDwws@cassiopeiae> <Z7SZJXP4APNLNqh2@bombadil.infradead.org>
 <Z7TCWzTVQeEDt0j8@cassiopeiae> <Z7T-B3AqwFL2PWP-@bombadil.infradead.org>
In-Reply-To: <Z7T-B3AqwFL2PWP-@bombadil.infradead.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 19 Feb 2025 11:52:53 +1000
X-Gm-Features: AWEUYZnF0QT5Z8RYQgGY0CIfqtgXUDOLJHKZO1-H9sB-Wy764CW51gX17r9A9Vs
Message-ID: <CAPM=9tzrwb-r3KPRxeLuHKdPYzAa1nL+sWn2UH8pOFuH4ViiVQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: select FW caching
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Russ Weight <russ.weight@linux.dev>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 19 Feb 2025 at 07:39, Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Tue, Feb 18, 2025 at 06:24:43PM +0100, Danilo Krummrich wrote:
> > On Tue, Feb 18, 2025 at 06:28:53AM -0800, Luis Chamberlain wrote:
> > >
> > > What I recommend is to look into why we disable it by default, I think
> >
> > I think FW_CACHE is enabled by default, no?
> >
> > > its sold old obscure reasoning but now suspect it was udev being dumb,
> > > in line with why we also try to defensively try to ignore duplicate
> > > udev requests for module requests causing a flood. Refer to commit
> > > 9b9879fc03275ff ("modules: catch concurrent module loads, treat them as
> > > idempotent") for details.
> >
> > Thanks, that helps a lot.
> >
> > Given that this commit landed in v6.5
>
> That commit lets us ignore the udev floods for superfluous module
> requests only.
>
> > I guess there's not really a concern to
> > force enable FW_CACHE for Nouveau as a fix for commit 176fdcbddfd2
> > ("drm/nouveau/gsp/r535: add support for booting GSP-RM"), which landed in v6.7.
>
> I'd recommmend to look into *why* folks didn't like fw cache to look at
> disabling it in the first place, and look and see if udev was acting up
> and doing stupid things preventing suspend.

This has been on in Fedora for ever, Linus said it was originally on
by default and Greg thinks Android folks had a regression, I don't
think the intersections of nouveau and platforms which had problems a
long time ago is interesting enough to care,

All distros should enable this, it fixes problems, if Android finds a
regression with nouveau it'll bisect to here.

Dave.
>
>  Luis
