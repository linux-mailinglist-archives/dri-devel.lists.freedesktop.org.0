Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036C17AE4B7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 06:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3A410E0A5;
	Tue, 26 Sep 2023 04:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0316110E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 04:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695703837; x=1727239837;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=9IgugYqFNYngyEpAy+Rk3tQSaRpRCV2TJZjQW2LmOiA=;
 b=l5+t0Sz5/Ga3OgUkS95NQb32QP2BBVo80NSe3eMZZDO6KLsljgdOac2s
 BIbJrLQZ1gFkxFau+7RgDCTlqkavi1NSzGN6aWW8VUFNLZ2IuW7/9qE5H
 4+pK7wDmthQQmxkEf3N8EeWrm7RbZOrVMV5soVdOr8N4dHUB2HVF8kymN
 VFwPaqVnDlzIorNcBeoZ90aQHOXGxrcxvA0DqVKOcOdV7MUf0SNmi7DQB
 kcNkYB2UBgViD+QNcx/JgGyh+yZGc5zxLDtGzYyzjjkoadfxaUrR06A9/
 8XwNsml0jsyIpnRpRPBYC/lcgYy1SutSe1FcaevLPzISTLliX5rypOr/W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371816384"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="371816384"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 21:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995676710"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="995676710"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 21:50:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 21:50:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 21:50:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 21:50:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eyl+4FRoMG+nKXrPV0JI7bJ7sn6AGZi7AdIOsw5JPFSjMnC81fufkUja8hoMa9GkBilpyZhOaDGlVmot1jImXB7wD4NN+d/l5DgyG0GIuFQZ13gttS2zPJ5uywlxB3lm6iaUyi7tgV4szsuUYt2m5CuIATzB2j+dYjaAiFfnbp9El9F6JO65BT1+OLUj+kxUpFmmJUPqB8p74ti41tvxTV+ga9HQJWZxPMCko+dp8JdwNBMMVtLRgZdX94IdjzNzXNTgUnVq/L5xZiDLU22783jB+FU9Bh2yNiYxlbnlWBYH4Hs+mObtwzwcpXaDMYAZO56nRAbNwAqVQ44evEPH+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVCFgTkwt20JWARzFInpRpzoikEe0yrbrmir+sinYtM=;
 b=k2TZupueGhByiPxiS0qopttvtigSR/qYAqx8L9VFO8WTZVN7BoUlcZxfPcVW8sdqnAOYA7CxevwrxE2CUpNELNo3q5u793rk/HQr3w6Y145yPNEj53W8jUsy9fx9oWIi8GPCjGmpWPeHLyCpsvgwpl/Vw3TOhlrGxBJvw7OqQxvR8h7viMIS61blLX3dD9tujghWnQB+8k6JmmyhywpAHV6mdCTQQVq/8vCsxuq6ub9pzsNxDUVtvnxPUEbbkcoPujQFQJ9PFOFCsDfyzrzdtYsOZzqV2HMQhHpr26iq9OU/VSna63vfLrena7mBlP4Zl0pFts8FSWqmmXfDw2Wfgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CH0PR11MB8191.namprd11.prod.outlook.com (2603:10b6:610:181::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Tue, 26 Sep
 2023 04:50:27 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 04:50:27 +0000
Date: Tue, 26 Sep 2023 12:50:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v17 10/18] drm/shmem-helper: Use refcount_t for
 vmap_use_count
