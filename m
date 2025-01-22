Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4893A1914A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 13:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B95410E6D2;
	Wed, 22 Jan 2025 12:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZRnNn+6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43EB10E300;
 Wed, 22 Jan 2025 12:25:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8086E5C54FD;
 Wed, 22 Jan 2025 12:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DED6C4CED6;
 Wed, 22 Jan 2025 12:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737548751;
 bh=Xfp892u0X0rMtHWkGD3r2bVHj+FTM/t28M4VtoJ0Wyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZRnNn+6Tt76019xBirdMVmzRbeL8Q2odMq6HFhgkth9P5ZrYdpErYPlXsxL6Fl3rj
 ZI5VtP10jvH/fQAv6HRDykVpsfGmvb0d/xEWjnDE5tgAnq++jvuWWHT6WYDemhqEh2
 qhtEzGq7/MMx5/wpO74r4FRgEujUuclOLSKI/Yy3NZM6X5dfnqSKY4Ag8uJB7GG8XW
 AQ7J/NzQdgEpLRKLYUKh7jqPAvOBjZZ+gq5nRJ0qTwqiguA+mChUjtx0pX3QTt2bwy
 E0gMyTw1G3DnV5TJGaTuN+E86ySP5PQe5fDrGHlTa+/9p9roru7zJ1Awo7fm8PfyZm
 vQJdRIi7afA0Q==
Date: Wed, 22 Jan 2025 13:25:46 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-crypto@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-rdma@vger.kernel.org, 
 linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-serial@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org, 
 netfs@lists.linux.dev, codalist@coda.cs.cmu.edu, linux-mm@kvack.org, 
 linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 fsverity@lists.linux.dev, 
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
 kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, 
 keyrings@vger.kernel.org, Song Liu <song@kernel.org>, 
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 "Darrick J. Wong" <djwong@kernel.org>, Jani Nikula <jani.nikula@intel.com>, 
 Corey Minyard <cminyard@mvista.com>
Subject: Re: Re: [PATCH v2] treewide: const qualify ctl_tables where applicable
Message-ID: <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
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

