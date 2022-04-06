Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C564F58CC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5444310E82E;
	Wed,  6 Apr 2022 09:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D74410E2C4;
 Wed,  6 Apr 2022 09:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649236595; x=1680772595;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=IHGOpf1xpIVCqBD+SC9VqLqF7mjgnV+NEBchpoXIfvg=;
 b=iz2p9NYXSj/EHiwXUCGCKWj04ZZUfTkhWp8DQ+UyqfI56F5fTGk5GjVx
 A7DGHKTjMi0MIKPb6p8h8rXwB0zN2cwDGBkWseWb5NZsq4umyFNG3snwz
 h1wLYcIRsdAYKTjSKvZwu6HLMATJsfiui7ClKMo/6NBdmoMyxWu2fHRfj
 PuJ4PigMNke/2AtQrFI7H8TkqM4OwqXZr9+OHU7eOkLpq37KACbEOjDiS
 hfMEOhWToHddvM54LPRZnVzhSmWPThXc5gka/xMyhLnDU9/Hta9lndMNv
 Mow+f/vs4meCr71fdKNgtT8pwL0IEWSOMlsteE+Nb9C9MgRr0KVUQkhI8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="285962311"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; d="scan'208";a="285962311"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 02:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; d="scan'208";a="523845771"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 06 Apr 2022 02:16:34 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 6 Apr 2022 02:16:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 6 Apr 2022 02:16:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 6 Apr 2022 02:16:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkPNqh9xydc7gu2mnC2tVC2bhS3UcWD6sx+2EuHCr8FM9AUgbQ4XcTxfTXvYBpK+K2YQixPAL4kIhQgVvCSbC4z4zKs6UCSv1BfOhjfeRxlxjaOzKl0/BwrKMblr2eG5oASL+0xWXhpD7AE4ks6wHP6C2/ZEv0UfJRH7hOPW72YrwmvbUmIx93yjn3TZ2exCcmiYZeGpu8rVzXFFZht185eG/qViXus3wiZq1a2LyRl42tF7lUPX+NQ+6DGg5EXUDzCorD4x3xL/Pd/WciY7iJ20gggnhQ8ixL9mHJ3BFXRL5BIZpUzYkbD5eR5iDpfL5oPha8zIryjxtX9SwkrGng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mcrWozhsxGIUvtSR2XR8YZQiPOH03HD6GfZQWQ02yY=;
 b=NU1nKj1MHUwoPSQPP94iYjFDUUwGDWJE5k7jW799ekh33ECZhRKpFS5l7+uBix4Ur0BmSup8IymhpZPQ0xFfRXX4KI1AUa8FPgLbLYAt563E+l8dEGelyQ2SquDU6ODvzvu8bn48pzEK4ALmpZMG9cWTNSSi9tYNNINbe7coPGd07XnTtI30SlvF3ipF7YnG/RPyqrRj7WElsdcfduY2EJH3DyWny4StSdGpNvr/Gm560+4FxzI6ba4WbOqwe6dK5KqaxQHY/Sp9AwN/enuxB6xX+k2iFlirQrne2hkepKemgcCgVFoDAox5/YtXmXizTMq40eroZ0qaVnqHLjHomA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by MN2PR11MB3711.namprd11.prod.outlook.com (2603:10b6:208:fa::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 09:16:31 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::99ce:ec02:b430:2564]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::99ce:ec02:b430:2564%8]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 09:16:31 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/uc: use io memcpy functions for device memory copy
