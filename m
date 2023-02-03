Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB4F68A120
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5597D10E832;
	Fri,  3 Feb 2023 18:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B22F10E832;
 Fri,  3 Feb 2023 18:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675447458; x=1706983458;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IQcYa+XQiOKTI6NhMDA2P492Y12dWoEYHtZxn0aiAdI=;
 b=Uq1/i1+wLLQKg1CoheIR5nB0JcRkonXe1vfvD3yfUWsTUfsnV2J14sG5
 H56ma2YLCEwM/q48k1MMjBCOAskeglliw6EVxkZ+RUWGBhYUreGGm1TGX
 lu9zVUXoZITkOvkn1LfO3ZUxvCPgYJ/gKBvLQLS0B6ENv2sL75b6chx7C
 wcrhNV74v1OMF4EsG5hfCvF5fxd/+00qdiWVwTkLaRdDDUM/eiLL8Ue8x
 dCYYAp9n0HPZGP/JIzdAh5hIOEHQW8/e1RmEFg4UbWDe+Vhrf8PFa4sa0
 GYlLKPyX4gSS+gaO0UlGYt0duzVHLAdEL8HoKwy/MnOgxgkbFq2+momwe A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="356154365"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="356154365"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 10:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="911244278"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="911244278"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 03 Feb 2023 10:04:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 10:03:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 10:03:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 10:03:54 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 10:03:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvlWirnQbrNtk+6RkuctMDu9PFzV/STUoeeBM1poH6O7mnZIEBVjarhohNCHdXUMHe7t4tILmoXqx3kvDDlTalTIcobNemHcnykI0N9lythRWY6CASb7VDyBRQAONPepLTEthFat7f4hTAEbgse2RB4Zj/uvZo/d/sNa55NRn4feJXeQWxMQB51jSmzJj9rgiJy6vKwytqLl3Tb2Qe/y1HKB2OTmvHIyDmkBnCLHhD9b6XnNcFYZbXIajkZ9oYs8jEdarfi97sKWnJV2WX/zlcHs86KPZoDcsXJ00s1WkKPFxzMmtgDi7lhHIWFON4iyNrLeFyNCX7oOYqqDpJ16Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIDqSQEEw2vCbQWH9I8qXMZP48WuyEIBj2K4K8sM49A=;
 b=I/Vyx2rJCHD0y7VqwvUAbNmU//v+VTmJAt1M5qbngSdX3grm2EweiyI7IHkG5/F8E1pVqE0H3JgDhcdK5ab6ZVT1nFP9H3VCAkwCBRDOCq5t3CEFC1zJwwH+rnL3k/InIBNp2/14wv0x/xj0MRXOtCO5J0VsjVZjEeSOXiJOzLHNF663Tckb6jXhz3M+fyGxwd/E0Oiro5feGdFDYBf69n0y+5SX4Cgt+tOfv1lGfu88Redf+cjKR0QsJJnWistV1LDzsxDo+SN02t10B++hk9dY/iLHquaQOqnurvi2hM7KNgmfJlz0LXizGoCB1eR9cJd2OrUEwjemRd/aw3J9qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6607.namprd11.prod.outlook.com (2603:10b6:510:1b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Fri, 3 Feb
 2023 18:03:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%7]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 18:03:52 +0000
