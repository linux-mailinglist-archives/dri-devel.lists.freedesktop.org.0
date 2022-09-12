Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C442B5B6290
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 23:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9EB10E2FF;
	Mon, 12 Sep 2022 21:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33BE10E2F6;
 Mon, 12 Sep 2022 21:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663017115; x=1694553115;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P+iEHbNfhEW1K6j48hZf/A5nXZmobRn+nDCYe+3NffI=;
 b=WXu1APCiFMZionHGugPBXd7RHT0LRU9V/5afYUOa/Z1JxFCLzmNoKKLj
 401qx4dEdbXwJWoRDNXQjp9skjEz7Bjncfx1gaZ4a7eV5vtuPoyB3PmaY
 AsBq5ZLWKcMRtteG6f41kSYPFQzRMNv7VcKkeek8v75p7iWgxszrZCoxk
 jXOVuwr9YHFivi34xCqMAQuZl1GJI+22CnM5XFFYQZxBZbFI3sNxzlKnU
 o+SLHu0axAmqc5gbUSexFJ5OxZ4uXHgZC/kBplCnzvjIw1EawmVX6Af0N
 a+ViBNdZjpH+mpnzM5ZKr+opT2CVSOIehhJq4xxW/1J8/3cpIMpfOuf3b w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="295558792"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="295558792"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 14:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="616207067"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 12 Sep 2022 14:11:53 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 14:11:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 14:11:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 12 Sep 2022 14:11:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 12 Sep 2022 14:11:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoFcpStgjq5KBl5KszLAjfwH1kz9pvPrI0iBcXeYR428xx9WpqEoCSAo4ZV96U2Wl0FmNTZf24Af9iIgYhidUKcqdAHLc51piluK+pCpkTXcXKkBXnNAUBz+gbDME6E+UHPacwVHArb5AwCYrCDczuFHQ5Smm9YOnNmpDeZyVZNeRQTLeEzW63m5vgMvFwuXIsLtTtqMOXtq60kncRjbQjpaRS8xk4yA/CEHH0Qy964dRYJ/1dPbTfm3c82wlIFCY6JaG65EsljKR70E27PIKiAXrsPt7yX98+eNRdoxuCdEsTLbw8PMX6UfTZq1jJcEdwURtt3lr4pillRf7B94rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgzIP7b9Nz5s5XFyxylCx39e7dYx5aH+GUf2jEsNRoM=;
 b=K1Rlg/VYkzFwR2aNaNbokFEA84fYLx7QX5f3YsS+53SEUUNgTfvM/XZqDYhIyP/CZCeYuKduRokNgEc87UbWR5YRwe0PJJ+PUC2Hg853pSL8TM1YOO7NbQHV79a4QP37pAX5fl0qKMC0tlkrM+/6c3FDVCw58TKiGAzMMQHhRbSs/9WoM4T3Yxub8nEpnvx0nyLLreQhPMgmwPqCxU4Fk3oFJJJkWrvmyi/6+QKvBZRKEmAgxmFIymjML4Gl9HHBctQLuuq60PY5g+oxLvm2or5RlJXS4zzxLXvxVLeK6mHpOop2uDt13RX6cPD68I9T4JZbNXXn+7jxMdRR78kbgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7131.namprd11.prod.outlook.com (2603:10b6:806:2b0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Mon, 12 Sep
 2022 21:11:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 21:11:51 +0000
Date: Mon, 12 Sep 2022 14:11:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v1 1/1] drm/i915: Skip applying copy engine
 fuses
Message-ID: <20220912211148.scxzu7m3llx6qfna@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220912-copy-engine-v1-0-ef92fd81758d@intel.com>
 <20220912-copy-engine-v1-1-ef92fd81758d@intel.com>
 <Yx9liQu4JmnVmWVn@alfio.lan>
 <20220912181247.dfyupvp4qxbavnen@ldmartin-desk2.lan>
 <Yx+KIOliWdMIAe/M@alfio.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Yx+KIOliWdMIAe/M@alfio.lan>
