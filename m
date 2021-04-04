Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4384A35393A
	for <lists+dri-devel@lfdr.de>; Sun,  4 Apr 2021 19:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C996E4D2;
	Sun,  4 Apr 2021 17:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5755A6E4D2
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Apr 2021 17:50:25 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id x26so89285pfn.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Apr 2021 10:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xtS4t+nQto3HTF/gGAoZaki1HLvMbnu+fb1pzmfFsTk=;
 b=gxuY/Ho+fio8UKkm58hhbutA59hrxcwYogTlDgzFAFZBfDofrmoEF3NJFjIZBoxvzX
 7pB+el5Hl38VT0jd2lPfV8qb4eojStdphvaO/NWYF96uFtTwTRdIWCJoEXzXOHRuohMf
 2zYpVNQFHBOMoKhxh6GPjf9TORowZE2t5kPo5l9IxK+6wEZuXgiqOLftYs0a0GiVH2rt
 AlK1rloVQTghbTpP/4/p6RUY1d/iItnPJnzXBaCiooEB0VP0nUxZ2eHbPqLeimrGXRlK
 bP5cjdI9PZJoNZdZQaYpfFl4ImTlrfFsTfZaYRhjgluITBTcfI+IUy16YOlt6bLAOUBi
 3V+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xtS4t+nQto3HTF/gGAoZaki1HLvMbnu+fb1pzmfFsTk=;
 b=R4K+VEkxJEU7cz/nJfBCbXeJC8YfcJhd1M1dndvKqj9ghve/YD/AWltgW7pP6Dnm6P
 QVibSIV9A/9PIaAEgAhSHFYfP0ACvlVQ1QgDEQtOYLPXoTDtu2xfsKMsTl+sAXzE9gZy
 6oNIgrY/g3Q2mxVF4wpeFHyx6vXxC/x1eSC7xMMsW7rhQAL9pCJGv3TEyD2Z0ZrCl2a7
 3dFPNC6YE05mBKiFloAqhYXfKZY80GHeUde5y2J8/gOpuJ6BIxrxKAYE1ttEy4fbZU/y
 JruM1v+60ChmWNWTMbV/ULGlvGpp989RbRFCFQVOI77QTwGJn9u0RHM24saRdugNQ5Z2
 0uJQ==
X-Gm-Message-State: AOAM531j/QJ2JWb7CBRX91kbmBsY/DT1NqV8wVgpFndIbHXxy45C/PjP
 yau06+PDnlNkRkM9Zv06KdOYU5qDOhEOPPpaQzg=
X-Google-Smtp-Source: ABdhPJxfE2Yq/BhlJLoNRWfL/eplfcKO+kVcP/6urwHqUpCdVKegNuAtRzaKGCYMfTizuqaKQs5Hn8AlCLkI/cdRbq8=
X-Received: by 2002:a63:e5d:: with SMTP id 29mr19863954pgo.450.1617558624758; 
 Sun, 04 Apr 2021 10:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <e948dc1de2c7de246c81728248d7c6cdca7b4fd6.1617539357.git.sylphrenadin@gmail.com>
 <202104042357.O0wCwDE8-lkp@intel.com>
In-Reply-To: <202104042357.O0wCwDE8-lkp@intel.com>
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
Date: Sun, 4 Apr 2021 23:20:13 +0530
Message-ID: <CACAkLuruDeYjnWOb8o+8HFfTNZXuHWm8O+xLTiLgtLU5j8=A+g@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] drm/vkms: Refactor vkms_composer_worker() to prep
 for virtual_hw mode
