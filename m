Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C06D25AA2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 17:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6124910E7A2;
	Thu, 15 Jan 2026 16:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1kYw9Mc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A797C10E188;
 Thu, 15 Jan 2026 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768493778; x=1800029778;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=XCzGd+VoCTislWPslrqwnT9U5VILh0pUKkyxWf12VLM=;
 b=Y1kYw9McthAnxW6WjdcaMMrr9YP0agz4slAPxzL5vaFCMy97u4aZfFXt
 jiLPYQvq579F5nvJV41YKwNuB5YDMismxlix8dbOnf0ZrSDvwLL/gXUFd
 KBxf4CKo3rZOTxIwIaji6N8hi2hxddVtF/I48/AluN2AA+xW4awjfbSw4
 klasWYiPasf0ds63niaAQtGyDI4t7t358JSJI2dNgWyChy2QnO15omvqv
 tkn1IiUlwqba8jXCFCJX78yf/c0oQdtyG8s6uXjsyZzfe8seJvJqp9EI4
 zCI1S0odgsL7xTON7dySQjns3pdJlcHJgOb9uDjkq7TWeS7kcoe+wyJJZ w==;
X-CSE-ConnectionGUID: di4leH4RQfiXd+wuwhn3QA==
X-CSE-MsgGUID: xj9TjqGiRti9s1JMemd7pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73644935"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="73644935"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 08:16:17 -0800
X-CSE-ConnectionGUID: FZCDdTpMRiiEC7DrqcQCwQ==
X-CSE-MsgGUID: YceEEpJYTTOxzLJFsQzqQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="209499175"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 08:16:17 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 08:16:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 08:16:16 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 08:16:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7l8vwfzpm1Rqexi7M0W6ZpIOObBx8jrOZuQq+EJIpO1ecuN8cHRDzwgir8cs+vdAOIBRdZ7vsTvfNYkMCOlPcyiJDfdjvfDOwsaNUgDqHNF710zFV58dJ6wPOHPwhoHz81QaMS0MMtw9meZYmuydLmPgMWrZoUsD4XWVZFUElJ0d97OT5R4HSrdAldFGTfWSj6oXjJ1JgBkgjkVW+eJ4uXM2VRjAJ40YTVDG1iO9RB7i68zFtaKveXnCFqfu/mUFa5CagHvfoxnfR1T6rL1c+brOTGYxJiF73EGrtWg2MdxT5GuLchudSm4a9UQl3TG9dEkyFGTJjPwSo5dy3qv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KdksL4z1om2bCywToC06vVGJJQeDaFLGnk5AfBA1Ns=;
 b=ZqlVwnuzOVbxv0Npvuzak3EHDLZ5JRGQNKHN3YE0hM0BIgCJM4+XTDiBpK7xJeeeaHXaMyHkV2Tp4PG9Fpkj5kZ7siaqmxxq1YwUASNscR2tPketetJhLhOQDJLBr4MZjnifMRt1dwZrtNZ4QamsAhaBZZfRXcMJqPZySp99B9xexdtSFM5VLgHOgm4L1pN6MDP5CpwzNLdhbVUZn5GoOVGFHWT0qh6QM+FaiyboSTm8WCsSDQqeThGQMvPmsjrPlEzZ6cqB44lQHalU4a0r30xO+gyhnbKO+Xa092W6/s9wQdPgCY46b+SyCYtuY40198MFCf0mTyKdQo0buLQIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB5146.namprd11.prod.outlook.com (2603:10b6:806:116::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 16:16:12 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 16:16:12 +0000
Date: Thu, 15 Jan 2026 11:16:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <aWkSxRQK7VhTlP32@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0201.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB5146:EE_
X-MS-Office365-Filtering-Correlation-Id: 3703e10c-55e0-4826-11b0-08de54516622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UuaZt8WvMhGKEpPJ7nBMmbCtS+0sEhZSvTyfVUKT9POZzjLd0SpeG6kcEjVK?=
 =?us-ascii?Q?A0CQfx2Sw9CyYbo8uh0DyxCDQABO9wwHjKJUWs9SyMu8AJFs4PBRZZFiJAR1?=
 =?us-ascii?Q?x3yqkQ6Pd1TojxqqqbrJBDA8E3Qgqdc6U4br1I/I6a2YGwZQjug0RRCBT0mG?=
 =?us-ascii?Q?Vgueb7kg5QVO7r6Qel1uUHKyvThAWYXPIuXmb1mGqXHC473L8AGW9ACshaAt?=
 =?us-ascii?Q?CwN4wh2unRj/KznBjG0S27cBiWeY2Jezdre25nY8SNz2Fg78uaG9famoVuNm?=
 =?us-ascii?Q?8wJYP+lLTZ5VT/373kyetgUsTxULeEd1Arza+08BlxxY4nCQtipZb3qxWEWE?=
 =?us-ascii?Q?LrpQ8bY/6XweSaf28+SVAy59b7rO+hU0GW97Uy9WFnDhATlqSP4VJl0nTlyB?=
 =?us-ascii?Q?+wgZppcpb5cgFVmXf0kYY2Tdq0aSCQ8c+ce3Qs3hR46LK0tuEDw8njMIJCpk?=
 =?us-ascii?Q?+0nFYMwJyDlL+UswR+WPxe1RofnFTKP1rleWdL+Z0FoXzm/YY2Z1tIqZoIZJ?=
 =?us-ascii?Q?rfFFJeB6ZR43VaJm+pAsDy6wCiDxE+smON1DOxrCRKadNT2e5sYQ8BkPRh+U?=
 =?us-ascii?Q?09DELWhjUOM1TOfNURmzgcvsdEwNCCc8ZkrDHCV6EvzqBxLPXqiUz439n48t?=
 =?us-ascii?Q?50Al+7i5cDBhZDFbAc7p7F/mR7kYSt7Z+NsNUfebFRcIrGUOw6Ik/7vFaho5?=
 =?us-ascii?Q?9U2lg0B/wOOJ5PEbOsfY3SplEAEEPtxdzZkG+SCgrBfBo0OJhsansrBdk9UQ?=
 =?us-ascii?Q?4p0znx7Yv1n9tMBtZJsGFENunwS3DJvP7hDRPmHAMWul09mbxahauWV5+YH+?=
 =?us-ascii?Q?d/W0hCGJT8VBulL5cMvXhHL7onjKVSDvBMB9UHfHlKM5lb4PXx8bpKLGjhRB?=
 =?us-ascii?Q?qj37LhwFkD5AY83TSVMmwTBTMxj7YxyiVR7Du40c8ZLtR7HLReA5J2He3+Md?=
 =?us-ascii?Q?Wapnvr1P3joSKwk8uw4zGYTT3jI0piFuYQSKXX9RQP4D5KnVVYa2KTE2yOAp?=
 =?us-ascii?Q?2eiOwurgAlcgGPAGjYo/K4zzh7LlxM+7NgsUUqJI+nR8BV62JDd2inAecc+Z?=
 =?us-ascii?Q?/MAb7r7EDtgZQ8LUs6APxn9W66KjyQiVTPbGqIG8Qvj7LrVKCguxrISU1w8n?=
 =?us-ascii?Q?r7l+CI/77VR0zO3+2JBCcmEqdEP3A1E6em/uOReqdIzd3ONShWZUS/s5vUvj?=
 =?us-ascii?Q?NHOh/5rM5yI832ia0VG62Coths4Fa0RcMT7DCcdH5ZLOPcHeV7WnzdIM7eA4?=
 =?us-ascii?Q?iSyzMra/30t4qeu/ShryWOK5d4PIR0AIlKy6PQrO/O4wB4zK8i2Hjwbl8X43?=
 =?us-ascii?Q?UR1lw9iEiebpEPwzfX0/lJxTou4NaiI2IdyhyJULg+RgaQPDUfht5s9F2E+9?=
 =?us-ascii?Q?xwudMN2Cm0FPGWPEi4J4Rv852XRJRw6V3tAn3fEtRuaRgbzRo3Rc7cEgsMek?=
 =?us-ascii?Q?isNdKN8wr4wkAR9SI9m8KK/fNVVVZN32Bz46TqWNLwAn7v7CIoWjAZQBiobR?=
 =?us-ascii?Q?/79P0lfvjG+6PbRAef3xK3h8h7GCIcj4lX87?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FL6XPVwPAMP0721VSp7qp8oBlTSGb3ssQncdMXTf0NNUQF3EaDCe+DF6UI9Y?=
 =?us-ascii?Q?dlEQaligXGxAbHM5pSp0q+bNCEAM8mvs4GvTLomnz8IU8VnRkkSfoGmAbZjo?=
 =?us-ascii?Q?7FhufhZlSymO2/fzyCAqEvam6is7q+cTIJXFYpuRHD/BnqG40SxtvWoLa6J3?=
 =?us-ascii?Q?KU/tKuUQQ6T01+0IooKfgHf+21/A07Yjos0suBSoIyWA4X4qvrWLKfs3FPBP?=
 =?us-ascii?Q?xM9xtmtuFSUyhp6gHjW/qiM6rtdKBUwPhxH3lD7ytztyCbUkHhszoSaKz9Kl?=
 =?us-ascii?Q?RM3+7P8rKXSnSOC25kN52u4pzO+BwKBSvjb2H420+qRuGn26C+5/vlF6vcUn?=
 =?us-ascii?Q?J6uPVOachgjcQQhZY1OpJsOkSs0SGhLyoHEL7FJGyRvytEfvXQgp/BajQ7ri?=
 =?us-ascii?Q?NqptFgE/Wb728/NaNTs+WZgVoW4DFQEh7X29v4+Z5kksxC79P1cIYakXwUiA?=
 =?us-ascii?Q?TSr8If2SljQIeGq7B3fnCgNJZHVc/QGpvrFknZuF2Z+42xlHEuB7M0rT8390?=
 =?us-ascii?Q?1MUi9EMA07gFX3nf20VuXQ6hg2+eGxPHD1LYpg1TPy4rYF6U+LcKaGV/A/6r?=
 =?us-ascii?Q?a1nf3vpIXh3DKewlZOud1SvqClmpDWVVy5dx50X7erEnpWZ2+itkUg7ZyFZ+?=
 =?us-ascii?Q?y0OhbWNDTPDAvVBPYyAABxWWU1ebf0g2YkuYvwZ4fZTuHwgrbSogaT2e83sw?=
 =?us-ascii?Q?xn9h8dMTa/tQfC0G2mafOyM1uAZ/oGsgcepIntigVn5kXAhMLgELNY+xPTSZ?=
 =?us-ascii?Q?o9PZMNqxnRVOH/2ZTuCkmuSKIt2QA6x7geUqBOd1WkMgbGlRvm0E5uPJ+LE4?=
 =?us-ascii?Q?2LMT7G7/jORc5/3OVogGPIsWzXzaXeHyaTrQiyj2ShmafAauL7OI6VqrwqgE?=
 =?us-ascii?Q?s12+slRq1t1Zk4ZiWEqikUWjQCSLqDXr9ujMzjx+HawaFxQD2ZGcjrQfgxdb?=
 =?us-ascii?Q?+eFDl1rSgnW7e5YYolCkoGBJU6NLLqkQj10Xf44+Q7R/opo2/5uN/sADf2sA?=
 =?us-ascii?Q?E/VDvADvwDmE53kqoarXE2fXSqbsL/nKmZ/F+580R+v76KkYkOR/PcCM/EaE?=
 =?us-ascii?Q?s74jrrWQu2FSxVDoRwcpRpC5NErOuoK9+LUbD8u8TwsAUL4TOTxyPih2ks1N?=
 =?us-ascii?Q?L0rSLhF2T6J4k9ox88BVWs88wCyH7dHgGjjWjBUMATcEe2bYMvZ8T4/rqW0T?=
 =?us-ascii?Q?Gw8DWe8gVt+C4HfEexcwkJePzb/lvwGHg6I97nZ6/CxEzIX9lEL4ks/0lv2A?=
 =?us-ascii?Q?qztOS44P27XjjA836K+g342XquM+mEpAD0d04CCv5WSMMCeJZ5ryAju8mROc?=
 =?us-ascii?Q?hBii6sAyFUokuN8Szb9+GVZJ3cDoo5Yc9op2AXo7NaPcBHUKnWW2DirFXWNA?=
 =?us-ascii?Q?Q3/8wRwlqUX5jV1t1le+GiySiFacvT2MXqnt1hTgRmFZxDwiAnOcWyAJW18Z?=
 =?us-ascii?Q?NqF2+0jtNUs7Z2C0csfdy5jHR5tOhsAApqIbfxn3HdvGxzfpERDHm11m53hg?=
 =?us-ascii?Q?6Zv8tXBH5+/sOksdIve2TQeV1lfNcxLD+f2eqoJIRUAXUDILK3OtgXdlJrfo?=
 =?us-ascii?Q?WRzOVU6d12tQo/OVp/Dcu1aSR7RI8bH2LvLaikBQg3xlS+CY1DoxLGzDqMGz?=
 =?us-ascii?Q?pfWdUSOGfQh+iswCU+Efv+Oa+VhC/Gv87ycd6VLs2s25kRqvex+dwUpG+b9C?=
 =?us-ascii?Q?1CmXOjkHR0+zoDaGB+sPf6zXVyVa9y6DuNSN/REugY7G0GtgwDXuNW3D5ek3?=
 =?us-ascii?Q?UiFvsrgCfQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3703e10c-55e0-4826-11b0-08de54516622
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 16:16:11.9506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4hzIpzXBgWRlwUFgmzgn/L3yjUp7EzEkxrEgW0vM8f46hl50ybuWXrEqBCZLLzJNpS+XTuj9EDigK3Ies8OYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5146
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Sima,

This is likely our last drm-xe-next PR towards 7.0. But perhaps
an extra one coming in the beginning of next week depending on
how the THP patches and a few other cases goes.

It is important to highlight that this PR brings a revert of a
flag in the new multi-queue uAPI that had been added in the first
PR of this round. After that PR, with multiple uAPI changes, I
scrutinized them and found out this flag was not used nor planned
to be used. Hence, I requested the removal before the 7.0 deadline.

Thanks,
Rodrigo.

drm-xe-next-2026-01-15:
UAPI Changes:
 - Remove unused KEEP_ACTIVE flag in the new multi queue uAPI (Niranjana)
 - Expose new temperature attributes in HWMON (Karthik)

Driver Changes:
 - Force i2c into polling mode when in survivability (Raag)
 - Validate preferred system memory placement in xe_svm_range_validate (Brost)
 - Adjust page count tracepoints in shrinker (Brost)
 - Fix a couple drm_pagemap issues with multi-GPU (Brost)
 - Define GuC firmware for NVL-S (Roper)
 - Handle GT resume failure (Raag)
 - Improve wedged mode handling (Lukasz)
 - Add missing newlines to drm_warn messages (Osama)
 - Fix WQ_MEM_RECLAIM passed as max_active to alloc_workqueue (Marco)
 - Page-reclaim fixes and PRL stats addition (Brian)
 - Fix struct guc_lfd_file_header kernel-doc (Jani)
 - Allow compressible surfaces to be 1-way coherent (Xin)
 - Fix DRM scheduler layering violations in Xe (Brost)
 - Minor improvements to MERT code (Michal)
 - Privatize struct xe_ggtt_node (Maarten)
 - Convert wait for lmem init into an assert (Bala)
 - Enable GSC loading and PXP for PTL (Daniele)
 - Replace use of system_wq with tlb_inval->timeout_wq (Marco)
 - VRAM addr range bit expansion (Fei)
 - Cleanup unused header includes (Roper)
The following changes since commit 59260fe5821ad108d0fda8a4a4fe0448e9821f27:

  Merge tag 'drm-xe-next-2025-12-30' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2026-01-01 17:00:59 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2026-01-15

for you to fetch changes up to 83675851547e835c15252c601f41acf269c351d9:

  drm/xe: Cleanup unused header includes (2026-01-15 07:05:04 -0800)

----------------------------------------------------------------
UAPI Changes:
 - Remove unused KEEP_ACTIVE flag in the new multi queue uAPI (Niranjana)
 - Expose new temperature attributes in HWMON (Karthik)

Driver Changes:
 - Force i2c into polling mode when in survivability (Raag)
 - Validate preferred system memory placement in xe_svm_range_validate (Brost)
 - Adjust page count tracepoints in shrinker (Brost)
 - Fix a couple drm_pagemap issues with multi-GPU (Brost)
 - Define GuC firmware for NVL-S (Roper)
 - Handle GT resume failure (Raag)
 - Improve wedged mode handling (Lukasz)
 - Add missing newlines to drm_warn messages (Osama)
 - Fix WQ_MEM_RECLAIM passed as max_active to alloc_workqueue (Marco)
 - Page-reclaim fixes and PRL stats addition (Brian)
 - Fix struct guc_lfd_file_header kernel-doc (Jani)
 - Allow compressible surfaces to be 1-way coherent (Xin)
 - Fix DRM scheduler layering violations in Xe (Brost)
 - Minor improvements to MERT code (Michal)
 - Privatize struct xe_ggtt_node (Maarten)
 - Convert wait for lmem init into an assert (Bala)
 - Enable GSC loading and PXP for PTL (Daniele)
 - Replace use of system_wq with tlb_inval->timeout_wq (Marco)
 - VRAM addr range bit expansion (Fei)
 - Cleanup unused header includes (Roper)

----------------------------------------------------------------
Balasubramani Vivekanandan (1):
      drm/xe/device: Convert wait for lmem init into an assert

Brian Nguyen (4):
      drm/xe: Remove debug comment in page reclaim
      drm/xe: Add explicit abort page reclaim list
      drm/xe: Fix page reclaim entry handling for large pages
      drm/xe: Add page reclamation related stats

Daniele Ceraolo Spurio (3):
      drm/xe/gsc: Make GSC FW load optional for newer platforms
      drm/xe/ptl: Define GSC for PTL
      drm/xe/ptl: Enable PXP for PTL

Fei Yang (1):
      drm/xe: vram addr range is expanded to bit[17:8]

Jani Nikula (5):
      drm/xe/guc: fix struct guc_lfd_file_header kernel-doc
      drm/xe/vf: fix struct xe_gt_sriov_vf_migration kernel-doc
      drm/xe/xe_late_bind_fw: fix enum xe_late_bind_fw_id kernel-doc
      drm/xe/vm: fix xe_vm_validation_exec() kernel-doc
      drm/xe: improve header check

Karthik Poosa (4):
      drm/xe/hwmon: Expose temperature limits
      drm/xe/hwmon: Expose memory controller temperature
      drm/xe/hwmon: Expose GPU PCIe temperature
      drm/xe/hwmon: Expose individual VRAM channel temperature

Lukasz Laguna (4):
      drm/xe: Validate wedged_mode parameter and define enum for modes
      drm/xe: Update wedged.mode only after successful reset policy change
      drm/xe/vf: Disallow setting wedged mode to upon-any-hang
      drm/xe/pf: Allow upon-any-hang wedged mode only in debug config

Maarten Lankhorst (7):
      drm/xe: Start using ggtt->start in preparation of balloon removal
      drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
      drm/xe: Add xe_ggtt_node_addr() to avoid dereferencing xe_ggtt_node
      drm/xe/display: Avoid dereferencing xe_ggtt_node
      drm/xe: Do not dereference ggtt_node in xe_bo.c
      drm/xe: Improve xe_gt_sriov_pf_config GGTT handling
      drm/xe: Privatize xe_ggtt_node

Marco Crivellari (2):
      drm/xe: fix WQ_MEM_RECLAIM passed as max_active to alloc_workqueue()
      drm/xe: Replace use of system_wq with tlb_inval->timeout_wq

Matt Roper (2):
      drm/xe/nvls: Define GuC firmware for NVL-S
      drm/xe: Cleanup unused header includes

Matthew Brost (11):
      drm/xe: Validate preferred system memory placement in xe_svm_range_validate
      drm/xe: Adjust page count tracepoints in shrinker
      drm/pagemap Fix error paths in drm_pagemap_migrate_to_devmem
      drm/pagemap: Disable device-to-device migration
      drm/xe: Add dedicated message lock
      drm/xe: Stop abusing DRM scheduler internals
      drm/xe: Only toggle scheduling in TDR if GuC is running
      drm/xe: Do not deregister queues in TDR
      drm/xe: Remove special casing for LR queues in submission
      drm/xe: Disable timestamp WA on VFs
      drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR

Michal Wajdeczko (6):
      drm/xe/mert: Normalize xe_mert.h include guards
      drm/xe/mert: Fix kernel-doc for struct xe_mert
      drm/xe/mert: Always refer to MERT using xe_device
      drm/xe/mert: Use local mert variable to simplify the code
      drm/xe/mert: Move MERT initialization to xe_mert.c
      drm/xe/mert: Improve handling of MERT CAT errors

Niranjana Vishwanathapura (2):
      Revert "drm/xe/multi_queue: Support active group after primary is destroyed"
      drm/xe/doc: Remove KEEP_ACTIVE feature

Osama Abdelkader (1):
      drm/xe: Add missing newlines to drm_warn messages

Raag Jadav (2):
      drm/xe/i2c: Force polling mode in survivability
      drm/xe/pm: Handle GT resume failure

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-xe-next

Xin Wang (1):
      drm/xe: Allow compressible surfaces to be 1-way coherent

 .../ABI/testing/sysfs-driver-intel-xe-hwmon        | 110 ++++++
 drivers/gpu/drm/drm_pagemap.c                      |  22 +-
 drivers/gpu/drm/xe/Makefile                        |   3 +-
 drivers/gpu/drm/xe/abi/guc_lfd_abi.h               |   5 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h  |   4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             | 104 +++---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |   2 +-
 drivers/gpu/drm/xe/display/xe_stolen.c             |   2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   6 +
 drivers/gpu/drm/xe/regs/xe_mert_regs.h             |  10 +-
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h            |   3 +
 drivers/gpu/drm/xe/tests/xe_bo.c                   |   1 +
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c        |   2 +-
 drivers/gpu/drm/xe/xe_bb.c                         |   3 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  33 +-
 drivers/gpu/drm/xe/xe_bo.h                         |   8 +-
 drivers/gpu/drm/xe/xe_debugfs.c                    |  75 +++-
 drivers/gpu/drm/xe/xe_devcoredump.c                |   3 +-
 drivers/gpu/drm/xe/xe_device.c                     | 141 ++++----
 drivers/gpu/drm/xe/xe_device.h                     |   2 +
 drivers/gpu/drm/xe/xe_device_types.h               |  25 +-
 drivers/gpu/drm/xe/xe_exec.c                       |   1 -
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  62 +---
 drivers/gpu/drm/xe/xe_exec_queue.h                 |   2 -
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |   4 -
 drivers/gpu/drm/xe/xe_execlist.c                   |   3 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       | 219 ++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h                       |  14 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h                 |  32 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c              |   9 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |  37 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h        |   2 +
 drivers/gpu/drm/xe/xe_gsc.c                        |  13 +-
 drivers/gpu/drm/xe/xe_gsc_debugfs.c                |   5 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |   2 +-
 drivers/gpu/drm/xe/xe_gsc_submit.c                 |   2 -
 drivers/gpu/drm/xe/xe_gt.c                         |  34 +-
 drivers/gpu/drm/xe/xe_gt_clock.c                   |   6 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |   1 -
 drivers/gpu/drm/xe/xe_gt_idle.c                    |   1 -
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |   1 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  21 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |   1 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c      |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c         |   1 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        |   5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |   1 -
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h          |   4 +-
 drivers/gpu/drm/xe/xe_gt_stats.c                   |   7 +-
 drivers/gpu/drm/xe/xe_gt_stats_types.h             |   5 +
 drivers/gpu/drm/xe/xe_gt_sysfs.c                   |   2 +-
 drivers/gpu/drm/xe/xe_gt_throttle.c                |   2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  18 +-
 drivers/gpu/drm/xe/xe_guc_ads.h                    |   5 +-
 drivers/gpu/drm/xe/xe_guc_buf.c                    |   1 -
 drivers/gpu/drm/xe/xe_guc_capture.c                |  14 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c                |   5 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h       |   2 -
 drivers/gpu/drm/xe/xe_guc_hwconfig.c               |   4 +-
 drivers/gpu/drm/xe/xe_guc_log.c                    |   2 +-
 drivers/gpu/drm/xe/xe_guc_relay.c                  |   3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 | 377 ++++-----------------
 drivers/gpu/drm/xe/xe_guc_submit_types.h           |  11 -
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c              |   3 +
 drivers/gpu/drm/xe/xe_heci_gsc.c                   |   1 -
 drivers/gpu/drm/xe/xe_huc.c                        |   1 -
 drivers/gpu/drm/xe/xe_huc_debugfs.c                |   5 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |   1 -
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c            |   2 +-
 drivers/gpu/drm/xe/xe_hw_fence.c                   |  20 +-
 drivers/gpu/drm/xe/xe_hw_fence.h                   |   2 -
 drivers/gpu/drm/xe/xe_hwmon.c                      | 279 ++++++++++++++-
 drivers/gpu/drm/xe/xe_i2c.c                        |  13 +-
 drivers/gpu/drm/xe/xe_irq.c                        |   1 -
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h         |   4 +-
 drivers/gpu/drm/xe/xe_lmtt.c                       |   2 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |  45 ++-
 drivers/gpu/drm/xe/xe_lrc.h                        |   3 +-
 drivers/gpu/drm/xe/xe_memirq.c                     |   2 -
 drivers/gpu/drm/xe/xe_mert.c                       |  76 +++--
 drivers/gpu/drm/xe/xe_mert.h                       |  15 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |   4 -
 drivers/gpu/drm/xe/xe_mocs.c                       |   2 -
 drivers/gpu/drm/xe/xe_module.c                     |  10 +-
 drivers/gpu/drm/xe/xe_module.h                     |   2 +-
 drivers/gpu/drm/xe/xe_nvm.c                        |   1 -
 drivers/gpu/drm/xe/xe_page_reclaim.c               |   6 +-
 drivers/gpu/drm/xe/xe_page_reclaim.h               |  20 ++
 drivers/gpu/drm/xe/xe_pat.c                        |  52 ++-
 drivers/gpu/drm/xe/xe_pat.h                        |   2 +
 drivers/gpu/drm/xe/xe_pci.c                        |   5 +-
 drivers/gpu/drm/xe/xe_pci_types.h                  |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h                  |   7 +
 drivers/gpu/drm/xe/xe_pm.c                         |  26 +-
 drivers/gpu/drm/xe/xe_psmi.c                       |   2 +-
 drivers/gpu/drm/xe/xe_pt.c                         |  84 +++--
 drivers/gpu/drm/xe/xe_pt_types.h                   |   1 +
 drivers/gpu/drm/xe/xe_pxp.c                        |   1 -
 drivers/gpu/drm/xe/xe_pxp_debugfs.c                |   2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                     |   5 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c              |   1 -
 drivers/gpu/drm/xe/xe_ring_ops.c                   |  29 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |   1 -
 drivers/gpu/drm/xe/xe_sa.c                         |   2 +-
 drivers/gpu/drm/xe/xe_sched_job.c                  |   3 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h            |   2 +
 drivers/gpu/drm/xe/xe_sriov_packet.c               |   1 -
 drivers/gpu/drm/xe/xe_sriov_pf.c                   |   4 +-
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c           |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf.c                   |   1 -
 drivers/gpu/drm/xe/xe_step.c                       |   3 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c         |   3 +-
 drivers/gpu/drm/xe/xe_svm.c                        |   2 +
 drivers/gpu/drm/xe/xe_tile.c                       |   3 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c                  |  17 +-
 drivers/gpu/drm/xe/xe_tlb_inval_types.h            |   2 +
 drivers/gpu/drm/xe/xe_trace.h                      |   5 -
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |   1 -
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c                |   1 -
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |   1 -
 drivers/gpu/drm/xe/xe_uc.c                         |   2 -
 drivers/gpu/drm/xe/xe_uc_debugfs.c                 |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                      |  14 +-
 drivers/gpu/drm/xe/xe_validation.c                 |   1 -
 drivers/gpu/drm/xe/xe_vm.c                         |  28 +-
 drivers/gpu/drm/xe/xe_vm.h                         |   2 +-
 drivers/gpu/drm/xe/xe_vram.c                       |   4 +-
 drivers/gpu/drm/xe/xe_vram_freq.c                  |   1 -
 drivers/gpu/drm/xe/xe_vsec.c                       |   1 -
 drivers/gpu/drm/xe/xe_wa.c                         |   2 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c            |   1 -
 drivers/gpu/drm/xe/xe_wopcm.c                      |   2 +-
 include/uapi/drm/xe_drm.h                          |   4 -
 134 files changed, 1391 insertions(+), 973 deletions(-)
