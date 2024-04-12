Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 878DE8A327E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 17:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C2210F6F1;
	Fri, 12 Apr 2024 15:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m6JOfjlT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCAA10F6FA;
 Fri, 12 Apr 2024 15:31:35 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-5cf2d73a183so1332002a12.1; 
 Fri, 12 Apr 2024 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712935894; x=1713540694; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fmc6AEO9SFnlCddO3Ut/osiCvKxa8mcl3lOPf++jPmQ=;
 b=m6JOfjlTy+2uvuGprG0nDPIXjAWImvBO6lGsE7ffA+6L/flzUG9xNhJJWM8/+81Cdb
 DLyllG/Ov2xj5RQQxfGBr1Xyh/kmFvGOngUdpz5qF7bAUmphn+lHN8B8kw10qywQqlgx
 NrdvmYDp4POcRD1ebf6B3uRofpmdyxrg/QgLe9DDlarZQ5CVYMP73UgKjENOus3pwrSb
 hhP324C7Mgqbxk5BS47p9ZfseGIOOQfJGMN/PwnneKJhgEiFgZPHoClQKSU9Bfz5SC74
 yftaw389ficdyIBD1ZY5FDFpA0SQs0sU/YGPOwMluX7h4bRvh2a7vrMNVkCF/tEuZ4tg
 tziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712935894; x=1713540694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fmc6AEO9SFnlCddO3Ut/osiCvKxa8mcl3lOPf++jPmQ=;
 b=fIfKpLRBIzLhg5KI6I7RpUHR7frLJ3rPx/oAnQqNz5BC+oZbtZoje8ZGiQVsRlXkdf
 wXbTuYU4Rt9azQwZqQCuBPITWWbFlNW1DAJqzEuQpHK33BgMwFPsSLHJ43WwBTlevTxR
 Sf5Yg23/bfA7TS9PC3WQlHGoF1g2TVNqJ6pTe7mbaWGBV4JPaqBKodBiMsKgGRp9ygAk
 BW1z0E2yQgestXG+3MnsoNzP9jAH8d16LjT5aGl2pb7zfzUf67F8S/bq17VzXD1pvq0r
 fjW05So309wwBitGV2vIVyQzwazP9A9LSt80wPXEp7FqHqyWe5+ZrPw56EvmsKShbHnk
 4ICg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGF3R9HP7UYOe0YSkuLwz7aWXz3+oaE9kK4W1GxeZNhsCaMy0+kNn9HANNRzI6klfcdmNJAObx0RZRk5W/piEd6BdBBJ7ML4mJBt9RfZA5sh3YkL+zYP9yG5WlMbaW//8vb3gRe/dvFHkTuPWVjw==
X-Gm-Message-State: AOJu0YwthQNV2p+H5w6urliXJXSLndfWgspXwqmGJF4VmVJ+HdHxPIHz
 ylnHyRdLfCaC1W8cIIbr0FIisMn5XalASmHmY9FtNHHFdD19oPmESE4bTmBEBkPfDUPAIHJFrsQ
 bGAE/L4+x/UN2JhC14smyJBDL/Zw=
X-Google-Smtp-Source: AGHT+IHSNZXJlry+Ee/PCoefhYKjCNyOmElhVbJBVmyPx3v7U3cP+fguK8K/6+YFU2i2tkWggStzFRRY1YQz9iPmw4w=
X-Received: by 2002:a17:90a:bf0c:b0:2a5:e055:88c4 with SMTP id
 c12-20020a17090abf0c00b002a5e05588c4mr7886402pjs.5.1712935894322; Fri, 12 Apr
 2024 08:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240328163311.34b58b39.pekka.paalanen@collabora.com>
 <1ca9c55b-2358-4357-a337-c0bf5e3e2118@amd.com>
 <20240404132411.5bb5cb53.pekka.paalanen@collabora.com>
 <b1613277-567d-47db-af84-74dfad2e9cf2@amd.com> <Zg63qvnHgutUARrh@xpredator>
 <46968a40-e0e5-4af9-b859-8a41d5992863@amd.com>
 <20240412110325.4afa29ca.pekka.paalanen@collabora.com>
 <7d04e345-b319-4e2f-a1d3-378cc1881144@amd.com>
 <20240412180741.360d8c2b.pekka.paalanen@collabora.com>
In-Reply-To: <20240412180741.360d8c2b.pekka.paalanen@collabora.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Apr 2024 11:31:22 -0400
Message-ID: <CADnq5_MD4EBm4kGuK3fa0azKsMimEnTM3tm-Hy8CN-NNtom3Kw@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Leo Li <sunpeng.li@amd.com>, Marius Vlad <marius.vlad@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
 Chao Guo <chao.guo@nxp.com>, Xaver Hugl <xaver.hugl@gmail.com>, 
 Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader <robert.mader@posteo.de>, 
 Sean Paul <sean@poorly.run>, Simon Ser <contact@emersion.fr>, 
 Shashank Sharma <shashank.sharma@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 12, 2024 at 11:08=E2=80=AFAM Pekka Paalanen
<pekka.paalanen@collabora.com> wrote:
>
> On Fri, 12 Apr 2024 10:28:52 -0400
> Leo Li <sunpeng.li@amd.com> wrote:
>
> > On 2024-04-12 04:03, Pekka Paalanen wrote:
> > > On Thu, 11 Apr 2024 16:33:57 -0400
> > > Leo Li <sunpeng.li@amd.com> wrote:
> > >
>
> ...
>
> > >> That begs the question of what can be nailed down and what can left =
to
> > >> independent implementation. I guess things like which plane should b=
e enabled
> > >> first (PRIMARY), and how zpos should be interpreted (overlay, underl=
ay, mixed)
> > >> can be defined. How to handle atomic test failures could be as well.
> > >
> > > What room is there for the interpretation of zpos values?
> > >
> > > I thought they are unambiguous already: only the relative numerical
> > > order matters, and that uniquely defines the KMS plane ordering.
> >
> > The zpos value of the PRIMARY plane relative to OVERLAYS, for example, =
as a way
> > for vendors to communicate overlay, underlay, or mixed-arrangement supp=
ort. I
> > don't think allowing OVERLAYs to be placed under the PRIMARY is current=
ly
> > documented as a way to support underlay.
>
> I always thought it's obvious that the zpos numbers dictate the plane
> order without any other rules. After all, we have the universal planes
> concept, where the plane type is only informational to aid heuristics
> rather than defining anything.
>
> Only if the zpos property does not exist, the plane types would come
> into play.
>
> Of course, if there actually exists userspace that fails if zpos allows
> an overlay type plane to be placed below primary, or fails if primary
> zpos is not zero, then DRM needs a new client cap.
>
> > libliftoff for example, assumes that the PRIMARY has the lowest zpos. S=
o
> > underlay arrangements will use an OVERLAY for the scanout plane, and th=
e PRIMARY
> > for the underlay view.
>
> That's totally ok. It works, right? Plane type does not matter if the
> KMS driver accepts the configuration.
>
> What is a "scanout plane"? Aren't all KMS planes by definition scanout
> planes?
>
> IOW, if the KMS client understands zpos and can do a proper KMS
> configuration search, and all planes have zpos property, then there is
> no need to look at the plane type at all. That is the goal of the
> universal planes feature.

The optimal configuration with DCN hardware is using underlays.  E.g.,
the desktop plane would be at the top and would have holes cut out of
it for videos or windows that want their own plane.  If you do it the
other way around, there are lots of limitations.

Alex

>
>
> Thanks,
> pq