On Tue, Jan 21, 2025 at 02:40:16PM +0100, Alexander Gordeev wrote:
> On Fri, Jan 10, 2025 at 03:16:08PM +0100, Joel Granados wrote:
> 
> Hi Joel,
> 
> > Add the const qualifier to all the ctl_tables in the tree except for
> > watchdog_hardlockup_sysctl, memory_allocation_profiling_sysctls,
> > loadpin_sysctl_table and the ones calling register_net_sysctl (./net,
> > drivers/inifiniband dirs). These are special cases as they use a
> > registration function with a non-const qualified ctl_table argument or
> > modify the arrays before passing them on to the registration function.
> > 
> > Constifying ctl_table structs will prevent the modification of
> > proc_handler function pointers as the arrays would reside in .rodata.
> > This is made possible after commit 78eb4ea25cd5 ("sysctl: treewide:
> > constify the ctl_table argument of proc_handlers") constified all the
> > proc_handlers.
> 
> I could identify at least these occurences in s390 code as well:
Hey Alexander

Thx for bringing these to my attention. I had completely missed them as
the spatch only deals with ctl_tables outside functions.

Short answer:
These should not be included in the current patch because they are a
different pattern from how sysctl tables are usually used. So I will not
include them.

With that said, I think it might be interesting to look closer at them
as they seem to be complicating the proc_handler (I have to look at them
closer).

I see that they are defining a ctl_table struct within the functions and
just using the data (from the incoming ctl_table) to forward things down
to proc_do{u,}intvec_* functions. This is very odd and I have only seen
it done in order to change the incoming ctl_table (which is not what is
being done here).

I will take a closer look after the merge window and circle back with
more info. Might take me a while as I'm not very familiar with s390
code; any additional information on why those are being used inside the
functions would be helpfull.

Best


> 
> diff --git a/arch/s390/appldata/appldata_base.c b/arch/s390/appldata/appldata_base.c
> index dd7ba7587dd5..9b83c318f919 100644
> --- a/arch/s390/appldata/appldata_base.c
> +++ b/arch/s390/appldata/appldata_base.c
> @@ -204,7 +204,7 @@ appldata_timer_handler(const struct ctl_table *ctl, int write,
>  {
>  	int timer_active = appldata_timer_active;
>  	int rc;
> -	struct ctl_table ctl_entry = {
> +	const struct ctl_table ctl_entry = {
>  		.procname	= ctl->procname,
>  		.data		= &timer_active,
>  		.maxlen		= sizeof(int),
> @@ -237,7 +237,7 @@ appldata_interval_handler(const struct ctl_table *ctl, int write,
>  {
>  	int interval = appldata_interval;
>  	int rc;
> -	struct ctl_table ctl_entry = {
> +	const struct ctl_table ctl_entry = {
>  		.procname	= ctl->procname,
>  		.data		= &interval,
>  		.maxlen		= sizeof(int),
> @@ -269,7 +269,7 @@ appldata_generic_handler(const struct ctl_table *ctl, int write,
>  	struct list_head *lh;
>  	int rc, found;
>  	int active;
> -	struct ctl_table ctl_entry = {
> +	const struct ctl_table ctl_entry = {
>  		.data		= &active,
>  		.maxlen		= sizeof(int),
>  		.extra1		= SYSCTL_ZERO,
> diff --git a/arch/s390/kernel/hiperdispatch.c b/arch/s390/kernel/hiperdispatch.c
> index 7857a7e8e56c..7d0ba16085c1 100644
> --- a/arch/s390/kernel/hiperdispatch.c
> +++ b/arch/s390/kernel/hiperdispatch.c
> @@ -273,7 +273,7 @@ static int hiperdispatch_ctl_handler(const struct ctl_table *ctl, int write,
>  {
>  	int hiperdispatch;
>  	int rc;
> -	struct ctl_table ctl_entry = {
> +	const struct ctl_table ctl_entry = {
>  		.procname	= ctl->procname,
>  		.data		= &hiperdispatch,
>  		.maxlen		= sizeof(int),
> diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
> index 6691808bf50a..26e50de83d80 100644
> --- a/arch/s390/kernel/topology.c
> +++ b/arch/s390/kernel/topology.c
> @@ -629,7 +629,7 @@ static int topology_ctl_handler(const struct ctl_table *ctl, int write,
>  	int enabled = topology_is_enabled();
>  	int new_mode;
>  	int rc;
> -	struct ctl_table ctl_entry = {
> +	const struct ctl_table ctl_entry = {
>  		.procname	= ctl->procname,
>  		.data		= &enabled,
>  		.maxlen		= sizeof(int),
> @@ -658,7 +658,7 @@ static int polarization_ctl_handler(const struct ctl_table *ctl, int write,
>  {
>  	int polarization;
>  	int rc;
> -	struct ctl_table ctl_entry = {
> +	const struct ctl_table ctl_entry = {
>  		.procname	= ctl->procname,
>  		.data		= &polarization,
>  		.maxlen		= sizeof(int),
> diff --git a/arch/s390/mm/cmm.c b/arch/s390/mm/cmm.c
> index 939e3bec2db7..8e354c90a3dd 100644
> --- a/arch/s390/mm/cmm.c
> +++ b/arch/s390/mm/cmm.c
> @@ -263,7 +263,7 @@ static int cmm_pages_handler(const struct ctl_table *ctl, int write,
>  			     void *buffer, size_t *lenp, loff_t *ppos)
>  {
>  	long nr = cmm_get_pages();
> -	struct ctl_table ctl_entry = {
> +	const struct ctl_table ctl_entry = {
>  		.procname	= ctl->procname,
>  		.data		= &nr,
>  		.maxlen		= sizeof(long),
> @@ -283,7 +283,7 @@ static int cmm_timed_pages_handler(const struct ctl_table *ctl, int write,
>  				   loff_t *ppos)
>  {
>  	long nr = cmm_get_timed_pages();
> -	struct ctl_table ctl_entry = {
> +	const struct ctl_table ctl_entry = {
>  		.procname	= ctl->procname,
>  		.data		= &nr,
>  		.maxlen		= sizeof(long),
> 
> 
> > Best regards,
> > -- 
> > Joel Granados <joel.granados@kernel.org>
> 
> Thanks!

-- 

Joel Granados
