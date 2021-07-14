Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320A63C868D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 17:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7046E1F3;
	Wed, 14 Jul 2021 15:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8166E1F3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 15:02:22 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l7so3608918wrv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 08:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=69w+z8JoXYSnbwOBKKpmUamhnEyqL/avmTKA+C4lMEY=;
 b=EPZ3o0qksnwmpDdR5qBMIUCBF2nDe1/LnvgVsRL0Uwn4u1966C5R0oynHkzDAMKTep
 MWRMvT9QbZRvzkJH2VgevF1v1XtiDt9PyMkkstslRN8KAOYbR7+kEj2EfRfUyeYHDSuF
 27Z0DYgyvF/y9RpbDW5K8wF1/NZF8S8cRl0j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=69w+z8JoXYSnbwOBKKpmUamhnEyqL/avmTKA+C4lMEY=;
 b=rzP96Hx0eaa0d0dbwGgd8ABO+ZLu51b6j1fVtOkp7vVvVeC9CEEbv6fGxE5o/4K54e
 FfZfBvC21W1yKYMqBLbB1S8n8Vq0gn23gE4Rls0QyreUCKajj3st5K5l5XO1gP3vZCKV
 8QjplqS4IJgPEoYDsQL9K+MbbAcxEwdZ9xSttxZE3zywVS117ZX0VfAoCOJE9Ia4tVIc
 4b8N2ieoZGwhQGbac/1VsecrfG74Q3pbO0Vga4gqK2FPVPb15Mxws7Ho1eWoOSjq2eza
 EdoERuCxMR+ThIDOLB7SheZMrxwvAU70r/eteeeX5hazoVGU7807jRrgB8rZmP2By935
 HU1g==
X-Gm-Message-State: AOAM531p8nywFA51jdcWeEhzM+MW0IwVKa1v5KRobb27ptcWBRjYayKR
 PmgbV0/cFP1eb/qXtk1n3O+zVg==
X-Google-Smtp-Source: ABdhPJy9TYv3Dvc+7HTbNWDhitjGCLCY3N4IXMufP5bnqtdWagmFMkGNl9XOCiGVaKFbQMoPLbiAnw==
X-Received: by 2002:a05:6000:136a:: with SMTP id
 q10mr13713546wrz.25.1626274941640; 
 Wed, 14 Jul 2021 08:02:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b187sm5753264wmd.40.2021.07.14.08.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:02:20 -0700 (PDT)
Date: Wed, 14 Jul 2021 17:02:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: nouveau: failed to initialise sync
Message-ID: <YO78eo/MNcPMYAgC@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 "Kirill A. Shutemov" <kirill@shutemov.name>, airlied@linux.ie,
 Alistair Popple <apopple@nvidia.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>, bskeggs@redhat.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <YOC4uekpD7iA3xPi@Red> <1682547.0nLxAY2a9E@nvdebian>
 <dace0dea-7ca9-99cb-ad80-106824cb5e3f@amd.com>
 <20210714125652.eohw2s2pncplxovx@box.shutemov.name>
 <8fd70eb5-7306-89a3-57f9-d633243c9df5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fd70eb5-7306-89a3-57f9-d633243c9df5@amd.com>
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Corentin Labbe <clabbe.montjoie@gmail.com>,
 bskeggs@redhat.com, "Kirill A. Shutemov" <kirill@shutemov.name>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 03:02:21PM +0200, Christian König wrote:
> Am 14.07.21 um 14:56 schrieb Kirill A. Shutemov:
> > On Tue, Jul 06, 2021 at 08:58:37AM +0200, Christian König wrote:
> > > Hi guys,
> > > 
> > > yes nouveau was using the same functionality for internal BOs without
> > > noticing it. This is fixes by the following commit:
> > > 
> > > commit d098775ed44021293b1962dea61efb19297b8d02
> > > Author: Christian König <christian.koenig@amd.com>
> > > Date:   Wed Jun 9 19:25:56 2021 +0200
> > > 
> > >      drm/nouveau: init the base GEM fields for internal BOs
> > > 
> > >      TTMs buffer objects are based on GEM objects for quite a while
> > >      and rely on initializing those fields before initializing the TTM BO.
> > > 
> > >      Nouveau now doesn't init the GEM object for internally allocated BOs,
> > >      so make sure that we at least initialize some necessary fields.
> > > 
> > > Could be that the patch needs to be send to stable as well.
> > The regression is present in v5.14-rc1. Any idea when it will hit
> > upstream? I don't see it being applied to drm=next.
> 
> Well that question needs to answer Dave or somebody else from the drm-misc
> maintainer team.
> 
> This fix together with some others are already in drm-misc-next-fixes
> waiting to be pushed upstream, but it looks like that hasn't happened yet.
> 
> Even Linus already pinged me where the fix for qxl got stuck.

Yeah there was some missed patches. drm-misc-fixes is now in drm-fixes,
and drm-misc-next-fixes is included in drm-misc-fixes, for which Thomas
will do a pull request on Thu so it will land in -rc2.

It should also now be in linux-next.

But yes somehow bugfixes got a bit lost during the merge window.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
