Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BDA6082CF
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 02:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F7410E613;
	Sat, 22 Oct 2022 00:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A014810E5E6;
 Sat, 22 Oct 2022 00:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666398082; x=1697934082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+o3fK406WRVjg1UE+KZFP7EMrVKbTbzNufOluQaXA+I=;
 b=Ch9BuaXlf+baL9Td4nJsbWjo1oy7sMCAYO9B0Gjd5y8qE/lKWWS8+H9l
 FgMNRqQkSxQD0P5NE2JEwrghMVMNhwVHCIV6dOZLduvZVpbW2hxN3Sqyk
 3eWucCBuuTS2yg9B5H62d1POFcW4gYWZ0jfJDQ0L7dYyIMT20r4yqDg2L
 xKwmNTQA0wKeQ3MFZmPJlmzXAiLW8Xg0XgWfkyeDOIg5b4fmMOUbBzzli
 G47rpyWNWuNzRMgjlIcZ5KC8CcJx6BLba6jPd07d1RpYSfbf7HGp6wwyK
 Etun9Opyz5ru529UPKjkMSokby1dzsSri7VVRQLjhaFc0SS39TZFYBTBj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="286852199"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="286852199"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="581791087"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="581791087"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 21 Oct 2022 17:21:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 17:21:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 21 Oct 2022 17:21:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 21 Oct 2022 17:21:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfuS6NGHFZSCJUIvfcnVHOVcg0KJymPZq4d6vNibpKhd/NvGbBad2L+NJpCXSZbp+oLtTv4q5ywuLyQtBr1+ls5D3gGVN5yLI2FHE3sdb9CPTVQkCuVsxjnrOv7kb3YstPpd2X2z1v8uaktRnpZb77uLyQMe7s9aX2PKM3LRm1LbFRS2PRrjfcOpywvGjpFCl7XB5EygpQgk6tA1ekciI35+mKxlVdBPmh9MXlAaiIlMQPPxJs1SY4oVYSkZWrUfwaITi+SQVM9zy2vll0vZqiNH//u1FZH8EDI/rTRX/ZD8HKi71NQ3FRAJyw0t8LUFSxwh16iRDF4ZZPvdZtsmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKCPCRm+gefr6t4qx4m7ygMjaayHiIWSbqeoDJvYHKw=;
 b=KSfLzDdijROUbDDlCp+9prPDB0TW4PSg2DvyalmwkkMd9Qvss92s8TklerP5luXewaxd76MT2+miDAJ5QH+5P1tAwcSHPLIZnehtMJfP5wZ+Fd+GQhjAMSBMnFBlNz9AAd1DOA0L/7n5YFp8dKCLvvCqBROXM5A65s6HlGeVQENL0pW2XWhoK6kGT/g6htleGhknIj6qG3ZKDzmsXebBVM8qvs2TbjeW0IYUyra8O80Su7RySOblAU+t/Bkf5RvvP4sIFisPb+fybZLh8z6TxDMufPpTtEKizEUdSPXuonNyqRwVxwo6y6V+NbSQ7sbgs+0UbWzTQNN+YyWG/msfrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SN7PR11MB6993.namprd11.prod.outlook.com (2603:10b6:806:2ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sat, 22 Oct
 2022 00:21:03 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::b941:cdc9:b350:ddc]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::b941:cdc9:b350:ddc%3]) with mapi id 15.20.5746.021; Sat, 22 Oct 2022
 00:21:02 +0000
Date: Fri, 21 Oct 2022 17:21:00 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/i915/pmu: Connect engine busyness stats from GuC
 to pmu
