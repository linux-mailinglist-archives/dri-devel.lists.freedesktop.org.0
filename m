Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAA141B17C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 16:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D21889CD8;
	Tue, 28 Sep 2021 14:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B48289CD8;
 Tue, 28 Sep 2021 14:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
 bh=ZGKJbIQb/oSd6eIGdR1+b3C/vnQiuZe8y66fqeUzRIk=; b=boDq/QONrhvi9N7rdCEcrwGnzY
 9TR0lEcuIxCa2orVcE0Ws8pMcRfTKfls4O//YcbTw6Y8AeQ6jT6s3QbuiFPGSpb+sFx8XTiv4SJ6q
 MTk02RHah/tch+Rwvh54Vq/FbMthYRDJ1O0ByaPtHbUEbI5bLoLOjZE6d7a8IAwnVGI3UEZLTCz6h
 r2oQFrejRK27v6Bj6zRTBb899PpM1N/TqiUxgE1k9n9xuTvxe873f3dsRIEjSmKKvSXj4nGPnnR58
 elC5AA5U0rSxVQwdSkEBORaAw8eTyt269ICWQIly6btQubSArpvRXvS+5DM3iWcxKOwuiwJqYR2ni
 pP8ksZTg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mVDfE-007TNG-7U; Tue, 28 Sep 2021 14:00:56 +0000
Date: Tue, 28 Sep 2021 07:00:56 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Jessica Yu <jeyu@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <YVMgGKk1K4gO8ls6@bombadil.infradead.org>
References: <20210803143058.GA1721383@nvidia.com>
 <20210804052606.GG13928@zhen-hp.sh.intel.com>
 <20210816173458.GA9183@lst.de>
 <20210817010851.GW13928@zhen-hp.sh.intel.com>
 <20210817052203.GX13928@zhen-hp.sh.intel.com>
 <20210819082929.GB13928@zhen-hp.sh.intel.com>
 <20210820141724.GA29034@lst.de>
 <YSAI8pKAvvW/8S2O@bombadil.infradead.org>
 <20210826061219.GD9942@zhen-hp.sh.intel.com>
 <55c11f22-99e5-6109-3be3-a04b06b3336e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55c11f22-99e5-6109-3be3-a04b06b3336e@intel.com>
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

