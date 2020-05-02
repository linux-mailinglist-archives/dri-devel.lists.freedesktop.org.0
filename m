Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BA31C240B
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9496ED90;
	Sat,  2 May 2020 08:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1795 seconds by postgrey-1.36 at gabe;
 Sat, 02 May 2020 08:14:46 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F166E09A
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 08:14:46 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0427cVh5078521; Sat, 2 May 2020 03:43:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30r84n7rx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 03:43:56 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0427hkFd089425;
 Sat, 2 May 2020 03:43:55 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30r84n7rwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 03:43:55 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0427eCnX017574;
 Sat, 2 May 2020 07:43:53 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 30s0g585ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 07:43:53 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0427hpCW8061248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 2 May 2020 07:43:51 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30C4DA4040;
 Sat,  2 May 2020 07:43:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33F6FA404D;
 Sat,  2 May 2020 07:43:48 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.204.17])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sat,  2 May 2020 07:43:48 +0000 (GMT)
Date: Sat, 2 May 2020 10:43:46 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 11/14] docs: move other kAPI documents to core-api
Message-ID: <20200502074346.GD342687@linux.ibm.com>
References: <cover.1588345503.git.mchehab+huawei@kernel.org>
 <70cca102282ccd36b107487c60346f414011c684.1588345503.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70cca102282ccd36b107487c60346f414011c684.1588345503.git.mchehab+huawei@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-02_03:2020-05-01,
 2020-05-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1011 suspectscore=1
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005020061
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Peter Xu <peterx@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, David Airlie <airlied@linux.ie>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Patrick Bellasi <patrick.bellasi@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Mauro,

On Fri, May 01, 2020 at 05:37:55PM +0200, Mauro Carvalho Chehab wrote:
> There are a number of random documents that seem to be
> describing some aspects of the core-api. Move them to such
> directory, adding them at the core-api/index.rst file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/admin-guide/sysctl/vm.rst                     | 2 +-
>  Documentation/core-api/index.rst                            | 6 ++++++
>  Documentation/{mailbox.txt => core-api/mailbox.rst}         | 0
>  Documentation/{nommu-mmap.txt => core-api/nommu-mmap.rst}   | 0

The nommu-mmap mostly provides description of user visible behaviuour. I
think it's bettter to have it in admin-guide/mm/.

