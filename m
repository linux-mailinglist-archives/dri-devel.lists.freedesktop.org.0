Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867FC91506E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75E910E477;
	Mon, 24 Jun 2024 14:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="slkIqG4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6161710E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:46:15 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dff36345041so4359046276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1719240374; x=1719845174;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TXzN21tnTLvS51wMQL+x2Bbwv0j7XWoQip0f8u+NUp4=;
 b=slkIqG4YxNR//X33oXxYQRaZ/KBga437apQu833oD2l0kDcmOaEOFCLxH/m0BI7K2s
 qAwt5QUPERtham7f+52yCCvT2RpZOrDa8euigzy/5xe+OE/eudTo+N+gxaqxYcNyVujY
 j6R3i2ZzCYRfb4FdjwEgRXuir5Bt/HxNFnK8iBqt3gZ0Igc61LidXUjSA/xLDcV1V9hG
 mfFdYPFHeBQjzhO+Un3275sDu72kLCwhxcofzGPhxElvx2hRMICHYI3yaXyrzavdVnoJ
 hfkelM7Sz483uUyKIn0m573nDZmNHTR3PsXtDhlwydkIRKdN0aAcrBFz0eNY3PVCZvqN
 4XEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240374; x=1719845174;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TXzN21tnTLvS51wMQL+x2Bbwv0j7XWoQip0f8u+NUp4=;
 b=t3yQUS8Wy3hJHeyqGxVEbkSOkHdOqDL7rLWiLTRcIfGrPz04xAdWGNF2rBBHE1yeIt
 8MVFvrj6ZYyxpdYxzg0IOJA1ZGiiQ/8IlbXjT7WZwW0ZxWWrRjjrlWtgBzMtT5P5zOoE
 cbNx5Hhx6udyS+j5bpQD1OcdMg9ydFdsPJcdqN24KUyY1LQ35GjmH0ye/BfS55yhOOXv
 PWtT2PxNToPTNHJi//9xTCe+B7dy60J1CXdhr1Ylqmv7rpiV2VxBsGK0aOB7fHxn4ylx
 2a1pred6GxvzVwmIpbybTjluEC75JwiL93RKwZLJ7VPw8OFXEcHF0tp9F8sHDY6ZW4QR
 ETJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkaII8QnhYD7i1DpqctziI+D4Kh7YxDmGlPcvy7+Exd3ggoLNW0oF5K71EqjeB9Af7mtmKQGcrMRStWQeoDUACorLS7KWCt3uRlY2XWmWY
X-Gm-Message-State: AOJu0Yzl5rgOa9nAYxpj6f2DE3GYnVzvKlIK+oTVxQ9dEFRt2DNJjwY2
 GK4GFjQL2LcarAeCQ4pjFeI3LYqfPsA/S7Ep9aTWDeoPL/2Nl1DDUG4HAQTs4TJ/z8tfcenPUxC
 Dew8UwURlpVOR2B7MSzm+QAESQD8Il2MeMmYBOf6qOyg76V3s
X-Google-Smtp-Source: AGHT+IESJkWV1RwNd1gI+o0xag959yvIJP9B+/3SBZCIoQeLDPGaAt+lYfIbYycbMNeqdMqwYkSxcGcvNNyeEV0lsrw=
X-Received: by 2002:a25:db85:0:b0:e02:bc67:829e with SMTP id
 3f1490d57ef6-e03040515c2mr4162178276.65.1719240374257; Mon, 24 Jun 2024
 07:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
 <20240621-determined-venomous-partridge-eddeb9@houat>
 <CAPY8ntAbaxr-SnqyVR3Drnq-v5Q7ND7tSNzB+pLFFX0wssBAxw@mail.gmail.com>
 <20240624-mighty-fantastic-swine-9c4b98@houat>
In-Reply-To: <20240624-mighty-fantastic-swine-9c4b98@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 24 Jun 2024 15:45:58 +0100
Message-ID: <CAPY8ntDjNAvSfBALhzj67T9sHKEXiiz58jp54VEN-qUJj0hx_g@mail.gmail.com>
Subject: Re: [PATCH 00/31] Preparatory patches for BCM2712 (Pi5) support
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
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

On Mon, 24 Jun 2024 at 15:19, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Fri, Jun 21, 2024 at 11:16:20AM GMT, Dave Stevenson wrote:
> > Morning Maxime
> >
> > On Fri, 21 Jun 2024 at 09:55, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi Dave,
> > >
> > > Thanks for taking the time to send this.
> > >
> > > I've gone through most of the patches and it looks pretty good already,
> > > but I have a few general remarks:
> > >
> > >   - We merged in drm-misc-next the new HDMI infrastructure recently and
> > >     it will heavily conflict with some of these patches, so you need to
> > >     rebase against either linux-next or drm-misc-next.
> >
> > Unless I've really messed up, this is already against drm-misc-next -
> > sorry for not stating that.
> > I've just pulled and rebased again, but I believe the top commit from
> > the tree I created the patches against was
> > c1391205754f drm/tests: add drm_hdmi_state_helper_test MODULE_DESCRIPTION()
> > merged yesterday. I certainly had my VEC patches in the tree.
>
> Sorry, that must be my fault then :)
>
> I saw some patches had what I thought was vc4 prior refactoring, but if
> you're on top of current drm-misc-next, it's all good.

The tree is definitely based on drm-misc-next, and all the tests I've
done are fine. It's still possible that there is an error due to the
refactor, but I hope not.

> > >   - The author and SoB fields for my patches don't match anymore,
> > >     possibly due to mailmap doing its magic.
> >
> > Too much magic in git :-(
> > I went through and updated all your SoB fields, but mailmap appears to
> > mean that the author shown by git log is not the same as the patches
> > created by git format-patch. Never believe what you see. (That feels
> > like a bug in git format-patch).
>
> The duality of a bug/feature :)
>
> > >     You can fix this by using, for the SoB:
> > >     git filter-branch --msg-filter 'sed -i s/maxime@cerno.tech/mripard@kernel.org/' drm-misc-next..
> > >
> > >     And for the authorship:
> > >     git commit --amend --author="Maxime Ripard <mripard@kernel.org>"
> > >     for each commit.
> > >
> > >   - All of the fixes need Fixes that are currently missing on most tags
> >
> > Just as long as no one tries pulling them all back to stable. The
> > number of dependencies would be huge in many cases.
>
> This will probably happen still due to AUTOSEL. Is there any fix that
> shouldn't be backported?

If they backport cleanly then they should all be fine, but I fear that
things like the HDMI infrastructure changes will mean that they won't
(I certainly had a few conflicts in rebasing onto the latest
drm-misc-next).
I guess it's a case of seeing what happens.

  Dave
