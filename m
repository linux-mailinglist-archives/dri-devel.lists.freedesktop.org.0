Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961CB1232D3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 17:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E807A6E1B4;
	Tue, 17 Dec 2019 16:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BCC6E1A2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:46:14 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q10so12040866wrm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 08:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=KGAt4DkR02a8Ih2m+aTFB9N7+u+G1Wgm6kKi7KaQyU0=;
 b=VKdmqJirsIPfWaQ1nosPi/UncJpx7915Jmz+GWsCBIpejdq46cRpVrpkFEVar58afg
 4RsQh4gg3gQNI2FJfuUjB57+r88ZtjoQJH+mnzouwf4I3P3VTcMX9VdBcc7w6lyT5mlW
 ZJLMI6GuZiQ2LIo1MQ5t8BHxj0Q0reKd1bPaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=KGAt4DkR02a8Ih2m+aTFB9N7+u+G1Wgm6kKi7KaQyU0=;
 b=QLz+D5Z+gwAu0lURO+J7loNX717SvXpsYm1yVK4hMunQCwUn+2by+vfCW/iOEVMVl0
 48ic0p3ruXqntPlTuN4zPDbXPKcWWEaZIDAKvEoCYx9wZcmlfwGphru3d4N723bQkbIV
 nltJxQvRhlM7SUSLTtNw3BT0Z5MCBgBZIcKz/Eull7z0e7ZabUpeWhXAleZ4J8gCEp9m
 RxWgTLC/bu1N6IoktSbxK3dnm47gjY7dpJD/mB4dvSAUGakP6fSb/W3C51hMwUzI2gxJ
 9qtJ6jzmdnc6VGW+MIJoIfqdIOXP2f8Dg/rnEH6uw+/v6VEsaufhNMAcRGrA+ZDbeYkC
 tkqw==
X-Gm-Message-State: APjAAAX5w85WKQ1BZ6C8eCookbvWK4UZKuzdIZTxakeMAfwLGDb6xiLZ
 mFau7yrElXOpzNUkmI9/JhnPJg==
X-Google-Smtp-Source: APXvYqy346s20DnqYqMGccCYqfshY+dKJcc17joDVSyqVdTGtkqcAz2qZGV/9N03WJuooyT3+pCdqA==
X-Received: by 2002:adf:a285:: with SMTP id s5mr37795334wra.118.1576601172444; 
 Tue, 17 Dec 2019 08:46:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id b17sm26327765wrx.15.2019.12.17.08.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 08:46:10 -0800 (PST)
Date: Tue, 17 Dec 2019 17:46:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [pull] amdgpu, amdkfd, radeon drm-next-5.6
Message-ID: <20191217164608.GC624164@phenom.ffwll.local>
References: <20191211223020.7510-1-alexander.deucher@amd.com>
 <20191217125217.GT624164@phenom.ffwll.local>
 <CADnq5_PGh1xo0gZeyrj=mo3cjhb4-vCSESzWe+1LuCp52Y-Law@mail.gmail.com>
 <CADnq5_MvjWb3nhoXB4fNa4T3APghGQdMYFMv0Qi5zUFRPXQpow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_MvjWb3nhoXB4fNa4T3APghGQdMYFMv0Qi5zUFRPXQpow@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 09:17:51AM -0500, Alex Deucher wrote:
> On Tue, Dec 17, 2019 at 8:47 AM Alex Deucher <alexdeucher@gmail.com> wrot=
e:
> >
> > On Tue, Dec 17, 2019 at 7:52 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Dec 11, 2019 at 05:30:20PM -0500, Alex Deucher wrote:
> > > > Hi Dave, Daniel,
> > > >
> > > > Kicking off 5.6 with new stuff from AMD.  There is a UAPI addition.=
  We
> > > > added a new firmware for display, and this just adds the version qu=
ery
> > > > to our existing firmware query interface.  UMDs like mesa use this =
interface to
> > > > query things like CP or UVD firmware versions to see what features =
are
> > > > supported.
> > >
> > > I got bored, and a quick serach for what the userspace for
> > > AMDGPU_INFO_FW_DMCUB didn't turn up anything. At least didn't spot any
> > > patches on mesa-devel or mesa MR and the patch on amd-gfx also didn't=
 come
> > > with pointers. From the patch series description I have no idea why y=
ou'd
> > > even want this in userspace (but then I stopped being surprised by hw
> > > design long ago).
> > >
> >
> > We expose all the firmwares via the same interface for consistency,
> > but the only ones user space generally cares about are the versions
> > for the acceleration engines like gfx and multimedia.  I can revert it
> > if it's a big deal, but I'd prefer to keep it for consistency since
> > all the others are already available via the same interface.  It's not
> > really a new interace with no user per se.

Imo not the best style adding uapi just in case. We have a lot of that
which then ended up (in other drivers at least) being for some hacks for
blobs or vendor trees and stuff like that. So personally I'd lean towards
just taking all the ones out you don't need (but keep the debugfs ofc),
but meh.

> Also, there are a few minor conflicts.  I backmerged drm-next into my
> drm-next branch if that is helpful.  I can also send another PR with
> the backmerge if you'd prefer.

Looks like you didn't push, and I've thrown in the towel on the wm stuff.
I honestly wonder how exactly you validate this stuff internally, this is
almost as bad as i915 :-)

Fixing your scripts to also push your validated integration tree (whatever
funny kernel version that's based on, at least I'm assuming you're testing
the merged version somewhere) might be really good here. Or use dim push,
so that the git rr-cache is shared.

Thanks, Daniel

> =

> Alex
> =

> > Alex
> >
> > > Otherwise looks all good, no complaints from dim at least :-)
> > > -Daniel
> > >
> > > >
> > > > The following changes since commit 622b2a0ab647d2755f2c1f1000d3403e=
86a69763:
> > > >
> > > >   drm/amdgpu/vcn: finish delay work before release resources (2019-=
11-13 15:29:42 -0500)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   git://people.freedesktop.org/~agd5f/linux tags/drm-next-5.6-2019-=
12-11
> > > >
> > > > for you to fetch changes up to ad808910be68dcf8da5d837d4511d00ad5d3=
678a:
> > > >
> > > >   drm/amdgpu: fix license on Kconfig and Makefiles (2019-12-11 15:2=
2:08 -0500)
> > > >
> > > > ----------------------------------------------------------------
> > > > drm-next-5.6-2019-12-11:
> > > >
> > > > amdgpu:
> > > > - Add MST atomic routines
> > > > - Add support for DMCUB (new helper microengine for displays)
> > > > - Add OEM i2c support in DC
> > > > - Use vstartup for vblank events on DCN
> > > > - Simplify Kconfig for DC
> > > > - Renoir fixes for DC
> > > > - Clean up function pointers in DC
> > > > - Initial support for HDCP 2.x
> > > > - Misc code cleanups
> > > > - GFX10 fixes
> > > > - Rework JPEG engine handling for VCN
> > > > - Add clock and power gating support for JPEG
> > > > - BACO support for Arcturus
> > > > - Cleanup PSP ring handling
> > > > - Add framework for using BACO with runtime pm to save power
> > > > - Move core pci state handling out of the driver for pm ops
> > > > - Allow guest power control in 1 VF case with SR-IOV
> > > > - SR-IOV fixes
> > > > - RAS fixes
> > > > - Support for power metrics on renoir
> > > > - Golden settings updates for gfx10
> > > > - Enable gfxoff on supported navi10 skus
> > > > - Update MAINTAINERS
> > > >
> > > > amdkfd:
> > > > - Clean up generational gfx code
> > > > - Fixes for gfx10
> > > > - DIQ fixes
> > > > - Share more code with amdgpu
> > > >
> > > > radeon:
> > > > - PPC DMA fix
> > > > - Register checker fixes for r1xx/r2xx
> > > > - Misc cleanups
> > > >
> > > > ----------------------------------------------------------------
> > > > Alex Deucher (34):
> > > >       drm/amdgpu/display: fix the build when CONFIG_DRM_AMD_DC_DCN =
is not set
> > > >       drm/amdgpu/display: fix warning when CONFIG_DRM_AMD_DC_DCN is=
 not set
> > > >       drm/amdgpu/soc15: move struct definition around to align with=
 other soc15 asics