To: kernel test robot <lkp@intel.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, kbuild-all@lists.01.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 4, 2021 at 9:19 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Sumera,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v5.12-rc5 next-20210401]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Sumera-Priyadarsini/Add-virtual-hardware-module/20210404-211300
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2023a53bdf41b7646b1d384b6816af06309f73a5
> config: mips-randconfig-r025-20210404 (attached as .config)
> compiler: mipsel-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/4bd5c27357dd86b6099f3f28db5db722ceeed582
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Sumera-Priyadarsini/Add-virtual-hardware-module/20210404-211300
>         git checkout 4bd5c27357dd86b6099f3f28db5db722ceeed582
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/gpu/drm/vkms/vkms_composer.c: In function 'vkms_composer_worker':
> >> drivers/gpu/drm/vkms/vkms_composer.c:226:20: warning: variable 'wb_pending' set but not used [-Wunused-but-set-variable]
>      226 |  bool crc_pending, wb_pending;
>          |                    ^~~~~~~~~~
>
>
> vim +/wb_pending +226 drivers/gpu/drm/vkms/vkms_composer.c
>
> 4bd5c27357dd86 drivers/gpu/drm/vkms/vkms_composer.c Sumera Priyadarsini 2021-04-04  209
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  210  /**
> a4e7e98e90ebd9 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2019-06-25  211   * vkms_composer_worker - ordered work_struct to compute CRC
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  212   *
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  213   * @work: work_struct
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  214   *
> a4e7e98e90ebd9 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2019-06-25  215   * Work handler for composing and computing CRCs. work_struct scheduled in
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  216   * an ordered workqueue that's periodically scheduled to run by
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  217   * _vblank_handle() and flushed at vkms_atomic_crtc_destroy_state().
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  218   */
> a4e7e98e90ebd9 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2019-06-25  219  void vkms_composer_worker(struct work_struct *work)
> 6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  220  {
> 6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  221         struct vkms_crtc_state *crtc_state = container_of(work,
> 6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  222                                                 struct vkms_crtc_state,
> a4e7e98e90ebd9 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2019-06-25  223                                                 composer_work);
> 6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  224         struct drm_crtc *crtc = crtc_state->base.crtc;
> 6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  225         struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> dbd9d80c1b2e03 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2020-08-30 @226         bool crc_pending, wb_pending;
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  227         u64 frame_start, frame_end;
> 4bd5c27357dd86 drivers/gpu/drm/vkms/vkms_composer.c Sumera Priyadarsini 2021-04-04  228         u32 crc32 = 0;
> 953025763d1421 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2020-08-30  229         int ret;
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  230
> a4e7e98e90ebd9 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2019-06-25  231         spin_lock_irq(&out->composer_lock);
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  232         frame_start = crtc_state->frame_start;
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  233         frame_end = crtc_state->frame_end;
> 18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  234         crc_pending = crtc_state->crc_pending;
> dbd9d80c1b2e03 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2020-08-30  235         wb_pending = crtc_state->wb_pending;
> 18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  236         crtc_state->frame_start = 0;
> 18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  237         crtc_state->frame_end = 0;
> 18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  238         crtc_state->crc_pending = false;
> a4e7e98e90ebd9 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2019-06-25  239         spin_unlock_irq(&out->composer_lock);
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  240
> 18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  241         /*
> 18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  242          * We raced with the vblank hrtimer and previous work already computed
> 18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  243          * the crc, nothing to do.
> 18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  244          */
> 18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  245         if (!crc_pending)
> 18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  246                 return;
> 6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  247
> 4bd5c27357dd86 drivers/gpu/drm/vkms/vkms_composer.c Sumera Priyadarsini 2021-04-04  248         ret = vkms_composer_common(crtc_state, out, crtc_state->wb_pending, &crc32);
> 4bd5c27357dd86 drivers/gpu/drm/vkms/vkms_composer.c Sumera Priyadarsini 2021-04-04  249         if (ret == -EINVAL)
> 953025763d1421 drivers/gpu/drm/vkms/vkms_composer.c Rodrigo Siqueira    2020-08-30  250                 return;
> 18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  251         /*
> 18d0952a838ba5 drivers/gpu/drm/vkms/vkms_crc.c      Daniel Vetter       2019-06-07  252          * The worker can fall behind the vblank hrtimer, make sure we catch up.
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  253          */
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  254         while (frame_start <= frame_end)
> 0ca33adb91c0a9 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-09-04  255                 drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
> 6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  256  }
> 6c234fe37c5762 drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed     2018-08-02  257
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

This error seems to have creeped in again. I am not sure why I didn't
get any warning for this.
I will submit a revised patch, sorry for the noise. :/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