Message-ID: <Y1M3bKazuml3DfLZ@unerlige-ril>
References: <20211027004821.66097-1-umesh.nerlige.ramappa@intel.com>
 <20211027004821.66097-2-umesh.nerlige.ramappa@intel.com>
 <d7e2578c-cbf7-4aa4-0341-8187dec83350@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <d7e2578c-cbf7-4aa4-0341-8187dec83350@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::21) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SN7PR11MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff1dfe4-fc05-4fc3-822b-08dab3c34d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w7c8BscNue2OblF7jSN2oeQgti8VpPGHWIKE2R5cXHvgqFvGPSpxL//3cyOrrkCTamulbvGzP2FLI05tkxVdl5ck3VfmtPQcb5eJbrTUAKjwsUSHdhM+YVxqbfuSxtLWSS0rZf/O/RDYJxgr0UbN4akaSk5BzRhBdhMZQ5EZ+C2RbpGFjaXqiVy7EaLSy+tpMjp5XZAZ0y5B3FR58vsCPdgn3UXPz2xJ9pd1P8eqSZVeUNr9ID7osjWGspFENdLjNjOxj5SowHmECHWtnw3Ou5/c1oAMfMor69qaruT37vvRJWcQyACYe9UfhLigTxqA8mxCbdETN6sjWRRQoxcZUgTMO3rTAqMU1pOiDMQMHX0nLtWlHplVJeMZ/iobOoIC+WqMtwS0bKCGverllMpubCrS/WsM+aOUL3wE6v/uxK2UrdnPf1tvJTUPADxXvlj/+sC2RPYVHQhkVL/F+S9HTFOJmfnT5LzRd53/zJM29d6khsr8NIUE3vW5Xe7dNNa3jY9cfsbmWrvK1pbEt4PKzuj4sWQqHEELDa3r/IqZanCMC41KmLgOUg8vnokUYhDcAA23oKGJbpJfCBTSawhyHJQ3bnnWwcaZ222uHF36YZids73zoITlMqOC4UxN/2k75+2HFoPBJc9HvhWnPe/0semZiuS0w9qkiWlcSrBwlkho0mLqzCGgYF+JJqDyYEfdzARLkP0fs8teR5lQOL2/OTebrGFz+8V/hoGx+DHHmjY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199015)(2906002)(41300700001)(66556008)(66476007)(4326008)(5660300002)(66946007)(8676002)(6916009)(316002)(6506007)(6486002)(38100700002)(478600001)(6512007)(26005)(9686003)(966005)(186003)(83380400001)(8936002)(82960400001)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1ltQTA5SUQyclRONFNtcS82eFlNell3bzJFaGI3QjVQbzdxZXo3VFgxOFli?=
 =?utf-8?B?dVRzZ2NxcitIMmxEem1qWUJ4U1VHMGNxUGhjM2VYb0FxVnkyZjlBZjdVYzRR?=
 =?utf-8?B?Ymh4SlJSY3NCM1ovTTJqSDFEVjNEQldoU2FXTE1hWkNsd1lGMVNna3BNU2FL?=
 =?utf-8?B?OStreEREL1VKNEZUWWtWOWZPS3BPeHlhTEphU1VkUk1JSWY0V000cjVFSkhl?=
 =?utf-8?B?bDhkVjVPYlFPN2YvS1ZCd0NwQVVXeVNsYVhRcitoUm1ySEtqNjJoelR6Vjg1?=
 =?utf-8?B?QUdyMVl0bWZxOEJRNXFHbE5QV1lIV3o0K2NDVmZXZ0hwMTJTdWJsZXloZHhs?=
 =?utf-8?B?WGNwUTV2UHpDSll2aWlmSlhYajhRcEZscnJRZXZESmhRV0JaM1BqNllVMG56?=
 =?utf-8?B?QjdySDVEdFVaMUo0U2I4dGlrNTJYT0FtUDZOS29mbklNYXpHSHR6SUdJVE8x?=
 =?utf-8?B?V1VOSkxvcWY4TC8vRDczc3M3VXZDL0dRRGhqdk0xcElQQUdJN2FEdGhXWjNI?=
 =?utf-8?B?cTBSUHFwc2tVUW1walplbHRuVnpkZ05PRGRyWHZZL3NxUUg0Uy9GSm0zK2tt?=
 =?utf-8?B?QTZHV3hOTFFtLzB2M3k3SGozK3Z5TkZ1dGtXUGlEZnUrYmNnZlFzbGY0UXZR?=
 =?utf-8?B?T3ljRlFuQ0d0R2dTQk5WblFIN0sybmxBb1kzSGlqZUZ0a2p3bTc1VkU3SThY?=
 =?utf-8?B?U0tmbkVJTmgyK0FzcHVObUdHVTJ0VEFCbU1mamFHcFFYbjJralJZeEVmdlYw?=
 =?utf-8?B?UmgrYmxUL2tMK0lRQTViTFg0NmFWd3djOStYc1BrMWZKcFRoRFNvWTdTeUI2?=
 =?utf-8?B?MDZsNjBZM1ZYQmd2T3JMSHJOQmxiUEdVSFlSSUxPWWdPckxGaWtpZVJscDRv?=
 =?utf-8?B?anMyM25QdkprbUNrUnBJaEhBUitLaGpqU0xXaWpYQnI0SjdBNEV4UEdoTG9p?=
 =?utf-8?B?MFpBTnM5U0ltUll6aTBHZlN1ZDB0RG52bUNHSm5LOTZjbzhuL21NMjhnVmNY?=
 =?utf-8?B?bkhwYzJTeElZaEZmYjBYeThndDM3dVBTb0tyYzBuZ2FyTHZvWE84T2tOcnZC?=
 =?utf-8?B?QjhqakJLOUNKUDF3YjZQcm5jRG5STHhkMmZoTUJBaHRsTTdhYjhjQTdKeUNZ?=
 =?utf-8?B?amgvSUowSVd0M2VTUVo0K0tJQ1FrS2hsNExKRUV2RDRiODhMSGoxUkd6bzF6?=
 =?utf-8?B?c0QvcFd3d0cyenRXWjNWem5WTjZINmZwN015TEdVZHFJNFp4NWQ1K2hrNkF2?=
 =?utf-8?B?c3NVMld3YXFkTklzbGdkdHIzWU1QV3pUOHRiTWFEenY1cjN5QTJYY3JreWMy?=
 =?utf-8?B?TUFCdnlISVkxWEtyOVF4SFJ4NFQ4SUhuc0VFZU1UNnI1L0NPQmFGTVZuYzJ3?=
 =?utf-8?B?bTlIQUpOMGRUQlBnVnNWdXVIQ210VXEvS0RHSFZUL0lWd2FMaU0reTdITm1k?=
 =?utf-8?B?dTBEZWJvYUhTZVdqTFhHZWNvYXp6ZlVjdjlHSWR4K3FCazFIZmdodnZnWWgz?=
 =?utf-8?B?NWRaZXJwQ1Arc2c2UHpLbzhHRmtiZmlRcXpKaHBEZU1ZUzB5bGtwK3J6MXAv?=
 =?utf-8?B?ZFVLa21FcFYyVk1VWG5SZnQwUkhudFd0VXgydFZ0Y1pEVHlNQitWdGpzaEVw?=
 =?utf-8?B?d2lTSmxvVDVoYk1BcDFUYkRhNkppVVkvcnVlWCtaajFrSlRTd2xHNC81cXNk?=
 =?utf-8?B?Tk01U0h0SkpiQzdOd21hTmhXUVVOSjNiSVVCem1nSTlnbkVlS1pMSmp4Z2dU?=
 =?utf-8?B?dSs0alVXNS94YVN2c2RLOHJ0NCsySWFjcU5CTXhXT2NjcGpJWHVmMTNPVTJV?=
 =?utf-8?B?UStNUlFsUXJHVEFxYWxzVWdmakxRT0JzQ0ZwWjJHWTVDWjh2alQ1OVJzdGRV?=
 =?utf-8?B?NlE2YTlWOERndll0NzRYWlNGTlJydkNXNzR3Z0lsZkNiZU8zYTBHZFhxZjFR?=
 =?utf-8?B?M05TOUU3K3I2VWZRcE9xVUZhK3R2a09ENFZraUQ0V2VBQmxVbms0QVBqdWtS?=
 =?utf-8?B?amdkbHBrNWNsZU5qK29kUzEvNkdUdW9IUTFjSUxFdnpHb0Jzei9rYnVabWVR?=
 =?utf-8?B?cUlCWVFsWkxXeE16dWJVay96OHBsck83cGxKWmcza0hFd2I0Tm8valZOVk5R?=
 =?utf-8?B?NVBJRmdKckZMelI0SERQTXBBL1dxYml2RkgzTDMrZlFMY2pHbUhoNW00bDVv?=
 =?utf-8?Q?hCI9/cwAk0AdCCG9QBe+cmo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff1dfe4-fc05-4fc3-822b-08dab3c34d5e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 00:21:02.5474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hFPLT4k4gGdNU9fd6/cEZuj8Q3LIXSvZokwQZcdynWnAf2tn2hvCHdDDfJb9r4iz3VGNj0wxffgG3XgFmIibpADzfQbxF3Rz/kxoVyAlHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6993
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
Cc: Matthew Brost <matthew.brost@intel.com>, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, john.c.harrison@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 21, 2022 at 09:42:53AM +0100, Tvrtko Ursulin wrote:
>
>On 27/10/2021 01:48, Umesh Nerlige Ramappa wrote:
>
>[snip]
>
>>+static void guc_timestamp_ping(struct work_struct *wrk)
>>+{
>>+	struct intel_guc *guc = container_of(wrk, typeof(*guc),
>>+					     timestamp.work.work);
>>+	struct intel_uc *uc = container_of(guc, typeof(*uc), guc);
>>+	struct intel_gt *gt = guc_to_gt(guc);
>>+	intel_wakeref_t wakeref;
>>+	unsigned long flags;
>>+	int srcu, ret;
>>+
>>+	/*
>>+	 * Synchronize with gt reset to make sure the worker does not
>>+	 * corrupt the engine/guc stats.
>>+	 */
>>+	ret = intel_gt_reset_trylock(gt, &srcu);
>>+	if (ret)
>>+		return;
>>+
>>+	spin_lock_irqsave(&guc->timestamp.lock, flags);
>>+
>>+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
>>+		__update_guc_busyness_stats(guc);
>
>Spotted one splat today: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/bat-adlp-4/igt@i915_pm_rpm@basic-pci-d3-state.html
>
>Could be that reset lock needs to be inside the rpm get. Haven't really though about it much, could you please check?
>
><4> [300.214744]
><4> [300.214753] ======================================================
><4> [300.214755] WARNING: possible circular locking dependency detected
><4> [300.214758] 6.1.0-rc1-CI_DRM_12268-g86e8558e3283+ #1 Not tainted
><4> [300.214761] ------------------------------------------------------
><4> [300.214762] kworker/10:1H/265 is trying to acquire lock:
><4> [300.214765] ffffffff8275e560 (fs_reclaim){+.+.}-{0:0}, at: __kmem_cache_alloc_node+0x27/0x170
><4> [300.214780]
>but task is already holding lock:
><4> [300.214782] ffffc900013e7e78 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}, at: process_one_work+0x1eb/0x5b0
><4> [300.214793]
>which lock already depends on the new lock.
><4> [300.214794]
>the existing dependency chain (in reverse order) is:
><4> [300.214796]
>-> #2 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}:
><4> [300.214801]        lock_acquire+0xd3/0x310
><4> [300.214806]        __flush_work+0x77/0x4e0
><4> [300.214811]        __cancel_work_timer+0x14e/0x1f0
><4> [300.214815]        intel_guc_submission_reset_prepare+0x7a/0x420 [i915]
><4> [300.215119]        intel_uc_reset_prepare+0x44/0x50 [i915]
><4> [300.215360]        reset_prepare+0x21/0x80 [i915]
><4> [300.215561]        intel_gt_reset+0x143/0x340 [i915]
><4> [300.215757]        intel_gt_reset_global+0xeb/0x160 [i915]
><4> [300.215946]        intel_gt_handle_error+0x2c2/0x410 [i915]
><4> [300.216137]        intel_gt_debugfs_reset_store+0x59/0xc0 [i915]
><4> [300.216333]        i915_wedged_set+0xc/0x20 [i915]
><4> [300.216513]        simple_attr_write+0xda/0x100
><4> [300.216520]        full_proxy_write+0x4e/0x80
><4> [300.216525]        vfs_write+0xe3/0x4e0
><4> [300.216531]        ksys_write+0x57/0xd0
><4> [300.216535]        do_syscall_64+0x37/0x90
><4> [300.216542]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
><4> [300.216549]
>-> #1 (&gt->reset.mutex){+.+.}-{3:3}:
><4> [300.216556]        lock_acquire+0xd3/0x310
><4> [300.216559]        i915_gem_shrinker_taints_mutex+0x2d/0x50 [i915]