> > > >       drm/amdgpu/nv: add asic func for fetching vbios from rom dire=
ctly
> > > >       drm/amdgpu/powerplay: properly set PP_GFXOFF_MASK (v2)
> > > >       drm/amdgpu: disable gfxoff when using register read interface
> > > >       drm/amdgpu: remove experimental flag for Navi14
> > > >       drm/amdgpu: disable gfxoff on original raven
> > > >       Revert "drm/amd/display: enable S/G for RAVEN chip"
> > > >       drm/amdgpu: add asic callback for BACO support
> > > >       drm/amdgpu: add supports_baco callback for soc15 asics. (v2)
> > > >       drm/amdgpu: add supports_baco callback for SI asics.
> > > >       drm/amdgpu: add supports_baco callback for CIK asics.
> > > >       drm/amdgpu: add supports_baco callback for VI asics.
> > > >       drm/amdgpu: add supports_baco callback for NV asics.
> > > >       drm/amdgpu: add a amdgpu_device_supports_baco helper
> > > >       drm/amdgpu: rename amdgpu_device_is_px to amdgpu_device_suppo=
rts_boco (v2)
> > > >       drm/amdgpu: add additional boco checks to runtime suspend/res=
ume (v2)
> > > >       drm/amdgpu: split swSMU baco_reset into enter and exit
> > > >       drm/amdgpu: add helpers for baco entry and exit
> > > >       drm/amdgpu: add baco support to runtime suspend/resume
> > > >       drm/amdgpu: start to disentangle boco from runtime pm
> > > >       drm/amdgpu: disentangle runtime pm and vga_switcheroo
> > > >       drm/amdgpu: enable runtime pm on BACO capable boards if runpm=
=3D1
> > > >       drm/amdgpu: simplify runtime suspend
> > > >       drm/amd/display: add default clocks if not able to fetch them
> > > >       MAINTAINERS: Drop Rex Zhu for amdgpu powerplay
> > > >       drm/amdgpu: move pci handling out of pm ops
> > > >       drm/amdgpu: flag vram lost on baco reset for VI/CIK
> > > >       drm/amd/display: re-enable wait in pipelock, but add timeout
> > > >       drm/radeon: fix r1xx/r2xx register checker for POT textures
> > > >       drm/amdgpu: add header line for power profile on Arcturus
> > > >       drm/amdgpu/display: add fallthrough comment
> > > >       drm/amdgpu: fix license on Kconfig and Makefiles
> > > >
> > > > Alex Sierra (2):
> > > >       drm/amdgpu: add flag to indicate amdgpu vm context
> > > >       amd/amdgpu: force to trigger a no-retry-fault after a retry-f=
ault
> > > >
> > > > Alvin Lee (1):
> > > >       drm/amd/display: Changes in dc to allow full update in some c=
ases
> > > >
> > > > Amanda Liu (1):
> > > >       drm/amd/display: Fix screen tearing on vrr tests
> > > >
> > > > Andrey Grodzovsky (1):
> > > >       drm/amdgpu: Fix BACO entry failure in NAVI10.
> > > >
> > > > Anthony Koo (8):
> > > >       drm/amd/display: set MSA MISC1 bit 6 while sending colorimetr=
y in VSC SDP
> > > >       drm/amd/display: Clean up some code with unused registers
> > > >       drm/amd/display: cleanup of construct and destruct funcs
> > > >       drm/amd/display: cleanup of function pointer tables
> > > >       drm/amd/display: rename core_dc to dc
> > > >       drm/amd/display: add separate of private hwss functions
> > > >       drm/amd/display: add DP protocol version
> > > >       drm/amd/display: Limit NV12 chroma workaround
> > > >
> > > > Aric Cyr (7):
> > > >       drm/amd/display: 3.2.57
> > > >       drm/amd/display: 3.2.58
> > > >       drm/amd/display: 3.2.59
> > > >       drm/amd/display: 3.2.60
> > > >       drm/amd/display: 3.2.61
> > > >       drm/amd/display: fix cursor positioning for multiplane cases
> > > >       drm/amd/display: 3.2.62
> > > >
> > > > Arnd Bergmann (1):
> > > >       drm/amd/display: include linux/slab.h where needed
> > > >
> > > > Bhawanpreet Lakha (19):
> > > >       drm/amd/display: Drop CONFIG_DRM_AMD_DC_DCN2_0 and DSC_SUPPOR=
TED
> > > >       drm/amd/display: Drop CONFIG_DRM_AMD_DC_DCN2_1 flag
> > > >       drm/amd/display: rename DCN1_0 kconfig to DCN
> > > >       drm/amd/display: Add PSP block to verify HDCP2.2 steps
> > > >       drm/amd/display: Add DDC handles for HDCP2.2
> > > >       drm/amd/display: Add execution and transition states for HDCP=
2.2
> > > >       drm/amd/display: Add logging for HDCP2.2
> > > >       drm/amd/display: Change ERROR to WARN for HDCP module
> > > >       drm/amd/display: Enable HDCP 2.2
> > > >       drm/amd/display: Handle hdcp2.2 type0/1 in dm
> > > >       drm/amd/display: Refactor HDCP to handle multiple displays pe=
r link
> > > >       drm/amd/display: add force Type0/1 flag
> > > >       drm/amd/display: Refactor HDCP encryption status update
> > > >       drm/amd/display: add and use defines from drm_hdcp.h
> > > >       drm/amd/display: use drm defines for MAX CASCADE MASK
> > > >       drm/amd/display: split rxstatus for hdmi and dp
> > > >       drm/amd/display: Fix static analysis bug in validate_bksv
> > > >       drm/amd/display: Null check aconnector in event_property_vali=
date
> > > >       drm/amd/display: Load TA firmware for navi10/12/14
> > > >
> > > > Brandon Syu (1):
> > > >       drm/amd/display: fixed that I2C over AUX didn't read data iss=
ue
> > > >
> > > > Chen Wandun (1):
> > > >       drm/amd/powerplay: return errno code to caller when error occ=
ur
> > > >
> > > > Chris Wilson (1):
> > > >       drm/amdgpu/dm: Do not throw an error for a display with no au=
dio
> > > >
> > > > Christian K=F6nig (4):
> > > >       drm/amdgpu: move VM eviction decision into amdgpu_vm.c
> > > >       drm/amdgpu: explicitely sync to VM updates v2
> > > >       drm/amdgpu: stop adding VM updates fences to the resv obj
> > > >       drm/amdgpu: add VM eviction lock v3
> > > >
> > > > Colin Ian King (10):
> > > >       drm/amd/display: fix dereference of pointer aconnector when i=
t is null
> > > >       drm/amd/display: remove duplicated assignment to grph_obj_type
> > > >       drm/amd/display: remove redundant variable status
> > > >       drm/amd/display: fix spelling mistake "exeuction" -> "executi=
on"
> > > >       drm/amd/display: remove duplicated comparison expression
> > > >       drm/amdgpu: remove redundant assignment to pointer write_frame
> > > >       drm/amd/powerplay: remove redundant assignment to variables H=
iSidd and LoSidd
> > > >       drm/radeon: remove redundant assignment to variable ret
> > > >       drm/amd/display: fix double assignment to msg_id field
> > > >       drm/amd/display: remove redundant assignment to variable v_to=
tal
> > > >
> > > > Dan Carpenter (1):
> > > >       drm/amdgpu: Fix a bug in jpeg_v1_0_start()
> > > >
> > > > David (Dingchen) Zhang (1):
> > > >       drm/amd/display: add debugfs sdp hook up function for Navi
> > > >
> > > > David Galiffi (3):
> > > >       drm/amd/display: Fix assert observed when performing dummy p-=
state check
> > > >       drm/amd/display: Create debug option to disable v.active cloc=
k change policy.
> > > >       drm/amd/display: Fixed kernel panic when booting with DP-to-H=
DMI dongle
> > > >
> > > > Dennis Li (3):
> > > >       drm/amdgpu: define soc15_ras_field_entry for reuse
> > > >       drm/amdgpu: refine query function of mmhub EDC counter in vg20
> > > >       drm/amdgpu: implement querying ras error count for mmhub9.4
> > > >
> > > > Dmytro Laktyushkin (2):
> > > >       drm/amd/display: fix dml20 min_dst_y_next_start calculation
> > > >       drm/amd/display: update dml related structs
> > > >
> > > > Emily Deng (1):
> > > >       drm/amdgpu/sriov: No need the event 3 and 4 now
> > > >
> > > > Eric Yang (4):
> > > >       drm/amd/display: Renoir chroma viewport WA
> > > >       drm/amd/display: update sr and pstate latencies for Renoir
> > > >       drm/amd/display: fix dprefclk and ss percentage reading on RN
> > > >       drm/amd/display: update dispclk and dppclk vco frequency
> > > >
> > > > Evan Quan (10):
> > > >       drm/amd/powerplay: avoid DPM reenable process on Navi1x ASICs=
 V2
