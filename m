Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789662A079
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 18:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2E110E042;
	Tue, 15 Nov 2022 17:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE8D10E002;
 Tue, 15 Nov 2022 17:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668533794; x=1700069794;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DzzV8YjXEWsiyPJhUXgBdk0ZWj09tDwpwvkXQfmmiBs=;
 b=USyTlpFs1PszsmfKZnJrvHdsUkmXCyR483ub4Rlaw8E/iqiwH1mu4c9m
 xepVp8cfHklIWwC/at+W7OjXTBKtLGfuVCh1cLJRsEBRd+KhKXqFKs7Sy
 RXneuATCNK+nyGc9wDnyRM5AAahHVXhrP+sQrKBNsESc7KLbC8eIEPPCa
 iM/b9olZVivbK/v3UguBmk2qyrEaOS5ENxmlXLOym6ZJB75mZRF/lqnJO
 RXVlI6ItNHuWbYYCdnSPI+Nl4q1gTlILaCSyxnkxYHpPRzoZdGJWqFMMt
 fxTAO9cS4zNHsyDw5HEeseXf7k2tJHmPyMu764Rvg8DXbHhLixKPU0MZ0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="398606676"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="398606676"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 09:36:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="672073732"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="672073732"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 15 Nov 2022 09:36:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 09:36:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 09:36:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 15 Nov 2022 09:36:31 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 15 Nov 2022 09:36:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Au1h+/d2Ot8p4G8csYtfMDYkb5rWh2VWSIbsMxJIvxExPYiDXB6yuTLw598VHAysC1JHbo7Djr0Ih8CM0vlyr4YpLRVw41dwZvJeexo18evAmietmG26G0ogqWxiSCnX8IGqqwgf16lhbjSnc75hDm+5pdSmdqBeYrm8ALkDDJHtvUuWpMmwRQ45WX+kT9ilPzYhu4K6Bj2BSezDuSYof9t5uKKSSHK2Jh2FrSvsGVYyhopt+PUlxA0x4x0XAsoMknd+b5r8EfWduFQORSa/zpEK3DTod+QG3LBm4eShNs0XGbK4UNCJcBx1EKMmIYu109E6Zu+xfE3ifcYMNOBczg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tknf43XwkaipWTbqu6I7jDzBmSvyMd+HjtccuwwpGNU=;
 b=T8UDGDp6njNl7N8lMkEbdGp0LxgXfPnt7KjmkvKEMaReylNlYZpgIDXL8pnebKR0gHSqTGiAqbJug9nXQdrtn8GoJbUTgIlJlfoeoFFZLHUOm0xzCRki27/+4ke7etRYabsFwkECV0pUMeou1/WjaZgJPmsf35hfuJ5NL57eJUzGdszBW1avFr5SzSehMfm9iw4ZtL7y0yh585+ccIn8HjuB0dIRkWxEuz+Du3ox0GUReEyISH8qnLBNtjMjqdbW6yE0QBfPWafrKgDhMFSILtpfSAw6jH2flgAR8YdVhfjCS14vqU70c7L8V/GygIOBFKMAZ4N2+e0Gslt5xaQ8Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 17:36:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3%3]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 17:36:29 +0000
Date: Tue, 15 Nov 2022 09:36:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] Documentation/gpu: Limit index to
 maxdepth=2
