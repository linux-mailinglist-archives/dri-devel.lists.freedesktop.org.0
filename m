Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB1C3EB98B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 17:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC816E878;
	Fri, 13 Aug 2021 15:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5607D6E877;
 Fri, 13 Aug 2021 15:51:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="237623499"
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="237623499"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 08:51:30 -0700
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="440395249"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 08:51:13 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mEZSb-009HtM-QE; Fri, 13 Aug 2021 18:51:05 +0300
Date: Fri, 13 Aug 2021 18:51:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: gregkh@linuxfoundation.org, seanpaul@chromium.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Baron <jbaron@akamai.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Huang Rui <ray.huang@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 John Clements <john.clements@amd.com>,
 Ashley Thomas <Ashley.Thomas2@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Wyatt Wood <Wyatt.Wood@amd.com>, Johan Hovold <johan@kernel.org>,
 Jessica Yu <jeyu@kernel.org>, Joe Perches <joe@perches.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Nick Desaulniers <ndesaulniers@gooogle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vitor Massaru Iha <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Changbin Du <changbin.du@intel.com>, Marco Elver <elver@google.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Alexander Potapenko <glider@google.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Albert van der Linde <alinde@google.com>,
 Johannes Berg <johannes.berg@intel.com>,
 Arvind Sankar <nivedita@alum.mit.edu>,
 Patricia Alfonso <trishalfonso@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v5 3/9] dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES and
 callbacks
Message-ID: <YRaU6fbGjcV7BGC/@smile.fi.intel.com>
References: <20210813151734.1236324-1-jim.cromie@gmail.com>
 <20210813151734.1236324-4-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813151734.1236324-4-jim.cromie@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Aug 13, 2021 at 09:17:11AM -0600, Jim Cromie wrote:
