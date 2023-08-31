Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2937878F359
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 21:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8242110E6C9;
	Thu, 31 Aug 2023 19:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB5710E6C6;
 Thu, 31 Aug 2023 19:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693510236; x=1725046236;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qmDogOIdiqvjCKNIi0KZXf3JHLEV9hrGz60X3DIrojA=;
 b=j8bon3QTQqgZRSPIaokVsIqXhm49iAyDG/Uo6a32zkLbofRGqProjMqu
 Q4w0fWhkzQ2oy9Cj8mD49tbFNc0grwh3Xo2BLLk2UVXDUvtkMYbkF2hEl
 v6Yd3V6KMXEYPrPGXjefAemUB9PWCeDdpohdB0WMw1WXV5WILCHFXVjd9
 SvnJXVC1yP5rO2XwZataErCOhIeMFcaTgur2EQTux9jzPEFhMbCN6JMGN
 wF8gmDFBFwhhdo/VQ/qn0yVgdc9UgRkTbI56oQZm2AcM8wsHeSpdQsvh4
 RWVjdGqdizYB1HHTzXYFrMANimdFmdHOQmCNTsxhp8gIw+HO99OGyMYfg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366271959"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="366271959"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 12:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689469184"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="689469184"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 12:30:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 12:30:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 12:30:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 12:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CB5YlC01x2qreXZofSKJNsHuIq+C5hY7YVrz5harZm7LjD61vf9r3wk0EwmBiDaTygNlNTqUgeqtJQkFFX91BixiGyBXp/MmRaWqmz18j7xcH01HVOmYurGU1jF5ohZjcTz94K7tzUoYbzRjnBPZ7aILjQJUu0k3OuPTstw/TPxDH+EEnjEHustsnlGhqit6z/iA8ZWzEyyHFoFL3F1PVnH1uz2njP3QDW5hxMaS9KTopYC8YJ1P6XrtaAhFjKwVMVDkNrRzSB4HExf5fONr8EJ4mNsze3vPyBAj+ngVuJ5Fmzzkue1CCbfd49QUaxHNb335PpLsIvW6adBEwUuY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FI5u+Ewu4+INvL9jlms08q5H1WyYkdBy2Ik3VD5yXzE=;
 b=ezDZvr3UXMF3ZMqfWzDjB2yFYctioFFskiM63IeBR50CMsIt7iBlkydlKe5/jF+jvHgf62v8OjsNbjhvFK2hj2/UCuxVVVWBIRiMit3zL44ens/zi23h2JjH/cKhficXHppu0S/1xz8KUHLYf7ay28432wKiWioV2/bAvyZPnxo6GCrhMv/orO0CjHLk/r+4/JYuyYeoCpbbT1uZPahOc5GUrF8ZaKULGK1tqGzWfUHedTvliZO4LTyBQ2vUVvU3cpQme4wgSCWl90nxl6SXM3v3xcNfXa/WFAGv4aSZ1IRziPw+LhbYveqWaKLD6GZftX6R3f8ZsiJtk56udhksgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 19:30:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 19:30:15 +0000
