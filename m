Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DDD6FA31C
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 11:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACC110E1BC;
	Mon,  8 May 2023 09:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF9410E0BC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 09:18:54 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5474ae4f9b7so234698eaf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 02:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1683537534; x=1686129534;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YvRCm7PvleBAbQzxCGTmM1ERcTo8AeWMPUAnQnE2Aro=;
 b=WTOObFrZoXQNJ5IINLxaaq1pjE0AdjlbnQfYY6KAHWFsX1GaNoWkFEPy2SY+GEn1i1
 iaTRT50IHG3kTIOvVyLe8scvluEWvMAVcmdYWln4fjKeDV80WvFggMR0R3DNq3gcnhTX
 KBPSMsFv1VouyqonYk3WtVfvu3OD5HT0qUUAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683537534; x=1686129534;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YvRCm7PvleBAbQzxCGTmM1ERcTo8AeWMPUAnQnE2Aro=;
 b=DiZMTJ5lTuD40zq3WwcemjsPikckq9P3wotgrJ0w8coRCjk+5uoGlLu6erBsMEEJBh
 nAH9mG/mb3ChOUA+yNOddyAmh1scipVquMxhYAJpxKXulAEMip8rcwTWz64JlasZf8v4
 nUJ9C9BlUPdjpqJHrJoDnkaGUvcfbpJhOyPgCr/RZA1v8pkarlmm6rLRyqvd6L6aimtG
 9korODZDII2WI7JjvyqicZzdPSnLGDlvk6Z79zOYd9hAo1G5rdcmBmH79LAdwlbXYLqR
 UenJxdScCjiEhGicDkI00Te8aGr8rP6Fx9cMwKeccy46WB7YXSE37bHV7Lv0lsP5o/yN
 CklQ==
X-Gm-Message-State: AC+VfDx1x/dvu8uIzY92iueydypruvcZrhacg7uaJXPpcHSmR8rJBHzG
 q7pZWG7FiSDkf91+k2DWe+08CIcZEIss767tHx4Fag==
X-Google-Smtp-Source: ACHHUZ4bbOoqB3vvTf4DROfEs6gEqU3QfZDyemHwpENnR4F29WAURCuoeE79YqqB2CD7Aq7WgMLnbnpYRHZ8TVbnCQY=
X-Received: by 2002:aca:efc6:0:b0:38e:76f1:c059 with SMTP id
 n189-20020acaefc6000000b0038e76f1c059mr3651296oih.1.1683537533865; Mon, 08
 May 2023 02:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <ZFUgnMI4IIbv78By@phenom.ffwll.local>
 <-srJIIP1y4EoWtJAfk4_EaRpo7i2x1lXu0HKX4wLHcsmMfnrCdMb0EpPHOdedfZitFpdxIl3rDjBceq_UtYhQSIyJmNMVase-Oa9iP-RQ2o=@emersion.fr>
 <ZFVe1EPIV65ZpaQv@phenom.ffwll.local>
 <DN4DsX1iIafGb2QiXpToAtyTLkdWlCDgHjsIoC_bq9QN0iEVnuZYRH3AM6ER8AtpT0glLr_CUplpU4V7YEI1_lxcYXGeBdX54cdsO3X7-PY=@emersion.fr>
