Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 005A7601E62
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 02:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16BE10EF0E;
	Tue, 18 Oct 2022 00:09:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816A810EBE0;
 Tue, 18 Oct 2022 00:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666051774; x=1697587774;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UzxsPq3LXOrfQ+j3Jr38dCQF+Tu5nZZSozaDjNxCXFQ=;
 b=TM+wzsapN/RikWuQliM+PJhhodtzjzVEI0QnyrE2h5mwGRsqGJwAVOl5
 8Yj6C0kjNzlZ0DA2IojnB97RVSCt/1knp/kfuTqJ/u27Ap//0Xx0710FS
 1bfUGCH8974Auxs+Nmpc5x06jW+XWhzTDQlWlEYYDRLw+q2Epzap3tvw9
 3fLgDnp+cBUu2LsIT1bBQu2q4CD2KxCA/0Su4ujQEENNR+rTbwKj46Efd
 b0sqw9t0Jot39eMhGnR9OKdJPnSlZZuHO0mPH7lmEGbt6tCHKONvmHYBe
 kJy7XEyhOSxhUFElh+CURx6eEJZfKYSHq2f1X7uLKD+j+xAIUZdEnvwpM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="305935941"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="305935941"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 17:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="753819785"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="753819785"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 17 Oct 2022 17:09:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 17:09:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 17:09:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 17:09:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPtuRERFOS6hJS4jr6IKTgWjFGzZP7Z82a/wmtNWY6wuOocjs4xJnZXz7ISE86cIZu+WEqP1G+vCzHvlN/O6AzhGwmmr7dSry0PEUYawaORWg5RRWeW7bSlFOWj7esPYxxA3AFUtfTDEMPFYLqM/SJEgOcekOMALvjh9JnepjpjANfmDUH0p7RfSNk9RCE+eVqZGZY7GoRRJ3yDClYVBg12EPeFA3ilbYsBGRlfdGzWY+mlJfZJKZelnv/eFzYRNQePfY5aKS9SaLsGG1f1GFkY3jkOC8WCv3cwp4eo/s6TYUqVsJZsZBIYS9fXkBjKDVmbG8AKH7QnF4Mh1/iA5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLkUSWs+ON3yL11n4dgx0Zu6hgEk0LbM5miFt9vQt3c=;
 b=LpscsjCX64RzcflL8StlD4l0Q0g2MFLdY6utta/AFjoSTo+fPqQK7HquhXAJWQDXOk+w89+JBjjjrYRtoc+MG93BC7c5bmUatTwI4lmhOOwRKZYf/VoC68RSCb4N2KrNaW0aGbIKTXFBEYVKg82YLQ9Qp2H7W/h2qy1z7pzN4JjRKbwlhX5HEoymL+UgS/kXyrbeGz0peHDXi8JFJ99k/teWHz1Ax7E1UOFL7wbhM1rmNyJYJCYanf5BHGgsZxhfE2YmGr4oVW5wQxRmq2mYJJlrwtLMPYMF6yaNRO4vSMmBORskU8trLTOxPXfdVGuPeq/k9K3Ph+L8U6jEYsS2sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ0PR11MB5024.namprd11.prod.outlook.com (2603:10b6:a03:2dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 00:09:21 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%4]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 00:09:21 +0000
