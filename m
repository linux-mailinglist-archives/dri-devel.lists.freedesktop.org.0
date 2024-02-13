Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD08852FAE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 12:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8CB10E3AB;
	Tue, 13 Feb 2024 11:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="IldmvrG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB75C10E597
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 11:40:05 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3c0471954faso129462b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 03:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1707824405; x=1708429205;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5Q2HXSgg+WfNCJ48Lf3xpfGuoRZjbywT1xHUXRUUcU4=;
 b=IldmvrG/66/T4B5jgpBBPaWJm9S8gtMUnv9L9VzoF0HPUjBzM1IgpgFg+FLD52MqBx
 dV6RVKcmgqCqaeRvuS7QLu9B5Pjp3zfydZk90UfzsN2k27mdmTgzd1Fwlyk465CO1Wvc
 Ox6xiLwC5uorFbEvBO9lTXp/Y+vrkgZPj1R8pWXYJLAdZfEOhA83YC/ZkXAF0m7DLfFR
 sTO4SNUEth67NQ+fIoYO9UONNKJk90kZ4MSURs0rl+BdEvdEUByuBVsvQyj7UBnq7/jf
 bJOrSxaM5j3kpi5br7OKatbVVY7Us9nAC/SM+2CTqFapStLXv5x7f4xPH1U3ZTUtu4+4
 ILQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707824405; x=1708429205;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Q2HXSgg+WfNCJ48Lf3xpfGuoRZjbywT1xHUXRUUcU4=;
 b=BsKrJoGSwxG4D2jSv0mgm0Cw/4JP1EI8Z7DVcqlpyRlj9uBey05IhE2/ubwPrS5dq/
 V/RToaeN1q+rH7k32bRQ2jdPdk/1a19L91Xj1V48molMfKRC7+lhUpEhiAO49kWdzEoX
 1xnAol8X5zgrUMRbmHD8qteBou7Tbx0+zKkbjnUf0Yz3s7dIxCWFQG8dfj/1oQU3FRoK
 0pnj+tLA3ytAGlym1SWmZej78Y2rzSo+aBlU7Dmw17yYfNAP1TQwQPKpZ4lxmPkuqL6B
 cIsgUecb8KUc1dlm4ypPKenR7ccWz4oS5l7A53rmaRXMJz68dN2u7xyzVtA7ioh+y09g
 38MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZeSiMmaPKdwXO6xasB0Mj03SfQE4F5k/8YJO6xxhI5kEHJPSNRqpHPzUlxRO3A4u5IHNfiMM2lxNpsAISPKBnxs4RkcHHP2iJfU5BAQRM
X-Gm-Message-State: AOJu0YxzIva4JUTJvCftG2oR9y/Sx5r9pTsjcHYzd10Gi0o0JfXHo1dz
 nWkfUd4tjL1eV/rUX62TvLIu8bhZPxgyIAGdDtaWa9UVf5w7ImrMIZ/mpoLDExata8yh8RJYAtz
 Kj7IAP2o/qPJuufrFnX9JuKoh0IcRMjZAhO7dNA==
X-Google-Smtp-Source: AGHT+IGY/umyWm9bGSp8LHaGaJz80J84aewnjhUP9V6Jb+gnCRdR0+blD57TP5/5wjkX/1eM5Zy3sDhyNB6cBCf5o5M=
X-Received: by 2002:a05:6808:302a:b0:3c0:32d7:b93b with SMTP id
 ay42-20020a056808302a00b003c032d7b93bmr8548576oib.50.1707824404899; Tue, 13
 Feb 2024 03:40:04 -0800 (PST)
MIME-Version: 1.0
References: <20240213-tidss-fixes-v1-0-d709e8dfa505@ideasonboard.com>
 <20240213-tidss-fixes-v1-1-d709e8dfa505@ideasonboard.com>
 <20240213110440.13af335a@eldfell>
 <bb8089cd-2a57-4ed0-a8bd-2140a89b0887@ideasonboard.com>
 <ZctCCCJORdDEaDl1@xpredator>
In-Reply-To: <ZctCCCJORdDEaDl1@xpredator>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 13 Feb 2024 11:39:53 +0000
Message-ID: <CAPj87rPpdOQLLu5oGVfqDUh0_j9NXqc3XgZe5=tcOzUfVoeeqg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/tidss: Fix initial plane zpos values
To: Marius Vlad <marius.vlad@collabora.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, Devarsh Thakkar <devarsht@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 Francesco Dolcini <francesco@dolcini.it>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Randolph Sapp <rs@ti.com>
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

Hi,

On Tue, 13 Feb 2024 at 10:18, Marius Vlad <marius.vlad@collabora.com> wrote:
> On Tue, Feb 13, 2024 at 11:57:59AM +0200, Tomi Valkeinen wrote:
> > I haven't. I'm quite unfamiliar with Weston, and Randolph from TI (cc'd) has
> > been working on the Weston side of things. I also don't know if there's
> > something TI specific here, as the use case is with non-mainline GPU drivers
> > and non-mainline Mesa. I should have been a bit clearer in the patch
> > description, as I didn't mean that upstream Weston has a bug (maybe it has,
> > maybe it has not).

Don't worry about it. We've had bugs in the past and I'm sure we'll
have more. :) Either way, it's definitely better to have the kernel
expose sensible behaviour rather than weird workarounds, unless
they've been around for so long that they're basically baked into ABI.

> > The issue seen is that when Weston decides to use DRM planes for
> > composition, the plane zpositions are not configured correctly (or at all?).
> > Afaics, this leads to e.g. weston showing a window with a DRM "overlay"
> > plane that is behind the "primary" root plane, so the window is not visible.
> > And as Weston thinks that the area supposedly covered by the overlay plane
> > does not need to be rendered on the root plane, there are also artifacts on
> > that area.
> >
> > Also, the Weston I used is a bit older one (10.0.1), as I needed to go back
> > in my buildroot versions to get all that non-mainline GPU stuff compiled and
> > working. A more recent Weston may behave differently.
>
> Right after Weston 10, we had a few minor changes related to the
> zpos-sorting list of planes and how we parse the plan list without having
> a temporary zpos ordered list to pick planes from.
>
> And there's another fix for missing out to set out the zpos for scanout
> to the minimum available - which seems like a good candidate to explain
> what happens in the issue described above. So if trying Weston again,
> please try with at least Weston 12, which should have those changes
> in.

Specifically, you probably want commits 4cde507be6a1 and 58dde0e0c000.
I think the window of breakage was small enough that - assuming either
those commits or an upgrade to Weston 12/13 fixes it - we can just ask
people to upgrade to a fixed Weston.

> > Presuming this is not related to any TI specific code, I guess it's a
> > regression in the sense that at some point Weston added the support to use
> > planes for composition, so previously with only a single plane per display
> > there was no issue.

That point was 12 years ago, so not that novel. ;)

Cheers,
Daniel
