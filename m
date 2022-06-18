Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC22550744
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 00:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A9410F9F6;
	Sat, 18 Jun 2022 22:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 384 seconds by postgrey-1.36 at gabe;
 Sat, 18 Jun 2022 22:20:12 UTC
Received: from condef-09.nifty.com (condef-09.nifty.com [202.248.20.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C84310F9FB;
 Sat, 18 Jun 2022 22:20:12 +0000 (UTC)
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-09.nifty.com
 with ESMTP id 25IM9pU9006240; Sun, 19 Jun 2022 07:09:51 +0900
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 25IM9I0m004434;
 Sun, 19 Jun 2022 07:09:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 25IM9I0m004434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1655590159;
 bh=j6JPk1mHaQ5+DA5zjhwPjod5o+QCcmgN5pr8bzz2rcw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DL+BWe7Bvglr971acdzRYfp36fqAmkSPSfTgd01ZpEjVchfYQDZDp8srCGzw0xlWX
 ItK4yuKfKDK3q7clORHUwhDNzWAd3wqcXc+5tDPND8BSJoq5BscQCFwM3l2r6SGR46
 rUG0WFSobzebOchG0XYvNfYBkcNA24h8G02/kHsRdeFVAQA4fZqMQeMs/51iLgZ0sr
 e9fASdc05DZq5sYj7R+BpbwylQqVXAtoWyJuMqDl+RVqt/68gPyTOSXG9Pm5cRZ+br
 xLUdO7Vxegng554nAm+iEu3dNpneSkFyZvILUAGhiVg4OJZfq+GBk6c42ReRZliSh3
 kWMVakN5MiFaQ==
X-Nifty-SrcIP: [209.85.128.50]
Received: by mail-wm1-f50.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso3960033wmc.4; 
 Sat, 18 Jun 2022 15:09:18 -0700 (PDT)
X-Gm-Message-State: AJIora9RmnhyTaMfPV/97n6E7TuHAE7eO829z5j2GgYTuh6W4a3MXkO/
 PWuMRIFzydjgim1Mu4LNnCTi/Y0CyNb8Tq1KnF8=
X-Google-Smtp-Source: AGRyM1t9nq3U1MhJi8dOFnyZ0ZIk9zYkOQyel6bFep2DghyeRHgzA9mK8BRTGbmxBw5PEt2Hm3wVtuV5tIgnlQkqTM4=
X-Received: by 2002:a05:600c:35c2:b0:39b:fa1f:4f38 with SMTP id
 r2-20020a05600c35c200b0039bfa1f4f38mr16861022wmq.22.1655590157328; Sat, 18
 Jun 2022 15:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220413161450.1854370-1-michel@daenzer.net>
 <f425b789-5081-fa70-555f-7553d7cc5bd5@gmail.com>
 <ca5ca8ab-9c48-8d81-2dd6-fbdfface6519@mailbox.org>
 <abd87438-3ff4-6b62-81b4-6162d167348a@gmail.com>
 <CADnq5_Npy02mWVMOs-TMQ9t6OLV8XFaSQFZ5iB=Y2q3OQgiQvw@mail.gmail.com>
 <fe499d20-2667-5953-831a-d7668c5a3d18@mailbox.org>
 <CAK7LNATdTaY6+FD4TuFgmb00=Qbx=7mmCi9onHv0zi=pdZysBQ@mail.gmail.com>
 <8beac4f5-f7e8-31ab-bbf3-36a917979bfc@mailbox.org>
 <c861e442-e09b-fe20-609c-05bdcb867663@mailbox.org>
In-Reply-To: <c861e442-e09b-fe20-609c-05bdcb867663@mailbox.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 19 Jun 2022 07:08:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQgFXjiT5Js2KDNxp+ep2O7cUVYra31-qZBKTQ_SffLOQ@mail.gmail.com>
Message-ID: <CAK7LNAQgFXjiT5Js2KDNxp+ep2O7cUVYra31-qZBKTQ_SffLOQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Add build directory to include path
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 5:35 PM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
>
> On 2022-04-14 18:57, Michel D=C3=A4nzer wrote:
> > On 2022-04-14 17:04, Masahiro Yamada wrote:
> >> On Thu, Apr 14, 2022 at 10:50 PM Michel D=C3=A4nzer
> >> <michel.daenzer@mailbox.org> wrote:
> >>> On 2022-04-14 15:34, Alex Deucher wrote:
> >>>> On Thu, Apr 14, 2022 at 4:44 AM Christian K=C3=B6nig
> >>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>> Am 14.04.22 um 09:37 schrieb Michel D=C3=A4nzer:
> >>>>>>
> >>>>>>   make -C build-amd64 M=3Ddrivers/gpu/drm
> >>
> >>
> >> Maybe
> >>
> >>         make  O=3Dbuild-arm64   drivers/gpu/drm/
> >>
> >> is the way you were searching for.
> >>
> >> It builds only drivers/gpu/drm/
> >> in the separate directory.
> >
> > Indeed, that works.
>
> I've come to realize that this doesn't produce the actual *.ko modules th=
ough. Is there a trick for building the modules, but only under drivers/gpu=
/drm/ ?
>
>
> --
> Earthling Michel D=C3=A4nzer            |                  https://redhat=
.com
> Libre software enthusiast          |         Mesa and Xwayland developer


No.
There is no way to build *.ko
only under a specific directory.





--=20
Best Regards
Masahiro Yamada
