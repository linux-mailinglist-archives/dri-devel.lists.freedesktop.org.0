Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E5988EB5F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 17:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF6E10FE1F;
	Wed, 27 Mar 2024 16:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZCFcREkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970DC10FE1F;
 Wed, 27 Mar 2024 16:33:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 83DC9CE2748;
 Wed, 27 Mar 2024 16:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67878C433F1;
 Wed, 27 Mar 2024 16:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711557214;
 bh=JJGwdu5+tvYciOZj7QulorQIGULSYG5NgjT2ZUaXCGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZCFcREkHBHdBwZObWwSP8/tuuajCavkjusAk5Vu3ZFbGx91YtVFEZoK1GGODkfSss
 zOfGYzOfRD8f18G93URkH4EhsCteBdGLEOYvMooFGlwHAa3qrFzMaFJompR6KcTbvN
 nuoeyK8w2o/h++AWHV0OaUamKOSgKhgIRlpvzrL9Yp6A0ehowBGHSLjtKZEcYRPsZD
 LeDMW+uYziCpDUHIFjWXEZjbkgpzRmq4DMexH0WoYlOo90zJb82FlUcN5wx3nm9xGb
 mrzElA5p64o1EAYwj8YWQpL+xeH6TACmXm7ESngxzaEX/QzKUFJ8lXSoOYoB3bwPH8
 2+iZbmSRiLSlw==
Date: Wed, 27 Mar 2024 09:33:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [RESEND v3 2/2] drm: Add CONFIG_DRM_WERROR
Message-ID: <20240327163331.GB1153323@dev-arch.thelio-3990X>
References: <cover.1709629403.git.jani.nikula@intel.com>
 <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>
 <20240326225650.GA2784736@dev-arch.thelio-3990X>
 <20240327-cherubic-steel-tiger-e1c36a@houat>
 <87a5mkgl6i.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5mkgl6i.fsf@intel.com>
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

On Wed, Mar 27, 2024 at 09:59:01AM +0200, Jani Nikula wrote:
> On Wed, 27 Mar 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > On Tue, Mar 26, 2024 at 03:56:50PM -0700, Nathan Chancellor wrote:
> >> On Tue, Mar 05, 2024 at 11:07:36AM +0200, Jani Nikula wrote:
> >> > Add kconfig to enable -Werror subsystem wide. This is useful for
> >> > development and CI to keep the subsystem warning free, while avoiding
> >> > issues outside of the subsystem that kernel wide CONFIG_WERROR=y might
> >> > hit.
> >> > 
> >> > v2: Don't depend on COMPILE_TEST
> >> > 
> >> > Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com> # v1
> >> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/Kconfig  | 13 +++++++++++++
> >> >  drivers/gpu/drm/Makefile |  3 +++
> >> >  2 files changed, 16 insertions(+)
> >> > 
> >> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> >> > index 6e853acf15da..c08e18108c2a 100644
> >> > --- a/drivers/gpu/drm/Kconfig
> >> > +++ b/drivers/gpu/drm/Kconfig
> >> > @@ -416,3 +416,16 @@ config DRM_LIB_RANDOM
> >> >  config DRM_PRIVACY_SCREEN
> >> >  	bool
> >> >  	default n
> >> > +
> >> > +config DRM_WERROR
> >> > +	bool "Compile the drm subsystem with warnings as errors"
> >> > +	depends on EXPERT
> >> > +	default n
> >> > +	help
> >> > +	  A kernel build should not cause any compiler warnings, and this
> >> > +	  enables the '-Werror' flag to enforce that rule in the drm subsystem.
> >> > +
> >> > +	  The drm subsystem enables more warnings than the kernel default, so
> >> > +	  this config option is disabled by default.
> >> > +
> >> > +	  If in doubt, say N.
> >> 
> >> While I understand the desire for an easy switch that maintainers and
> >> developers can use to ensure that their changes are warning free for the
> >> drm subsystem specifically, I think subsystem specific configuration
> >> options like this are actively detrimental to developers and continuous
> >> integration systems that build test the entire kernel. For example, we
> >> turned off CONFIG_WERROR for our Hexagon builds because of warnings that
> >> appear with -Wextra that are legitimate but require treewide changes to
> >> resolve in a manner sufficient for Linus:
> >> 
> >> https://github.com/ClangBuiltLinux/linux/issues/1285
> >> https://lore.kernel.org/all/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> >> https://lore.kernel.org/all/20230522105049.1467313-1-schnelle@linux.ibm.com/
> >> 
> >> But now, due to CONFIG_DRM_WERROR getting enabled by all{mod,yes}config
> >> and -Wextra being unconditionally enabled for DRM, those warnings hard
> >> break the build despite CONFIG_WERROR=n...
> >
> > Would making DRM_WERROR depends on WERROR address your concerns?
> 
> But then what would be the point of having DRM_WERROR at all? For me the
> point is, "werror in drm, ignore the rest, they're someone else's
> problem".

