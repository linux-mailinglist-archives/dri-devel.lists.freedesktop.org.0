Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FE83097A1
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 19:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE12D6E131;
	Sat, 30 Jan 2021 18:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0135.hostedemail.com
 [216.40.44.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEF86E131
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 18:47:53 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id AB223181D303C;
 Sat, 30 Jan 2021 18:47:52 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:966:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1461:1515:1516:1518:1534:1543:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3354:3622:3865:3867:3868:4321:4385:4605:5007:6119:7652:7903:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12048:12296:12297:12438:12555:12740:12895:12986:13439:13894:13972:14181:14659:14721:21080:21433:21451:21627:21740:30029:30054:30056:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: paint73_001571e275b3
X-Filterd-Recvd-Size: 4233
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Sat, 30 Jan 2021 18:47:51 +0000 (UTC)
Message-ID: <719e0f14852d132a6649dbd5791fca17f251cb8e.camel@perches.com>
Subject: Re: [PATCH 10/29] drm/i915: Avoid comma separated statements
From: Joe Perches <joe@perches.com>
To: Jiri Kosina <trivial@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Sat, 30 Jan 2021 10:47:50 -0800
In-Reply-To: <d687691df8f9978c7b2362c18d77a16b49be76b0.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
 <d687691df8f9978c7b2362c18d77a16b49be76b0.1598331148.git.joe@perches.com>
User-Agent: Evolution 3.38.1-1 
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
> Use semicolons and braces.

Ping?

> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> =A0drivers/gpu/drm/i915/gt/gen8_ppgtt.c           | 8 +++++---
> =A0drivers/gpu/drm/i915/gt/intel_gt_requests.c    | 6 ++++--
> =A0drivers/gpu/drm/i915/gt/selftest_workarounds.c | 6 ++++--
> =A0drivers/gpu/drm/i915/intel_runtime_pm.c        | 6 ++++--
> =A04 files changed, 17 insertions(+), 9 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/=
gt/gen8_ppgtt.c
> index 699125928272..114c13285ff1 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -323,10 +323,12 @@ static int __gen8_ppgtt_alloc(struct i915_address_s=
pace * const vm,
> =A0			}
> =A0
> =

> =A0			spin_lock(&pd->lock);
> -			if (likely(!pd->entry[idx]))
> +			if (likely(!pd->entry[idx])) {
> =A0				set_pd_entry(pd, idx, pt);
> -			else
> -				alloc =3D pt, pt =3D pd->entry[idx];
> +			} else {
> +				alloc =3D pt;
> +				pt =3D pd->entry[idx];
> +			}
> =A0		}
> =A0
> =

> =A0		if (lvl) {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/dr=
m/i915/gt/intel_gt_requests.c
> index 66fcbf9d0fdd..54408d0b5e6e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -139,8 +139,10 @@ long intel_gt_retire_requests_timeout(struct intel_g=
t *gt, long timeout)
> =A0	LIST_HEAD(free);
> =A0
> =

> =A0	interruptible =3D true;
> -	if (unlikely(timeout < 0))
> -		timeout =3D -timeout, interruptible =3D false;
> +	if (unlikely(timeout < 0)) {
> +		timeout =3D -timeout;
> +		interruptible =3D false;
> +	}
> =A0
> =

> =A0	flush_submission(gt, timeout); /* kick the ksoftirqd tasklets */
> =A0	spin_lock(&timelines->lock);
> diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu=
/drm/i915/gt/selftest_workarounds.c
> index febc9e6692ba..3e4cbeed20bd 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> @@ -521,8 +521,10 @@ static int check_dirty_whitelist(struct intel_contex=
t *ce)
> =A0
> =

> =A0		srm =3D MI_STORE_REGISTER_MEM;
> =A0		lrm =3D MI_LOAD_REGISTER_MEM;
> -		if (INTEL_GEN(engine->i915) >=3D 8)
> -			lrm++, srm++;
> +		if (INTEL_GEN(engine->i915) >=3D 8) {
> +			lrm++;
> +			srm++;
> +		}
> =A0
> =

> =A0		pr_debug("%s: Writing garbage to %x\n",
> =A0			 engine->name, reg);
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i9=
15/intel_runtime_pm.c
> index 153ca9e65382..f498f1c80755 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -201,8 +201,10 @@ __print_intel_runtime_pm_wakeref(struct drm_printer =
*p,
> =A0		unsigned long rep;
> =A0
> =

> =A0		rep =3D 1;
> -		while (i + 1 < dbg->count && dbg->owners[i + 1] =3D=3D stack)
> -			rep++, i++;
> +		while (i + 1 < dbg->count && dbg->owners[i + 1] =3D=3D stack) {
> +			rep++;
> +			i++;
> +		}
> =A0		__print_depot_stack(stack, buf, PAGE_SIZE, 2);
> =A0		drm_printf(p, "Wakeref x%lu taken at:\n%s", rep, buf);
> =A0	}


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
