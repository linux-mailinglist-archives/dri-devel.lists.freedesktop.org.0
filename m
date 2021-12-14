Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B629E473983
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 01:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B103410E907;
	Tue, 14 Dec 2021 00:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B337110E907;
 Tue, 14 Dec 2021 00:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639441574; x=1670977574;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f7XB47QadePq5rXZDDa/o2FH0xLRnr+NqJZYuMEH5zY=;
 b=ZfvwjDcC49KKpjfg8c8tHQkfnHNNYG7091gjMyJz162VyWFGtKb7WnLa
 1Qb3Ilq6JyxUTckqc/E99+JHUkpcWX4+KaBbQZXOC0PArTDGKL/8cBH0r
 eHcz4UQt23X02FVNNeTnYFmD+Tk9CMSffmXQjvnZyaiu712s/EDNrNzKz
 1l0YVHjkPaoPKiCBUu1Dkp9X8JkYpgmY5aoxljXjdtboeM3IiRHU3YCDF
 pHgV8SgtoXGbLUY8VmrNShltx8AVuoyqKdhIzwE3FkZ95gKSmrZ8eIM24
 rlMKNN8ppwGRkgFHcWr+oN9sO40HWpY1JO0XYf54hS7Us5pFNCYTaA57h w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="262997208"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="262997208"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 16:26:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="464853653"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2021 16:26:13 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 16:26:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 16:26:13 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 16:26:12 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 16:26:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFVzbi+aFS6Akm+T4Fd1JNwjhKuqUaQOoS7caHBmGbdimxFYYD4WtF1ik4N+ajVUx9mexOHWsWRpTs6DKht6+T1P10cISiahbDGFCJKTtdB6j9FAJCZ2ef7IVU1BICNAzDR9h7IIO7IxuFJL4nsEKcwjTDibEKlWrBwM3rspnhqtsS5I5A8MbG3UxNcDtlFS/RZq2ahl8Dg65dGVCHLM1iMY5heoZgRejFt1cHdV7/MsX93XJUAHS5WEx3SUwRnQzjn8dCQfp8bctpf/gkeuYhfqPFZgIelZj7zcUZm+OdKqQTlrszXzavjZA4p+ejJdAsuzTxeAAIewzv+piQtOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fx71J96R54vR7zoEdqKXqi1wYS2ioLE510IpmMDdofs=;
 b=DUaHo34lA7dLof+pa8Sn6cKCEOipKzxkhwD5PibgW7ZVttZvxfiek+QPCvkVSIeM8MiPdplefWOUYzjoTc9wq9bkmXEQezyXCaakBTePfGbaoLm2z65wZ9DU5AW2JnFyzTzb7sd0n0KkPD/dUY9K1T7F9Wu+wrNg5vSGapeM44NUPuveKBfj1woifJ2gIpbov/cwPbYgGKw9q5GaonKzIWYodSBzsiKkCDtdxZu2cBJqjFlCfbyh1FwbOhJBJDaeRSV5/ybsRgfqjGVgORf2vSCmQQoKy8OgFG1MYIVwE58S//5S+T58hK/IisgVTGgNwQsKnZqVPNhqH9p2LWfmgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fx71J96R54vR7zoEdqKXqi1wYS2ioLE510IpmMDdofs=;
 b=vTsMZ+ZAiwJOCGeYAUJv7bl5nqtNeYLpgwiGs9PSvt5gbVsyFnOStj9tRrn2CSXfMg2FZs5sJoPiiQAEBXv7LEkkqwulsAxk8RIvkLnyXDq7ovt4uhcPKJObcZlMvZCstJfrpHCF5tsVgdshmhY/ThK+7k4r1/m6R2P//ZxMmEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BYAPR11MB3765.namprd11.prod.outlook.com (2603:10b6:a03:f6::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Tue, 14 Dec
 2021 00:26:10 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e%5]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 00:26:10 +0000
Message-ID: <4402aa52-8fc1-362b-4dcf-78b502959953@intel.com>
Date: Mon, 13 Dec 2021 16:26:07 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH 7/7] drm/i915/guc: Selftest for stealing of guc ids
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211211173545.23536-1-matthew.brost@intel.com>
 <20211211173545.23536-8-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211211173545.23536-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:300:ee::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a05885b-ce11-4aa3-9fb7-08d9be9853aa
