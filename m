Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2083540AA88
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 11:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67ED86E44D;
	Tue, 14 Sep 2021 09:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578AC6E44A;
 Tue, 14 Sep 2021 09:16:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="201443300"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="201443300"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 02:16:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="543868404"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.216.6])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 02:16:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/i915: rename debugfs_gt files
In-Reply-To: <20210909004941.379035-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210909004941.379035-1-lucas.demarchi@intel.com>
Date: Tue, 14 Sep 2021 12:16:13 +0300
Message-ID: <87o88v34bm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Wed, 08 Sep 2021, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> We shouldn't be using debugfs_ namespace for this functionality. Rename
> debugfs_gt.[ch] to intel_gt_debugfs.[ch] and then make functions,
> defines and structs follow suit.
>
> While at it and since we are renaming the header, sort the includes
> alphabetically.

I didn't do a detailed review, maybe someone should, but superficially
seems good. On the series,

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                  |  2 +-
>  drivers/gpu/drm/i915/gt/debugfs_engines.c      |  6 +++---
>  drivers/gpu/drm/i915/gt/debugfs_gt_pm.c        | 14 +++++++-------
>  drivers/gpu/drm/i915/gt/intel_gt.c             |  6 +++---
>  .../gt/{debugfs_gt.c =3D> intel_gt_debugfs.c}    |  8 ++++----
>  .../gt/{debugfs_gt.h =3D> intel_gt_debugfs.h}    | 14 +++++++-------
>  drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c   | 10 +++++-----
>  drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c | 18 +++++++++---------
>  .../gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c |  8 ++++----
>  drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.c |  6 +++---
>  drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c  |  6 +++---
>  11 files changed, 49 insertions(+), 49 deletions(-)
>  rename drivers/gpu/drm/i915/gt/{debugfs_gt.c =3D> intel_gt_debugfs.c} (8=
7%)
>  rename drivers/gpu/drm/i915/gt/{debugfs_gt.h =3D> intel_gt_debugfs.h} (7=
1%)
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index c36c8a4f0716..3e171f0b5f6a 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -80,7 +80,6 @@ i915-$(CONFIG_PERF_EVENTS) +=3D i915_pmu.o
>  # "Graphics Technology" (aka we talk to the gpu)
>  gt-y +=3D \
>  	gt/debugfs_engines.o \
> -	gt/debugfs_gt.o \
>  	gt/debugfs_gt_pm.o \
>  	gt/gen2_engine_cs.o \
>  	gt/gen6_engine_cs.o \
> @@ -101,6 +100,7 @@ gt-y +=3D \
>  	gt/intel_gt.o \
>  	gt/intel_gt_buffer_pool.o \
>  	gt/intel_gt_clock_utils.o \
> +	gt/intel_gt_debugfs.o \
>  	gt/intel_gt_irq.o \
>  	gt/intel_gt_pm.o \
>  	gt/intel_gt_pm_irq.o \
> diff --git a/drivers/gpu/drm/i915/gt/debugfs_engines.c b/drivers/gpu/drm/=
i915/gt/debugfs_engines.c
> index 5e3725e62241..2980dac5b171 100644
> --- a/drivers/gpu/drm/i915/gt/debugfs_engines.c
> +++ b/drivers/gpu/drm/i915/gt/debugfs_engines.c
> @@ -7,9 +7,9 @@
>  #include <drm/drm_print.h>
>=20=20
>  #include "debugfs_engines.h"
> -#include "debugfs_gt.h"
>  #include "i915_drv.h" /* for_each_engine! */
>  #include "intel_engine.h"
> +#include "intel_gt_debugfs.h"
>=20=20
>  static int engines_show(struct seq_file *m, void *data)
>  {
> @@ -24,11 +24,11 @@ static int engines_show(struct seq_file *m, void *dat=
a)
>=20=20
>  	return 0;
>  }
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(engines);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(engines);
>=20=20
>  void debugfs_engines_register(struct intel_gt *gt, struct dentry *root)
>  {
> -	static const struct debugfs_gt_file files[] =3D {
> +	static const struct intel_gt_debugfs_file files[] =3D {
>  		{ "engines", &engines_fops },
>  	};
>=20=20
> diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c b/drivers/gpu/drm/i9=
15/gt/debugfs_gt_pm.c
> index f6733f279890..9222cf68c56c 100644
> --- a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
> @@ -6,11 +6,11 @@
>=20=20
>  #include <linux/seq_file.h>
>=20=20
> -#include "debugfs_gt.h"
>  #include "debugfs_gt_pm.h"
>  #include "i915_drv.h"
>  #include "intel_gt.h"
>  #include "intel_gt_clock_utils.h"
> +#include "intel_gt_debugfs.h"
>  #include "intel_gt_pm.h"
>  #include "intel_llc.h"
>  #include "intel_rc6.h"
> @@ -36,7 +36,7 @@ static int fw_domains_show(struct seq_file *m, void *da=
ta)
>=20=20
>  	return 0;
>  }
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(fw_domains);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(fw_domains);
>=20=20
>  static void print_rc6_res(struct seq_file *m,
>  			  const char *title,
> @@ -238,7 +238,7 @@ static int drpc_show(struct seq_file *m, void *unused)
>=20=20
>  	return err;
>  }
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(drpc);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(drpc);
>=20=20
>  static int frequency_show(struct seq_file *m, void *unused)
>  {
> @@ -480,7 +480,7 @@ static int frequency_show(struct seq_file *m, void *u=
nused)
>=20=20
>  	return 0;
>  }
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(frequency);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(frequency);
>=20=20
>  static int llc_show(struct seq_file *m, void *data)
>  {
> @@ -533,7 +533,7 @@ static bool llc_eval(void *data)
>  	return HAS_LLC(gt->i915);
>  }
>=20=20
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(llc);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(llc);
>=20=20
>  static const char *rps_power_to_str(unsigned int power)
>  {
> @@ -612,11 +612,11 @@ static bool rps_eval(void *data)
>  	return HAS_RPS(gt->i915);
>  }
>=20=20
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(rps_boost);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(rps_boost);
>=20=20
>  void debugfs_gt_pm_register(struct intel_gt *gt, struct dentry *root)
>  {
> -	static const struct debugfs_gt_file files[] =3D {
> +	static const struct intel_gt_debugfs_file files[] =3D {
>  		{ "drpc", &drpc_fops, NULL },
>  		{ "frequency", &frequency_fops, NULL },
>  		{ "forcewake", &fw_domains_fops, NULL },
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt=
/intel_gt.c
> index 2aeaae036a6f..9dda17553e12 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -3,7 +3,7 @@
>   * Copyright =C2=A9 2019 Intel Corporation
>   */
>=20=20
> -#include "debugfs_gt.h"
> +#include "intel_gt_debugfs.h"
>=20=20
>  #include "gem/i915_gem_lmem.h"
>  #include "i915_drv.h"
> @@ -15,11 +15,11 @@
>  #include "intel_gt_requests.h"
>  #include "intel_migrate.h"
>  #include "intel_mocs.h"
> +#include "intel_pm.h"
>  #include "intel_rc6.h"
>  #include "intel_renderstate.h"
>  #include "intel_rps.h"
>  #include "intel_uncore.h"
> -#include "intel_pm.h"
>  #include "shmem_utils.h"
>=20=20
>  void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i=
915)
> @@ -434,7 +434,7 @@ void intel_gt_driver_register(struct intel_gt *gt)
>  {
>  	intel_rps_driver_register(&gt->rps);
>=20=20
> -	debugfs_gt_register(gt);
> +	intel_gt_register_debugfs(gt);
>  }
>=20=20
>  static int intel_gt_init_scratch(struct intel_gt *gt, unsigned int size)
> diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt.c b/drivers/gpu/drm/i915/=
gt/intel_gt_debugfs.c
> similarity index 87%
> rename from drivers/gpu/drm/i915/gt/debugfs_gt.c
> rename to drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> index 591eb60785db..a27ba11605d8 100644
> --- a/drivers/gpu/drm/i915/gt/debugfs_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> @@ -6,13 +6,13 @@
>  #include <linux/debugfs.h>
>=20=20
>  #include "debugfs_engines.h"
> -#include "debugfs_gt.h"
>  #include "debugfs_gt_pm.h"
> +#include "i915_drv.h"
> +#include "intel_gt_debugfs.h"
>  #include "intel_sseu_debugfs.h"
>  #include "uc/intel_uc_debugfs.h"
> -#include "i915_drv.h"
>=20=20
> -void debugfs_gt_register(struct intel_gt *gt)
> +void intel_gt_register_debugfs(struct intel_gt *gt)
>  {
>  	struct dentry *root;
>=20=20
> @@ -31,7 +31,7 @@ void debugfs_gt_register(struct intel_gt *gt)
>  }
>=20=20
>  void intel_gt_debugfs_register_files(struct dentry *root,
> -				     const struct debugfs_gt_file *files,
> +				     const struct intel_gt_debugfs_file *files,
>  				     unsigned long count, void *data)
>  {
>  	while (count--) {
> diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt.h b/drivers/gpu/drm/i915/=
gt/intel_gt_debugfs.h
> similarity index 71%
> rename from drivers/gpu/drm/i915/gt/debugfs_gt.h
> rename to drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> index f77540f727e9..cab0f2cb5009 100644
> --- a/drivers/gpu/drm/i915/gt/debugfs_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> @@ -3,14 +3,14 @@
>   * Copyright =C2=A9 2019 Intel Corporation
>   */
>=20=20
> -#ifndef DEBUGFS_GT_H
> -#define DEBUGFS_GT_H
> +#ifndef INTEL_GT_DEBUGFS_H
> +#define INTEL_GT_DEBUGFS_H
>=20=20
>  #include <linux/file.h>
>=20=20
>  struct intel_gt;
>=20=20
> -#define DEFINE_GT_DEBUGFS_ATTRIBUTE(__name)				\
> +#define DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(__name)				\
>  	static int __name ## _open(struct inode *inode, struct file *file) \
>  {									\
>  	return single_open(file, __name ## _show, inode->i_private);	\
> @@ -23,16 +23,16 @@ static const struct file_operations __name ## _fops =
=3D {			\
>  	.release =3D single_release,					\
>  }
>=20=20
> -void debugfs_gt_register(struct intel_gt *gt);
> +void intel_gt_register_debugfs(struct intel_gt *gt);
>=20=20
> -struct debugfs_gt_file {
> +struct intel_gt_debugfs_file {
>  	const char *name;
>  	const struct file_operations *fops;
>  	bool (*eval)(void *data);
>  };
>=20=20
>  void intel_gt_debugfs_register_files(struct dentry *root,
> -				     const struct debugfs_gt_file *files,
> +				     const struct intel_gt_debugfs_file *files,
>  				     unsigned long count, void *data);
>=20=20
> -#endif /* DEBUGFS_GT_H */
> +#endif /* INTEL_GT_DEBUGFS_H */
> diff --git a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c b/drivers/gpu/d=
rm/i915/gt/intel_sseu_debugfs.c
> index 1ba8b7da9d37..8bb3a91dad82 100644
> --- a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
> @@ -4,9 +4,9 @@
>   * Copyright =C2=A9 2020 Intel Corporation
>   */
>=20=20
> -#include "debugfs_gt.h"
> -#include "intel_sseu_debugfs.h"
>  #include "i915_drv.h"
> +#include "intel_gt_debugfs.h"
> +#include "intel_sseu_debugfs.h"
>=20=20
>  static void sseu_copy_subslices(const struct sseu_dev_info *sseu,
>  				int slice, u8 *to_mask)
> @@ -282,7 +282,7 @@ static int sseu_status_show(struct seq_file *m, void =
*unused)
>=20=20
>  	return intel_sseu_status(m, gt);
>  }
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(sseu_status);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(sseu_status);
>=20=20
>  static int rcs_topology_show(struct seq_file *m, void *unused)
>  {
> @@ -293,11 +293,11 @@ static int rcs_topology_show(struct seq_file *m, vo=
id *unused)
>=20=20
>  	return 0;
>  }
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(rcs_topology);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(rcs_topology);
>=20=20
>  void intel_sseu_debugfs_register(struct intel_gt *gt, struct dentry *roo=
t)
>  {
> -	static const struct debugfs_gt_file files[] =3D {
> +	static const struct intel_gt_debugfs_file files[] =3D {
>  		{ "sseu_status", &sseu_status_fops, NULL },
>  		{ "rcs_topology", &rcs_topology_fops, NULL },
>  	};
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu=
/drm/i915/gt/uc/intel_guc_debugfs.c
> index 887c8c8f35db..25f09a420561 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> @@ -5,14 +5,14 @@
>=20=20
>  #include <drm/drm_print.h>
>=20=20
> -#include "gt/debugfs_gt.h"
> +#include "gt/intel_gt_debugfs.h"
> +#include "gt/uc/intel_guc_ads.h"
> +#include "gt/uc/intel_guc_ct.h"
> +#include "gt/uc/intel_guc_slpc.h"
> +#include "gt/uc/intel_guc_submission.h"
>  #include "intel_guc.h"
>  #include "intel_guc_debugfs.h"
>  #include "intel_guc_log_debugfs.h"
> -#include "gt/uc/intel_guc_ct.h"
> -#include "gt/uc/intel_guc_ads.h"
> -#include "gt/uc/intel_guc_submission.h"
> -#include "gt/uc/intel_guc_slpc.h"
>=20=20
>  static int guc_info_show(struct seq_file *m, void *data)
>  {
> @@ -35,7 +35,7 @@ static int guc_info_show(struct seq_file *m, void *data)
>=20=20
>  	return 0;
>  }
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_info);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(guc_info);
>=20=20
>  static int guc_registered_contexts_show(struct seq_file *m, void *data)
>  {
> @@ -49,7 +49,7 @@ static int guc_registered_contexts_show(struct seq_file=
 *m, void *data)
>=20=20
>  	return 0;
>  }
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_registered_contexts);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(guc_registered_contexts);
>=20=20
>  static int guc_slpc_info_show(struct seq_file *m, void *unused)
>  {
> @@ -62,7 +62,7 @@ static int guc_slpc_info_show(struct seq_file *m, void =
*unused)
>=20=20
>  	return intel_guc_slpc_print_info(slpc, &p);
>  }
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_slpc_info);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(guc_slpc_info);
>=20=20
>  static bool intel_eval_slpc_support(void *data)
>  {
> @@ -73,7 +73,7 @@ static bool intel_eval_slpc_support(void *data)
>=20=20
>  void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *ro=
ot)
>  {
> -	static const struct debugfs_gt_file files[] =3D {
> +	static const struct intel_gt_debugfs_file files[] =3D {
>  		{ "guc_info", &guc_info_fops, NULL },
>  		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
>  		{ "guc_slpc_info", &guc_slpc_info_fops, &intel_eval_slpc_support},
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c b/drivers=
/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
> index 64e0b86bf258..46026c2c1722 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
> @@ -6,7 +6,7 @@
>  #include <linux/fs.h>
>  #include <drm/drm_print.h>
>=20=20
> -#include "gt/debugfs_gt.h"
> +#include "gt/intel_gt_debugfs.h"
>  #include "intel_guc.h"
>  #include "intel_guc_log.h"
>  #include "intel_guc_log_debugfs.h"
> @@ -17,7 +17,7 @@ static int guc_log_dump_show(struct seq_file *m, void *=
data)
>=20=20
>  	return intel_guc_log_dump(m->private, &p, false);
>  }
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_log_dump);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(guc_log_dump);
>=20=20
>  static int guc_load_err_log_dump_show(struct seq_file *m, void *data)
>  {
> @@ -25,7 +25,7 @@ static int guc_load_err_log_dump_show(struct seq_file *=
m, void *data)
>=20=20
>  	return intel_guc_log_dump(m->private, &p, true);
>  }
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_load_err_log_dump);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(guc_load_err_log_dump);
>=20=20
>  static int guc_log_level_get(void *data, u64 *val)
>  {
> @@ -109,7 +109,7 @@ static const struct file_operations guc_log_relay_fop=
s =3D {
>  void intel_guc_log_debugfs_register(struct intel_guc_log *log,
>  				    struct dentry *root)
>  {
> -	static const struct debugfs_gt_file files[] =3D {
> +	static const struct intel_gt_debugfs_file files[] =3D {
>  		{ "guc_log_dump", &guc_log_dump_fops, NULL },
>  		{ "guc_load_err_log_dump", &guc_load_err_log_dump_fops, NULL },
>  		{ "guc_log_level", &guc_log_level_fops, NULL },
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.c b/drivers/gpu=
/drm/i915/gt/uc/intel_huc_debugfs.c
> index 5733c15fd123..15998963b863 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.c
> @@ -5,7 +5,7 @@
>=20=20
>  #include <drm/drm_print.h>
>=20=20
> -#include "gt/debugfs_gt.h"
> +#include "gt/intel_gt_debugfs.h"
>  #include "intel_huc.h"
>  #include "intel_huc_debugfs.h"
>=20=20
> @@ -21,11 +21,11 @@ static int huc_info_show(struct seq_file *m, void *da=
ta)
>=20=20
>  	return 0;
>  }
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(huc_info);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(huc_info);
>=20=20
>  void intel_huc_debugfs_register(struct intel_huc *huc, struct dentry *ro=
ot)
>  {
> -	static const struct debugfs_gt_file files[] =3D {
> +	static const struct intel_gt_debugfs_file files[] =3D {
>  		{ "huc_info", &huc_info_fops, NULL },
>  	};
>=20=20
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c b/drivers/gpu/=
drm/i915/gt/uc/intel_uc_debugfs.c
> index 089d98662f46..c2f7924295e7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
> @@ -6,7 +6,7 @@
>  #include <linux/debugfs.h>
>  #include <drm/drm_print.h>
>=20=20
> -#include "gt/debugfs_gt.h"
> +#include "gt/intel_gt_debugfs.h"
>  #include "intel_guc_debugfs.h"
>  #include "intel_huc_debugfs.h"
>  #include "intel_uc.h"
> @@ -32,11 +32,11 @@ static int uc_usage_show(struct seq_file *m, void *da=
ta)
>=20=20
>  	return 0;
>  }
> -DEFINE_GT_DEBUGFS_ATTRIBUTE(uc_usage);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(uc_usage);
>=20=20
>  void intel_uc_debugfs_register(struct intel_uc *uc, struct dentry *gt_ro=
ot)
>  {
> -	static const struct debugfs_gt_file files[] =3D {
> +	static const struct intel_gt_debugfs_file files[] =3D {
>  		{ "usage", &uc_usage_fops, NULL },
>  	};
>  	struct dentry *root;

--=20
Jani Nikula, Intel Open Source Graphics Center
