Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880105B2780
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 22:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D60110E64A;
	Thu,  8 Sep 2022 20:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DC610E64A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 20:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662668111; x=1694204111;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=t8wCCMiFwl7USCWDWehRwnhKkCQ1vLO8M5eiL/Y+sXw=;
 b=Hsqc0OvbPgehl8n24582BwRBUFGoQqGND3hEj/e2hvRyxDKuyyW6WDC4
 6lPglI7CBidw2wRzMxMKrOYgK/sD2CYKElk+Adaih9c2VlX2p76CHn58j
 +52E6dww2Qe9QHBIugqCReYiSoow4pK8OcBjqVFOhtSl3Y+gywwowNw0e
 dqcYbH0pjPoyBUrHSoNA77j86J3cBU5sYp5SABHWhuv5Ohgmi2A27zn7p
 OZ8IZ8hGDiPuJF17w6/7TM1ISUQMjFbxxZvwxKKzR9jUXWq198ZgFi6Cp
 hZ65zNbsVHLE7h9w8LDf+ZI2jDjybKH/EYfkumI9K6Map9btOmBIGKepA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359043609"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="359043609"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 13:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="757349732"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2022 13:15:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:15:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:15:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 13:15:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 13:15:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFhOpIqIKe+ZMcUqmc4PS2RkxYLFDlsFFX1lEpK0mDKIjKPanEsmPnO4QuUV0Cz+F9ePUgntyQachGygrxVODHBXSfjkprWIljaaHwqrM24JVrGL5pG1Rgifde0H+d5yU22kDb7XqRVDUoCn/ulP/CyoP5Ww9GG8ukzCifYvLLL4CWckK1LKs58ueATV18k/qpj3pOvmNs4BGSkNXKrBLS0eIsCbc/VM80yKd6TzqsQy1jzB92L/qjt2nCtqcBNsMLEii24vLszydES3tEZKf3fCh7t+KIWvsEE29LJJ4YwYVGUBFgbJIKhIBn9v5ReE4OKWGK7sA9aXCk2T8R5EdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmQ4gkM462uH5o+jhfS49wr5xLcJfra5F/u9t9+0kIU=;
 b=hwOgZz/5l0aVh+un/F1AXYlYiiI64KU0L9cOg/qsXdDkr1GEbEAWp2vGmUArVL9cKijKrNOgQiq+RZgeWfq3QC9VP58J3DW379VguRLJIpgH9/u58V4/mITnPsyl8MZw/uAINQwh7Wkrt+GX/bUY9WLnfLbe8Kua/zBXpMcu93nBVkLsv4EdI4m6D8ycebC/nTJ+3bYJDLlo3A4aKHR2fPEfNpqC5/9CurvEt/vSuc6uohTVgrR8uV62L5J5tqXxJRUdBTcrqACkBST1IDu/7OWONO+x9TW2IBdlhphHsPoB1cen3E4zl4FcoGo/dpcfH9Go5cL57y8EcegY623/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6985.namprd11.prod.outlook.com (2603:10b6:930:57::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Thu, 8 Sep
 2022 20:15:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2%5]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 20:15:05 +0000
Resent-From: Lucas De Marchi <lucas.demarchi@intel.com>
Resent-Date: Thu, 8 Sep 2022 13:15:04 -0700
Resent-Message-ID: <20220908201504.uvxu5yiaounjswcg@ldmartin-desk2.lan>
Resent-To: <dri-devel@lists.freedesktop.org>
Authentication-Results: spf=fail (sender IP is 134.134.137.102)
 smtp.mailfrom=intel.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=intel.com;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="718702462"
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v1 2/3] drm/i915/gt: Extract per-platform function for
 frequency read