X-MS-TrafficTypeDiagnostic: BYAPR11MB3765:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB37654197C3DCE44D26EDA3EBBD759@BYAPR11MB3765.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IHn87BqC25jaqroqfhGWNPwN3dWKxB53HIb+mGv3A19WkNVeYiHHecMGMmGi5GXHbzI4OW/XW+c/mLxA62ch2HOxGjxvFmuCSU1QVhMDkAo3fyhfkpb53LIeaZKRkXWjPg/I9Pgd6yK1QaClRNcHzI8AHCx3H9KQztEpYxq6tDXgGVvjbZ5SMNBgMhFqqi3wv74M4mNysD66lHn0DI3TXITP5VitwxFjRZpT7zuFkHx6IoA4kQMV52IBi2oDBKxWNYEmgx/GKcv4bmlQqR/FjF5FpgV1HIbgadp9y6KSpBzAu4wD9PbpKvBCtt9EqxJ+NoDJsXL96/mCssDDy11Wb7ucWM5zkb6Iu6KtN+PJcB7DpItAf38Q9QbHvBSoV6Fqyl2q7zXIy4Ja4W5oVg8HQq2ASr+M2ceEHij8/MMy75AW61gJkJZRv9LqYsiYUlPgg9yf/0nfhybKwkH5kyHmSU4WXoAGt8N4K4Zj/yY9iY2WJfBsjcyhQNMsPfkVK9pdTAfnYncsA7btwjfme+ZxZ530GrGns7AXkZQb80ooxn+JXuFo4WNlzxKRs3H+f4VNhK59IizeG3RE+HaG+rEjxo8K82vMTtthCPaHdIbQsTMzoYuKy7FXZBbw6K8rBoO+wuP6tD/XLF+lHzeqSZfryRPQsyfpOk8ll+zypt75Z6arz1PSM6eoFCEW1BI2Pbh/bf91IHAnL+kYGgGs7cLFXJj9agsxRWptV2YpkoHeXf6df29FMKNcAlInohNU0qbG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(6486002)(38100700002)(86362001)(508600001)(66476007)(107886003)(66946007)(66556008)(36756003)(26005)(30864003)(83380400001)(82960400001)(450100002)(6506007)(186003)(8936002)(5660300002)(31696002)(316002)(6666004)(4326008)(53546011)(2616005)(2906002)(31686004)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmVwYWZPUTIwVUsyUmp1YklJRVBZMC9VUWNiaVBRdnd2VmhkQVV5WW9YQ3Er?=
 =?utf-8?B?ODIxWWpSek10cVQ3b1lFYytLeWhHbXEzckVkMDJvR2p3WUVOMHZzSnMyd296?=
 =?utf-8?B?b1JNT1ZDTjMyQ2ZySExQZ3g5MnhxZ1Axc1BlTFhleENaOG9xVGxpNXFJSVg1?=
 =?utf-8?B?dnduMjdLbUFsdG05WXhnRUpXd3F2cXFtNmtYWDNGendsNHBRSTEvMStwYndN?=
 =?utf-8?B?UHRqV1d1OEFFZlJ6bWhucGNtWVZUa0pXUU1naG14OGpMSVJRc0hDcVVYQWxs?=
 =?utf-8?B?VkkxZ24xM2J1Z01oMnljWEZIRldlcXVDa3NDZ2VMR2ZmN3BwREEzcFI1cDVn?=
 =?utf-8?B?UmtzQnZPQU5ENnM5T1VsTU9nTlZhMXBRVmpjL1NITVUxdVBoTklPMUhFVkFF?=
 =?utf-8?B?eUZheVFoRTIvS2t2VE41KzBuYlE5Y2NwdDNMUldQc2lRNjE0S3BLbU81Q21Y?=
 =?utf-8?B?Y1FnN29IMGdtdEVyYXNJMUFYY21RV1JvK3dQVWU0YUZ5dTl3NEhnM0lJOWVt?=
 =?utf-8?B?dHlaNTdaem56WjZic1FKend2TTlveWN0U29GTjBldXBpN0l1VjhhcllzMngx?=
 =?utf-8?B?M2NJT0V2SlNYVUZiU1EvL2N5TnROekFoRzc5WEpCeHp5dVVRRERva3BPSXQw?=
 =?utf-8?B?c0RtQUNtbm10OVNhczRJdTUydHJDL21mbzRscmhlZGVsTVVhYi92ZnFoeDBQ?=
 =?utf-8?B?UFhxaW93N21HbnJvZ1JHbFVTY3NYTHBtRFA0dThna3FtdVl3M0hyT09OdjV6?=
 =?utf-8?B?Qjl6VDVNRTZVMGxkZDFtMWtJakh2MUdQZkVzc0tWTGQ5VGQrSDlYQ2NHNWlR?=
 =?utf-8?B?TERjQVVBaUROY2ZUOUR4NVFHN2pjc3NUZWpXNlhCZ1ZwV2lCT0tQL0VWR1NO?=
 =?utf-8?B?bDl3M3FoVjB6VTRKUzhwc2ZlVzBSdkZUckZLQVFlblZKS2pDUUUyK0I1N1Iy?=
 =?utf-8?B?ZGg0TWd2N1ArTEM2SkpTWWtpUCt0TlF0LzdRYnVTb29LVi9PcHA1ZGRpUzQv?=
 =?utf-8?B?d1I0NDRaVUErMHBlZmk1UU1KS3MxSmU3WDA2OGpQeHJNckQ0SHZnZyszc3Mw?=
 =?utf-8?B?NVFDc1FBdDJ4L1l5b1NSKzRPMVQwOFJ2Q0FMR0U5Q1pCa3c0bnRWOHJ0a1VG?=
 =?utf-8?B?S3RwdkUvS2tnRjc1allqTk90Tk5yZE5ORDAraTFCUkhiejg1ZW9Lem9HR0pk?=
 =?utf-8?B?SFk5OWtzQUsvdDU0MlRBeStqZHY3OUJlTVpHOHhYMmN5QmZhZnZkSSs4ZW9T?=
 =?utf-8?B?V21qc3V2UnJnUVkvM2xXaDNIS3JOWVhIZERRTk1ROEhuVGJqbGYwOVNTQmU4?=
 =?utf-8?B?TUNGcUhXRVNFUFZPbVpMR0JCc3lMS1VZa0E1M2VLd29rOU8xRGNSdWkzTm01?=
 =?utf-8?B?allNSnIyRWdqSGIrTTBKUzB1YmswTFJhcDN4UlpqdTJ5ZHJlZUkySzZvbnor?=
 =?utf-8?B?RmEyT2gyT2VRSUgxL3E2WEJ1dUQ4MUFlNmREUWNNWDg0aTlCK2NZdno5Z3lD?=
 =?utf-8?B?a25vWmdGNFAxTlhvM3RZNEVjWG5aTkh3Sys4cXp4VE1GeEgyQ0hJcG5veFhB?=
 =?utf-8?B?NGJ5WFlKb2lBR09ncmk2dmdtbWh3RDRvYzJYU2d6SGZ3S3pqMVd3UHJuNHhQ?=
 =?utf-8?B?MlF3amw2aDExZms5OHRvOGJZQjlpK3BmK01JK3hmbFNqa2tXZ2tsTU4wTTVX?=
 =?utf-8?B?Sy9vZThFWHdrTTQvSzRBR3NOWERIUHBDc2xFTmFFWG0vWUp0WW1tY25WWUNj?=
 =?utf-8?B?OWVxclFnTDVZNjAvcFlZcUYwU3g3Sm1EWG1vMUdsc2FURGs0RVg2aVR5SzV1?=
 =?utf-8?B?V0xpUC9vSHVNY1BxK1g5M3YwbkpYTWovTEJuU0tFVEE5RU9VTkwyV0o4RkI3?=
 =?utf-8?B?aEJuaXBTZkwxUWhmVFp2dGFLSCtxenZaQUljZTk1R1J2Y21kUWE5UzhlTWYy?=
 =?utf-8?B?OURmcUJDZnQwb0NmeVluMkxtUHV3T3psamVvRVBYaDVTdjZKRFhIR2tWSzVY?=
 =?utf-8?B?UThzVndHZUxvTjh4WEo1UEUzek94ZVZBaktlVVBvTmRKRHV5SzBxZG14ZEM3?=
 =?utf-8?B?VzJiTVVyOWRYb0VFcUVwN1VHNzI3L1M5c2MzTHZVYlNZUHBxbXJOeEJITHZs?=
 =?utf-8?B?dldJZ3R0K1NqQnFOWTZlU2J3T0QzNUkwdTY3c0FlVXhGRE5oRlZJekF0TEhK?=
 =?utf-8?B?bGpyQ2JHNW5GanZ1SUtNaXlwdVZtcTRKVWVoMzloVXoxVEVocDdSSG5oMUQ5?=
 =?utf-8?Q?0E4pVChUl8rOuPWcQ9llwSiFD+czAbE8NkY768/508=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a05885b-ce11-4aa3-9fb7-08d9be9853aa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 00:26:09.9351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KOJ1kiZM0zG7oM1IcohTOIu0GPIdpQAtgulm0KeBcbLCrg/EpO5eLZ4U77JNBtgbVV52Cfnel1kBQsLZY7tfK7yRQ5X1mtUQ2cE/niIOEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3765
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/11/2021 09:35, Matthew Brost wrote:
> Testing the stealing of guc ids is hard from user space as we have 64k
> guc_ids. Add a selftest, which artificially reduces the number of guc
> ids, and forces a steal. Description of test below.
Last sentence seems redundant.