Right, I do think this is a valid view point and one I am sympathetic
to, especially since it is in the pursuit of increased code quality. I
do not want to disrupt that.

> An alternative would be to "depends on !COMPILE_TEST" that we have in
> i915, but then some folks want to have COMPILE_TEST in drm, because some
> drivers are otherwise hard for people to build.

Right. I think it is unfortunate how (at least in my opinion)
CONFIG_COMPILE_TEST has two meanings: genuinely just compile testing or
"allmodconfig". For the first case, we would want CONFIG_DRM_WERROR=y
but for the second case, it would be nice for CONFIG_DRM_WERROR to
default to off (because CONFIG_WERROR is enabled) but allow developers
to turn it on explicitly.

Another lofty/wistful idea to solve this would be to implement something
similar to compiler diagnostic groups for Kconfig, where there would be
a hierarchy like

  CONFIG_WERROR
    CONFIG_DRM_WERROR
    CONFIG_SUBSYSTEM_A_WERROR
    CONFIG_SUBSYSTEM_B_WERROR

where the value of CONFIG_WERROR is the same value for all
subconfigurations under it but they could still be enabled individually
without any additional dependencies (ala something like '-Wno-unused
-Wunused-variable'), which would allow my use case of CONFIG_WERROR=n
removing all instances of -Werror to continue to work but allow other
developers and CI systems to just set their specific -Werror
configuration and be done with it. I don't think something like that
exists but maybe I don't know Kconfig as well as I think I do :)

> Nathan, we do want to fix any issues switfly. Are you hitting specific
> build problems?

Yes, I see three distinct set of problems from our CI as a direct result
of this series. I already covered two in the prior mail but I'll be a
little more expansive below.

1. Instances of -Wunused-but-set-variable from variables that only have
   unary operations applied to them. Clang can warn in this case where
   GCC cannot: https://godbolt.org/z/d368q3coP

      int main(void)
      {
          int a = 0;
          a++;
          return 0;
      }

   which shows up in a few drm drivers. Most have a patch on the mailing
   list that has not been applied.

     drivers/gpu/drm/qxl/qxl_cmd.c:424:6: error: variable 'count' set but not used [-Werror,-Wunused-but-set-variable]
       424 |         int count = 0;
           |             ^
     https://lore.kernel.org/all/20230408165023.2706235-1-trix@redhat.com/ (almost a year old)

     drivers/gpu/drm/qxl/qxl_ioctl.c:148:14: error: variable 'num_relocs' set but not used [-Werror,-Wunused-but-set-variable]
       148 |         int i, ret, num_relocs;
           |                     ^
     https://lore.kernel.org/all/20240307104119.1980621-1-colin.i.king@gmail.com/

     drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable 'out' set but not used [-Werror,-Wunused-but-set-variable]
       843 |         u64 out = dumper->iova + A6XX_CD_DATA_OFFSET;
           |             ^
     https://lore.kernel.org/all/20240326212324.185832-1-ojeda@kernel.org/ (recent patch)

     drivers/gpu/drm/panthor/panthor_sched.c:2048:6: error: variable 'csg_mod_mask' set but not used [-Werror,-Wunused-but-set-variable]
      2048 |         u32 csg_mod_mask = 0, free_csg_slots = 0;
           |             ^
     No patch, new driver, not reported yet it seems.

2. High stack usage in AMDGPU files for ARCH=powerpc allmodconfig. This
   might be a compiler issue but until now, there have been more
   important fires.

     drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:1096:12: error: stack frame size (2064) exceeds limit (2048) in 'vcn_v3_0_start' [-Werror,-Wframe-larger-than]
      1096 | static int vcn_v3_0_start(struct amdgpu_device *adev)
           |            ^

     drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:955:12: error: stack frame size (2112) exceeds limit (2048) in 'vcn_v4_0_5_start' [-Werror,-Wframe-larger-than]
       955 | static int vcn_v4_0_5_start(struct amdgpu_device *adev)
           |            ^

     drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:713:12: error: stack frame size (2992) exceeds limit (2048) in 'vcn_v5_0_0_start' [-Werror,-Wframe-larger-than]
       713 | static int vcn_v5_0_0_start(struct amdgpu_device *adev)
           |            ^

   Taking a brief look at it while writing this email, it appears
   related to CONFIG_UBSAN_BOUNDS, as none of the warnings appear when
   that is disabled on top of allmodconfig. I suspect that the sanitizer
   instrumentation and inlining might be messing something up here, it
   has happened with other sanitizers like KASAN and KCSAN in the past.
   Without CONFIG_UBSAN_BOUNDS, the stack usage of these functions does
   not seem too bad:

     drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:1096:12: warning: stack frame size (816) exceeds limit (512) in 'vcn_v3_0_start' [-Wframe-larger-than]
     drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c:955:12: warning: stack frame size (800) exceeds limit (512) in 'vcn_v4_0_5_start' [-Wframe-larger-than]
     drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c:713:12: warning: stack frame size (1040) exceeds limit (512) in 'vcn_v5_0_0_start' [-Wframe-larger-than]

3. -Wnull-pointer-arithmetic from IO port accessors on architectures
   that do not have them (such as hexagon and s390). For example:

     In file included from drivers/gpu/drm/virtio/virtgpu_plane.c:26:
     In file included from include/drm/drm_atomic_helper.h:31:
     In file included from include/drm/drm_crtc.h:32:
     In file included from include/drm/drm_modes.h:33:
     In file included from include/drm/drm_connector.h:32:
     In file included from include/drm/drm_util.h:35:
     In file included from include/linux/interrupt.h:11:
     In file included from include/linux/hardirq.h:11:
     In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
     In file included from include/asm-generic/hardirq.h:17:
     In file included from include/linux/irq.h:20:
     In file included from include/linux/io.h:13:
     In file included from arch/hexagon/include/asm/io.h:328:
     include/asm-generic/io.h:584:33: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
       584 |         __raw_writeb(value, PCI_IOBASE + addr);
           |                             ~~~~~~~~~~ ^
     include/asm-generic/io.h:594:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
       594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
           |                                                       ~~~~~~~~~~ ^
     include/asm-generic/io.h:604:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
       604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
           |                                                       ~~~~~~~~~~ ^

   These warnings are numerous throughout drivers/gpu/drm/ because this
   warning is enabled with -Wextra. Again, this is not exactly your
   problem and it should eventually be fixed by [1] (it appears that
   Niklas is working on a new version at [2]) but it is exacerbated by
   the default combo of W=1 + -Werror for DRM with allmodconfig now,
   even with CONFIG_WERROR=n.

Hopefully that helps clear things up. I am more than happy to send
patches or work towards solutions that satisfies everyone (or at least a
majority/consensus). Wider testing with clang never hurts as well but I
understand increasing build matrices is not always an easy sell.

[1]: https://lore.kernel.org/all/20230522105049.1467313-45-schnelle@linux.ibm.com/
[2]: https://git.kernel.org/niks/l/has_ioport_v6

Cheers,
Nathan
