Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870C24AC4F1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1FB10E276;
	Mon,  7 Feb 2022 16:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13E310E276;
 Mon,  7 Feb 2022 16:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644250330; x=1675786330;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=vwbxRDaNfC5XEnUvJvmg69Pdo7Bh1AhztIDjBXWYzHs=;
 b=nc1fzGgf9BmhDX3DQmF2FH2aFXYxQ1jNH72RTsfFcWwGk1j9x8ideStA
 yixzMdPnOun1ly8r/89pr4ej5JUbYbj4Capuo7smCgwbUUnRA8Hdoe4Iu
 c86t8PW5tiTx6xdo0KFXdFKiC5GYwy5dvUxOpUE1aHWpaj5Xa9ljpFaPo
 SWZCNoN0POYT9tN+giDxMs33ejR6inpiVZTf8rCRQYZZlwvbTuSaxhJtc
 tZOmvMLW4zQ874wzpy1eS750x1IAkBoaH8LgexW9ZtUd8TWVl5T0R6FUt
 WmRedjeTYLhbjeRNy+9TVs+lkAY/MYoz5I/OOFOje1xixHolwXz2ewI2e g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="312044033"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="312044033"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 08:12:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="584876668"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga008.fm.intel.com with ESMTP; 07 Feb 2022 08:12:09 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 08:12:09 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 7 Feb 2022 08:12:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 7 Feb 2022 08:12:08 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 7 Feb 2022 08:12:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEs+blz11tSPsvtudMegp/68064TLJctHy988hS3/cy/T55U7qdzeTTpcruBKzmB+XXFS+TyeAzdrJdL6c1eRyaX6KKd56KWFPGDGdJCjHHuKkYiiB6uEvoLw+R5v/+410OqSxzRgAVw6XM8FvFDhCyruH0zz1QYiu0XOIFo+7lsb/Lt+68FK/1qdfKg+Q6fZLZo+vutUCu+wN3QghTU3nChNYxjJ8pzewTyRR27qNLhCZAAluFojU+Xf1O3eWbneoo2zEN7/PFdnr/6U/dVGKE1lbGLiz9iukDmMLsNZHS+Z9FIwuMVFHvHgCyhEA4SiEeQ8IReZszTMFTtwVA6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvrrTky5DcR0KAPlHKgNZP1YkHAxmgj9XPfLPSXWXR4=;
 b=Q8Hbs4srVoxQYlp1owINQTp+ew79MeuN2NJ+Licp+/kpjFdMAqXdwQd6UsBQ4FwkqCXi5uWtOWEh1QGTBEUGO5PxTwZSnC1IvQghpHF2zTAWMv+UXlIyaBrQOo3aoBO2cIqSjUOoH7nd4KoIFNa8voLfSwwpqbutRTEML/LLPESa1bLEFm1G468ntCXrAlo0Wl4lBZS9/rLYdUo+qIy2O6GdCgEMtdJ22WY9W0tuzJWXuZC8MznsRM9c00Ub3oSZliccs7wlGi/m+yvere36gwX3GeCbHvh9DgmcgDAcgVG1fbQbhZH231OsPM9Ell2zVDQebuk5t4EgM0J5wzFiNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by BYAPR11MB2853.namprd11.prod.outlook.com (2603:10b6:a02:c8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Mon, 7 Feb
 2022 16:12:05 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::4c25:af8f:60a8:3992]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::4c25:af8f:60a8:3992%6]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 16:12:05 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/1] Add fallback inside memcpy_from_wc functions
