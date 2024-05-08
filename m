Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF58C055D
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 22:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E8911295A;
	Wed,  8 May 2024 20:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="ftTVBurk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 94A45112959;
 Wed,  8 May 2024 20:12:03 +0000 (UTC)
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net
 [73.118.245.227])
 by linux.microsoft.com (Postfix) with ESMTPSA id 53C9B2083CB0;
 Wed,  8 May 2024 13:12:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 53C9B2083CB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1715199122;
 bh=YQLVi+zPNdIy/0huyFzR9lAKIP+Jz+4FnUm+Tl+eDcA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ftTVBurkguwhKOiJhK1awfGao4KUzY3bAftTWFWq9LkQH3VQ7WP991P6AE9zwe41s
 RMvuQ0BxvO5trYbdHZZazQNmtSwcFlLoafwuffuXrwDd5CYh+2vixLqYJI55BXhKoX
 5zYejGwj46nmDpVRiLxKt37iz/NegfHOjWptLljg=
Message-ID: <2654ad6e-66b7-4698-94da-892cc9d0802c@linux.microsoft.com>
Date: Wed, 8 May 2024 13:12:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] drm/amdgpu, drm/radeon: Make I2C terminology
 more inclusive
To: Alex Deucher <alexdeucher@gmail.com>
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
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Candice Li <candice.li@amd.com>, Ran Sun <sunran001@208suo.com>,
 Alexander Richards <electrodeyt@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Heiner Kallweit <hkallweit1@gmail.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Samson Tam <samson.tam@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Sohaib Nadeem <sohaib.nadeem@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 George Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, Dillon Varone
 <dillon.varone@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Asad kamal <asad.kamal@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Darren Powell <darren.powell@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, Le Ma <Le.Ma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
 <20240503181333.2336999-2-eahariha@linux.microsoft.com>
 <0a6d4fa9-169f-425b-93d6-04314c617090@linux.microsoft.com>
 <CADnq5_NpxPM-FTcCchdBMRng=6xdM03s93XEX2_8fx44MRVYag@mail.gmail.com>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <CADnq5_NpxPM-FTcCchdBMRng=6xdM03s93XEX2_8fx44MRVYag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 5/8/2024 7:53 AM, Alex Deucher wrote:
> On Tue, May 7, 2024 at 2:32 PM Easwar Hariharan
> <eahariha@linux.microsoft.com> wrote:
>>
>> On 5/3/2024 11:13 AM, Easwar Hariharan wrote:
>>> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
>>> with more appropriate terms. Inspired by and following on to Wolfram's
>>> series to fix drivers/i2c/[1], fix the terminology for users of
>>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>>> in the specification.
>>>
>>> Compile tested, no functionality changes intended
>>>
>>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>>>
>>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>>> ---
>>>  .../gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c  |  8 +++---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       | 10 +++----
>>>  drivers/gpu/drm/amd/amdgpu/atombios_i2c.c     |  8 +++---
>>>  drivers/gpu/drm/amd/amdgpu/atombios_i2c.h     |  2 +-
>>>  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    | 20 ++++++-------
>>>  .../gpu/drm/amd/display/dc/bios/bios_parser.c |  2 +-
>>>  .../drm/amd/display/dc/bios/bios_parser2.c    |  2 +-
>>>  .../drm/amd/display/dc/core/dc_link_exports.c |  4 +--
>>>  drivers/gpu/drm/amd/display/dc/dc.h           |  2 +-
>>>  drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c  |  4 +--
>>>  .../display/include/grph_object_ctrl_defs.h   |  2 +-
>>>  drivers/gpu/drm/amd/include/atombios.h        |  2 +-
>>>  drivers/gpu/drm/amd/include/atomfirmware.h    | 26 ++++++++---------
>>>  .../powerplay/hwmgr/vega20_processpptables.c  |  4 +--
>>>  .../amd/pm/powerplay/inc/smu11_driver_if.h    |  2 +-
>>>  .../inc/pmfw_if/smu11_driver_if_arcturus.h    |  2 +-
>>>  .../inc/pmfw_if/smu11_driver_if_navi10.h      |  2 +-
>>>  .../pmfw_if/smu11_driver_if_sienna_cichlid.h  |  2 +-
>>>  .../inc/pmfw_if/smu13_driver_if_aldebaran.h   |  2 +-
>>>  .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  2 +-
>>>  .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  2 +-
>>>  .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  4 +--
>>>  .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   |  8 +++---
>>>  drivers/gpu/drm/radeon/atombios.h             | 16 +++++------
>>>  drivers/gpu/drm/radeon/atombios_i2c.c         |  4 +--
>>>  drivers/gpu/drm/radeon/radeon_combios.c       | 28 +++++++++----------
>>>  drivers/gpu/drm/radeon/radeon_i2c.c           | 10 +++----
>>>  drivers/gpu/drm/radeon/radeon_mode.h          |  6 ++--
>>>  28 files changed, 93 insertions(+), 93 deletions(-)
>>>
>>
>> <snip>
>>
>> Hello Christian, Daniel, David, others,
>>
>> Could you re-review v2 since the feedback provided in v0 [1] has now been addressed? I can send v3 with
>> all other feedback and signoffs from the other maintainers incorporated when I have something for amdgpu
>> and radeon.
> 
> This seems like a lot of churn.  Additionally, a bunch of these
> headers are shared with other OSes, so it's possible some of the
> changes may end up getting reverted accidently when we sync up or we
> may add new headers in new code with the old nomenclature and then
> we'd need to make sure to adjust it to make sure everything was
> aligned again.  I would just as soon leave things as is, but I'm open
> to acking them if there is a strong desire to update things.
> 
> Alex

The way I see it, this is a small downpayment on the debt we have built up so far. Internship
programs like LF Outreachy to get more underrepresented groups involved in open source are trying to 
change the open source community culture to be more inclusive, but simultaneously rely on the culture
being welcoming enough as well.

I do see the challenge involved in preserving the changes and ensuring no new code is added with
outdated nomenclature (but see [1]), but culture changes one person at a time, and I'd encourage the community
to do the work needed so we can move past our (mostly) inadvertent role in perpetuating it.

That's my 2c (or your sub-unit currency of choice).

Easwar

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=49decddd39e5f6132ccd7d9fdc3d7c470b0061bb