Date: Wed, 6 Apr 2022 14:48:09 +0530
Message-ID: <20220406091809.746969-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::15) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 353294ca-24a4-4173-01bc-08da17ae2362
X-MS-TrafficTypeDiagnostic: MN2PR11MB3711:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB37119654A0B1EB8D4E237FDE9FE79@MN2PR11MB3711.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: irv6WIGQ25rMN9cMiiHkG91UAETzKkdMD3JpQdhwl2BqpSdT6rIwlaiMLusmVq6qbjL3yOwbHhV7zHuDcomNXfb58C/7XPbNmeHWbmaeCTFNHc96Jaml+2GxPrqVaHG5r5sXX3H3pz1icRMoq5KsE3xui+2xLMHabKCr17VJObgoqRxCXZEqw1+XdUXTXasvUR4ngUywXf2P4VvtggyGD+oWjxjX16vCrvTKYC2n32pSDYlY0Gg/XK6YII0gVIhr0ciwQmEOpykjldKiyL+JYzh/xttTBiNV8iAWMiGPqyTw0ve7qXhQlO6w+9Z2uOly1HkIWbJJgnR9euznH50e2a94curpgEfqTw3j8TZRCQBUffRmhukI/hHAkc6Y+Q9ntUsfaTthSnCytun69Etv5zyhQ/HA6RDHtEZV0hb7ds7etmV9FTXd4ioWLW7c8Hdg8ctvaOjcD0I308V1wfZjaOBDqi81dHiJP/7yCTg39Wlb1UhKDgc2oLYdIA7ps/hbOiNttHzoSpAS9vypES9v5RqiJfzfVJjEEQBZ108qU1oPc1KEdq6bdIINp3ddnQytmEMmWrHGNMyYQnTbIr9UIW0fEDMXL0tXJ3a07TuFWb3UY1pe2/LQ2n+dCrSJ/VyKkBpGv43l+0wO0dDjThkm6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(8936002)(36756003)(6486002)(2906002)(2616005)(66556008)(5660300002)(8676002)(4326008)(107886003)(44832011)(6666004)(316002)(1076003)(66946007)(66476007)(186003)(26005)(82960400001)(450100002)(6512007)(38100700002)(86362001)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iqK9FvLXUEMW+guerKOtJYF0r+auOxQ46rHVt7a0lsSvgLFfHHScSUERdloG?=
 =?us-ascii?Q?QQFPNWhuMpkidEiBn7Zj3l2jDGWzbKgVg6nrekwTdyYX6LnPeEu8Wvehe9TJ?=
 =?us-ascii?Q?KvMT9RN8ggZw2v6GoGmFy8EXF0PC0ZMm6uutgLmNujtQ+yoI3OnXCnDXaBCz?=
 =?us-ascii?Q?xwcEkw91hRvROs6OyT7iMmIFzi5lTv+MxD/7HPr0Kik+eMNLwdntE4eius9x?=
 =?us-ascii?Q?Va7HlJOJND8DCzfrcnkz8Bb7+MQmLWQNKLWi58du7Z3R1BcJLIlCDjCFzNrR?=
 =?us-ascii?Q?SZwimWyeXLz/6zC+ulZn52mTQarK0EuvZQpeIaUmkE2eG/T58h6vZ/qn7KAU?=
 =?us-ascii?Q?L7ox4FQ/ak20nLYEvu3x5Q7aDKo1B5x9uEcGHjXcRZAZxISxBAHz+p0l6EKz?=
 =?us-ascii?Q?k01REoOhmCSChrRC89E1DUpKhg4CddBv2ZR3SmhPOeXZ6jA+6lDFeZBIDnZU?=
 =?us-ascii?Q?LLsclAHLWWjtqfuNFkMT+99JkKA5mtQjUi89WNdB3nBR9mI6z9NARJ8HzsJ3?=
 =?us-ascii?Q?+Y0a56ZaT2a4oZ05iMUduc+FTD9eumsfjVay46stpHMBQC1hyOMzecUxyLDR?=
 =?us-ascii?Q?OcZcy4YOmUSeaNOyVpIxexaR0mUUpnNnOCDYmKNKK1H6t4DXHF0bD4WOLLwy?=
 =?us-ascii?Q?Qb+yqAYxx4PEZxRofe1Mcw8EjI1SwVqk/sJNvy0bi2LruYZ290YtJJlyscLq?=
 =?us-ascii?Q?CDQ65UOpIMhhEqU7gyvLwJY5fBSMd6AQw0B0vf6w4iu22/wlJEAYreRPPkTZ?=
 =?us-ascii?Q?JEHgcK5SU5zxBXSvzKGLm5oh+O3wIDSACRmu5JDzviabbH/fcdmkd4Ybh0dA?=
 =?us-ascii?Q?uSx9eDBGxG9SiZTCPaDs5IiWWu1hn/PaA+c2vHbRTRywF6K6rU7qt43s6P7k?=
 =?us-ascii?Q?n13uHN60agROEoCrzvirA3fRm7/9Q+ce8fq5jNdp0mroDWhlGkoNtCLGGhtA?=
 =?us-ascii?Q?85rOVTt5D2UNDrrB9zcH/qv32ZYmsfVhmyGpla+3O37Jsljwt5/5GAJdiIt5?=
 =?us-ascii?Q?x67Xt/JGHrBWM6SQcNd1JMBusnwt9cdUD+kwoWCbHjRWTQmsMHrYeVyuufIH?=
 =?us-ascii?Q?v+GCFECI7zDIliCulad1qk7U0RmhoYMnmuj/ZZc2dbriYkVVbbvhMNwGm+Zz?=
 =?us-ascii?Q?7QCYhPijZF3qWhvgJb7pez6PMaTZB/YEkhguKpl9dPjipQwn/tK9vAyL+lGe?=
 =?us-ascii?Q?OPpG4nDFu8SHyDSohnhbsw6LkeyOihf0CxXMywChQJ2kssASap8EeClcoSg5?=
 =?us-ascii?Q?Db8hBIUp1eYAS4tVwn3YQxs5Yce7VGFze5eJH383dG8I10tIHJc2oo05DKH1?=
 =?us-ascii?Q?b24NPbPexE3kcpBejyZU0uQGLx2y/t+sm/UAMgUptisfU4dIRL7lLfwGQSOj?=
 =?us-ascii?Q?CrZO1ihRt/xHMXcL521RoDmBVbIjSWQAebkECF0FMyfj6Ip68nCnv872Okwy?=
 =?us-ascii?Q?eHnwnE+B+zXX4qmm/k+PG0qQK2uKZcK0mRKjs59lB2RSHSolG9YXEEuWwUQN?=
 =?us-ascii?Q?o6+/NJ9sIK4pv05XL5TNAqTgZTLEB/QYkKfRV5TUL022QeoB7aFqukg/tSBa?=
 =?us-ascii?Q?kVvY/c4dNmYoKKQArZiA1MlTCFkuKM52/T/JSjRYF8S0xL7nL69wETmGQxNs?=
 =?us-ascii?Q?eeCCJqp1VLlmmemcRXgvz2KaCnUfQ/YyNgix1we26c30aPoOgUH3rSmM5Fdu?=
 =?us-ascii?Q?T+p5C9570p3Yr8Gc6IVxx8U3VVpOQSoEftJYG3a6VHqJgyAlajW+4HXLg3tf?=
 =?us-ascii?Q?tvquHXjUvi7SweonKO9+kpB4+kUF0pwRjBcOsYrxZGr20P6q45Cu9yVADioR?=