X-ClientProxiedBy: SJ0PR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:334::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 29589cac-1612-45bd-f34f-08da9503693f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fKXRruiR0UjhOSYHphaX/B0ztPdb8oN0qvJA9DGyEw7uj43wAShuVHS4VSVXzSN+7LZ1XCjiDjqZ8axOj/FwiQ0VQd5RLbf9SrX7QuAigScSSuxg8pyiSKj+AjlFjChujYRFToBRTxOf0/FdfguB3WpsEe1JsSAoRaGPNaDd5+u6FDI8MJmEh9/KKYJftDuEBNvZkuWANw7ggVpULuDQXTriMcQJnYMdzCGt9XgfUiY4VNQAD57ZA3XJrrR1cRr8D5DsEmTtFKQyYmga7BuhK+ugBvSHB0/uVg3PDC8Na+HtvYxwCmfCg531hPqEvcH4AHG/5wi0MKgkPTQO4Z+GzAexTD+/1VmFC2EopMXcL+ofzeODUjTiSsJPwkXW+aE9TnJXmrtJuSiU35s4x62t6kbG88WiTnVfIKAWNV4fCes44j7Y9pXVwUgVTog6lkTTJ2OSf/vEyguxqXbaHn2TRFLMDt3JYkThA4/WF4LQUlSPLKoJV3woDy3HRYHMa7FarSe1u+yOuld2gbNPHj5Rg3i7QHR6n5ZhjcUebvpjdlKYNISgJv7pCcNj404hbCJ7dg02aYdOaLQHz70Cu+vUBHko/7LetwwvuG+pMgEe82pQzum3846gsxQ2+0i0WjKloc/ouNQ86VzDrGPnnQGG0nixhxcrl99jOFeY7rnPje0dVzdDSofBKfRUSzhmFMAWHgMGq8Ln5jB39JImopqlQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199015)(186003)(1076003)(316002)(6916009)(9686003)(8936002)(66946007)(86362001)(6486002)(478600001)(8676002)(26005)(83380400001)(38100700002)(41300700001)(66476007)(6512007)(6506007)(4326008)(2906002)(6666004)(36756003)(66556008)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ouQUGiTsbNwxHTYygoKoKfRv2jufMjK08MYy12TDyMHmty+1kOMxs0aimgL2?=
 =?us-ascii?Q?NmKSJlk0SJAnIgFE5lrSeVscRGx5qer+yD9P8GAs2wKN6hbyzY+BsVh4fp13?=
 =?us-ascii?Q?N28kYeSwxdXpbdp056fKFc4xhIgYOt82lgg0UbtBEELAfoTIdMSwHuaqY5wt?=
 =?us-ascii?Q?I3pB25aydRakStxcZiuBmbm1w4sbp+965wtM5JIfXp64XSoCzf44Xdpblbwm?=
 =?us-ascii?Q?i1eWGoehcfsc2x7q9yVZb/g0JCqXG1HBFVc9ImeRj+xqBBK6qlP4FRzdYpjE?=
 =?us-ascii?Q?0A82+eSCssyENr0h3GO6O492wdZxCEm0+Reu5EEoQvvBNs8mEBzv9/53tivt?=
 =?us-ascii?Q?68wHSSrDtHmklE5WCUSbqp1VeXxG+C6J95Re4Aka6odl2UW9n2xrn+HCMPBe?=
 =?us-ascii?Q?re+ie10Xpa3RRGvrTSf+y3Taq3tqH8g8mZDRTdtUCLX/bEP3Q4h7NfR1AsJ0?=
 =?us-ascii?Q?eTyBeJ0I8VCzppfvShoVWLKtuiOZvSZGfLllq4P0+jvC8Y1gQ/MXEESMRlxh?=
 =?us-ascii?Q?SUnpeLk2YvQXYRDkFtSsyljnbwn2gryaENbPz5jtalU6s7JFKRNn6SOEiSJk?=
 =?us-ascii?Q?P2BGqLlzzxRWxRRCQO05ye8f+7H73lAQkpVVbEc/XCf1vUAmX3tpecCQz8/e?=
 =?us-ascii?Q?U9+v6f1JXBz0j+WvLXZISa9qUV+agtOZYUhtVM6htJ+qoYJ7vLk4Q5zFWvbc?=
 =?us-ascii?Q?ocwELv7dOvGlczSZw3/yrwV+yZciuPQ4BUPBmlQXBGb1s+Pqb2z0Y5Tp/XjE?=
 =?us-ascii?Q?Cs+R7LeH3K06pPF01xI7CHkvDTaxAibXrxXmxN+Ik0iCcHcvSNiID/t4AnbW?=
 =?us-ascii?Q?pzvYyWgeEGCPiaE81wHiumSs7JtthBLXsoANzv9jI74IUzczropaA3lbEjKT?=
 =?us-ascii?Q?FfY0PXAyOio+nEy/Q7SZRNtL8fEVWl2A1RWN8USc1VSE57KrMNAicNVh4JDI?=
 =?us-ascii?Q?xiK/W51VFwDrM5AUjCNpHYMNUD8UywGsLPmWNcTx5J835wKftwiDyuf+HB/A?=
 =?us-ascii?Q?vnO11Wz5DA8GR7eP0mzqqr6slgKWD0vR39uX6zyI4yrixM+20ar9HXticCJR?=
 =?us-ascii?Q?Eps/QRVmjdBcC0TroQkoSWw0bLkwDMRtPqr5YxORLUGM5SNzrzHJqp4RRaOo?=
 =?us-ascii?Q?EYMeIrrUep/IsWCB3kuLtXj6WXv5ccaVHBnM58AdWRbVHKmBpKMPrLmBE9K2?=
 =?us-ascii?Q?SebZDRUXBuBKlSxyGT4CfQiE65NaOkjPu2xqXmIJsukc0JxD4+wI1r4nV3F7?=
 =?us-ascii?Q?K6x4MbOnqRhsfajZxOB9rjacBGYlMVhEjSnrnDB2Aulw3qyFqG1Wf0qRvcU3?=
 =?us-ascii?Q?u0p7tTD9aV6/Euvb1zdCN1WP/trvdjBtejlaESD50vuqXkRGc8U/j6eLjbum?=
 =?us-ascii?Q?p+f1M+UIAyByFgLc6OR9kMmNk1o5CA/TXMffWy4TkRkIQm/Azcsr48c65x7L?=
 =?us-ascii?Q?wTESSfEZX2k/hPfih/3nl482FtTDGRFYd/0lMKB40GgbjxS9Jkz2Y2uJmtYF?=
 =?us-ascii?Q?EcQI2iHMWubVFMM4Z8hWheV24j8qxSAJ9NoO6SOMOdEW+NB2zfxCooQN4sWM?=
 =?us-ascii?Q?FfrqHd7qazaanB5Qti7CCc7toSuaezGSXcE+R25TH5dZPk6CEPeD2voevZ1b?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29589cac-1612-45bd-f34f-08da9503693f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 21:11:51.0678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWXpSuqDX1pKlNYMmRNR0f0QAgKJREsWBAMxkk3K/KZUzk9UJ4eA/UJRqgB/wC3hgMGnMyd5J8jr7uMlzb6ze4al8mx0KhgeamN8RKC8TEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7131
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 10:12:57PM +0200, Andi Shyti wrote:
>Hi Lucas,
>
>On Mon, Sep 12, 2022 at 11:12:47AM -0700, Lucas De Marchi wrote:
>> On Mon, Sep 12, 2022 at 06:59:53PM +0200, Andi Shyti wrote:
>> > Hi Lucas,
>> >
>> > On Mon, Sep 12, 2022 at 09:19:38AM -0700, Lucas De Marchi wrote:
>> > > Support for reading the fuses to check what are the Link Copy engines
>> > > was added in commit ad5f74f34201 ("drm/i915/pvc: read fuses for link
>> > > copy engines"). However they were added unconditionally because the
>> > > FUSE3 register is present since graphics version 10.
>> > >
>> > > However the bitfield with meml3 fuses only exists since graphics version
>> > > 12. Moreover, Link Copy engines are currently only available in PVC.
>> > > Tying additional copy engines to the meml3 fuses is not correct for
>> > > other platforms.
>> > >
>> > > Make sure there is a check for  `12.60 <= ver < 12.70`. Later platforms
>> > > may extend this function later if it's needed to fuse off copy engines.
>> > >
>> > > Currently it's harmless as the Link Copy engines are still not exported:
>> > > info->engine_mask only has BCS0 set and the register is only read for
>> > > platforms that do have it.
>> > >
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > >
>> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> > > index 814f83b5fe59..1f7188129cd1 100644
>> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> > > @@ -764,6 +764,10 @@ static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
>> > >  	unsigned long meml3_mask;
>> > >  	unsigned long quad;
>> > >
>> > > +	if (!(GRAPHICS_VER_FULL(i915) >= IP_VER(12, 60) &&
>> > > +	      GRAPHICS_VER_FULL(i915) < IP_VER(12, 70)))
>> > > +		return;
>> > > +
>> >
>> > Isn't it easier if you wrote
>> >
>> > 	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 60) ||
>> > 	    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
>> > 		return;
>> >
>> > ?
>> >
>> > You save a parenthesis and a negation '!'.
>>
>> but that makes it wrong. I'd really want the range
>> 12.60 <= version < 12.70, so it applies to PVC  but is then disabled
>> again for MTL.
>
>But it's negated... so that if it's not in the range, it's
>outside of the range... right?
>
> NOT(12.60 <= ver < 12.70)   <--- you wrote
>
>is the same as:
>
> ver < 12.60 or ver >= 12.70 <--- I suggested
>
>and it would mean (just to see if I'm not getting confused by
>something and the negations do always confuse me):
>
>
>                 12.60          12.70
>        return     |              |     return
>  ver: ------------[--------------[---------------
>
>
>But it's the same, taht's why I r-b it anyway.

yeah, when I read your reply I missed the fact you changed the
comparisons <=, >

thanks
Lucas De Marchi