i915_gem_shrinker_taints_mutex seems to have something to do with 
fs_reclaim and so does the stack #0. Any idea what this early init is 
doing? Can this code also result in a gt_wedged case because that might 
explain the stack #2 which is a reset.

><4> [300.216799]        intel_gt_init_reset+0x61/0x80 [i915]
><4> [300.217018]        intel_gt_common_init_early+0x10c/0x190 [i915]
><4> [300.217227]        intel_root_gt_init_early+0x44/0x60 [i915]
><4> [300.217434]        i915_driver_probe+0x9ab/0xf30 [i915]
><4> [300.217615]        i915_pci_probe+0xa5/0x240 [i915]
><4> [300.217796]        pci_device_probe+0x95/0x110
><4> [300.217803]        really_probe+0xd6/0x350
><4> [300.217811]        __driver_probe_device+0x73/0x170
><4> [300.217816]        driver_probe_device+0x1a/0x90
><4> [300.217821]        __driver_attach+0xbc/0x190
><4> [300.217826]        bus_for_each_dev+0x72/0xc0
><4> [300.217831]        bus_add_driver+0x1bb/0x210
><4> [300.217835]        driver_register+0x66/0xc0
><4> [300.217841]        0xffffffffa093001f
><4> [300.217844]        do_one_initcall+0x53/0x2f0
><4> [300.217849]        do_init_module+0x45/0x1c0
><4> [300.217855]        load_module+0x1d5e/0x1e90
><4> [300.217859]        __do_sys_finit_module+0xaf/0x120
><4> [300.217864]        do_syscall_64+0x37/0x90
><4> [300.217869]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
><4> [300.217875]
>-> #0 (fs_reclaim){+.+.}-{0:0}:
><4> [300.217880]        validate_chain+0xb3d/0x2000
><4> [300.217884]        __lock_acquire+0x5a4/0xb70
><4> [300.217888]        lock_acquire+0xd3/0x310
><4> [300.217891]        fs_reclaim_acquire+0xa1/0xd0

