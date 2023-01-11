Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D455666318
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 19:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CE810E7A8;
	Wed, 11 Jan 2023 18:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3517910E7A0;
 Wed, 11 Jan 2023 18:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673463181; x=1704999181;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SFmSgWirUfWY4YK5fSw5nSJqzlMxeA1Dm9f1msI6WJM=;
 b=QCZD0A5Z5vScySKO3/N2PzxlUIA3Xzl4pPLmFQkzTRJUFqKTfWEH3m0j
 lnmY7QOCyYsNQXsQW6oPBT2OR5VE9C8oqM+uku0zIVOZearj/j2IHQNP8
 /u4QFohWFzeTmv7soW4dbxRr+YNYGEF6A0SmrxxCO3vNRKUWriB1wHS9z
 juzQdp4U55iRas+ff/mLR2vsRAruviZEk8ZeTKPMlq297sdnw98dTqA/Y
 l7vyBWn40zBoUXFh0nBFOva68eUVjwRDUNN7z6hoX3llmnHwgujdNN5xI
 /AJERdTjrv9KWtW/iJHyoRQcytT/39GFlzrl0uQiEZiHBXhy8kLM54+iz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311324913"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="311324913"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 10:53:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="635070491"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="635070491"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2023 10:53:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 10:52:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 10:52:59 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 10:52:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgha9ZWKkonmZzpONkHKJfzfHsHfP7efxg8LYHavvQ2rZFQ79l29dSdnebsAPKjUDwE7Tig2DQiX5YAKTgUZs4IibcJNw+ACQ+T+utCr2PY1xv8RIHYP7Iry4xoVdRIIC1+vNlTOYslIy/U66VzH/zJ722r8Da3UhKzCpQRGoB5MMOLSV1h8A23gadxFZN9+R/HtI8pijoCRFzYvJOZMm1HLJGUjGkU3XXIirn2M3MCGAwwA3quLdWFRQ9T2KZKPEtReEUuUrQddIWh8r1B8I6sTDC/Z3Rh4hha7HIy7rnFm1yCM73+BmXeqChkX8dJXM2Zie1VOPPB7X754BglSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pw14kt9gTZsUElVbcnU6+A2mCIPtrr39WSLTCL0ylfY=;
 b=TnPc2z3vY9o3TFd3KAZUcBPns6dVHXDWXpQZyT0U4CO41e9XzFCx6MCwcaubVabtIni4UD9URGiVHyFRH60A/pBkwNEWPbk8WywvDKzlcAdyCNYhKToAtFfmS9n64oqbUa4OBhgnsyq0DyK9FfCBXedAg4GycWr7UObC+1hpWfg4yVuHRpzmS8KKK9Z5buNWS8n+az+c/wjA/Nod/S2wNz8d5CQcEI6QC61qcpke//Qk+o9T76Cgyq1E+EOvJt/cmsSX+uSeFSDL6J6ZUCpawooi6xUFjC02Q9L3sji1dIrL0t7ja5YmiaL6bDv3l3jLtKHwqPCkB7MLNI5XKZQOMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH8PR11MB6563.namprd11.prod.outlook.com (2603:10b6:510:1c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 18:52:57 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610%7]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 18:52:56 +0000
