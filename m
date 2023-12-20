Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658BC81A521
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 17:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0714810E5C3;
	Wed, 20 Dec 2023 16:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7A310E5C3;
 Wed, 20 Dec 2023 16:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703089807; x=1734625807;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0/6YOxbzzlrNAfV7YjZNDVbXR/sKzCyltWxuUTtu4vc=;
 b=QYDHiKVD8T63f61CPkLTOt+UgYpLxK/oVtA2vTpzHmiVRDxIFqcpF9/6
 MO75beX/cgVo2ClB5HTthczMC1NsSxjZFReehRgqfrVweUEkuO7DD7TWY
 YOYyXhVirgXNBh5bKVUI3bxlgKmn5j7AN8/QEJb451Q2Pd46sfbB2AbE6
 3Q43blBTQkxbzDWI4QTvJQgXb4AjLoZYUPO9LBTvKEWJCRoiMiqyx7Ujr
 1eWTpuNoTPx4yr3mrTOpVXgPjPHxaiJapVd2P/Hf+AuHxLwjo9DDy+bFx
 4eqZAvXWetLpg/WdtN0kPcr76+kNJFWjqobkToEZkBNHtjldYitUbdjqZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="3073626"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="3073626"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 08:30:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="842331712"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="842331712"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 08:30:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 08:30:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 08:30:05 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 08:30:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 08:30:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvB4sX0OwPzhgnnSvIWpiwgGT8R01Q8FobOOzkpERoY/IwT+Piayk/pBCDHErrno0lCDHobRHcjXReVtm6ukNlSvTgyYhWzqFCttD0hdzlknZLkVpcA+9Pf1oZOb94N8Lc1QzKeYpY21MovVHi+u+MEkNz1viiXKMP88EU/DtkewLR1TM28Fh0VSuCeSaNT9+RW4AR43+lG2r97Uki3dn2fol86yD7/mu97UDNhfGwoMLXyAGAKzGekBMMp74aYIqTngnsaP2CrPZNzKNWuTkMwHDF7KVw7mBLkGaAqFUsp9CKQp2+xw1h+29M6Hdh54S4tefc4pQDfkVbSrB+tIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3y1vrilkATOITZIZdw2I0IhouHaAD7+ObSbvkHCL0IE=;
 b=eBZrdm3A6mIjhpnVVy+R/y84JKNyRAG7EKpwAVfmwMHU/RWve90SiB8+eB9/v91iW0gu/oHpZzmvIjgluwjcqhpFO1vKf4iMcEszGznpFvHrsL9knjyEZ/nRi8XXoYZYpxkUgLHoBBwSN7bloVc4E0kl5B2li1ulCtNdHFO3YdJLaHcnj5nprd0JO2Zjh/kkK4iSGo6gAMgC0RigLjhLdhSJkpmE+MWe1CyZQpmtgWMxKsPC05o9YrAeNhVxO6jPccsTBlBkPtaPCl1H+6wIB69zC0gOBsQx/abxoRdJNkNQ500ZA1ThpXMebmIcG3sljKKuE34Yoc4hfJx2vo6QTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 16:30:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 16:30:01 +0000