> DEFINE_DYNAMIC_DEBUG_CATEGORIES(name, var, bitmap_desc, @bit_descs)
> allows users to define a drm.debug style (bitmap) sysfs interface, and
> to specify the desired mapping from bits[0-N] to the format-prefix'd
> pr_debug()s to be controlled.
> 
> DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
> 	"i915/gvt bitmap desc",
> 	/**
> 	 * search-prefixes, passed to dd-exec_queries
> 	 * defines bits 0-N in order.
> 	 * leading ^ is tacitly inserted (by callback currently)
> 	 * trailing space used here excludes subcats.
> 	 * helper macro needs more work
> 	 * macro to autogen ++$i, 0x%x$i ?
> 	 */
> 	_DD_cat_("gvt:cmd: "),
> 	_DD_cat_("gvt:core: "),
> 	_DD_cat_("gvt:dpy: "),
> 	_DD_cat_("gvt:el: "),
> 	_DD_cat_("gvt:irq: "),
> 	_DD_cat_("gvt:mm: "),
> 	_DD_cat_("gvt:mmio: "),
> 	_DD_cat_("gvt:render: "),
> 	_DD_cat_("gvt:sched: "));
> 
> dynamic_debug.c: add 3 new elements:
> 
>  - int param_set_dyndbg()
>  - int param_get_dyndbg()
>  - struct kernel_param_ops param_ops_dyndbg
> 
> Following the model of kernel/params.c STANDARD_PARAM_DEFS, All 3 are
> non-static and exported.
> 
> dynamic_debug.h:
> 
> Add DEFINE_DYNAMIC_DEBUG_CATEGORIES() described above, and a do-nothing stub.
> 
> Note that it also calls MODULE_PARM_DESC for the user, but expects the
> user to catenate all the bit-descriptions together (as is done in
> drm.debug), and in the following uses in amdgpu, i915.
> 
> This in the hope that someone can offer an auto-incrementing
> label-generating macro, producing "\tbit-4 0x10\t" etc, and can show
> how to apply it to __VA_ARGS__.
> 
> Also extern the struct kernel_param param_ops_dyndbg symbol, as is
> done in moduleparams.h for all the STANDARD params.
> 
> USAGE NOTES:
> 
> Using dyndbg to query on "format ^$prefix" requires that the prefix be
> present in the compiled-in format string; where run-time prefixing is
> used, that format would be "%s...", which is not usefully selectable.
> 
> Adding structural query terms (func,file,lineno) could help (module is
> already done), but DEFINE_DYNAMIC_DEBUG_CATEGORIES can't do that now,
> adding it needs a better reason imo.
> 
> Dyndbg is completely agnostic wrt the categorization scheme used, to
> play well with any prefix convention already in use.  Ad-hoc
> categories and sub-categories are implicitly allowed, author
> discipline and review is expected.
> 
> Here are some examples:
> 
> "1","2","3"		2 doesnt imply 1.
>    			otherwize, sorta like printk levels
> "1:","2:","3:"		are better, avoiding [1-9]\d+ ambiguity
> "hi:","mid:","low:"	are reasonable, and imply independence
> "todo:","rfc:"		might be handy
> "A:".."Z:"		uhm, yeah
> 
> Hierarchical classes/categories are natural:
> 
> "drm:<CAT>:"		is used in later commit
> "drm:<CAT>:<SUB>:"	is a natural extension.
> "drm:atomic:fail:"	has been proposed, sounds directly useful
> 
> Some properties of a hierarchical category deserve explication:
> 
> Trailing spaces matter !
> 
> With 1..3-space ("drm: ", "drm:atomic: ", "drm:atomic:fail: "), the
> ":" doesnt terminate the search-space, the trailing space does.
> So a "drm:" search specification will match all DRM categories &
> subcategories, and will not be useful in an interface where all
> categories are controlled together.  That said, "drm:atomic:" &
> "drm:atomic: " are different, and both are useful in cases.
> 
> Ad-Hoc sub-categories:
> 
> These have a caveat wrt wrapper macros adding prefixes like
> "drm:atomic: "; the trailing space in the prefix means that
> drm_dbg("fail: ...") renders as "drm:atomic: fail: ", which obviously
> isn't ideal wrt clear and simple bitmaps.
> 
> A possible solution is to have a FOO_() version of every FOO() macro
> which (anti-mnemonically) elides the trailing space, which is normally
> inserted by a modified FOO().  Doing this would enforce a policy
> decision that "debug categories will be space terminated", with an
> pressure-relief valve.
> 
> Summarizing:
> 
>  - "drm:kms: " & "drm:kms:" are different
>  - "drm:kms"		also different - includes drm:kms2:
>  - "drm:kms:\t"		also different
>  - "drm:kms:*"		doesnt work, no wildcard on format atm.
> 
> Order matters in DEFINE_DYNAMIC_DEBUG_CATEGORIES(... @bit_descs)
> 
> @bit_descs (array) position determines the bit mapping to the prefix,
> so to keep a stable map, new categories or 3rd level categories must
> be added to the end.
> 
> Since bits are/will-stay applied 0-N, the later bits can countermand
> the earlier ones, but its tricky - consider;
> 
>     DD_CATs(... "drm:atomic:", ""drm:atomic:fail:" ) // misleading
> 
> The 1st search-term is misleading, because it includes (modifies)
> subcategories, but then 2nd overrides it.  So don't do that.
> 
> There is still plenty of bikeshedding to do.

> ---
> v4+:
> 
> . rename to DEFINE_DYNAMIC_DEBUG_CATEGORIES from DEFINE_DYNDBG_BITMAP
> . in query, replace hardcoded "i915" w kp->mod->name
> . static inline the stubs
> . const *str in structs, const array. -Emil
> . dyndbg: add do-nothing DEFINE_DYNAMIC_DEBUG_CATEGORIES if !DD_CORE
> . call MOD_PARM_DESC(name, "$desc") for users
> . simplify callback, remove bit-change detection
> . config errs reported by <lkp@intel.com>
> 
> ddh-helpers

> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

So, it is signed or not? I didn't get (perhaps due to misplaced changlog?).

...

>  } __attribute__((aligned(8)));
>  
>  

Do we need two blank lines here?

> +struct kernel_param;

...

> +int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
> +{
> +	unsigned long inbits;
> +	int rc, i, chgct = 0, totct = 0;
> +	char query[OUR_QUERY_SIZE];
> +	struct dyndbg_bitdesc *bitmap = (struct dyndbg_bitdesc *) kp->data;

So you need space after ')' ?

> +	rc = kstrtoul(instr, 0, &inbits);
> +	if (rc) {
> +		pr_err("set_dyndbg: failed\n");

> +		return -EINVAL;

Why not to return rc?

> +	}
> +	vpr_info("set_dyndbg: input 0x%lx\n", inbits);
> +
> +	for (i = 0; !!bitmap[i].prefix; i++) {

Hmm... Why not simply

	for (bitmap = ...; bitmap->prefix; bitmap++) {

?

> +

Redundant blank line.

> +		sprintf(query, "format '^%s' %cp", bitmap[i].prefix,
> +			test_bit(i, &inbits) ? '+' : '-');

snprintf() ?

> +
> +		chgct = dynamic_debug_exec_queries(query, kp->mod->name);
> +
> +		v2pr_info("bit-%d: %d changes by '%s'\n", i, chgct, query);
> +		totct += chgct;
> +	}
> +	vpr_info("total changes: %d\n", totct);
> +	return 0;
> +}

...

> +	return scnprintf(buffer, PAGE_SIZE, "%u\n",
> +			 *((unsigned int *)kp->arg));

One line.

-- 
With Best Regards,
Andy Shevchenko


