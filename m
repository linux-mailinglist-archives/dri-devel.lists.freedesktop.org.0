Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA736463F6D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 21:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887756E56A;
	Tue, 30 Nov 2021 20:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F55A6E56A;
 Tue, 30 Nov 2021 20:38:38 +0000 (UTC)
Received: from zimbra39-e7.priv.proxad.net (unknown [172.20.243.189])
 by smtp2-g21.free.fr (Postfix) with ESMTP id 8402220039C;
 Tue, 30 Nov 2021 21:38:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638304716;
 bh=BSi4guHsEM8mlRKzJG+rTT+blmvXiTQLuDQjWIB0UOs=;
 h=Date:From:To:Cc:In-Reply-To:Subject:From;
 b=iK9ykl4PVoM3GAtmNfi8BdFSL5PCEmCG3rMzyjwqmF5f4ghaXd3olEtOEb2BHE7G+
 wW3mPsC8FLYcqmnDMAf7UU/7skpQWwGDrJQjv5Ok5SsgaR+B2itmIY2z9BMVntdFHI
 1R4r7vMyUFBWzYn3BVCuib9XwbzpznYCJ4Wde1NyzKPhEVZIpacP93xenL+SFxip/Q
 A7AV1Wa2i9ynwE8BF8dOdFJ3rcdUYLcMwziEOCAsJsK7uxrw8D6/r3g23ZFuUWPipk
 Ge2FdDkLCXBfb94MhpAuA0r47CJnBIMvNAtERPkX3z//JeFW8bN00sNtKukjovX9Cb
 sMukj480GMjTA==
Date: Tue, 30 Nov 2021 21:38:35 +0100 (CET)
From: Yann Dirson <ydirson@free.fr>
To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <394109792.1928055.1638304715452.JavaMail.root@zimbra39-e7>
In-Reply-To: <24a1be4c-0186-96ac-b238-059754a9f856@amd.com>
Subject: Re: [PATCH 1/6] Documentation/gpu: Reorganize DC documentation
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [88.120.44.86]
X-Mailer: Zimbra 7.2.0-GA2598 (ZimbraWebClient - FF3.0 (Linux)/7.2.0-GA2598)
X-Authenticated-User: ydirson@free.fr
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
Cc: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-doc@vger.kernel.org, Mark Yacoub <markyacoub@chromium.org>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, roman li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Roman Gilg <subdiff@gmail.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 aurabindo pillai <aurabindo.pillai@amd.com>,
 nicholas choi <nicholas.choi@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 qingqing zhuo <qingqing.zhuo@amd.com>,
 bhawanpreet lakha <bhawanpreet.lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On 2021-11-30 10:48 a.m., Harry Wentland wrote:
> > On 2021-11-30 10:46, Rodrigo Siqueira Jordao wrote:
> >>
> >>
> >> On 2021-11-29 7:06 a.m., Jani Nikula wrote:
> >>> On Fri, 26 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> >>>> On Thu, Nov 25, 2021 at 10:38:25AM -0500, Rodrigo Siqueira
> >>>> wrote:
> >>>>> Display core documentation is not well organized, and it is
> >>>>> hard to find
> >>>>> information due to the lack of sections. This commit
> >>>>> reorganizes the
> >>>>> documentation layout, and it is preparation work for future
> >>>>> changes.
> >>>>>
> >>>>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> >>>>> ---
> >>>>>  =C2=A0 Documentation/gpu/amdgpu-dc.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 74
> >>>>>  =C2=A0 -------------------
> >>>>>  =C2=A0 .../gpu/amdgpu-dc/amdgpu-dc-debug.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +
> >>>>>  =C2=A0 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst=C2=A0=C2=A0=C2=A0=
=C2=A0 | 29 ++++++++
> >>>>>  =C2=A0 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst=C2=A0=C2=A0=C2=A0=
=C2=A0 | 42
> >>>>>  =C2=A0 +++++++++++
> >>>>>  =C2=A0 Documentation/gpu/drivers.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 +-
> >>>>>  =C2=A0 5 files changed, 76 insertions(+), 75 deletions(-)
> >>>>>  =C2=A0 delete mode 100644 Documentation/gpu/amdgpu-dc.rst
> >>>>>  =C2=A0 create mode 100644
> >>>>>  =C2=A0 Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
> >>>>>  =C2=A0 create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc.rs=
t
> >>>>>  =C2=A0 create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dm.rs=
t
> >>>>>
> >>>>> diff --git a/Documentation/gpu/amdgpu-dc.rst
> >>>>> b/Documentation/gpu/amdgpu-dc.rst
> >>>>> deleted file mode 100644
> >>>>> index f7ff7e1309de..000000000000
> >>>>> --- a/Documentation/gpu/amdgpu-dc.rst
> >>>>> +++ /dev/null
> >>>>> @@ -1,74 +0,0 @@
> >>>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>> -drm/amd/display - Display Core (DC)
> >>>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>> -
> >>>>> -*placeholder - general description of supported platforms,
> >>>>> what dc is, etc.*
> >>>>> -
> >>>>> -Because it is partially shared with other operating systems,
> >>>>> the Display Core
> >>>>> -Driver is divided in two pieces.
> >>>>> -
> >>>>> -1. **Display Core (DC)** contains the OS-agnostic components.
> >>>>> Things like
> >>>>> -=C2=A0=C2=A0 hardware programming and resource management are hand=
led
> >>>>> here.
> >>>>> -2. **Display Manager (DM)** contains the OS-dependent
> >>>>> components. Hooks to the
> >>>>> -=C2=A0=C2=A0 amdgpu base driver and DRM are implemented here.
> >>>>> -
> >>>>> -It doesn't help that the entire package is frequently referred
> >>>>> to as DC. But
> >>>>> -with the context in mind, it should be clear.
> >>>>> -
> >>>>> -When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by
> >>>>> default for
> >>>>> -supported ASICs. To force disable, set `amdgpu.dc=3D0` on kernel
> >>>>> command line.
> >>>>> -Likewise, to force enable on unsupported ASICs, set
> >>>>> `amdgpu.dc=3D1`.
> >>>>> -
> >>>>> -To determine if DC is loaded, search dmesg for the following
> >>>>> entry:
> >>>>> -
> >>>>> -``Display Core initialized with <version number here>``
> >>>>> -
> >>>>> -AMDgpu Display Manager
> >>>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>> -
> >>>>> -.. kernel-doc::
> >>>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>> -=C2=A0=C2=A0 :doc: overview
> >>>>> -
> >>>>> -.. kernel-doc::
> >>>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> >>>>> -=C2=A0=C2=A0 :internal:
> >>>>> -
> >>>>> -Lifecycle
> >>>>> ----------
> >>>>> -
> >>>>> -.. kernel-doc::
> >>>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>> -=C2=A0=C2=A0 :doc: DM Lifecycle
> >>>>> -
> >>>>> -.. kernel-doc::
> >>>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>> -=C2=A0=C2=A0 :functions: dm_hw_init dm_hw_fini
> >>>>> -
> >>>>> -Interrupts
> >>>>> -----------
> >>>>> -
> >>>>> -.. kernel-doc::
> >>>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> >>>>> -=C2=A0=C2=A0 :doc: overview
> >>>>> -
> >>>>> -.. kernel-doc::
> >>>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> >>>>> -=C2=A0=C2=A0 :internal:
> >>>>> -
> >>>>> -.. kernel-doc::
> >>>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>> -=C2=A0=C2=A0 :functions: register_hpd_handlers dm_crtc_high_irq
> >>>>> dm_pflip_high_irq
> >>>>> -
> >>>>> -Atomic Implementation
> >>>>> ----------------------
> >>>>> -
> >>>>> -.. kernel-doc::
> >>>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>> -=C2=A0=C2=A0 :doc: atomic
> >>>>> -
> >>>>> -.. kernel-doc::
> >>>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>> -=C2=A0=C2=A0 :functions: amdgpu_dm_atomic_check
> >>>>> amdgpu_dm_atomic_commit_tail
> >>>>> -
> >>>>> -Display Core
> >>>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>> -
> >>>>> -**WIP**
> >>>>> -
> >>>>> -FreeSync Video
> >>>>> ---------------
> >>>>> -
> >>>>> -.. kernel-doc::
> >>>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>> -=C2=A0=C2=A0 :doc: FreeSync Video
> >>>>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
> >>>>> b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
> >>>>> new file mode 100644
> >>>>> index 000000000000..bbb8c3fc8eee
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
> >>>>> @@ -0,0 +1,4 @@
> >>>>> +Display Core Debug tools
> >>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >>>>> +
> >>>>> +TODO
> >>>>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> >>>>> b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> >>>>> new file mode 100644
> >>>>> index 000000000000..3685b3b1ad64
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> >>>>
> >>>> While we bikeshed names, I think it'd would make sense to call
> >>>> this
> >>>> overview.rst or intro.rst or similar, since it's meant to
> >>>> contain the
> >>>> overall toctree for everything amdgpu related (maybe there will
> >>>> be more in
> >>>> the future).
> >>>
> >>> index.rst?
> >>>
> >>>
> >>
> >> Hi,
> >>
> >> Thanks a lot for the suggestions; I will prepare a V2 that
> >> addresses all your comments.
> >>
> >> Ps.: If there is no objection, I'll rename amdgpu-dc to index as
> >> Jani suggested.
> >>
> >=20
> > SGTM, you mean amdgpu/index.rst, right?
>=20
> Yeah, but I'm also thinking about this new organization:
>=20
> 1. Create an amdgpu folder.
> 2. Inside amdgpu folder, I want to create a display folder.
> 3. Move all display documentation to the display folder and keep
> other
> amdgpu generic things under amdgpu.
> 4. Finally, inside the amdgpu folder, I'll create the index.rst for
> amdgpu, and inside the display folder, I will create a similar file.

Since the source tree has amd/amdgpu/ and amd/display/, wouldn't it
be useful to mirror that layout ?