> > > >       drm/amd/powerplay: issue BTC on Navi during SMU setup
> > > >       drm/amd/powerplay: issue no PPSMC_MSG_GetCurrPkgPwr on unsupp=
orted ASICs
> > > >       drm/amd/powerplay: correct fine grained dpm force level setti=
ng
> > > >       drm/amd/powerplay: correct swSMU baco reset related settings
> > > >       drm/amd/powerplay: add Arcturus baco reset support
> > > >       drm/amd/powerplay: add missing header file declaration
> > > >       drm/amd/powerplay: drop unnecessary warning prompt
> > > >       drm/amd/powerplay: pre-check the SMU state before issuing mes=
sage
> > > >       drm/amd/powerplay: clear VBIOS scratchs on baco exit V2
> > > >
> > > > Felix Kuehling (2):
> > > >       drm/amdgpu: Raise KFD unpinned system memory limit
> > > >       drm/amdgpu: Optimize KFD page table reservation
> > > >
> > > > George Shen (1):
> > > >       drm/amd/display: Increase the number of retries after AUX DEF=
ER
> > > >
> > > > Guchun Chen (1):
> > > >       drm/amdgpu: add check before enabling/disabling broadcast mode
> > > >
> > > > Harry Wentland (1):
> > > >       drm/amd/display: Drop AMD_EDID_UTILITY defines
> > > >
> > > > Hawking Zhang (11):
> > > >       drm/amdgpu: enable ras capablity check on arcturus
> > > >       drm/amdgpu: init umc functions for arcturus umc ras
> > > >       drm/amdgpu: add psp funcs for ring write pointer read/write
> > > >       drm/amdgpu: add helper func for psp ring cmd submission
> > > >       drm/amdgpu: switch to common helper func for psp cmd submissi=
on
> > > >       drm/amdgpu: pull ras controller int status only when ras enab=
led
> > > >       drm/amdgpu: apply gpr/gds workaround before enabling GFX EDC =
mode
> > > >       drm/amdgpu: drop asd shared memory
> > > >       drm/amdgpu: unload asd in psp hw de-init phase
> > > >       drm/amdgpu: load np fw prior before loading the TAs
> > > >       drm/amdgpu: fix resume failures due to psp fw loading sequenc=
e change (v3)
> > > >
> > > > Hugo Hu (2):
> > > >       drm/amd/display: Update background color in bottommost mpcc
> > > >       drm/amd/display: Save/restore link setting for disable phy wh=
en link retraining
> > > >
> > > > Ilya Bakoulin (1):
> > > >       drm/amd/display: Add DSC 422Native debug option
> > > >
> > > > Jack Zhang (4):
> > > >       drm/amd/amdgpu/sriov temporarily skip ras,dtm,hdcp for arctur=
us VF
> > > >       drm/amd/amdgpu/sriov skip RLCG s/r list for arcturus VF.
> > > >       drm/amd/amdgpu/sriov skip jpeg ip block for ARCTURUS VF
> > > >       amd/amdgpu/sriov swSMU disable for sriov
> > > >
> > > > Jaehyun Chung (2):
> > > >       drm/amd/display: DML Validation Dump/Check with Logging
> > > >       drm/amd/display: Wrong ifdef guards were used around DML vali=
dation
> > > >
> > > > James Zhu (3):
> > > >       drm/amdgpu/gfx: Clear more EDC cnt
> > > >       drm/amdgpu/gfx: Increase dispatch packet number
> > > >       drm/amdgpu/gfx: Improvement on EDC GPR workarounds
> > > >
> > > > Jay Cornwall (1):
> > > >       drm/amdgpu: Update Arcturus golden registers
> > > >
> > > > John Clements (3):
> > > >       drm/amdgpu: Resolved offchip EEPROM I/O issue
> > > >       drm/amdgpu: Added ASIC specific checks in gfxhub V1.1 get XGM=
I info
> > > >       drm/amdgpu: Added RAS UMC error query support for Arcturus
> > > >
> > > > Joseph Gravenor (7):
> > > >       drm/amd/display: Renoir chroma viewport WA change formula
> > > >       drm/amd/display: Renoir chroma viewport WA Read the correct r=
egister
> > > >       drm/amd/display: fix DalDramClockChangeLatencyNs override
> > > >       drm/amd/display: populate bios integrated info for renoir
> > > >       drm/amd/display: have two different sr and pstate latency tab=
les for renoir
> > > >       drm/amd/display: update p-state latency for renoir when using=
 lpddr4
> > > >       drm/amd/display: update sr latency for renoir when using lpdd=
r4
> > > >
> > > > Joshua Aberback (1):
> > > >       drm/amd/display: Adjust DML workaround threshold
> > > >
> > > > Jules Irenge (1):
> > > >       drm: radeon: replace 0 with NULL
> > > >
> > > > Jun Lei (1):
> > > >       drm/amd/display: add oem i2c implemenation in dc
> > > >
> > > > Kevin Wang (1):
> > > >       drm/amdgpu: enable gfxoff feature for navi10 asic
> > > >
> > > > Krunoslav Kovac (1):
> > > >       drm/amd/display: Change HDR_MULT check
> > > >
> > > > Krzysztof Kozlowski (1):
> > > >       drm/amd: Fix Kconfig indentation
> > > >
> > > > Le Ma (10):
> > > >       drm/amdgpu: remove ras global recovery handling from ras_cont=
roller_int handler
> > > >       drm/amdgpu: export amdgpu_ras_find_obj to use externally
> > > >       drm/amdgpu: clear ras controller status registers when interr=
upt occurs
> > > >       drm/amdgpu: clear uncorrectable parity error status bit
> > > >       drm/amdgpu: enable/disable doorbell interrupt in baco entry/e=
xit helper
> > > >       drm/amdgpu: add concurrent baco reset support for XGMI
> > > >       drm/amdgpu: support full gpu reset workflow when ras err_even=
t_athub occurs
> > > >       drm/amdgpu: clear err_event_athub flag after reset exit
> > > >       drm/amdgpu: reduce redundant uvd context lost warning message
> > > >       drm/amdgpu: add condition to enable baco for ras recovery
> > > >
> > > > Leo (Hanghong) Ma (3):
> > > >       drm/amd/display: Add some hardware status in DTN log debugfs
> > > >       drm/amd/display: Add hubp clock status in DTN log for Navi
> > > >       drm/amd/display: Change the delay time before enabling FEC
> > > >
> > > > Leo Li (2):
> > > >       drm/amd/display: Send vblank and user events at vsartup for D=
CN
> > > >       drm/amd/display: Disable VUpdate interrupt for DCN hardware
> > > >
> > > > Leo Liu (24):
> > > >       drm/amdgpu: add JPEG HW IP and SW structures
> > > >       drm/amdgpu: add amdgpu_jpeg and JPEG tests
> > > >       drm/amdgpu: separate JPEG1.0 code out from VCN1.0
> > > >       drm/amdgpu: use the JPEG structure for general driver support
> > > >       drm/amdgpu: add JPEG IP block type
> > > >       drm/amdgpu: add JPEG common functions to amdgpu_jpeg
> > > >       drm/amdgpu: add JPEG v2.0 function supports
> > > >       drm/amdgpu: remove unnecessary JPEG2.0 code from VCN2.0
> > > >       drm/amdgpu: add JPEG PG and CG interface
> > > >       drm/amdgpu: add PG and CG for JPEG2.0
> > > >       drm/amd/powerplay: add JPEG Powerplay interface
> > > >       drm/amd/powerplay: add JPEG power control for Navi1x
> > > >       drm/amd/powerplay: add Powergate JPEG for Renoir
> > > >       drm/amd/powerplay: add JPEG power control for Renoir
> > > >       drm/amd/powerplay: set JPEG to SMU dpm
> > > >       drm/amdgpu: enable JPEG2.0 dpm
> > > >       drm/amdgpu: add driver support for JPEG2.0 and above
> > > >       drm/amdgpu: enable JPEG2.0 for Navi1x and Renoir
> > > >       drm/amdgpu: move JPEG2.5 out from VCN2.5
> > > >       drm/amdgpu: enable Arcturus CG for VCN and JPEG blocks
> > > >       drm/amdgpu: enable Arcturus JPEG2.5 block
> > > >       drm/amdgpu/vcn2.5: fix the enc loop with hw fini
> > > >       drm/amdgpu: fix VCN2.x number of irq types
> > > >       drm/amdgpu: fix JPEG instance checking when ctx init
> > > >
> > > > Likun Gao (1):
> > > >       drm/amdgpu/powerplay: unify smu send message function
> > > >
> > > > Lucy Li (1):
> > > >       drm/amd/display: Disable link before reenable
> > > >
> > > > Michael Strauss (3):
> > > >       drm/amd/display: Avoid conflict between HDR multiplier and 3d=
lut
> > > >       drm/amd/display: Fix Dali clk mgr construct
> > > >       drm/amd/display: Disable chroma viewport w/a when rotated 180=
 degrees
