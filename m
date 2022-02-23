Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5784C1B53
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 20:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C0610E247;
	Wed, 23 Feb 2022 19:03:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA21410E247;
 Wed, 23 Feb 2022 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645643003; x=1677179003;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aAwu8wJVuGiCZ698wn22rUx8UrGDM+bVeBTMEgbiOxg=;
 b=kKTIyZ/UwqoVrjzxlane7JaYKCQOuQODoiIM+GmRDq68dot1AsdNsTES
 nxEkAvkXXVf1Hl9YVwIdzlKZdGwC/j7wkpV65ctUwPej8EtZtrqnbGBWy
 Bi9qEc0Q7EQmKEmFbkZhsMk4oi4lfa39oTzvjkyH6q7ZnVXnPXyzXkcl2
 0+tRk0jexizy4bsrxsjOi5pwlN83w+ZIwfQtEMCs6kcfgRvsRbAu6XMUZ
 sXY9WBU/k0D5EmPQ+wHShM5kMES6TEjbdcnmwA+QswWHJrs6WuK/AeWjj
 //CcDXkcx0fDZVV+RsEnHmgr1n7t5yJ+RSZLW4IzMpQMJUQJ+9VJOvACo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="276679311"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="276679311"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 11:03:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="548399187"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 23 Feb 2022 11:03:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Feb 2022 11:03:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 23 Feb 2022 11:03:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 23 Feb 2022 11:03:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 23 Feb 2022 11:03:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7BeCQjuzMvqMkZQKZzXifk/KZj+6P79zMS20i/Qv38Lgixwyc/Rz7FqoAAuhX4ZAXufG2ODwN6JMC+x2jGaRssLyhZgzbdcnfDSeCaCpe8V9w/RzRa9QN6RqJIaVweGX0meGDJaaTKTScouI9f5CqNwy4KuA9w64RfQZxSrw9iCaUTgFn3Txgz29+Sr/AI8EV2euSkyJxgvsyx9rKGOgQq7G4bNgvG4c9VJxCdszehTS3m8+VPzxE/iSAeqWB3ytvLhkcZBFUtp5J3Bp/rU6DDfDWA/y8pWK8uvMVsJf+peA+KT8RSUuJ5J14VXdpPIeX8LvnQGJUn3K7LndOKLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuX/KGC+DiTHUIQk6ccx2qIwPDvIuVtdlbDAvF/f3Po=;
 b=eQDLpUCZjuj70e56eWlPDkDvB41RvnbeovVUOBCruyEWMAoCKtDhRhUxzJ9vVROblatzUMnUERvgghV1tfCvia0QFBrp0Eun85KjAdnYKw2/+JKkxpNow6dA3s4t+OeT9D7oVNC+7tWPikLRqt0aSpXrBQgvL/i2AfXlnpKZYJCdLxMuXH7kKAJLreXga2q/Wf5/KNGsD6J//B7mogOrvNc0Lskg7gvj7/t+IwtxxOB38/6635VssUe3YrBpkuBg6Ym6kl+WZ+7ZuYeF5HUSBRW544iXCcQ6p2kiGHMFyiDq5WQLsedm71PaBusIr4G0hVDNUY3l9FKwfnIqaV+Aqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN2PR11MB4566.namprd11.prod.outlook.com (2603:10b6:208:24e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Wed, 23 Feb
 2022 19:03:13 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 19:03:13 +0000
Message-ID: <85105590-a8be-f4e1-69bc-cd34cad108e2@intel.com>
Date: Wed, 23 Feb 2022 11:03:09 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Limit scheduling properties
 to avoid overflow
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-2-John.C.Harrison@Intel.com>
 <0d0c5a79-1285-0830-3794-e9f0644811a5@linux.intel.com>
 <94c3184e-c1e2-668f-5824-00fd55797736@intel.com>
 <17e69f0c-8084-10dc-b20f-7d5108260180@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <17e69f0c-8084-10dc-b20f-7d5108260180@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:303:2b::20) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 363e43da-c3a8-4430-83b2-08d9f6ff2443
