Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5028C0612
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 23:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE98A10F70E;
	Wed,  8 May 2024 21:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LkpFwnSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E705D10F70E;
 Wed,  8 May 2024 21:12:39 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1ed41eb3382so1032635ad.0; 
 Wed, 08 May 2024 14:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715202759; x=1715807559; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZrJFIbLTxTYrbPISz2hMEePGMl55QlS4SmkJ5sghxc=;
 b=LkpFwnSar0R81RifQoYT8suCEgUQySymb7FwhX6znUiPuF3FzIRDLpUT78BQj2aODp
 b8X3FMlqdz6NihPEN9W8CBKHNGtNVGuv7PuXKGqZIe7nlPVJCE+w+145YJlAFIqU18jn
 pOsoTlEcaA+0DhC49Hb/vCZ8YhuGtsBoI6gd/NLTR5Pw5ybqZLdCDBcjMq1bv5NU9JuH
 jULlo8FQLXMTHI2gVrQqxs7TQArrF5XB3u/X57hXfo2SznKFF5edQAPC42/kXgP1A1UI
 UfgucPuW9ib/GO2NYa61mZ4iGHpM0FC6fsqPmip/XMdOt9jBYD4RPBAI0G//HA6CIjUf
 O6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715202759; x=1715807559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pZrJFIbLTxTYrbPISz2hMEePGMl55QlS4SmkJ5sghxc=;
 b=vY9TVLoo8XcIU5O2RiZRCBtw6j9lQe2Rq9DSPC4MpdGcYPSXNAJ7L3o1h3s5MY6k7C
 TAJMLPNPjeFI99KTHHdgFOHPyrHpEz5StJXyFXAft+ixaRVBcRCzQSg5BdySiV0skuvy
 zxKsqcv+09pcBJdEVnkXBsUGna+W77SCRDctW3dzaV52xXgnF69ApzsjFKwnV+wz4ZAe
 X7b3hK0WB80cIibkeB2M4dTGKs3xAE9I0MmAUEn5UbzMZz6akxQbgS63KP0Pen7OEYWf
 70ZyTRCM3vjOkZ0pEdtJh640uox2PilwAolMG9cKZe+D7OH/+BXY3fO6mhlKB249oo4a
 EHJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL0aCs9AhXOxia3a0crXz6q1JlxJUKUv6Pqyx2946+NGm5DkHA+Uz89LhBOupBomuoaD2yeJYykdaOkgj94YgSPkqKBZ52s7zsJwyh96DUb1+imi1s/DTetS6/ljFN8Vf/TThT9YgR1pfcNvy011sheXl8bPHTvAXvz4N0DG0bVtORyR8HDWIshXaW1LX269TF87SX8czRJIJhi1XmSWmZvUbV7ea0uIFQvrH+UFojfskvILP5GEFUY3KW6zQcURHEmDJGRWtp50wVTryc3Q==
X-Gm-Message-State: AOJu0Yxzs+DBEu5JTBWg1Z/tytBU4GtRw0yRS8XjcDpCmuHiZStdOU7A
 ifzJ91E42oe5MNGW3gK28w6xK/PkOJ1+6/WyO0LOm1HcMPZrOPN+nyxOkAXnXU0/7dtxbRmTz3a
 smFXbVQi+i+lLl3OUvgV/tAczpesbGaWj
X-Google-Smtp-Source: AGHT+IHxDh3V7MlhtBOeSZmaUOUREgbpbUX+stT5ktTHA7M8CkQTRfPTcAkO7AsXwTWHGXOdozSH9iqT5gOxtlkl7Mw=
X-Received: by 2002:a17:902:b110:b0:1e4:b4f5:5cfa with SMTP id
 d9443c01a7336-1eeb03a05d3mr37380885ad.27.1715202759142; Wed, 08 May 2024
 14:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
 <20240503181333.2336999-2-eahariha@linux.microsoft.com>
 <0a6d4fa9-169f-425b-93d6-04314c617090@linux.microsoft.com>
 <CADnq5_NpxPM-FTcCchdBMRng=6xdM03s93XEX2_8fx44MRVYag@mail.gmail.com>
 <2654ad6e-66b7-4698-94da-892cc9d0802c@linux.microsoft.com>
In-Reply-To: <2654ad6e-66b7-4698-94da-892cc9d0802c@linux.microsoft.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 May 2024 17:12:26 -0400
Message-ID: <CADnq5_PAr6GHEBuStcJ6KVBS+mg64koqJwTDcz+7UcaEy_P_qA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] drm/amdgpu, drm/radeon: Make I2C terminology
 more inclusive
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, 
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>, 
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Evan Quan <evan.quan@amd.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Candice Li <candice.li@amd.com>, 
 Ran Sun <sunran001@208suo.com>, Alexander Richards <electrodeyt@gmail.com>, 
 Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, 
 Ruan Jinjie <ruanjinjie@huawei.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 Wayne Lin <wayne.lin@amd.com>, Samson Tam <samson.tam@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, 
 Sohaib Nadeem <sohaib.nadeem@amd.com>, Charlene Liu <charlene.liu@amd.com>, 
 Tom Chung <chiahsuan.chung@amd.com>, Alan Liu <haoping.liu@amd.com>, 
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, 
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 George Shen <george.shen@amd.com>, 
 Aric Cyr <aric.cyr@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, Dillon Varone <dillon.varone@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Asad kamal <asad.kamal@amd.com>, 
 Kenneth Feng <kenneth.feng@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Darren Powell <darren.powell@amd.com>, Yang Wang <kevinyang.wang@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, Le Ma <Le.Ma@amd.com>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 open list <linux-kernel@vger.kernel.org>
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