Date: Wed, 20 Dec 2023 10:29:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/vm: Fix an error path
Message-ID: <fgz7xxwduilcxjtqig4lfbmjphb4drwhemdc5m3rsrcev3fbwu@fciw2gey3xsv>
References: <20231220144214.2077-1-thomas.hellstrom@linux.intel.com>
 <xha45ldvurbfzou45zdtcygtczipw3dfw3jkokqx3oxfvrk7iu@4kswrmq6qrx2>
 <a3ec9850-19eb-c99d-eafa-ad7eda8cb796@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3ec9850-19eb-c99d-eafa-ad7eda8cb796@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0374.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a59b30c-b173-4207-c682-08dc0178ea45
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ZLXZvF6dsOhs5jG5JI0L1qxFUA5shKnqEcP0xngpz/VO2tQf8V0GMyjGXnW6iLE2JLiCM7NIcRKj4JpJ/vA3ROSpEKUbH+E4V+cRWdYqb4GUcHlI7s9wlR5vg1YEmVSYAAXxyEiSoMBu6GOf3SGrpUufl8mGtHdipwUBZuRRpOOwDKFoqLGhF3YipmhvTteIJvmey+g43KPqIHWlm4XhgxaRwEl3Tds8GisBXu4diBr036vRFruvXTK1lBIMTbiZTFqTLrjGupresbkWtbPYIulfqUgHhTn6Hj00rwJZQ+QYG4pA8z8f+H+87JVDhtepend5kBm+2KbGz+o1Vg6014QEoo7eNpFfLihb4UNbMtvhehvONWYUqHc7hr2Rwvh6Uqw9vcdmQP+3D/A7fYXEM7MGPcUfHkohY3yVI7ktw55Wnav7D32S+QICToq2sUwWbhe0iNom9i6EGIpgRa0BsglcsqOY6v55axMROjxKDjdz6oTQJPAzUREjYKnog5l3R0bbmYnOrT4WsiOQHaFGFsAMHwM/92ZF+RhYggtkiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(366004)(136003)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(4326008)(66574015)(26005)(83380400001)(9686003)(5660300002)(6512007)(6506007)(8676002)(8936002)(54906003)(6916009)(66476007)(66556008)(66946007)(6486002)(966005)(478600001)(316002)(38100700002)(82960400001)(33716001)(2906002)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PDHjMqIExO1kruoOfM0kSxJGsQ2HZ9ca89pn/cg058ESNlWUayg+eagEnn?=
 =?iso-8859-1?Q?w+1T2TuPoCyNAeUhyceNeVOGA+ROhftFux9wg+/GC2f5Eph3JeUxsmwlGV?=
 =?iso-8859-1?Q?VBeqdw6o7BuLInXIgbVNiO2RJvmGdu/s68ZDlS7T8FXbSjE33SDcKVNOvP?=
 =?iso-8859-1?Q?8thLG8/hBa65y+46BfZYwCsy/L/HEf6dvAtd6nAQys7/zqccmLfkI449Z3?=
 =?iso-8859-1?Q?MT3jJHLYyD//SLOAhF+ruTC29zoF2HfRLw9RktAHnolz9Xfqi1ChUJ6Rnf?=
 =?iso-8859-1?Q?QZJcABTg2keJKh8RnZjXn0dRRefk0aXot4KwFhcWzzqLZTISugsud9H1JF?=
 =?iso-8859-1?Q?vbwJmc4ScIMSeAd9T2+EhifkjJfZROTFib4XSClcOw5v3+PU9ht3C9TjIN?=
 =?iso-8859-1?Q?9rxwqMw91W6bl2f0u/aemlS4ao1ISRc6KlrYEVUFnxtekm5q0XaVqHcEID?=
 =?iso-8859-1?Q?sI3PMlJ9K60/09czq28r47WaQgYgYarKPbKBfXcQn6DRYRapwaUqXXUX2z?=
 =?iso-8859-1?Q?dtRv9qBCGHikD/IM3S19dNArzR4Pm8RkogL22gFz32bICnSybxUCGwaT56?=
 =?iso-8859-1?Q?IiTQkzBY52SXghY2aveNULSSEdzMQ2iVrrD+LHAnJnc3Nj2Mi8mU+zohVn?=
 =?iso-8859-1?Q?mFeXmragp1Dhct2a1RZL6Ku9Z3thOCoYbqpnT6EImlEdauxTn3SriM7tUS?=
 =?iso-8859-1?Q?87y6UyR/L6pO3yFMTfL3Qq84kNA1jQKTnEmg+OsrsiepYQ7FAjmoPFPme5?=
 =?iso-8859-1?Q?Ook1sqynk0Tkre3XA/kRuk5rclZfpoaHNR2Oz7woqZX9mT/pA/k5PdiQGP?=
 =?iso-8859-1?Q?7aYuIn1vAMIZKrMCBc+yah/00/CHCKMSoomjQC3pXSJBg9PWPCnkqOC43V?=
 =?iso-8859-1?Q?tSm/wRe0ePyfg+ghCquTLD1oyLMeadOtMK6yf8OALz+ubnkz5LBO9hVQP2?=
 =?iso-8859-1?Q?ZA3HTtVpncvyXAAvAszY5hvtr6cSnqsC2qLwKMVfnoe41QQuwxqfwM/ZoV?=
 =?iso-8859-1?Q?CaS3QQs1TaPUSRG8MJYpFUb67cAe3rbU5BtObwZWy7J3RjtWqa8TQLgJx2?=
 =?iso-8859-1?Q?1p/Wd2GW698UIhzhPrGq71T2HsyU2CSZVKORwW51F9IiYykOsrgpOz2gbT?=
 =?iso-8859-1?Q?sA7jypTtamSwUvaLon41YNq5wQc/yle06M47p0w1V7MX3x0Lg2pBzmo3rI?=
 =?iso-8859-1?Q?fiG8UrkHlBjCTzXIjcADEmVyHpHRiZb509BJOsxPPG0gImQ3ZfNDxuo6gH?=
 =?iso-8859-1?Q?faPuMuWF1Ctb3pgILuRQufTOpmM9kw10/BGNUmd+8WLSqNb5i1nzcFLUgP?=
 =?iso-8859-1?Q?y28kJm/LT0IMOckHDnXfilwLWBFD7CPeNiHg/4BCxn1OXLzi6g87Xco8LG?=
 =?iso-8859-1?Q?f5Zh/13SffzGZ4vzgk2qmLCKVRFkCnhw60d6u9LCLlN8P6412+ppCltRgH?=
 =?iso-8859-1?Q?yXSMfQQXgs4KhoyntjtcI79SDEl9LZ/k31YFNhbrVH5Zct+Yniq7BXAgNF?=
 =?iso-8859-1?Q?lba1KeZh+MpYeDHlcPaBW0xlPh88MeXGtCEBXqB80leJ5LpMI1BLdp/F24?=
 =?iso-8859-1?Q?CklRIFQOQaGuo3OOXpvROyzxPE8gOgRDe2vgUkfkx8XknD0kUn82SXUMM4?=
 =?iso-8859-1?Q?iZ2GEiclPhwPPlAa/npv8yNQeg3pgdcCzvI9pHACCiVb+939dIH/4jCw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a59b30c-b173-4207-c682-08dc0178ea45
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:30:01.9351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ib5KzdS8SNc2SXLXPXpzf5OrPjae0+NjSmVhcoGlRJqMBCSrYsTpq3ur+Xo3lOnstRwV0JRA/iQ5ba1cyJedchCTDQ5P1yfd8trFy148Xs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>,
 Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 20, 2023 at 05:17:49PM +0100, Thomas Hellström wrote:
>
>On 12/20/23 17:13, Lucas De Marchi wrote:
>>On Wed, Dec 20, 2023 at 03:42:14PM +0100, Thomas Hellström wrote:
>>>If using the VM_BIND_OP_UNMAP_ALL without any bound vmas for the
>>>vm, we will end up dereferencin an uninitialized variable and leak a
>>
>>dereferencing
>>
>>>bo lock. Fix this.
>>>
>>>Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>>>Closes: https://lore.kernel.org/intel-xe/jrwua7ckbiozfcaodx4gg2h4taiuxs53j5zlpf3qzvyhyiyl2d@pbs3plurokrj/
>>>Suggested-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>>>Fixes: 9f232f4ae249 ("drm/xe: Port Xe to GPUVA")
>>>
>>
>>^ this newline needs to be removed so `git log --format="%(trailers)"'
>>shows everything, not only your s-o-b.
>Will fix these.
>>
>>>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
>>>1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>index 1ca917b8315c..127842656a23 100644
>>>--- a/drivers/gpu/drm/xe/xe_vm.c
>>>+++ b/drivers/gpu/drm/xe/xe_vm.c
>>>@@ -2063,9 +2063,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, 
>>>struct xe_bo *bo,
>>>        if (err)
>>>            return ERR_PTR(err);
>>>
>>>-        vm_bo = drm_gpuvm_bo_find(&vm->gpuvm, obj);
>>>-        if (!vm_bo)
>>>-            break;
>>>+        vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);
>>
>>if the issue with that we don't have any bound vmas, why are we going to
>>create a new one just to be released?
>
>The expected outcome of this operation, AFAICT is, rather than to 
>error, to create  an ops with an empty list of operations, so we could 
>in theory kmalloc ops and just initialize its list. However that would 
>be fragile and second-guessing what gpuvm does internally, so I opted 
>for this solution instead.

ok,

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Adding dri-devel and Danilo to Cc as it looks like we are the first
users of this api.

The NULL vs ptr-error between _find and _obtain looked suspicious when I
first looked, but they match the current implementation.

thanks
Lucas De Marchi

>
>/Thomas
>
>
>
>>
>>Lucas De Marchi
>>
>>>+        if (IS_ERR(vm_bo)) {
>>>+            xe_bo_unlock(bo);
>>>+            return ERR_CAST(vm_bo);
>>>+        }
>>>
>>>        ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
>>>        drm_gpuvm_bo_put(vm_bo);
>>>-- 
>>>2.42.0
>>>