Message-ID: <6d2829ec-a4c3-38f7-d719-a72bb84fb65f@intel.com>
Date: Mon, 17 Oct 2022 17:09:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 4/4] drm/i915: Improve long running compute w/a for GuC
 submission
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221006213813.1563435-1-John.C.Harrison@Intel.com>
 <20221006213813.1563435-5-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221006213813.1563435-5-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0207.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::32) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SJ0PR11MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ef9f9f-1b92-4c7e-3a18-08dab09d01ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VjYUgMwYA4LXQKMsY87cKP+6om9mcslqi7VQ7opRuVXou+gdbV6xBDlgGJQnjrf0TzCfPaK3x6f+M0WUF57CDR1CUXDyjRVzESQZjefBaW3VnqcbbIRwy4ftwZHvf/gSsvz/OZX3zJOJC8qd+d4kEeRUMD6jUTUqpMWeMP4sfooQhBzv/m3Q9vR22vDVVYy9BZCV3rM4w3vANHYidF2U9V1zLDKPZU7w3Ndc3E6uZjTwjpzAyorQz/s473EBtqWZtda4RZsoHRciOkN9Blm6c+0kzyo2M8tTU4AFLqsat4hvKaaPZwIxls5lJ7vTMUK60uOYZ2srPJeFrvkopPxu+LSR/kPn6NVZT05NA1jgHOnC5d5w+JXH7jmUNO3wAVs7syGATlcxV4O9sea9AKlzdEoHYsDXg9+GN0GSAtmBzwn0Dt7Wv4jJCgEihwKQQgJB5A+nOEKRD3UpiKq4aEBDe2e9SR/N7TcynVYU7sMA48k2k+tgLI5rXf8fr9jAeI53hHBmiDjOqxEqRRkls4qPSJW+s3Ny8Y9U3Pk99bFXlE1L8Bg/tiRGCrqhLXr7ihgEYh+LF2jp7ooCbu36eSVWnJ+DuGE0QDK69x7l19AC66erx5sCDXRaiilS9yxyDWoQm86KmG+Y4HFADAphXRnF6ebWRdL9ystBiHtYNP923VI75bAyEOyKy+Iunt2drEBsyW4sZ+BvABiR83ewhqsHnhpcMP5HskqdvYxjVn0EWEitWhLfY81NaVAtJRR5Nou/bLj/l/FWn5tICM01M+9daH+0e8NJFzuUL8m972oRrn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199015)(82960400001)(83380400001)(36756003)(86362001)(107886003)(38100700002)(450100002)(31696002)(66946007)(66556008)(316002)(31686004)(8676002)(54906003)(5660300002)(6486002)(186003)(2906002)(2616005)(66476007)(8936002)(4326008)(478600001)(6512007)(26005)(41300700001)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHRMbk9qc2lWZnhGRlEzS3dVaWcrMHhYYlBIWVkwaU9oTnhMTHYwMnlVRnZq?=
 =?utf-8?B?SlprYWd6OXBtZ1lVYldVSG5jTzd1aGIvdmxtRjMxaHE4MjBpSW1RZWUxL1Jk?=
 =?utf-8?B?UGRKUWJObCtQd3dDN2EvSkp6ZW9zWTNLSE44WE0wZEtIOVRVL2lsc1dwN1FY?=
 =?utf-8?B?dUZ5ZEtUb1pMUUdZRUlhY0NEcmQvMWxuZW9kTi9EL0lhTUZ4M2VWQVdxSytV?=
 =?utf-8?B?T2RqZjZFd0lwMFN6SmVVd0N2NnhpKzVsQ3licDVEbHZBdHk0TTN5MnRGTkJr?=
 =?utf-8?B?ektFYmFZQ0Uyb2FTSllaOUhQZHQ3d2phd2tJVEh6UXJueG0vMi9VeDU4TnFY?=
 =?utf-8?B?WE1aK3FMbzRqdjlUa3JuaWJKOUpiTmxBaUZXSmNlRFNteTY0ZHdnMlA2eTBW?=
 =?utf-8?B?aDc3cE5zZFRjTGM2NFR1a1plQ0QvY1B6d2ZaT1RiU3Q0OUtHVC9DWUlrZm0w?=
 =?utf-8?B?RWN3RWJDcmdrWUl0cXRyZkVXV0FTemtqd2VML3JILzdrUTdTSGRoc0txbW5C?=
 =?utf-8?B?S2Zjam5oMTYycGdOdG1TK0hKc2RwS2JJeTFFaFE5WEROVDJDVFdxc2FkYXFN?=
 =?utf-8?B?S3VKTjl1YVMvbkFKUCs4RHlNSkdTS1FxVzJQem40SU5iekNsaW5OQmFvSEdp?=
 =?utf-8?B?Zk1zb3ZOdmg5VG4xREY4QmtjSUhQd0c3akFoNXc1elc1aVkrbnBHQlRwQWFu?=
 =?utf-8?B?RjFNZlhJK1NXQU5ydkl3YzFET0lkaDErVEhoS25QVzRSbzdzTU9ZekMzTGNt?=
 =?utf-8?B?cEhJWEp1VVh5RWdiMGtyMnJtV1Rhak5uLzFDbDFZMC91TEo3Q000OStKL3dp?=
 =?utf-8?B?L1N5WEM4UE5xUTlqV0hpOGRoTXlLUGRYR0JmcCtzVzBrd1JxaVlhUDFkRGlJ?=
 =?utf-8?B?QVN5d3V3Y0tUQldvWi9zSGl4OVgzUjVDSUphdGVQV2lnVjBIdGVSYkpiSjdM?=
 =?utf-8?B?eERPSEZYemlXYlpHRkNybHFnc1BPS2NJSlQrTTNqTklMdStxYW5ETkM3TDBm?=
 =?utf-8?B?QmNCaUtJVUpPVVdsd1dmVTVFWmdVWGRaSjZPMDMzOWk2VVF5bGZJcnlSMkdL?=
 =?utf-8?B?WXdLSnFYbUxWQ2d5L3BzRFJBcTZObFk3UmdMR0FzZGh3NDFGYzhjaHdvTkxh?=
 =?utf-8?B?UlpqQ0d5QlRxcklKWGYvQ2NKN3FlQmdKSHBiUmRDcERtb3ZJaTNXVzltSWIz?=
 =?utf-8?B?M2Z3cWlwUWpxeXhCdWNjUGtOZmtmLzdTc1lGMUY4THFIV2pHMlkwTjhqWFMy?=
 =?utf-8?B?cXYvby80Q3BYYlozZWY3Rk1CMkx2dE5rbnFONWk2YzRGaWVHNkNpemRYTzBZ?=
 =?utf-8?B?NDhvYjJqdHNIVWczWVU4eWxzcjNlcStXM0VWNERnamtMbUFiY25iUkMrMGlH?=
 =?utf-8?B?dnlqcWRjY0Jvc0hLdDR0djhpYzFyMnJ6cVhxQ0VXekdkTmVoa3dBREx2VHJG?=
 =?utf-8?B?a1dwVUI1SXZDNmt6clRpMmhIalF3TkxLcW5wTFFUckpDV0xMUEo2eFh4RkdH?=
 =?utf-8?B?Z2tPL21xMjk2MVEwcWVJOTQxV1JYRlFlSkVBZklxbGtnYTlFYlZzMjZHckJM?=
 =?utf-8?B?K3FzR2FEdnVLNGJnT0p5ZkMvMTlRd3ltNFpTVU9VYVl5b2RiYmtsUExUOVZo?=
 =?utf-8?B?QmZ6SmRUYW1Bc3gwamlvU0NjcnFWS1BDWlRWMU43VGdodWFwdkQwdCtwK3NU?=
 =?utf-8?B?bjRKcEduTzFwaEREekl5Ykg4bWJEV2E4N29GWnMxd2lqSW1UUmRTMGFxdW1i?=
 =?utf-8?B?M1A5OHN6UktaYXdoaFdYTTROYllYbklFQWdhY203K2p3SlJTWVpLTG9HTnJm?=
 =?utf-8?B?RE8rbzFHQ3NDMFhEendCWDN4SXJ0Z0JqaFlWZzU0MkZGMUwvQWV4Z0U1cmt5?=
 =?utf-8?B?WmVSZW9FRE4waFNWSkhFaGpRWGpNRWt4Q21uU1kzdWZ3UTNYSEdWMGJhRDdV?=
 =?utf-8?B?YkJNT2pPRXBjc1VFMVlZNXU4S2g0ZlVSV0VBK21ZRWN6cldIUXpjcE1rMUNm?=
 =?utf-8?B?aFRFYjFiS1RJbStOem1mZFUrZ2hNMVRpOS9manJFbnNiQldGRmVXQ09mQTlS?=
 =?utf-8?B?OW9ES3k2Qm9CVzBxMGx4S2x3Z2tuU3dvaFJpMk10U0Q3SkRTTHM3NGhUSjFh?=
 =?utf-8?B?U25GcGpnYW10UllJUUNPZFpwWHVBNURreU1xL0YwRWU2NEwwYmFtOFNIMWxn?=
 =?utf-8?Q?uD7Cg01xI99exhflj6LqlQc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ef9f9f-1b92-4c7e-3a18-08dab09d01ef
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 00:09:21.6405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loWrJqAfK7Uv0ZRX1wADWGaEJ5ldci6CLMN3WyvsB47HHbiNxhwkExfHvYDv+5VBXfYAIMcE5jCyzyI1b2ZJtuigeDYusmBQgnCNCDiISMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5024
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
Cc: Michal Mrozek <michal.mrozek@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/6/2022 2:38 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> A workaround was added to the driver to allow compute workloads to run
> 'forever' by disabling pre-emption on the RCS engine for Gen12.
> It is not totally unbound as the heartbeat will kick in eventually
> and cause a reset of the hung engine.
>
> However, this does not work well in GuC submission mode. In GuC mode,
> the pre-emption timeout is how GuC detects hung contexts and triggers
> a per engine reset. Thus, disabling the timeout means also losing all
> per engine reset ability. A full GT reset will still occur when the
> heartbeat finally expires, but that is a much more destructive and
> undesirable mechanism.
>
> The purpose of the workaround is actually to give compute tasks longer
> to reach a pre-emption point after a pre-emption request has been
> issued. This is necessary because Gen12 does not support mid-thread
> pre-emption and compute tasks can have long running threads.
>
> So, rather than disabling the timeout completely, just set it to a
> 'long' value.
>
> v2: Review feedback from Tvrtko - must hard code the 'long' value
> instead of determining it algorithmically. So make it an extra CONFIG
> definition. Also, remove the execlist centric comment from the
> existing pre-emption timeout CONFIG option given that it applies to
> more than just execlists.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> (v1)

