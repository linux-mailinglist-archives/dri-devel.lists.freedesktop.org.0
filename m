Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C63C4023
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 01:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF80B89AAE;
	Sun, 11 Jul 2021 23:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0070.hostedemail.com
 [216.40.44.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1840C89AAE;
 Sun, 11 Jul 2021 23:46:26 +0000 (UTC)
Received: from omf19.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 2031B2289C;
 Sun, 11 Jul 2021 23:46:25 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf19.hostedemail.com (Postfix) with ESMTPA id D810E20D75C; 
 Sun, 11 Jul 2021 23:46:23 +0000 (UTC)
Message-ID: <111b2612313dc85eb6cffb5ec93423e92aadef15.camel@perches.com>
Subject: Re: drm/amd/display: Simplify hdcp validate_bksv
From: Joe Perches <joe@perches.com>
To: kernel test robot <lkp@intel.com>, Bhawanpreet Lakha
 <Bhawanpreet.Lakha@amd.com>
Date: Sun, 11 Jul 2021 16:46:22 -0700
In-Reply-To: <202107120638.fhBzNbDi-lkp@intel.com>
References: <d3a180c3dc8db68a25440edf466cfeddcaae5a64.camel@perches.com>
 <202107120638.fhBzNbDi-lkp@intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: D810E20D75C
X-Spam-Status: No, score=-0.78
X-Stat-Signature: 4w3xb16q81jdos9h7m1m6o7oixokhp8p
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19RtmqfZkbsFeCZmvi7tQ9HuVjqDlNgdx4=
X-HE-Tag: 1626047183-174502
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
Cc: kbuild-all@lists.01.org, Kees Cook <keescook@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-07-12 at 07:02 +0800, kernel test robot wrote:
> Hi Joe,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on drm-intel/for-linux-next]
> [also build test ERROR on drm-exynos/exynos-drm-next linus/master next-20210709]
> [cannot apply to kees/for-next/pstore tegra-drm/drm/tegra/for-next drm/drm-next v5.13]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Joe-Perches/drm-amd-display-Simplify-hdcp-validate_bksv/20210712-034708
> base:   git://anongit.freedesktop.org/drm-intel for-linux-next
> config: i386-randconfig-a003-20210712 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/0day-ci/linux/commit/66fae2c1becdcb71c95f2c6a6413de4dfe1deb51
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Joe-Perches/drm-amd-display-Simplify-hdcp-validate_bksv/20210712-034708
>         git checkout 66fae2c1becdcb71c95f2c6a6413de4dfe1deb51
>         # save the attached .config to linux build tree
>         make W=1 ARCH=i386 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> > > ERROR: modpost: "__popcountdi2" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

curious.

Anyone know why?


