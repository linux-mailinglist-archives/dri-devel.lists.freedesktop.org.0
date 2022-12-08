Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 919F6647116
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 14:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6341E10E4A6;
	Thu,  8 Dec 2022 13:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BDE10E4A5;
 Thu,  8 Dec 2022 13:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670507681; x=1702043681;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wUNO2tU4pv522wEjI96DYcij3s7H3QOBVjaqYouaGAY=;
 b=hqjhCVvpg/U0b7a05FsKrMaPopzP8S0ELcTLKpEwB7J2IQUMRxDUqupc
 x9lhFnoOs9kZHKv2KwkwXhvEfZUARfbTfejwi2oC9VngFl1GNUeGFSvYN
 nEsW9oICw1lL44I63ZIcGLTd/sHp3VJkP8++QXocBQiAvX7U6Ltkt6NM5
 np6RzaADjgZWGNCcg4zfcFUa+diXaKtXl6rMgvjZPjRfdZMekSRV3cTRd
 SKxH2dI4BJiQHp7h98uHowHNRJqMTWKpELTngUOloz1vDbJbgpfuDtuue
 t2jUzlCSGFb75PX86GnegcaSMOIgj6GMZhzl17twb5wa2WI8pi9hWNygq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="379335687"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="379335687"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 05:54:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="892233963"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="892233963"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2022 05:54:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 8 Dec 2022 05:54:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 8 Dec 2022 05:54:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 8 Dec 2022 05:54:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kM31Wn5jDlbPXnTx+gkFbKZK4z4DU3yaomh6R+XQhu7IXr6s1GG+qQ8hdmc4pGXzNQk/rc6dDHMxaJi6NW237SeMhd8tg6A75kgEwM+fFUWklZP/fTGism6CLl5F4wwZSF1ZYVfbUhZp8f7hKe2UsqDQQneKjtdDzZ1ZLOwqkWP96AM67dD7QugWJg8n4YZKv8/i1dlyLtvNdH8cWIKiO10egjfV2bsBWCU69QgMCmtFngMkHUjZpmPaf2KmOIEUpr86KzwlRJ+IDCjC/Sfe8OKvYlQEoRpf/EwMC920aff+RKUuazORV8F7mGZ2bL1IuDQnEWkZk7ZQgAQD5vz5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C15lc5W6GYdzUjBqzOGgjn3N5xoeQRxl/hm4r6jn+Lw=;
 b=eD/LzgwFiCkeDoVMnEX5IpEonL+U5a6eVJ/eF7a9zBwIHJ+eB2HWU1XfzCw5ED17bVLJqGQFgQ8kPl/ijgwsTN+4uQvqb4f5K/P22cQSRlc/W0yo/w8wrDg7RJrFUt8TfHlv22RppBTy4yBUs+AK9ZkniQIigYeykaadPhtntjsbHAFTADP9sI3XZ5Y6kxT8bnXWRi4Lvx5SeikfwklHyBgz0BTW3ngxkZ3YLNozeLVHEERVTS+FyM0j8s9R6bGMH0pKK/+A8lnERlB6OwsFyMmCh/8i6Cp7pZ50idrh5+subo/mOECzSAqzYVARU+Vark5qDQUXd581m2YmmvGLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 13:54:32 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::8d82:960d:f964:f337]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::8d82:960d:f964:f337%8]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 13:54:32 +0000
Date: Thu, 8 Dec 2022 05:54:29 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH v8 22/22] drm/i915/vm_bind: Support capture
 of persistent mappings