Message-ID: <202309261238.bce3ce91-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230914232721.408581-11-dmitry.osipenko@collabora.com>
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CH0PR11MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: 152b573b-1828-4acf-8170-08dbbe4c1a1f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wnjT/4QhlQoeTdfrAJ+RVKRBW/ocktACp8SlB2DAXDyI1Fbfy6AjopQrfEcw2Krt2fegvyJbDGMsxWUDL+UYjZg7Lt/xPkpzLNsUrHUiuWaLnAfSyqwhKq3Im2iqHR+DnAaEpv3+cahLfVcAYYeImbPQI+ocjtZIOV/fIYMuoa1aPqX7H2VMa6YvBNr1vupqBUv5NlmTa8ckRfR6uvfVILEqnN9wGj/giXrW1AztBm3rFhC+aHfMkU2V4o9tjbPHH4nrmAk9dce9jcMdr0n09npzJ+tacwWMMrtC7KUsxpQjyGEm5OLBAGfkfZW2vnEPW05MdasBqi7hZS1Xz6t81vqEdw1W1yB099OQIwGM5V2ATGvE/5Z8aO7sA/D5AWjqd/puhHKEuG2v9wARltk9buahQHMysfc2MfVLDGLQpRVbAgU2CEhPxYFej198me77e6V/91mmByfxBsbOBBkdP7yPVOxxG4Ae2VcfSn+9NwvH6c/sU7As8yc13D/Bw26AdstcM2Vg7skw1PiWV5hbiYUw5E8oklgOE3q1PgTANCD20rxS1OTFlcnmTkcPpJiGQZ3JWckZFGdw/Tp/66UMEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6779.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(230922051799003)(451199024)(186009)(1800799009)(82960400001)(38100700002)(36756003)(86362001)(2906002)(6666004)(45080400002)(66946007)(54906003)(6916009)(41300700001)(6512007)(66556008)(4326008)(2616005)(6486002)(478600001)(66476007)(8676002)(8936002)(7416002)(5660300002)(316002)(6506007)(83380400001)(1076003)(26005)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NNoAKGxnUcM+pZ51HATOkdGOOksGvkat6gv/Z6sDF6iRUtP0fyVA6S1zai3L?=
 =?us-ascii?Q?C0xC3giahAN883dncW18HFXTQ8sfziCGqNwVmda2pVu3qXOe6rdBpzciSN4a?=
 =?us-ascii?Q?/8sdftdPMNN1ZGrinzKFAGXC/HKIwWLmgubzH+ANYU06zhN4Nw0deqwgG4Du?=
 =?us-ascii?Q?Pml1V3Yp3ml9SRcSERSaf5cUYolCojmAqIVFNpmpwspEp0kIyvFlwf4P3VFo?=
 =?us-ascii?Q?TYWe9deOs151fUbnBnz0d+FUmAXfBsk1KQoc1r/fmhcnLwbBp7zfKOz9XBNY?=
 =?us-ascii?Q?1n/DH2Iuf3tDTVNZlqZHpIuHYN+Tm4j69nQkNl43ODA+DGACEbdhCyY+6/an?=
 =?us-ascii?Q?SHWzt6Rjey8efSoq31gXEUFCoq+CRoUjMiqKtKhVq6jk4pkjPRfEELRCoY6T?=
 =?us-ascii?Q?bcvPhPlQpb3+o2ZYRF+DHtG18qCfWE0ZnlXV3WPy7bjSCT2R+gsJL6FtVBGn?=
 =?us-ascii?Q?esKJwbrEo3SKe7jpcgPY4kw/k+0/hUvxETo8RgH/peUjeYHECyl0dLhzQrB9?=
 =?us-ascii?Q?Eh6nwuTBpGI3tH9dwjSrucF8z1JWO8x1vBMfGBrw6dfqaOHvujcyxGteYanP?=
 =?us-ascii?Q?JMjUyj0LdTgq/DOVYRE5GJRHqpoICQSFFAQ1xWx7gMcybsYws/Z2whHRxNL+?=
 =?us-ascii?Q?S73vvKObgycPS51wrbwkfyrzWNtBcZ9Owjix/gG2yZCUoLIVUg9mr4oypFvx?=
 =?us-ascii?Q?XYdKGHHnYGdN+LnBF4JPkt5mv3sVEx0S4Id1B+77BJh/0SqTl9uu/6CxtFiR?=
 =?us-ascii?Q?HQOQ8Qvw/E/nc+DOplh8wFxkH0lmvtGV3/R6S+hwzVMZNGJc+WkGFL4J8yoI?=
 =?us-ascii?Q?JHs/scynS5zz2tS1Jc7ulShPFe9tj/j8GyVEfTQC2ga7CQb7UtvZl2EZcCxF?=
 =?us-ascii?Q?Q0BQyXZQCmjwzDD4zg9W/8FklaDBrpZ7zKaAVkQNVq2lnl67DhppK7XGaJSd?=
 =?us-ascii?Q?B0y1f0LDYvdUIs7w5i5c966wjbaF5GkBQiMsJwfy3zpaazLEzPRtCw4cr/Um?=
 =?us-ascii?Q?NdcGDyctm0X1IpJFwx0HpcOu0nLd2256baRevm7gZMCZu1sAlMwiovHJGGfv?=
 =?us-ascii?Q?qOn1FU62rfFGMM1gGVkGjKFjSMC/RlvQV3gZCBx51C3ueSncctXNtDYFPh8G?=
 =?us-ascii?Q?HiWwWC/uPgmE4b6sBxb9BjWsdovQq/2FV9dQQlwKquoSntgevPXsDfts8SUD?=
 =?us-ascii?Q?0QD0sh7Fz8D1dKrRA8PSMSv43Chd52EfohH8tmVxSFyWzpBcB16ZyYvn4Rd+?=
 =?us-ascii?Q?mEw/BoIpykg9D506FJoY1dC+I6JX+7S1085KQ8e7hT5VZRBPFC7vq9umvmnk?=
 =?us-ascii?Q?mLvRedaULhvJwSa8chGA85ckDwStpE9ZM7LIQdUT44J8R67UrkHjTqtabw7h?=
 =?us-ascii?Q?PGl9zZkC6Gk7fCirei4Z+nVWZih+pgGcY+hKwCRcMeQGPEd30Mgw30MZ+JOD?=
 =?us-ascii?Q?xENV4ZLZ+HmDw36DPFSfH018ayZjV98BGKYSJ5JxJWuxhQtXTOi10xOK8+Z/?=
 =?us-ascii?Q?sFV/6ehPB0c9bJyCuq+F41OaFRw6y4fX9zRAWEM+pKsxrS4OERQSF74tvfN2?=
 =?us-ascii?Q?BXWAsDTVbTwdhkeyCu+2nzOmHAYfdHFLyiXq65krc3c5nrv1MR3FCb2Bbfoz?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 152b573b-1828-4acf-8170-08dbbe4c1a1f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 04:50:27.1920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4egwjEuvexDasy1CSWCEG4qU/A/nlu6lM33Su008HgCqLwDLOrJ9yMeeEXxPykX3BC3C0h1CQhdo6EIeHFE9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8191
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
Cc: Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, lkp@intel.com,
 Emma Anholt <emma@anholt.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan
 Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, oliver.sang@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>, oe-lkp@lists.linux.dev,
 Steven Price <steven.price@arm.com>, virtualization@lists.linux-foundation.org,
 Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Hello,

