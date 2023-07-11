Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D19774E9DF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F3A10E337;
	Tue, 11 Jul 2023 09:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77D010E337;
 Tue, 11 Jul 2023 09:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689066512; x=1720602512;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JUsoN1gQmI6f3nw+aJBO+nlvBlvFVB8LAh0yo+/2vuY=;
 b=izYGNeMkxuqzyL2V3r4i+FwCTiS419X3PfLs567mE7wmhUWJ4uyfAdtJ
 /jD7VniIHmo6FZrONKwncUKS/+Z2oXETLAiJfSiirIm1eu8nXtyfiNbuP
 7C4cm1Igvgla5K2B7pVHm+3QvFmH60BPPjNz0HAx+2GXcSfmqbr7a58VU
 Rp5g+O5+lMT4K77Qrq6knhPWzfGlZIOV4zbOousWZFrBSqdmiUgtaGXE+
 oSlUzZJr5SDqpBmYm5FFGjJ4Pt7Ujz3XqtSPnYKQ1TrQxkeQcTCXm2Y/I
 SsoLzugLxVLQHxvTF0ndtblBTAZdVqi+S4h5XTZKrZMEuu1a3/e9knEyc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344166671"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="344166671"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="967719865"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="967719865"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 11 Jul 2023 02:08:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 02:08:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 02:08:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 02:08:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 02:08:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiAqiElhEEbryMJYXkiCeV0ZJ3UyIZs7maA2/wkxpIL68NhzgsjipVt8x2s1XkjoGbqLK0esyrpY3TlB4hLTVORTs42g0j3Yr+54YnspLkmSXiMwPS3MSsUDmCLDe0qwpEgU0zqaIwv/QThyx5pf3p3VSDSvg7EZNVf9sfAAVAatBD1dWmWRWWX2CGrvPD+3bb6ePDtodMSOd/hxhZm723B32oisgT0lW1vQ5owGzr/FXPFiDwg2ET93FiUo+xuLsctW6cd7VvuG4GSSj4PRhkOIOu/hVsNx+Cr6NK3ig6+mLqEcPDqsty1GOby6epyKddspJKkPiKF+qs+OBhP+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfMUmAgj2sTb/giwKhSs8M+Uena1gloT5b89CB3aHuU=;
 b=DK7E7XAMrgmKM6BZiIuww6ep5mubxGkJanc5JL2i+RRL577XOGmAuBicFsZtjwMj2aCHOEhxZLlFM8lUxg3MsHF3RFgkxs7MOvJ1sa1bcpXsAAdWdp1A82cMOtDcbgBOiQuMfwu35/GDuQX4r8+3C5XxwKvsybs3NzYRZF8ixhBKQlOde8SGROhk9EvgibkzX+RoEAA4RPdOYXu/yoREf9vEfjGZn5m1klRXhhxQHezhxXDTb66ZzbMNq1LH2O4KWT4Q/YnmbtkRXcYau5FVXUIjNihD4OFZLp/FbRA2h16Kjl8KeoPEfw/qNdus8wJx+xn3uCLrrW1JAMzDaAcr2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DM4PR11MB5359.namprd11.prod.outlook.com (2603:10b6:5:396::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Tue, 11 Jul
 2023 09:08:28 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:08:28 +0000
Message-ID: <b9b238cb-629c-fe99-0506-fb1ca42e9e23@intel.com>
Date: Tue, 11 Jul 2023 14:38:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: [Intel-gfx] [PATCH 3/5] drm/i915: Track page table backing store
 usage
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
 <20230707130220.3966836-4-tvrtko.ursulin@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230707130220.3966836-4-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::7) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|DM4PR11MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: 716504db-bedf-4284-2e8a-08db81ee63ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rgI+7V93jTSfLAsZRUwb6yJ1p2PpFdfo8y+GFQmAu1IyfSmPFQkaHwj4dBAlHhhiqR7ZK3P3tdftVEaqdbUbKYr2qMxpPYYVMhSMhdutcaGuj4rfQqnM3nrwO0ZDyDC52SBq6uUT/mROJ7RqHZh5LnM08Ek6kDiyAAD4BkyBsihtEQXlDRXz9CJyoNfdPqwkAK92xOb0cgzxBYTr7CpBGtlxqfzXKhVPXPowuVhnt7IUw7TXbYynEDBbn821B4g8wlkeK+bd022TFOOpSmjW8osueyVM5jZK+SNBb4pxI6TgzUG+hVYtesRS1LOwO+EchApbQVcmzPVYqnFm/2fXLx8ManHghGxkODsKssKuyPSUbstLnJgXJpcDhoYnpoIEJl52rUdbAClZjv1kitFP6PB4tz4g3mNQ4JE+DloRwFXTubFuiQ+cwR0EF2RK80E5WhP3mfx0YG6tETvx7wQzmdno/n9RgZDsd21+lHCvnrcx/mvpjZXyxeqvRIaJ+E55AVgMC6IEf7Wy51sAV7eQ7bEQTVW4u6tiYoH9mSyff/13nBm8l+EJ6OAnBVNdpwFjUnDEHuqBzRbH7dr3SNJBPE+mMf0WY5s2/j4H5bFh/Jn9EqxZTSL4lpNds3vznxzG5xQsfoztmFMhSpsZmc+d/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(31686004)(83380400001)(41300700001)(2616005)(2906002)(186003)(36756003)(5660300002)(38100700002)(82960400001)(26005)(8936002)(53546011)(6506007)(8676002)(66476007)(66556008)(316002)(86362001)(66946007)(31696002)(478600001)(6512007)(6666004)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFVrUjBsZ1NvUmgyQWZ4U01RU1hSelRhN21sUklpYzc3VEhxc1BMeXFBZ1dZ?=
 =?utf-8?B?Y1dZZ1d6YmF6eG1YYUUrQ2lOK0g0b2ZYc3RZWmZkcTN6NTJEOGJJVUFPZC9Y?=
 =?utf-8?B?WWc1aDdwTXB6alpqVk5WNGloY24rUFFoSmt3eUMveWJpQ0ozanpaNk1WajNa?=
 =?utf-8?B?R2d6Si9mNlRZUURDUzFpTjhQWkFGNUk4VklQM0hhanFrN0lvZlRDaDRSSllC?=
 =?utf-8?B?V0Y5SHllM2NaeHFUdTFmcXVtd20xcU9POHVVZWZWZUFlczFhMEJTSDBoSVFB?=
 =?utf-8?B?VVAyblMxRUZ5ZjEvbEVxejhHUkduUkRGUlpsUFp2UGIrVktkd3lPaTVqd09r?=
 =?utf-8?B?WkJEWnNsVVAwUXFjRFRtYVNwc3AxTC9Oc2xXQk16Qko5dmp4R2dLdTJPZGJm?=
 =?utf-8?B?SWRPK21Cblp4dEU5ZTQzTmRRSzk2bENJdWlsKyt2UUF1cVFXckI5cTFLMUh6?=
 =?utf-8?B?MHVkZ0U0VkNIdi9UaVZaSVdCZU5jYlhxUzNnM1BQRzNySGUwUmNmMUFiZkFI?=
 =?utf-8?B?bTdSVGFqUzVsNkdvcVpIZUdVMHJlS0FQcXZ4Nk1ZUHgxeDJnY2dsSHVIRE5u?=
 =?utf-8?B?VVhrOEwzUG53WEd1RHZ1RzRyK3IvV01YVU9SSkFmR01LL3hha2prdkEralZM?=
 =?utf-8?B?UVBmaWRyM280MUJ4RTV4eVVHZXArbmVkWlVFQ2JOVmJwaEo2K05EbndhaFRF?=
 =?utf-8?B?d1ZzQXJSZDIvRk1mMVhvZkhrdVZ4US9EOTVIS0J4cnYxZVVCcXpDd1FHeGQv?=
 =?utf-8?B?dDJWREZyUi9La1BkQ3pxZHgxa01zeVZ4M0dNei9lLzhPbU9DRWF0TlJlbzhr?=
 =?utf-8?B?eUI0Tk1sSTZab28rdHFNQ2RPS0d5Z2s3TmRxdm1iMk1NZzZSY3JrdUxOQWRz?=
 =?utf-8?B?SmpCUFFlZkw5R0xKMmdRSUY1Nzl3TEVCdXpmYlk0VmczUHdqSDdLRVRTWFVI?=
 =?utf-8?B?bkQvMDRFQlpEVERJTDZWU0RlYW9EV2hKS2tyTW1maFczNXVYNDhiY0NvcUQz?=
 =?utf-8?B?SUJuTll3aHYvWUdlcEZiLzN0dE1wSENZQ3FadHN3c0hKM1lLWU5USXFUeHZh?=
 =?utf-8?B?bllmL3BPR2VkWmt0d3UzeWI3Tjl6eW1MYlNqejBWWkpBNFdDMStpTnpyamls?=
 =?utf-8?B?YVB6dE9ibFdPdWdKU1ZEdlFKaXdsNVFFemFnTUlGMHhhUXk4cE5heUJZem8y?=
 =?utf-8?B?VzFGaGMxb1FkV1o1bGZ4TE5wU3NpNE03OGVPbmdVeXVjOWFXRHVpTDNOaUhv?=
 =?utf-8?B?UHR6dEpuaWxZRVIyT1FtT1RXSDhoUEVOQnFnQjVpWkU1UjlNbkhUa01aM2JV?=
 =?utf-8?B?K1ZEWVZUSElFeElSVDdLWlpJRTBDY3RTWnVteVc5MlFnbjQ1ZWFaSVdXeXpM?=
 =?utf-8?B?WmdIdGJGSmxOSzkrRVJUaHVtdlBRczBhc0x5clZLQVpuZ3pjQWZaRGh2OSts?=
 =?utf-8?B?R09xR2d4QUZQMElOSWYvWG1jWlEyd0xWV05nU1J1Tlkxc1BtblpTeEtUSk1V?=
 =?utf-8?B?dER2Q09yUTZsajd0Y0tlQTkxOTAzTkN3VjJ5a2FjS1ExUnRzd0pQSHJwVU9M?=
 =?utf-8?B?bU00UTA0K1Z5cGpQQ29kZWJTQ3Q0aitneFhjWE4xRGVTRjBkOU1hQ0R1aGIr?=
 =?utf-8?B?U1RRVmNxL2ZxZ1VXNklMTTZWYVI5VS9Mak1xbm41WVJYcWlCaVZHcTdKRjlK?=
 =?utf-8?B?WURnNUxXNlRUbW1sM3NQNUFSb2xnS3JUNlNGb1pmK2FoS0NSL2RSbVMzaml6?=
 =?utf-8?B?ak8rRXNqMTNnV3RJc3BHTk1FUCsvSzZBQjFGbzdha2dMQi9MZGFIbjFpTFd6?=
 =?utf-8?B?S05FdjVVMTBqRjA3NVFxeXNWN25Lc0t6UTZCK1NmUHRvTUM0S3oydlJyRXgy?=
 =?utf-8?B?dXBKcm1mbzVQMXEvUnZGMTJTRnFualdhWnFtZ2c3c1M5OWRZSXR0OVRaZjRl?=
 =?utf-8?B?bE1pcUNHbGR6Qk8wVmFxWDVSNWZqUWZZdVBTZ2NxSzNrWTZrbDFVdGZza21u?=
 =?utf-8?B?RWhvYkFXa2tYVE5jRlNCSlFNU1VwVFZORUswL2padHZkdXlPdGdIM3YyWE90?=
 =?utf-8?B?WWJNODVXeW9WMHo0YUI3dDVCS1dVQWxEaFNIenZ4WmVYSzJCTXpqandTZ3V3?=
 =?utf-8?B?YmQ3M0lJNEEvcmVTWVlxNXcvY0VWMUJCdlF3b0xwR2hWUUp3aGlaenZvQTIz?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 716504db-bedf-4284-2e8a-08db81ee63ff
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:08:28.6158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLQ6VpgClR2C4Kbqhhk3W7geqeUIh5uNF6aIAvXprbn3fsbTE4eVMhq+H27T3Ytk0VxYWbl45qOoBrHLTw4ngqHg18vOBjmWwnq9MgonwnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5359
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



On 07-07-2023 18:32, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Account page table backing store against the owning client memory usage
> stats.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gtt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 2f6a9be0ffe6..126269a0d728 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -58,6 +58,9 @@ struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz)
>  	if (!IS_ERR(obj)) {
>  		obj->base.resv = i915_vm_resv_get(vm);
>  		obj->shares_resv_from = vm;
> +
> +		if (vm->fpriv)
> +			i915_drm_client_add_object(vm->fpriv->client, obj);
>  	}
>  
>  	return obj;
> @@ -79,6 +82,9 @@ struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz)
>  	if (!IS_ERR(obj)) {
>  		obj->base.resv = i915_vm_resv_get(vm);
>  		obj->shares_resv_from = vm;
> +
> +		if (vm->fpriv)
> +			i915_drm_client_add_object(vm->fpriv->client, obj);
>  	}
>  
>  	return obj;

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
