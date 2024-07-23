Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A3993A3C7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 17:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9843610E33E;
	Tue, 23 Jul 2024 15:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LajqmJ94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D3F10E60E;
 Tue, 23 Jul 2024 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721748616; x=1753284616;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JiPfNsH+CTGyvePaCjqZ5PmfJZR6hM6wbiX4/g82lpk=;
 b=LajqmJ94YIRIcrFLAZtuwdcSCSpaWb/WNazcK2USiMOx90thBn9CwdLp
 eAuE51961QZHE8CjjBIWxnhXXj+fdJ2iM8a/ji0SPDOzK728GM0cjAofL
 euOl4LU6zSGcoEMp2d7mQWKX8EXS/herZ56993R8VuYb1mSjAK/n5u8WX
 Vl6jyWeY6Aa2JMl2rODBx/VjCD2RHvs1zNBI3BhxpLHdNRwFxZR1XiIi4
 HCRrUM0SA7/ar/jddLKr2JLMBh8eOtpZCS0vHGCNGTvAQUo4n4ed09aOA
 uIDk6iM6dOrB885+m6adiyRMf+YLQm1eBt9Utf0ZnNIjN3xfk+JL6t9AQ g==;
X-CSE-ConnectionGUID: oAi6yXU1Qy2HvDtSAtT11Q==
X-CSE-MsgGUID: G9CiZY9RRFKYRQIN0YZAhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="12667939"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="12667939"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 08:30:15 -0700
X-CSE-ConnectionGUID: aM1vuRL2QBGq/8JH51YGbA==
X-CSE-MsgGUID: ZFtfQDudS7GsXpTcgJKKVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="52139285"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 08:30:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 08:30:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 08:30:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 08:30:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtc1MZPNNw5At16nWVNN8+fgiop9aIwsuGFK+BtgbL/Fk3vbzrCQrio6P+GhXFp/ypt5dc3gLqBECgNHo6wQejlnH5nOkOl9m7nsBUbxC1FhCSYcb1cTrElt6K/7ssCuxfiPFvyCpBmga55pMgognrOxf2EN7sW+QN5ZLIegsGr5BlkzPSffzC7aiD4bFUikAbeGSwpH7hly9gdXFRXKEkG7vPbwSsv2WKwfMiavGCRn6i9J6hvs3zM++w4c68/X0XVJTOQfxQG2vN8H/p1rIKs3nkpB8MPaBurDKl0Nsj/ZN8PCyksHxXQgeAclYD5PDvhUtg7gQgV/dU3jGt7IeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY1UdjOOwvwCg2fpWuaTCEIuwuinbKLGoBR0l9wxKwI=;
 b=xXuRJWEEvPovUjrnroIUqXUsnPI+eFgvkB0J1T26V+6GlYSaNxxyfsFK/2FBpVQMOzjkLA7+ZBRfmOZygaT8sii/lVHZ7YReWY0EW3uLdbODFTRXNP4epdkzh/Kt2cUpBQKsxzMNmAaH9ZaMyCJyTg9qv+SmkCxhdCX2m4jxO9qsPk6hCpJPDy3f6uhHlAnd8WCu7+fzv4+JPuFNiTTwYV27kd6AE/hCHlB111FoDj30cHLngRzubRBbR9Sp+UdcrEDP7eEz1xJvJMVMCzR3wvNoBsdgUEgqVI77CWbxQxSWR6gST2PwNDVyXQ/InF+JA9vB75Ae/cwVTorFmlH8nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Tue, 23 Jul
 2024 15:30:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Tue, 23 Jul 2024
 15:30:11 +0000
Date: Tue, 23 Jul 2024 10:30:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-gfx@lists.freedesktop.org>, <linux-perf-users@vger.kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] drm/i915/pmu: Lazy unregister
Message-ID: <xsuzfv4rzb4c25sibt5gjskn7xyfwf33wgwaw4nkz5jlnvl2ke@ekur5xvhec3z>
References: <20240722210648.80892-1-lucas.demarchi@intel.com>
 <20240722210648.80892-7-lucas.demarchi@intel.com>
 <be3871bd-fc25-482e-b4d4-91afc4d5b5a5@ursulin.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <be3871bd-fc25-482e-b4d4-91afc4d5b5a5@ursulin.net>