>
> The test creates a spinner which is used to block all subsequent
> submissions until it completes. Next, a loop creates a context and a NOP
> request each iteration until the guc_ids are exhausted (request creation
> returns -EAGAIN). The spinner is ended, unblocking all requests created
> in the loop. At this point all guc_ids are exhausted but are available
> to steal. Try to create another request which should successfully steal
> a guc_id. Wait on last request to complete, idle GPU, verify a guc_id
> was stolen via a counter, and exit the test. Test also artificially
> reduces the number of guc_ids so the test runs in a timely manner.
>
> v2:
>   (John Harrison)
>    - s/stole/stolen
>    - Fix some wording in test description
>    - Rework indexing into context array
>    - Add test description to commit message
>    - Fix typo in commit message
>   (Checkpatch)
>    - s/guc/(guc) in NUMBER_MULTI_LRC_GUC_ID
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  12 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  16 +-
>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 173 ++++++++++++++++++
>   3 files changed, 196 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 1cb46098030d..f9240d4baa69 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -94,6 +94,11 @@ struct intel_guc {
>   		 * @guc_ids: used to allocate new guc_ids, single-lrc
>   		 */
>   		struct ida guc_ids;
> +		/**
> +		 * @num_guc_ids: Number of guc_ids, selftest feature to be able
> +		 * to reduce this number while testing.
> +		 */
> +		int num_guc_ids;
>   		/**
>   		 * @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc
>   		 */
> @@ -202,6 +207,13 @@ struct intel_guc {
>   		 */
>   		struct delayed_work work;
>   	} timestamp;
> +
> +#ifdef CONFIG_DRM_I915_SELFTEST
> +	/**
> +	 * @number_guc_id_stolen: The number of guc_ids that have been stolen
> +	 */
> +	int number_guc_id_stolen;
> +#endif
>   };
>   
>   static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 96fcf869e3ff..99414b49ca6d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -145,7 +145,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
>    * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
>    * multi-lrc.
>    */
> -#define NUMBER_MULTI_LRC_GUC_ID		(GUC_MAX_LRC_DESCRIPTORS / 16)
> +#define NUMBER_MULTI_LRC_GUC_ID(guc)	\
> +	((guc)->submission_state.num_guc_ids / 16)
>   
>   /*
>    * Below is a set of functions which control the GuC scheduling state which
> @@ -1775,7 +1776,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   		  destroyed_worker_func);
>   
>   	guc->submission_state.guc_ids_bitmap =
> -		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID, GFP_KERNEL);
> +		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
>   	if (!guc->submission_state.guc_ids_bitmap)
>   		return -ENOMEM;
>   
> @@ -1869,13 +1870,13 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   
>   	if (intel_context_is_parent(ce))
>   		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> -					      NUMBER_MULTI_LRC_GUC_ID,
> +					      NUMBER_MULTI_LRC_GUC_ID(guc),
>   					      order_base_2(ce->parallel.number_children
>   							   + 1));
>   	else
>   		ret = ida_simple_get(&guc->submission_state.guc_ids,
> -				     NUMBER_MULTI_LRC_GUC_ID,
> -				     GUC_MAX_LRC_DESCRIPTORS,
> +				     NUMBER_MULTI_LRC_GUC_ID(guc),
> +				     guc->submission_state.num_guc_ids,
>   				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
>   				     __GFP_NOWARN);
>   	if (unlikely(ret < 0))
> @@ -1941,6 +1942,10 @@ static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   
>   		set_context_guc_id_invalid(cn);
>   
> +#ifdef CONFIG_DRM_I915_SELFTEST
> +		guc->number_guc_id_stolen++;
> +#endif
> +
>   		return 0;
>   	} else {
>   		return -EAGAIN;
> @@ -3779,6 +3784,7 @@ static bool __guc_submission_selected(struct intel_guc *guc)
>   
>   void intel_guc_submission_init_early(struct intel_guc *guc)
>   {
> +	guc->submission_state.num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
>   	guc->submission_supported = __guc_submission_supported(guc);
>   	guc->submission_selected = __guc_submission_selected(guc);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> index fb0e4a7bd8ca..90f5eb66281c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> @@ -3,8 +3,21 @@
>    * Copyright �� 2021 Intel Corporation
>    */
>   
> +#include "selftests/igt_spinner.h"
>   #include "selftests/intel_scheduler_helpers.h"
>   
> +static int request_add_spin(struct i915_request *rq, struct igt_spinner *spin)
> +{
> +	int err = 0;
> +
> +	i915_request_get(rq);
> +	i915_request_add(rq);
> +	if (spin && !igt_wait_for_spinner(spin, rq))
> +		err = -ETIMEDOUT;
> +
> +	return err;
> +}
> +
>   static struct i915_request *nop_user_request(struct intel_context *ce,
>   					     struct i915_request *from)
>   {
> @@ -110,10 +123,170 @@ static int intel_guc_scrub_ctbs(void *arg)
>   	return ret;
>   }
>   
> +/*
> + * intel_guc_steal_guc_ids - Test to exhaust all guc_ids and then steal one
> + *
> + * This test creates a spinner which is used to block all subsequent submissions
> + * until it completes. Next, a loop creates a context and a NOP request each
> + * iteration until the guc_ids are exhausted (request creation returns -EAGAIN).
> + * The spinner is ended, unblocking all requests created in the loop. At this
> + * point all guc_ids are exhausted but are available to steal. Try to create
> + * another request which should successfully steal a guc_id. Wait on last
> + * request to complete, idle GPU, verify a guc_id was stolen via a counter, and
> + * exit the test. Test also artificially reduces the number of guc_ids so the
> + * test runs in a timely manner.
> + */
> +static int intel_guc_steal_guc_ids(void *arg)
> +{
> +	struct intel_gt *gt = arg;
> +	struct intel_guc *guc = &gt->uc.guc;
> +	int ret, sv, context_index = 0;
> +	intel_wakeref_t wakeref;
> +	struct intel_engine_cs *engine;
> +	struct intel_context **ce;
> +	struct igt_spinner spin;
> +	struct i915_request *spin_rq = NULL, *rq, *last = NULL;
> +	int number_guc_id_stolen = guc->number_guc_id_stolen;
> +
> +	ce = kzalloc(sizeof(*ce) * GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL);
> +	if (!ce) {
> +		pr_err("Context array allocation failed\n");
> +		return -ENOMEM;
> +	}
> +
> +	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
> +	engine = intel_selftest_find_any_engine(gt);
> +	sv = guc->submission_state.num_guc_ids;
> +	guc->submission_state.num_guc_ids = 4096;
> +
> +	/* Create spinner to block requests in below loop */
> +	ce[context_index] = intel_context_create(engine);
> +	if (IS_ERR(ce[context_index])) {
> +		ce[context_index] = NULL;
> +		ret = PTR_ERR(ce[context_index]);
Um, this is now null!

> +		pr_err("Failed to create context: %d\n", ret);
> +		goto err_wakeref;
> +	}
> +	ret = igt_spinner_init(&spin, engine->gt);
> +	if (ret) {
> +		pr_err("Failed to create spinner: %d\n", ret);
> +		goto err_contexts;
> +	}
> +	spin_rq = igt_spinner_create_request(&spin, ce[context_index],
> +					     MI_ARB_CHECK);
> +	if (IS_ERR(spin_rq)) {
> +		ret = PTR_ERR(spin_rq);
> +		pr_err("Failed to create spinner request: %d\n", ret);
> +		goto err_contexts;
> +	}
> +	ret = request_add_spin(spin_rq, &spin);
> +	if (ret) {
> +		pr_err("Failed to add Spinner request: %d\n", ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Use all guc_ids */
> +	while (ret != -EAGAIN) {
> +		ce[++context_index] = intel_context_create(engine);
> +		if (IS_ERR(ce[context_index])) {
> +			ce[context_index] = NULL;
> +			ret = PTR_ERR(ce[context_index--]);
And again.

> +			pr_err("Failed to create context: %d\n", ret);
> +			goto err_spin_rq;
> +		}
> +
> +		rq = nop_user_request(ce[context_index], spin_rq);
> +		if (IS_ERR(rq)) {
> +			ret = PTR_ERR(rq);
> +			rq = NULL;
> +			if (ret != -EAGAIN) {
> +				pr_err("Failed to create request, %d: %d\n",
> +				       context_index, ret);
> +				goto err_spin_rq;
> +			}
> +		} else {
> +			if (last)
> +				i915_request_put(last);
> +			last = rq;
> +		}
> +	}
> +
> +	/* Release blocked requests */
> +	igt_spinner_end(&spin);
> +	ret = intel_selftest_wait_for_rq(spin_rq);
> +	if (ret) {
> +		pr_err("Spin request failed to complete: %d\n", ret);
> +		i915_request_put(last);
> +		goto err_spin_rq;
> +	}
> +	i915_request_put(spin_rq);
> +	igt_spinner_fini(&spin);
> +	spin_rq = NULL;
> +
> +	/* Wait for last request */
> +	ret = i915_request_wait(last, 0, HZ * 30);
> +	i915_request_put(last);
> +	if (ret < 0) {
> +		pr_err("Last request failed to complete: %d\n", ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Try to steal guc_id */
> +	rq = nop_user_request(ce[context_index], NULL);
> +	if (IS_ERR(rq)) {
> +		ret = PTR_ERR(rq);
> +		pr_err("Failed to steal guc_id, %d: %d\n", context_index, ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Wait for request with stolen guc_id */
> +	ret = i915_request_wait(rq, 0, HZ);
> +	i915_request_put(rq);
> +	if (ret < 0) {
> +		pr_err("Request with stolen guc_id failed to complete: %d\n",
> +		       ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Wait for idle */
> +	ret = intel_gt_wait_for_idle(gt, HZ * 30);
> +	if (ret < 0) {
> +		pr_err("GT failed to idle: %d\n", ret);
> +		goto err_spin_rq;
> +	}
> +
> +	/* Verify a guc_id got stolen */
got stolen -> was stolen

> +	if (guc->number_guc_id_stolen == number_guc_id_stolen) {
> +		pr_err("No guc_ids stolenn");
ids stolenn -> id was stolen

John.

> +		ret = -EINVAL;
> +	} else {
> +		ret = 0;
> +	}
> +
> +err_spin_rq:
> +	if (spin_rq) {
> +		igt_spinner_end(&spin);
> +		intel_selftest_wait_for_rq(spin_rq);
> +		i915_request_put(spin_rq);
> +		igt_spinner_fini(&spin);
> +		intel_gt_wait_for_idle(gt, HZ * 30);
> +	}
> +err_contexts:
> +	for (; context_index >= 0 && ce[context_index]; --context_index)
> +		intel_context_put(ce[context_index]);
> +err_wakeref:
> +	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
> +	kfree(ce);
> +	guc->submission_state.num_guc_ids = sv;
> +
> +	return ret;
> +}
> +
>   int intel_guc_live_selftests(struct drm_i915_private *i915)
>   {
>   	static const struct i915_subtest tests[] = {
>   		SUBTEST(intel_guc_scrub_ctbs),
> +		SUBTEST(intel_guc_steal_guc_ids),
>   	};
>   	struct intel_gt *gt = &i915->gt;
>   