Date: Mon, 7 Feb 2022 21:43:07 +0530
Message-ID: <20220207161308.447676-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::27) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c18e95b-e7dc-45c6-3794-08d9ea549547
X-MS-TrafficTypeDiagnostic: BYAPR11MB2853:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB2853FBB13ABC9AE1337AFBF59F2C9@BYAPR11MB2853.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4O9JcW2mtU1ZWa1H8yQu9PTcExSy/2BxqvMBwoJ7vPZxDyC9B+w6ep9gfNnWgcis06jBtNd5JsIxHji51v3sRpbbeDq7vNeA1jRa86WJftnxLtVi4ItEc8bTbBOMcRkmY1Ua/fnond+VrpLy+nkZXzzmWIHu2jR9YuEL2k321LDhRzU4dHZ+PBetWsbTPt/nG1Xbywe74NbmAYDmlMe4B7hNKTt9yfe6ZM4wEoKM4SnE+EUv+WYdK5J1LMHoaH7boLfC//23Wi4AbGvIQpJuFeg3HTv4wDejjDhfrk/5h7qyOzknMORsD8anVBv5KOkx8wme1rCS7V9Xo7UALmT52WHC5E628sFPDm/oJDZFfNlipJBWeAj35PHI2BSuB5bWbQAsAOi0TyJhsZtOfqHH5xXgL8lNwPyHcwWUz8BNA+DwFghqEFryljNaPKqZt5NBS9U28ZcEb7sj3h9RTU8WP1DRWqvmt4KWQ4U/7an3m4DXrR6Sf0+BfUeul06APusassi9gYMUSmuKSSWbD+nbOsru7f2wKj/6nsVNqj5lgkw+bhFtpi4ujw81Obsa+nBDat6rorAIMfi0nO0sxrc7Geh32bIhxar5MeIkVlataOwjHlf7L25ZjqSfta6vQsplK878toRzUT8JAYXztkiFFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(82960400001)(8936002)(83380400001)(4326008)(66556008)(450100002)(107886003)(66476007)(8676002)(36756003)(1076003)(508600001)(26005)(6486002)(38100700002)(6506007)(86362001)(44832011)(6512007)(5660300002)(4744005)(2906002)(66946007)(316002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zMMyMke0syOT1Vwm8R80Av18oOpmJtuh65Nf6YGrBQLTvhBqxA+nyq7VUc7r?=
 =?us-ascii?Q?RvoXb3H3+oyzHGsrDACL5fkvfqrlmbafOj2RtJmIonj/WXrFLxx107Nt0T3X?=
 =?us-ascii?Q?uPwSB3Of5WBcSEJooyq02rMHPhXi5I747cpSeD1pIzpzlDepqhn6SKuxn2Qr?=
 =?us-ascii?Q?P/dSAkJy11EpqUTUMMFBfqmkh/bVsWei8+yUJ/4M/fFty41o4lFVCOy05MAu?=
 =?us-ascii?Q?BqDc962dIIgqozGp6PoA2fLaXqDtYjnbRXrpdVcb6PlJoDsSMlQvFZc6L+ny?=
 =?us-ascii?Q?NucI44Wpuox/rp9cVJfzh5RM+ugROZmzPRSPwmO8DlVq95Qr8F5NoPAXyXvN?=
 =?us-ascii?Q?Ti3arZ8OZ9zs0QaH244is0A9xa3X8zgRfgeSMeprJU3Db66ATVClJ+GTyEP0?=
 =?us-ascii?Q?Pxt6L0ExZdQ9HDXInvYb4Ki/nud/kKv/dS+58c72XhxNkXu2eukZGhThi7jz?=
 =?us-ascii?Q?i/4hn7KmSaX+6jIbBWAHlGvXl6JBrVWl/46YdCrnetRmGe1isUPpYUX2mGZY?=
 =?us-ascii?Q?chhxn6u6Qu8M/4sDYYgnhjDBihTYK241panSAhphk8sPL6KiCK2as6cGfz64?=
 =?us-ascii?Q?otITQz5RLpqobsMEQGltUGqv4bXOT7MMSPL9PcW4aBmn5tngYCjAEjYdYbE5?=
 =?us-ascii?Q?KM7kCU9h+P9E3W8QrUMWNnH0E81H0BaqXnNQCABx9kVSBFDr4iEZ7I+Qh6e0?=
 =?us-ascii?Q?eDC8mjAYUowP2MkSWUH2dLRHrA3gt3zKf2V6Fa9dEJyaGMsBkJASI+DPwMOg?=
 =?us-ascii?Q?9Tfnrr3zF3+eDUvFvyBCPABqUkTia+j/vfwRiTQB4ULRmOL/ippS7b767n2t?=
 =?us-ascii?Q?8KEvx1JvFG9xQqc/IO4a1hfB807lIbOPQceLpAlUKc9dlVoEPApsn8nQsOj9?=
 =?us-ascii?Q?h0XQ6s3DBAzHRMukaB+VFi2lH27FHPMIFezTTeJnpzeJ6AThrL/w+GYXHOjS?=
 =?us-ascii?Q?R/4E+yF6UmvJvCltTDfEm9JhD/NlSYhkZfG5YQHtS7GycFnzLe49V6YGMxIX?=
 =?us-ascii?Q?HI54Mm/LyB0P4h4ND42IgV684O527/xG8RZ41VViqvewMwJc1Bb7DN8JfAyd?=
 =?us-ascii?Q?ZKl65FxFjIrToBJ1PgICg/ORWObYXzoU9uuV3demQqp1aj0oKWjB0tx3E92W?=
 =?us-ascii?Q?sLtwzGuKPKlBX6lM8ouRvWFf9oqd1sRBAJv9qe275REJA0K9dqusf+mjemiz?=
 =?us-ascii?Q?9piHjGjOq2Jy8saY/guQqFYzAE4z6hlSB6PJSWqSE6yxLIOMkLSj+pCL/yNX?=
 =?us-ascii?Q?7nFbqpySTz3xcDHOmhDaoH7Q35556PDZCRbJ7AzCC6EVLFuzlyEFs2DmEv1s?=
 =?us-ascii?Q?lpA6B3iLwXxgSt41R0tpThJ2PR+h5O3tRDd+3Zrrcl5bdGhZ59ktOtlNicMO?=
 =?us-ascii?Q?wrlK0THRkCj+R4y9VJvGYPIykquoAGnyZlb4obuk4JIVldRHiNNG2SIDTPGX?=
 =?us-ascii?Q?0Nb8E47VHcgIRLUpUU53MpXfvnLDsS7E4eZJLCTyy2yFHRbo4QcXAKto/oEo?=
 =?us-ascii?Q?C89VBh1FdmonpRINKxlqIW0ZvbozqfY0ZUDKgd41utBl3gke8YvUbXd2oCES?=
 =?us-ascii?Q?NYpCrdrxBuMqyQ/PPJdEpiDxxfSuaX9YVYcoiOf6GORNGo0L18IJfaSpekQN?=
 =?us-ascii?Q?u6sBeZ35CqzOdI1HJ9VmGt8RYwNWsekpx43Qv6XjQ6V3PEaAw47mAaehNToY?=
 =?us-ascii?Q?ndx1EWoQMhGEjjpMZfh3uV/U4stgutE0pBf01OyzF0oDaQWTimz08Is04mJm?=
 =?us-ascii?Q?5ClqQg/2TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c18e95b-e7dc-45c6-3794-08d9ea549547
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:12:05.4604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Wq5OZ9HJxu/iRVOYeijLMa5+7iwqQaGH3/YcJH+IIUORbmsNidkge7gYWF1JZSOic55FhGFUwn/YNe/PUcEBn4iXw30PhkEQxbMgSXkUNLqUKkknsSygOTVsgV/ccf+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2853
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, Balasubramani
 Vivekanandan <balasubramani.vivekanandan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fallback function implemented inside memcpy_from_wc functions when
copying using accelerated read is not possible.

v2: Fixed Sparse warnings

Balasubramani Vivekanandan (1):
  drm/i915: Add fallback inside memcpy_from_wc functions

 drivers/gpu/drm/i915/gem/i915_gem_object.c |  5 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c   |  8 ++-
 drivers/gpu/drm/i915/i915_gpu_error.c      |  9 ++-
 drivers/gpu/drm/i915/i915_memcpy.c         | 78 ++++++++++++++++------
 drivers/gpu/drm/i915/i915_memcpy.h         | 18 ++---
 5 files changed, 78 insertions(+), 40 deletions(-)

-- 
2.25.1

