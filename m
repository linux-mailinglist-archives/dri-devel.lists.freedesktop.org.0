Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4747AC5C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 15:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215D412B2D4;
	Mon, 20 Dec 2021 14:43:34 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B986812B2D4;
 Mon, 20 Dec 2021 14:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640011412; x=1671547412;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bb6G43SJuejLbzpa17HhNHSH/wr3iX0WV6oVolQwTP0=;
 b=O0f8mU3lddqXCNDPoEfVeyUipaOnslRnhiaKs/lNg5pEe5KfocZtQc8R
 oRP+6YbsqGrHn5Wuj1lBfCdzdyJ2/0Dz9UlNvp/N/+ZKVYUO+7P7+8TsR
 gWbJJROMXiQrzW3ZpUwiX9FPhc5XE2dvHWLuHjB4vAw9JiFxxu+Uhk5oS
 qbl/cJ9FToU66qPZWxwW17SQqJSqsiC3QAF0+fm54o8owXt8lnYGzWCg4
 YpXLsjjhpEut4cyb9dU5mQl5bRqfnE6fM5xbUwduKIyvcgZfG+Fc4uWnT
 lVSsA1PXme/Awj6qM2Uiz6A5OEoHIlGklbXouIZwHNDN8YqvoEW33l9mL Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="300948512"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="300948512"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 06:43:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="757308971"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga005.fm.intel.com with ESMTP; 20 Dec 2021 06:43:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 06:43:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 20 Dec 2021 06:43:31 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 20 Dec 2021 06:43:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUWCQRup9xlkJo53WGtGGJtXwmLORLQP6lg/YilUCsi8iltzq22ej8Y/LqLupzDzBIXE6fEveM6l4YbZDPQHozfxMF2FDBb3vw7DFi0rLS1+wpD7ilboFKD68QitazHRT4ZdnmqShcs8t/3/rUQGoskJHDDgUw8E2Z9Ezcb4utwX5wL1ygSX5CLbTHCT7rumLgY5nta03XkcXY2ZewzdPHkP+UxvOeq/06apZAgoOeOuma9v49rSskHjiZXXY+bogNDl51hKjxt0ubbwXOEC77nc5XgSZRbN1Th0dwrg9QPN4Fl6yGlcXNTzfDdizb8WfOEOOG7Jj/mFK7wv/GMGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRIW1d77A+EG5bH3vugxatnbEJXxq/3UR2297AADCK0=;
 b=JQiWYTm9iF9lftoze20p7ZydWAft8AyobGkFLyeUyEDggXp38KmK9h9uZAeNaarozwbDikw92sL49kHu6gybORPbrXItRw4EpKDY8ftKmanYzo56FbPBGGPt6oQ4gLy2dhB8oyFYxG21cNq6M4JMBPgXl+HK81k3hEtwM14fe8sPh09DCRJ20+S8MZPvD5onOtbXRd2F56uqd+KqHmFUmyQ561CbrV5MgfVthQ1G12LTigA1/44ElJMZJjviuHXq5i6s+bXXGwVnD1CDF1N7u2FuT05LpdOrTQTADnZCglAhlvUwe+LmhhZ/8IRnqiwaaurpU8Q0ZFJw80iWMJWkMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB2569.namprd11.prod.outlook.com (2603:10b6:5:c6::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Mon, 20 Dec 2021 14:43:23 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::6891:cc9:565a:f331]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::6891:cc9:565a:f331%4]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 14:43:23 +0000
Message-ID: <f2a258cf-f569-40bd-be35-782204c6119a@intel.com>
Date: Mon, 20 Dec 2021 06:43:18 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH 1/4] drm/i915/guc: Speed up GuC log dumps
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20211211065859.2248188-1-John.C.Harrison@Intel.com>
 <20211211065859.2248188-2-John.C.Harrison@Intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20211211065859.2248188-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0254.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::7) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a284cef4-c567-49d7-e67b-08d9c3c712c1
