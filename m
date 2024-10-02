Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E9E98CE8B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 10:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D83F10E32F;
	Wed,  2 Oct 2024 08:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="okq5SfQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1905310E32F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 08:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727856848;
 bh=cN5BO9INP+8SjuknZdd8CSGf5m7pxLUl5nRuLqqK6ic=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=okq5SfQ6ybIaaZug/tEdLx8HzjGCrYU8lLDz9D7V1Hy3WmrIX2CVDL6S588VUdIpY
 4RMjR4M3sf1zKT10nWg5V6WIpAEB+g/+ZEfkOnjty7k27A1/sF/phQ/K6Euqg7t7u8
 9B+mlC0gSYOgwksqHcOrcHuuE6lv5ZgLw/Rc8S0kVJrYwqovrgntmYwlZSL6ExvU26
 5XFco7+CF2VBqq6aSDlD0stMdDvx+xJ1FtEiyaJs5V+SKAjTpTYKxviyGVWzAHN6YB
 D9DHioMUOwLDSnpnbF4kVBN6Uv/AezdAa8szkaarrTn5EuJ1w2+JlRkNkmruq9AcVM
 u3r/Q7q3L4gJw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EA42017E1088;
 Wed,  2 Oct 2024 10:14:07 +0200 (CEST)
Date: Wed, 2 Oct 2024 10:14:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: kernel test robot <lkp@intel.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Boris
 Brezillon <bbrezillon@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v8 3/5] drm/panthor: add DRM fdinfo support
Message-ID: <20241002101403.3df35ea7@collabora.com>
In-Reply-To: <202409291048.zLqDeqpO-lkp@intel.com>
References: <20240923230912.2207320-4-adrian.larumbe@collabora.com>
 <202409291048.zLqDeqpO-lkp@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Sun, 29 Sep 2024 08:25:38 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Adri=C3=A1n,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.11 next-20240927]
> [cannot apply to drm-misc/drm-misc-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm=
-panthor-introduce-job-cycle-and-timestamp-accounting/20240924-071018
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20240923230912.2207320-4-adrian.=
larumbe%40collabora.com
> patch subject: [PATCH v8 3/5] drm/panthor: add DRM fdinfo support
> config: arm-randconfig-002-20240929 (https://download.01.org/0day-ci/arch=
ive/20240929/202409291048.zLqDeqpO-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240929/202409291048.zLqDeqpO-lkp@intel.com/reproduce)

I gave this a try with Adrian's series applied on top of drm-misc-next,
and I couldn't reproduce the issue.

>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409291048.zLqDeqpO-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from include/linux/math64.h:6,
>                     from include/linux/time.h:6,
>                     from include/linux/stat.h:19,
>                     from include/linux/module.h:13,
>                     from drivers/gpu/drm/panthor/panthor_drv.c:7:
>    drivers/gpu/drm/panthor/panthor_drv.c: In function 'panthor_gpu_show_f=
dinfo':
> >> drivers/gpu/drm/panthor/panthor_drv.c:1389:45: error: implicit declara=
tion of function 'arch_timer_get_cntfrq' [-Wimplicit-function-declaration] =
=20
>     1389 |                                             arch_timer_get_cnt=
frq()));
>          |                                             ^~~~~~~~~~~~~~~~~~=
~~~
>    include/linux/math.h:40:39: note: in definition of macro 'DIV_ROUND_DO=
WN_ULL'
>       40 |         ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); =
_tmp; })
>          |                                       ^~
>    drivers/gpu/drm/panthor/panthor_drv.c:1388:28: note: in expansion of m=
acro 'DIV_ROUND_UP_ULL'
>     1388 |                            DIV_ROUND_UP_ULL((pfile->stats.time=
 * NSEC_PER_SEC),
>          |                            ^~~~~~~~~~~~~~~~
>=20
>=20
> vim +/arch_timer_get_cntfrq +1389 drivers/gpu/drm/panthor/panthor_drv.c
>=20
>   1377=09
>   1378	static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
>   1379					    struct panthor_file *pfile,
>   1380					    struct drm_printer *p)
>   1381	{
>   1382		if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_ALL)
>   1383			panthor_fdinfo_gather_group_samples(pfile);
>   1384=09
>   1385		if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP) {
>   1386	#ifdef CONFIG_ARM_ARCH_TIMER
>   1387			drm_printf(p, "drm-engine-panthor:\t%llu ns\n",
>   1388				   DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
> > 1389						    arch_timer_get_cntfrq())); =20
>   1390	#endif
>   1391		}
>   1392		if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_CYCLES)
>   1393			drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles=
);
>   1394=09
>   1395		drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate);
>   1396		drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_fr=
equency);
>   1397	}
>   1398=09
>=20