In-Reply-To: <DN4DsX1iIafGb2QiXpToAtyTLkdWlCDgHjsIoC_bq9QN0iEVnuZYRH3AM6ER8AtpT0glLr_CUplpU4V7YEI1_lxcYXGeBdX54cdsO3X7-PY=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 8 May 2023 11:18:42 +0200
Message-ID: <CAKMK7uEk=+YyLJOteDjm6mK315ps=wTsJDY3NZdD_N5vpjL=bw@mail.gmail.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
To: Simon Ser <contact@emersion.fr>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 8 May 2023 at 10:58, Simon Ser <contact@emersion.fr> wrote:
>
> On Friday, May 5th, 2023 at 21:53, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Fri, May 05, 2023 at 04:06:26PM +0000, Simon Ser wrote:
> > > On Friday, May 5th, 2023 at 17:28, Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > > Ok no comments from me on the actual color operations and semantics of all
> > > > that, because I have simply nothing to bring to that except confusion :-)
> > > >
> > > > Some higher level thoughts instead:
> > > >
> > > > - I really like that we just go with graph nodes here. I think that was
> > > >   bound to happen sooner or later with kms (we almost got there with
> > > >   writeback, and with hindsight maybe should have).
> > >
> > > I'd really rather not do graphs here. We only need linked lists as Sebastian
> > > said. Graphs would significantly add more complexity to this proposal, and
> > > I don't think that's a good idea unless there is a strong use-case.
> >
> > You have a graph, because a graph is just nodes + links. I did _not_
> > propose a full generic graph structure, the link pointer would be in the
> > class/type specific structure only. Like how we have the plane->crtc or
> > connector->crtc links already like that (which already _is_ is full blown
> > graph).
>
> I really don't get why a pointer in a struct makes plane->crtc a full-blown
> graph. There is only a single parent-child link. A plane has a reference to a
> CRTC, and nothing more.
>
> You could say that anything is a graph. Yes, even an isolated struct somewhere
> is a graph: one with a single node and no link. But I don't follow what's the
> point of explaining everything with a graph when we only need a much simpler
> subset of the concept of graphs?
>
> Putting the graph thing aside, what are you suggesting exactly from a concrete
> uAPI point-of-view? Introducing a new struct type? Would it be a colorop
> specific struct, or a more generic one? What would be the fields? Why do you
> think that's necessary and better than the current proposal?
>
> My understanding so far is that you're suggesting introducing something like
> this at the uAPI level:
>
>     struct drm_mode_node {
>         uint32_t id;
>
>         uint32_t children_count;
>         uint32_t *children; // list of child object IDs
>     };

Already too much I think

struct drm_mode_node {
    struct drm_mode_object base;
    struct drm_private_obj atomic_base;
    enum drm_mode_node_enum type;
};

The actual graph links would be in the specific type's state
structure, like they are for everything else. And the limits would be
on the property type, we probably need a new DRM_MODE_PROP_OBJECT_ENUM
to make the new limitations work correctly, since the current
DRM_MODE_PROP_OBJECT only limits to a specific type of object, not an
explicit list of drm_mode_object.id.

You might not even need a node subclass for the state stuff, that
would directly be a drm_color_op_state that only embeds
drm_private_state.

Another uapi difference is that the new kms objects would be of type
DRM_MODE_OBJECT_NODE, and would always have a "class" property.

> I don't think this is a good idea for multiple reasons. First, this is
> overkill: we don't need this complexity, and this complexity will make it more
> difficult to reason about the color pipeline. This is a premature abstraction,
> one we don't need right now, and one I heaven't heard a potential future
> use-case for. Sure, one can kill an ant with a sledgehammer if they'd like, but
> that's not the right tool for the job.
>
> Second, this will make user-space miserable. User-space already has a tricky
> task to achieve to translate its abstract descriptive color pipeline to our
> proposed simple list of color operations. If we expose a full-blown graph, then
> the user-space logic will need to handle arbitrary graphs. This will have a
> significant cost (on implementation and testing), which we will be paying in
> terms of time spent and in terms of bugs.

The color op pipeline would still be linear. I did not ask for a non-linear one.

> Last, this kind of generic "node" struct is at odds with existing KMS object
> types. So far, KMS objects are concrete like CRTC, connector, plane, etc.
> "Node" is abstract. This is inconsistent.

Yeah I think I think we should change that. That's essentially the
full extend of my proposal. The classes + possible_foo mask approach
just always felt rather brittle to me (and there's plenty of userspace
out there to prove that's the case), going more explicit with the
links with enumerated combos feels better. Plus it should allow
building a bit cleaner interfaces for drivers to construct the correct
graphs, because drivers _also_ rather consistently got the entire
possible_foo mask business wrong.

> Please let me know whether the above is what you have in mind. If not, please
> explain what exactly you mean by "graphs" in terms of uAPI, and please explain
> why we need it and what real-world use-cases it would solve.

_Way_ too much graph compared to what I'm proposing :-)

Also I guess what's not clear: This is 100% a bikeshed with no impact
on the actual color handling pipeline in any semantic way. At all. If
you think it is, it's not what I mean.

I guess the misunderstanding started out with me asking for "graph
nodes" and you thinking "full blown graph structure with mandatory
flexibility". I really only wanted to bring up the slightly more
generic "node" think, and you can totally think of them as "list
nodes" in the context of color op pipelines.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