Message-ID: <Y5HslUhqBu86EFgh@nvishwa1-DESK>
References: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
 <20221129072635.847-23-niranjana.vishwanathapura@intel.com>
 <dbbd19e4-4354-bd11-a68d-435f59150fc8@intel.com>
 <Y4jH4297KUGrYTr6@nvishwa1-DESK> <Y4j1w8KoN9ASjJxu@nvishwa1-DESK>
 <c2346df8-87b3-586f-a4d2-b4c70e08e66b@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2346df8-87b3-586f-a4d2-b4c70e08e66b@intel.com>
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA2PR11MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 1efcd2ea-afe1-4011-6861-08dad923bb92
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RWbbB9kIK9koAvNAiszif4XjF9XOlF6ELwxpIqCeah/W2p1lHr8FzmMrIAWBH2tkfr8JFWuDyRZCmdVI8XCnSvTJG0cf2bo+BxqB/NjfvtBZfnWJDF5BxM4tuFIranj4S6UKhGnTa+7iF2kxRHdg10PUTR4OS2ppS9p5zlqeHWuV+8ACSt1Dx7JRZ+mYQZ4PrZKUmc8LbbMu+LpfYQ6zAfjbT7ZjTbfzwwfAug4qPbg+isV5kGyAOP8QTAbTwEgwUYt4n0bfZA6sXK2llhIKhPolOXunnZ1BweImjfpMeVayhM9XNZ0QqMiNNFWw8FwUWf5vS8Glnt5mNOriB2AYEqJLrvbsVGbL9jCOs8onVVMPRWu9JRDJ6t4AxMFp+jEeMnR1oRfd5560yLu2Wjeq/6s3FJGnpDfRpum7Ec8sgNZcQJk7Em3DYmR/Eqn1fclmt1OR2IKTtNF5F+zJhkYf2veUg16JrpB2gz075mVab8nVElu6moMfqR5DGqj5EXny7DqF7RZFKXjgDzoRGfQMtz2FMOhn/2sVnPM305hv5JH9gMAvNFpPZaGK12kTIi9W+veSo6rzlUA/RLiZFDLhar278B+BzG0r4/dI9RQTg5ivy5mdVJ3PDwXzz515l3sPoEM1VL7tCSaMQxXu22xAUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(66556008)(186003)(86362001)(41300700001)(4326008)(5660300002)(8676002)(8936002)(66476007)(316002)(6636002)(6666004)(6486002)(6506007)(478600001)(82960400001)(6862004)(38100700002)(9686003)(26005)(33716001)(66946007)(6512007)(44832011)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BtmUb73tQa78KL/rDEIyIwxwIRjAxPKPyvThlboCluDIFAE5IY0oX4LZth?=
 =?iso-8859-1?Q?vfADDke5OrWekGhq3Z5D2C7cyG9k655aVwC0rvSMmxU2mWSpwL1p/RO9Ok?=
 =?iso-8859-1?Q?+09W0OKXLALYNWBQfYbj8fK9XBZhmz4mQHA761ZFsmFxFeDjGhXVegZC6S?=
 =?iso-8859-1?Q?RgUU1O4S1OqwN2RZ94l+CCP0noshqRpi00eN/VXBBUg7oJHi5kWbIybXHj?=
 =?iso-8859-1?Q?jUrSewKCm6folo1fFJmGul+y3f40D69LNO6TZBIypUfDZ/LILg1C+gIieo?=
 =?iso-8859-1?Q?YqvpYeEU/KUDEEtMqPCh4W5Qve4J+iOZ5pOyO2vtloDjT7a413tNo8npsD?=
 =?iso-8859-1?Q?bEkIO7XjU3lLgVJ1dXVMa5HZfNSJEePdzzOXUR33v4Pp/VBrCZQGSnJnRL?=
 =?iso-8859-1?Q?/gdicD7djySLrh22KG8lHijopgs0510zS2TagIQ9zJfxkugwro8WaDNllZ?=
 =?iso-8859-1?Q?PFDwcaY06Yu8931mB+/T9bVWLtCEuZwXt0kJUlx6VBAjSVDdkEXu9akdgU?=
 =?iso-8859-1?Q?j20FuYRxXk4kC4jWIDTOETF7XuEYZcARhYOz/+Z+oyrLHnOAHAJhgsgeYn?=
 =?iso-8859-1?Q?BWzOe2gJIUjfMv9mvshjctLXMDcegU4YXMhuLKVJLMRAXFXigpkj3s8wqo?=
 =?iso-8859-1?Q?Zo2tyhR8ft7fJqaMWSS5Tcgv8uhAMF/mKlkGI0+2Y1yfawLB/AbDp4Nmnh?=
 =?iso-8859-1?Q?4KPs412lHQNZG9QpsQmqSUX94ZqUgkzsjiYc42nWT/NKZhYUGL/jSm6dBA?=
 =?iso-8859-1?Q?4530eP5llibFFe2oUv5ToaXOE4WJ1T2sbtPDZb4iT/an4Dae7qgaFgp42f?=
 =?iso-8859-1?Q?o8O2lBWJnDZ49/BAxPDqV1s5T1Rnohgu+2RpdZlYccx7kZjADiGDdYfC+Z?=
 =?iso-8859-1?Q?sn/0+LkO9LESKwIgK0MJt9q4T/CRok71306JUXLZ57No0mHwOkoUUCVKi7?=
 =?iso-8859-1?Q?q0BT/PJBYVgLEBCkyqklZeAM9k+DJYG8Xh0l1a9LuLSNG8i+qf+7O75aet?=
 =?iso-8859-1?Q?+yctordZGGC86w8RXAH60xsj+PaYlUavtgqwmKhPVhJPkzvunVl4iyay/C?=
 =?iso-8859-1?Q?sDdCj4oiREN1/npAUOK7Z5oAo3gIjUcwajBS/8YO3Jn91fGXMJMWSs+Xf7?=
 =?iso-8859-1?Q?aAx+ov77FJ+RMXpknPR0/Nz2ES8VzLdPnvTN5e1V46XwCp9Z7q70ab7xrq?=
 =?iso-8859-1?Q?LIS0t/VLUTC+aHU7PzN5MdNO+oQvODOxj4iZMaMdsDZQDInu1kCHdjoABn?=
 =?iso-8859-1?Q?5ml1QBjJFOn+q6qenzmhSg/0eef1hPWCBXtewCvqkuRTuPoMLTaUfDqjHB?=
 =?iso-8859-1?Q?g14fPIhowYc44KxRd95O9udYXNyiqdIqcY5CxOiPcdSI1JLLv+WRAEt/uw?=
 =?iso-8859-1?Q?R2samn9avEa2Rmrzvu/gziOR7MIoZZItjAZCNp024KxWYOJZDsocLvn7vW?=
 =?iso-8859-1?Q?MqGiA9VvIbUwmYfoITlKICrJcO3tVbFbWbbqVUferznIFKg+ibe/wZEAfQ?=
 =?iso-8859-1?Q?3eiz3vZvA7/PBM9Df9Iwjzl9YDPzWHz1yjt0PtDMCNrsz7HTz1PjI7YlNG?=
 =?iso-8859-1?Q?FyHI6MOwHCT3R7OSZdaTzI4qVcSaMHw4nXMrbPBRfWtkc1MhPHkVzTrGWu?=
 =?iso-8859-1?Q?1X096qvjwHTClX2BG/x+ukp7HSfn6GySWjjTVYvynQc7ROGo/OnR/pus7x?=
 =?iso-8859-1?Q?SrRLavQ3D0ayYYSJbsk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1efcd2ea-afe1-4011-6861-08dad923bb92
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 13:54:32.2707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6yECFas0Q5Qz07yB3wYjtvq22WJtl6vn3yx9UyYqEuJDdZ4ZmiHUDd0I33ImDHeDj1XumKvb1q6EUSy19cPKpm1SNSX6WEDbdVWu+OgK/pZEhx6q0lqG+MRmQ0sk9ZS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
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
Cc: paulo.r.zanoni@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 06, 2022 at 05:40:54PM +0000, Matthew Auld wrote:
>On 01/12/2022 18:43, Niranjana Vishwanathapura wrote:
>>On Thu, Dec 01, 2022 at 07:27:31AM -0800, Niranjana Vishwanathapura wrote:
>>>On Thu, Dec 01, 2022 at 10:49:15AM +0000, Matthew Auld wrote:
>>>>On 29/11/2022 07:26, Niranjana Vishwanathapura wrote:
>>>>>Support dump capture of persistent mappings upon user request.
>>>>>
>>>>>Signed-off-by: Brian Welty <brian.welty@intel.com>
>>>>>Signed-off-by: Niranjana Vishwanathapura 
>>>>><niranjana.vishwanathapura@intel.com>
>>>>>---
>>>>>.../drm/i915/gem/i915_gem_vm_bind_object.c    | 11 +++++++++++
>>>>>drivers/gpu/drm/i915/gt/intel_gtt.c           |  3 +++
>>>>>drivers/gpu/drm/i915/gt/intel_gtt.h           |  5 +++++
>>>>>drivers/gpu/drm/i915/i915_gpu_error.c         | 19 +++++++++++++++++++
>>>>>drivers/gpu/drm/i915/i915_vma.c               |  1 +
>>>>>drivers/gpu/drm/i915/i915_vma_types.h         |  2 ++
>>>>>include/uapi/drm/i915_drm.h                   |  3 ++-
>>>>>7 files changed, 43 insertions(+), 1 deletion(-)
>>>>>
>>>>>diff --git 
>>>>>a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c 
>>>>>b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>index 78e7c0642c5f..50969613daf6 100644
>>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>@@ -88,6 +88,11 @@ static void i915_gem_vm_bind_remove(struct 
>>>>>i915_vma *vma, bool release_obj)
>>>>>{
>>>>>    lockdep_assert_held(&vma->vm->vm_bind_lock);
>>>>>+    spin_lock(&vma->vm->vm_capture_lock);
>>>>>+    if (!list_empty(&vma->vm_capture_link))
>>>>>+        list_del_init(&vma->vm_capture_link);
>>>>>+    spin_unlock(&vma->vm->vm_capture_lock);
>>>>>+
>>>>>    spin_lock(&vma->vm->vm_rebind_lock);
>>>>>    if (!list_empty(&vma->vm_rebind_link))
>>>>>        list_del_init(&vma->vm_rebind_link);
>>>>>@@ -357,6 +362,12 @@ static int i915_gem_vm_bind_obj(struct 
>>>>>i915_address_space *vm,
>>>>>                continue;
>>>>>        }
>>>>>+        if (va->flags & I915_GEM_VM_BIND_CAPTURE) {
>>>>>+            spin_lock(&vm->vm_capture_lock);
>>>>>+            list_add_tail(&vma->vm_capture_link, 
>>>>>&vm->vm_capture_list);
>>>>>+            spin_unlock(&vm->vm_capture_lock);
>>>>>+        }
>>>>>+
>>>>>        list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>>>>        i915_vm_bind_it_insert(vma, &vm->va);
>>>>>        if (!obj->priv_root)
>>>>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c 
>>>>>b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>>>>index ebf6830574a0..bdabe13fc30e 100644
>>>>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>>>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>>>>@@ -297,6 +297,9 @@ void i915_address_space_init(struct 
>>>>>i915_address_space *vm, int subclass)
>>>>>    spin_lock_init(&vm->vm_rebind_lock);
>>>>>    spin_lock_init(&vm->userptr_invalidated_lock);
>>>>>    INIT_LIST_HEAD(&vm->userptr_invalidated_list);
>>>>>+
>>>>>+    INIT_LIST_HEAD(&vm->vm_capture_list);
>>>>>+    spin_lock_init(&vm->vm_capture_lock);
>>>>>}
>>>>>void *__px_vaddr(struct drm_i915_gem_object *p)
>>>>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h 
>>>>>b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>>>index 87e5b6568a00..8e4ddd073348 100644
>>>>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>>>@@ -281,6 +281,11 @@ struct i915_address_space {
>>>>>    /** @root_obj: root object for dma-resv sharing by private 
>>>>>objects */
>>>>>    struct drm_i915_gem_object *root_obj;
>>>>>+    /* @vm_capture_list: list of vm captures */
>>>>>+    struct list_head vm_capture_list;
>>>>>+    /* @vm_capture_lock: protects vm_capture_list */
>>>>>+    spinlock_t vm_capture_lock;
>>>>>+
>>>>>    /* Global GTT */
>>>>>    bool is_ggtt:1;
>>>>>diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>>>>>b/drivers/gpu/drm/i915/i915_gpu_error.c
>>>>>index 9d5d5a397b64..3b2b12a739f7 100644
>>>>>--- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>>>>+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>>>>@@ -1460,6 +1460,22 @@ capture_vma(struct 
>>>>>intel_engine_capture_vma *next,
>>>>>    return next;
>>>>>}
>>>>>+static struct intel_engine_capture_vma *
>>>>>+capture_user_vm(struct intel_engine_capture_vma *capture,
>>>>>+        struct i915_address_space *vm, gfp_t gfp)
>>>>>+{
>>>>>+    struct i915_vma *vma;
>>>>>+
>>>>>+    spin_lock(&vm->vm_capture_lock);
>>>>
>>>>Does it make sense to move this into the eb3 submission stage, 
>>>>like we do for eb2? IIRC the gfp flags here are quite limiting 
>>>>due to potentially being in a fence critical section. If we can 
>>>>use rq->capture_list for eb3, we shouldn't need to change much 
>>>>here?
>>>>
>>>
>>>But that will add latency on submission path as we will have to iterate
>>>over capture_list in each submission. Besides, unlike eb2 case, we can't
>>>just transfer the list to rq->capture_list as we will have to do this
>>>for each submission. It was discussed long time back and decided not to
>>>bother the fast path (submision) scenario with this error capture which
>>>is only required upon gpu hang (slow path).
>
>Maybe add some of this to the commit message, just to give a bit more 
>back story/history. From my pov I'm coming into this semi-blind.
>

Ok, will add.

>>>
>>>>Also there is the existing CONFIG_DRM_I915_CAPTURE_ERROR. Should 
>>>>we take that into account?
>>>>
>>>
>>>Ok, will fix.
>>>
>>>>>+    /* vma->resource must be valid here as persistent vmas 
>>>>>are bound */
>>>>>+    list_for_each_entry(vma, &vm->vm_capture_list, vm_capture_link)
>>>>>+        capture = capture_vma_snapshot(capture, vma->resource,
>>>>>+                           gfp, "user");
>>>>>+    spin_unlock(&vm->vm_capture_lock);
>>>>>+
>>>>>+    return capture;
>>>>>+}
>>>>>+
>>>>>static struct intel_engine_capture_vma *
>>>>>capture_user(struct intel_engine_capture_vma *capture,
>>>>>         const struct i915_request *rq,
>>>>>@@ -1471,6 +1487,9 @@ capture_user(struct 
>>>>>intel_engine_capture_vma *capture,
>>>>>        capture = capture_vma_snapshot(capture, c->vma_res, gfp,
>>>>>                           "user");
>>>>>+    capture = capture_user_vm(capture, rq->context->vm,
>>>>>+                  GFP_NOWAIT | __GFP_NOWARN);
>>>>
>>>>And this should maybe use the passed in gfp?
>>>>
>>>
>>>Ok, will fix
>>>
>>
>>Acutally in one path (capture_engine), it is called with non-blocking gfp,
>>in other path (execlists_capture_work), it is called with blocking gfp.
>>I chose to override it here as we use spinlock (vm_capture_lock) and we
>>are using MAYFAIL version in somepaths anyhow.I can add documentation
>>for this override here. We can switch to a mutex here (instead of spinlock)
>>for vm_capture_lock, but not sure it is worth it or if in anyway we endup
>>here with atomic context. What do you think?
>
>No strong opinion. Keeping the existing gfp looks like the least 
>amount of friction, if possible.
>

Ok, will use a mutex instead of spinlock and use the specified gfp.

Thanks,
Niranjana

>>
>>Thanks,
>>Niranjana
>>
>>>>>+
>>>>>    return capture;
>>>>>}
>>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>>>>b/drivers/gpu/drm/i915/i915_vma.c
>>>>>index 68a9ac77b4f2..0244864e94f7 100644
>>>>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>>>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>>@@ -248,6 +248,7 @@ vma_create(struct drm_i915_gem_object *obj,
>>>>>    INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
>>>>>    INIT_LIST_HEAD(&vma->vm_rebind_link);
>>>>>    INIT_LIST_HEAD(&vma->userptr_invalidated_link);
>>>>>+    INIT_LIST_HEAD(&vma->vm_capture_link);
>>>>>    return vma;
>>>>>err_unlock:
>>>>>diff --git a/drivers/gpu/drm/i915/i915_vma_types.h 
>>>>>b/drivers/gpu/drm/i915/i915_vma_types.h
>>>>>index 90471dc0b235..10ae9f739d57 100644
>>>>>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>>>>>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>>>>>@@ -309,6 +309,8 @@ struct i915_vma {
>>>>>    struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>>>>>    /** @userptr_invalidated_link: link to the 
>>>>>vm->userptr_invalidated_list */
>>>>>    struct list_head userptr_invalidated_link;
>>>>>+    /* @vm_capture_link: link to the captureable VMA list */
>>>>>+    struct list_head vm_capture_link;
>>>>>    /** Timeline fence for vm_bind completion notification */
>>>>>    struct {
>>>>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>>>index b9167f950327..0744651ad5b0 100644
>>>>>--- a/include/uapi/drm/i915_drm.h
>>>>>+++ b/include/uapi/drm/i915_drm.h
>>>>>@@ -3930,7 +3930,8 @@ struct drm_i915_gem_vm_bind {
>>>>>     * Note that @fence carries its own flags.
>>>>>     */
>>>>>    __u64 flags;
>>>>>-#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS (~0ull)
>>>>>+#define I915_GEM_VM_BIND_CAPTURE           (1 << 0)
>>>>
>>>>1ull << 0
>>>>
>>>>Worried about what the value of UNKNOWN_FLAGS might be 
>>>>otherwise? Also needs some kernel-doc.
>>>>
>>>
>>>Ok, will fix and add kernel-doc.
>>>
>>>Thanks,
>>>Niranjana
>>>
>>>>>+#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS   
>>>>>(-(I915_GEM_VM_BIND_CAPTURE << 1))
>>>>>    /** @rsvd: Reserved, MBZ */
>>>>>    __u64 rsvd[2];