> > > >
> > > > Mikita Lipski (5):
> > > >       drm/amd/display: Add MST atomic routines
> > > >       drm/amd/display: Add debugfs initalization on mst connectors
> > > >       drm/amd/display: Fix debugfs on MST connectors
> > > >       drm/amd/display: Fix coding error in connector atomic check
> > > >       drm/amd/display: Return a correct error value
> > > >
> > > > Monk Liu (6):
> > > >       drm/amdgpu: use CPU to flush vmhub if sched stopped
> > > >       drm/amdgpu: fix calltrace during kmd unload(v3)
> > > >       drm/amdgpu: skip rlc ucode loading for SRIOV gfx10
> > > >       drm/amdgpu: do autoload right after MEC loaded for SRIOV VF
> > > >       drm/amdgpu: should stop GFX ring in hw_fini
> > > >       drm/amdgpu: fix GFX10 missing CSIB set(v3)
> > > >
> > > > Nathan Chancellor (2):
> > > >       drm/amd/display: Use NULL for pointer assignment in copy_stre=
am_update_to_stream
> > > >       drm/amdgpu: Ensure ret is always initialized when using SOC15=
_WAIT_ON_RREG
> > > >
> > > > Nicholas Kazlauskas (20):
> > > >       drm/amdgpu: Add ucode support for DMCUB
> > > >       drm/amdgpu: Add PSP loading support for DMCUB ucode
> > > >       drm/amd/display: Drop DMCUB from DCN21 resources
> > > >       drm/amd/display: Add the DMUB service
> > > >       drm/amd/display: Hook up the DMUB service in DM
> > > >       drm/amdgpu: Add DMCUB to firmware query interface
> > > >       drm/amd/display: Add DMUB support to DC
> > > >       drm/amd/display: Register DMUB service with DC
> > > >       drm/amd/display: Drop CONFIG_DRM_AMD_DC_DMUB guards
> > > >       drm/amd/display: Add DMUB service function check if hw initia=
lized
> > > >       drm/amd/display: Add DMUB param to load inst const from driver
> > > >       drm/amd/display: Don't spin forever waiting for DMCUB phy/aut=
o init
> > > >       drm/amd/display: Spin for DMCUB PHY init in DC
> > > >       drm/amd/display: Add Navi10 DMUB VBIOS code
> > > >       drm/amd/display: Only wait for DMUB phy init on dcn21
> > > >       drm/amd/display: Return DMUB_STATUS_OK when autoload unsuppor=
ted
> > > >       drm/amd/display: Program CW5 for tracebuffer for dcn20
> > > >       drm/amd/display: Split DMUB cmd type into type/subtype
> > > >       drm/amd/display: Add shared DMCUB/driver firmware state cache=
 window
> > > >       drm/amd/display: Extend DMCUB offload testing into dcn20/21
> > > >
> > > > Nikola Cornij (5):
> > > >       drm/amd/display: Add a sanity check for DSC already enabled/d=
isabled
> > > >       drm/amd/display: Connect DIG FE to its BE before link trainin=
g starts
> > > >       drm/amd/display: Use a temporary copy of the current state wh=
en updating DSC config
> > > >       drm/amd/display: Map DSC resources 1-to-1 if numbers of OPPs =
and DSCs are equal
> > > >       drm/amd/display: Reset steer fifo before unblanking the stream
> > > >
> > > > Noah Abradjian (3):
> > > >       drm/amd/display: Remove flag check in mpcc update
> > > >       drm/amd/display: Modify logic for when to wait for mpcc idle
> > > >       drm/amd/display: Remove redundant call
> > > >
> > > > Oak Zeng (1):
> > > >       drm/amdgpu: Apply noretry setting for mmhub9.4
> > > >
> > > > Paul Hsieh (1):
> > > >       drm/amd/display: Reset PHY in link re-training
> > > >
> > > > Pierre-Eric Pelloux-Prayer (1):
> > > >       drm/amdgpu: add cache flush workaround to gfx8 emit_fence
> > > >
> > > > Reza Amini (3):
> > > >       drm/amd/display: Unify all scaling when Integer Scaling enabl=
ed
> > > >       drm/amd/display: Implement DePQ for DCN1
> > > >       drm/amd/display: Implement DePQ for DCN2
> > > >
> > > > Sam Bobroff (2):
> > > >       drm/radeon: fix bad DMA from INTERRUPT_CNTL2
> > > >       drm/amdgpu: fix bad DMA from INTERRUPT_CNTL2
> > > >
> > > > Samson Tam (2):
> > > >       drm/amd/display: Fix stereo with DCC enabled
> > > >       drm/amd/display: revert change causing DTN hang for RV
> > > >
> > > > Simon Ser (1):
> > > >       drm/amdgpu: log when amdgpu.dc=3D1 but ASIC is unsupported
> > > >
> > > > Stephen Rothwell (1):
> > > >       merge fix for "ftrace: Rework event_create_dir()"
> > > >
> > > > Stylon Wang (1):
> > > >       drm/amd/display: Fix incorrect deep color setting in YCBCR420=
 modes
> > > >
> > > > Sung Lee (1):
> > > >       drm/amd/display: Use SIGNAL_TYPE_NONE in disable_output unles=
s eDP
> > > >
> > > > Thong Thai (1):
> > > >       Revert "drm/amdgpu: enable VCN DPG on Raven and Raven2"
> > > >
> > > > Tianci.Yin (4):
> > > >       drm/amdgpu/gfx10: update gfx golden settings
> > > >       drm/amdgpu/gfx10: update gfx golden settings for navi14
> > > >       drm/amdgpu/gfx10: update gfx golden settings
> > > >       drm/amdgpu/gfx10: update gfx golden settings for navi14
> > > >
> > > > Timothy Pearson (1):
> > > >       amdgpu: Enable KFD on POWER systems
> > > >
> > > > Wenjing Liu (4):
> > > >       drm/amd/display: add color space option when sending link tes=
t pattern
> > > >       drm/amd/display: add dc dsc functions to return bpp range for=
 pixel encoding
> > > >       drm/amd/display: remove spam DSC log
> > > >       drm/amd/display: add dsc policy getter
> > > >
> > > > Xiaojie Yuan (6):
> > > >       drm/amdgpu/gfx10: fix mqd backup/restore for gfx rings (v2)
> > > >       drm/amdgpu/gfx10: explicitly wait for cp idle after halt/unha=
lt
> > > >       drm/amdgpu/gfx10: fix out-of-bound mqd_backup array access
> > > >       drm/amdgpu/gfx10: re-init clear state buffer after gpu reset
> > > >       drm/amdgpu/gfx10: unlock srbm_mutex after queue programming f=
inish
> > > >       drm/amdgpu/gfx10: remove outdated comments
> > > >
> > > > Xiaomeng Hou (4):
> > > >       drm/amd/powerplay: implement interface to retrieve gpu temper=
ature for renoir
> > > >       drm/amd/powerplay: implement interface to retrieve clock freq=
 for renoir