Date: Thu, 31 Aug 2023 15:30:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2] Documentation/gpu: VM_BIND locking document
Message-ID: <ZPDqQWhoDQDC92Pq@intel.com>
References: <20230816091547.2982-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230816091547.2982-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:217::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ef9e21-1b7a-40f8-d9eb-08dbaa58b35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iBIxiLNYkE7v2kipZA+H0+62Tf0p0bF0t5/eyNzGytxbzlyogDT1QI295VSXTgCebhI1tVofTXOQ+ed1P/vSsgUPKOMUk5HIfkn+6cFB+1la12SAAZb7Or6N5tkyA20vPjw/2OQTOLI6uI2TdSBgPqHg3Ig7WdFmKFmhSUgVMhHA5c9csfbtMgI7vY7zC/BgmXh9sRs4PV9Yo+7IEQDv/q5C4gp7HGsH5Cad/i9ZcXBAPqnd03tDd/alcmfZEs3oLFJ3vI3ba5Zh6kBrfyprX89GFIr1ThfwmUZ8Z1thJ8Avr1l/vmNpMnOgv5vWHijSdD2T1+eXu0tvQOP/dr7MLLwlO1vFFMSzWevz10SRnzP3trchKK228iZMkDae+kqrcNRSGDepOcu0ODY8ygEEJeiP3vETYRufN1PT8sU7nal9c24pa+cmyfXS9EfbKutwSgS2oW3/oUidfSArBjUFqUniYFMaEi0ce2Td8QlwukJX8U2JSOD3/TMn0EjsBs25rN1cEzQON4MAa4son38NL4FIOvrurk6aoq3P8gK5dUM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(186009)(1800799009)(451199024)(8936002)(6666004)(478600001)(110136005)(66946007)(66556008)(6506007)(6486002)(66476007)(54906003)(316002)(38100700002)(41300700001)(82960400001)(6512007)(44832011)(26005)(83380400001)(5660300002)(36756003)(2906002)(2616005)(86362001)(30864003)(8676002)(66574015)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HDo+mUyq6PwVYKV3t6DuRJfW52FKPCuE8TH1j9G5/EVQ/uwWvwiY2WR0wx?=
 =?iso-8859-1?Q?Dy+aieww22wj2RLSgQVM+zg3z8L81Hu9fL9+fmjt535pMG1Sr1WYTTip4U?=
 =?iso-8859-1?Q?66vHlBKFGwmgxzPXdj7wwFnh+LstMLMFcWAV9Nxy4Mge1kC6TOuOPvxz7Y?=
 =?iso-8859-1?Q?lSj4Anb1PYlToPchH29VhjaFflAgqoDIvYyzJ/Mq0lyJhqAp8WjPRAU35t?=
 =?iso-8859-1?Q?jKDGtjtA+lS4iutYZ3fCmeeZ96IWQabJehUJEnmqYpRa6VdhEm62WBxGkD?=
 =?iso-8859-1?Q?FSDvuhTZcU7gHCeZrngM3E9XBof4gxdb0Te4WpMNJgV8kATb2IaypaPwjd?=
 =?iso-8859-1?Q?04VOCaCIplbXDfu+Zp49Zbv1YcEv0/2ssngZAcowmmh7OhbyQlA7VapnI4?=
 =?iso-8859-1?Q?0acdse02QCda6Gw1Jr/h5OfsI03Csi4aUV6GHcDOOmYj9fl2W6FlMZElQJ?=
 =?iso-8859-1?Q?ETD/oJ+em3AmiZwIOZI81F3FPAz+7O4VCincD4aj6OYxH4zbq857rUpfLG?=
 =?iso-8859-1?Q?rFoSW+/6pLVN2XJBr0XlRp7hht5OyoCNr4BJlfuYSw0HH2wBlynx5yzVKW?=
 =?iso-8859-1?Q?TMnl7iN/bRz2fAq0qgQ+GqHRN92VPmHFQnPka7rObNnqRTa8BLmD8jdj4f?=
 =?iso-8859-1?Q?aEJNRSgPBp51llW2rjAUhIEVkpFiFk4TTQ11eO465DL5wI3iVXOyVN0uWg?=
 =?iso-8859-1?Q?+PW/6hfBra6iIZ1C6WVGek9a216NAHCaEvJcCdNItiGURusJ0gyCGmXpsG?=
 =?iso-8859-1?Q?D6+tbn7Keyeu2VQiyUmZ/wAtm+V7dXbHMLyEfDZYHXe4sRLq5gKqysilg1?=
 =?iso-8859-1?Q?fcm/NJDRvhgjaAIR9gt1XVsO08IPtXEYFcUFIbku09BiN1T+ZES7xz651c?=
 =?iso-8859-1?Q?Jz2LNvWvKaV2uEf3SEBz80p5tIKNjRJ0af6zzuyxJUJpHHUxxtI6wozH0O?=
 =?iso-8859-1?Q?LElTKIMrFmF8XCghjzsU3Zqlo5lRaGHd+HIwr2Jrqw5cAHO5QIm28axzjB?=
 =?iso-8859-1?Q?CV+I4cuO0zztjA8oOHl1pAYJ3jExBFBr6vFg+kr1/F6fnziZQiMK4wqaiV?=
 =?iso-8859-1?Q?zFbxZYDjUw0rByllnZrRM3TK7nhkLfsRZBFd2dN/IgCflxAnT4L2BaWWWL?=
 =?iso-8859-1?Q?7yj7/klrOFOGq5Wj0OnWW9bciJWAeA1S7bUM9XLgHwZsjHTEh9Rgz90rna?=
 =?iso-8859-1?Q?oHD0NWwBh1Xpiju/1CcefrRrDJT/FCLHVUrZT7DMP3qIQgPBFnoVkWGxe8?=
 =?iso-8859-1?Q?lku7oz8x6Tpu4Uq60WJdOfPrsRwky2JuMBIWOED//phUFDPhdVY7DhHRhC?=
 =?iso-8859-1?Q?SP8cdipVa0aLqXbY29rJXwpTcqGHdWy6s5RWwY/TT9oBLFQ5agx72hO3zp?=
 =?iso-8859-1?Q?km3j07lgfi/Tho6/fVPULVid+6K55aMm9eaqK8wOCFy2A2US0D0HfjbVTk?=
 =?iso-8859-1?Q?lSDlrOb8ABe9vvO7Z/EhALf/qUJf//HxN1a/yxYZ9e7MiBoAcvY/4CgUjQ?=
 =?iso-8859-1?Q?d/s8hnK/KnuMuSmGYSooySEJCkdm01j8/jlk+zZVy80ZcBjNjfSsIro+lH?=
 =?iso-8859-1?Q?8A2PkEqFMTplNo5TnPmCDsAmG33KOWNUrEPlgKKkhj3Q7jVH6879SmOWy9?=
 =?iso-8859-1?Q?ybe2kj3wClD6LIvEYxWJCGIqSQ2LQlz+QHTeNLeOqcZU0KhiHeYNByzA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ef9e21-1b7a-40f8-d9eb-08dbaa58b35a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 19:30:14.9146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFQWHlBjB/jxTd2ACoPUEoSxULbXViY7NoyWoxxLB0pldC6eXZJ0B4Le2cz4XCyaujsvHUFGb6WZ+KxoE5x/hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