Date: Thu, 8 Sep 2022 13:08:15 -0700
Message-ID: <20220908-if-ladder-v1-2-9949a713ca08@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908-if-ladder-v1-0-9949a713ca08@intel.com>
References: <20220908-if-ladder-v1-0-9949a713ca08@intel.com>
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-df873
Content-Transfer-Encoding: 8bit
X-OrganizationHeadersPreserved: ORSMSX608.amr.corp.intel.com
X-EOPAttributedMessage: 0
X-CrossPremisesHeadersPromoted: DM3NAM02FT046.eop-nam02.prod.protection.outlook.com
X-CrossPremisesHeadersFiltered: DM3NAM02FT046.eop-nam02.prod.protection.outlook.com
X-MS-TrafficTypeDiagnostic: DM3NAM02FT046:EE_|BL3PR11MB5697:EE_|CY5PR11MB6139:EE_|CY8PR11MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: b24062a1-efaf-475f-ee5a-08da91d6d1a4
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(396003)(366004)(136003)(376002)(38100700002)(316002)(82960400001)(36756003)(41300700001)(54906003)(37630700001)(4326008)(478600001)(66946007)(83380400001)(66556008)(26005)(8676002)(6486002)(66476007)(2616005)(86362001)(8936002)(6862004)(186003)(6506007)(6666004)(2906002)(6512007)(5660300002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 20:10:16.5760 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb6b936-eadc-4757-c0ea-08da91d625aa
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=46c98d88-e344-4ed4-8496-4ed7712e255d; Ip=[134.134.137.102];
 Helo=[edgegateway.intel.com]
X-MS-Exchange-CrossTenant-AuthSource: ORSMSX607.amr.corp.intel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5697
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.3397706
X-MS-Exchange-Processed-By-BccFoldering: 15.20.5588.018
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(425001)(930097); 
X-Microsoft-Antispam-Message-Info: yW563SU8Doam/tro5wpd/NGGiMtfNCgvIynRoM5rUCFctnprZ1zjiAzPCSPrGntQ7dWAo/gghUN4NdKA3D6w3//acCtpLmr9d24X/MmLm3fGZHic6zTNVE7GeyZGp5qLCcMIQqFi1TIzSCyk9eOlx7cg2KzSO9F7VWD4YZFfBO6zKymFdBKnmT66fohWjNwaEMgwFox9F4gyEwyzuUEugnmPI9iKhmFZGYLQxfi3XZbmne6k2Zbw50g53xHANMmqmTQtUrIVCept55VR6re9g8Od7PJZUkby2hUBXqa4KKVzPhU8Tyf9Ts8LCK0gkoznqGdxt2wId7f8wibmOfsSIpyJ0NuQ4woYiuHVlEWT5TcCjBZAug9vEvL2LHtIMUzIG2t2KiHFbs+iF/J0/8/nN59TerrHg2ESf0FUH8PXxLy0IKX5W9QI1yNVJNVRvZfXRAGXy1Mrwr92axVgIzO4Rpul1FEcdCdqzIzZtWv5jrLFaaFJ5NiBch7ucUXUF3oMGZahaaD5xZmRA4M5IDCezJ3o4xc01a5N3gH6POJseyWJc1SUAnFqBz+th0WCFLYeFm12dNKWXKswgsZUbsSbCDW+f0O6kQULXp7TvqzP3NKnGhVFaVq5xoLqiQ1cl90ELsPPcYTM0e4J6qXDpMutF1x52nhVsEDowH+AOZGQwNjqp6T7G7WwN1Z4NebQ0ofOQ8w+HdOj+A/2CnBk1AV3oQ==
X-TUID: oCqBhoQg9pDX
X-ClientProxiedBy: BY3PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:a03:255::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bcb6b936-eadc-4757-c0ea-08da91d625aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0JHVkl2a0VibUo3MVAzcy9ZNXhkNFJwVGpDelRKUHliVzFVMjFrQjdJM3Az?=
 =?utf-8?B?UDlHUHZ3V2NMSDROd2YrdFRqdnVmNitYbFYvN21ZL2dqRmU3YUl5MCt3VjNr?=
 =?utf-8?B?aG1YTEVEc3IrYUV4TGJQZkJqUFo5Q1JqdTROWDNwNzVFem00ZHAzMzFaZUIv?=
 =?utf-8?B?Ni8reHJyYkVGWmk2ZzRFTnBnNGczM3NqdFdvN21aZkZCQWdlRzAwbk84WVhP?=
 =?utf-8?B?Um9ZTHBCTTZ5MEYvZStzV3FRQlo2S1lPV0hnQ0dCSVRqTWQzalU1WWkwOTFG?=
 =?utf-8?B?VlE3amNodEdxbm40b2RWZEl2V1hLQmJJRWRONEFxR0ZUcmZnancxd0xUWjZq?=
 =?utf-8?B?OWtEbkd2NlA2Mml1R3Ezc0tuM1lrNWFDTE85UjFUTmQ0VUloem9TVTNMbGRp?=
 =?utf-8?B?UTdnNU5IdG9NUjRRVTcxUUFvdlJackhnZXhidmFoS2RCeVk0bjlQcytRei9j?=
 =?utf-8?B?dGxPRzJtZ3hOUW15Nk42aXFJQUZWeGVUSlBFZFA1cUtRV29uYlFVN3JacTdD?=
 =?utf-8?B?U2Z6UmZqTW1IcUpGQzRybnFRWEdMVmdGb3BjeDBtd2JUWTc2M1NVYjFGQVF0?=
 =?utf-8?B?d1dVT3RIM3BFMmhDbzV2TURMdGtYTVlLcXowNzJiWWN1bHFhOVZJVkFvalRU?=
 =?utf-8?B?NVh1eE1RRHFla3FERDZ3VVgrWFBSc1RUckhRekZBbmsyNklITE93VlRhV24r?=
 =?utf-8?B?SDdzSmpJcmo1Q3dXVmVrb1dwOVE3aFh4NHZJbnZEbi9lU1NCK0pIWUVDYm4v?=
 =?utf-8?B?YTRmVCsvLy9yNjFqam1yWnJhUzZkY2VXZVRjRTYzVVp6WkhWMlN2TEJ6MlpH?=
 =?utf-8?B?WTZ1UjZYaTBNQ3U5V2NNVW54Q01ETGhnK1ZodkpKQ2MzakZsOTYwQUxDYjVt?=
 =?utf-8?B?aXc3UXlqWkhnYS9aMFhyLzVJb1YxQzlCdE5PYmJkVnJpaW9pWTlWaFMveWNw?=
 =?utf-8?B?SGFQQlRaZjF2Z3hMUmJVbkZzQVJORkxobldDZHlUcE5QWGp3cWNmc1pjZlVl?=
 =?utf-8?B?emFDSVZoN2psVFBKV3NPTk1rSmhYcS80SmViZXlpYjJGei9TMkpoOStwcmVP?=
 =?utf-8?B?SjV1cWxyRmhiVUhJYXNsRnIxV1YvSzdwVzNXSjZTc3BNQVBvWDE1aEtRNDNx?=
 =?utf-8?B?Y0xwV2c4TEdQZW1heUlNck5VRlYzMmFkdDZWUFgwTW5QWXY3STlJQnRabVVW?=
 =?utf-8?B?QzJBTThmempRUkZHKzZXLzd1SE1WNDE3VlZGVnhmU2I5Rlh1cU1HcnRBdXVE?=
 =?utf-8?B?T3Y1UWJ2QjRsYlMzLzVCck5nWUp6RTg0V2tTK3dCTlFmQjJCaEtkUWNjMHFk?=
 =?utf-8?B?aWR1STBIc1NvTG5UVUlndW84WXloOVNuck1MeWF1TFlOYXI0MnN5cWJjb2lR?=
 =?utf-8?B?OEZOUWVtd1BzamQvNU9SMzhhQlo2SEpIOEVpdHYzdUJSOS9USURhY0RNTm1G?=
 =?utf-8?B?ZmVidVpkUGRMM3ZIUitkMEZhOEx1VEFIMkk1MHZ0Uzc5TjE3RjlFYVJqOWwr?=
 =?utf-8?B?eTA3VzRSL0hQMk1rb0R0NUdDWmtJTXZPUFlpeHg0TW44YWZCSDlBK21GSDN2?=
 =?utf-8?B?UVhYZEJySXhEcGpSQ0lmQm5rcTNvWDBEYUkwdmVKS2NacTNIbGcrdllUbTlZ?=
 =?utf-8?B?UFNobVMvNzNEVjg2ZTZ5Uzh4T3BzdHFQcmxxd2RmOHAxMVh2U3BNb1RSbXIz?=
 =?utf-8?B?TXdENGNIaXg4NlFFcFU4WjUvWlVoejQ3aXF6RE1ibHZxNXZEQmlucUxmcEpY?=
 =?utf-8?B?SnJ1MlRjMkFkN2lLV1llWm9sSVE3eXdCckFGVXJ2eXppRzFzdlhsYVdlNE4z?=
 =?utf-8?B?eWl1eGN1UzI2MUVaUW5abkRjb1hJSUFwZ1ZSRTBwdEJpbmt6c2Y0MS9KQ1Ar?=
 =?utf-8?B?eVRqTWhHdHJhTE1vMDFmWGlMMjZtVk9tQ1ZpR1ZaY0VyREk4NnVPbExGQmQr?=
 =?utf-8?B?NnZ6V2p5Q1htRDlCZzJVbFNTejhVNEpuS0Znd2tiUEg3YWRQamYyMFJZQkhN?=
 =?utf-8?B?MUxweXN0U0RMNmh1S1BUMzB1WXlPbWZJM2xFWkNud3hZWmU0NWNtYWh0bXNC?=
 =?utf-8?B?bGtmU016NmFKakRwQk1YNE82Wk1nRi9ZS1dYMlIxdUV6bEhlY0cwc3l3eHI0?=
 =?utf-8?B?NVpCaFhiZ2d4R1I3ajluSFE0YmtSalcyWGs3NUdwUjdMSlpKWFEwUXZDS0xQ?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b24062a1-efaf-475f-ee5a-08da91d6d1a4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 20:15:05.3715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQBhhYuBLhwoZembdaZ0QIKaK4YWSoZazuWuaZIigRCxT+9e2++QQZjWxRD/zMBOQz0dzZDa2IVYE3X4fZo0ou5QP1bKFEek9tLWYwM+agc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6985
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of calling read_clock_frequency() to walk the if/else ladder
per platform, move the ladder to intel_gt_init_clock_frequency() and
use one function per branch.

With the new logic, it's now clear the call to
gen9_get_crystal_clock_freq() was just dead code, as gen9 is handled by
another function and there is no version 10. Remove that function and
the caller.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
index 93608c9349fd..ebddbf7542bc 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
@@ -26,26 +26,6 @@ static u32 read_reference_ts_freq(struct intel_uncore *uncore)
 	return base_freq + frac_freq;
 }
 
