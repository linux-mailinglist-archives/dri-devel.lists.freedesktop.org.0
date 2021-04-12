Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812BE35C80B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 15:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791E26E0E1;
	Mon, 12 Apr 2021 13:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FD56E0E1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 13:59:07 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id c15so4102633wro.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0lCq/PP/NPlSxhzovf8/ngBRjtYF5XcCA62w8lsVHZg=;
 b=B52Xar4JgeKNAIp5L7U/N5g+dfc/16I7rC757YocA6Jujb8vV5nFGxBZpN1nv/t4Aq
 GxNtvnq4gB1HG0FUxG02b8Mwe7qf40u+GtXlvHJjZfeRWz+lKchYLKc5Y1nx+NWyiD/4
 wj+/Fvj3R7IitG94Jz/ROL+D5YgWIO4V7VjRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0lCq/PP/NPlSxhzovf8/ngBRjtYF5XcCA62w8lsVHZg=;
 b=iaKIdh+XSYptWMLm3y71/9eztfmZBaRcSrZQXu1QKn5YCvkpY4ysjUN4z2Ze+oe1G3
 V5Mg/lf0Z/tyG6OcbOSl46JlGejD7ryA0J8zxMPdU3UjG85KMyVBFC5LvuNwZc1iWhxK
 5ffWh5JV08GLAX3+oV6FcnEmUhsysLHAiAJFX36ewaOfQzrdxWaOTsEojcyx5K6qDpRt
 D57DTguyKsKBRodDYODLREqieJTCtfzWnNU42cvQg3xkDW+ey0kxJbFeV2huj1ktQG9G
 WqKGiPB9nS1c2T3A327VAabDvBFVSC+YhtCjGSUbIDBi3d56QhlWmGyvAF33r/A2IFQM
 hq8Q==
X-Gm-Message-State: AOAM531N7UCDYVZof+vPCowUwlDsdPpvIolK/2fpbiC0EhfXNrsoYd3r
 zIHESfZMlLv0iVNcznDCn3LzFw==
X-Google-Smtp-Source: ABdhPJylLQh5ew4o9kfPVOHulaZa2iA47qdYzKO1pnwUzJxtjKKfjerutuCNMyiWxEP8oY4KGR1d/A==
X-Received: by 2002:adf:e402:: with SMTP id g2mr32252956wrm.1.1618235946119;
 Mon, 12 Apr 2021 06:59:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y31sm15733523wmp.46.2021.04.12.06.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:59:05 -0700 (PDT)
Date: Mon, 12 Apr 2021 15:59:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH 0/2] Document how userspace should use plane format list
 and IN_FORMATS
Message-ID: <YHRSJ2+1JG2hDSdt@phenom.ffwll.local>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
 <YG7qbA3KthIUXhDn@phenom.ffwll.local>
 <14b8b86b-edc5-f726-5920-d5d381d3f538@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14b8b86b-edc5-f726-5920-d5d381d3f538@collabora.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 pekka.paalanen@collabora.co.uk, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 07:24:30PM -0300, Leandro Ribeiro wrote:
> 
> 
> On 4/8/21 8:35 AM, Daniel Vetter wrote:
> > On Tue, Apr 06, 2021 at 04:21:16PM -0300, Leandro Ribeiro wrote:
> >> This patch is to emphasize how userspace should use the plane format list and
> >> the IN_FORMATS blob. The plane format list contains the formats that do not
> >> require modifiers, and the blob property has the formats that support
> >> modifiers.
> >
> > Uh this is a very strong statement that I don't think is supported by
> > kernel driver code. Where is this from.
> >
> >> Note that these are not disjoint sets. If a format supports modifiers but the
> >> driver can also handle it without a modifier, it should be present in both the
> >> IN_FORMATS blob property and the plane format list.
> > 
> > Same here ...
> > 
> 
> Yes, sorry. The wording was not good. To clarify:

Ok I think this context helps.

> I'm trying to document a good approach that userspace *can* (not must)
> take to be able to tell if a certain format can be used in the
> pre-modifier kernel uAPI or if it only works with modifiers.