r-b stands.

Daniele

> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/Kconfig.profile      | 26 +++++++++++++++++++----
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c |  9 ++++++--
>   2 files changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
> index 39328567c2007..7cc38d25ee5c8 100644
> --- a/drivers/gpu/drm/i915/Kconfig.profile
> +++ b/drivers/gpu/drm/i915/Kconfig.profile
> @@ -57,10 +57,28 @@ config DRM_I915_PREEMPT_TIMEOUT
>   	default 640 # milliseconds
>   	help
>   	  How long to wait (in milliseconds) for a preemption event to occur
> -	  when submitting a new context via execlists. If the current context
> -	  does not hit an arbitration point and yield to HW before the timer
> -	  expires, the HW will be reset to allow the more important context
> -	  to execute.
> +	  when submitting a new context. If the current context does not hit
> +	  an arbitration point and yield to HW before the timer expires, the
> +	  HW will be reset to allow the more important context to execute.
> +
> +	  This is adjustable via
> +	  /sys/class/drm/card?/engine/*/preempt_timeout_ms
> +
> +	  May be 0 to disable the timeout.
> +
> +	  The compiled in default may get overridden at driver probe time on
> +	  certain platforms and certain engines which will be reflected in the
> +	  sysfs control.
> +
> +config DRM_I915_PREEMPT_TIMEOUT_COMPUTE
> +	int "Preempt timeout for compute engines (ms, jiffy granularity)"
> +	default 7500 # milliseconds
> +	help
> +	  How long to wait (in milliseconds) for a preemption event to occur
> +	  when submitting a new context to a compute capable engine. If the
> +	  current context does not hit an arbitration point and yield to HW
> +	  before the timer expires, the HW will be reset to allow the more
> +	  important context to execute.
>   
>   	  This is adjustable via
>   	  /sys/class/drm/card?/engine/*/preempt_timeout_ms
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index fcbccd8d244e9..c1257723d1949 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -508,9 +508,14 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
>   	engine->props.timeslice_duration_ms =
>   		CONFIG_DRM_I915_TIMESLICE_DURATION;
>   
> -	/* Override to uninterruptible for OpenCL workloads. */
> +	/*
> +	 * Mid-thread pre-emption is not available in Gen12. Unfortunately,
> +	 * some compute workloads run quite long threads. That means they get
> +	 * reset due to not pre-empting in a timely manner. So, bump the
> +	 * pre-emption timeout value to be much higher for compute engines.
> +	 */
>   	if (GRAPHICS_VER(i915) == 12 && (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE))
> -		engine->props.preempt_timeout_ms = 0;
> +		engine->props.preempt_timeout_ms = CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE;
>   
>   	/* Cap properties according to any system limits */
>   #define CLAMP_PROP(field) \