-static u32 gen9_get_crystal_clock_freq(struct intel_uncore *uncore,
-				       u32 rpm_config_reg)
-{
-	u32 f19_2_mhz = 19200000;
-	u32 f24_mhz = 24000000;
-	u32 crystal_clock =
-		(rpm_config_reg & GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK) >>
-		GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT;
-
-	switch (crystal_clock) {
-	case GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ:
-		return f19_2_mhz;
-	case GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ:
-		return f24_mhz;
-	default:
-		MISSING_CASE(crystal_clock);
-		return 0;
-	}
-}
-
 static u32 gen11_get_crystal_clock_freq(struct intel_uncore *uncore,
 					u32 rpm_config_reg)
 {
@@ -72,95 +52,101 @@ static u32 gen11_get_crystal_clock_freq(struct intel_uncore *uncore,
 	}
 }
 
-static u32 read_clock_frequency(struct intel_uncore *uncore)
+static u32 gen11_read_clock_frequency(struct intel_uncore *uncore)
 {
-	u32 f12_5_mhz = 12500000;
-	u32 f19_2_mhz = 19200000;
-	u32 f24_mhz = 24000000;
+	u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
+	u32 freq = 0;
 
-	if (GRAPHICS_VER(uncore->i915) >= 11) {
-		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
-		u32 freq = 0;
+	/*
+	 * Note that on gen11+, the clock frequency may be reconfigured.
+	 * We do not, and we assume nobody else does.
+	 *
+	 * First figure out the reference frequency. There are 2 ways
+	 * we can compute the frequency, either through the
+	 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
+	 * tells us which one we should use.
+	 */
+	if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
+		freq = read_reference_ts_freq(uncore);
+	} else {
+		u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
+
+		freq = gen11_get_crystal_clock_freq(uncore, c0);
 
 		/*
-		 * First figure out the reference frequency. There are 2 ways
-		 * we can compute the frequency, either through the
-		 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
-		 * tells us which one we should use.
-		 */
-		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
-			freq = read_reference_ts_freq(uncore);
-		} else {
-			u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
-
-			if (GRAPHICS_VER(uncore->i915) >= 11)
-				freq = gen11_get_crystal_clock_freq(uncore, c0);
-			else
-				freq = gen9_get_crystal_clock_freq(uncore, c0);
-
-			/*
-			 * Now figure out how the command stream's timestamp
-			 * register increments from this frequency (it might
-			 * increment only every few clock cycle).
-			 */
-			freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
-				      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
-		}
-
-		return freq;
-	} else if (GRAPHICS_VER(uncore->i915) >= 9) {
-		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
-		u32 freq = 0;
-
-		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
-			freq = read_reference_ts_freq(uncore);
-		} else {
-			freq = IS_GEN9_LP(uncore->i915) ? f19_2_mhz : f24_mhz;
-
-			/*
-			 * Now figure out how the command stream's timestamp
-			 * register increments from this frequency (it might
-			 * increment only every few clock cycle).
-			 */
-			freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
-				      CTC_SHIFT_PARAMETER_SHIFT);
-		}
-
-		return freq;
-	} else if (GRAPHICS_VER(uncore->i915) >= 5) {
-		/*
-		 * PRMs say:
-		 *
-		 *     "The PCU TSC counts 10ns increments; this timestamp
-		 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
-		 *      rolling over every 1.5 hours).
+		 * Now figure out how the command stream's timestamp
+		 * register increments from this frequency (it might
+		 * increment only every few clock cycle).
 		 */
-		return f12_5_mhz;
+		freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
+			      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
+	}
+
+	return freq;
+}
+
+static u32 gen9_read_clock_frequency(struct intel_uncore *uncore)
+{
+	u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
+	u32 freq = 0;
+
+	if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
+		freq = read_reference_ts_freq(uncore);
 	} else {
+		freq = IS_GEN9_LP(uncore->i915) ? 19200000 : 24000000;
+
 		/*
-		 * PRMs say:
-		 *
-		 *     "The value in this register increments once every 16
-		 *      hclks." (through the “Clocking Configuration”
-		 *      (“CLKCFG”) MCHBAR register)
+		 * Now figure out how the command stream's timestamp
+		 * register increments from this frequency (it might
+		 * increment only every few clock cycle).
 		 */
-		return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
+		freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
+			      CTC_SHIFT_PARAMETER_SHIFT);
 	}