X-ClientProxiedBy: MW4PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:303:b9::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4ef562-4117-41a5-6469-08dcab2c5755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gSQoOQGsCSzFPZmSVt8G7exCP0oGQLKfdkX0Z8rOS+FHZqO1pEv44Ahmr9DA?=
 =?us-ascii?Q?MR7DLh3LG46DrszI27O3mByI8BfMTrpB+sv+GRU9Ti/b6zs8LqeN0YP4/5ua?=
 =?us-ascii?Q?ve3/FsjrUyHPazOZbDRj5aCZiVtGSoVcKTfttrCqJaEG+Nj3iRNCSLMCjd5z?=
 =?us-ascii?Q?YBhST7sXGg6dNt688waNwds/2k9Ugz1/IFfKh3GbqK1+Kja1ABVTsSGrahvJ?=
 =?us-ascii?Q?u3FQAgBCOODDsVwLntxKCC85lXnHxsayoTSSaIN/fbCTTU5HI5fdWloX3rQ8?=
 =?us-ascii?Q?2IJG9ADdzryMUJln9pMaiyj4I6IhmJ5vmfJn4qXsTUcTf2kqLMlq+81C3Mbt?=
 =?us-ascii?Q?DRoQoMGZGokns+YhpKa3FoB8bNioxZolMCPMjvCQqkYvi6KXSLxhAjjYifns?=
 =?us-ascii?Q?teLTO5B/DeX3tGzgsAog5lZ4qwx3ZXJLUNaG039JtRcH2kBsOeZ2iErCKy2Z?=
 =?us-ascii?Q?O6BzS2w6nPrWTl3w7i2V+//LRlLoYTQVPTCxZgTbg3VGqh0s8KK6R4IH0uEm?=
 =?us-ascii?Q?pTDwTk038gQRnTkgvgBGsdTr3Ikxnp8yrwSgaJoxwQDIkiaZ9ns9jWPLpgU0?=
 =?us-ascii?Q?0bMv8uc+vML5T+GrigZMmQUi84Apx/1BccxrDio8NTK1VNktd3kEUh2GHVJx?=
 =?us-ascii?Q?TNkrpfoaJs9isH92bsYGeLt+qanFz80JrWBP5K1pfCS727NTAgRc9tfX12Jj?=
 =?us-ascii?Q?VCESnSdFLiaiRr66beCmanhHd9iXSiMVNHpwecTqRm9EDCgwf59v8xjvDDyL?=
 =?us-ascii?Q?jA0ncZFxpjWeSXsy7soX2ogvN/5MAp53VJCG6QnS1CJx2LXGgkX9mEGDGwqt?=
 =?us-ascii?Q?+l6bkAp4+WfVaAuktRkCWfQn+QVrIELkehQCcO/97zxcHA7hOrTldi1Ydlnc?=
 =?us-ascii?Q?MwNfK0inU8VN37IsTbOG43gGGQ/Q45gOmp8O6EiVpfTeJx3pQWUlrvYmnc9F?=
 =?us-ascii?Q?Pp8KOc0Ck3A/Pmyx9ZjL+pgNyNEjjFxxeF3adbLqQ0ewnbO+XeZf7SSKBozv?=
 =?us-ascii?Q?HUvAZ2fs2a8aYAplmkaly371HZ5B5NL+vrB30OXr/3nIipQhF6SmBte2nfy8?=
 =?us-ascii?Q?TKlhT06wQZkHWMqhiKGYAkFyFNcnJsAbCyxCbsfAGPdVoL07IQKDusJWhb28?=
 =?us-ascii?Q?CdbBRj6cpbi5cxJzeS9t7baG6eMheYm72YGSsKdxW1TfOi9PYRG4NotN3lyU?=
 =?us-ascii?Q?RqPrI67GVv9jyvxPJ31U/5zmvF/qAlnt+tApat0qhuxiXQESCU3IUHBgsO7L?=
 =?us-ascii?Q?8+PDXyATJS1jJMoOAu9xPd/oyz3Qr9IwU32hzjyuXNIb6hVeb+8nuGh5lSHu?=
 =?us-ascii?Q?QdeJclQfbU/PkisGYa0rEW4vN0hanEX1nSRdYHBxzvC/Rw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2J3iYM5BEI+/dRJlLDt92hgTyzqXjTFVhUIfm5tTlxGA21kZDG6Wl5xpGTZ2?=
 =?us-ascii?Q?z5+QYUFX+6FxP2tRAh5cxYNeoyMnx74WCyPZ0CkeNM2uM79KJP6ageUd+6Ld?=
 =?us-ascii?Q?xnMynFdd+33wp+huF0HgbfggRSDT5kFHcC5WcHiS7hOHn3nQcrrz5sPqViuZ?=
 =?us-ascii?Q?mjS02GcpQrR5LTFQkcWQRsmCqhTKE0T+EbhLcV3B/qUNvgOaIcREVHEtYgZD?=
 =?us-ascii?Q?28vq60BfqFts7Gk3qdqb388/R9gAwre7k/uuiASlDU/1fEhkr1Ob/Snxbmaq?=
 =?us-ascii?Q?bKUnMCFa5d8nZ7U16RM9h4H+mPdFF8EVeDG2cOzGKIOA2pd811DNMfYSMBUx?=
 =?us-ascii?Q?g8TLGn01gqC4cdyDxGfyS6j4LN2/X53UDekx7zd0dvj/u88S8qJK93v2vCWR?=
 =?us-ascii?Q?igathOL1Um56BK92VM+RnHs3B9ZMtxKTA55T/JRQEOC7mQcpYcI4xrnbx6sh?=
 =?us-ascii?Q?5oKC1q8e83ImG2h6umzg/dzp8xAnn3nm0HCHMu1TMTVDPrU1QXKDG+BWL38X?=
 =?us-ascii?Q?aumDlGlycOvXD2LA+1dBgULtCVx3xqi2bA5iWYNNZAGDlxhcp2fA37eeQ+Zx?=
 =?us-ascii?Q?5wkj72juw6AWdGtj00ho5KiywHWsIw5a8KN3I5jRhjLiCh2QTTvHGFNaxnr3?=
 =?us-ascii?Q?yNezxxV/HpBQTtdoBnKLbE/Tx/NCluTUAyYgl29LA+5ZiT4bInWR78FvYpvE?=
 =?us-ascii?Q?q5TWNqCb0GhorOBv8+6JzKroya9ePRDFyQq4ftzVdVJ0W5V8WShq7t8f3pab?=
 =?us-ascii?Q?aH7t0lAVQ07BIa9r5Njiv+EdR5ZLzsPaOkcVpnRrSstpAAg/zvtR3RAyZJdb?=
 =?us-ascii?Q?NwiCh6UnL4ZYpQuzSaEZSBJEar83m1ELJ9wo1ceHFJcPzIuIhucY5Dx4ipbZ?=
 =?us-ascii?Q?rOTys6+vNeFF6gV13N/DP5h+NWwWehhEFn7gvVb81ZS0c9HNsrlUu7GFdpwZ?=
 =?us-ascii?Q?hExr03l5danvPjLVatK3n/rIBwfyUipK1ayWp8Vrw+hw15nlQRjI0cENeNHW?=
 =?us-ascii?Q?Zs+blJSKoapqmNRFTgcKP3qE0ymdpT89F5b0Nc5H4PjqwZzyEJA8BjFaCMQB?=
 =?us-ascii?Q?Do8ssmiSgKI0Rxnemsr+S/BU3PXij7EDhwnGA8D1vxnu2mJfQedqHz5K2C4o?=
 =?us-ascii?Q?qc9xEKyvFIOeO/1H9BiWCDhmpQF1mvnwXtVGDPRMrKEdL13vr30LxaaX5/OQ?=
 =?us-ascii?Q?OmO6XApYhxOLXiguQv7Z7/ElbqhNE8u2pTOcq0nJwFu/SpnGgUiFJ4n32QKW?=
 =?us-ascii?Q?rFD/2abmZB5qpLT8yKzgGfAvClYuoBNJye5lP3cL/U2CosnCd4H+JGhrVZBr?=
 =?us-ascii?Q?glB7k7J06CAv6bqRD3poNnVV02RDsWbdDT/Rd84t0aoH8sahLL1zMnR6HEZ6?=
 =?us-ascii?Q?ds7Jk+MaCgpgf9uPnD8bpuGx7wM+mb9bCKGk0v4iPwGsxPU343N4AwbN6Vkb?=
 =?us-ascii?Q?hTBWEWHQEtlDH+aL13baUDtmU/zGx3K5YFc63/qCqB0wUc9ey2ANBGiBAD/U?=
 =?us-ascii?Q?ux5WDV+sR5JbVvSTcwUOYw8jEwJxLXe69L/zeaJoDssyiUmsaH1ry4YfpaCd?=
 =?us-ascii?Q?wdP8yzV7oib8VQJ37gf6t59OtC7MPsyTz+YtJSBsbdusL5rnNXoo1p6twyNU?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4ef562-4117-41a5-6469-08dcab2c5755
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 15:30:11.4257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hiWBb0Po2u5gPLEwzTe/4EqyDsqax6iZmytwn9GE9uoNeYMPTG+ITFCd6PdHLkK/IxXayVVuKoGDrQ/T3cMffCfmz0zeRjiUtCfnG83EoAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7264
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