X-OriginatorOrg: intel.com
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 Oak Zeng <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 11:15:47AM +0200, Thomas Hellström wrote:
> Add the first version of the VM_BIND locking document which is
> intended to be part of the xe driver upstreaming agreement.
> 
> The document describes and discuss the locking used during exec-
> functions, evicton and for userptr gpu-vmas. Intention is to be using the
> same nomenclature as the drm-vm-bind-async.rst.
> 
> v2:
> - s/gvm/gpu_vm/g (Rodrigo Vivi)
> - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
>   (Rodrigo Vivi)
> - Adjust commit message accordingly.
> - Add SPDX license header.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Cc: Danilo Krummrich <dakr@redhat.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  Documentation/gpu/drm-vm-bind-locking.rst | 351 ++++++++++++++++++++++
>  1 file changed, 351 insertions(+)
>  create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
> 
> diff --git a/Documentation/gpu/drm-vm-bind-locking.rst b/Documentation/gpu/drm-vm-bind-locking.rst
> new file mode 100644
> index 000000000000..b813961a9ec2
> --- /dev/null
> +++ b/Documentation/gpu/drm-vm-bind-locking.rst
> @@ -0,0 +1,351 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +===============
> +VM_BIND locking
> +===============
> +
> +This document attempts to describe what's needed to get VM_BIND locking right,
> +including the userptr mmu_notifier locking and it will also discuss some
> +optimizations to get rid of the looping through of all userptr mappings and
> +external / shared object mappings that is needed in the simplest
> +implementation. It will also discuss some implications for faulting gpu_vms.
> +
> +Nomenclature
> +============
> +
> +* ``Context``: GPU execution context.
> +* ``gpu_vm``: Abstraction of a virtual GPU address space with
> +  meta-data. Typically one per client (DRM file-private), or one per
> +  context.
> +* ``gpu_vma``: Abstraction of a GPU address range within a gpu_vm with
> +  associated meta-data. The backing storage of a gpu_vma can either be
> +  a gem buffer object or anonymous pages mapped also into the CPU
> +  address space for the process.
> +* ``userptr gpu_vma or just userptr``: A gpu_vma, the backing store of
> +  which is anonymous pages as described above.
> +* ``revalidating``: Revalidating a gpu_vma means making the latest version
> +  of the backing store resident and making sure the gpu_vma's
> +  page-table entries point to that backing store.
> +* ``dma_fence``: A struct dma_fence that is similar to a struct completion
> +  and which tracks GPU activity. When the GPU activity is finished,
> +  the dma_fence signals.
> +* ``dma_resv``: A struct dma_resv (AKA reservation object) that is used
> +  to track GPU activity in the form of multiple dma_fences on a
> +  gpu_vm or a gem buffer object. The dma_resv contains an array / list
> +  of dma_fences and a lock that needs to be held when adding
> +  additional dma_fences to the dma_resv. The lock is of a type that
> +  allows deadlock-safe locking of multiple dma_resvs in arbitrary order.
> +* ``exec function``: An exec function is a function that revalidates all
> +  affected gpu_vmas, submits a GPU command batch and registers the
> +  dma_fence representing the GPU command's activity with all affected
> +  dma_resvs. For completeness, although not covered by this document,
> +  it's worth mentioning that an exec function may also be the
> +  revalidation worker that is used by some drivers in compute /
> +  long-running mode.
> +* ``local object``: A GEM object which is local to a gpu_vm. Shared gem
> +  objects also share the gpu_vm's dma_resv.
> +* ``shared object``: AKA external object: A GEM object which may be shared
> +  by multiple gpu_vms and whose backing storage may be shared with
> +  other drivers.
> +
> +
> +Introducing the locks
> +=====================
> +
> +One of the benefits of VM_BIND is that local GEM objects share the gpu_vm's
> +dma_resv object and hence the dma_resv lock. So even with a huge
> +number of local GEM objects, only one lock is needed to make the exec
> +sequence atomic.
> +
> +The following locks and locking orders are used:
> +
> +* The ``gpu_vm->lock`` (optionally an rwsem). Protects how the gpu_vm is
> +  partitioned into gpu_vmas, protects the gpu_vm's list of external objects,
> +  and can also with some simplification protect the gpu_vm's list of
> +  userptr gpu_vmas. With the CPU mm analogy this would correspond to the
> +  mmap_lock.
> +* The ``userptr_seqlock``. This lock is taken in read mode for each
> +  userptr gpu_vma on the gpu_vm's userptr list, and in write mode during mmu
> +  notifier invalidation. This is not a real seqlock but described in
> +  ``mm/mmu_notifier.c` as a "Collision-retry read-side/write-side
> +  'lock' a lot like a seqcount, however this allows multiple
> +  write-sides to hold it at once...". The read side critical section
> +  is enclosed by ``mmu_interval_read_begin() /
> +  mmu_interval_read_retry()`` with ``mmu_interval_read_begin()``
> +  sleeping uninterruptibly if the write side is held.
> +  The write side is held by the core mm while calling mmu interval
> +  invalidation notifiers.
> +* The ``gpu_vm->resv`` lock. Protects the gpu_vm's list of gpu_vmas needing
> +  rebinding, and also the residency of all the gpu_vm's local GEM object.
> +* The ``gpu_vm->userptr_notifier_lock``. This is an rwsem that is taken in read
> +  mode during exec and write mode during a mmu notifier invalidation. In
> +  the absence of a separate page-table lock, this lock can serve
> +  together with the gpu_vm's dma_resv lock as a page-table lock. More on
> +  this below. The userptr notifier lock is per gpu_vm.
> +* The ``gpu_vm->page_table_lock``. Protects the gpu_vm's page-table updates. For
> +  simplicity the gpu_vm's dma_resv lock can be reused as page-table lock.
> +
> +There are certain optimizations described below that require
> +additional locks. More on that later.
> +
> +.. code-block:: C
> +
> +   dma_resv_lock(&gpu_vm->resv);
> +
> +   for_each_gpu_vma_on_revalidate_list(gpu_vm, &gpu_vma) {
> +		revalidate_gpu_vma(&gpu_vma);
> +		remove_from_revalidate_list(&gpu_vma);
> +   }
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +   dma_resv_unlock(&gpu_vm->resv);
> +
> +Eviction of one of these local objects will then be something like the
> +following:
> +
> +.. code-block:: C
> +
> +   obj = get_object_from_lru();
> +
> +   dma_resv_lock(obj->resv);
> +   for_each_gpu_vma_of_obj(obj, &gpu_vma);
> +		put_gpu_vma_on_revalidate_list(&gpu_vma);
> +
> +   add_dependencies(&eviction_job, &obj->resv);
> +   job_dma_fence = gpu_submit(&eviction_job);
> +   add_dma_fence(&obj->resv, job_dma_fence);
> +
> +   dma_resv_unlock(&obj->resv);
> +   put_object(obj);
> +
> +Note that since the object is local to the gpu_vm, it will share the gpu_vm's
> +``dma_resv`` lock so that ``obj->resv == gpu_vm->resv``. Invalidated gpu_vmas are put
> +on the gpu_vm's revalidation list, which is protected by ``gpu_vm->resv``, which
> +is always locked while evicting, due to the above equality.
> +
> +For VM_BIND gpu_vms, gpu_vmas don't need to be unbound before eviction,
> +Since the eviction blit or copy will wait for GPU idle, any attempt by
> +the GPU to access freed memory through the gpu_vma will be preceded by
> +a new exec function, which will make sure the gpu_vma is
> +revalidated. The eviction code holding the object's dma_resv while
> +revalidating will ensure a new exec function may not race with the eviction.
> +
> +Introducing external (or shared) buffer objects
> +===============================================
> +
> +Since shared buffer objects may be shared by multiple gpu_vm's they
> +can't share their reservation object with a single gpu_vm, but will rather
> +have a reservation object of their own. The shared objects bound to a
> +gpu_vm using one or many
> +gpu_vmas are therefore typically put on a per-gpu_vm list which is
> +protected by the gpu_vm lock. One could in theory protect it also with
> +the ``gpu_vm->resv``, but since the list of dma_resvs to take is typically
> +built before the ``gpu_vm->resv`` is locked due to a limitation in
> +the current locking helpers, that is typically not done. Also see
> +below for userptr gpu_vmas.
> +
> +At eviction time we now need to invalidate *all* gpu_vmas of a shared
> +object, but we can no longer be certain that we hold the gpu_vm's
> +dma_resv of all the object's gpu_vmas. We can only be certain that we
> +hold the object's private dma_resv. We can trylock the dma_resvs for
> +the affected gpu_vm's but that might be unnecessarily complex. If we
> +have a ww_acquire context at hand at eviction time we can also perform
> +sleeping locks of those dma_resvs but that could cause expensive
> +rollbacks. One option is to just mark the invalidated gpu_vmas with a bool
> +which is inspected on the next exec function, when the gpu_vm's
> +dma_resv and the object's dma_resv is held, and the invalidated
> +gpu_vmas could then be put on the gpu_vm's list of invalidated
> +gpu_vmas. That bool would then, although being per-gpu_vma formally be
> +protected by the object's dma_resv.
> +
> +The exec function would then look something like the following:
> +
> +.. code-block:: C
> +
> +   read_lock(&gpu_vm->lock);
> +
> +   dma_resv_lock(&gpu_vm->resv);
> +
> +   // Shared object list is protected by the gpu_vm->lock.
> +   for_each_shared_obj(gpu_vm, &obj) {
> +		dma_resv_lock(&obj->resv);
> +		move_marked_gpu_vmas_to_revalidate_gpu_vma_list(obj, &gpu_vm);
> +   }
> +
> +   for_each_gpu_vma_to_revalidate(gpu_vm, &gpu_vma) {
> +		revalidate_gpu_vma(&gpu_vma);
> +		remove_from_revalidate_list(&gpu_vma);
> +   }
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +   for_each_shared_obj(gpu_vm, &obj)
> +          add_dma_fence(job_dma_fence, &obj->resv);
> +   dma_resv_unlock_all_resv_locks();
> +
> +   read_unlock(&gpu_vm->lock);
> +
> +And the corresponding shared-object aware eviction would look like:
> +
> +.. code-block:: C
> +
> +   obj = get_object_from_lru();
> +
> +   dma_resv_lock(obj->resv);
> +   for_each_gpu_vma_of_obj(obj, &gpu_vma);
> +		if (object_is_vm_local(obj))
> +		             put_gpu_vma_on_revalidate_list(&gpu_vma, &gpu_vm);
> +		else
> +		             mark_gpu_vma_for_revalidation(&gpu_vma);
> +
> +   add_dependencies(&eviction_job, &obj->resv);
> +   job_dma_fence = gpu_submit(&eviction_job);
> +   add_dma_fence(&obj->resv, job_dma_fence);
> +
> +   dma_resv_unlock(&obj->resv);
> +   put_object(obj);
> +
> +Yet another option is to put the gpu_vmas to be invalidated on a separate
> +gpu_vm list protected by a lower level lock that can be taken both at eviction
> +time and at transfer-to-revalidate list time. The details are not in
> +this document, but this for reference implemented in the Intel xe
> +driver.
> +
> +Introducing userptr gpu_vmas
> +============================
> +
> +A userptr gpu_vma is a gpu_vma that, instead of mapping a buffer object to a
> +GPU virtual address range, directly maps a CPU mm range of anonymous-
> +or file page-cache pages.
> +A very simple approach would be to just pin the pages using
> +pin_user_pages() at bind time and unpin them at unbind time, but this
> +creates a Denial-Of-Service vector since a single user-space process
> +would be able to pin down all of system memory, which is not
> +desirable. (For special use-cases and with proper accounting pinning might
> +still be a desirable feature, though). What we need to do in the general case is
> +to obtain a reference to the desired pages, make sure we are notified
> +using a MMU notifier just before the CPU mm unmaps the pages, dirty
> +them if they are not mapped read-only to the GPU, and then drop the reference.
> +When we are notified by the MMU notifier that CPU mm is about to drop the
> +pages, we need to stop GPU access to the pages,
> +GPU page-table and make sure that before the next time the GPU tries to access
> +whatever is now present in the CPU mm range, we unmap the old pages
> +from the GPU page tables and repeat the process of obtaining new page
> +references. Note that when the core mm decides to laundry pages, we get such
> +an unmap MMU notification and can mark the pages dirty again before the
> +next GPU access. We also get similar MMU notifications for NUMA accounting
> +which the GPU driver doesn't really need to care about, but so far
> +it's proven difficult to exclude certain notifications.
> +
> +Using a MMU notifier for device DMA (and other methods) is described in
> +`this document
> +<https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-notifier-registration-with-or-without-page-faulting-hardware>`_.
> +
> +Now the method of obtaining struct page references using
> +get_user_pages() unfortunately can't be used under a dma_resv lock
> +since that would violate the locking order of the dma_resv lock vs the
> +mmap_lock that is grabbed when resolving a CPU pagefault. This means the gpu_vm's
> +list of userptr gpu_vmas needs to be protected by an outer lock, and this
> +is the first time we strictly need the gpu_vm->lock. While it was
> +previously used also to protect the list of the gpu_vm's shared objects,
> +we could in theory have used the gpu_vm->resv for that.
> +
> +The MMU interval seqlock for a userptr gpu_vma is used in the following
> +way:
> +
> +.. code-block:: C
> +
> +   down_read(&gpu_vm->lock);
> +
> +   retry:
> +
> +   // Note: mmu_interval_read_begin() blocks until there is no
> +   // invalidation notifier running anymore.
> +   seq = mmu_interval_read_begin(&gpu_vma->userptr_interval);
> +   if (seq != gpu_vma->saved_seq) {
> +           obtain_new_page_pointers(&gpu_vma);
> +	   dma_resv_lock(&gpu_vm->resv);
> +	   put_gpu_vma_on_revalidate_list(&gpu_vma, &gpu_vm);
> +	   dma_resv_unlock(&gpu_vm->resv);
> +	   gpu_vma->saved_seq = seq;
> +   }
> +
> +   // The usual revalidation goes here.
> +
> +   // Final userptr sequence validation may not happen before the
> +   // submission dma_fence is added to the gpu_vm's resv, from the POW
> +   // of the MMU invalidation notifier. Hence the
> +   // userptr_notifier_lock that will make them appear atomic.
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   down_read(&gpu_vm->userptr_notifier_lock);
> +   if (mmu_interval_read_retry(&gpu_vma->userptr_interval, gpu_vma->saved_seq)) {
> +          up_read(&gpu_vm->userptr_notifier_lock);
> +	  goto retry;
> +   }
> +
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +
> +   for_each_shared_obj(gpu_vm, &obj)
> +          add_dma_fence(job_dma_fence, &obj->resv);
> +
> +   dma_resv_unlock_all_resv_locks();
> +   up_read(&gpu_vm->userptr_notifier_lock);
> +   up_read(&gpu_vm->lock);
> +
> +The code between ``mmu_interval_read_begin()`` and the
> +``mmu_interval_read_retry()`` marks the read side critical section of
> +what we call the ``userptr_seqlock``. In reality the gpu_vm's userptr
> +gpu_vma list is looped through, and the check is done for *all* of its
> +userptr gpu_vmas, although we only show a single one here.
> +
> +The userptr gpu_vma MMU invalidation notifier might be called from
> +reclaim context and, again to avoid locking order violations, we can't
> +take any dma_resv lock nor the gpu_vm->lock from within it.
> +
> +.. code-block:: C
> +
> +  bool gpu_vma_userptr_invalidate(userptr_interval, cur_seq)
> +  {
> +          // Make sure the exec function either sees the new sequence
> +	  // and backs off or we wait for the dma-fence:
> +
> +          down_write(&gpu_vm->userptr_notifier_lock);
> +	  mmu_interval_set_seq(userptr_interval, cur_seq);
> +	  up_write(&gpu_vm->userptr_notifier_lock);
> +
> +	  dma_resv_wait_timeout(&gpu_vm->resv, DMA_RESV_USAGE_BOOKKEEP,
> +		                false, MAX_SCHEDULE_TIMEOUT);
> +	  return true;
> +  }
> +
> +When this invalidation notifier returns, the GPU can no longer be
> +accessing the old pages of the userptr gpu_vma and needs to redo the page-binding
> +before a new GPU submission can succeed.
> +
> +Optimizing gpu_vma iteration
> +----------------------------
> +
> +Iterating through all of a gpu_vm's userptr gpu_vmas to check the validity
> +on each exec function may be very costly. There is a scheme to avoid
> +this and only iterate through the userptr gpu_vmas that actually saw an
> +invalidation notifier call since the last exec. T

The document so far looks good to me.
I'd like to hear from Danilo if this aligns with nouveau locking
or if he has any further thoughts on this in general.

> +
> +TODO: describe that scheme here. It's implemented in the xe driver.
> +
> +Locking for page-table updates at bind- and unbind time
> +=======================================================
> +
> +TODO.
> +
> +Recoverable page-fault implications
> +===================================
> +
> +TODO.

We should probably add the TODO note somewhere else and keep the doc itself clean?
or the plan is to update before we push this patch?

> -- 
> 2.41.0
> 