kernel test robot noticed "WARNING:at_drivers/gpu/drm/drm_fbdev_generic.c:#drm_fbdev_generic_helper_fb_dirty" on:

commit: e5f31d1a2da5d43187a0e1fc4d1882982ab0d9b8 ("[PATCH v17 10/18] drm/shmem-helper: Use refcount_t for vmap_use_count")
url: https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/drm-gem-Change-locked-unlocked-postfix-of-drm_gem_v-unmap-function-names/20230915-073105
base: git://anongit.freedesktop.org/drm/drm drm-next
patch link: https://lore.kernel.org/all/20230914232721.408581-11-dmitry.osipenko@collabora.com/
patch subject: [PATCH v17 10/18] drm/shmem-helper: Use refcount_t for vmap_use_count

in testcase: rcuscale
version: 
with following parameters:

	runtime: 300s
	scale_type: tasks



compiler: gcc-11
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202309261238.bce3ce91-oliver.sang@intel.com


[   23.102568][    T8] ------------[ cut here ]------------
[   23.102576][    T8] platform vkms: Damage blitter failed: ret=-12
[ 23.102605][ T8] WARNING: CPU: 0 PID: 8 at drivers/gpu/drm/drm_fbdev_generic.c:226 drm_fbdev_generic_helper_fb_dirty (drivers/gpu/drm/drm_fbdev_generic.c:226) 
[   23.102614][    T8] Modules linked in:
[   23.102619][    T8] CPU: 0 PID: 8 Comm: kworker/0:0 Tainted: G                 N 6.6.0-rc1-00010-ge5f31d1a2da5 #1 debbcfa26ac7594ab4e1fde44696b4efa3ea485a
[   23.102624][    T8] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   23.102627][    T8] Workqueue: events drm_fb_helper_damage_work
[ 23.102631][ T8] EIP: drm_fbdev_generic_helper_fb_dirty (drivers/gpu/drm/drm_fbdev_generic.c:226) 
[ 23.102633][ T8] Code: 05 a8 49 81 c2 01 8b 40 08 8b 58 2c 85 db 75 02 8b 18 89 55 e0 e8 90 7a 04 00 8b 55 e0 52 53 50 68 d4 41 28 c2 e8 74 68 a5 ff <0f> 0b 8b 55 e0 83 c4 10 e9 7b ff ff ff 8d 76 00 8b 45 e4 8b 55 e8
All code
========
   0:	05 a8 49 81 c2       	add    $0xc28149a8,%eax
   5:	01 8b 40 08 8b 58    	add    %ecx,0x588b0840(%rbx)
   b:	2c 85                	sub    $0x85,%al
   d:	db 75 02             	(bad)  0x2(%rbp)
  10:	8b 18                	mov    (%rax),%ebx
  12:	89 55 e0             	mov    %edx,-0x20(%rbp)
  15:	e8 90 7a 04 00       	call   0x47aaa
  1a:	8b 55 e0             	mov    -0x20(%rbp),%edx
  1d:	52                   	push   %rdx
  1e:	53                   	push   %rbx
  1f:	50                   	push   %rax
  20:	68 d4 41 28 c2       	push   $0xffffffffc22841d4
  25:	e8 74 68 a5 ff       	call   0xffffffffffa5689e
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	8b 55 e0             	mov    -0x20(%rbp),%edx
  2f:	83 c4 10             	add    $0x10,%esp
  32:	e9 7b ff ff ff       	jmp    0xffffffffffffffb2
  37:	8d 76 00             	lea    0x0(%rsi),%esi
  3a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  3d:	8b 55 e8             	mov    -0x18(%rbp),%edx

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	8b 55 e0             	mov    -0x20(%rbp),%edx
   5:	83 c4 10             	add    $0x10,%esp
   8:	e9 7b ff ff ff       	jmp    0xffffffffffffff88
   d:	8d 76 00             	lea    0x0(%rsi),%esi
  10:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  13:	8b 55 e8             	mov    -0x18(%rbp),%edx
