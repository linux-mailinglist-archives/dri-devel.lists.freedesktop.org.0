Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BBE39C0A7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 21:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8856D6F5C7;
	Fri,  4 Jun 2021 19:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389416E0AC;
 Fri,  4 Jun 2021 19:48:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id f5so7429900eds.0;
 Fri, 04 Jun 2021 12:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r9MzDGzl4kF2IWp90BG+oAizg6TuArVr+J/ssWse920=;
 b=ZSOAqKuqtvpVTXY39G34EKW0p3wnokkUEtOW/jg696kULhhRVpnKJUXZARjNOY9ekf
 amuVP2/zDTjPtLnbzwcztrcWa4up6+9PatHjGObt/nd6SvfupGvcVuIMTjQMhXndv1HS
 u4My48p0HdVVko4x5UzdHj40WSOtaUyIKtuuylWp7bfXQ+xFEfIcwZf21LcuU8kXDtFQ
 s4/AgP9fK+Mrt1PFUSAt2pe1x0nhFRdhiKQYjICzeEwB2PfprUN4mwDt4FtL/wOOBq89
 3feNCkvsBV6CkUR6/zDZZLOifg4UmWcWTRn0flrn1WHq5nC4K7yZLq5n/rrA1JJrznyw
 rEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r9MzDGzl4kF2IWp90BG+oAizg6TuArVr+J/ssWse920=;
 b=UXTSU4VIlwIrZCRS/FR+vTTSmb4GGTbjOf4qbLR8QzmOFKQBLLW925sQdJVcmS+Wbb
 YgfDXP3j6NPHhBJ6OnYc1MZqJo73vttrzP7Bezs0GPhXBc6ZQZ2hGgkQNAskTdKUNYgP
 sCFJHSbMS0JPoQYaEgDMrQpEOIvjqgpCFffszkVJcMGGBMKfn1Jj2SbxDCfJvi6zp9An
 9h5sNyBn/blwqjGYuZ3UkjcuFmfBhDcVuiYD7HCX3WmnFvY233sdUitGw5jjmdzy6DnW
 HvohBBSv2wR42DmC1A0fD3l9NSKDVJrcNqhPDS6MdOHTYZFmjXEiaOmslcPm4icAEjMF
 AJTA==
X-Gm-Message-State: AOAM532YPqigSxqp9H+0VknxruI80DYozmBXo0f8Qy99M7PX+oslWycx
 yG3YR4G65ZDgqaJggZ1Kvtxue6jT6moUVtf4dxY=
X-Google-Smtp-Source: ABdhPJwwEZAMuJf8UdMJSEHbC8ig/HVNONdrfrAi5om1xrR/MBjTzQERPnpit5gemlpZily6+VVO7mFdlil5CPvbEio=
X-Received: by 2002:aa7:c545:: with SMTP id s5mr6494600edr.113.1622836114660; 
 Fri, 04 Jun 2021 12:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210526233357.9165-1-matthew.brost@intel.com>
 <20210526233357.9165-2-matthew.brost@intel.com>
 <YLplVgu7y8fzaFF0@phenom.ffwll.local>
In-Reply-To: <YLplVgu7y8fzaFF0@phenom.ffwll.local>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 5 Jun 2021 05:48:23 +1000
Message-ID: <CAPM=9twjUGfXE9bXLap=tyDnKqxP5JXquNR-rO-Zuj05Uv=v9A@mail.gmail.com>
Subject: Re: [Mesa-dev] [Intel-gfx] [RFC PATCH 1/2] drm/doc/rfc: i915 GuC
 submission / DRM scheduler
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, carl.zhang@intel.com,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "Koenig,
 Christian" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 5 Jun 2021 at 03:39, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, May 26, 2021 at 04:33:56PM -0700, Matthew Brost wrote:
> > Add entry for i915 GuC submission / DRM scheduler integration plan.
> > Follow up patch with details of new parallel submission uAPI to come.
> >
> > v2:
> >  (Daniel Vetter)
> >   - Expand explaination of why bonding isn't supported for GuC
> >     submission
> >   - CC some of the DRM scheduler maintainers
> >   - Add priority inheritance / boosting use case
> >   - Add reasoning for removing in order assumptions
> >  (Daniel Stone)
> >   - Add links to priority spec
> >
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>
> You have a one-line hunk in the next patch that probably should be here.
> With that moved.
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Acked-by: Dave Airlie <airlied@redhat.com>

And yes having the todos for GuC tracked would be good externally, so
pressure can be applied for new fw releases with those features.

Dave.
