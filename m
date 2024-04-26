Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E20C8B3FCC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 20:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C172611A8F8;
	Fri, 26 Apr 2024 18:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kf80j+oc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DD211A8F8;
 Fri, 26 Apr 2024 18:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714157976; x=1745693976;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nWIPbHHgiM+8GFb+QsPbtyCLlugLP54jCBEKlF0U1xA=;
 b=Kf80j+ocU3zj9hV7bjsM2eQFvgrcyDAP8P6z9U87l1dI6yQD0mzTDBUi
 VtOdmwlld+9bniOvBBAHiJNv4MwHpwFJcGHXICLl7j8BvTOwDGh+6EAlS
 4CRvXmRxQ4ndxRR39azRZkl3kPRMIY8xcrXVRcaerlVPl4LyN5vSL3bHL
 i1mNDC6n1AE9ugEg46dOhhP02XyEPr5VdPGRIKO7mKjWgQcAQBhIIk7Ya
 gZZtDRgyXgduS0yGQM1vlcDNiQ6V71wpUgBm4o+tRR3T3ZHUWZHkSvy0b
 UIvD9Y5MxQd3muBj6N6JgQY12kurrNGzL9N/OJ6g6uFGKb5k24dvLxNtH Q==;
X-CSE-ConnectionGUID: P3LCXkTAQLiqYMojOqESaw==
X-CSE-MsgGUID: G9YLLBkdR8CdKLoqz+G5QQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="32404156"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="32404156"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 11:59:35 -0700
X-CSE-ConnectionGUID: 4WO5T3MwSHezWduOlWreEQ==
X-CSE-MsgGUID: xiCskv0pQPe6YVM6buxOVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="25478472"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 11:59:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 11:59:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 11:59:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 11:59:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcwgeBpMgyEnCoRzI/MznL6ykWFc78fWkHLO/ctTP+zlJIpXLkU+DuiTQpPXOW2b8aavvV66VhV7BLk8J4Ug5HIwB5ouRHeJbWOxP+02S9rQZLUql2LkNr30gq3Ofvw59N43OCrIPVq1hh3qeg5pA10mXUzCyCamXTXEDhc9czo+Ov4wta22rOiZV8ILiprVnfEoGKcAEZ97CgPrYv6x8xE5AyHtNyyEaeIv+9EAxvV9SCzf/24QaUBBJMaOAirlERFPSHptLbDKpA0sExVRTkd1uURby2V16f/0udvdZCdCTBQlnzNXjRYbkENf5LqIJ63Mc9xKeni086DHVwSCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hT7W6R5JbRg4WsWDHY7abibfDstEUXKoaxeFUrSByo=;
 b=nAsIv5hmotFZ69djSj0tHfa8uhXIejHKnJRLm6AcNW/TiVPWeelErEWfRRY3MlA3tlVWRukXuvnJeUMZsaEgayglmDczxg9kzN7Ivp8UbRSuG+2nBq+fIdUJl9P5hPLs0gb8GvZ62unKRUtdaxQ4u/GspThF0Rip9+OIq++vSIQkKvO8hAJtsuj+uibQizbf8gPaLFSeC/Y/Kl6FHu/SQmFocDuokn+HhJzFRj0J/ukw7fqIIXzcGdtLIWeH9d/RBHN/rHRvPU6eJaYHm5bgsapuo0UMPAwdQ52hgR6YBGehFm3ghkMxCj8aHnBVFmSRurSL8wgB7H2k5XhgOLIF0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ2PR11MB7475.namprd11.prod.outlook.com (2603:10b6:a03:4c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 18:59:32 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7519.030; Fri, 26 Apr 2024
 18:59:32 +0000
Date: Fri, 26 Apr 2024 11:59:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/6] drm/xe: Add helper to accumulate exec queue runtime
Message-ID: <Ziv5i/ZBGr/bfGrH@orsosgc001>
References: <20240423235652.1959945-1-lucas.demarchi@intel.com>
 <20240423235652.1959945-4-lucas.demarchi@intel.com>
 <da261fef-03ef-47ad-8001-fe4fa26f43e0@ursulin.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <da261fef-03ef-47ad-8001-fe4fa26f43e0@ursulin.net>
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ2PR11MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4ae22e-09aa-4e35-ed32-08dc662301ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGVHbDFTa0xOOFVLclVGbVBzMFVPMkxoc0ROL3VDaWZoQzQrVjBRSSsrb2Zj?=
 =?utf-8?B?d2tnUjlGTy9wMVBycXZtb09FdE9jOUswbUMzRXEyTGJUY0QySnNGaG05Y0lG?=
 =?utf-8?B?bVFTTXR3SlIzM0k1MzNPMnNnTGgzSGh4WVNUT3V1SEE5QUpRc2p4OGkrMTMx?=
 =?utf-8?B?cGhzUDUycWZRMmlmYU43MEtzUlNKTkx4NkhIcWhDa1V4ZXRsZGhUY1ZNS0M1?=
 =?utf-8?B?V0MzdkRQeVRINXFNM2JubktPZEhXZjJKbFd3TkY1YjQvWE9uaEdLZlFiTm9s?=
 =?utf-8?B?ZHh3SlkwUDBiNVNkdkpFTGUyVHpmWU4zK3JVZm5wOFpiaWJxMzBoZzU2Qkx5?=
 =?utf-8?B?UWl2NnEzdFErbThwVTRVTTdINis0UEFtUWMvTkhGc3N6MElEWEN3N2xja3B6?=
 =?utf-8?B?TGhOc2RLY0pXUEI3NHJCdHYyeEowMTNQaXE4a2U2YmxTZ2d6QlNPdGNMdHJF?=
 =?utf-8?B?VWVrZ0Zkc0lsZUk1OWdEKzZIU3RIRzZsY2NISXNNbENyZVdyc2Q2ZDBPS2lu?=
 =?utf-8?B?UXcyT2c0dHYwbTJmVjRWZHVxNUprZ1c3MUtGenhRdVBreGg3S2JKZFExbU5a?=
 =?utf-8?B?T3dqY2V4aDFMWHJsY2pZSWQ0cWliQitSN0U2MlRRUmNkWWR5dVdmSHpQVmhF?=
 =?utf-8?B?a0hjMzZIQXZ6T3RYMEtpTTZsVDlOb1A1U056R25PSG9kTExLRG92WUV1K0Nh?=
 =?utf-8?B?SWZvRWlkdytUanp4OXJZZGFKbkFFVUZPMmt3LzlZeHhYcStObWhoejBFTmI3?=
 =?utf-8?B?K1Rqak9zQ093RHRCeTZ4c2p5SmY3cE5SSHQ1OUprelhxbHFVbVlNTXk1aXBl?=
 =?utf-8?B?VERDN1E4eWFEVUMwWTErT2JzeG5tMHpxaVBZOFlhT1oraEVYUVNhaXo3cXdm?=
 =?utf-8?B?ZUtGbUpEMXdaaG1RUFppOUNsRmR5TlBSSCtNditlQ3UyZWZQdEZIY1hOM1hj?=
 =?utf-8?B?aENQejBSZDdYMnluRW1JTnlGM2tqNGtKTmQ2MnlkSmM2SFJORzJ5RzJPcnhE?=
 =?utf-8?B?SGdBUzU4SjVaNFI5SzVxbDNCSUVaY3hlcW9HVlRYY3UwczFQdG5BeXNTZEh5?=
 =?utf-8?B?Ull0bk9WN3F2K1dHK0hEaTJub1dsdENzMXpTRWI2ZWJONlpwYVFVQkdkMHNM?=
 =?utf-8?B?QnBHU2RRaGNDNE9OWVJpRE9XN3dneDloNktQNDVGUXJOLzdxdFE4SGdSMjQ5?=
 =?utf-8?B?OWRZWHZWRWFZRDd3M1F6MCtWR2NnYlFncFErZmlySHZVSHpsMldkQ3lBZndm?=
 =?utf-8?B?QWhOMUNVQitjTEJyWWlNODJ0MzhiMjV1MUJubWQybzdxMkJRMlVrSXJ1b1pT?=
 =?utf-8?B?ODlOUHVneVBpSnlTaitQUzV3WUM5VWhBRUVnbElpNFVtWHpja0U5Uk9YWjVU?=
 =?utf-8?B?OFNLa0NKT2ZQSmlJZW03VjZlZVM1ZnB2WXpBWDdJRDZ4OUJuT3pvUk9wRGhE?=
 =?utf-8?B?Vmt5UmlFZVU3NG1GUTE2bHZMajRsUGZVRVZuSnoyTHZTUmdMMmlBSFFCT3Av?=
 =?utf-8?B?SjNIMTBJTHlsTlJLRmdIbHlyNXR0NXdmUm1jeGFyN3hPNWRiWHlXYU1BdXlL?=
 =?utf-8?B?dTM4YytiSHF2Y2lYY0xxTEc3elg0bm0yM05wYUFzWnNVTWVleXcxNnlEa2U2?=
 =?utf-8?B?bW5SaUdvZXVNNXRyYnU2d3ljU2dvYjJYS3BmWnZaNXN0am90T2JMWkU1OWNW?=
 =?utf-8?B?WEJmcmNzYTFtUjM5QXJtZVNZS2c0ZkNOTFkrUnpSaURRUmRTNmxwNUd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TndPZkVGdi9VVUZUdDNRNmxSMTcrZ1grSEQ0ajJheHNqSVhxZ25PMWRVdUto?=
 =?utf-8?B?T0FBODNIUW4yOWpzY2wxaEVaVW5XMTNSL3ZDbnZIZHFESXRsNC9CS2dGdVI3?=
 =?utf-8?B?MkV5U3o5Wk1sQ1kwZzF2Mi94dmo0UWhYQnlLZGo0eEw3SDBlcVN6K0ZqTXYv?=
 =?utf-8?B?SXJzaG5JcEowUUxxYVhVcjJROHJvcTI5R1pmenB3dGZVRXhZZzF0K0xVemtE?=
 =?utf-8?B?ZjFsQ01SMU00cFYvNVozc1RkS0dLTWN6ZE45Wi9yY1huQlF4VmFCSFU1NFZj?=
 =?utf-8?B?MU9rSjZXSTl4aWdlTGVrYnEwNFpNVGcyWjhGdEJWbldhMStnUUpCQ3ZjVFYw?=
 =?utf-8?B?S3Y0UGc1Rmw5MVRhdjh6K3o4RkFpeFlCWVdXMzhSelUxK0IrYzM5b1hoZXVv?=
 =?utf-8?B?d0dzVDhmaEhNNHhHc0lRLy9yc3JPRmIrU1ZESU11QXhrYTB0Mm11QWlzT1ly?=
 =?utf-8?B?RVBHTmRXakdwenJxUXg5QTNFa21jR2NWUWV0MndhMEJNTkk2Z1ozTUdEUGV0?=
 =?utf-8?B?Vm1Id3RhT3RhNVlITVRyTHBYZEVaN0I3cmVMd0N5TnpNN0l6VkFhdWxjUE42?=
 =?utf-8?B?RWY3ZjJWNFpuUFFPbHBpblFZS2ZHTTZNMWVVc0dzdGVpbEhIVzJxWUkxNnpK?=
 =?utf-8?B?RjhQMWRMWWFleGluNDc3cDZlL3A0MExXYXV5Rk9ub0xEUVhZVzZ0Uis4bnNH?=
 =?utf-8?B?VmpWenVKQW5yM0djVVpPTFUrZTJKOXd3a0I2R2NCYTIxVGprYUZza0Jhb00x?=
 =?utf-8?B?bnJaVkUyaW5vN0QyeTB0YkloVmJLNEVSQnY0WTZsckZaaHBab0JzdDRZUVg2?=
 =?utf-8?B?SU41SGVPSjNKRGJaVlRUL3Jpb09XQzdpL0pQcENNVWpGTlFRV2Y3Nm8wYzBw?=
 =?utf-8?B?Y1FPSEJUQ0dtYU5kcVFMQUdZd2taSXFuM3h4UVRNL0d5NURTMVVYTGxTbkMr?=
 =?utf-8?B?M21HZHFPNEdtME1JQ3JoVThPR0IrQ3AzQllzeDBRTkN6RlNDcHB3eTJ4bWdn?=
 =?utf-8?B?MVQ0STU0MFZacFB4WUpFOG13KytLTE95aUxlTGptN1JFS1pEWDVuOTd3T0Ur?=
 =?utf-8?B?OFRrbVIxMUV5WFFOdWZTY0toN0ZaazMzU2FWSlhWd3B1Y0NuMzVOZndDZDVY?=
 =?utf-8?B?MXcxTkhsd1dmaE0rOWQ4OUNJeXM3cUp5d3lqaEZkVU10ZENtQ2xacHBrY2lK?=
 =?utf-8?B?RFJtVXY4ckdBemNSWlV4Z1c3cU9laUYxMDUzTVRDMUorRGc4WmRDNEFSa3ZY?=
 =?utf-8?B?eDlqOG95WDQ2QVQ4NkF1YmNIT0xyaHFtNGt2dmExd1FnNUJRTnkzdlRrT1A3?=
 =?utf-8?B?bVQ4L0daQTF0bFFLd1RqQUtxYjh6WVNWbVJJdTBzT2lRN3p5d0cvZE5aTHo2?=
 =?utf-8?B?OTlMRCtaTzBHL3YvN3hpZmZRQzc1bDNxaEd3eFBOYmVjMXFleVZEMmluL1FQ?=
 =?utf-8?B?ZVlyM2ZXQ0tFZ0dJendBamhZY2FCZmpaZHhxRWFGNTBZUEtmemJwU3BZRm9X?=
 =?utf-8?B?QThjb3UwR1JZbXZJa28zNFRUUFJFdXpyS1lyVGl4VlRmbUpHb2owZWRIYUcx?=
 =?utf-8?B?Y2V0eVZlMkFtZWh5d0Z3WE1GQ1dma0NuODZRZW94Q3pMaXdjdW9DTzBMaXVm?=
 =?utf-8?B?YzZHU3U2T0VEQWNQVFE1OFR4TXRHOHJFK2F1eHhrVkNwelJ1cmRmckRkOHJ6?=
 =?utf-8?B?N2JjNkpMcXc4ZnUzbnlxVFArYjRIdHYyYzF6UnMxREdyOFdDeDZSWWtEWUQ4?=
 =?utf-8?B?cmlDK2lCcDhaN1FldzJWV1dGcENmUWI1RjhnUzdJem9iOVdsTTRGdXF4R2Zw?=
 =?utf-8?B?cDhsWldieFl3VWd0UUhDa3N3eEE5UUx0L0pGcVJUNkJFaENyN202YjZWN0RT?=
 =?utf-8?B?dlZzT1JZajcvUk9ub0VWWmlaLzYwYWo3dVRkb0s0L0lzUUtUNWdyTmtOSzdv?=
 =?utf-8?B?RE5NNEQ1UlRiMzc0S0lXcGdvbmxWSXRxTUxaV0ZCNlBJaitHMUh3QjNIcUpO?=
 =?utf-8?B?MjJwSVBTbFRMa0p0Y0ptRHlHQWl2MHdjY0t4RFMrNjlsWW02ZEptNXhMVEVS?=
 =?utf-8?B?OTVZRDNqY1FwbUVObmkzSjMvQkR5NzgxMzZwUWZGYTZ5MHpEdlM0WWI1cm1p?=
 =?utf-8?B?KzR3cGtiVjdJY2VpY2dZaDZya0tER0MydzBHRXB3aEtlMFZMYnJBOTlQUVpj?=
 =?utf-8?Q?uxvz+auC/TdqdM5gqOTq9uM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4ae22e-09aa-4e35-ed32-08dc662301ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 18:59:32.4731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdPPrwOlaqUYDh5pQt8AJqXqvo2IVtiAjHQURUw6rnacjvtfV50H2uPL+1IfjvSQzUXyBGRi0aP8+nn3yEt6BKE8NbGzn+Iv37PZ26UowRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7475
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

