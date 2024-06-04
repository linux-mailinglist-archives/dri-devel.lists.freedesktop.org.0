Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A974D8FA975
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 07:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E5310E424;
	Tue,  4 Jun 2024 05:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MvFjUX9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D8110E319;
 Tue,  4 Jun 2024 05:05:00 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dfa5c4fb6e5so596150276.2; 
 Mon, 03 Jun 2024 22:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717477500; x=1718082300; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rdTDs4hgwusMN7HjgrC/GqmSUqafBHHaPPQoRHzBBI=;
 b=MvFjUX9zCy2nrKrZULDPG5sBT3NRqlcVKflpByx0sWup51buyQ74J26f6ruPpZPHvj
 zuIVBITpKF/xcfV3gShrbsVPaMfIw24qrqrydtQygH3VcK+Oy4fd6RHJmZ9qXXg7S5AH
 JjiqKlL2WniSMpb4aupKQ1RsgiuM6sWjKNvYnHA87tnO6bIYHoOC/zFeKN953RaaarTL
 DvR3bEENsLes+6f//n3gsTt5Q8dBy94sB0eAOjH7RsxOW/9kWaCCV3WuK7HT3SvLMYJu
 nIMtHUh+Q2UZD9Cb+pq4moZ8FM+vK7NrrYqTEnw1s9AJho7M5lzbcTf/wN2FwstHj7R3
 9fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717477500; x=1718082300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/rdTDs4hgwusMN7HjgrC/GqmSUqafBHHaPPQoRHzBBI=;
 b=SVyGfl/ukjHQ6lmu9XiVAb6pFpEWD5/ePVtYrhgcK9J9bywTP0p5BAjovIYtexWvGD
 DXZC82bjnu+KbPGJd23uNnUhQuhSWa26AtZbcG80IdR05AGsTKotlbAsY0ttsuJREAIN
 0GJZIimoJCmcM4ctyo3+F1u1+KzliFxy3DE6oX2VKyA4YAJIVhim4WQHqHaVf525GZnK
 6r1eFqdF5EipzcD7UmU5VMDRIU3VgA66epQbl4vPIFzHLoDNkJwh92L3qE/lEb5OlEk7
 Jc/1poqlGbiF1b5BJC3UDyEWrxEoEpbirNzO4U8w5g4SILx1u0vto9wLamY1sVheObWb
 EBDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoZXEEFg5O1M+JbboQtajdVt/xe7IpBcigoCUc4tpU0lkbyVw2mYm9yR1HzZ1lgViemDMav6eklCC+AzCuYtgm/MYuTvwS7zFSVY2cVsl44anbbCLzrif50chHJwJ4uSvyK95PtWvcH+JwRir+Dw==
X-Gm-Message-State: AOJu0Ywk6ChrTz8raF8tQgk4f5l2JzZw27gEjmldbIE7XZ15Sb6Sradz
 3ND0wgdTwu61nh6a7CyDO+QkVpZGN6v6+9QF5azVytNolldZdzX+cUChe6BUQKD+m1tKMwihGyk
 bCgXsQPSRgy9rYQJMfzCHK6kUtTw=
X-Google-Smtp-Source: AGHT+IFC73Lv9UOogeJX2P9V3Saoj7ztmD07vUjK+txAz9VraaHiwJNLw/ON4EUQCOmYIyTGwjpcVty3afwCyxXhJTs=
X-Received: by 2002:a05:6902:200d:b0:dfa:4ce6:d7a2 with SMTP id
 3f1490d57ef6-dfab9e6580emr1134766276.6.1717477499721; Mon, 03 Jun 2024
 22:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240531053704.2009827-1-olvaffe@gmail.com>
 <ZlmQ3_wcL3cgp4Hb@smile.fi.intel.com>
 <CAPaKu7SsD+X7KAO=3vEYU_7YGM_f+7k1fdC9nEK=-NaJw8oYaA@mail.gmail.com>
 <Zlw1_n20oqchAYxH@smile.fi.intel.com>
 <783e9d9a-e408-c6f0-9a4b-050e1979b919@linux.intel.com>
In-Reply-To: <783e9d9a-e408-c6f0-9a4b-050e1979b919@linux.intel.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 3 Jun 2024 22:04:49 -0700
Message-ID: <CAPaKu7R8avTfAZq-V5H6t6AKAGG1kGbdNK019-DQ5sOR=UOo-w@mail.gmail.com>
Subject: Re: [PATCH] kernel/resource: optimize find_next_iomem_res
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com, 
 alexander.deucher@amd.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alison Schofield <alison.schofield@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, 
 Baoquan He <bhe@redhat.com>, LKML <linux-kernel@vger.kernel.org>
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

On Mon, Jun 3, 2024 at 12:24=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sun, 2 Jun 2024, Andy Shevchenko wrote:
>
> > On Fri, May 31, 2024 at 02:31:45PM -0700, Chia-I Wu wrote:
> > > On Fri, May 31, 2024 at 1:57=E2=80=AFAM Andy Shevchenko <
> > > andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, May 30, 2024 at 10:36:57PM -0700, Chia-I Wu wrote:
> >
> > ...
> >
> > > > P.S> I'm not so sure about this change. It needs a thoroughly testi=
ng, esp.
> > > > in PCI case. Cc'ing to Ilpo.
> >
> > > What's special about PCI?
> >
> > PCI, due to its nature, may rebuild resources either by shrinking or ex=
panding
> > of the entire subtree after the PCI bridge in question. And this may ha=
ppen at
> > run-time due to hotplug support. But I'm not a deep expert in this area=
, Ilpo
> > knows much more than me.
>
> There is code which clearly tries to do expanding resource but that
> usually fails to work as intended because of a parent resource whose size
> is fixed because it's already assigned.
>
> Some other code might block shrinking too under certain conditions.
>
> This area would need to be reworked in PCI core but it's massive and
> scary looking change.
Given the nature of this change (skip checking against children when
the parent does not match), unless a child resource can exceed its
parent resource, I don't think this change affects correctness.

The walk does not hold the resource lock outside of
find_next_iomem_res().  Updating the tree while the walk is in
progress has always been a bit ill-defined.  The patch does not change
that (but it might change the timing a bit).

I can export __walk_iomem_res_desc() and write some unit tests against
it.  Would that be enough to justify this change?

>
> --
>  i.
