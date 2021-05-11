Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493AF37AA0B
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671416EA5A;
	Tue, 11 May 2021 14:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9AE6E1CF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 14:58:55 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso1393548wmj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 07:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XfkDcR1Z2D+6WG001k5mw4iytQ6Bn2suHPz3wHirNdM=;
 b=1X2Hn5l+GTmHIqlFYgTL+PJtmpwu57qUIjGqNsN3u1vixdLZettd+0nPTKe6Ft712/
 dq3I+JXdd/qQc1QYO2r3VkTA8+DvzrM8FAghLAnJ2oV8+XmYBRBrfSXtgpFBdx0TZB6+
 M/lafpMulaTj3SKg3yASa53XuPZ2YLR40TA60GHbcV1jqXQksgS3HatZ0fs2T8ntl9eP
 dCVjPJFqCrBbf0ds7/NQD+QrS7M7SrHWtX0beHK1sOI6lwrt+TPzjq0w2uMcwE3YV/kC
 dPEeyrrocovs69jXAC3T802PomiusJGChL0jsWnR9GDc2RQC24qSY5JtTm5jiM7VQLal
 ziKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XfkDcR1Z2D+6WG001k5mw4iytQ6Bn2suHPz3wHirNdM=;
 b=dNnoiy70i+yreKopUtBu9Z1HvUe+XN/mbGYTrMvJefQl780TMKuvZp7ZeyejDIIlmc
 R2xd24GUOPVJ30MOuxh6CxrpkcNLlL52l1s/JSavNK10208EgZ6krbqRkpc98uRd0R/a
 J1PhoSlZGU2RU3Arp8Dn1eyZOhmCGtCWK7ljnzKalpmQ7F9GXLQCHB/oJvAIdZor+01+
 MeoiM4ht92iSrSwB0tYlOUM6SWoC6hWNfDSr9SetttsWqU/ojvmImB96WLRb7en0WLLx
 Twv7qrobEvM1kyqeQv4E4P7tpL+moGu4fqZsyubCeChHhRo3k6Pd8LqgU6ny0fc/Ddha
 MW/g==
X-Gm-Message-State: AOAM531Eyp4Vn014SHZrEYEdbtcwMPFIaUTXGiZfVW88kpuXTg4bMnUi
 eMP8Is5U4TYTUcBrrkbgjz6swNg7YuAICGL6UCm/0A==
X-Google-Smtp-Source: ABdhPJyXR/eZIjxqRWkNmkeB7Nq8zb2Joj11HhZ1cjj0SaoiZle3FicYMwWEolCqITfgi4V/QF+sE5xopAJgBaDXjOw=
X-Received: by 2002:a1c:2704:: with SMTP id n4mr3052559wmn.147.1620745134562; 
 Tue, 11 May 2021 07:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210506173049.72503-1-matthew.brost@intel.com>
 <20210506173049.72503-2-matthew.brost@intel.com>
 <YJqV5rzTCRNKwPf1@phenom.ffwll.local>
In-Reply-To: <YJqV5rzTCRNKwPf1@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 11 May 2021 15:58:43 +0100
Message-ID: <CAPj87rOdCJMXmCXL9VoJcqvHKWQjLKnwqZ=F=wZ9knGC_8QSNQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC PATCH 1/5] drm/doc/rfc: i915 GuC submission /
 DRM scheduler integration plan
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, carl.zhang@intel.com,
 Jason Ekstrand <jason.ekstrand@intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 11 May 2021 at 15:34, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, May 06, 2021 at 10:30:45AM -0700, Matthew Brost wrote:
> > +No major changes are required to the uAPI for basic GuC submission. The only
> > +change is a new scheduler attribute: I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP.
> > +This attribute indicates the 2k i915 user priority levels are statically mapped
> > +into 3 levels as follows:
> > +
> > +* -1k to -1 Low priority
> > +* 0 Medium priority
> > +* 1 to 1k High priority
> > +
> > +This is needed because the GuC only has 4 priority bands. The highest priority
> > +band is reserved with the kernel. This aligns with the DRM scheduler priority
> > +levels too.
>
> Please Cc: mesa and get an ack from Jason Ekstrand or Ken Graunke on this,
> just to be sure.

A reference to the actual specs this targets would help. I don't have
oneAPI to hand if it's relevant, but the two in graphics world are
https://www.khronos.org/registry/EGL/extensions/IMG/EGL_IMG_context_priority.txt
and https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/chap5.html#devsandqueues-priority
- both of them pretty much say that the implementation may do anything
or nothing at all, so this isn't a problem for spec conformance, only
a matter of user priority (sorry).

Cheers,
Daniel