+
+	return freq;
 }
 
-void intel_gt_init_clock_frequency(struct intel_gt *gt)
+static u32 gen5_read_clock_frequency(struct intel_uncore *uncore)
 {
 	/*
-	 * Note that on gen11+, the clock frequency may be reconfigured.
-	 * We do not, and we assume nobody else does.
+	 * PRMs say:
+	 *
+	 *     "The PCU TSC counts 10ns increments; this timestamp
+	 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
+	 *      rolling over every 1.5 hours).
 	 */
-	gt->clock_frequency = read_clock_frequency(gt->uncore);
-	if (gt->clock_frequency)
-		gt->clock_period_ns = intel_gt_clock_interval_to_ns(gt, 1);
+	return 12500000;
+}
+
+static u32 read_clock_frequency(struct intel_uncore *uncore)
+{
+	/*
+	 * PRMs say:
+	 *
+	 *     "The value in this register increments once every 16
+	 *      hclks." (through the “Clocking Configuration”
+	 *      (“CLKCFG”) MCHBAR register)
+	 */
+	return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
+}
+
+void intel_gt_init_clock_frequency(struct intel_gt *gt)
+{
+	if (GRAPHICS_VER(gt->i915) >= 11)
+		gt->clock_frequency = gen11_read_clock_frequency(gt->uncore);
+	else if (GRAPHICS_VER(gt->i915) >= 9)
+		gt->clock_frequency = gen9_read_clock_frequency(gt->uncore);
+	else if (GRAPHICS_VER(gt->i915) >= 5)
+		gt->clock_frequency = gen5_read_clock_frequency(gt->uncore);
+	else
+		gt->clock_frequency = read_clock_frequency(gt->uncore);
 
 	/* Icelake appears to use another fixed frequency for CTX_TIMESTAMP */
 	if (GRAPHICS_VER(gt->i915) == 11)
 		gt->clock_period_ns = NSEC_PER_SEC / 13750000;
+	else if (gt->clock_frequency)
+		gt->clock_period_ns = intel_gt_clock_interval_to_ns(gt, 1);
 
 	GT_TRACE(gt,
 		 "Using clock frequency: %dkHz, period: %dns, wrap: %lldms\n",

-- 
b4 0.10.0-dev-df873
