Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D168BB7B36
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 19:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038AF10E0C1;
	Fri,  3 Oct 2025 17:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 787BD10E125
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 14:37:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09D741A9A;
 Fri,  3 Oct 2025 07:37:04 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8693C3F5A1;
 Fri,  3 Oct 2025 07:36:47 -0700 (PDT)
Date: Fri, 3 Oct 2025 15:36:42 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Byungchul Park <byungchul@sk.com>
Cc: linux-kernel@vger.kernel.org, kernel_team@skhynix.com,
 torvalds@linux-foundation.org, damien.lemoal@opensource.wdc.com,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 linux-ext4@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 will@kernel.org, tglx@linutronix.de, rostedt@goodmis.org,
 joel@joelfernandes.org, sashal@kernel.org, daniel.vetter@ffwll.ch,
 duyuyang@gmail.com, johannes.berg@intel.com, tj@kernel.org,
 tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz,
 ngupta@vflare.org, linux-block@vger.kernel.org,
 josef@toxicpanda.com, linux-fsdevel@vger.kernel.org, jack@suse.cz,
 jlayton@kernel.org, dan.j.williams@intel.com, hch@infradead.org,
 djwong@kernel.org, dri-devel@lists.freedesktop.org,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com,
 longman@redhat.com, yunseong.kim@ericsson.com, ysk@kzalloc.com,
 yeoreum.yun@arm.com, netdev@vger.kernel.org,
 matthew.brost@intel.com, her0gyugyu@gmail.com, corbet@lwn.net,
 catalin.marinas@arm.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 sumit.semwal@linaro.org, gustavo@padovan.org,
 christian.koenig@amd.com, andi.shyti@kernel.org, arnd@arndb.de,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 rppt@kernel.org, surenb@google.com, mcgrof@kernel.org,
 petr.pavlu@suse.com, da.gomez@kernel.org, samitolvanen@google.com,
 paulmck@kernel.org, frederic@kernel.org, neeraj.upadhyay@kernel.org,
 joelagnelf@nvidia.com, josh@joshtriplett.org, urezki@gmail.com,
 mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
 qiang.zhang@linux.dev, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 chuck.lever@oracle.com, neil@brown.name, okorniev@redhat.com,
 Dai.Ngo@oracle.com, tom@talpey.com, trondmy@kernel.org,
 anna@kernel.org, kees@kernel.org, bigeasy@linutronix.de,
 clrkwllms@kernel.org, ada.coupriediaz@arm.com,
 kristina.martsenko@arm.com, wangkefeng.wang@huawei.com,
 broonie@kernel.org, kevin.brodsky@arm.com, dwmw@amazon.co.uk,
 shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com,
 yuzhao@google.com, baolin.wang@linux.alibaba.com,
 usamaarif642@gmail.com, joel.granados@kernel.org,
 richard.weiyang@gmail.com, geert+renesas@glider.be,
 tim.c.chen@linux.intel.com, linux@treblig.org,
 alexander.shishkin@linux.intel.com, lillian@star-ark.net,
 chenhuacai@kernel.org, francesco@valla.it,
 guoweikang.kernel@gmail.com, link@vivo.com, jpoimboe@kernel.org,
 masahiroy@kernel.org, brauner@kernel.org,
 thomas.weissschuh@linutronix.de, oleg@redhat.com, mjguzik@gmail.com,
 andrii@kernel.org, wangfushuai@baidu.com, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 rcu@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v17 09/47] arm64, dept: add support
 CONFIG_ARCH_HAS_DEPT_SUPPORT to arm64
Message-ID: <aN_fel4Rpqz6TPsD@J2N7QTR9R3>
References: <20251002081247.51255-1-byungchul@sk.com>
 <20251002081247.51255-10-byungchul@sk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002081247.51255-10-byungchul@sk.com>
X-Mailman-Approved-At: Fri, 03 Oct 2025 17:21:01 +0000
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

On Thu, Oct 02, 2025 at 05:12:09PM +0900, Byungchul Park wrote:
> dept needs to notice every entrance from user to kernel mode to treat
> every kernel context independently when tracking wait-event dependencies.
> Roughly, system call and user oriented fault are the cases.
> 
> Make dept aware of the entrances of arm64 and add support
> CONFIG_ARCH_HAS_DEPT_SUPPORT to arm64.
> 
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  arch/arm64/Kconfig          | 1 +
>  arch/arm64/kernel/syscall.c | 7 +++++++
>  arch/arm64/mm/fault.c       | 7 +++++++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e9bbfacc35a6..a8fab2c052dc 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -281,6 +281,7 @@ config ARM64
>  	select USER_STACKTRACE_SUPPORT
>  	select VDSO_GETRANDOM
>  	select VMAP_STACK
> +	select ARCH_HAS_DEPT_SUPPORT
>  	help
>  	  ARM 64-bit (AArch64) Linux support.
>  
> diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
> index c442fcec6b9e..bbd306335179 100644
> --- a/arch/arm64/kernel/syscall.c
> +++ b/arch/arm64/kernel/syscall.c
> @@ -7,6 +7,7 @@
>  #include <linux/ptrace.h>
>  #include <linux/randomize_kstack.h>
>  #include <linux/syscalls.h>
> +#include <linux/dept.h>
>  
>  #include <asm/debug-monitors.h>
>  #include <asm/exception.h>
> @@ -96,6 +97,12 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
>  	 * (Similarly for HVC and SMC elsewhere.)
>  	 */
>  
> +	/*
> +	 * This is a system call from user mode.  Make dept work with a
> +	 * new kernel mode context.
> +	 */
> +	dept_update_cxt();

As Mark Brown pointed out in his replies, this patch is missing a whole
bunch of cases and does not work correctly as-is.

As Dave Hansen pointed out on the x86 patch, you shouldn't do this
piecemeal in architecture code, and should instead work with the
existing context tracking, e.g. by adding logic to
enter_from_user_mode() and exit_to_user_mode(), or by reusing some
existing context tracking logic that's called there.

Mark.