On Tue, Jul 23, 2024 at 09:03:25AM GMT, Tvrtko Ursulin wrote:
>
>On 22/07/2024 22:06, Lucas De Marchi wrote:
>>Instead of calling perf_pmu_unregister() when unbinding, defer that to
>>the destruction of i915 object. Since perf itself holds a reference in
>>the event, this only happens when all events are gone, which guarantees
>>i915 is not unregistering the pmu with live events.
>>
>>Previously, running the following sequence would crash the system after
>>~2 tries:
>>
>>	1) bind device to i915
>>	2) wait events to show up on sysfs
>>	3) start perf  stat -I 1000 -e i915/rcs0-busy/
>>	4) unbind driver
>>	5) kill perf
>>
>>Most of the time this crashes in perf_pmu_disable() while accessing the
>>percpu pmu_disable_count. This happens because perf_pmu_unregister()
>>destroys it with free_percpu(pmu->pmu_disable_count).
>>
>>With a lazy unbind, the pmu is only unregistered after (5) as opposed to
>>after (4). The downside is that if a new bind operation is attempted for
>>the same device/driver without killing the perf process, i915 will fail
>>to register the pmu (but still load successfully). This seems better
>>than completely crashing the system.
>
>So effectively allows unbind to succeed without fully unbinding the 
>driver from the device? That sounds like a significant drawback and if 
>so, I wonder if a more complicated solution wouldn't be better after 
>all. Or is there precedence for allowing userspace keeping their paws 
>on unbound devices in this way?

