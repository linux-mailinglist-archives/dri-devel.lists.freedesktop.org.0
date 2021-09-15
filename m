Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C828F40CD36
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 21:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3270F6E9E3;
	Wed, 15 Sep 2021 19:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1946E9E3;
 Wed, 15 Sep 2021 19:29:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="222467684"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="222467684"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 12:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="529750558"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 15 Sep 2021 12:29:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 12:29:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 12:29:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 15 Sep 2021 12:29:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 15 Sep 2021 12:29:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTHeyj6zOAFxYGfi6uT60Feilqyg7S3sqQSXMLko5dQmZjtPxrAzI6D9kwqjrKBHeTnzvDc+al8CkygNNEACVyaMMBO7vQbX9+dcbgNv8GjOcGg46RgYtzyGVO9UrLRLGVbZoJuf9cW/0FY/ePQpVTmZ4TntLAyzKq8g03wR2bbjAoh7KojwQjJqQsUkDaqEzRxxyn0U2p0Ul217XlqnthmzUxdwVgPg7Jfnp6L+6iEvx81OL38JkrLkhH1JAYY2EjO1cAVb0sX+ZXKBXthAL8QVKFatqkURN83juQuF9x6ZkyFiYu75Socve7sMvPK7IK9am6u+w11y8c77rcpiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=QhUEPJg/KLg8Tm6peWBvo6MQzUnJYa48QjocHb2Xhcg=;
 b=dhTWIzpRXyTuVCV3+tGnmcFhPMNPXezmdhgccXgc8qXbULcwx0J0Yuz4mySgrsD2Jx/wAypiiHAJEDWUnm3whicqLgQjPyqsgShBYLIkhzcGg0JLvylqi5sNJx9j52T2/cY+MlAPvocP7XS7Rr3YNiIBubN7DXZMEKVZe0zOS5viwmz7Wl7OdYojpRFeAsK7ekCA79hFUkfVix0orhoc0dwjJYJvSUiMNACno6g3ilE2asl6pnxKRyY5p1fD9iQf0v+5KFJU763h8PqygyeaR6DN2lonwZSO+OVGasYCuFB+ZLSjvk5IriI/TMa/3voziPpQMWrtuGeReLb+0DvbHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhUEPJg/KLg8Tm6peWBvo6MQzUnJYa48QjocHb2Xhcg=;
 b=uZWc6fImYIs1wQCM6YwsUDH05yz9xFM3AsVVG4S/3Ran4PtC+jbO0Z4gsj2UcM3OyBr58QO1nYZ+NqbNRWcdhZ6P2nE7ZHL0tKwNFg8Tcv9ol0FaVN6ML9cPhP/302DnAIsWqBixH5zbV+kt7fxB9GsqB2i2Vs0XUYXCucWUDwI=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5643.namprd11.prod.outlook.com (2603:10b6:510:d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 19:29:16 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 19:29:16 +0000
Subject: Re: [PATCH] drm/i915/guc/slpc: remove unneeded clflush calls
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20210914195151.560793-1-lucas.demarchi@intel.com>
 <27c071ae-13b8-d71d-d869-e9cbd7431afd@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <b6b996be-b60c-41f1-e531-77c2bcdda920@intel.com>
Date: Wed, 15 Sep 2021 12:29:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <27c071ae-13b8-d71d-d869-e9cbd7431afd@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:300:95::26) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR13CA0040.namprd13.prod.outlook.com (2603:10b6:300:95::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Wed, 15 Sep 2021 19:29:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f327f19a-dd7d-4194-c055-08d9787f1b09
X-MS-TrafficTypeDiagnostic: PH0PR11MB5643:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5643D5BF960E9D454D24F6E6BDDB9@PH0PR11MB5643.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s8OSVKmaXhSq9GIUWBdb6ejQXKOXyCU/RAUXsfsKOfSiuuOHXL+cxL5bR8rKKJ0NGsVkHnZ9b+FHYF/3FYtKhc0QBr7gOqVQYyUlJoys9lVOOzNAYzO/fdhzXKKoD8EqF3bRDXAYW5y4aKrjpjBCGzKut7HYj/iCCiMDquCLltOiD4cq8RE3cKfKp7NRKDZyKwVE17gHsPPgWS7z6ARJp+o2EQAxfVeXoBMVgJ1c9xES+x3zgHt3+eGUTgfTaFOo2nNmKEvuHVLdSbASImjMm7ebAKSAu4bBLxc3/loHVtAKBGSat/5wPy8/SFuChxxV0lTGPb3vWAi0albPql65cQc1nQTFCCR2K6+iOHnsmuig2OfgVX64SaocJhJgM+TVWYPRvXibkcOFQyo8KXSOyMtS+IApThx3LkTcaPIXBVswXrHi0GjZObdK096qo4M1oUX2B9b0YjHbEfA5z/ENX+eYf+pWuDci25YAVwS5u5M/AvKoBajyiz2rwWcvoGOEyNnD0arlxQ/m4gIqK1Mc4Ufh6zDRFaetotYYO1T9JPA6bMrpOb9yvFbW8TUs4/3QH024Z5CUWqt1/LntcdTegpDlK0waGXIIrC5fGXppj4a4mR9dP/NwWhD3YKGEjm+7etmCfamImR/rD+vz2RcynoxkGJ1vi0euB/gVId5wg+3RwtR9qzLA6dlcv2GnQWQTDxd/A5TErfIMZVT1FTfDMPsG1NI3hsERNcaZ063xu1xyvZHgmo7yc/jI9hhmNRwJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(2906002)(31686004)(6666004)(107886003)(6486002)(4326008)(316002)(53546011)(478600001)(8676002)(16576012)(31696002)(2616005)(956004)(110136005)(66556008)(66476007)(83380400001)(8936002)(54906003)(5660300002)(186003)(36756003)(450100002)(86362001)(26005)(66946007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3hGNnY3RG1Xb2d2b0c1Mm1ybFhXWnIzUUIyTEJGZWJKU3pIYWlnV05BQmRF?=
 =?utf-8?B?b016WVFDSlJFTWM2UDY1UGprdFhSN0ZFVCtVYmZ6cHUxV1U2TlBsOVBMa3M3?=
 =?utf-8?B?NEIxN253L3lmMlkrVzRDRFBVRDdyaVRTekJXajRNRENHWGwvWkZpSzZrb0Z3?=
 =?utf-8?B?djFoRFNiR1ZITzA5ZDQ0Sk0vSDVaTXpjRDhFaVF4NlpvMUFLYXV3L0M4YVRr?=
 =?utf-8?B?blpLTEhURTJjc1dQM1doSmgxSGFhNkIvZGg4OVkxN1NrT0ZTb1FUbVhPbVll?=
 =?utf-8?B?cWdRc3VmQTlCZk1hQXNFb0RIeXFFYTc4ZVdnUFFxeGtHaXdSTVNWSGVyZFFz?=
 =?utf-8?B?QmJITzJVQndaZTZ5N2dNSXhtelNGYksrVUNXTTVRVDZ3eUlPekl3KzdJbjdZ?=
 =?utf-8?B?cGNCTlFadXdxMDY1WnkzKytDZis5RGxsWGNvODYwTHRxRU4xRWU0TlUxQ1NO?=
 =?utf-8?B?WXBZd3ovcm1kZVF5YWd5eG52TGdoNk5ENm9iN05YbWlhYlRwVjgwS2VpcW5Z?=
 =?utf-8?B?RUY3RytUekZHQ214VmFlamZPZFlwMlRNZ053S1pxL1I0MDUrNVdQU3lIbnVX?=
 =?utf-8?B?Q3ZKMzlvZlk2eFFMZ01Lei83MnRmMkppckZ6Wk10Wk5VdDlHclFsMWVTSGJ2?=
 =?utf-8?B?NHl6amdYVHNnNnV1cEdHVHQzZFJ3Y0NBZVJXNU96S1BWTDZSUzIwWGM4V0Nu?=
 =?utf-8?B?VDVYcTM0QTdPMXFZVGJ1dEVNR3dHVU1sZlpzR0xlWm40WEtVUzlud1ZFaU9H?=
 =?utf-8?B?SXR1UnBneHpQb29ldHVoUUhFWTkxRmlMOS9HVHNUZjJYRzFObkFORmNXbWZ4?=
 =?utf-8?B?RUFyd2dlQVdWRUVzUFF3WXp4alFtZnkwWjF0QS9VbDBPcDdKTEtOaWJ1VVB0?=
 =?utf-8?B?MUlkZEZyaXhuc1lkRkwyeHdUVTQ0TnBHbm1PbVB0Q1U1RlF0NTVIUGtpZ0w4?=
 =?utf-8?B?eE8rTENKdnFLNDZVVVM5ajZNd2xZOWx1NU5Ha0ZXUk00Yy9RM1JSMzdHRGhu?=
 =?utf-8?B?Um9nei9sNy9ZZVduQWo2bEg2aGlCTEVTNmd3S1dwWDFVMGhhWFFYMDk3V0J2?=
 =?utf-8?B?cklrMXIvQVdDYWdTZFZoRnBHYlg4TWdmN2xKVlIrNFM2clBPV25GU1RwSEh6?=
 =?utf-8?B?bkhob2F4QjJuZW5pK21BTlBUMW5yTFVDNFpRSzY2T1Ftd29CT2piREdlckts?=
 =?utf-8?B?ZTk1S2U1QlhZc2VuT3QvajMyelNBdG9wV3NWUmRrQnZEZUpqSkRrTUNYd0Nh?=
 =?utf-8?B?Ynk2enpZL1BDVkxzdUZIM2FtRG81b0o3VndyRXVLRTFLWUtoeGk2MzAzQnFt?=
 =?utf-8?B?VnhsQ08yY1ByeUNvSExOQWY1UEhEdXlMb3BEL25KSmJjNnFmQUo5bmo1Q0Uv?=
 =?utf-8?B?c0ZMNHRsSHJjTWJSWFFEbERCZSs1UThOc0ZtL0tvNlRFZTFaazlxMlFad0o3?=
 =?utf-8?B?aTJDcnR2a2kvVkNGcEtYL2hCamZ2R1hmMmZPNktNOWU2dUtxQndpcUF3SzNl?=
 =?utf-8?B?dEk0a293TVBNSk1pK213WlJTQkx6Vm1BQXJhRDdsNHppQVBFbllob1kxc3VT?=
 =?utf-8?B?ZHBxS1ZjQnJ3QjZvVlRqSDJhQTFiSUJDTHZEVjZtZTJ3amFQZ09SRHdHL0Q2?=
 =?utf-8?B?YndWbitUQzZQMnhKUzJaeFBVc1N5bVM1OGc1Mm84cnNPYkdoMStaYXo2YU9W?=
 =?utf-8?B?UXlmdFVSdWw0cUtJTDF2dHJHMkxwL0MyMldnUGNPOWZjN1gvdTArK1pyQXRz?=
 =?utf-8?Q?ABtKbvf5ShrEgKQMZYYHHcePaPfAO/Iwh8nJYxx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f327f19a-dd7d-4194-c055-08d9787f1b09
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 19:29:16.0773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cEeviDq7N1WllYuM0SZ3poV9Ft718ovLkZo8m7XF6Wkfe6Os5IvZBluQos1KrlLmTgCuxaOaicFwwZKbgEjJvwQN7TDDqxxQwO8GHyT0sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5643
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

On 9/15/2021 12:24, Belgaumkar, Vinay wrote:
> On 9/14/2021 12:51 PM, Lucas De Marchi wrote:
>> The clflush calls here aren't doing anything since we are not writting
>> something and flushing the cache lines to be visible to GuC. Here the
>> intention seems to be to make sure whatever GuC has written is visible
>> to the CPU before we read them. However a clflush from the CPU side is
>> the wrong instruction to use.
Is there a right instruction to use? Either we need to verify that no 
flush/invalidate is required or we need to add in a replacement that 
does the correct thing?

John.

>>
>>  From code inspection on the other clflush() calls in i915/gt/uc/ these
>> are the only ones with this behavrior. The others are apparently making
>> sure what we write is visible to GuC.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 65a3e7fdb2b2..2e996b77df80 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -108,7 +108,6 @@ static u32 slpc_get_state(struct intel_guc_slpc 
>> *slpc)
>>         GEM_BUG_ON(!slpc->vma);
>>   -    drm_clflush_virt_range(slpc->vaddr, sizeof(u32));
>>       data = slpc->vaddr;
>>         return data->header.global_state;
>> @@ -172,8 +171,6 @@ static int slpc_query_task_state(struct 
>> intel_guc_slpc *slpc)
>>           drm_err(&i915->drm, "Failed to query task state (%pe)\n",
>>               ERR_PTR(ret));
>>   -    drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
>> -
>
> LGTM.
> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
>>       return ret;
>>   }
>>