[   23.102636][    T8] EAX: 00000000 EBX: ee027ab0 ECX: 00000000 EDX: 00000000
[   23.102638][    T8] ESI: c624b600 EDI: c624b738 EBP: c3585ef8 ESP: c3585ec4
[   23.102640][    T8] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
[   23.102647][    T8] CR0: 80050033 CR2: ffd3a000 CR3: 0295e000 CR4: 00040690
[   23.102649][    T8] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   23.102651][    T8] DR6: fffe0ff0 DR7: 00000400
[   23.102653][    T8] Call Trace:
[ 23.102656][ T8] ? show_regs (arch/x86/kernel/dumpstack.c:479 arch/x86/kernel/dumpstack.c:465) 
[ 23.102661][ T8] ? drm_fbdev_generic_helper_fb_dirty (drivers/gpu/drm/drm_fbdev_generic.c:226) 
[ 23.102664][ T8] ? __warn (kernel/panic.c:673) 
[ 23.102668][ T8] ? drm_fbdev_generic_helper_fb_dirty (drivers/gpu/drm/drm_fbdev_generic.c:226) 
[ 23.102670][ T8] ? report_bug (lib/bug.c:201 lib/bug.c:219) 
[ 23.102677][ T8] ? exc_overflow (arch/x86/kernel/traps.c:250) 
[ 23.102681][ T8] ? handle_bug (arch/x86/kernel/traps.c:216) 
[ 23.102685][ T8] ? exc_invalid_op (arch/x86/kernel/traps.c:258 (discriminator 1)) 
[ 23.102689][ T8] ? handle_exception (arch/x86/entry/entry_32.S:1056) 
[ 23.102701][ T8] ? exc_overflow (arch/x86/kernel/traps.c:250) 
[ 23.102704][ T8] ? drm_fbdev_generic_helper_fb_dirty (drivers/gpu/drm/drm_fbdev_generic.c:226) 
[ 23.102708][ T8] ? exc_overflow (arch/x86/kernel/traps.c:250) 
[ 23.102710][ T8] ? drm_fbdev_generic_helper_fb_dirty (drivers/gpu/drm/drm_fbdev_generic.c:226) 
[ 23.102715][ T8] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:63) 
[ 23.102720][ T8] drm_fb_helper_damage_work (drivers/gpu/drm/drm_fb_helper.c:391 drivers/gpu/drm/drm_fb_helper.c:413) 
[ 23.102723][ T8] process_one_work (kernel/workqueue.c:2635) 
[ 23.102731][ T8] worker_thread (kernel/workqueue.c:2697 kernel/workqueue.c:2784) 
[ 23.102736][ T8] kthread (kernel/kthread.c:388) 
[ 23.102740][ T8] ? process_one_work (kernel/workqueue.c:2730) 
[ 23.102743][ T8] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 23.102747][ T8] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 23.102750][ T8] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 23.102754][ T8] ret_from_fork_asm (arch/x86/entry/entry_32.S:741) 
[ 23.102757][ T8] entry_INT80_32 (arch/x86/entry/entry_32.S:947) 
[   23.102765][    T8] irq event stamp: 249311
[ 23.102767][ T8] hardirqs last enabled at (249317): vprintk_emit (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:77 arch/x86/include/asm/irqflags.h:135 kernel/printk/printk.c:1961 kernel/printk/printk.c:2306) 
[ 23.102772][ T8] hardirqs last disabled at (249322): vprintk_emit (kernel/printk/printk.c:1940 kernel/printk/printk.c:2306) 
[ 23.102775][ T8] softirqs last enabled at (235498): __do_softirq (arch/x86/include/asm/preempt.h:27 kernel/softirq.c:400 kernel/softirq.c:582) 
[ 23.102778][ T8] softirqs last disabled at (235491): do_softirq_own_stack (arch/x86/kernel/irq_32.c:57 arch/x86/kernel/irq_32.c:147) 
[   23.102781][    T8] ---[ end trace 0000000000000000 ]---
[   23.104064][    T1] Console: switching to colour frame buffer device 128x48
[   23.189012][    T1] platform vkms: [drm] fb0: vkmsdrmfb frame buffer device



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230926/202309261238.bce3ce91-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