keeping the resources alive but "unplunged" while the hardware
disappeared is a common thing to do... it's the whole point of the
drmm-managed resource for example. If you bind the driver and then
unbind it while userspace is holding a ref, next time you try to bind it
will come up with a different card number. A similar thing that could be
done is to adjust the name of the event - currently we add the mangled
pci slot.

That said, I agree a better approach would be to allow
perf_pmu_unregister() to do its job even when there are open events. On
top of that (or as a way to help achieve that), make perf core replace
the callbacks with stubs when pmu is unregistered - that would even kill
the need for i915's checks on pmu->closed (and fix the lack thereof in
other drivers).

It can be a can of worms though and may be pushed back by perf core
maintainers, so it'd be good have their feedback.

thanks
Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/i915/i915_pmu.c | 24 +++++++++---------------
>>  1 file changed, 9 insertions(+), 15 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>>index 8708f905f4f4..df53a8fe53ec 100644
>>--- a/drivers/gpu/drm/i915/i915_pmu.c
>>+++ b/drivers/gpu/drm/i915/i915_pmu.c
>>@@ -1158,18 +1158,21 @@ static void free_pmu(struct drm_device *dev, void *res)
>>  	struct i915_pmu *pmu = res;
>>  	struct drm_i915_private *i915 = pmu_to_i915(pmu);
>>+	perf_pmu_unregister(&pmu->base);
>>  	free_event_attributes(pmu);
>>  	kfree(pmu->base.attr_groups);
>>  	if (IS_DGFX(i915))
>>  		kfree(pmu->name);
>>+
>>+	/*
>>+	 * Make sure all currently running (but shortcut on pmu->closed) are
>>+	 * gone before proceeding with free'ing the pmu object embedded in i915.
>>+	 */
>>+	synchronize_rcu();
>>  }
>>  static int i915_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>>  {
>>-	struct i915_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>>-
>>-	GEM_BUG_ON(!pmu->base.event_init);
>>-
>>  	/* Select the first online CPU as a designated reader. */
>>  	if (cpumask_empty(&i915_pmu_cpumask))
>>  		cpumask_set_cpu(cpu, &i915_pmu_cpumask);
>>@@ -1182,8 +1185,6 @@ static int i915_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>>  	struct i915_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>>  	unsigned int target = i915_pmu_target_cpu;
>>-	GEM_BUG_ON(!pmu->base.event_init);
>>-
>>  	/*
>>  	 * Unregistering an instance generates a CPU offline event which we must
>>  	 * ignore to avoid incorrectly modifying the shared i915_pmu_cpumask.
>>@@ -1337,21 +1338,14 @@ void i915_pmu_unregister(struct drm_i915_private *i915)
>>  {
>>  	struct i915_pmu *pmu = &i915->pmu;
>>-	if (!pmu->base.event_init)
>>-		return;
>>-
>>  	/*
>>-	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
>>-	 * ensures all currently executing ones will have exited before we
>>-	 * proceed with unregistration.
>>+	 * "Disconnect" the PMU callbacks - unregistering the pmu will be done
>>+	 * later when all currently open events are gone
>>  	 */
>>  	pmu->closed = true;
>>-	synchronize_rcu();
>>  	hrtimer_cancel(&pmu->timer);
>>-
>>  	i915_pmu_unregister_cpuhp_state(pmu);
>>-	perf_pmu_unregister(&pmu->base);
>>  	pmu->base.event_init = NULL;
>>  }
