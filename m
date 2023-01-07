Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176C660E09
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 11:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E82710E2E4;
	Sat,  7 Jan 2023 10:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A758F10E2DC
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 10:45:18 +0000 (UTC)
Date: Sat, 07 Jan 2023 10:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1673088316; x=1673347516;
 bh=+oyGL873Hk6mqs2Hbhtf79hRnxloFAB5QNFGYKrmXgQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=FVowmh9gd/0j5XCZBrOy84JzrzD6+EphvLLIQbUVwMOQooSvBt2gy/i9Yj7FYlXt7
 J8/nbxIKhdjaY+Z0wJSs85Z4mA/I/58eaQB8sPvwubmIMnLLWVy2DKqa9so7nWnBTU
 eFnQLlMl6UX+F4JYqwZAk0bS96AMEEICQEXugJrfbNyKyEkSz0J2r5QLWqJOdDzy2L
 VN727yVDPA+Dp7VZ+6B87+fHgi/Y1zy2t+XrHALriN16q2JVwcj/IbymYfB0bpHjlL
 MVIT3u1xDMBs0jm0n6r2TJ4F6wjWEEKekZJ9b/hGO8RkXIfPvvuVF/OTr4CnwlfkBE
 NYi6er8UhW0MA==
To: Tao Wu <lepton@google.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: Add a DRM render node to vkms
Message-ID: <leMSjV3Lro5cqAe0WzDVQVYXRhIpds5U9oz8eI1Of9Ee9uvW2d66cmymBQg5I6uJFcSOWLYSnXS5SwrHMxSK7j96LNOZlwtee1U9QYxR3Bs=@emersion.fr>
In-Reply-To: <CAOvqHj4r8OY53bQ6aKLVtSUKnpc4EnTyBjtpPcnWGtGqp8QyXA@mail.gmail.com>
References: <20230105052325.514970-1-yixie@google.com>
 <Y7bVNT0sf5cwEHuj@phenom.ffwll.local>
 <CAHf1YQ55f2mN14ytCz=AB=VSvO8ByKoV59dF50gWVcjcgMkTHg@mail.gmail.com>
 <Y7bbxVzhYCGhCvVN@phenom.ffwll.local>
 <CAHf1YQ4jHeCGqoERpYM6yX8-9pjqiemUN3fT3fpweDTZz6Mrbg@mail.gmail.com>
 <Y7buUnTE91GC+VZb@phenom.ffwll.local>
 <CAOvqHj68uPoPdBrbKaBMg4QOre-EjRJOH12XqBBR+1bAx-fQwA@mail.gmail.com>
 <Y7fvyQ6Ve6duSjho@phenom.ffwll.local>
 <CAOvqHj4r8OY53bQ6aKLVtSUKnpc4EnTyBjtpPcnWGtGqp8QyXA@mail.gmail.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 Yi Xie <yixie@google.com>, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, January 6th, 2023 at 23:28, Tao Wu <lepton@google.com> wrote:

> On Fri, Jan 6, 2023 at 1:54 AM Daniel Vetter daniel@ffwll.ch wrote:
>=20
> > On Thu, Jan 05, 2023 at 01:40:28PM -0800, Tao Wu(=E5=90=B4=E6=B6=9B@Eng=
) wrote:
> >=20
> > > Hi Daniel,
> > >=20
> > > May I know what's the requirement for adding render node support to a
> > > "gpu"? Why we just export render node for every drm devices?
> > > I read document here
> > > https://www.kernel.org/doc/html/v4.8/gpu/drm-uapi.html#render-nodes
> >=20
> > Thus far we've only done it when there's actual rendering capability,
> > which generally means at least some private ioctls.
>=20
> Hi Daniel, it looks like vgem is exporting render node by default.
> Per my understanding, vgem provides some DRM API so users can play
> with graphic buffers. I am feeling it's natural have a v*** device
> which provide
> the surperset which vgem and vkms provides, so it sounds like it's
> natural add rendernode to vkms, or do the opposite, add kms related
> stuff to vgem. I still don't get the point: what kind of issue it
> could bring if we just
> add render node to vkms? If your point is, we don't do that for other
> kms only devices, then my question is, how about we just enable render
> node for every DRM driver? what could go wrong with this approach?

This is wrong for at least two reasons:

- A render node has a semantic value: it indicates whether a device has
  rendering capabilities. If we attach a render node to vkms, we lie
  because vkms has no such capability.
- This would regress user-space. wlroots would no longer accept to
  start with Pixman on vkms, because it detects a render node on the
  device.

I'd advise moving away from abusing DRM dumb buffers in Mesa.