fs_reclaim ^

><4> [300.217896]        __kmem_cache_alloc_node+0x27/0x170
><4> [300.217899]        __kmalloc+0x43/0x1a0
><4> [300.217903]        acpi_ns_internalize_name+0x44/0x9f
><4> [300.217909]        acpi_ns_get_node_unlocked+0x6b/0xd7
><4> [300.217914]        acpi_ns_get_node+0x3b/0x54
><4> [300.217918]        acpi_get_handle+0x89/0xb7
><4> [300.217922]        acpi_has_method+0x1c/0x40
><4> [300.217928]        acpi_pci_set_power_state+0x42/0xf0
><4> [300.217935]        pci_power_up+0x20/0x1a0
><4> [300.217940]        pci_pm_default_resume_early+0x9/0x30
><4> [300.217945]        pci_pm_runtime_resume+0x29/0x90
><4> [300.217948]        __rpm_callback+0x3d/0x110
><4> [300.217954]        rpm_callback+0x58/0x60
><4> [300.217959]        rpm_resume+0x548/0x760
><4> [300.217963]        __pm_runtime_resume+0x42/0x80
><4> [300.217968]        __intel_runtime_pm_get+0x19/0x80 [i915]
><4> [300.218170]        guc_timestamp_ping+0x63/0xc0 [i915]
><4> [300.218467]        process_one_work+0x272/0x5b0
><4> [300.218472]        worker_thread+0x37/0x370
><4> [300.218477]        kthread+0xed/0x120
><4> [300.218481]        ret_from_fork+0x1f/0x30
><4> [300.218485]

If the suspend has completed, not sure why guc_timestamp_ping is getting 
called and resulting in pci_power_up in this stack. The park should have 
synchronously canceled the ping worker. Strange.

>other info that might help us debug this:
><4> [300.218487] Chain exists of:
>  fs_reclaim --> &gt->reset.mutex --> (work_completion)(&(&guc->timestamp.work)->work)
><4> [300.218495]  Possible unsafe locking scenario:
><4> [300.218497]        CPU0                    CPU1
><4> [300.218499]        ----                    ----
><4> [300.218501]   lock((work_completion)(&(&guc->timestamp.work)->work));
><4> [300.218505]                                lock(&gt->reset.mutex);
><4> [300.218509]                                lock((work_completion)(&(&guc->timestamp.work)->work));
><4> [300.218512]   lock(fs_reclaim);
><4> [300.218515]
> *** DEADLOCK ***

Still looking into it, could use some help with the above questions.

Thanks,
Umesh
>
>Regards,
>
>Tvrtko