I think the short summary is "use modifiers everywhere you can".

> The background is that we are reworking the way that Weston stores the
> formats and modifiers supported by the planes, and there were some wrong
> assumptions in the code related to what we can assume that the KMS
> driver supports.
> 
> We've discussed and decided to send a patch to raise a discussion and
> check if the conclusions that we've made were reasonable. And if not,
> what would be a better approach.
> 
> This is part of a MR in which we add support for the dmabuf-hints
> protocol extension in Weston. In sort, in Weston we store the formats
> and modifiers supported by the planes. Then we send them to the client
> and it may pick one of these format/modifier pairs to allocate its
> buffers, increasing the chances of its surface ending up in a plane.
> 
> Here are two commits of the MR that are related to this discussion:
> 
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/544/diffs?commit_id=de6fc18bc35c2e43dff936dd85f310d1f778a7b8

  - drmModePlane's format list (the older, which does not advertise
    modifiers). Formats exposed through this support implicit modifiers.

The above isn't an accurate statement imo. Implied modifiers is a pretty
good mess:
- On most SoC platforms addfb1 actually implies linear. Except mesa got
  that wrong in a bunch of cases, and now everyone is unhappy.
- On i915/amdgpu/radeon there's implicit modifiers. Maybe also on nouveau
  I guess, not sure about any of the others. These don't generally work
  across device instances.
- On the kernel side, for drivers supporting modifiers, figuring out which
  implied modifier to pick is driver specific. There's bugs where
  essentially depending upon use case things wont work out.
- There are currently at least formats which never work with untiled
  modifier, so essentiall useless on addfb1. This applies to some afbc
  compressed formats.

In short: implied modifier is best effort trying to make stuff work,
somewhat, no guarantees.

The real recommendation is to not use implied modifiers if you can, so
also not use addfb1.

> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/544/diffs?commit_id=75363bdb121bda2f326109afca5f4c3259423b7d

Again this isn't reflecting current reality. Right now the kernel puts the
same list into both. There is no meaning attached to these two lists being
different, they are not. Userspace starting to attach meaning pretty much
means we cannot, ever, make them different, and any additional hints would
need to be conveyed through new uapi somewhere else, maybe entire new list
of formats.

Some more fun things around modifiers:
- Some formats don't work at all with untile, so useless with addfb1.
  These got mostly added for afbc support I think.
- What's even more fun and I don't think documented anywhere: The modifier
  list is treated as a bitmask for some drivers, e.g. afbc drivers
  generally don't list all combinations, but just the flags they support.
  So you might get a format+modifier combo that's not even in the list you
  have, and it will actually work (with addfb2)

I think before we add new meaning to these two lists and somehow imply
they can be different (right now they are never different, in any kernel
that shipped ever since modifier support landed) is to document the
current modifier rules.

Cheers, Daniel

> 
> Thanks!
> 
> > I thought these two lists are 100% consistent. If not sounds like driver
> > bugs that we need to maybe validate in drm_plane_init.
> > 
> >> This is important for userspace, as there are situations in which we need to
> >> find out if the KMS driver can handle a certain format without any modifiers.
> > 
> > I don't think you can rely on this. No modifiers means implicit modifier,
> > and the only thing that can give you such buffers is defacto mesa
> > userspace drivers (since that all depends upon driver private magic, with
> > maybe some kernel metadata passed around in private ioctls on the render
> > node).
> > 
> > Maybe for more context, what's the problem you've hit and trying to
> > clarify here?
> > -Daniel
> > 
> >>
> >> Leandro Ribeiro (2):
> >>   drm/doc: document drm_mode_get_plane
> >>   drm/doc: emphasize difference between plane formats and IN_FORMATS
> >>     blob
> >>
> >>  drivers/gpu/drm/drm_plane.c |  4 ++++
> >>  include/uapi/drm/drm_mode.h | 22 ++++++++++++++++++++++
> >>  2 files changed, 26 insertions(+)
> >>
> >> -- 
> >> 2.31.1
> >>
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