X-MS-TrafficTypeDiagnostic: MN2PR11MB4566:EE_
X-Microsoft-Antispam-PRVS: <MN2PR11MB4566E65EC74357080BD85050BD3C9@MN2PR11MB4566.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XmIvdT6IHAlHN52guxL+CbtYfOxkTOAq9Hu9JgtWLlr0yitDVCJvwV1h6bpbUXbzh31J3vPywl3hSe0ZMZvhlutsMaKElcBdbSvIkBF0jBdAh3X3w92r6/hkiiGx+XpWT1Cn1i/byM+CXdR99zlSW2KWz+E1HI3rSyfUKwzyOPKs4WtjjXBmw6QUWGelwW6WT91WnSnr61tLHj++Vj9czm8O3+x36ZQdWOYYW8nRUmKwpg9C1K7gcDAMaW2bGw9XeXtL9X9VpsdOmaa09IXNE4lZnFNXqOd8EJuvtodP/qy3wDsN6OXljnGUvxTl3YH1KeuuBe7mAbv3H496GWQIt5+9pMU6IUUdVrvkP74bd0MgAs+zWwWSy/1biyFWXM20qvhqFCpapSuZZGg5bsphKxUNf8Cp2QNABntlYjP9dt4V3FhgIOdbe/KUk4fdUjksDPQvdnFDRJlh/YUo9y5fYr3H2ScuRjovE9E2cOYEUdgOdT6zk7Lc8WoMOuBn0+usYJUKl0KLO59Gp815jQe7qEiAmfzLUCHCEyrnwvd0qAGuyOs7GHfhyAFnhFwD8nwUyjCx0nzqTUhpTfpK96pU0QcjlBdyWNigXmg0SuViXh2FDfN/BQRGc4nNs41s/geMB6auygT2KR/V9xT3CT/d35kHjE343FrGJDBXSMuhdofAprSoqbMnEFVhNIenZ3jjTVFPQYOB6sFfdd5T2TiN6VS0FuI9FzzyGyUPHakcHxVFFq3UcM4vmQkG83GQjqV6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(316002)(53546011)(6666004)(6512007)(6506007)(186003)(2616005)(5660300002)(2906002)(8936002)(30864003)(26005)(31696002)(66946007)(83380400001)(6486002)(31686004)(86362001)(66556008)(66476007)(8676002)(4326008)(82960400001)(508600001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0VvTUxHTXVMUWZGWU1OSjgrYkpjUCtyd2FZNGxwU2xKN3dsRFA4NVFOdWgy?=
 =?utf-8?B?a0ZRaDBVS3U3d1JVOTVzRmJZVDAvazhiQ29YdjdjTzEyNkcwd1lRbFV3WXN0?=
 =?utf-8?B?STQ1dC91MG55TGtyWm5wU3dDRjEzdUVZT2pyU3hhTFhTUGlLUzgwK0ZTTHBr?=
 =?utf-8?B?d1Bwb3dyZ2I2dkNWS2hQdnZOb3NIckVvVmdCYUF5d2dYSlprSnBVZm9vdksv?=
 =?utf-8?B?czhhbEsvYVlrNkhKbW5Oa1ZXV3Y3Wk14YWVIcjQySTljZ1cySUxtb2N3WG0x?=
 =?utf-8?B?T0UraXpSTXRPMFRyUFhmSnY4bCtYdkFBSVdPT0xZMUtzSDhhdjdxM2JVbWRX?=
 =?utf-8?B?cXowd2xMenUrb1lxb0xudmJLNWdESG90ZGwrNzRxT2xXOWl5SlREL1hTelRy?=
 =?utf-8?B?OTE1eDlGSGNlQWlwNnZGMWcvTndwRWpwUENyS0Fkb3M4ODV6aEw4NmRaTlIx?=
 =?utf-8?B?VGtzbXVRSlhCaE5DWm12WVVXcEx1R1liWFBqOUFKTy85T3F5d1cvV3dUcFNy?=
 =?utf-8?B?SW5oRkl5U0p2NHl6N2lRQ2g0VjNWN3dIV2VoTTk0Qm9lRllrcWV0eWI5TkdP?=
 =?utf-8?B?UDlWcFQxRC9VWDYzNHlDeFZKanVtdjZrVnpjSzlDbkhXb1R5R0JPUlVYK0ZX?=
 =?utf-8?B?ODhvVG5JSlBTYXdMTksrVmVsR2J3ZkVOOHZNV0cyZmpMZW5IVVc2V1RUaGtu?=
 =?utf-8?B?YldYTklJOVEyRXlsNXhjVmZkWWtxYWE1dmgwYUZVcGZic2lqdmhEYVMyTi84?=
 =?utf-8?B?emRzdlJ0a1V3aFhMOHZvTXdYNUtRUldibEhmQlloalVLNGVnV2FsamhVL2M5?=
 =?utf-8?B?bHlRbFJFcHhhZ3RVK0l0VVBEajFBa3h1b1dPZ0w3WDBVbTB6NkFwQm9Xczlq?=
 =?utf-8?B?bnFGaS9RNlFRbm1oQ2dXOEVHYlZyV2NLWWhNVmdEek5MRTR6V0ZqTTlxWXFh?=
 =?utf-8?B?U1haTVQvaGxoNGduZVNTRjZMZDFBMGxTdURja3l0eU9MclJRdEwrQ3ZhaWRo?=
 =?utf-8?B?WUtrcEsrT3lrYThaK3Qrd2tmMG9zYnlTdDZkaUNDMkxxbGhhVEhReGhreVFz?=
 =?utf-8?B?YTVWUHcvV1dybE1kaHpkOEtHbktycVE3NyswcmpPM2tHUHpjRmxRc3JCV0RE?=
 =?utf-8?B?bTBCVk1lWDVQM1ZSbWRLZ0hFQVA1TEtuOWR0ZVFaUGRRdlBXclU5c3g1NGEy?=
 =?utf-8?B?bXJRVnYzQkUwY2lHbHJjTm5hMk01OEtRb3hzNVFHRnZZa0NrSVIzWU8vSGVh?=
 =?utf-8?B?WjdTSjhFNXg2enFmTmxUbmI5ejdNdmhYa0FuUjZCRnYxSEpmb2JtWGp3UTI2?=
 =?utf-8?B?elQzN2J2R0hWamVESU0xS2U0NUtrSkxEZEFrMXEvSzhKMy8raXpNVE1Ydldv?=
 =?utf-8?B?TWVBWWlRdlFaUUZ4Wkl4aFBHK21VZEU1ZFNZVFROemJWRUZxd04weEV4LzdF?=
 =?utf-8?B?cnYyK2FNZWtoc2x3ZnZRS2lyK0MwTXhmbTJsVUVrcDlwK0ZIaU81Vm51a0Jp?=
 =?utf-8?B?SGZQUVBhclZXcjJOb3VTOGJvWE0yeFFMck1LWE8zY3c2dlV6TVZKa2tNN1Vr?=
 =?utf-8?B?V0d1a3IrbjRtOUs3U2ZUZmpvZSs3amY1Y2RtOEVabjNGczNhbTBJLzhFcUFt?=
 =?utf-8?B?aUVUMWJPa1k4MUI4THVtcC9vRC93ZFlpUm5uVXpscHBLU3ZYblI5TzNzVXVF?=
 =?utf-8?B?eHhXaEZPenpDbk9HMjdzWXArVUg1c0tPbU5odzhpTWtEeFRzb29mbmNNd2dn?=
 =?utf-8?B?K0tlRWhmREhhcjkyTWVyZmNPZmMxd1B2T21FQkdjVkdwNEI5N0orZDYrQjNM?=
 =?utf-8?B?S09iZlUybW90U1Z0MG1TeDlSUFB0Uk1lWTFNWWpxaWVGSCszclQ3a2I1T0Fh?=
 =?utf-8?B?bXd2TlBpWEZzVXJjRWw2Zkc4SkVzUk4zSXpEUEVudUp3LzQ4MzRaeVcrclF6?=
 =?utf-8?B?M0FXcE1EY0g0V1VpaFg0YzRvcG5SaHNvNlg4c0dJTDhMS3VtS0RFM2hVUlRS?=
 =?utf-8?B?WDBnUDk3K3ZQSVVFeHl5Z2ZCaEZKK0lhM1pNMWVVUEg4L3hrSXR3MXNseEky?=
 =?utf-8?B?UFMxSWNaSit6MW9EUDZQYU1sWSs4TmsvRTBPSW44TEZYSjdrQWZzbWMyV0VC?=
 =?utf-8?B?OVhQaG5HRGl2STErNWx4TnVualRuTHhqODJkWWFhenJtQ1RpRTBJTWhYZ3lz?=
 =?utf-8?B?Z0RTYmhMVm54VGFSK1Y4bzN3NHludnpSUmRRZGJhclg2azdzNUNJRnNOK21D?=
 =?utf-8?Q?wNPAe5VszBngU3qwDyp6sP0IN/LIVdDQsjQ3UeNTSs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 363e43da-c3a8-4430-83b2-08d9f6ff2443
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 19:03:13.7320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93HBtS3sLiOEBhNoEUIVY0aa4/ZzWWc5U39f+KAkxry/FByPJSr/DHu3FOw4/P3Vf6qiPLZikKV9p2lSBbctYCGKLtCJ6XMBtcG4GMfqOag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4566
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

On 2/23/2022 04:13, Tvrtko Ursulin wrote:
> On 23/02/2022 02:11, John Harrison wrote:
>> On 2/22/2022 01:52, Tvrtko Ursulin wrote:
>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> GuC converts the pre-emption timeout and timeslice quantum values into
>>>> clock ticks internally. That significantly reduces the point of 32bit
>>>> overflow. On current platforms, worst case scenario is approximately
>>>
>>> Where does 32-bit come from, the GuC side? We already use 64-bits so 
>>> that something to fix to start with. Yep...
>> Yes, the GuC API is defined as 32bits only and then does a straight 
>> multiply by the clock speed with no range checking. We have requested 
>> 64bit support but there was push back on the grounds that it is not 
>> something the GuC timer hardware supports and such long timeouts are 
>> not real world usable anyway.
>
> As long as compute are happy with 100 seconds, then it "should be 
> enough for everbody". :D
Compute disable all forms of reset and rely on manual kill. So yes.

But even if they aren't. That's all we can do at the moment. If there is 
a genuine customer requirement for more then we can push for full 64bit 
software implemented timers in the GuC but until that happens, we don't 
have much choice.

>
>>>
>>> ./gt/uc/intel_guc_fwif.h:       u32 execution_quantum;
>>>
>>> ./gt/uc/intel_guc_submission.c: desc->execution_quantum = 
>>> engine->props.timeslice_duration_ms * 1000;
>>>
>>> ./gt/intel_engine_types.h:              unsigned long 
>>> timeslice_duration_ms;
>>>
>>> timeslice_store/preempt_timeout_store:
>>> err = kstrtoull(buf, 0, &duration);
>>>
>>> So both kconfig and sysfs can already overflow GuC, not only because 
>>> of tick conversion internally but because at backend level nothing 
>>> was done for assigning 64-bit into 32-bit. Or I failed to find where 
>>> it is handled.
>> That's why I'm adding this range check to make sure we don't allow 
>> overflows.
>
> Yes and no, this fixes it, but the first bug was not only due GuC 
> internal tick conversion. It was present ever since the u64 from i915 
> was shoved into u32 sent to GuC. So even if GuC used the value without 
> additional multiplication, bug was be there. My point being when GuC 
> backend was added timeout_ms values should have been limited/clamped 
> to U32_MAX. The tick discovery is additional limit on top.
I'm not disagreeing. I'm just saying that the truncation wasn't noticed 
until I actually tried using very long timeouts to debug a particular 
problem. Now that it is noticed, we need some method of range checking 
and this simple clamp solves all the truncation problems.


>
>>>> 110 seconds. Rather than allowing the user to set higher values and
>>>> then get confused by early timeouts, add limits when setting these
>>>> values.
>>>
>>> Btw who is reviewing GuC patches these days - things have somehow 
>>> gotten pretty quiet in activity and I don't think that's due absence 
>>> of stuff to improve or fix? Asking since I think I noticed a few 
>>> already which you posted and then crickets on the mailing list.
>> Too much work to do and not enough engineers to do it all :(.
>>
>>
>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 15 +++++++++++++++
>>>>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 14 ++++++++++++++
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++++++++
>>>>   3 files changed, 38 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>> index e53008b4dd05..2a1e9f36e6f5 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>> @@ -389,6 +389,21 @@ static int intel_engine_setup(struct intel_gt 
>>>> *gt, enum intel_engine_id id,
>>>>       if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
>>>>           engine->props.preempt_timeout_ms = 0;
>>>>   +    /* Cap timeouts to prevent overflow inside GuC */
>>>> +    if (intel_guc_submission_is_wanted(&gt->uc.guc)) {
>>>> +        if (engine->props.timeslice_duration_ms > 
>>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>>>
>>> Hm "wanted".. There's been too much back and forth on the GuC load 
>>> options over the years to keep track.. intel_engine_uses_guc work 
>>> sounds like would work and read nicer.
>> I'm not adding a new feature check here. I'm just using the existing 
>> one. If we want to rename it yet again then that would be a different 
>> patch set.
>
> $ grep intel_engine_uses_guc . -rl
> ./i915_perf.c
> ./i915_request.c
> ./selftests/intel_scheduler_helpers.c
> ./gem/i915_gem_context.c
> ./gt/intel_context.c
> ./gt/intel_engine.h
> ./gt/intel_engine_cs.c
> ./gt/intel_engine_heartbeat.c
> ./gt/intel_engine_pm.c
> ./gt/intel_reset.c
> ./gt/intel_lrc.c
> ./gt/selftest_context.c
> ./gt/selftest_engine_pm.c
> ./gt/selftest_hangcheck.c
> ./gt/selftest_mocs.c
> ./gt/selftest_workarounds.c
>
> Sounds better to me than intel_guc_submission_is_wanted. What does the 
> reader know whether "is wanted" translates to "is actually used". 
> Shrug on "is wanted".
Yes, but isn't '_uses' the one that hits a BUG_ON if you call it too 
early in the boot up sequence? I never understood why that was necessary 
or why we need so many different ways to ask the same question. But this 
version already exists and definitely works without hitting any explosions.

>
>>> And limit to class instead of applying to all engines looks like a 
>>> miss.
>> As per follow up email, the class limit is not applied here.
>>
>>>
>>>> + drm_info(&engine->i915->drm, "Warning, clamping timeslice 
>>>> duration to %d to prevent possibly overflow\n",
>>>> +                 GUC_POLICY_MAX_EXEC_QUANTUM_MS);
>>>> +            engine->props.timeslice_duration_ms = 
>>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>>>
>>> I am not sure logging such message during driver load is useful. 
>>> Sounds more like a confused driver which starts with one value and 
>>> then overrides itself. I'd just silently set the value appropriate 
>>> for the active backend. Preemption timeout kconfig text already 
>>> documents the fact timeouts can get overriden at runtime depending 
>>> on platform+engine. So maybe just add same text to timeslice kconfig.
>> The point is to make people aware if they compile with unsupported 
>> config options. As far as I know, there is no way to apply range 
>> checking or other limits to config defines. Which means that a user 
>> would silently get unwanted behaviour. That seems like a bad thing to 
>> me. If the driver is confused because the user built it in a confused 
>> manner then we should let them know.
>
> Okay, but I think make it notice low level.
>
> Also consider in patch 3/3 when you triple it, and then clamp back 
> down here. That's even more confused state since tripling gets nerfed. 
> I think that's also an argument to always account preempt timeout in 
> heartbeat interval calculation. Haven't got to your reply on 2/3 yet 
> though..
That sounds like even more reason to make sure the warning gets seen. 
The more complex the system and the more chances there are to get it 
wrong, the more important it is to have a nice easy to see and 
understand notification that it did go wrong.


>
>>>
>>>> +        }
>>>> +
>>>> +        if (engine->props.preempt_timeout_ms > 
>>>> GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
>>>> +            drm_info(&engine->i915->drm, "Warning, clamping 
>>>> pre-emption timeout to %d to prevent possibly overflow\n",
>>>> +                 GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
>>>> +            engine->props.preempt_timeout_ms = 
>>>> GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
>>>> +        }
>>>> +    }
>>>> +
>>>>       engine->defaults = engine->props; /* never to change again */
>>>>         engine->context_size = intel_engine_context_size(gt, 
>>>> engine->class);
>>>> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c 
>>>> b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>>> index 967031056202..f57efe026474 100644
>>>> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>>> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>>>> @@ -221,6 +221,13 @@ timeslice_store(struct kobject *kobj, struct 
>>>> kobj_attribute *attr,
>>>>       if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>>>           return -EINVAL;
>>>>   +    if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
>>>> +        duration > GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>>>> +        duration = GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>>>> +        drm_info(&engine->i915->drm, "Warning, clamping timeslice 
>>>> duration to %lld to prevent possibly overflow\n",
>>>> +             duration);
>>>> +    }
>>>
>>> I would suggest to avoid duplicated clamping logic. Maybe hide the 
>>> all backend logic into the helpers then, like maybe:
>>>
>>>   d = intel_engine_validate_timeslice/preempt_timeout(engine, 
>>> duration);
>>>   if (d != duration)
>>>     return -EINVAL:
>>>
>>> Returning -EINVAL would be equivalent to existing behaviour:
>>>
>>>     if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>>         return -EINVAL;
>>>
>>> That way userspace has explicit notification and read-back is 
>>> identical to written in value. From engine setup you can just call 
>>> the helper silently.
>> Sure, EINVAL rather than clamping works as well. And can certainly 
>> add helper wrappers. But as above, I don't like the idea of silently 
>> disregarding a user specified config option.
>
> Deal - with the open of heartbeat interval TBD.
>
>>
>>>
>>>> +
>>>>       WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
>>>>         if (execlists_active(&engine->execlists))
>>>> @@ -325,6 +332,13 @@ preempt_timeout_store(struct kobject *kobj, 
>>>> struct kobj_attribute *attr,
>>>>       if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>>>           return -EINVAL;
>>>>   +    if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
>>>> +        timeout > GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
>>>> +        timeout = GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
>>>> +        drm_info(&engine->i915->drm, "Warning, clamping 
>>>> pre-emption timeout to %lld to prevent possibly overflow\n",
>>>> +             timeout);
>>>> +    }
>>>> +
>>>>       WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
>>>>         if (READ_ONCE(engine->execlists.pending[0]))
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>>> index 6a4612a852e2..ad131092f8df 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>>> @@ -248,6 +248,15 @@ struct guc_lrc_desc {
>>>>     #define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
>>>>   +/*
>>>> + * GuC converts the timeout to clock ticks internally. Different 
>>>> platforms have
>>>> + * different GuC clocks. Thus, the maximum value before overflow 
>>>> is platform
>>>> + * dependent. Current worst case scenario is about 110s. So, limit 
>>>> to 100s to be
>>>> + * safe.
>>>> + */
>>>> +#define GUC_POLICY_MAX_EXEC_QUANTUM_MS        (100 * 1000)
>>>> +#define GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS    (100 * 1000)
>>>
>>> Most important question -
>>> how will we know/notice if/when new GuC arrives where these timeouts 
>>> would still overflow? Can this be queried somehow at runtime or 
>>> where does the limit comes from? How is GuC told about it? Set in 
>>> some field and it just allows too large values silently break things?
>> Currently, we don't notice except by debugging peculiar test failures 
>> :(.
>>
>> These limits are not in any GuC spec. Indeed, it took a while to 
>> actually work out why increasing the value actually caused shorter 
>> timeouts to occur! As above, there is no range checking inside GuC 
>> itself. It does a truncated multiply which results in an effectively 
>> random number and just happily uses it.
>
> I will agree with what Daniele said - push on GuC fw folks to document 
> the max values they guarantee to support in the interface spec. 
> Otherwise it is too fragile.
I do agree. But that is going to take time. I would like to get 
something merged now while we fight over spec updates.

John.

>
> Regards,
>
> Tvrtko

