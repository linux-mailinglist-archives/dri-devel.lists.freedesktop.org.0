Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A995945B30
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 11:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D354F10E9C4;
	Fri,  2 Aug 2024 09:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.bix.bg (mail.bix.bg [193.105.196.21])
 by gabe.freedesktop.org (Postfix) with SMTP id C943310E9C4
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 09:40:17 +0000 (UTC)
Received: (qmail 7760 invoked from network); 2 Aug 2024 09:40:16 -0000
Received: from d2.declera.com (212.116.131.122)
 by indigo.declera.com with SMTP; 2 Aug 2024 09:40:16 -0000
Message-ID: <fc75ca479e78f0f7baf9a7442b9907c588647fb8.camel@declera.com>
Subject: Re: bisected/regression: choopy youtube video on Ryzen IGP -
 0ddd2ae586d2 drm/ttm: increase ttm pre-fault value to PMD size
From: Yanko Kaneti <yaneti@declera.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Zhu,
 Lingshan" <Lingshan.Zhu@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "dri-devel@lists.freedesktop.org"	 <dri-devel@lists.freedesktop.org>, Li
 Jingxiang <jingxiang.li@ecarxgroup.com>
Date: Fri, 02 Aug 2024 12:40:16 +0300
In-Reply-To: <43b8f01904131c9d3461436c0d1c916663f721e2.camel@declera.com>
References: <20240604084934.225738-1-lingshan.zhu@amd.com>
 <26c01e3b726812979846710afcaab81e92da6a40.camel@declera.com>
 <a7dc49b7-0da2-4fbf-a045-1bcd72ebaa8c@amd.com>
 <43b8f01904131c9d3461436c0d1c916663f721e2.camel@declera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.1 (3.53.1-2.fc41) 
MIME-Version: 1.0
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

Hi,=20

So, can't reproduce this any more with with recent rawhide (rc1+).
Tried also with the same old kernels but this time its with newer mesa
and google-chrome (126 -> 127). The same scenario as before now works
ok.

Cheers and sorry for the noise.
- Yanko

On Wed, 2024-07-24 at 10:13 +0300, Yanko Kaneti wrote:
> Hi,
>=20
> Well, it starts, then within a second or two it begins stuttering with
> long (half a second/second) freezes of the video , while the audio seems
> to work fine. Nothing in the log from chrome or kernel , AFAICS,  to
> show anything is wrong.
>=20
> Regards
> Yanko
>=20
> On Wed, 2024-07-24 at 09:02 +0200, Christian K=C3=B6nig wrote:
> > Hi Yanko,
> >=20
> > interesting. What do you mean with "choppy"? E.g. lag on startup?
> >=20
> > Regards,
> > Christian.
> >=20
> > Am 23.07.24 um 21:42 schrieb Yanko Kaneti:
> > > Hello,
> > >=20
> > > Noticed and bisected a rawhide (with the new 6.11-rc0 snapshots) regr=
ession to this commit:
> > >=20
> > >    0ddd2ae586d2 drm/ttm: increase ttm pre-fault value to PMD size
> > >=20
> > > The regression manifests in choppy youtube video playback in google-c=
hrome-stable.
> > >   https://www.youtube.com/watch?v=3DuOpl2XNOgMA
> > >   google-chrome-stable-126.0.6478.182-1.x86_64
> > >   VP9 video,
> > >   Chrome -> Override software rendering list -> on
> > >   Chrome -> Hardware-accelerated video decode - default enabled
> > >=20
> > > No other visible graphics issues.
> > >=20
> > > Its a desktop system with Ryzen 7 5700GRyzen 7 5700G  IGP
> > > [AMD/ATI] Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] [1=
002:1638]
> > >=20
> > > Tested with linus tip and just reverting the commit fixes the issue.
> > >=20
> > > Sorry for the brevity, not sure what other details might be relevant.
> > >=20
> > > - Yanko
> > >=20
> > >=20
> >=20
>=20