On Fri, Apr 26, 2024 at 11:49:32AM +0100, Tvrtko Ursulin wrote:
>
>On 24/04/2024 00:56, Lucas De Marchi wrote:
>>From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>>Add a helper to accumulate per-client runtime of all its
>>exec queues. Currently that is done in 2 places:
>>
>>	1. when the exec_queue is destroyed
>>	2. when the sched job is completed
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>>  drivers/gpu/drm/xe/xe_sched_job.c    |  2 ++
>>  4 files changed, 49 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index 2e62450d86e1..33d3bf93a2f1 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -547,6 +547,15 @@ struct xe_file {
>>  		struct mutex lock;
>>  	} exec_queue;
>>+	/**
>>+	 * @runtime: hw engine class runtime in ticks for this drm client
>>+	 *
>>+	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
>>+	 * case, since all jobs run in parallel on the engines, only the stats
>>+	 * from lrc[0] are sufficient.
>
>Out of curiousity doesn't this mean multi-lrc jobs will be incorrectly 
>accounted for? (When capacity is considered.)

TBH, I am not sure what the user would like to see here for multi-lrc.  
If reporting the capacity, then we may need to use width as a 
multiplication factor for multi-lrc. How was this done in i915?

Regards,
Umesh


>
>Regards,
>
>Tvrtko
>
>>+	 */
>>+	u64 runtime[XE_ENGINE_CLASS_MAX];
>>+
>>  	/** @client: drm client */
>>  	struct xe_drm_client *client;
>>  };
>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>index 395de93579fa..b7b6256cb96a 100644
>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>@@ -214,6 +214,8 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>>  {
>>  	int i;
>>+	xe_exec_queue_update_runtime(q);
>>+
>>  	for (i = 0; i < q->width; ++i)
>>  		xe_lrc_finish(q->lrc + i);
>>  	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
>>@@ -769,6 +771,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>>  		q->lrc[0].fence_ctx.next_seqno - 1;
>>  }
>>+/**
>>+ * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
>>+ * @q: The exec queue
>>+ *
>>+ * Update the timestamp saved by HW for this exec queue and save runtime
>>+ * calculated by using the delta from last update. On multi-lrc case, only the
>>+ * first is considered.
>>+ */
>>+void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>>+{
>>+	struct xe_file *xef;
>>+	struct xe_lrc *lrc;
>>+	u32 old_ts, new_ts;
>>+
>>+	/*
>>+	 * Jobs that are run during driver load may use an exec_queue, but are
>>+	 * not associated with a user xe file, so avoid accumulating busyness
>>+	 * for kernel specific work.
>>+	 */
>>+	if (!q->vm || !q->vm->xef)
>>+		return;
>>+
>>+	xef = q->vm->xef;
>>+	lrc = &q->lrc[0];
>>+
>>+	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>>+
>>+	/*
>>+	 * Special case the very first timestamp: we don't want the
>>+	 * initial delta to be a huge value
>>+	 */
>>+	if (old_ts)
>>+		xef->runtime[q->class] += new_ts - old_ts;
>>+}
>>+
>>  void xe_exec_queue_kill(struct xe_exec_queue *q)
>>  {
>>  	struct xe_exec_queue *eq = q, *next;
>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>>index 02ce8d204622..45b72daa2db3 100644
>>--- a/drivers/gpu/drm/xe/xe_exec_queue.h
>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>>@@ -66,5 +66,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>>  					       struct xe_vm *vm);
>>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>>  				  struct dma_fence *fence);
>>+void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
>>  #endif
>>diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
>>index cd8a2fba5438..6a081a4fa190 100644
>>--- a/drivers/gpu/drm/xe/xe_sched_job.c
>>+++ b/drivers/gpu/drm/xe/xe_sched_job.c
>>@@ -242,6 +242,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
>>  {
>>  	struct xe_lrc *lrc = job->q->lrc;
>>+	xe_exec_queue_update_runtime(job->q);
>>+
>>  	/*
>>  	 * Can safely check just LRC[0] seqno as that is last seqno written when
>>  	 * parallel handshake is done.