Message-ID: <20221115173623.ozd2aotubxliybyw@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221107173209.2219571-1-lucas.demarchi@intel.com>
 <20221107173209.2219571-3-lucas.demarchi@intel.com>
 <Y3NgUWlKr1ie83BW@bala-ubuntu>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y3NgUWlKr1ie83BW@bala-ubuntu>
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: e863c84a-7ed8-49f5-2d7d-08dac72feda4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rLdh+T/V4RBp6ooB3+LODnBKmXnb1sHvrzPa277vKTsHn62agq4/VG5FHzXPaP59hm0PYdY06li0KpvJ761OJaZVLfKiP59T68iKC8ZtAExpeGo2O2jRE9SmexCdJkF2853gGTeF/Ig0v7coAVG+fVhBhtWAXyBN5I2PCN1uQ3p7cCI3ZQ0vu6Bf19hrxqxBGssp0C9MgU4cq0GpKi6OTTh6gZDdzX4bwqxOTJ2yRhSu8n6HmIxghkUMgwEo8jratCHJx9D2n/4wMTWHtLtRzAcJu8WlH3IFAqUaUGvAhEnIKiGEsSnelKEYzMI6c4hdNLPV+X3zlp8g11IywBH+a+911qqvaAaWQVY3WXTnSUExBvgnM1MLVyar0OvcXKMHirx6nLV8vYrXn/bz9Z6mxk/bAbk96RCzbzqfxt9+C5YTwk5d+8RisSKOEQYrLQGrRQ6wawqmjvJwO/RXT0PhJpHtEN2teBTOZDoEN0ITlIimakHCbxx/zsRL6up6NaHKT8C3E0W3POLehatTvBb4ySPa3aVLyolqP2vIJFzlbCjc07ok7IBWgrqr6vQ5Cmxl2M4hy2ph1wq/jVXh+FItMixtw/5sgILdxLDtF367P62wi41DmwMji7kFKPzNXD/6ueEAeQ3hlVMtumUOFUWseiolKLO4Akl/fHtkT2KD2JO0MZgmMp7fDHuO3lOkgYjns2DJ16cle8CpOpSRwumVEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199015)(1076003)(83380400001)(38100700002)(66476007)(8676002)(66946007)(4326008)(66556008)(186003)(316002)(41300700001)(9686003)(6512007)(2906002)(6506007)(6862004)(6636002)(6666004)(26005)(82960400001)(8936002)(5660300002)(478600001)(6486002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sk0gY0cWQRRiyxL0/x5dcuszYmXj4w3wPmHyswskWgtond//Bjii96lg+/Rn?=
 =?us-ascii?Q?t9cNgGz2L4DQ7OV/BSJcEXPw9zUiGiCq5Iwv8EbpCXKObseT16lLEjgY8HLC?=
 =?us-ascii?Q?wEuXojopjrO1WoMhJensMoJKmL4RbMIxN52Nn2BsaKBwuj36wWBmVcWznDdY?=
 =?us-ascii?Q?DKxFaonVk+VR7vqVjTla5FHhblKTIgBnAhif+rs7dornZZ0zoeeBtabeNMYE?=
 =?us-ascii?Q?59zxwQI/8BftoFvCNWPVv6ECW3TEtJn/ouNmtrPh99tyqGzX1cb/mtmiwSQI?=
 =?us-ascii?Q?dnCdOzOLNBGQV0BkAdxSG79wqW8m7ndIzl2orxqbb0WNwBvRkHd8e335fsFq?=
 =?us-ascii?Q?Q4QCEtSULtQbJ8oBP+Wsid4qUiioN9XKD3giX7ZsRAOPv7xKRaNs7y2zFJ5I?=
 =?us-ascii?Q?Rnccl50HQddQx9Nipn2N8v6toEb+dtGkmEtBqL+MkqmguX1zO4GbKoTWbbnN?=
 =?us-ascii?Q?d3cfK5H5fd9SSAdv9NeORVqjFKJaza9MGTPYZ0X3IDsJAJbon7esBGE1A/x/?=
 =?us-ascii?Q?g1jrIBxpzihY2ms9vDJ/OjxC0D5Dc0HA9boCcssdVIbO1SGu7yRMq80VqCWX?=
 =?us-ascii?Q?CthkVw58YqoMLdrCeD4qS+nz0TjvbqYKOgcjaHx0NGcRJmvxHn/fOg3J0Gxw?=
 =?us-ascii?Q?LKmkrnab9yq4OSXWjT1OUxTWQGzkLlG6DalN4yC3L7BARseBpLPQf93uCkak?=
 =?us-ascii?Q?y/iP97cEDVatlE1WfIPHtUi5cTCTrwXZBMuHKXEN06K5MQ46YFYOZrebGKrW?=
 =?us-ascii?Q?gV0mlFqMUJD0pdgjUNuNMyV6xyUDMcKDHOBQbPKciwllrsPg9NWOwYHi4Ca6?=
 =?us-ascii?Q?Nl50ySpTKoxlul8DITkZf7rQhCZtS2INJxZQvSzbr9FVMl8BZXApRZQSMSJw?=
 =?us-ascii?Q?BFgKlbwesKF9erax/Xqj20fUCIt/6qOJX/2iqhJwkSAsJrErWg8HuZLXnlwx?=
 =?us-ascii?Q?7hsPHxH8RDaK26b4r1Mg7NUH63k2hWhilyu/nYuhlesyZ/7zhoEaDMDgllj1?=
 =?us-ascii?Q?hvCWVmVRHMnRLbW8AQrA8mc5g7TMaKEEFNzNpo3uM5P+swW1UgUf4imDedwo?=
 =?us-ascii?Q?8GklAibt9KHg6hbL1aXfQQ9JYUXr0mYSyCULntoZ+ORlcwliRVz0y5tKVrhW?=
 =?us-ascii?Q?FaKY4IDbHe/LJaoeHX4H4IRrvpg24vZ1rPa5qGPGnLp1kWQQCyDwPI8TG+2k?=
 =?us-ascii?Q?4mekWhgUWYeCh+qTTfF8K4CRDD5h6Ww2oEcKpVWy8sxmcltg5RJVcbTEj13G?=
 =?us-ascii?Q?/RHyT0he8yWSWnN/mZHA6VM3nQDjeESTxW+Mj24bgNBs5eC3ZDCXWTY3UgIa?=
 =?us-ascii?Q?rwnX3K65lJMIqrk+kSVaUFGgYY3SRsYzB8XmfB/BlSY6XFwApSOmhbx/pKuu?=
 =?us-ascii?Q?q1mMWMgVptIrrlz9TE9IajcBGQgC/riamdlB59QfYhc3cthf8lNhEQssIyFv?=
 =?us-ascii?Q?Rw0j3bgROR4QiWa/GX5wgW2x2wSIZRZQWSZFCcXW6x6u+ymbA8oK6khcKs+e?=
 =?us-ascii?Q?/WmoR13t7N2lTNe/7gWKDZZLVF5KEFdXcBCKKSCvDAHJOb78VnWvw0hpkarH?=
 =?us-ascii?Q?YNKTAx1phFyAG8xqFiyB2cywhdrhTYC5tiz660+DItKjYrAFSTV+nwYskaIR?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e863c84a-7ed8-49f5-2d7d-08dac72feda4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 17:36:29.2571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzD8/nVdr6xB/46jqm59CIXuiG8ArsPsaQ+VbnjoCo2RRkrypRzbkvnwcZqaJ7q89DHd1GPBzPfScZ9VvxZR5P8D4b/o38YHmbdORPM9mPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7381
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
Cc: intel-gfx@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 03:18:01PM +0530, Balasubramani Vivekanandan wrote:
>On 07.11.2022 09:32, Lucas De Marchi wrote:
>> With a lot of sub-section it's a little bit hard to find the information
>> needed in the main GPU index. Limit the maxdepth to 2 so it doesn't get
>> poluted with noise from each driver and from other sections.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  Documentation/gpu/index.rst | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
>> index b99dede9a5b1..1d9402d519be 100644
>> --- a/Documentation/gpu/index.rst
>> +++ b/Documentation/gpu/index.rst
>> @@ -3,6 +3,7 @@ Linux GPU Driver Developer's Guide
>>  ==================================
>>
>>  .. toctree::
>> +   :maxdepth: 2
>
>I have a bit different opinion here. I find it helpful to search for a
>topic if the headers remain uncollapsed.
>A top level view is anyways available in the TOC shown in the left side
>of the page which shows only the immediate next level headers.

I think the left side doesn't render very well. I'd still like to have
depth 2 for an overview, without going too deep in the innerworks of
each and every driver. Looking around I found there is a lot of use of
maxdepth in the indexes (git grep ":maxdepth:" -- Documentation), so
thought it would be something to adopt here.  Anyway, I don't mind
dropping these 2 patches if people don't agree with me :)


thanks
Lucas De Marchi
