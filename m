Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAA073642C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 09:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA4E10E265;
	Tue, 20 Jun 2023 07:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FA210E265;
 Tue, 20 Jun 2023 07:13:48 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9786fc23505so526870566b.2; 
 Tue, 20 Jun 2023 00:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687245224; x=1689837224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cHYZLznLEupvmNgdz85Wsrh9nTfIdkBiscUX255Az7M=;
 b=KS2MlNlXd3y1nTza3BQfUQefl0hUFRyaHJjF0aNqen8fNC0xrWWq2Wqj4BXSO/TymI
 7ZYHqb9Q0z2YI2jLz3j5V3n5Ti55PCYI2DNo0FHlYiLkbjgBrKE94yVJbYGGRKO2JNie
 swEfgr00n17CznG0qqtGxiT9LXeKUpAqB8fL9K0Wiz5Fv4c9DZuG7zH27UlHU+IpIXwj
 /74r3NxBxFV57roZ9AojpB2d+cobw2MJdSENRHLkn+1RSHeZreF8MTrO09njiqaaSNXW
 jaqzeslntv7BXyd++oVljfTIIA2Inss/uW3+u+Ol8tO7biaME1caakBq2wFMkXEmVjx/
 SE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687245224; x=1689837224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cHYZLznLEupvmNgdz85Wsrh9nTfIdkBiscUX255Az7M=;
 b=PhKwlcxI6JmmLWkWzTHLZJvHrXl4pdduwZH/FSCTK3Uo5+0/L3YsFbdMRQaCSirCCr
 q0AiFInv/+Ov5DXj2r6PmedMfx3g/YfNXx/WiQs8LrljIlAEfszM803HREk94NywVTht
 2AquCIx8H5RjbM9Rd6wzThFIVO/BKzxcN2XNCxuVsj6J5IPZUUo6Ll8ncUel72S2CMJl
 loKogaZN8y/4owvxCV+tRo7m5cqbiLBKKCsdNO5zxCGabhmncNKXB/CueLbzfS6uV7uB
 mYTNFkW3Oqh7fLi4nzJX8W1BB47rWiqp4YPr/69uCBzNwTbgkNVbNxUGuESJc2sxtG+u
 K61g==
X-Gm-Message-State: AC+VfDxjTP+GryjyXtpJa7hT5eIwZaJ4tFNlMlCNjv89ruByuQRQE4FW
 6vR2ik6cBxmAyIh4RbrUdfpGGx6M+OUtuk0Xoz8=
X-Google-Smtp-Source: ACHHUZ6F96J1yKxnlaxPS5FMbR2w71s7opnQjEhCe3UpSiAY5D8Q7lBEBoaoOSJHfUY5/idqlvCgI9wkZMATl0p2xeQ=
X-Received: by 2002:a17:907:a412:b0:989:d9d:d911 with SMTP id
 sg18-20020a170907a41200b009890d9dd911mr1975412ejc.69.1687245224382; Tue, 20
 Jun 2023 00:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230620004217.4700-1-dakr@redhat.com>
 <2c92bae3-0003-3c53-8ef1-6e12e5413995@redhat.com>
 <CAPM=9tzMzfuMN_iGD-97_o=QQEDT6Mbb9_u=z_o49TeT7=XUFA@mail.gmail.com>
 <CAFCwf11OwnoxPWHuS_55OXKE7wfHH++1Bk_37DATeCiT07GtMQ@mail.gmail.com>
In-Reply-To: <CAFCwf11OwnoxPWHuS_55OXKE7wfHH++1Bk_37DATeCiT07GtMQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 20 Jun 2023 17:13:31 +1000
Message-ID: <CAPM=9tyv5Fje0iL0-2oJQBKEsg-nc-YV9q4BSg5SwnBvGvrzDw@mail.gmail.com>
Subject: Re: [PATCH drm-next v5 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
To: Oded Gabbay <ogabbay@kernel.org>
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
Cc: matthew.brost@intel.com, willy@infradead.org, corbet@lwn.net,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, mripard@kernel.org,
 linux-mm@kvack.org, boris.brezillon@collabora.com,
 Danilo Krummrich <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Jun 2023 at 17:06, Oded Gabbay <ogabbay@kernel.org> wrote:
>
> On Tue, Jun 20, 2023 at 7:05=E2=80=AFAM Dave Airlie <airlied@gmail.com> w=
rote:
> >
> > Since this is feature is nouveau only currently and doesn't disturb
> > the current nouveau code paths, I'd like to try and get this work in
> > tree so other drivers can work from it.
> >
> > If there are any major objections to this, I'm happy to pull it back
> > out again, but I'd like to get some acks/rb in the next couple of days
> > in order to land some of it.
> >
> > Dave.
> >
> >
> > >
> > > forgot to add your email address to the patch series - sorry about th=
at.
> > >
> > > This series (v5) contains the Documentation changes you requested.
> > >
> > > - Danilo
> > >
> > > On 6/20/23 02:42, Danilo Krummrich wrote:
> > > > This patch series provides a new UAPI for the Nouveau driver in ord=
er to
> > > > support Vulkan features, such as sparse bindings and sparse residen=
cy.
> > > >
> > > > Furthermore, with the DRM GPUVA manager it provides a new DRM core =
feature to
> > > > keep track of GPU virtual address (VA) mappings in a more generic w=
ay.
> > > >
> > > > The DRM GPUVA manager is indented to help drivers implement userspa=
ce-manageable
> > > > GPU VA spaces in reference to the Vulkan API. In order to achieve t=
his goal it
> > > > serves the following purposes in this context.
> > > >
> > > >      1) Provide infrastructure to track GPU VA allocations and mapp=
ings,
> > > >         making use of the maple_tree.
> > > >
> > > >      2) Generically connect GPU VA mappings to their backing buffer=
s, in
> > > >         particular DRM GEM objects.
> Will this manager be able to connect GPU VA mappings to host memory
> allocations (aka user pointers) ?
>
> I only skimmed over the uapi definitions, but from that quick glance I
> saw you can only pass a (gem) handle to the vm bind uapi.
>
> I think it is an important feature because you don't want to have two
> GPU VA managers running in your driver (if that's even possible).
> Maybe we should at least try to make sure the uapi is/will be
> compatible with such an extension.
>

I think that would have to be a new uAPI entry point anyways, since
managing user ptrs is extra, but the uAPI is nouveau specific and
nouveau has no hostptr support as of now.

The gpuva manager is kernel internal, I think adding host ptr tracking
is useful, but I don't think it's a blocker right now.

One of the reasons I'd like to get this in the tree is to add things
like that instead of overloading this initial patchset with feature
creep.

Dave.
