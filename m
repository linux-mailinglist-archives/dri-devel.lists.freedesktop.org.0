Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 620DB541F51
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 01:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A74D112117;
	Tue,  7 Jun 2022 23:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A6F112113;
 Tue,  7 Jun 2022 23:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654643085; x=1686179085;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tCNQOngvkuoiliRAdWTH906xIcrki6/P+OSbXefG9bM=;
 b=eN5Azf4hyPIkJJp8MP8HeIzoV+PQhfcQ42q0GLi4D6Dbv5LaghpEDKhW
 GTihYXSqCnsTtXeB57CeMjRThOcKXG8vwTn34ltMTIna7N04C4enzg4TV
 UtHwlcreogjhNeCmy9GMOkfzh+xKsCMwCLHMTRO4b2UtY1ztzaTcOCgOX
 MtO+06vP/Oc5+aXhekZosD0tuNGh5zFv4/BXA21U+OWuLqcslnbUVXAYZ
 pXCSs0CRrzvvVndmsJg7nypOh9vz1gz96ovMQeL7bGP541AaMBC5IFLru
 W+nPMXXhOMcXngtGOnH6Rn+pLwMUyAb0sfo71YUYQxQuKVapbyb+7pS3I w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="275532751"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="275532751"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 16:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="609405335"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 07 Jun 2022 16:04:44 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 16:04:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 7 Jun 2022 16:04:44 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 7 Jun 2022 16:04:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QB2tqrYY1kJ13kwE+X3oq2oFBv/zp+AoPzZV3saMMl2G7V5u6sgyk9L6hZ2mxXEVVgMhnMGC++PKZ5soqKEE8YCygsATXbll4ambYivjupE/6OHb2mV4i4FPce6jevWPyaETEiRW5DdjdLclBoC+IeXauxeN0qL4bGUSOsj/DAc+VvZ4SM0cEf4ZNOvh65hF70TbshIn+7rkBR3ZULpY7XgJVqq5x/g7KkfOZ6peAEvoMAW95Mn2mmZgscsvW+1yEHaKrG4XzvwiRgnlrDayyEmCJ6UyHMEJ97k2NuJUDV56S6debdZcTNElzmg1swEjPH1eNvoTls7sHmF7vWbqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56qoDPjgC5f70BhEQHNu5Tr7dkwtv03212zTBDF3nq0=;
 b=IP4A3dhUSIuSUDzEIngIcDvnG6lJkZDQbBt8kzugkUbHQ4f4wLDCBd0qSxmuUZZErYFGk/5TcnXQMNMBVqEJFc2ATYi8GGLdzboVv4g3ZUybOwaT87NPZ6m8/1gGZegg3EFAU295swVnTEobbGtzeQ6GgzSpU02T22cHR31i1A5ZbmGbfSszQq2cILKMLSd23idS/ztkUjwj4tj0tFqH79FsQjFae/NbMc9UkW7WWKAvDf5Jo+zHHKyQjEMIOIFFNA8ngrKxmDysXyxFAQ0gEng48FYy8uxRFvkV5iQahNNrKkRehnw2Y/TIBrRCfrAFelxQ/CXNXPvUsWU2MmQvxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 7 Jun
 2022 23:04:42 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::c4f8:da8e:7cef:8cf]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::c4f8:da8e:7cef:8cf%6]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 23:04:42 +0000
Message-ID: <2fc2a62f-4146-c738-3c68-ca70c64e8c29@intel.com>
Date: Tue, 7 Jun 2022 16:04:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for
 waitboost
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20220515060506.22084-1-vinay.belgaumkar@intel.com>
 <874k1pj4bi.fsf@intel.com> <2f66b35c-e7a1-fb48-e490-566b05f9a03b@intel.com>
