Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC7B7364B8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 09:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE83210E173;
	Tue, 20 Jun 2023 07:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB55510E173;
 Tue, 20 Jun 2023 07:34:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70DF161058;
 Tue, 20 Jun 2023 07:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D228C433CC;
 Tue, 20 Jun 2023 07:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687246484;
 bh=x4bDx7j3zJPo8H1+HoyMmJ95wfLoimCtDNuaHTR7vGc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LJ32k4sITWRFtBWDLlr5Rq2XN6LHpbTj5I6Iss6pPs8sYAePnlfRkMV2WIV4UfkFC
 uJD0j+E4w0a2YvZQGw3a+9i7PzNAc49bz6L9WX1yMcl8iznNVyqUGQaJUTDo27zMWv
 NNOJP1Lk/3Y+7CSuflPI7S4cwhOHHPSo97NQLtXPo/CU4YGavtCTuDJtjJzpzDIvf8
 8cE4WvKAE22FULUIspt69sqo011iUeJD3f6GHXwDCDJOO/kbWDof79WzBtULI527AZ
 VoLkfbxh797lZsgh/0TkOZNam9AfSmgpxgE3MsTgxY8gZUKLDDOun2o2tBQrF377dh
 fruysrJDc1g9w==
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-bacf685150cso4388567276.3; 
 Tue, 20 Jun 2023 00:34:44 -0700 (PDT)
X-Gm-Message-State: AC+VfDw9FRgJh0e+T0uKMMN2G9oiqkHD8eaIEZOyp3rocI65ElLQVhHR
 QrrE1opu9pN3S0wz6mLS7UBGx+xaQDjoLn7KalM=
X-Google-Smtp-Source: ACHHUZ6nt1vkY6cIKx9+/4bUFnQjhbMy8aHOW7xNwL8tzPMzbveQbjE9R8a8Nbt4TPn8xorqrMkdKylDP3/d4tqRQzw=
X-Received: by 2002:a25:e786:0:b0:b9e:b9b4:bb12 with SMTP id
 e128-20020a25e786000000b00b9eb9b4bb12mr8461938ybh.48.1687246483175; Tue, 20
 Jun 2023 00:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230620004217.4700-1-dakr@redhat.com>
 <2c92bae3-0003-3c53-8ef1-6e12e5413995@redhat.com>
 <CAPM=9tzMzfuMN_iGD-97_o=QQEDT6Mbb9_u=z_o49TeT7=XUFA@mail.gmail.com>
 <CAFCwf11OwnoxPWHuS_55OXKE7wfHH++1Bk_37DATeCiT07GtMQ@mail.gmail.com>
 <CAPM=9tyv5Fje0iL0-2oJQBKEsg-nc-YV9q4BSg5SwnBvGvrzDw@mail.gmail.com>
In-Reply-To: <CAPM=9tyv5Fje0iL0-2oJQBKEsg-nc-YV9q4BSg5SwnBvGvrzDw@mail.gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 20 Jun 2023 10:34:16 +0300
X-Gmail-Original-Message-ID: <CAFCwf10w37OR_sxUkvORe2AoHTPE08891aMtVnrKJfa9SGTeZA@mail.gmail.com>
Message-ID: <CAFCwf10w37OR_sxUkvORe2AoHTPE08891aMtVnrKJfa9SGTeZA@mail.gmail.com>
Subject: Re: [PATCH drm-next v5 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
To: Dave Airlie <airlied@gmail.com>
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

On Tue, Jun 20, 2023 at 10:13=E2=80=AFAM Dave Airlie <airlied@gmail.com> wr=
ote:
>
> On Tue, 20 Jun 2023 at 17:06, Oded Gabbay <ogabbay@kernel.org> wrote:
> >
> > On Tue, Jun 20, 2023 at 7:05=E2=80=AFAM Dave Airlie <airlied@gmail.com>=
 wrote:
> > >
> > > Since this is feature is nouveau only currently and doesn't disturb
> > > the current nouveau code paths, I'd like to try and get this work in
> > > tree so other drivers can work from it.
> > >
> > > If there are any major objections to this, I'm happy to pull it back
> > > out again, but I'd like to get some acks/rb in the next couple of day=
s
> > > in order to land some of it.
> > >
> > > Dave.
> > >
> > >
> > > >
> > > > forgot to add your email address to the patch series - sorry about =
that.
> > > >
> > > > This series (v5) contains the Documentation changes you requested.
> > > >
> > > > - Danilo
> > > >
> > > > On 6/20/23 02:42, Danilo Krummrich wrote:
> > > > > This patch series provides a new UAPI for the Nouveau driver in o=
rder to
> > > > > support Vulkan features, such as sparse bindings and sparse resid=
ency.
> > > > >
> > > > > Furthermore, with the DRM GPUVA manager it provides a new DRM cor=
e feature to
> > > > > keep track of GPU virtual address (VA) mappings in a more generic=
 way.
> > > > >
> > > > > The DRM GPUVA manager is indented to help drivers implement users=
pace-manageable
> > > > > GPU VA spaces in reference to the Vulkan API. In order to achieve=
 this goal it
> > > > > serves the following purposes in this context.
> > > > >
> > > > >      1) Provide infrastructure to track GPU VA allocations and ma=
ppings,
> > > > >         making use of the maple_tree.
> > > > >
> > > > >      2) Generically connect GPU VA mappings to their backing buff=
ers, in
> > > > >         particular DRM GEM objects.
> > Will this manager be able to connect GPU VA mappings to host memory
> > allocations (aka user pointers) ?
> >
> > I only skimmed over the uapi definitions, but from that quick glance I
> > saw you can only pass a (gem) handle to the vm bind uapi.
> >
> > I think it is an important feature because you don't want to have two
> > GPU VA managers running in your driver (if that's even possible).
> > Maybe we should at least try to make sure the uapi is/will be
> > compatible with such an extension.
> >
>
> I think that would have to be a new uAPI entry point anyways, since
> managing user ptrs is extra, but the uAPI is nouveau specific and
> nouveau has no hostptr support as of now.
>
> The gpuva manager is kernel internal, I think adding host ptr tracking
> is useful, but I don't think it's a blocker right now.
>
> One of the reasons I'd like to get this in the tree is to add things
> like that instead of overloading this initial patchset with feature
> creep.
>
> Dave.
ok, that makes sense.
Thanks,
Oded