On Tue, Sep 28, 2021 at 07:41:00AM +0000, Wang, Zhi A wrote:
> Hey guys:
> 
> After some investigation, I found the root cause this problem ("i915" 
> module loading will be stuck with Christoph's refactor patches), which 
> can be reproduced by building both i915 and kvmgt as kernel module and 
> the loading i915.

Thanks for looking into this!

> The root cause is: in Linux kernel loading, before a kernel module 
> loading is finished, its symbols can not be reached by other module when 
> resolving the symbols (even they can be found in /proc/kallsyms). 
> Because the status of the kernel module is MODULE_STATE_COMING and 
> resolve_symbol() from another kernel module will check this and return a 
> -EBUSY.

Well, it would seem that way but...

> In this case, before i915 loading is finished, the requested module 
> "kvmgt" cannot reach the symbols in module i915. Thus it kept waiting 
> and left message like below in the dmesg:
> 
> [  644.152021] kvmgt: gave up waiting for init of module i915.
> [  644.152039] kvmgt: Unknown symbol i915_gem_object_set_to_cpu_domain 
> (err -16)
> [  674.871409] kvmgt: gave up waiting for init of module i915.
> [  674.871427] kvmgt: Unknown symbol intel_ring_begin (err -16)
> [  705.590586] kvmgt: gave up waiting for init of module i915.
> [  705.590604] kvmgt: Unknown symbol i915_vma_move_to_active (err -16)
> [  736.310230] kvmgt: gave up waiting for init of module i915.
> [  736.310248] kvmgt: Unknown symbol shmem_unpin_map (err -16)
> ...
> 
> The error message is from execution path below:
> 
> kernel/module.c:
> 
> [i915 module loading] -> 
> request_module("kvmgt")->[modprobe]->init_module("kvmgt")->load_module()->simplify_symbols()->resolve_symbol_wait():
> 
> static const struct kernel_symbol *
> resolve_symbol_wait(struct module *mod,
>              const struct load_info *info,
>              const char *name)
> {
>      const struct kernel_symbol *ksym;
>      char owner[MODULE_NAME_LEN];
> 
>      if (wait_event_interruptible_timeout(module_wq,
>              !IS_ERR(ksym = resolve_symbol(mod, info, name, owner))
>              || PTR_ERR(ksym) != -EBUSY,
>                           30 * HZ) <= 0) {
>          pr_warn("%s: gave up waiting for init of module %s.\n",
>              mod->name, owner);
> 
> }

Commit 9bea7f23952d5 ("module: fix bne2 "gave up waiting for init of
module libcrc32c") is worth reviewing. It dealt with a similar issue,
and in particular it addressed the issue with -EBUSY being returned
by ref_module().

And so, in theory that case should be dealt with in resolve_symbol_wait()
already. And so can you try this just to verify something:

diff --git a/kernel/module.c b/kernel/module.c
index 40ec9a030eec..98f87cbb37de 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1459,7 +1459,7 @@ resolve_symbol_wait(struct module *mod,
 	if (wait_event_interruptible_timeout(module_wq,
 			!IS_ERR(ksym = resolve_symbol(mod, info, name, owner))
 			|| PTR_ERR(ksym) != -EBUSY,
-					     30 * HZ) <= 0) {
+					     160 * HZ) <= 0) {
 		pr_warn("%s: gave up waiting for init of module %s.\n",
 			mod->name, owner);
 	}

> code: 
> https://github.com/intel/gvt-linux/blob/bd950a66c7919d7121d2530f30984351534a96dc/kernel/module.c#L1452
> 
> In resolve_symbol_wait(), it calls resolve_symbol() to resolve the 
> symbols in "i915". In resolve_symbol() -> ref_module() -> 
> strong_try_module_get(), it will check the status of the module which 
> owns the symbol.
> 
> static inline int strong_try_module_get(struct module *mod)
> {
>      BUG_ON(mod && mod->state == MODULE_STATE_UNFORMED);
>      if (mod && mod->state == MODULE_STATE_COMING)
>          return -EBUSY;
>      if (try_module_get(mod))
>          return 0;
>      else
>          return -ENOENT;
> }
> 
> code:https://github.com/intel/gvt-linux/blob/bd950a66c7919d7121d2530f30984351534a96dc/kernel/module.c#L318
> 
> But unfortunately, this execution path begins in i915 module loading, at 
> this time, the status of kernel module "i915" is MODULE_STATE_COMING 
> until loading of "kvmgt" is finished. Thus a -EBUSY is always returned 
> when kernel is trying to resolve symbols for "kvmgt".
>
> 
> This patch below might need re-work:

If the above test patch still fails, well.. that might be telling of
another issue which is perhaps difficult to see at first glance. If
resolve_symbol_wait() won't succeed until request_module("kvmgt")
completes and if this means having kvmgt's init routine complete, that
could end up in some longer chain or in the worst case a sort of
circular dependency which is only implicated by module loading. It'd be
really odd... but I cannot rule it out.

This is one reason I hinted that you should strive to not do much on a
module's init. If you can punt work off for later that's best.

  Luis

> 
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Wed Jul 21 17:53:38 2021 +0200
> 
>      drm/i915/gvt: move the gvt code into kvmgt.ko
> 
>      Instead of having an option to build the gvt code into the main i915
>      module, just move it into the kvmgt.ko module.  This only requires
>      a new struct with three entries that the main i915 module needs to
>      request before enabling VGPU passthrough operations.
> 
>      This also conveniently streamlines the GVT initialization and avoids
>      the need for the global device pointer.
> 
>      Signed-off-by: Christoph Hellwig <hch@lst.de>
>      Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>      Link: 
> http://patchwork.freedesktop.org/patch/msgid/20210721155355.173183-5-hch@lst.de
>      Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> 
> On 8/26/21 6:12 AM, Zhenyu Wang wrote:
> > On 2021.08.20 12:56:34 -0700, Luis Chamberlain wrote:
> >> On Fri, Aug 20, 2021 at 04:17:24PM +0200, Christoph Hellwig wrote:
> >>> On Thu, Aug 19, 2021 at 04:29:29PM +0800, Zhenyu Wang wrote:
> >>>> I'm working on below patch to resolve this. But I met a weird issue in
> >>>> case when building i915 as module and also kvmgt module, it caused
> >>>> busy wait on request_module("kvmgt") when boot, it doesn't happen if
> >>>> building i915 into kernel. I'm not sure what could be the reason?
> >>> Luis, do you know if there is a problem with a request_module from
> >>> a driver ->probe routine that is probably called by a module_init
> >>> function itself?
> >> Generally no, but you can easily foot yourself in the feet by creating
> >> cross dependencies and not dealing with them properly. I'd make sure
> >> to keep module initialization as simple as possible, and run whatever
> >> takes more time asynchronously, then use a state machine to allow
> >> you to verify where you are in the initialization phase or query it
> >> or wait for a completion with a timeout.
> >>
> >> It seems the code in question is getting some spring cleaning, and its
> >> unclear where the code is I can inspect. If there's a tree somewhere I
> >> can take a peak I'd be happy to review possible oddities that may stick
> >> out.
> > I tried to put current patches under test here: https://github.com/intel/gvt-linux/tree/gvt-staging
> > The issue can be produced with CONFIG_DRM_I915=m and CONFIG_DRM_I915_GVT_KVMGT=m.
> >
> >> My goto model for these sorts of problems is to abstract the issue
> >> *outside* of the driver in question and implement new selftests to
> >> try to reproduce. This serves two purposes, 1) helps with testing
> >> 2) may allow you to see the problem more clearly.
> >>
> > I'll see if can abstract that.
> >
> > Thanks, Luis.
> 
> 