In-Reply-To: <2f66b35c-e7a1-fb48-e490-566b05f9a03b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:303:b7::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a325b81-de4d-46c5-da49-08da48da1b3a
X-MS-TrafficTypeDiagnostic: CO1PR11MB5060:EE_
X-Microsoft-Antispam-PRVS: <CO1PR11MB5060B78C345E853195388811BDA59@CO1PR11MB5060.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9swbCKIb260GezgoRVQUSrdN3iWQosN53zvy74YzpuB+8vc2rDHaOpqvs7lxvDcbEBf2XNgyhymksiMEubNwz0R2jbQWkfuQV19WfRdehymo+adrtnMfpkvwYAKU88ACPYasUKgZRp0THbf++fH74kkcYe6c0Bvv8vncupOUhNG3Ax7UMFmm24HFHJmT3TdeyGnG2dS3mTK0F0sB9sidk7SQIAdCaZrBQ64t3BdtRbzjSp0wZ8MjS6DoDDgJhN6QP+pJzf5KbcOpt1zWjkkDDU5/yxhuUaIRQh0HsVnjfmUq8E+l9wWXRITulpMKu/dTkyj+X1RCrjZ+1EM/aJkzmBWiXkEqcJU4FBPrUuadnV63g1/Paqw3iYsRepHhe5pOm0YeweK64sZR2CpzHBZFjaTe0JApKNyHjBkeC1oU3ZYalbcy6PULjV+zJMpAnddmGRwVhHi6dgGlBHSF9sHyn8eedKP+pkvyhj15Lj/fvQDM/ipuuuSFeJJLbSJOnMYbVFXyEmXavL72IgPC8fw5nTg07dvvcCOn1oCaBAKqyvH+33KEz9k0zlgiCdkST4ccb2Y36exKWH8VAk4dx015n7uir3qiOUQf409XX7bvyko/nDPoOMe5G08Nku3nU1WR4jzccWDAgJiHY+VmQRpd3G1hgwQCEo0YKdcQnDbEtet+W3l9t+2Cu9Nd7L2PpVfz29ifJQTSiKZiJJSmJnUSnuhy5ebYf71nzEv+TqzJk8i7mb9iv5fCP1fTx2yzSgMx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66946007)(6506007)(53546011)(38100700002)(31696002)(6486002)(86362001)(2616005)(8936002)(186003)(5660300002)(36756003)(2906002)(508600001)(66556008)(82960400001)(83380400001)(31686004)(6512007)(110136005)(26005)(316002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW9adlF5ckR1a0VQNW5Tc282TGM1VXlBdjZsbkcxUUoydVpDS1k2Ky9rNUl6?=
 =?utf-8?B?SmhZU1hXdWhMMTlva2lEVUVZc1RWVG5pSld2N1J4RFJKcVRqVWxidzhWZEd6?=
 =?utf-8?B?KzNkUnc2VWVLa1pzVFRLa1BKREphSW9HckdoOTE5M3FtMnNNVGUwSWVCWHRX?=
 =?utf-8?B?eWJKRUM1eTZZUG9wdGsvQ0lvUmR2WHJWT0JRN1cyYzd2UEExdm9qNTkvSVVG?=
 =?utf-8?B?QVFLRi9ReURkNmxBYmJobm1OajhCMTByajlOeFhMSzZJQ3IvbEtTUTFKT0Ur?=
 =?utf-8?B?ZDkrMjRWbW0zMk9xZlJqcUhkYzhXK2c2THNXb2NXOG9jYzdTYndFZ1dNSGpz?=
 =?utf-8?B?WW1LTy9iYVBKNzFBWlQ3TmdIWFlBbTdhbStXZXRXYndEOElVTDJGWE9uMmRp?=
 =?utf-8?B?Skl5bnJST2dTcU1aRXRTRzQ0azMvRnUzQXQvZjFrWFZITGovZkQza2FSNGVE?=
 =?utf-8?B?OVNxa3RxNVUwMHNKR3V0VjBkMUpCbkxNenJ4eTBKamEveStXNy9nSHBQSjVK?=
 =?utf-8?B?UEtBc09ob1E5SisrUzFmWEVRV0ludTRDZzVaM09ITW5GaHJPclQzMHREUFFZ?=
 =?utf-8?B?dms1OGgwTzZDRnFURWFrWVhmK1JRbTFRdUZZb0VvcXFha3BqQWlFdGc4RGdF?=
 =?utf-8?B?RnRwSWthVWZzcVJWWGI4SytUMDdoTlJjaWlGUVQzUHR3WjZTUlRydnYzZjZk?=
 =?utf-8?B?OEVySW96OS9zSjFKV0hPVjQrMG5JUndQVWhYN0lJWDB6YmdseXNPSVVqNGdn?=
 =?utf-8?B?eVIyaldtMDBYTnI2Rm1DcCt3b3kwUVFWS2JjclcwM0hiRVZpZEo5NU5CZ0ZW?=
 =?utf-8?B?eFBBNlp0Q2lvZnIrYTVkYi9iQkxkOEtlelhNQkovUFhCaTl4UFpDNWxKMFdz?=
 =?utf-8?B?UTVKcmxzbjI3bzZhdDNqbmNlSlUvRDZMc2M4UEZqNlRZeU1WSElWaHl6aFcz?=
 =?utf-8?B?amttWEd6bU9WYW5kWmdPSXlDaDJ0SW5TUUlqVVAvdVhmdkxVRnZxUnJWVVYw?=
 =?utf-8?B?U1Eyc3ZnNHBwNWVLczNlQTZqWG04cVpQb3dHbXZZbFYramtidVJoV1RObU41?=
 =?utf-8?B?OTM5bnZRT3BBM1BPSU9wbEpYdTVteTJRTmNDUWhVVEs2RWVReFhRKzJQNDZU?=
 =?utf-8?B?QVVMVnBRemlVWlc0YXV3RUFFN29mWWdSYUkzZTduNnFkTnkxZG9DTVlEV3lC?=
 =?utf-8?B?VERkWTJXL2xjOTlRMVVha2JTZHhYQ2ZMdzRTMFVjNWhLU1hHZUNkcysrTXFH?=
 =?utf-8?B?cS9Vclh3ZGkzSkFlZ0VEZCtYTEhQeElKa3h4dzlYZURMcTMvY21lR0ZwM1RQ?=
 =?utf-8?B?TXgyYVlUNGkyRlo2NjB4V1NaUDE0a2hDUUc4N2ZoSmZaWVVWT1FEZ3lkakVj?=
 =?utf-8?B?Q2dGQ0haenJsdzVSdzAycnFRYW1EdzRNYnN6dXlpcnFEZ25DY0VtSis5L1J0?=
 =?utf-8?B?NUduZW45clRBTXdLU0pLOEVIMVNBU1VmMDMvSnh4bUhMdStNV2lHdGxweWl0?=
 =?utf-8?B?dU5meDdON0NZTlhjelpuUHM0ZzBVR1lWMVVYa01EMDFJNEVhWWE2dVM3TEtm?=
 =?utf-8?B?WEwzQjRyUjYyS3JvSllLd3ZMMFBSQk1iSHg1RE14VXU0c1IzSlhpK0plcmda?=
 =?utf-8?B?T2JMNWZKTWpTYkV5WjlLYnFqQkE3SUhQajNFUkcvSERZdVpUWHRPYld5Z0hH?=
 =?utf-8?B?LzJsRDY0eE5wRE5LZzQxNnc4c0g4UnNjcEoyQUc1Uy81bjlCem1QUnVUdDZZ?=
 =?utf-8?B?dkFYSEV0eWFNMHd1L01nVURjNElvWE9nY0tQWFduY3BoTWNjL0lheEJMbUJY?=
 =?utf-8?B?b2k5aFpiRkkrWVZzZ3VEZjBDOFp5VmhtREdCdDRIN0pOS1FjY0kxNWVvMm1s?=
 =?utf-8?B?QTNhWDlveVBvUXhNY0RTdmk2UlpySTNBUmV3UHRnb0h2TDRhZHNBbzhKbmlw?=
 =?utf-8?B?M3dIbWFvTStJYU8vV1k1VUpVTGhCaVgvbWo2b015bFFjNENyaE0wbmUvcXJF?=
 =?utf-8?B?RFNTaTNEVHNybE14WHR4REgyd2hYa0pGc1RWd2hJUnllUkM4bXNXbjhRVE1L?=
 =?utf-8?B?Z3RqcUxESGJLbldwNWJVL1RubWVtT2ZzTFpwWFh1WkdjNWdkTHMyVXVJLzUy?=
 =?utf-8?B?Y0FRN2dDMHFwY1lYMTYyY24xRDJhZVdSVkhQdHRYOWNXU0hVWGswRnZMSWJH?=
 =?utf-8?B?a0tudjV6ek5FdE0zSncxQitkcHMyNGpSL1M4OGc3SjhGQ21IYWJmdlZwaVV1?=
 =?utf-8?B?TzRGM1oxTG11MVFPZi9ib0gxc01WWTJ3N200VWZnWFdnTWZLOVJqS20zQXdQ?=
 =?utf-8?B?Qmk4TGl5VmRXT0cvRk9oS052b0c2akE4T1NsS2cxVnY5K2dTeHB4dXo2cUV3?=
 =?utf-8?Q?VMHB29xMVHNJSB5s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a325b81-de4d-46c5-da49-08da48da1b3a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 23:04:42.4821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzotATCUpyind+TE+Qk64pSvaW2XWDn4y4lbwhPSpkAJk/D6lzPkBF4zzUeG2izX2GtmBrOh/SZyidvlJpuBfHJ3FOU67XN7fVNgR394OiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
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

On 6/7/2022 16:02, John Harrison wrote:
> On 5/16/2022 00:59, Jani Nikula wrote:
>> On Sat, 14 May 2022, Vinay Belgaumkar<vinay.belgaumkar@intel.com>  wrote:
>>> SLPC min/max frequency updates require H2G calls. We are seeing
>>> timeouts when GuC channel is backed up and it is unable to respond
>>> in a timely fashion causing warnings and affecting CI.
>>>
>>> This is seen when waitboosting happens during a stress test.
>>> this patch updates the waitboost path to use a non-blocking
>>> H2G call instead, which returns as soon as the message is
>>> successfully transmitted.
>>>
>>> v2: Use drm_notice to report any errors that might occur while
>>> sending the waitboost H2G request (Tvrtko)
>>>
>>> Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 44 +++++++++++++++++----
>>>   1 file changed, 36 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> index 1db833da42df..e5e869c96262 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> @@ -98,6 +98,30 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>>>   	return data->header.global_state;
>>>   }
>>>   
>>> +static int guc_action_slpc_set_param_nb(struct intel_guc *guc, u8 id, u32 value)
>>> +{
>>> +	u32 request[] = {
>> static const
>>
>>> +		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>>> +		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>>> +		id,
>>> +		value,
>>> +	};
>>> +	int ret;
>>> +
>>> +	ret = intel_guc_send_nb(guc, request, ARRAY_SIZE(request), 0);
>>> +
>>> +	return ret > 0 ? -EPROTO : ret;
>>> +}
>>> +
>>> +static int slpc_set_param_nb(struct intel_guc_slpc *slpc, u8 id, u32 value)
>>> +{
>>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>>> +
>>> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>>> +
>>> +	return guc_action_slpc_set_param_nb(guc, id, value);
>>> +}
>>> +
>>>   static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>>>   {
>>>   	u32 request[] = {
>> Ditto here, and the whole gt/uc directory seems to have tons of these
>> u32 action/request array variables on stack, with the required
>> initialization, that could be in rodata.
>>
>> Please fix all of them.
>>
>> BR,
>> Jani.
> But the only constant is the action code. Everything else is 
> parameters and will be different on each call.
> ...

Oops. Just saw your follow up message. No worries!

John.

