Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A95E206D26
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 08:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0302E6EA05;
	Wed, 24 Jun 2020 06:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1187 seconds by postgrey-1.36 at gabe;
 Tue, 23 Jun 2020 16:16:31 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173066E0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 16:16:31 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05NFWhCA069355; Tue, 23 Jun 2020 11:56:38 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31uk64u3kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 11:56:38 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05NFfLqT025582;
 Tue, 23 Jun 2020 15:56:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 31uk33038w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 15:56:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05NFuX1J62783658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jun 2020 15:56:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AE474C050;
 Tue, 23 Jun 2020 15:56:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DCBE4C04E;
 Tue, 23 Jun 2020 15:56:30 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.25.83])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Jun 2020 15:56:29 +0000 (GMT)
Date: Tue, 23 Jun 2020 18:56:27 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 5/9] docs: move nommu-mmap.txt to admin-guide and
 rename to ReST
Message-ID: <20200623155224.GD1774541@linux.ibm.com>
References: <cover.1592905407.git.mchehab+huawei@kernel.org>
 <a8f4a5a8ba117bc15785901423f46f5725fd68b0.1592905407.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8f4a5a8ba117bc15785901423f46f5725fd68b0.1592905407.git.mchehab+huawei@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_07:2020-06-23,
 2020-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 clxscore=1011
 mlxlogscore=999 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006120000
 definitions=main-2006230118
X-Mailman-Approved-At: Wed, 24 Jun 2020 06:58:05 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 23, 2020 at 11:52:58AM +0200, Mauro Carvalho Chehab wrote:
> The nommu-mmap.txt file provides description of user visible
> behaviuour. So, move it to the admin-guide.
> 
> As it is already at the ReST, also rename it.
> 
> Suggested-by: Mike Rapoport <rppt@linux.ibm.com>
> Suggested-by: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  Documentation/admin-guide/mm/index.rst                          | 1 +
>  Documentation/{nommu-mmap.txt => admin-guide/mm/nommu-mmap.rst} | 0
>  Documentation/admin-guide/sysctl/vm.rst                         | 2 +-
>  Documentation/gpu/drm-mm.rst                                    | 2 +-
>  init/Kconfig                                                    | 2 +-
>  mm/Kconfig                                                      | 2 +-
>  mm/nommu.c                                                      | 2 +-
>  7 files changed, 6 insertions(+), 5 deletions(-)
>  rename Documentation/{nommu-mmap.txt => admin-guide/mm/nommu-mmap.rst} (100%)
> 
> diff --git a/Documentation/admin-guide/mm/index.rst b/Documentation/admin-guide/mm/index.rst
> index 11db46448354..774dad6d3d29 100644
> --- a/Documentation/admin-guide/mm/index.rst
> +++ b/Documentation/admin-guide/mm/index.rst
> @@ -31,6 +31,7 @@ the Linux memory management.
>     idle_page_tracking
>     ksm
>     memory-hotplug
> +   nommu-map
>     numa_memory_policy
>     numaperf
>     pagemap
> diff --git a/Documentation/nommu-mmap.txt b/Documentation/admin-guide/mm/nommu-mmap.rst
> similarity index 100%
> rename from Documentation/nommu-mmap.txt
> rename to Documentation/admin-guide/mm/nommu-mmap.rst
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 4b7c496199ca..4b9d2e8e9142 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -598,7 +598,7 @@ trimming of allocations is initiated.
>  
>  The default value is 1.
>  
> -See Documentation/nommu-mmap.txt for more information.
> +See Documentation/admin-guide/mm/nommu-mmap.rst for more information.
>  
>  
>  numa_zonelist_order
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 8d10e6b38918..9abee1589c1e 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -311,7 +311,7 @@ To use drm_gem_cma_get_unmapped_area(), drivers must fill the struct
>  a pointer on drm_gem_cma_get_unmapped_area().
>  
>  More detailed information about get_unmapped_area can be found in
> -Documentation/nommu-mmap.txt
> +Documentation/admin-guide/mm/nommu-mmap.rst
>  
>  Memory Coherency
>  ----------------
> diff --git a/init/Kconfig b/init/Kconfig
> index a46aa8f3174d..2dd5531dae98 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1957,7 +1957,7 @@ config MMAP_ALLOW_UNINITIALIZED
>  	  userspace.  Since that isn't generally a problem on no-MMU systems,
>  	  it is normally safe to say Y here.
>  
> -	  See Documentation/nommu-mmap.txt for more information.
> +	  See Documentation/mm/nommu-mmap.rst for more information.
>  
>  config SYSTEM_DATA_VERIFICATION
>  	def_bool n
> diff --git a/mm/Kconfig b/mm/Kconfig
> index f2104cc0d35c..d41f3fa7e923 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -387,7 +387,7 @@ config NOMMU_INITIAL_TRIM_EXCESS
>  	  This option specifies the initial value of this option.  The default
>  	  of 1 says that all excess pages should be trimmed.
>  
> -	  See Documentation/nommu-mmap.txt for more information.
> +	  See Documentation/mm/nommu-mmap.rst for more information.
>  
>  config TRANSPARENT_HUGEPAGE
>  	bool "Transparent Hugepage Support"
> diff --git a/mm/nommu.c b/mm/nommu.c
> index f32a69095d50..314174817b04 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -5,7 +5,7 @@
>   *  Replacement code for mm functions to support CPU's that don't
>   *  have any form of memory management unit (thus no virtual memory).
>   *
> - *  See Documentation/nommu-mmap.txt
> + *  See Documentation/mm/nommu-mmap.rst
>   *
>   *  Copyright (c) 2004-2008 David Howells <dhowells@redhat.com>
>   *  Copyright (c) 2000-2003 David McCullough <davidm@snapgear.com>
> -- 
> 2.26.2
> 

-- 
Sincerely yours,
Mike.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