On Wed, May 8, 2024 at 4:12=E2=80=AFPM Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> On 5/8/2024 7:53 AM, Alex Deucher wrote:
> > On Tue, May 7, 2024 at 2:32=E2=80=AFPM Easwar Hariharan
> > <eahariha@linux.microsoft.com> wrote:
> >>
> >> On 5/3/2024 11:13 AM, Easwar Hariharan wrote:
> >>> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master=
/slave"
> >>> with more appropriate terms. Inspired by and following on to Wolfram'=
s
> >>> series to fix drivers/i2c/[1], fix the terminology for users of
> >>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exis=
ts
> >>> in the specification.
> >>>
> >>> Compile tested, no functionality changes intended
> >>>
> >>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sa=
ng-engineering.com/
> >>>
> >>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> >>> ---
> >>>  .../gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c  |  8 +++---
> >>>  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       | 10 +++----
> >>>  drivers/gpu/drm/amd/amdgpu/atombios_i2c.c     |  8 +++---
> >>>  drivers/gpu/drm/amd/amdgpu/atombios_i2c.h     |  2 +-
> >>>  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    | 20 ++++++-------
> >>>  .../gpu/drm/amd/display/dc/bios/bios_parser.c |  2 +-
> >>>  .../drm/amd/display/dc/bios/bios_parser2.c    |  2 +-
> >>>  .../drm/amd/display/dc/core/dc_link_exports.c |  4 +--
> >>>  drivers/gpu/drm/amd/display/dc/dc.h           |  2 +-
> >>>  drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c  |  4 +--
> >>>  .../display/include/grph_object_ctrl_defs.h   |  2 +-
> >>>  drivers/gpu/drm/amd/include/atombios.h        |  2 +-
> >>>  drivers/gpu/drm/amd/include/atomfirmware.h    | 26 ++++++++---------
> >>>  .../powerplay/hwmgr/vega20_processpptables.c  |  4 +--
> >>>  .../amd/pm/powerplay/inc/smu11_driver_if.h    |  2 +-
> >>>  .../inc/pmfw_if/smu11_driver_if_arcturus.h    |  2 +-
> >>>  .../inc/pmfw_if/smu11_driver_if_navi10.h      |  2 +-
> >>>  .../pmfw_if/smu11_driver_if_sienna_cichlid.h  |  2 +-
> >>>  .../inc/pmfw_if/smu13_driver_if_aldebaran.h   |  2 +-
> >>>  .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  2 +-
> >>>  .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  2 +-
> >>>  .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  4 +--
> >>>  .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   |  8 +++---
> >>>  drivers/gpu/drm/radeon/atombios.h             | 16 +++++------
> >>>  drivers/gpu/drm/radeon/atombios_i2c.c         |  4 +--
> >>>  drivers/gpu/drm/radeon/radeon_combios.c       | 28 +++++++++--------=
--
> >>>  drivers/gpu/drm/radeon/radeon_i2c.c           | 10 +++----
> >>>  drivers/gpu/drm/radeon/radeon_mode.h          |  6 ++--
> >>>  28 files changed, 93 insertions(+), 93 deletions(-)
> >>>
> >>
> >> <snip>
> >>
> >> Hello Christian, Daniel, David, others,
> >>
> >> Could you re-review v2 since the feedback provided in v0 [1] has now b=
een addressed? I can send v3 with
> >> all other feedback and signoffs from the other maintainers incorporate=
d when I have something for amdgpu
> >> and radeon.
> >
> > This seems like a lot of churn.  Additionally, a bunch of these
> > headers are shared with other OSes, so it's possible some of the
> > changes may end up getting reverted accidently when we sync up or we
> > may add new headers in new code with the old nomenclature and then
> > we'd need to make sure to adjust it to make sure everything was
> > aligned again.  I would just as soon leave things as is, but I'm open
> > to acking them if there is a strong desire to update things.
> >
> > Alex
>
> The way I see it, this is a small downpayment on the debt we have built u=
p so far. Internship
> programs like LF Outreachy to get more underrepresented groups involved i=
n open source are trying to
> change the open source community culture to be more inclusive, but simult=
aneously rely on the culture
> being welcoming enough as well.
>
> I do see the challenge involved in preserving the changes and ensuring no=
 new code is added with
> outdated nomenclature (but see [1]), but culture changes one person at a =
time, and I'd encourage the community
> to do the work needed so we can move past our (mostly) inadvertent role i=
n perpetuating it.
>
> That's my 2c (or your sub-unit currency of choice).

Fair enough.
Acked-by: Aex Deucher <alexander.deucher@amd.com>

>
> Easwar
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D49decddd39e5f6132ccd7d9fdc3d7c470b0061bb