Date: Fri, 3 Feb 2023 10:03:49 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/i915: Fix GEN8_MISCCPCTL
Message-ID: <20230203180349.zseq4za55goqq4ih@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20230203005709.2612633-1-lucas.demarchi@intel.com>
 <Y9xfahu4Mf+fAank@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y9xfahu4Mf+fAank@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR06CA0045.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 0642ee22-8657-443a-d99f-08db061101dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jkH1sKwQzf3snpT5Z+dlHSdlw5iM6Ec/6fn2JpiglzVFax6e9yjR22umirJpEOSYcRXYOxqkU3sC+7/3LBF/xoZDu2xDlx9xlyQKQ6QLKNVkcKZ/ZmbcqeLBZJaP7IJ1b8Qpi/a2Tf6sUIdLRZHxt06ujF/vSBpvm1PXl8sH9PEermqz9UdlSQy23XDLO6nYKvwHhJOIeWBILu92p6BdTzrIQmG2ZEa9etZ1ngwy4NFH7VI64N/wNkrMxd6w0lFimrhd0yelHmJ9+lNIr0k5HanPTUAFC30Kjn6lHcjkcUX0iy40N3Ixq/bESNuXntOrveQtQnAcNwzDjTMG8EnKP48QA57H5grnqur3VC5uxG2LN5X2kPvbF7aFOvYqy+vUYmLkV44FlaNfQVp8UTZWxm9niuRz/IL8v0A7ooKw9/K4XPowv1wECmyKd6x+BZQVNSW2sysJU4Zbw9bIB2xGOwWYJ9JktRzILaTzmUMeZfIRtulHLNNiuMoiLaPXYmKFa1GlEnt+nsC4QGWP/gHJPqh3hGCInQMsEc9thS7AuLDtg+as6tP8wzZKapobCc5RoF9IVFbncvGLWFEi3LJPy/6Xd3+DAIaOGyfn3+X2xshyx1kbDVvioXX8iw+13WmJTNyPFZikRy42LnH/CL0JoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199018)(83380400001)(2906002)(6486002)(6512007)(186003)(26005)(33716001)(9686003)(6666004)(5660300002)(107886003)(1076003)(6862004)(6506007)(8936002)(38100700002)(41300700001)(54906003)(6636002)(316002)(478600001)(8676002)(66556008)(86362001)(450100002)(82960400001)(66946007)(4326008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O/FBc/3mlPJIFS9Qclg85kc10m0NYv8Us9m0n7FtbdvxkpriDChcm+f5ZSSc?=
 =?us-ascii?Q?DvVL984EhMqRFMKLgLaWVEyj0ugtM+4AqIG6gzJzYCMCNkxOVe60vCIuZDCS?=
 =?us-ascii?Q?Ol/IoRVfTiUburbhGd9srABhooQcCuDmoqsl/ix2pLkT+D9ldT2YN+7JPazL?=
 =?us-ascii?Q?oqJ+fHFTKoRnP7TLkn5n0xYJYsyZSArm005fj64Z6txNzZ4Sb3y3K19lWLjW?=
 =?us-ascii?Q?OzRI6zZ19JQPfb+l8YKVElh4Tn3LJecK8zEytQZQSUS2e9Wxqn2/mnXeEDaf?=
 =?us-ascii?Q?3uOCptnx6yPVlsmBLBQIqXG4pNeVQBGzJBx1HcfHYWAwb1NBHaLD+1r3Us00?=
 =?us-ascii?Q?cDl5p//wcqtLiQNKrv3HeV/FytlcwbX+iHHobmzkAbCgJf40mzk42gBFNEz4?=
 =?us-ascii?Q?tT5mXIOmSL2Jwe/gUDkbUXvPizfud9HKHLJ0Sef8UtUqDajpb3wctmIJwqQD?=
 =?us-ascii?Q?KqErZ49W4Ku4/D1VyAABwbnLUDPyefEPyXgBPlAalgKsyiuy95Ucdb1Ij45r?=
 =?us-ascii?Q?gsCR7ECRS4ukt35w14z+bWmv01vAa8NN8FtbsrLN7KANFHQIkbHmh5F49tTm?=
 =?us-ascii?Q?mIAHmZPvviODhq40COsgO9kueTdH2/W2n4L8CCJ/cayYclvf3YzccZtY6mQ3?=
 =?us-ascii?Q?HuPWfV7dspQ9UF8m2qcYjHVWzSROoxEpg4XItiZr03lyz04kwyNhUWlaz9c/?=
 =?us-ascii?Q?uwVMP+S+3NK1d4TQtgs4Pp/7nfNvTZ5LEClvHlsouRUgRiQnEbfHBuwK45Um?=
 =?us-ascii?Q?qOHn0t146aLxL7bE0ga1DFD8nvmiy1JGHI8o9Yjf00uysEtxC0VP6GITOVIF?=
 =?us-ascii?Q?2Qy25UUazbGOHBRTZUp8Ed1dBtu+6Syo/8pkh6rZe/TM9dqkHMt92jsVUhYf?=
 =?us-ascii?Q?dFkZpz4nNCgS6rl7FujsChU9fxPD83S1kk9xlT8M/k4HpMKdjlx8OYZIg8PR?=
 =?us-ascii?Q?q+RrADzLhIhF40nid/itAmIKkRbFZQk9iAUtOMDgQGhqE4HMv2pSOPpvz35k?=
 =?us-ascii?Q?ngxbgYtywsmGvLjp/sgxo6o3Rsgcqs7TANcKrYkQMLTtlGK+kn4p7VU6nVdx?=
 =?us-ascii?Q?E7JnRm5maB+Y/t2X1Q6Td/n8Yv0NbsvAoOXJUguz9XH1jbSj2IRD1+fss5jI?=
 =?us-ascii?Q?s/vHoHOWJeGlWgM/ALAB3u39ktgnzvpMpLwUe3mCDwxxOs1/RgPQ8riDO7We?=
 =?us-ascii?Q?3VCrH8jJAQP6XeSdmPiQ66kX+QBSWYQMPHNYSDP9yRuCHNHX/jOryTWCneQ0?=
 =?us-ascii?Q?NAr2SRPaG5so+98N6DPDkET+1YNO3QrCbdEX7Zq4OyU/1g0lPCtwWMUveW9y?=
 =?us-ascii?Q?vYFDiQkeULCHBZvXTjh15cJlX1UYB2ZeeRLHD6SFB0CXGm82+NIC6RFO+jt0?=
 =?us-ascii?Q?+xYW+BVRpJdUnsaLBdt2v2/xJDAEBr42L03o4pmOmC/N7SMBZkKRsKudh9EV?=
 =?us-ascii?Q?GAdJnNHwVUZAM5AaRbQ662I2B6CWwTuQoRFx4lsQMsmLJBq4pG+OLHtfhA7r?=
 =?us-ascii?Q?3+WUouaSV1+2agyKOhzgY+5pySJ35RQDl3i3+FHKBjnPzu/Dp7E4lsSPuAOo?=
 =?us-ascii?Q?bkVrtmxY+UO+61oCjKX8ir9OIK6eCIATG7SmXwBPScLBW8/BV1xsdtg5rHdz?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0642ee22-8657-443a-d99f-08db061101dd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 18:03:52.1240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6Zyt/de4wCziZaapLY+KkcldC3hxIJ1QU66kvWOu10lUp8kc6JGQ15uKFPWCQx4RHbVkfLYb2dB8hQ38JrmAVbQd+w66oqM4ZfbT6QoGak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6607
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-gfx@lists.freedesktop.org, Matt Atwood <matthew.s.atwood@intel.com>,
 dri-devel@lists.freedesktop.org, Gustavo Sousa <gustavo.sousa@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 02, 2023 at 05:12:10PM -0800, Matt Roper wrote:
>On Thu, Feb 02, 2023 at 04:57:08PM -0800, Lucas De Marchi wrote:
>> Register 0x9424 is not replicated on any platform, so it shouldn't be
>> declared with REG_MCR(). Declaring it with _MMIO() is basically
>> duplicate of the GEN7 version, so just remove the GEN8 and change all
>> the callers to use the right functions.
>
>According to an old copy of bspec page 13991, 0x9400-0x97FF was an MCR
>range on gen8 platforms.  Newer copies of that bspec page forgot to even
>include the register range table, so it's not obvious unless you dig
>through the history and look at a version from before Aug 2020.
>
>However bspec page 66673 indicates that this range went back to being a
>singleton range in gen9 (and the other forcewake pages for newer
>platforms indicate it stayed that way), so that means BDW and CHV are
>the _only_ platforms that should treat it as MCR.  Usage for other
>platforms should either add a new "GEN9" definition, or just go back to
>using the GEN7 definition.

sounds like more a spec mistake. This range was listed as
"slice common". I'm not sure we'd really have to set any steering for
specific slice. Another thing is that we didn't set any steering for a
long time in this register and it was working. Even now there is no
table for gen8/gen9 in drivers/gpu/drm/i915/gt/intel_gt_mcr.c, so any
call to intel_gt_mcr_* will simply fallback to "no steering required".

For me, any MCR_REG() should correspond to registers in these
tables.  I don't think there's much point in annotating the register as
MCR in its definition and then do nothing with it.  Btw, this is how I
started getting warning wrt this register: as you knowm, in xe driver
you added a warning for registers missing from the mcr tables,
which I think is indeed the right thing to do for the recent platforms.

For gen8, this change here should not change any behavior.  It
changes for gen11+ to the correct behavior. So I don't think we need to
care much about double checking if gen8 had a unique behavior no other
platforms have.  I think just amending the commit message with more
information like this would be ok. 

Lucas De Marchi

>
>
>Matt
>
>>
>> Also use intel_uncore_rmw() rather than a read + write where possible.
>>
>> Fixes: a9e69428b1b4 ("drm/i915: Define MCR registers explicitly")
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> Cc: Matt Atwood <matthew.s.atwood@intel.com>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  5 +----
>>  drivers/gpu/drm/i915/gt/intel_workarounds.c |  4 ++--
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c   |  5 ++---
>>  drivers/gpu/drm/i915/intel_pm.c             | 10 +++++-----
>>  4 files changed, 10 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> index 7fa18a3b3957..cc1539c7a6b6 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> @@ -686,10 +686,7 @@
>>  #define GEN6_RSTCTL				_MMIO(0x9420)
>>
>>  #define GEN7_MISCCPCTL				_MMIO(0x9424)
>> -#define   GEN7_DOP_CLOCK_GATE_ENABLE		(1 << 0)
>> -
>> -#define GEN8_MISCCPCTL				MCR_REG(0x9424)
>> -#define   GEN8_DOP_CLOCK_GATE_ENABLE		REG_BIT(0)
>> +#define   GEN7_DOP_CLOCK_GATE_ENABLE		REG_BIT(0)
>>  #define   GEN12_DOP_CLOCK_GATE_RENDER_ENABLE	REG_BIT(1)
>>  #define   GEN8_DOP_CLOCK_GATE_CFCLK_ENABLE	(1 << 2)
>>  #define   GEN8_DOP_CLOCK_GATE_GUC_ENABLE	(1 << 4)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> index 29718d0595f4..cfc122c17e28 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> @@ -1645,7 +1645,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>>  	wa_mcr_write_or(wal, XEHP_SQCM, EN_32B_ACCESS);
>>
>>  	/* Wa_14015795083 */
>> -	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
>> +	wa_write_clr(wal, GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
>>
>>  	/* Wa_18018781329 */
>>  	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
>> @@ -1664,7 +1664,7 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>>  	pvc_init_mcr(gt, wal);
>>
>>  	/* Wa_14015795083 */
>> -	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
>> +	wa_write_clr(wal, GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
>>
>>  	/* Wa_18018781329 */
>>  	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> index 3d2249bda368..69133420c78b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> @@ -39,9 +39,8 @@ static void guc_prepare_xfer(struct intel_gt *gt)
>>
>>  	if (GRAPHICS_VER(uncore->i915) == 9) {
>>  		/* DOP Clock Gating Enable for GuC clocks */
>> -		intel_gt_mcr_multicast_write(gt, GEN8_MISCCPCTL,
>> -					     GEN8_DOP_CLOCK_GATE_GUC_ENABLE |
>> -					     intel_gt_mcr_read_any(gt, GEN8_MISCCPCTL));
>> +		intel_uncore_rmw(uncore, GEN7_MISCCPCTL, 0,
>> +				 GEN8_DOP_CLOCK_GATE_GUC_ENABLE);
>>
>>  		/* allows for 5us (in 10ns units) before GT can go to RC6 */
>>  		intel_uncore_write(uncore, GUC_ARAT_C6DIS, 0x1FF);
>> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
>> index e0364c4141b8..798607959458 100644
>> --- a/drivers/gpu/drm/i915/intel_pm.c
>> +++ b/drivers/gpu/drm/i915/intel_pm.c
>> @@ -4300,8 +4300,8 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
>>  	u32 val;
>>
>>  	/* WaTempDisableDOPClkGating:bdw */
>> -	misccpctl = intel_gt_mcr_multicast_rmw(to_gt(dev_priv), GEN8_MISCCPCTL,
>> -					       GEN8_DOP_CLOCK_GATE_ENABLE, 0);
>> +	misccpctl = intel_uncore_rmw(&dev_priv->uncore, GEN7_MISCCPCTL,
>> +				     GEN7_DOP_CLOCK_GATE_ENABLE, 0);
>>
>>  	val = intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_L3SQCREG1);
>>  	val &= ~L3_PRIO_CREDITS_MASK;
>> @@ -4315,7 +4315,7 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
>>  	 */
>>  	intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_L3SQCREG1);
>>  	udelay(1);
>> -	intel_gt_mcr_multicast_write(to_gt(dev_priv), GEN8_MISCCPCTL, misccpctl);
>> +	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, misccpctl);
>>  }
>>
>>  static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
>> @@ -4453,8 +4453,8 @@ static void skl_init_clock_gating(struct drm_i915_private *dev_priv)
>>  	gen9_init_clock_gating(dev_priv);
>>
>>  	/* WaDisableDopClockGating:skl */
>> -	intel_gt_mcr_multicast_rmw(to_gt(dev_priv), GEN8_MISCCPCTL,
>> -				   GEN8_DOP_CLOCK_GATE_ENABLE, 0);
>> +	intel_uncore_rmw(&dev_priv->uncore, GEN7_MISCCPCTL,
>> +			 GEN7_DOP_CLOCK_GATE_ENABLE, 0);
>>
>>  	/* WAC6entrylatency:skl */
>>  	intel_uncore_rmw(&dev_priv->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