X-MS-TrafficTypeDiagnostic: DM6PR11MB2569:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB256973A5B54394C56B1406FDF47B9@DM6PR11MB2569.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jG83HdmCDBn6RsNYYa3x4ytlXtgQG1OL3g432jZYgw1gXoiNDXd09HxBK01kNEo8c3/eyxUeLsqj37B+GwhsXUYpHtZeSdvw1ZoGJrssL6fODuW0a3zNUAO+k1NZh0C5ssEFnRwoQ6sXJv9f0pO40B2ri1A3h5Es8DseKbPmGyT66JozWYPjWMoY2wHEIaau3TtrNPzVr1Pgh8agiTZlYnXtlwDrnhV16Wze4QjATFcwVdWn/JOsd9jGH9KNYhuDJ3Gc/vr9bMn2/zDCT+6NRdfKxaNwAq2/wKI/wlfwJHbbmjizT+3rI6ISuJz6INol4mtzWUlqFssgmMMYpWe+W5H3ogLXA6JEBoBKO3cDJ5KBkrx6Fup9ohGfE5y33VSftrtCy5OguykB44ztswqGC6uObVAIlfd7fpke8XkewvuicHr+kXIvJ6//L2L2lE7o8Hafr54R0VlvL3jizAH1GcRVJNORouZ7mDP0pXAEQ/DD1IUsUc6uqsSkV7gAeOWgekk5mcy6bGgL9xCS3DjLPQDZirArFLX+e28+Nf7F9H7YMWJyDiYWsjy1oYwrcj+5TXLK8bYBGAaBRLSeawsjx6HpdnkoXO97CSASu/9gwzORZdrdYnFKFC6mBiUUpdLgStrwmI35LYqhXteOcfkdqtp/p+k1iKx/hpq8rirrcvEDrXs1mMKFrTbWKbyx8Q/Q93j/dmuIhJeNjDfm35HKKxKtmnsQPkf88BHJZtsgxu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(6512007)(66556008)(4326008)(53546011)(82960400001)(36756003)(31686004)(5660300002)(86362001)(66476007)(31696002)(6486002)(66946007)(8676002)(26005)(186003)(2906002)(508600001)(316002)(6666004)(450100002)(83380400001)(38100700002)(2616005)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU1tcmVKMEVTTExFOFh3L2NEMDJ4NXZueStpdUxWYi8zOHVCTTA0WjN5VHRq?=
 =?utf-8?B?OUlrb3VJcS9MK3ZuN2VKMTZSdGRkZCtyMVpiclRmSklhSGdaMTZoWmRmaFhT?=
 =?utf-8?B?L0pKdGJmbnlYRGxtL1F6YjZyNmJ4WEk4RXVWZVNMTWpkZnNjM0MzTkEvRDRx?=
 =?utf-8?B?a3laQUJXclNTYlpvRFdwVFVKZVhJZzd6RnB4UFc4cnNCT2cyeHZDT0l5UE16?=
 =?utf-8?B?YTJxQmNwbXhxeVJ6ZnNlYWZDeGREaHRTR2dzWUVyZnZJcXVIYmpaYTJtRWFz?=
 =?utf-8?B?M1FzTTFJb3VCT3E4MlhLWkdEWncxdDFhNWFUakg2aTVScjEvZXNoYTZMd3lu?=
 =?utf-8?B?MEMyUFN2VndTZTJTaWp3dXRBTEFCYWdFL0YzMnRDemtoSmUzcy9jKzFHL1hp?=
 =?utf-8?B?UEorWUQza2VsRStzRVhxWFc1d2hJdFRRaXU4UGpiOTAwOHhMeW9LbFU5OGdB?=
 =?utf-8?B?S0hpU2VweVNMeFlpZzM1SUF5RUozUnkyMUx2YURNQUtZZlpraWhneHoxOFVY?=
 =?utf-8?B?YzVXNlk2U3hEZmFaVUdtZGNEdTdpdU1IdkRCVXNDbDJTZTBJa1VyYXdaWVRC?=
 =?utf-8?B?Q2tpSW9Wekg3UGZhSVdVZktTQWdqSGpJN3hGbU9rbmZEWG1wWktDZi9iN0h2?=
 =?utf-8?B?Y0hOaENwQjZUc1Y5QThXRmgwY3lYVExpM3o1TTEvRlVKTEdjeFRqbDArQVdw?=
 =?utf-8?B?RERCZE1zRkUxNzhCbmdFTm5pL0FJOUVSNTVTbm1GRlArQjQ3bmhtZjFETzVP?=
 =?utf-8?B?bjZ1ZmVnU3M1NmdFWmRQL2FtdDVpdVNEU0E4OGsrV09LdVh3NVBveE1aeFVJ?=
 =?utf-8?B?RVg4NlRmZTVkNHJEc1EzaE40QzhPcldRSysxWjI1KzlSMW5STFR6Wk0zL3Rk?=
 =?utf-8?B?Zmt5dmk3YUQ1bjl0SllrbnBSQXZES1cvckRSTXI1NFRwQjZraWg5MmdjRjN0?=
 =?utf-8?B?dmNLSjJ1emZNUDRHdUtITG5sZ1I3OGZIZ0ZwK2JQbVZEb0JDb3g2Rnlpc3ZK?=
 =?utf-8?B?b1lrakxkb0tRVm1KYllNTWxkN0gySzY1T0M0bmlIdHg4OHMxMmdyOE5iUmxr?=
 =?utf-8?B?em1Nc3pzVDRtdXpMVFRRekRNZWFQRFpmU3pzMnZJYmwzTituRHNVZWhWakJ4?=
 =?utf-8?B?SnFWOW52VmZMU0h2T2tjRmdTMjR5RXF1Tld5bldNc205WUE3emxjRHg4NFlz?=
 =?utf-8?B?U3J3cHdvTHZuMXBQdFpvR0pTcUNYbDdkU1RTZzhBdGZVVy9jWitIcXVyc1Y0?=
 =?utf-8?B?b21NN205UGhlSHNLNDZlaXhtNEJpUXdFRnZja2pZQWx3V2lDMjlXVG9qWHhs?=
 =?utf-8?B?YzVWOGxPZnVxRnlOMlNjRytKUHR4YVhNelIwSjNjN3JYUnlRR0VxckU0dWdI?=
 =?utf-8?B?NjhBSmtsZkFBdkgrc3REd2xYQXBSdXRHMC9EdVloalpPTk9RZEtmTUJsQm8w?=
 =?utf-8?B?RHZIWHBVcitsa1RMNm5wQmhzVHpGMVBmaDgvaGFjemNsU0o1NFlqTzV1SlRP?=
 =?utf-8?B?N0VlY3JIaDE2Q0RwdUF6ZFN0NFhBZDFtaEZsc1JENC82QmtoRjFSTTVFVGVV?=
 =?utf-8?B?QVltNy96QXFWdDBoMjZ3bTlRNHBaMEZ5dE5nZjVxWEg4YzFyRDRkc3JIRjVR?=
 =?utf-8?B?QVRDS0tFc29nc3Q3dWhaMHc4azRObDg0eWpMYzJOSHV0UjZZYTc2Q2FEbER0?=
 =?utf-8?B?em5zKzlQWk56S0RMcnBCK3lKT2xGbHNLUUF6MTR2RHpyajVxR1FNb1dESVRK?=
 =?utf-8?B?TU83eTBVNXIvUnRGaWZxanlOR25GaW1VbnQwMmh4M09WVHk5UEFEOVVid0Rs?=
 =?utf-8?B?eGpFcEtnblViSnF6L1IvbmhqOStLRUxOODNKUkRzSXA5N0lCOGFHQVI5RXRZ?=
 =?utf-8?B?S2R4L1g4Z1BoU0M3ZlJMa245QmU0RElraVlLNzlETEk2L3J6NGNLcWV3OHVC?=
 =?utf-8?B?aCt0dmpONS82ZzNuSTVoa0F0eUtzYU9QT2ZYeWxieTM2c1g3N1lCUkdEK0pw?=
 =?utf-8?B?bkhQNXN2aTJhNmFMcnBvWVlrSndVZzRza2FUc3ZBSFZPNjNTTmowdElybklq?=
 =?utf-8?B?VHNVaHdVUnY2WVQvRHhmVDhnclgwVGFsVXJaVWRhMlY2VWZieWlZWmF3YnpY?=
 =?utf-8?B?Z2pyMytjQzA1bHQwRzdaZW0yYjRTb2lXZ3A3cCtMb2g4TkEyUmpmbGtHQ0di?=
 =?utf-8?B?ejVVeW1ES0ZvK2ZoSXF6U21DbDJlT0huSjdmSENIa0dIb2xHSkNJREJ5RXpC?=
 =?utf-8?B?TEJaNXJMcHBab1ZpQ3VpbUNTMnRBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a284cef4-c567-49d7-e67b-08d9c3c712c1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 14:43:23.2897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCnEuAU+AB7WnuwezVa3ITmFme3pd5rmx+oEhGLyEoPhlgoxP9it8n3brGL4mP8bTqGDqW60cB6KTqKRyHJdt2VwS57B/RQBCl/9xUrN0T0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2569
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/10/2021 10:58 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Add support for telling the debugfs interface the size of the GuC log
> dump in advance. Without that, the underlying framework keeps calling
> the 'show' function with larger and larger buffer allocations until it
> fits. That means reading the log from graphics memory many times - 16
> times with the full 18MB log size.
>
> v2: Don't return error codes from size query. Report overflow in the
> error dump as well (review feedback from Daniele).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_gt_debugfs.h    | 21 +++++--
>   .../drm/i915/gt/uc/intel_guc_log_debugfs.c    | 58 ++++++++++++++++++-
>   2 files changed, 71 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> index e307ceb99031..17e79b735cfe 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> @@ -10,11 +10,7 @@
>   
>   struct intel_gt;
>   
> -#define DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(__name)				\
> -	static int __name ## _open(struct inode *inode, struct file *file) \
> -{									\
> -	return single_open(file, __name ## _show, inode->i_private);	\
> -}									\
> +#define __GT_DEBUGFS_ATTRIBUTE_FOPS(__name)				\
>   static const struct file_operations __name ## _fops = {			\
>   	.owner = THIS_MODULE,						\
>   	.open = __name ## _open,					\
> @@ -23,6 +19,21 @@ static const struct file_operations __name ## _fops = {			\
>   	.release = single_release,					\
>   }
>   
> +#define DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(__name)			\
> +static int __name ## _open(struct inode *inode, struct file *file)	\
> +{									\
> +	return single_open(file, __name ## _show, inode->i_private);	\
> +}									\
> +__GT_DEBUGFS_ATTRIBUTE_FOPS(__name)
> +
> +#define DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE_WITH_SIZE(__name, __size_vf)		\
> +static int __name ## _open(struct inode *inode, struct file *file)		\
> +{										\
> +	return single_open_size(file, __name ## _show, inode->i_private,	\
> +			    __size_vf(inode->i_private));			\
> +}										\
> +__GT_DEBUGFS_ATTRIBUTE_FOPS(__name)
> +
>   void intel_gt_debugfs_register(struct intel_gt *gt);
>   
>   struct intel_gt_debugfs_file {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
> index 8fd068049376..ddfbe334689f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
> @@ -10,22 +10,74 @@
>   #include "intel_guc.h"
>   #include "intel_guc_log.h"
>   #include "intel_guc_log_debugfs.h"
> +#include "intel_uc.h"
> +
> +static u32 obj_to_guc_log_dump_size(struct drm_i915_gem_object *obj)
> +{
> +	u32 size;
> +
> +	if (!obj)
> +		return PAGE_SIZE;
> +
> +	/* "0x%08x 0x%08x 0x%08x 0x%08x\n" => 16 bytes -> 44 chars => x2.75 */
> +	size = ((obj->base.size * 11) + 3) / 4;
> +
> +	/* Add padding for final blank line, any extra header info, etc. */
> +	size = PAGE_ALIGN(size + PAGE_SIZE);
> +
> +	return size;
> +}
> +
> +static u32 guc_log_dump_size(struct intel_guc_log *log)
> +{
> +	struct intel_guc *guc = log_to_guc(log);
> +
> +	if (!intel_guc_is_supported(guc))
> +		return PAGE_SIZE;
> +
> +	if (!log->vma)
> +		return PAGE_SIZE;
> +
> +	return obj_to_guc_log_dump_size(log->vma->obj);
> +}
>   
>   static int guc_log_dump_show(struct seq_file *m, void *data)
>   {
>   	struct drm_printer p = drm_seq_file_printer(m);
> +	int ret;
>   
> -	return intel_guc_log_dump(m->private, &p, false);
> +	ret = intel_guc_log_dump(m->private, &p, false);
> +
> +	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM) && seq_has_overflowed(m))
> +		pr_warn_once("preallocated size:%zx for %s exceeded\n",
> +			     m->size, __func__);
> +
> +	return ret;
> +}
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE_WITH_SIZE(guc_log_dump, guc_log_dump_size);
> +
> +static u32 guc_load_err_dump_size(struct intel_guc_log *log)
> +{
> +	struct intel_guc *guc = log_to_guc(log);
> +	struct intel_uc *uc = container_of(guc, struct intel_uc, guc);
> +
> +	if (!intel_guc_is_supported(guc))
> +		return PAGE_SIZE;
> +
> +	return obj_to_guc_log_dump_size(uc->load_err_log);
>   }
> -DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(guc_log_dump);
>   
>   static int guc_load_err_log_dump_show(struct seq_file *m, void *data)
>   {
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> +	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM) && seq_has_overflowed(m))
> +		pr_warn_once("preallocated size:%zx for %s exceeded\n",
> +			     m->size, __func__);
> +
>   	return intel_guc_log_dump(m->private, &p, true);
>   }
> -DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(guc_load_err_log_dump);
> +DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE_WITH_SIZE(guc_load_err_log_dump, guc_load_err_dump_size);
>   
>   static int guc_log_level_get(void *data, u64 *val)
>   {