> > > >       drm/amd/powerplay: implement the get_enabled_mask callback fo=
r smu12
> > > >       drm/amd/powerplay: correct the value retrieved through GPU_LO=
AD sensor interface
> > > >
> > > > Yintian Tao (3):
> > > >       drm/amdgpu: put flush_delayed_work at first
> > > >       drm/amdgpu: not remove sysfs if not create sysfs
> > > >       drm/amd/powerplay: enable pp one vf mode for vega10
> > > >
> > > > Yong Zhao (20):
> > > >       drm/amdkfd: Adjust function sequences to avoid unnecessary de=
clarations
> > > >       drm/amdkfd: Only keep release_mem function for Hawaii
> > > >       drm/amdkfd: Use kernel queue v9 functions for v10
> > > >       drm/amdkfd: Simplify the mmap offset related bit operations
> > > >       drm/amdkfd: Use better name to indicate the offset is in dwor=
ds
> > > >       drm/amdkfd: Avoid using doorbell_off as offset in process doo=
rbell pages
> > > >       drm/amdkfd: Rename create_cp_queue() to init_user_queue()
> > > >       drm/amdkfd: Implement queue priority controls for gfx10
> > > >       drm/amdkfd: Update get_wave_state() for GFX10
> > > >       drm/amdkfd: Fix a bug when calculating save_area_used_size
> > > >       drm/amdkfd: Use QUEUE_IS_ACTIVE macro in mqd v10
> > > >       drm/amdkfd: Stop using GFP_NOIO explicitly for two places
> > > >       drm/amdkfd: Merge CIK kernel queue functions into VI
> > > >       drm/amdkfd: Eliminate ops_asic_specific in kernel queue
> > > >       drm/amdkfd: Rename kfd_kernel_queue_*.c to kfd_packet_manager=
_*.c
> > > >       drm/amdkfd: Delete KFD_MQD_TYPE_COMPUTE
> > > >       drm/amdkfd: DIQ should not use HIQ way to allocate memory
> > > >       drm/amdkfd: Remove duplicate functions update_mqd_hiq()
> > > >       drm/amdkfd: Contain MMHUB number in mmhub_v9_4_setup_vm_pt_re=
gs()
> > > >       drm/amdkfd: Eliminate unnecessary kernel queue function point=
ers
> > > >
> > > > Yongqiang Sun (6):
> > > >       drm/amd/display: Change dmcu init sequence for dmcub loading =
dmcu FW.
> > > >       drm/amd/display: Add PSP FW version mask.
> > > >       drm/amd/display: optimize bandwidth after commit streams.
> > > >       drm/amd/display: Add debug trace for dmcub FW autoload.
> > > >       drm/amd/display: Add DMCUB__PG_DONE trace code enum
> > > >       drm/amd/display: Compare clock state member to determine opti=
mization.
> > > >
> > > > YueHaibing (4):
> > > >       drm/amd/display: remove set but not used variable 'ds_port'
> > > >       drm/amd/display: remove set but not used variable 'bpc'
> > > >       drm/amd/display: remove set but not used variable 'msg_out'
> > > >       drm/amd/powerplay: remove set but not used variable 'stretch_=
amount2'
> > > >
> > > > Zhan Liu (2):
> > > >       drm/amd/display: Include num_vmid and num_dsc within NV14's r=
esource caps
> > > >       drm/amd/display: Loading NV10/14 Bounding Box Data Directly F=
rom Code
> > > >
> > > > Zhan liu (3):
> > > >       drm/amd/display: Modify comments to match the code
> > > >       drm/amd/display: Adding NV14 IP Parameters
> > > >       drm/amd/display: Get NV14 specific ip params as needed
> > > >
> > > > abdoulaye berthe (10):
> > > >       drm/amd/display: initialize lttpr
> > > >       drm/amd/display: check for dp rev before reading lttpr regs
> > > >       drm/amd/display: configure lttpr mode
> > > >       drm/amd/display: implement lttpr logic
> > > >       drm/amd/display: use previous aux timeout val if no repeater.
> > > >       drm/amd/display: disable lttpr for invalid lttpr caps.
> > > >       drm/amd/display: add automated audio test support
> > > >       drm/amd/display: add log for lttpr
> > > >       drm/amd/display: check for repeater when setting aux_rd_inter=
val.
> > > >       drm/amd/display: correct log message for lttpr
> > > >
> > > > changzhu (4):
> > > >       drm/amd/powerplay: enable gpu_busy_percent sys interface for =
renoir (v2)
> > > >       drm/amdgpu: initialize vm_inv_eng0_sem for gfxhub and mmhub
> > > >       drm/amdgpu: invalidate mmhub semaphore workaround in gmc9/gmc=
10
> > > >       drm/amdgpu: avoid using invalidate semaphore for picasso
> > > >
> > > > yu kuai (12):
> > > >       drm/amdgpu: remove 4 set but not used variable in amdgpu_atom=
bios_get_connector_info_from_object_table
> > > >       drm/amdgpu: add function parameter description in 'amdgpu_dev=
ice_set_cg_state'
> > > >       drm/amdgpu: add function parameter description in 'amdgpu_gar=
t_bind'
> > > >       drm/amdgpu: remove set but not used variable 'dig_connector'
> > > >       drm/amdgpu: remove set but not used variable 'dig'
> > > >       drm/amdgpu: remove always false comparison in 'amdgpu_atombio=
s_i2c_process_i2c_ch'
> > > >       drm/amdgpu: remove set but not used variable 'mc_shared_chmap'
> > > >       drm/amdgpu: remove set but not used variable 'mc_shared_chmap=
' from 'gfx_v6_0.c' and 'gfx_v7_0.c'
> > > >       drm/amdgpu: remove set but not used variable 'amdgpu_connecto=
r'
> > > >       drm/amdgpu: remove set but not used variable 'count'
> > > >       drm/amdgpu: remove set but not used variable 'invalid'
> > > >       drm/amd/powerplay: remove set but not used variable 'us_mvdd'
> > > >
> > > > zhengbin (27):
> > > >       drm/amd/powerplay: remove set but not used variable 'vbios_ve=
rsion', 'data'
> > > >       drm/amd/powerplay: remove set but not used variable 'data'
> > > >       drm/amd/display: Use static const, not const static
> > > >       drm/amd/powerplay: remove set but not used variable 'threshol=
d', 'state'
> > > >       drm/amdkfd: remove set but not used variable 'top_dev'
> > > >       drm/amd/display: remove set but not used variable 'old_plane_=
crtc'
> > > >       drm/amd/display: remove set but not used variable 'bp' in bio=
s_parser2.c
> > > >       drm/amd/display: remove set but not used variable 'bp' in bio=
s_parser.c
> > > >       drm/amd/display: remove set but not used variable 'min_conten=
t'
> > > >       drm/radeon: remove set but not used variable 'size', 'relocs_=
chunk'
> > > >       drm/radeon: remove set but not used variable 'backbias_respon=
se_time'
> > > >       drm/radeon: remove set but not used variable 'dig_connector'
> > > >       drm/radeon: remove set but not used variable 'radeon_connecto=
r'
> > > >       drm/radeon: remove set but not used variable 'blocks'
> > > >       drm/radeon: remove set but not used variable 'tv_pll_cntl1'
> > > >       drm/amdgpu: remove not needed memset
> > > >       drm/amd/powerplay: Use ARRAY_SIZE for smu7_profiling
> > > >       drm/amdgpu: Use ARRAY_SIZE for sos_old_versions
> > > >       drm/amd/powerplay: Remove unneeded variable 'result' in smu10=
_hwmgr.c
> > > >       drm/amd/powerplay: Remove unneeded variable 'result' in vega1=
0_hwmgr.c
> > > >       drm/amd/powerplay: Remove unneeded variable 'ret' in smu7_hwm=
gr.c
> > > >       drm/amd/powerplay: Remove unneeded variable 'result' in vega1=
2_hwmgr.c
> > > >       drm/amd/powerplay: Remove unneeded variable 'ret' in amdgpu_s=
mu.c
> > > >       drm/amd/display: Remove unneeded semicolon in bios_parser.c
> > > >       drm/amd/display: Remove unneeded semicolon in bios_parser2.c
> > > >       drm/amd/display: Remove unneeded semicolon in hdcp.c
> > > >       drm/amd/display: Remove unneeded semicolon in display_rq_dlg_=
calc_21.c
> > > >
> > > >  MAINTAINERS                                        |   1 -
> > > >  drivers/gpu/drm/amd/acp/Kconfig                    |  12 +-
> > > >  drivers/gpu/drm/amd/amdgpu/Kconfig                 |   2 +-
> > > >  drivers/gpu/drm/amd/amdgpu/Makefile                |   8 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  25 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |   6 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  31 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |  20 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  19 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   6 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 296 +++++--
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   4 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  96 ++-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |   1 +
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   2 -
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   2 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   1 +
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |  13 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |   1 -
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |  17 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   3 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           | 211 +++++
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |  62 ++
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  53 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c             | 182 +++--
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h             |   1 +
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 279 +++++--
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |  26 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   8 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   8 +
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  17 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |   1 +
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |  10 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |  48 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h           |   8 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |   2 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   5 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |  11 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   9 +
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  11 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            | 113 +--
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   5 -
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  51 --
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |  14 +-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 103 ++-
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |  11 +
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |  13 +-
> > > >  drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |   5 -
> > > >  drivers/gpu/drm/amd/amdgpu/atombios_i2c.c          |   5 -
> > > >  drivers/gpu/drm/amd/amdgpu/cik.c                   |  25 +-
> > > >  drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |  38 +-
> > > >  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 207 +++--
> > > >  drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   3 +-
> > > >  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   5 +-
> > > >  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  65 +-
> > > >  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 180 +++--
> > > >  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |   2 +
> > > >  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c           |  19 +-
> > > >  drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |   2 +
> > > >  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  60 +-
> > > >  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  83 +-
> > > >  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.h              |   8 -
> > > >  drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             | 585 +++++++++=
+++++
> > > >  drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.h             |  32 +
> > > >  drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             | 827 +++++++++=
++++++++++
> > > >  drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.h             |  42 +
> > > >  drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             | 641 +++++++++=
++++++
> > > >  drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.h             |  29 +
> > > >  drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            | 234 ++++--
> > > >  drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |   2 +
> > > >  drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            | 274 ++++++-
> > > >  drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.h            |   4 +
> > > >  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  78 --
> > > >  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |   4 -
> > > >  drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |  27 +-
> > > >  drivers/gpu/drm/amd/amdgpu/nv.c                    |  53 +-
> > > >  drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |  65 +-
> > > >  drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             | 109 ++-
> > > >  drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |  84 +-
> > > >  drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |  89 +--
> > > >  drivers/gpu/drm/amd/amdgpu/si.c                    |   6 +
> > > >  drivers/gpu/drm/amd/amdgpu/si_ih.c                 |   3 +-
> > > >  drivers/gpu/drm/amd/amdgpu/soc15.c                 |  82 +-
> > > >  drivers/gpu/drm/amd/amdgpu/soc15.h                 |  16 +-
> > > >  drivers/gpu/drm/amd/amdgpu/soc15_common.h          |   1 +
> > > >  drivers/gpu/drm/amd/amdgpu/umc_v6_1.c              |  78 +-
> > > >  drivers/gpu/drm/amd/amdgpu/umc_v6_1.h              |   3 +-
> > > >  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              | 481 +--------=
--
> > > >  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              | 498 +--------=
---
> > > >  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.h              |  13 -
> > > >  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              | 254 +-----
> > > >  drivers/gpu/drm/amd/amdgpu/vi.c                    |  29 +-
> > > >  drivers/gpu/drm/amd/amdkfd/Kconfig                 |   4 +-
> > > >  drivers/gpu/drm/amd/amdkfd/Makefile                |   6 +-
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  29 +-
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c            |  10 +-
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   4 +-
> > > >  .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   4 +-
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |  14 +-
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   1 -
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_iommu.c             |   3 -
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |  96 +--
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.h      |  40 +-
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue_v10.c  | 348 --------
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |   5 +-
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |  56 +-
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |  24 +-
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |   9 +-
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |  32 +-
> > > >  ...d_kernel_queue_v9.c =3D> kfd_packet_manager_v9.c} |  90 +--
> > > >  ...d_kernel_queue_vi.c =3D> kfd_packet_manager_vi.c} |  41 -
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  28 +-
> > > >  drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   3 +-
> > > >  .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  16 +-
> > > >  drivers/gpu/drm/amd/display/Kconfig                |  35 +-
> > > >  drivers/gpu/drm/amd/display/Makefile               |   4 +-
> > > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 520 +++++++++=
+--
> > > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  50 +-
> > > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   1 +
> > > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  67 +-
> > > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h |   9 +-
> > > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  53 +-
> > > >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  42 +-
> > > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   |   9 +-
> > > >  drivers/gpu/drm/amd/display/dc/Makefile            |  18 +-
> > > >  drivers/gpu/drm/amd/display/dc/basics/Makefile     |   2 +-
> > > >  drivers/gpu/drm/amd/display/dc/basics/dc_common.c  | 101 +++
> > > >  drivers/gpu/drm/amd/display/dc/basics/dc_common.h  |  42 +
> > > >  drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |   8 +-
> > > >  drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  79 +-
> > > >  .../gpu/drm/amd/display/dc/bios/command_table2.c   |  85 ++
> > > >  .../amd/display/dc/bios/command_table_helper2.c    |   6 +-
> > > >  drivers/gpu/drm/amd/display/dc/calcs/Makefile      |   2 +-
> > > >  drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |   4 -
> > > >  drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |   6 +-
> > > >  drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |  17 +-
> > > >  .../amd/display/dc/clk_mgr/dce112/dce112_clk_mgr.c |  12 +-
> > > >  .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       |   6 +-
> > > >  .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  | 146 +++-
> > > >  .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |   6 +-
> > > >  drivers/gpu/drm/amd/display/dc/core/dc.c           | 176 ++--
> > > >  drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |  10 +-
> > > >  drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 240 +++---
> > > >  drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |  28 +-
> > > >  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 753 +++++++++=
++++++---
> > > >  drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |  85 +-
> > > >  drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  54 +-
> > > >  drivers/gpu/drm/amd/display/dc/core/dc_sink.c      |   8 +-
> > > >  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  66 +-
> > > >  drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |  34 +-
> > > >  drivers/gpu/drm/amd/display/dc/dc.h                |  72 +-
> > > >  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       | 134 ++++
> > > >  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |  60 ++
> > > >  drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  62 +-
> > > >  drivers/gpu/drm/amd/display/dc/dc_dsc.h            |  20 +-
> > > >  drivers/gpu/drm/amd/display/dc/dc_helper.c         | 267 ++++++-
> > > >  drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |  28 -
> > > >  drivers/gpu/drm/amd/display/dc/dc_link.h           |  12 +-
> > > >  drivers/gpu/drm/amd/display/dc/dc_stream.h         |  18 +-
> > > >  drivers/gpu/drm/amd/display/dc/dc_types.h          |  38 +-
> > > >  drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |   4 -
> > > >  drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |  79 +-
> > > >  drivers/gpu/drm/amd/display/dc/dce/dce_aux.h       |   4 +-
> > > >  .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |   6 +-
> > > >  .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |  10 +-
> > > >  drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |  87 +-
> > > >  drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.h      |  13 +-
> > > >  drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.c     |   2 +-
> > > >  drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |  17 +-
> > > >  drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c       |  19 +-
> > > >  drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |   6 -
> > > >  drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.h    |   8 -
> > > >  drivers/gpu/drm/amd/display/dc/dce/dce_i2c_sw.c    |  43 -
> > > >  drivers/gpu/drm/amd/display/dc/dce/dce_i2c_sw.h    |   6 +-
> > > >  .../drm/amd/display/dc/dce/dce_stream_encoder.c    |  21 +-
> > > >  .../amd/display/dc/dce100/dce100_hw_sequencer.c    |   3 +-
> > > >  .../amd/display/dc/dce100/dce100_hw_sequencer.h    |   1 +
> > > >  .../drm/amd/display/dc/dce100/dce100_resource.c    |  10 +-
> > > >  .../amd/display/dc/dce110/dce110_hw_sequencer.c    | 100 ++-
> > > >  .../amd/display/dc/dce110/dce110_hw_sequencer.h    |   2 +-
> > > >  .../drm/amd/display/dc/dce110/dce110_resource.c    |  13 +-
> > > >  .../amd/display/dc/dce112/dce112_hw_sequencer.c    |   2 +-
> > > >  .../amd/display/dc/dce112/dce112_hw_sequencer.h    |   1 +
> > > >  .../drm/amd/display/dc/dce112/dce112_resource.c    |  10 +-
> > > >  .../amd/display/dc/dce120/dce120_hw_sequencer.c    |   2 +-
> > > >  .../amd/display/dc/dce120/dce120_hw_sequencer.h    |   1 +
> > > >  .../drm/amd/display/dc/dce120/dce120_resource.c    |  14 +-
> > > >  .../drm/amd/display/dc/dce80/dce80_hw_sequencer.c  |   2 +-
> > > >  .../drm/amd/display/dc/dce80/dce80_hw_sequencer.h  |   1 +
> > > >  .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |  10 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |   3 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |   6 -
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h   |   4 -
> > > >  .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c    |  10 +-
> > > >  .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |   2 -
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dwb.c   |   4 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dwb.h   |   2 +-
> > > >  .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |   8 -
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |  10 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h  |   7 +-
> > > >  .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  | 634 ++++++---=
------
> > > >  .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.h  | 182 +++--
> > > >  .../display/dc/dcn10/dcn10_hw_sequencer_debug.h    |  43 +
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  | 111 +++
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.h  |  33 +
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_ipp.c   |   4 -
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_ipp.h   |   6 -
> > > >  .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |  10 -
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c   |  21 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c   |   5 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |   9 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |  10 +-
> > > >  .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |  12 +-
> > > >  .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |   6 +-
> > > >  .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |   9 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |   5 +-
> > > >  .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c    |   3 +
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |  27 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h   |   2 -
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  | 316 +++++++-
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h  |  16 -
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 555 ++++++---=
----
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.h | 149 ++--
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  | 133 ++++
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.h  |  33 +
> > > >  .../drm/amd/display/dc/dcn20/dcn20_link_encoder.c  |   7 +-
> > > >  .../drm/amd/display/dc/dcn20/dcn20_link_encoder.h  |   2 -
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |   8 +
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.c   |  16 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.h   |   1 +
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |  21 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.h  |   4 +-
> > > >  .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  | 199 +++--
> > > >  .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |   4 +-
> > > >  .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |  27 +-
> > > >  .../amd/display/dc/dcn20/dcn20_stream_encoder.h    |   1 +
> > > >  drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |   4 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c  | 414 +++++++++-
> > > >  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c |  14 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.h |  16 +-
> > > >  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  | 142 ++++
> > > >  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.h  |  33 +
> > > >  .../drm/amd/display/dc/dcn21/dcn21_link_encoder.c  |   2 -
> > > >  .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  | 102 +--
> > > >  drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   2 -
> > > >  drivers/gpu/drm/amd/display/dc/dm_pp_smu.h         |  10 -
> > > >  drivers/gpu/drm/amd/display/dc/dm_services.h       |  10 +
> > > >  drivers/gpu/drm/amd/display/dc/dml/Makefile        |   8 +-
> > > >  .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |   3 +-
> > > >  .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |   6 +-
> > > >  .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |   3 +-
> > > >  .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |   2 -
> > > >  .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |   6 +-
> > > >  .../drm/amd/display/dc/dml/display_mode_enums.h    |   2 -
> > > >  .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |  12 -
> > > >  .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |   8 -
> > > >  .../drm/amd/display/dc/dml/display_mode_structs.h  |   6 +-
> > > >  .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |   8 +-
> > > >  .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |   4 +-
> > > >  drivers/gpu/drm/amd/display/dc/dsc/Makefile        |   1 +
> > > >  drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        | 105 ++-
> > > >  drivers/gpu/drm/amd/display/dc/dsc/dscc_types.h    |   2 -
> > > >  drivers/gpu/drm/amd/display/dc/dsc/qp_tables.h     |   2 -
> > > >  drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c       |   2 -
> > > >  drivers/gpu/drm/amd/display/dc/dsc/rc_calc.h       |   2 -
> > > >  drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c   |   2 -
> > > >  drivers/gpu/drm/amd/display/dc/gpio/Makefile       |   9 +-
> > > >  .../amd/display/dc/gpio/dcn20/hw_factory_dcn20.c   |  14 +-
> > > >  .../amd/display/dc/gpio/dcn20/hw_factory_dcn20.h   |   2 -
> > > >  .../amd/display/dc/gpio/dcn20/hw_translate_dcn20.c |   2 -
> > > >  .../amd/display/dc/gpio/dcn20/hw_translate_dcn20.h |   2 -
> > > >  .../amd/display/dc/gpio/dcn21/hw_factory_dcn21.c   |   2 -
> > > >  .../amd/display/dc/gpio/dcn21/hw_factory_dcn21.h   |   2 -
> > > >  .../amd/display/dc/gpio/dcn21/hw_translate_dcn21.c |   2 -
> > > >  .../amd/display/dc/gpio/dcn21/hw_translate_dcn21.h |   2 -
> > > >  drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h     |  12 -
> > > >  drivers/gpu/drm/amd/display/dc/gpio/hw_ddc.c       |  16 +-
> > > >  drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |  12 +-
> > > >  drivers/gpu/drm/amd/display/dc/gpio/hw_generic.c   |  23 +-
> > > >  drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c       |  32 +-
> > > >  drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |  12 +-
> > > >  drivers/gpu/drm/amd/display/dc/inc/core_status.h   |   2 -
> > > >  drivers/gpu/drm/amd/display/dc/inc/core_types.h    |  36 +-
> > > >  drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h   |   2 +-
> > > >  drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |  11 +-
> > > >  drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   9 +-
> > > >  .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |  12 -
> > > >  drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   4 -
> > > >  drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h       |   2 +
> > > >  drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |  12 -
> > > >  drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h        |   2 -
> > > >  drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h        |  12 +-
> > > >  drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |  15 +-
> > > >  drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |  17 +-
> > > >  .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |   9 +-
> > > >  drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |   2 -
> > > >  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |  10 -
> > > >  drivers/gpu/drm/amd/display/dc/inc/hw/opp.h        |   5 +-
> > > >  .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |  11 +-
> > > >  .../drm/amd/display/dc/inc/hw/timing_generator.h   |   8 -
> > > >  drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  | 362 +++------
> > > >  .../drm/amd/display/dc/inc/hw_sequencer_private.h  | 156 ++++
> > > >  drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |   6 +-
> > > >  drivers/gpu/drm/amd/display/dc/inc/reg_helper.h    |  19 +
> > > >  drivers/gpu/drm/amd/display/dc/inc/resource.h      |   4 -
> > > >  drivers/gpu/drm/amd/display/dc/irq/Makefile        |   6 +-
> > > >  .../amd/display/dc/irq/dce110/irq_service_dce110.c |   8 +-
> > > >  .../amd/display/dc/irq/dce120/irq_service_dce120.c |   4 +-
> > > >  .../amd/display/dc/irq/dce80/irq_service_dce80.c   |   4 +-
> > > >  .../amd/display/dc/irq/dcn10/irq_service_dcn10.c   |   4 +-
> > > >  .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |   4 +-
> > > >  .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |   4 +-
> > > >  drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |   2 +-
> > > >  drivers/gpu/drm/amd/display/dc/os_types.h          |   3 +-
> > > >  .../display/dc/virtual/virtual_stream_encoder.c    |   9 +-
> > > >  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 255 ++++++
> > > >  .../gpu/drm/amd/display/dmub/inc/dmub_cmd_dal.h    |  41 +
> > > >  .../gpu/drm/amd/display/dmub/inc/dmub_cmd_vbios.h  |  41 +
> > > >  .../gpu/drm/amd/display/dmub/inc/dmub_fw_state.h   |  73 ++
> > > >  drivers/gpu/drm/amd/display/dmub/inc/dmub_rb.h     | 129 +++
> > > >  drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h    | 522 +++++++++=
+++
> > > >  .../drm/amd/display/dmub/inc/dmub_trace_buffer.h   |  69 ++
> > > >  .../dmub/inc/dmub_types.h}                         |  61 +-
> > > >  drivers/gpu/drm/amd/display/dmub/src/Makefile      |  27 +
> > > >  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  | 152 ++++
> > > >  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |  63 ++
> > > >  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.c  | 141 ++++
> > > >  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.h  |  48 ++
> > > >  drivers/gpu/drm/amd/display/dmub/src/dmub_reg.c    | 109 +++
> > > >  drivers/gpu/drm/amd/display/dmub/src/dmub_reg.h    | 120 +++
> > > >  drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    | 453 +++++++++=
++
> > > >  drivers/gpu/drm/amd/display/include/dal_asic_id.h  |  16 +-
> > > >  drivers/gpu/drm/amd/display/include/dal_types.h    |   4 -
> > > >  .../amd/display/include/grph_object_ctrl_defs.h    |   3 +-
> > > >  .../gpu/drm/amd/display/include/i2caux_interface.h |   2 +-
> > > >  .../drm/amd/display/include/link_service_types.h   |   7 +
> > > >  drivers/gpu/drm/amd/display/include/logger_types.h |   6 -
> > > >  .../drm/amd/display/modules/color/color_gamma.c    |  41 +-
> > > >  .../drm/amd/display/modules/freesync/freesync.c    |  34 +-
> > > >  drivers/gpu/drm/amd/display/modules/hdcp/Makefile  |   3 +-
> > > >  drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    | 103 ++-
> > > >  drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    | 197 ++++-
> > > >  .../drm/amd/display/modules/hdcp/hdcp1_execution.c |  40 +-
> > > >  .../drm/amd/display/modules/hdcp/hdcp2_execution.c | 884 +++++++++=
++++++++++++
> > > >  .../amd/display/modules/hdcp/hdcp2_transition.c    | 674 +++++++++=
+++++++
> > > >  .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    | 326 ++++++++
> > > >  .../gpu/drm/amd/display/modules/hdcp/hdcp_log.c    | 118 +++
> > > >  .../gpu/drm/amd/display/modules/hdcp/hdcp_log.h    |  98 ++-
> > > >  .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    | 507 +++++++++=
++-
> > > >  .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.h    | 194 +++++
> > > >  .../gpu/drm/amd/display/modules/inc/mod_freesync.h |   1 -
> > > >  drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |  15 +-
> > > >  .../drm/amd/display/modules/inc/mod_info_packet.h  |   4 +-
> > > >  .../gpu/drm/amd/display/modules/inc/mod_shared.h   |   2 -
> > > >  .../amd/display/modules/info_packet/info_packet.c  |  46 +-
> > > >  drivers/gpu/drm/amd/include/amd_shared.h           |   5 +-
> > > >  .../amd/include/asic_reg/mmhub/mmhub_1_0_offset.h  |  16 +
> > > >  .../amd/include/asic_reg/mmhub/mmhub_1_0_sh_mask.h | 122 +++
> > > >  .../include/asic_reg/mmhub/mmhub_9_4_0_offset.h    |  53 --
> > > >  .../include/asic_reg/mmhub/mmhub_9_4_0_sh_mask.h   | 257 ------
> > > >  drivers/gpu/drm/amd/powerplay/amd_powerplay.c      |   4 +-
> > > >  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c         |  86 +-
> > > >  drivers/gpu/drm/amd/powerplay/arcturus_ppt.c       |  20 +-
> > > >  .../gpu/drm/amd/powerplay/hwmgr/hardwaremanager.c  |  15 +-
> > > >  drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c        |  25 +
> > > >  drivers/gpu/drm/amd/powerplay/hwmgr/pp_psm.c       |  30 +-
> > > >  drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c  |   3 +-
> > > >  drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c   |  33 +-
> > > >  drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c | 161 ++--
> > > >  .../gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c |   3 +
> > > >  drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c |   4 +-
> > > >  drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h     |  14 +-
> > > >  drivers/gpu/drm/amd/powerplay/inc/hwmgr.h          |   1 +
> > > >  drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h      |   8 +-
> > > >  drivers/gpu/drm/amd/powerplay/inc/smu_v12_0.h      |  18 +-
> > > >  drivers/gpu/drm/amd/powerplay/navi10_ppt.c         |  54 +-
> > > >  drivers/gpu/drm/amd/powerplay/renoir_ppt.c         | 176 +++-
> > > >  drivers/gpu/drm/amd/powerplay/smu_internal.h       |   8 +-
> > > >  drivers/gpu/drm/amd/powerplay/smu_v11_0.c          | 106 ++-
> > > >  drivers/gpu/drm/amd/powerplay/smu_v12_0.c          | 137 +++-
> > > >  drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c   |   4 +-
> > > >  drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c |   7 +-
> > > >  drivers/gpu/drm/amd/powerplay/smumgr/smu9_smumgr.c |  56 +-
> > > >  .../gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c   |  14 +
> > > >  .../gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c    |  27 +-
> > > >  drivers/gpu/drm/amd/powerplay/vega20_ppt.c         |   4 +-
> > > >  drivers/gpu/drm/radeon/atombios_dp.c               |   3 -
> > > >  drivers/gpu/drm/radeon/cik.c                       |   4 +-
> > > >  drivers/gpu/drm/radeon/r100.c                      |   4 +-
> > > >  drivers/gpu/drm/radeon/r200.c                      |   4 +-
> > > >  drivers/gpu/drm/radeon/r600.c                      |   4 +-
> > > >  drivers/gpu/drm/radeon/r600_cs.c                   |   8 +-
> > > >  drivers/gpu/drm/radeon/radeon_audio.c              |   2 +-
> > > >  drivers/gpu/drm/radeon/radeon_combios.c            |   3 +-
> > > >  drivers/gpu/drm/radeon/radeon_display.c            |   2 -
> > > >  drivers/gpu/drm/radeon/radeon_legacy_tv.c          |   8 +-
> > > >  drivers/gpu/drm/radeon/si.c                        |   4 +-
> > > >  drivers/gpu/drm/radeon/si_dpm.c                    |   5 +-
> > > >  include/uapi/drm/amdgpu_drm.h                      |   3 +
> > > >  399 files changed, 16810 insertions(+), 6910 deletions(-)
> > > >  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> > > >  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h
> > > >  create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
> > > >  create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.h
> > > >  create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
> > > >  create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.h
> > > >  create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
> > > >  create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.h
> > > >  delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue_v10=
.c
> > > >  rename drivers/gpu/drm/amd/amdkfd/{kfd_kernel_queue_v9.c =3D> kfd_=
packet_manager_v9.c} (81%)
> > > >  rename drivers/gpu/drm/amd/amdkfd/{kfd_kernel_queue_vi.c =3D> kfd_=
packet_manager_vi.c} (91%)
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dc/basics/dc_common=
.c
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dc/basics/dc_common=
.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_s=
equencer_debug.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init=
.c
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init=
.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init=
.c
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init=
.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init=
.c
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init=
.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer=
_private.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd_d=
al.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd_v=
bios.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_fw_st=
ate.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_rb.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_trace=
_buffer.h
> > > >  rename drivers/gpu/drm/amd/{amdkfd/kfd_kernel_queue_cik.c =3D> dis=
play/dmub/inc/dmub_types.h} (55%)
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/src/Makefile
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20=
.c
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20=
.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21=
.c
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21=
.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_reg.c
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_reg.h
> > > >  create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
> > > >  create mode 100644 drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_=
execution.c
> > > >  create mode 100644 drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_=
transition.c
> > > >  delete mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhu=
b_9_4_0_offset.h
> > > >  delete mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhu=
b_9_4_0_sh_mask.h
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