>  .../{this_cpu_ops.txt => core-api/this_cpu_ops.rst}         | 0
>  .../unaligned-memory-access.rst}                            | 0
>  Documentation/gpu/drm-mm.rst                                | 2 +-
>  arch/Kconfig                                                | 2 +-
>  init/Kconfig                                                | 2 +-
>  mm/Kconfig                                                  | 2 +-
>  mm/nommu.c                                                  | 2 +-
>  11 files changed, 12 insertions(+), 6 deletions(-)
>  rename Documentation/{mailbox.txt => core-api/mailbox.rst} (100%)
>  rename Documentation/{nommu-mmap.txt => core-api/nommu-mmap.rst} (100%)
>  rename Documentation/{this_cpu_ops.txt => core-api/this_cpu_ops.rst} (100%)
>  rename Documentation/{unaligned-memory-access.txt => core-api/unaligned-memory-access.rst} (100%)
> 
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 0329a4d3fa9e..0bf2f2a84a9f 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -583,7 +583,7 @@ trimming of allocations is initiated.
>  
>  The default value is 1.
>  
> -See Documentation/nommu-mmap.txt for more information.
> +See Documentation/core-api/nommu-mmap.rst for more information.
>  
>  
>  numa_zonelist_order
> diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
> index eeac63ba17c3..fe03a639a91a 100644
> --- a/Documentation/core-api/index.rst
> +++ b/Documentation/core-api/index.rst
> @@ -38,10 +38,14 @@ Library functionality that is used throughout the kernel.
>     circular-buffers
>     rbtree
>     generic-radix-tree
> +   mailbox
>     packing
> +   rbtree
> +   this_cpu_ops
>     timekeeping
>     errseq
>  
> +
>  Concurrency primitives
>  ======================
>  
> @@ -82,11 +86,13 @@ more memory-management documentation in :doc:`/vm/index`.
>     :maxdepth: 1
>  
>     memory-allocation
> +   unaligned-memory-access
>     dma-api
>     dma-api-howto
>     dma-attributes
>     dma-isa-lpc
>     bus-virt-phys-mapping
> +   nommu-mmap
>     mm-api
>     genalloc
>     pin_user_pages
> diff --git a/Documentation/mailbox.txt b/Documentation/core-api/mailbox.rst
> similarity index 100%
> rename from Documentation/mailbox.txt
> rename to Documentation/core-api/mailbox.rst
> diff --git a/Documentation/nommu-mmap.txt b/Documentation/core-api/nommu-mmap.rst
> similarity index 100%
> rename from Documentation/nommu-mmap.txt
> rename to Documentation/core-api/nommu-mmap.rst
> diff --git a/Documentation/this_cpu_ops.txt b/Documentation/core-api/this_cpu_ops.rst
> similarity index 100%
> rename from Documentation/this_cpu_ops.txt
> rename to Documentation/core-api/this_cpu_ops.rst
> diff --git a/Documentation/unaligned-memory-access.txt b/Documentation/core-api/unaligned-memory-access.rst
> similarity index 100%
> rename from Documentation/unaligned-memory-access.txt
> rename to Documentation/core-api/unaligned-memory-access.rst
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 1839762044be..e0bbcbb6f512 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -314,7 +314,7 @@ To use drm_gem_cma_get_unmapped_area(), drivers must fill the struct
>  a pointer on drm_gem_cma_get_unmapped_area().
>  
>  More detailed information about get_unmapped_area can be found in
> -Documentation/nommu-mmap.txt
> +Documentation/core-api/nommu-mmap.rst
>  
>  Memory Coherency
>  ----------------
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 786a85d4ad40..b0b4046c9d13 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -147,7 +147,7 @@ config HAVE_EFFICIENT_UNALIGNED_ACCESS
>  	  problems with received packets if doing so would not help
>  	  much.
>  
> -	  See Documentation/unaligned-memory-access.txt for more
> +	  See Documentation/core-api/unaligned-memory-access.rst for more
>  	  information on the topic of unaligned memory accesses.
>  
>  config ARCH_USE_BUILTIN_BSWAP
> diff --git a/init/Kconfig b/init/Kconfig
> index 492bb7000aa4..61ccfd9243e3 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1950,7 +1950,7 @@ config MMAP_ALLOW_UNINITIALIZED
>  	  userspace.  Since that isn't generally a problem on no-MMU systems,
>  	  it is normally safe to say Y here.
>  
> -	  See Documentation/nommu-mmap.txt for more information.
> +	  See Documentation/core-api/nommu-mmap.rst for more information.
>  
>  config SYSTEM_DATA_VERIFICATION
>  	def_bool n
> diff --git a/mm/Kconfig b/mm/Kconfig
> index db626b8d4fdb..2a133c40a4b7 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -382,7 +382,7 @@ config NOMMU_INITIAL_TRIM_EXCESS
>  	  This option specifies the initial value of this option.  The default
>  	  of 1 says that all excess pages should be trimmed.
>  
> -	  See Documentation/nommu-mmap.txt for more information.
> +	  See Documentation/core-api/nommu-mmap.rst for more information.
>  
>  config TRANSPARENT_HUGEPAGE
>  	bool "Transparent Hugepage Support"
> diff --git a/mm/nommu.c b/mm/nommu.c
> index 371697bf372d..e3e707d6f124 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -5,7 +5,7 @@
>   *  Replacement code for mm functions to support CPU's that don't
>   *  have any form of memory management unit (thus no virtual memory).
>   *
> - *  See Documentation/nommu-mmap.txt
> + *  See Documentation/core-api/nommu-mmap.rst
>   *
>   *  Copyright (c) 2004-2008 David Howells <dhowells@redhat.com>
>   *  Copyright (c) 2000-2003 David McCullough <davidm@snapgear.com>
> -- 
> 2.25.4
> 

-- 
Sincerely yours,
Mike.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
