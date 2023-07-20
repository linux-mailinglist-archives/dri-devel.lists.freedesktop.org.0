Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F0B75B925
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 23:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA21710E18F;
	Thu, 20 Jul 2023 21:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A396D10E18F;
 Thu, 20 Jul 2023 21:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689886879; x=1721422879;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Hh6rekOy1WZ9Vjh040E9Bt6MFaGZDceCvyOXOPwyPkw=;
 b=UQZWGKTO8IxrzEVP3tkYf59+3TdAbI3a+WsGgpJAdeXuoPUa3qpTY+4n
 vzBQOLCUkV5ThhBMV18RnwuGmpk9vGCMw5MCsUixTOSXeq1gH/GsI8rIb
 yC+1ZwyP69BgnCX8mnW6OOlcb8moLKd8KQwl5s0+IXOuIxmi1dqag+uWB
 L9by6E9sh+2OqDlkHBnqiM4Rqa4pA5HH43H1kzWh7VxWU6lvUAUMhAjwz
 RbTX5pPCo51C5bZBChpQ6nYVf95qa+AfeMLx1XZ5N7DDam0VOA/wJxXRC
 3Q/v4adR8In3mWWVgT4UU/2iLvF6XDdCwBJXlk2kRW+0HrjRIk3P/ROdz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="453240921"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="453240921"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="867987613"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2023 14:01:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 14:01:12 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 14:01:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 14:01:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 14:01:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niKNjKcxM6BLEClGO27vcpbK8/BgXaRCJvft+dHjPZvunLuHm+S8q1HKw9R+6HmfB99QsRTH3b7iCBhyGVdb67KsfNNJwuB86wJcm+TpsltTQGvHFdUxDXWZuJjgwaRbWP8ZD9TV+dQKOpitfGfklEqSbH+qmke0GewxlvpYhsuTaNIkc4FOKcV3zx5uiLKdJglqjp4vz1qsrPF5rvmFcIE7cxc3Tin2B6j/j1/jVEnG7w0qFXHHqQz+jJeaL2fOYtWG1QSX2F/1X96zhrK6S0wZkgV0L2rsKXYSRkUTLxk/mz7D1IGiFY6PFErwGhO5R7H2YGCJ0EfCD2hRSiDTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPNMIi802F7iEfmOpFJqDzAIsCOgkWhFyJtjoi38bHk=;
 b=Iydkru/UnWm6cWZ6Z8hu8I8x9Gj3jMUW7F9pQxAM75QKWKAS1WAtsAhSny98BDUIrQ/VXSnPhHjOmk1JC+s3qcaPF5X0MZOpVeAxKZeyHT3F3/AEVn/o6R8XbXVnygG2yo+etOAQBlMIKmhfeyzcNpxokwtV32ADI23x6I63vTQaEvG2UcHTms+DQ2ySZc9THTyLW0RQLt7lZJz+UtdtgFhY0z7TkEpsosYYWfJxeRgfBBLdWTcw9XRFg7rZ0sp4jog21t+we3Q8g90O+UXAk0+ffohjkaq3+/EBDZLTCoMKC87LSdlQ4JzsZ+qgvclbFyxNz1Anqktu+rC+JNW2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8243.namprd11.prod.outlook.com (2603:10b6:208:46e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 21:01:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 21:01:08 +0000
Date: Thu, 20 Jul 2023 21:00:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5] Documentation/gpu: Add a VM_BIND async draft document
Message-ID: <ZLmgZl8fc59kPe4/@DUT025-TGLU.fm.intel.com>
References: <20230715154543.13183-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230715154543.13183-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 236d014d-fb5e-4282-e325-08db896470b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ehPRC/XzHzhHk65pJt+Q70NA46FgFhVpxxyBCyOookLQNpEP55jCR/XuN14TAOysu478HdQadPkuz/CdCg5QBRI70PeynQMR8MzZwUYN27f14AXfg4PJEfsbMEBYEwnqhscLHinEzx2v19eek3Es59v4EqAdQSs/pVbfN0VcAL4oTZuH/SsHlohI/TKM0JY9LbaLQCfRqRBSSLLCxGXRxICzRAtLIBjK2sDDPY8L/T4GCFYR43k6lw4Vk3ZGimMBo//Qd6cKCMFni+c7O7PFvijWaVvh8hYimiSAcKg2NGhIdgTN5NiWBKRKxG9z2YzYxVDVb65PVCdVuX/hvRsLT/ZZ/w92kV7IsysPc7VnsoiAGPn6TpRDtUmHxrAVyTysIk1f/HUTd1svnyr6lekFX4i5oNsgWWl9e22EpMx3GAPhTTpXbh4W70+8CYZXz8qEWNVbFUq1AeoamCYu/MXdaX402nOOJ8WSYdWyYITxYtwqkID18L5KgYWBhyrz7jmSf9I35/GTjYdGRYHBxRXkAx8X8Yl37VO/AvU7QYZEHIA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(366004)(396003)(346002)(376002)(451199021)(4326008)(6916009)(6666004)(38100700002)(86362001)(66476007)(66946007)(66556008)(6512007)(2906002)(6486002)(186003)(26005)(6506007)(54906003)(478600001)(8676002)(8936002)(30864003)(41300700001)(44832011)(5660300002)(316002)(66574015)(66899021)(82960400001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IY6nOJ45LxA/RULYf++L1X7D6+odt6RdAxGZA2Zq+zuweR6RdgpXiW96Ry?=
 =?iso-8859-1?Q?IFPnBiWvoNbGK2P5UGRglbPMCuG1NT+J0onMfYMYbiWnPJ9ykwB71rsYFD?=
 =?iso-8859-1?Q?peOxsbLS9V3RG6DVqnuc2elRSX23ZbOjsL1o89ixonFdyUinbfHrT9BkFF?=
 =?iso-8859-1?Q?UxP0wfzraGss2APOnJI9f0x6gGD32AUsAg9rdPbEdm47Q7h1AgmgyUrpLL?=
 =?iso-8859-1?Q?7OIFMSH6zb0F64sV6+G5P27SBHveH0qhiBUveK9QM7nzVTtJNW+8qebLj2?=
 =?iso-8859-1?Q?4a3ZZoZgDKeFcZpIUf2ri6yDzrzsYNfz/DuqY06lnQe7Pcxdjs60elSDTc?=
 =?iso-8859-1?Q?bHEf1m+cP2Mxt2crklS5F+uwd6sqipf4XZHeeQu7ZKWsjhII4C4ieaW1PQ?=
 =?iso-8859-1?Q?PcIcT7qFXEfTiOiWsr2vFmCW5fs8ZTwc9/8U3YlDbUM+l3vaLyxt9MR4v3?=
 =?iso-8859-1?Q?7k7nshmrZSMZchiFjJyIKBZ7tMbh7ws6OdBmlH/Li1FR72IgBKwv/jmeSK?=
 =?iso-8859-1?Q?ncZeNTj7Fyyo8GmZRYHSeQywGeSbYaez+h0ZI7h71gl60QQOV41yXaUwLz?=
 =?iso-8859-1?Q?Wxi7uxpmOrLzEYYeVx4y0rFhlJvOnQDYCQk4os45m1X9PR+6k32v6bW+IG?=
 =?iso-8859-1?Q?lLS/3YZuU+v8rMx57PrRNX9KlMCSU6mL2X4CPgllVTe7uU+6EOYUkQfFoq?=
 =?iso-8859-1?Q?+twXRP0fVbyqWUgCOjqpff8yKyjKYF0RRm/8jiTQgo2872PKSDcsM4oNLi?=
 =?iso-8859-1?Q?NYpYgtG2ybpi4zBxgijU8gKDcwMyz8i8xKY19t4HCag5TgNicW6KTGNuPG?=
 =?iso-8859-1?Q?K/01I5LPSLwzosvScLpQZ8eQdxhjeHfV/eAu8I/r4s5XPCA9nNSk6CYUOF?=
 =?iso-8859-1?Q?uE0WtS1ePhijijMX6FREyOBaCs73rHq0X9aZFSQJ04K9YvHyWS2WYpBRhm?=
 =?iso-8859-1?Q?E/tOHr/ALgNFXkL7vohuO8eecDfWIpbcsX/uFFVV+UGp6wjE0/w8d3cuU7?=
 =?iso-8859-1?Q?MMjpcX1UIM10SzKoXxZKLHBegKLpGB6yTg2LMEjrrrxn/tgDwYaWGlIjR5?=
 =?iso-8859-1?Q?63TW1xiG66ykCPKqx5pEQ/upBmrNEFy06ut3dvEhunHHX7BlfxfcmmOigg?=
 =?iso-8859-1?Q?q2frJF/XrJDtAmapk/+EnjObPNTYuYq1bKnT4U5fnV9PHAXyAEfTUn9NSv?=
 =?iso-8859-1?Q?yj+7YJGkH0XZO38kuNWuC0WCC1RK8jF1C7rYqvaT49pDOpxv957Sw6TeOY?=
 =?iso-8859-1?Q?mJFZI6T/Vi4/lb51h9fuI8E1INEqNLW4lipXeDWGogjzLeb6bv28JBkExO?=
 =?iso-8859-1?Q?/EE0vTMTQhdoRfCInyyyL7QXnW0qkYDJiML4kmSiLIiaXVcEuJa01YoJpE?=
 =?iso-8859-1?Q?+UJWiiidJ3ZBUaZGK8GvCO5+VD4RhHQQ3PSS7neasjfcvJpPKo6MWC0b19?=
 =?iso-8859-1?Q?/ALHln0QrtTVQ4J9GvylxscYKBBQ9ZT8kzPb5LOzGonio9xjRoh3Zobp9q?=
 =?iso-8859-1?Q?OQHVVVc6GsF8V3AvcC0nk3TOXkboMbNEerFefJ+HCvObDHCIlNF9SZBeqz?=
 =?iso-8859-1?Q?+TN2Pmv6XKfYyuKTvKGC5lrImG7Du6O+3Addf8zj2Wt5/Jgm/9laX2tviD?=
 =?iso-8859-1?Q?eiSDWtsW2YjiUYJg/JLO9Txc5GPH5x+7kI0RJcIQf5alNQbY/Szq8mnA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 236d014d-fb5e-4282-e325-08db896470b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 21:01:08.7174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghzkBOmpLH0pvdHdLQ+W4pNn4tEPw5M2tIY+ApJKfkVvS3me443+Bx8O2B4cWNAImV9qeXSsDGqzqCUaNYnscQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8243
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
Cc: Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 Oak Zeng <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 15, 2023 at 05:45:43PM +0200, Thomas Hellström wrote:
> Add a motivation for and description of asynchronous VM_BIND operation
> 
> v2:
> - Fix typos (Nirmoy Das)
> - Improve the description of a memory fence (Oak Zeng)
> - Add a reference to the document in the Xe RFC.
> - Add pointers to sample uAPI suggestions
> v3:
> - Address review comments (Danilo Krummrich)
> - Formatting fixes
> v4:
> - Address typos (Francois Dugast)
> - Explain why in-fences are not allowed for VM_BIND operations for long-
>   running workloads (Matthew Brost)
> v5:
> - More typo- and style fixing
> - Further clarify the implications of disallowing in-fences for VM_BIND
>   operations for long-running workloads (Matthew Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  Documentation/gpu/drm-vm-bind-async.rst | 171 ++++++++++++++++++++++++
>  Documentation/gpu/rfc/xe.rst            |   4 +-
>  2 files changed, 173 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
> 
> diff --git a/Documentation/gpu/drm-vm-bind-async.rst b/Documentation/gpu/drm-vm-bind-async.rst
> new file mode 100644
> index 000000000000..d2b02a38198a
> --- /dev/null
> +++ b/Documentation/gpu/drm-vm-bind-async.rst
> @@ -0,0 +1,171 @@
> +====================
> +Asynchronous VM_BIND
> +====================
> +
> +Nomenclature:
> +=============
> +
> +* ``VRAM``: On-device memory. Sometimes referred to as device local memory.
> +
> +* ``gpu_vm``: A GPU address space. Typically per process, but can be shared by
> +  multiple processes.
> +
> +* ``VM_BIND``: An operation or a list of operations to modify a gpu_vm using
> +  an IOCTL. The operations include mapping and unmapping system- or
> +  VRAM memory.
> +
> +* ``syncobj``: A container that abstracts synchronization objects. The
> +  synchronization objects can be either generic, like dma-fences or
> +  driver specific. A syncobj typically indicates the type of the
> +  underlying synchronization object.
> +
> +* ``in-syncobj``: Argument to a VM_BIND IOCTL, the VM_BIND operation waits
> +  for these before starting.
> +
> +* ``out-syncobj``: Argument to a VM_BIND_IOCTL, the VM_BIND operation
> +  signals these when the bind operation is complete.
> +
> +* ``memory fence``: A synchronization object, different from a dma-fence.
> +  A memory fence uses the value of a specified memory location to determine
> +  signaled status. A memory fence can be awaited and signaled by both
> +  the GPU and CPU. Memory fences are sometimes referred to as
> +  user-fences, userspace-fences or gpu futexes and do not necessarily obey
> +  the dma-fence rule of signaling within a "reasonable amount of time".
> +  The kernel should thus avoid waiting for memory fences with locks held.
> +
> +* ``long-running workload``: A workload that may take more than the
> +  current stipulated dma-fence maximum signal delay to complete and
> +  which therefore needs to set the gpu_vm or the GPU execution context in
> +  a certain mode that disallows completion dma-fences.
> +
> +* ``exec function``: An exec function is a function that revalidates all
> +  affected gpu_vmas, submits a GPU command batch and registers the
> +  dma_fence representing the GPU command's activity with all affected
> +  dma_resvs. For completeness, although not covered by this document,
> +  it's worth mentioning that an exec function may also be the
> +  revalidation worker that is used by some drivers in compute /
> +  long-running mode.
> +
> +* ``bind context``: A context identifier used for the VM_BIND
> +  operation. VM_BIND operations that use the same bind context can be
> +  assumed, where it matters, to complete in order of submission. No such
> +  assumptions can be made for VM_BIND operations using separate bind contexts.
> +
> +* ``UMD``: User-mode driver.
> +
> +* ``KMD``: Kernel-mode driver.
> +
> +
> +Synchronous / Asynchronous VM_BIND operation
> +============================================
> +
> +Synchronous VM_BIND
> +___________________
> +With Synchronous VM_BIND, the VM_BIND operations all complete before the
> +IOCTL returns. A synchronous VM_BIND takes neither in-fences nor
> +out-fences. Synchronous VM_BIND may block and wait for GPU operations;
> +for example swap-in or clearing, or even previous binds.
> +
> +Asynchronous VM_BIND
> +____________________
> +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs. While the
> +IOCTL may return immediately, the VM_BIND operations wait for the in-syncobjs
> +before modifying the GPU page-tables, and signal the out-syncobjs when
> +the modification is done in the sense that the next exec function that
> +awaits for the out-syncobjs will see the change. Errors are reported
> +synchronously assuming that the asynchronous part of the job never errors.
> +In low-memory situations the implementation may block, performing the
> +VM_BIND synchronously, because there might not be enough memory
> +immediately available for preparing the asynchronous operation.
> +
> +If the VM_BIND IOCTL takes a list or an array of operations as an argument,
> +the in-syncobjs needs to signal before the first operation starts to
> +execute, and the out-syncobjs signal after the last operation
> +completes. Operations in the operation list can be assumed, where it
> +matters, to complete in order.
> +
> +Since asynchronous VM_BIND operations may use dma-fences embedded in
> +out-syncobjs and internally in KMD to signal bind completion,  any
> +memory fences given as VM_BIND in-fences need to be awaited
> +synchronously before the VM_BIND ioctl returns, since dma-fences,
> +required to signal in a reasonable amount of time, can never be made
> +to depend on memory fences that don't have such a restriction.
> +
> +To aid in supporting user-space queues, the VM_BIND may take a bind context.
> +
> +The purpose of an Asynchronous VM_BIND operation is for user-mode
> +drivers to be able to pipeline interleaved gpu_vm modifications and
> +exec functions. For long-running workloads, such pipelining of a bind
> +operation is not allowed and any in-fences need to be awaited
> +synchronously. The reason for this is twofold. First, any memory
> +fences gated by a long-running workload and used as in-syncobjs for the
> +VM_BIND operation will need to be awaited synchronously anyway (see
> +above). Second, any dma-fences used as in-syncobjs for VM_BIND
> +operations for long-running workloads will not allow for pipelining
> +anyway since long-running workloads don't allow for dma-fences as
> +out-syncobjs, so while theoretically possible the use of them is
> +questionable and should be rejected until there is a valuable use-case.
> +Note that this is not a limitation imposed by dma-fence rules, but
> +rather a limitation imposed to keep KMD implementation simple. It does
> +not affect using dma-fences as dependencies for the long-running
> +workload itself, which is allowed by dma-fence rules, but rather for
> +the VM_BIND operation only.
> +
> +Also for VM_BINDS for long-running gpu_vms the user-mode driver should typically
> +select memory fences as out-fences since that gives greater flexibility for
> +the kernel mode driver to inject other operations into the bind /
> +unbind operations. Like for example inserting breakpoints into batch
> +buffers. The workload execution can then easily be pipelined behind
> +the bind completion using the memory out-fence as the signal condition
> +for a GPU semaphore embedded by UMD in the workload.
> +
> +Multi-operation VM_BIND IOCTL error handling and interrupts
> +===========================================================
> +
> +The VM_BIND operations of the IOCTL may error due to lack of resources
> +to complete and also due to interrupted waits. In both situations UMD
> +should preferably restart the IOCTL after taking suitable action. If
> +UMD has over-committed a memory resource, an -ENOSPC error will be
> +returned, and UMD may then unbind resources that are not used at the
> +moment and restart the IOCTL. On -EINTR, UMD should simply restart the
> +IOCTL and on -ENOMEM user-space may either attempt to free known
> +system memory resources or abort the operation. If aborting as a
> +result of a failed operation in a list of operations, some operations
> +may still have completed, and to get back to a known state, user-space
> +should therefore attempt to unbind all virtual memory regions touched
> +by the failing IOCTL.
> +Unbind operations are guaranteed not to cause any errors due to
> +resource constraints.
> +In between a failed VM_BIND IOCTL and a successful restart there may
> +be implementation defined restrictions on the use of the gpu_vm. For a
> +description why, please see KMD implementation details under `error
> +state saving`_.
> +
> +Sample uAPI implementations
> +===========================
> +Suggested uAPI implementations at the moment of writing can be found for
> +the Nouveau driver `here
> +<https://patchwork.freedesktop.org/patch/543260/?series=112994&rev=6>`_.
> +and for the Xe driver `here
> +<https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_drm.h?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7>`_.
> +
> +KMD implementation details
> +==========================
> +
> +Error state saving
> +__________________
> +Open: When the VM_BIND IOCTL returns an error, some or even parts of
> +an operation may have been completed. If the IOCTL is restarted, in
> +order to know where to restart, the KMD can either put the gpu_vm in
> +an error state and save one instance of the needed restart state
> +internally. In this case, KMD needs to block further modifications of
> +the gpu_vm state that may cause additional failures requiring a
> +restart state save, until the error has been fully resolved. If the
> +uAPI instead defines a pointer to a UMD allocated cookie in the IOCTL
> +struct, it could also choose to store the restart state in that cookie.
> +
> +The restart state may, for example, be the number of successfully
> +completed operations.
> +
> +Easiest for UMD would of course be if KMD did a full unwind on error
> +so that no error state needs to be saved.
> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> index 2516fe141db6..0f062e1346d2 100644
> --- a/Documentation/gpu/rfc/xe.rst
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -138,8 +138,8 @@ memory fences. Ideally with helper support so people don't get it wrong in all
>  possible ways.
>  
>  As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
> -various flavors, error handling and a sample API should be documented here or in
> -a separate document pointed to by this document.
> +various flavors, error handling and sample API suggestions are documented in
> +Documentation/gpu/drm-vm-bind-async.rst
>  
>  Userptr integration and vm_bind
>  -------------------------------
> -- 
> 2.40.1
> 