Message-ID: <2bad7ddc-05e5-89f3-11b9-160df10ddd3b@intel.com>
Date: Wed, 11 Jan 2023 10:52:54 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
References: <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <3b1af19f-3500-3be8-9d28-ac7da5b7d728@linux.intel.com>
 <Y72KdvHchbAzbYW2@DUT025-TGLU.fm.intel.com>
 <b3225349-85fa-b30a-319c-604334e2f7e2@linux.intel.com>
 <Y722HdwGKB8swy0B@DUT025-TGLU.fm.intel.com>
 <703310df-21c8-57ac-8b27-4ae342265df1@linux.intel.com>
 <Y776yIC+iJDlchjo@DUT025-TGLU.fm.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Y776yIC+iJDlchjo@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH8PR11MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf32b00-507d-4efc-8e29-08daf4050da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BsEZiKFef9qEqmizCeWV3hgkjQXE5G+Lew1eWwdS8HEvP3DpTFWI/45XlMFm9Hkzd1pwNuNNIdc+YfJumKBTloShf5LdGn6Paviy2ACChkjHtD8xjhNxikYptFDNbEGcjZNAfsmd80JriSGvdMEHw/TvuP/HJmeTQuu4vVSrbiOUIK+BAMeq4LBw9QV3Nz7nm3FUy8Na+l54/vfog0Qh4YHUTZjUhxNE8wdd0phzjcwg63BrFAhDFv6PE4AtX7WCgqN3/YrfNkoHW8hbPjl/UJ6cscScsfMI0xx+QXRNdXAMJqcnKlGNm9x33vaLBxx1rKa/wmkJCU2+6JEolO3XTDQ1SoHIBP8Z+5cCk3gMY4LBIQnILH8iOtk2iFmtARuh030iwuJarAeEtLDJKhiJAsz8CKetr21cM3xo28RAnpcijdOYKDpalGkyuvmAJbj2VbFOBbR/Ro965Pvn3L7geIun/S0lFro+hYYtgtFjLN7fAekXfsdtzLK+XT8TN1ofjIrDQhSqmJLKpKYPnjeb/LtCl9H0e/YPpqs/T02mKwmJvatGW/09JYT2H4rXoX7UHCw300rx3gLxqGmtZk7vMk5ahRV2EV4PNJhoZWTM2MsXy+VS99Vrydl61IwLf5KRp9kuNoRsqXEdNk5IliMc8hv9eiCt94nyaYKuiBpoyK+IEdnAAEvJ3yFd5xljs7pJXG47QisbVYrrbUib6xx6Wn//CaY2BLWSwWRxFHvqRDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199015)(478600001)(8676002)(36756003)(86362001)(66946007)(4326008)(38100700002)(110136005)(5660300002)(66556008)(66476007)(31696002)(41300700001)(8936002)(316002)(53546011)(6486002)(83380400001)(2906002)(31686004)(82960400001)(66899015)(26005)(6506007)(186003)(6512007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWMraG1qTG5xa3hzTXNGRzgzWFgvVWpQRnY1b1BkbGJvdFFaQU5ZVHo4Y2V3?=
 =?utf-8?B?c1h0U3VwLzNPcFhtd3ZMdFYwZGM1VzA3dk51ckdta1phdG9pOUJHaENlR0dS?=
 =?utf-8?B?bE5rdmh3V2F5WmVMRDRqdGFjWi91VmVzVlJsSis0NVBWeERiQ0lPemd5bjF6?=
 =?utf-8?B?Sk5CQ2U3aURKTWNlVDNOamR6QTlPZmRHWjNtUUNtWWFKdEVDTjBEZFJlTmt4?=
 =?utf-8?B?YWJFd2s2c3l1eEt4elpHNFowd1RKWDgvbElFT2NySEtXcE4zK3ZoZ0RaMjBL?=
 =?utf-8?B?QWJ5Q3RwS1BNNm9hMUxKbUdmU3BjOGdSUTNWbU9xbysrL1NEdURLYnovR1E5?=
 =?utf-8?B?ZkpwNndXaER2MCtwbXVwZ1h3UXFXdllwRjNoOWtuNUxURnJiKzRqd0dzU2Fm?=
 =?utf-8?B?NVhLeUdCRm5DY09aMnFmckdQViswS2J1eG91eGRiaFMwR21JNFY2UFIvOFJM?=
 =?utf-8?B?Q3ZtVXFJMEQzU1Jsa3puRVBPUytxL3diSC9wVzlaVHh2L1FQbEtib0pwVUZU?=
 =?utf-8?B?U0s1cElrSTNRNTNSeXI1ckYvSHk5b3BlUHZWQ1dkZVh1a2t5RXlyYWNCMDZw?=
 =?utf-8?B?blYyYjROZHh0VDdnOXFLdnlyeklEZWtZcjZpZ250ZkRSMHh1WUlENTY5RjNn?=
 =?utf-8?B?cFdoclpQMjdBY2ErZmlIMEdEVkM4N3dBNnNYVWRmT3dUMUZYOExlQjFobml5?=
 =?utf-8?B?VUZHSzUzd1poMnRJcmF3WFo1ckRheEJ6RzRvdUdYYllEQ0xjamlEdEhNZVAx?=
 =?utf-8?B?QkpCRlFvUFd1VUsxaEhHMkRjeVNuemxOL2tZSnhaMmFVSXNVcy9aeXFmbU9h?=
 =?utf-8?B?ajZaWE5NTjJqbXg5Z1JxcThHOXFKb2pWUnRkZXROeVNFS3VxeGFVNGJITFhw?=
 =?utf-8?B?UTl3MUxnUDNOSkY5aEE3VlZtaDFXL053MWJoV2FEZUhmTytKR3F5dHFvWVFK?=
 =?utf-8?B?NDRuQWZVV0VFcVdiTkVveEM5dHJLTC9qemZVQlRuUnlTYU1ibG9BdkRIWVZv?=
 =?utf-8?B?bGc3VmVib21POWdtQmg4M2lrWElrVUluNC85cERJbll4bHh2eXFSMXNjWHpU?=
 =?utf-8?B?R1RnNWM3aExtL2pyaVM5WEJ3NjRBcUJZdDRlOEhYVVNlVGhubk9lZk9NbWdJ?=
 =?utf-8?B?aVhZSmwyK3pmamhINFVNcjBGQkttSk43R1BiWWt5ZGdZSmhGdWIyZE1VeHEw?=
 =?utf-8?B?UUVqSWJGaStpV2diL0w1cUpKcFJtL1lORHZOcXRCNzBTZ3JVZWhJcHppRVlP?=
 =?utf-8?B?RTB0U2hEdEtSVlluZU5aUHowTDBidUNHcG55d2EzeVBiUTdXQVBFWGt5cCtR?=
 =?utf-8?B?d2xKa01JUFpHdHhLb3I4NTJtSmxxbUdoSUl0OFBxYWJodlFHZFhSQkg0YWFm?=
 =?utf-8?B?dk10TnJ4MTNaUUhLMmhBV2lKZkprbkNRK01ob0M1RmRaRFZqODJybjg1WjZi?=
 =?utf-8?B?L1ZaQXN1aGVjQS9WaU9ZdGNJOFg0L0pnVS9Kdy9uczhHcTdjZHVESmphcUt6?=
 =?utf-8?B?VGhZZzd4L3M5SGdkRVdEVjBIeno5aldCUFBQaDNVbFRhNExzOFd4bFlkc1h6?=
 =?utf-8?B?cUVZbVZ2SndRc1RXVER5TnM5NTJtZHZxYnZ2MElrbHlVelliWTJreHhVMDhV?=
 =?utf-8?B?cU1mOGYyWHJDUXVMaFdObVgzM2hyOWNzWkhPelFpcTdOdmVPTmlnN3Y5b0Nm?=
 =?utf-8?B?TkNvQkUrSW1ncVBpUUdJTDRLUVp6VE9qMzMyS3hqajdWcVZzOUl2endQZ1Av?=
 =?utf-8?B?NzhBMjNEMnI5RGlxd29ONzdGWW9NK09vbjZkUm5YNVpsTVYxdmJ5MTZqVWVN?=
 =?utf-8?B?STU4d09aRlcrY2JRYmJadG5jOS9nTDEyR0xhYVZBamJvRXZvOHpWTFArOVZU?=
 =?utf-8?B?WEsyUXhvNlhXbGttaTNnR3VRWC9wZmFPVDlnOXFsR3lxQll2M09ydHMwVlJF?=
 =?utf-8?B?WHdOTG9sVkJURjdyRjROU1hjUU55amk3eW5oYkFDZkx5OHBOWU1zcExNemRM?=
 =?utf-8?B?Yk83SkhGTDNORU52Q3daTnlZb0hadkVuMHExaFN6WG1rUTZoaHkveUNML2J2?=
 =?utf-8?B?NDdXUVdHaGFiSXh3ZFVzN001VXZUWkdJNVFTNWFoalIvbzgwUE5ja09rUEJY?=
 =?utf-8?B?MzNhdm5KTFJrSVZDTzV5WWtrTlhLanBTdk9XREl6a1NBQk5UWVZ5V3UrOXpT?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf32b00-507d-4efc-8e29-08daf4050da4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 18:52:56.8342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sPA5cpRGraEvEeo4hBk7ojKvB4XbXfEW20o80MPPziIJ4cmiuCbxetIli1rvS6cqw2IG4W1jaqPXYMy9epcX9WCfmoblIacBlhNAagk7fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6563
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/11/2023 10:07, Matthew Brost wrote:
> On Wed, Jan 11, 2023 at 09:17:01AM +0000, Tvrtko Ursulin wrote:
>> On 10/01/2023 19:01, Matthew Brost wrote:
>>> On Tue, Jan 10, 2023 at 04:50:55PM +0000, Tvrtko Ursulin wrote:
>>>> On 10/01/2023 15:55, Matthew Brost wrote:
>>>>> On Tue, Jan 10, 2023 at 12:19:35PM +0000, Tvrtko Ursulin wrote:
>>>>>> On 10/01/2023 11:28, Tvrtko Ursulin wrote:
>>>>>>> On 09/01/2023 17:27, Jason Ekstrand wrote:
>>>>>>>
>>>>>>> [snip]
>>>>>>>
>>>>>>>>         >>> AFAICT it proposes to have 1:1 between *userspace* created
>>>>>>>>        contexts (per
>>>>>>>>         >>> context _and_ engine) and drm_sched. I am not sure avoiding
>>>>>>>>        invasive changes
>>>>>>>>         >>> to the shared code is in the spirit of the overall idea and
>>>>>>>> instead
>>>>>>>>         >>> opportunity should be used to look at way to refactor/improve
>>>>>>>>        drm_sched.
>>>>>>>>
>>>>>>>>
>>>>>>>> Maybe?  I'm not convinced that what Xe is doing is an abuse at all
>>>>>>>> or really needs to drive a re-factor.  (More on that later.)
>>>>>>>> There's only one real issue which is that it fires off potentially a
>>>>>>>> lot of kthreads. Even that's not that bad given that kthreads are
>>>>>>>> pretty light and you're not likely to have more kthreads than
>>>>>>>> userspace threads which are much heavier.  Not ideal, but not the
>>>>>>>> end of the world either.  Definitely something we can/should
>>>>>>>> optimize but if we went through with Xe without this patch, it would
>>>>>>>> probably be mostly ok.
>>>>>>>>
>>>>>>>>         >> Yes, it is 1:1 *userspace* engines and drm_sched.
>>>>>>>>         >>
>>>>>>>>         >> I'm not really prepared to make large changes to DRM scheduler
>>>>>>>>        at the
>>>>>>>>         >> moment for Xe as they are not really required nor does Boris
>>>>>>>>        seem they
>>>>>>>>         >> will be required for his work either. I am interested to see
>>>>>>>>        what Boris
>>>>>>>>         >> comes up with.
>>>>>>>>         >>
>>>>>>>>         >>> Even on the low level, the idea to replace drm_sched threads
>>>>>>>>        with workers
>>>>>>>>         >>> has a few problems.
>>>>>>>>         >>>
>>>>>>>>         >>> To start with, the pattern of:
>>>>>>>>         >>>
>>>>>>>>         >>>    while (not_stopped) {
>>>>>>>>         >>>     keep picking jobs
>>>>>>>>         >>>    }
>>>>>>>>         >>>
>>>>>>>>         >>> Feels fundamentally in disagreement with workers (while
>>>>>>>>        obviously fits
>>>>>>>>         >>> perfectly with the current kthread design).
>>>>>>>>         >>
>>>>>>>>         >> The while loop breaks and worker exists if no jobs are ready.
>>>>>>>>
>>>>>>>>
>>>>>>>> I'm not very familiar with workqueues. What are you saying would fit
>>>>>>>> better? One scheduling job per work item rather than one big work
>>>>>>>> item which handles all available jobs?
>>>>>>> Yes and no, it indeed IMO does not fit to have a work item which is
>>>>>>> potentially unbound in runtime. But it is a bit moot conceptual mismatch
>>>>>>> because it is a worst case / theoretical, and I think due more
>>>>>>> fundamental concerns.
>>>>>>>
>>>>>>> If we have to go back to the low level side of things, I've picked this
>>>>>>> random spot to consolidate what I have already mentioned and perhaps
>>>>>>> expand.
>>>>>>>
>>>>>>> To start with, let me pull out some thoughts from workqueue.rst:
>>>>>>>
>>>>>>> """
>>>>>>> Generally, work items are not expected to hog a CPU and consume many
>>>>>>> cycles. That means maintaining just enough concurrency to prevent work
>>>>>>> processing from stalling should be optimal.
>>>>>>> """
>>>>>>>
>>>>>>> For unbound queues:
>>>>>>> """
>>>>>>> The responsibility of regulating concurrency level is on the users.
>>>>>>> """
>>>>>>>
>>>>>>> Given the unbound queues will be spawned on demand to service all queued
>>>>>>> work items (more interesting when mixing up with the system_unbound_wq),
>>>>>>> in the proposed design the number of instantiated worker threads does
>>>>>>> not correspond to the number of user threads (as you have elsewhere
>>>>>>> stated), but pessimistically to the number of active user contexts. That
>>>>>>> is the number which drives the maximum number of not-runnable jobs that
>>>>>>> can become runnable at once, and hence spawn that many work items, and
>>>>>>> in turn unbound worker threads.
>>>>>>>
>>>>>>> Several problems there.
>>>>>>>
>>>>>>> It is fundamentally pointless to have potentially that many more threads
>>>>>>> than the number of CPU cores - it simply creates a scheduling storm.
>>>>>> To make matters worse, if I follow the code correctly, all these per user
>>>>>> context worker thread / work items end up contending on the same lock or
>>>>>> circular buffer, both are one instance per GPU:
>>>>>>
>>>>>> guc_engine_run_job
>>>>>>     -> submit_engine
>>>>>>        a) wq_item_append
>>>>>>            -> wq_wait_for_space
>>>>>>              -> msleep
>>>>> a) is dedicated per xe_engine
>>>> Hah true, what its for then? I thought throttling the LRCA ring is done via:
>>>>
>>> This is a per guc_id 'work queue' which is used for parallel submission
>>> (e.g. multiple LRC tail values need to written atomically by the GuC).
>>> Again in practice there should always be space.
>> Speaking of guc id, where does blocking when none are available happen in
>> the non parallel case?
>>
> We have 64k guc_ids on native, 1k guc_ids with 64k VFs. Either way we
> think that is more than enough and can just reject xe_engine creation if
> we run out of guc_ids. If this proves to false, we can fix this but the
> guc_id stealing the i915 is rather complicated and hopefully not needed.
>
> We will limit the number of guc_ids allowed per user pid to reasonible
> number to prevent a DoS. Elevated pids (e.g. IGTs) will be able do to
> whatever they want.
What about doorbells? As some point, we will have to start using those 
and they are a much more limited resource - 256 total and way less with VFs.

John.