X-MS-Exchange-AntiSpam-MessageData-1: 9zE/s1ZmsZV8Ug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 353294ca-24a4-4173-01bc-08da17ae2362
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 09:16:31.3751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vczgZCaSHH9n/8RJe5isGlzn9W+QxCNSz39McfGo2qOar+vMmnIKlxkxoMc+YeZuh6W3qPaXBscJEcj3lnqClCrzt7RKqVl59BSsH1mOExRVr6hAThrmw6nIMIPAMe39
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3711
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 lucas.demarchi@intel.com, siva.mullati@intel.com,
 daniele.ceraolospurio@intel.com, John.C.Harrison@Intel.com,
 michal.wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When copying RSA use io memcpy functions if the destination address
contains a GPU local memory address. Considering even the source
address can be on local memory, a bounce buffer is used to copy from io
to io.
The intention of this patch is to make i915 portable outside x86 mainly
on ARM64.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index bb864655c495..06d30670e15c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -589,7 +589,7 @@ static int uc_fw_rsa_data_create(struct intel_uc_fw *uc_fw)
 	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
 	struct i915_vma *vma;
 	size_t copied;
-	void *vaddr;
+	void *vaddr, *bounce;
 	int err;
 
 	err = i915_inject_probe_error(gt->i915, -ENXIO);
@@ -621,7 +621,26 @@ static int uc_fw_rsa_data_create(struct intel_uc_fw *uc_fw)
 		goto unpin_out;
 	}
 
-	copied = intel_uc_fw_copy_rsa(uc_fw, vaddr, vma->size);
+	if (i915_gem_object_is_lmem(vma->obj)) {
+		/* When vma is allocated from the GPU local memmory, it means
+		 * the destination address contains an io memory and we need to
+		 * use memcpy function for io memory for copying, to ensure
+		 * i915 portability outside x86. It is most likely the RSA will
+		 * also be on local memory and so the source of copy will also
+		 * be an io address. Since we cannot directly copy from io to
+		 * io, we use a bounce buffer to copy.
+		 */
+		copied = 0;
+		bounce = kmalloc(vma->size, GFP_KERNEL);
+		if (likely(bounce)) {
+			copied = intel_uc_fw_copy_rsa(uc_fw, bounce, vma->size);
+			memcpy_toio((void __iomem *)vaddr, bounce, copied);
+			kfree(bounce);
+		}
+	} else {
+		copied = intel_uc_fw_copy_rsa(uc_fw, vaddr, vma->size);
+	}
+
 	i915_gem_object_unpin_map(vma->obj);
 
 	if (copied < uc_fw->rsa_size) {
-- 
2.25.1

