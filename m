Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B675F9A1C9A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 10:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD9B10E7C4;
	Thu, 17 Oct 2024 08:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJX1N4gx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60AC10E7BF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 08:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729152595; x=1760688595;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=5f+B7n9rHcXaQg4r0InWGZ9OkrEwwm9Zy5RP5BdjOCw=;
 b=OJX1N4gxv/v76ixKjTqUCEkyxW2sYIf0UNy24TMi1H+50VltnO8pVS4M
 uflsCwN4Jt1ylF89Gw8bKhSEoy/yikWaAbZN/qopL0W0wGNbS3YaNr7ed
 Wu2KOfBgECt6ZAq5PTA2SSSdCIu+SEa+0jqZUqjZFQ6qYWCa4rZ+PYoCl
 s/VAYk739uYu5UrquLJ/n8+3/nuO+jyd/81gvZ1PCFooh67Q70MB84xg5
 DyaXXFIy6CZEUFOWaCywGar11kBzNhw7noSMq2vcnNSmJvGDvEqwy0bHd
 jf/eQLniqgeVndxRgIk16knieAgrXuDkgdmuFvcAo04/eqnOHkfmTFbzh Q==;
X-CSE-ConnectionGUID: kDvtY2tmRkKuZPBnI5yOoQ==
X-CSE-MsgGUID: M+LkXnyzTbiCHnRURa9CGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28719537"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="28719537"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 01:09:55 -0700
X-CSE-ConnectionGUID: zo6it5+fTemSqlyRAZTYWg==
X-CSE-MsgGUID: VAt3yBd4TNSfUyyzhl5yUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78634726"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 01:09:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 01:09:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 01:09:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 01:09:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVNwvtMM+lEZI7FquRsYBzwEusXZzu2Qgmoo8PSpdQlq/yvKIh+4zLjMkRBQf9z5JXAaRe0yRKwS559Ze655f0Y9i/m/N1lgV93EXhPSml+b8Wb/efXL50YHRYLB8UXER0sAGRXYq10aCmXVHvxdpx0eUj5PnKjsPPOxKW+oHHwRvYestF+Mn2tT2g1L0xbH8XfjHTuqaqBnzQc4aawAgV9KyWfV7gdcaXdhxXME2h61i/prcCAB1DxOvQsqr+pYJXrze6AFUnsZYwTyX5upLbT1S+OTX/N29mwVnviE1AaoiH2fKZcZxjY6xrQvhD9H1DOZ0qQb4PRtCmTPO62HgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+TRlnlUdEE9gwOnuEL8XhTnH9TfhmH6PA33hZw77YU=;
 b=QYxfcJv62up2mu9s2mviDn4DwBDrgjaHq3PyNHNbzM8RBQSpCui1+9WANqxH2XYw8PXQ51ldNzQmIgEW9A/cC8mQsq6FKZmHJZPfrFkxnPSX5LuwKwA4bipXIPqAfTwfSPNx2oChwF3C2QoRvVHCPjaMvOMHagHQvSMrf7pEVaCWklGCeVfyiCrij1PAc/E+XFGJBE3YoM645u+E+LOP3HcFEfWvnHFcY8MzllJLgAvZTNqRbnuJUiQKc72w9BdDOxTVVTMwvAA1NP3uDMgHAZ2BHFv0ZM9JYp+656rn9FiVxLmGRgEIqtj3FfRkKDHvFkuAbGleKRV2dSnn9Wv9vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN6PR11MB8194.namprd11.prod.outlook.com (2603:10b6:208:477::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Thu, 17 Oct
 2024 08:09:52 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8069.018; Thu, 17 Oct 2024
 08:09:52 +0000
Date: Thu, 17 Oct 2024 16:09:42 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Maxime Ripard
 <mripard@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <oliver.sang@intel.com>
Subject: [linux-next:master] [drm/tests]  d219425604:
 WARNING:at_drivers/gpu/drm/drm_framebuffer.c:#drm_framebuffer_free[drm]
Message-ID: <202410171515.c79582d2-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU1PR03CA0028.apcprd03.prod.outlook.com
 (2603:1096:802:19::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN6PR11MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd8d1c0-6dda-4c36-fa6a-08dcee8313a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HzWhsGQi/zXJ+83z2qme4IFnNUO19rk6OD5zcxHLdkg78ExJnKSg/s9rDD1U?=
 =?us-ascii?Q?QG9i9f8Z7X2kFvn81jVUne2t+hmCTNrG9RHpz0mAAEuz0+jDNmXXGlbj4aYf?=
 =?us-ascii?Q?iPs2SjKzl2saMpxnIPrD5XSzj9dbtBpSMvEBa7mjZFISZeujzLPyJZzIkLAi?=
 =?us-ascii?Q?q5X/5duNP2fzT0alNRAPCCB9EvMZ6MWcVl4lrFzCL9GPyYMbtw71bzLn1E5I?=
 =?us-ascii?Q?dEFwRYbGITOWrB7CnnMjqdeN3sS2OVneMqju0ezSNx8z+cI/imqILSg7tV1U?=
 =?us-ascii?Q?4/NfBmUA/wS1Di6IHJ09hN+QjfmurKS3iK/o9wnOsxnT7iY1C9f8bx57kop3?=
 =?us-ascii?Q?081dybBI/keBL8Azwj6AaQC0XN55FoYoU8e5ZFcTrxELBiv5l5I3PHLSJUm4?=
 =?us-ascii?Q?z3eCo2+C/b1SJ/q1VuZBjb1hqeo3gcqGe27f2BRmOKmN9KVtECtfKv4+x/CF?=
 =?us-ascii?Q?7sLdhxx9SIdnbSOHZThrajFHrFlC+/lNWsIRoUQEZtciZ+6HMEm48NEHnY0v?=
 =?us-ascii?Q?VgvZaO9+sRteiVDrNtGn/5XAMSPhz7+NdSmqrHbCQLzA0g9Wjt1vtbudjiv5?=
 =?us-ascii?Q?MMSkCODIGc7G7b3kALEoNA9QQCDM5NS5zt1yptif66y2VBn2fvDLdrZX6rrW?=
 =?us-ascii?Q?7ADMhQVzelnpS693NSvWsy8k7lItGGtqpET5KMzUSOGKmlAaSH8oGUd7tVYA?=
 =?us-ascii?Q?RDET85rj4ZEGSWkDy4chglTO7UaeYzDzhaNfuifsvNMgfrcUG3CTcAKAIlPK?=
 =?us-ascii?Q?oEJZwlSRV2+wgq2FIO0SeaaLIskoH4s3k24Yla9e0GHMxE9fOnJ58dTnKAoN?=
 =?us-ascii?Q?ySvLgxtQvKmw1sgxbuJWHhGxsLv6TvuHzF4aSVFiPvBgBtx9VxXdG9Az7wHA?=
 =?us-ascii?Q?m4sGZN+FELyjsj9i75SUuIPISlomfJ2MTnJBzoTeapTXE2Xk0jSIkLp3lXc2?=
 =?us-ascii?Q?eh+NjudL63Qo73KPN0ebUdS0T02Es8RN5jq6q6gOkAS6/qhbBr4hG6/8LVIZ?=
 =?us-ascii?Q?njB+4OQ8Si9BuhgG2MBVlYqFapZBYn7aTb9qP9P0AYFJmZ4xYG1BZten4ixX?=
 =?us-ascii?Q?eMiMlZZeoZPmRH1XNLOm8UXboev1Aizl5fkuZUMbs1ItcfUNaB9j4N7lbO5G?=
 =?us-ascii?Q?U9ydEUSp1quaOdJcIwu6AjvHdXP6LPDB94GfxG/4ZHU74Sr6sQz2NoQYXd2n?=
 =?us-ascii?Q?/3XctYablZ0bqEeuDiNU30QL5oTT2iKSvPHh9B1JNHrMA+jCvVB6GiUj7M3P?=
 =?us-ascii?Q?4LZL4VsEctRwrUxiq9zhyKktjrSXWZxTSduhO5bGzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DhNuqBB1BvUABs7sA0vD+jCQp4gZzIUyfh0uP64cwADGUJfb2FCoCGEcuikz?=
 =?us-ascii?Q?BYffV4DF1XumwWPExieekLwjKyOVNPw5q+naGQLAJBV4ywIvOvRQiWyTYjRm?=
 =?us-ascii?Q?EAkbfIhOzjeSHMwOrVqOncvGrviyz+qRLDQolmUtorvulhgOzZEuuC72xsx2?=
 =?us-ascii?Q?DWJW2v4rGPqhEXY5chLp+b0P9aOu4Yt5+5Ka9nY8/R6S8k6Ewq5EzSpvYAR1?=
 =?us-ascii?Q?IZSGlfPwF8YH+SDGHAfWX89CWPb3aaQPFE8/exw7s9KmVTIbvQbJN4MrEbGk?=
 =?us-ascii?Q?HInBVfdnldPg8pvXfDcGpwtXhNhvs/LspYWqx38d+i1r+nzdTSyuG/JrWADt?=
 =?us-ascii?Q?fJaTaWkCoaevrBOh/ws6vtiECZh7hYk1jyE17CLTMRxDXBTo8cFvqxVzSfpQ?=
 =?us-ascii?Q?iDjAWx89KUPqPprWpsPlYBlUyZx9YAH1uIE12QTjljFRaHOh5UJS5NFV3nCi?=
 =?us-ascii?Q?S2h3QePG4KGNB9C2O/CMb+xKBbvM8/6yLu9u9T5SCRM9UGh3WLaBIz8abc93?=
 =?us-ascii?Q?A424ahNYR1Zevq0+P4ZN7NjFknvv3az4n/NzstCFS3IpJhDWRbTxIarlebDk?=
 =?us-ascii?Q?YjO9LqzXq2VYsRMWawAG/AryvDnonPM7IyLFoTJgJNY9GcT92jEq244+68gg?=
 =?us-ascii?Q?FFwnFR9f0tcokveOK4C9rRlIsWytOkKciecDbNK8rUJrTC5zTTsQT70AmZd3?=
 =?us-ascii?Q?yfmMc89ipP6DcWr8ZgZZjLXlCFaFweYnXOiPVYIIcx6qzRPFW8921MiHL5Vq?=
 =?us-ascii?Q?0Tq6YMA/9ugExnVQ/tHpusKjn/yHLhq9k7FtFpne4YD51WU1ellKsiHuwWxx?=
 =?us-ascii?Q?Bf9sgux5SH/ECDDaTsVfJkUfKvM0+IZNTxhKd2a27uQsV0IvfBujfAJPztEc?=
 =?us-ascii?Q?Rifa5Q+2xNjpRiO7JI9On6+kH0US5cfBmgWefRtamO1TOBpSzxEX+8EKQ7tk?=
 =?us-ascii?Q?pfncIgfh/Ea5Vq+f+I6Uc+uOTNa2q2hCqA0OdihT/ofy8SeXm4axcq0fLiDD?=
 =?us-ascii?Q?2Tm8fsvjazNTXkjZ0PvvObdl4YIGTKgoNBeu0UkyTOHVVw9O/6NdoKQGy79P?=
 =?us-ascii?Q?JkHteTzpwuSqqbJ7As/FlELU+dlMEDFBPg3ET4WE/H/anfVPNzCoxe0CfbPS?=
 =?us-ascii?Q?OYMC/VCuaGFyNT6z3Vop+D/WTLTzM05uTswmxIMLbESK+PU0+zhbon0grDZB?=
 =?us-ascii?Q?Pj+mIC7GjY8wPdrBI7PNNvkiAsCQ8qTvAeZXJgCUjRg0MuXeU+4oRFiKQqGL?=
 =?us-ascii?Q?BaAJIuVkIsGaK0/fFnttsGvxg4wDl8eI7ZOyAHffhGtgcZ3Q8Qe7yFsOBGcE?=
 =?us-ascii?Q?cHAkwg5YOOH8K0IH4rNY++685T1yoRPhCpp2x2Waq4KSmWPfymxTPgvyooms?=
 =?us-ascii?Q?soCVX8rUQ4RzMjXcaub4qfLhf7Bd8i6yutoDLul91+y5joS+23IY9gekz0xn?=
 =?us-ascii?Q?GSPTms6PYr8rix6GTRGo4HOPICGUXyxFoHcbQJkVZsJzIDc9hxjEjmr7/HKH?=
 =?us-ascii?Q?WVTK5c+AuQ5DPbtp6WwxqOGvaPeTDOaJQ/LufsAM64xMv70lFZLFkkox1gsj?=
 =?us-ascii?Q?i3TYZyUkUdO3dOIoi835izg9X4hZ2Szrcs+18aiNTGu7kBJEJ0BtYUjbuoki?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd8d1c0-6dda-4c36-fa6a-08dcee8313a9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 08:09:52.0693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRogCP0GFuzNb1B+E09l1Hkdo8bAuVtldAoUlPgLfDifoeyietvmVUXlMLibxmxX2KuiTUYngtVCkXHY39t4Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8194
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



Hello,

kernel test robot noticed "WARNING:at_drivers/gpu/drm/drm_framebuffer.c:#drm_framebuffer_free[drm]" on:

commit: d2194256049910d286cd6c308c2689df521d8842 ("drm/tests: Add test for drm_framebuffer_free()")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 15e7d45e786a62a211dd0098fee7c57f84f8c681]

in testcase: kunit
version: 
with following parameters:

	group: group-00



config: x86_64-rhel-8.3-kunit
compiler: gcc-12
test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410171515.c79582d2-oliver.sang@intel.com


kern  :warn  : [  111.096210] ------------[ cut here ]------------
kern  :warn  : [  111.096421] drm-kunit-mock-device drm_test_framebuffer_free.drm-kunit-mock-device: [drm] drm_WARN_ON(!list_empty(&fb->filp_head))
kern :warn : [  111.096523] WARNING: CPU: 1 PID: 4862 at drivers/gpu/drm/drm_framebuffer.c:832 drm_framebuffer_free (drivers/gpu/drm/drm_framebuffer.c:832) drm
kern  :warn  : [  111.097075] Modules linked in: drm_framebuffer_test drm_kunit_helpers linear_ranges btrfs intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp blake2b_generic xor kvm_intel raid6_pq libcrc32c kvm crct10dif_pclmul crc32_generic crc32_pclmul crc32c_intel ghash_clmulni_intel sd_mod sg sha512_ssse3 rapl i915 intel_cstate ipmi_devintf ipmi_msghandler ahci libahci intel_uncore ttm intel_gtt libata mei_me drm_display_helper drm_kms_helper mei drm_buddy video wmi drm fuse ip_tables [last unloaded: drm_format_test]
kern  :warn  : [  111.098045] CPU: 1 UID: 0 PID: 4862 Comm: kunit_try_catch Tainted: G S  B            N 6.11.0-rc7-01411-gd21942560499 #1
kern  :warn  : [  111.098262] Tainted: [S]=CPU_OUT_OF_SPEC, [B]=BAD_PAGE, [N]=TEST
kern  :warn  : [  111.098389] Hardware name: Hewlett-Packard p6-1451cx/2ADA, BIOS 8.15 02/05/2013
kern :warn : [  111.098555] RIP: 0010:drm_framebuffer_free (drivers/gpu/drm/drm_framebuffer.c:832) drm
kern :warn : [ 111.098795] Code: 8b 74 24 50 4d 85 f6 74 28 4c 89 e7 e8 af a2 96 c2 48 c7 c1 e0 d8 3e c0 4c 89 f2 48 c7 c7 40 d9 3e c0 48 89 c6 e8 66 ca eb c0 <0f> 0b e9 2e ff ff ff 48 b8 00 00 00 00 00 fc ff df 4c 89 e2 48 c1
All code
========
   0:	8b 74 24 50          	mov    0x50(%rsp),%esi
   4:	4d 85 f6             	test   %r14,%r14
   7:	74 28                	je     0x31
   9:	4c 89 e7             	mov    %r12,%rdi
   c:	e8 af a2 96 c2       	call   0xffffffffc296a2c0
  11:	48 c7 c1 e0 d8 3e c0 	mov    $0xffffffffc03ed8e0,%rcx
  18:	4c 89 f2             	mov    %r14,%rdx
  1b:	48 c7 c7 40 d9 3e c0 	mov    $0xffffffffc03ed940,%rdi
  22:	48 89 c6             	mov    %rax,%rsi
  25:	e8 66 ca eb c0       	call   0xffffffffc0ebca90
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	e9 2e ff ff ff       	jmp    0xffffffffffffff5f
  31:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  38:	fc ff df 
  3b:	4c 89 e2             	mov    %r12,%rdx
  3e:	48                   	rex.W
  3f:	c1                   	.byte 0xc1

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	e9 2e ff ff ff       	jmp    0xffffffffffffff35
   7:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
   e:	fc ff df 
  11:	4c 89 e2             	mov    %r12,%rdx
  14:	48                   	rex.W
  15:	c1                   	.byte 0xc1
kern  :warn  : [  111.099136] RSP: 0018:ffffc90000b8fc08 EFLAGS: 00010286
kern  :warn  : [  111.099253] RAX: 0000000000000000 RBX: ffffc90000b8fcc8 RCX: 0000000000000027
kern  :warn  : [  111.099400] RDX: 0000000000000027 RSI: 0000000000000004 RDI: ffff8881c0eb0b08
kern  :warn  : [  111.099560] RBP: ffffc90000b8fca0 R08: 0000000000000001 R09: ffffed10381d6161
kern  :warn  : [  111.099707] R10: ffff8881c0eb0b0b R11: 0000000000000001 R12: ffff888122f04000
kern  :warn  : [  111.099852] R13: ffff88821e36b000 R14: ffff888130ed8e80 R15: ffffc90000a1f920
kern  :warn  : [  111.099996] FS:  0000000000000000(0000) GS:ffff8881c0e80000(0000) knlGS:0000000000000000
kern  :warn  : [  111.100158] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kern  :warn  : [  111.100280] CR2: 00000000f7203009 CR3: 00000001047ee005 CR4: 00000000001706f0
kern  :warn  : [  111.100426] DR0: ffffffff874243e0 DR1: ffffffff874243e1 DR2: ffffffff874243e3
kern  :warn  : [  111.100581] DR3: ffffffff874243e5 DR6: 00000000ffff0ff0 DR7: 0000000000000600
kern  :warn  : [  111.100726] Call Trace:
kern  :warn  : [  111.100793]  <TASK>
kern :warn : [  111.100853] ? __warn (kernel/panic.c:741) 
kern :warn : [  111.100940] ? drm_framebuffer_free (drivers/gpu/drm/drm_framebuffer.c:832) drm
kern :warn : [  111.101164] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
kern :warn : [  111.101257] ? handle_bug (arch/x86/kernel/traps.c:239) 
kern :warn : [  111.101346] ? exc_invalid_op (arch/x86/kernel/traps.c:260 (discriminator 1)) 
kern :warn : [  111.101439] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
kern :warn : [  111.101554] ? drm_framebuffer_free (drivers/gpu/drm/drm_framebuffer.c:832) drm
kern :warn : [  111.101773] ? drm_framebuffer_free (drivers/gpu/drm/drm_framebuffer.c:832) drm
kern :warn : [  111.101991] drm_test_framebuffer_free (drivers/gpu/drm/tests/drm_framebuffer_test.c:693 (discriminator 5)) drm_framebuffer_test
kern :warn : [  111.102139] ? __pfx_drm_test_framebuffer_free (drivers/gpu/drm/tests/drm_framebuffer_test.c:670) drm_framebuffer_test
kern :warn : [  111.102295] ? __pfx_drm_mode_config_init_release (drivers/gpu/drm/drm_mode_config.c:386) drm
kern :warn : [  111.102539] ? __drmm_add_action (drivers/gpu/drm/drm_managed.c:161) drm
kern :warn : [  111.102756] ? __schedule (kernel/sched/core.c:6399) 
kern :warn : [  111.102848] ? __pfx_read_tsc (arch/x86/kernel/tsc.c:1130) 
kern :warn : [  111.102941] ? ktime_get_ts64 (kernel/time/timekeeping.c:378 (discriminator 4) kernel/time/timekeeping.c:395 (discriminator 4) kernel/time/timekeeping.c:403 (discriminator 4) kernel/time/timekeeping.c:983 (discriminator 4)) 
kern :warn : [  111.103037] kunit_try_run_case (lib/kunit/test.c:400 lib/kunit/test.c:443) 
kern :warn : [  111.103135] ? __pfx_kunit_try_run_case (lib/kunit/test.c:430) 
kern :warn : [  111.103243] ? set_cpus_allowed_ptr (kernel/sched/core.c:3025) 
kern :warn : [  111.103345] ? __pfx_set_cpus_allowed_ptr (kernel/sched/core.c:3025) 
kern :warn : [  111.103455] ? __pfx_kunit_try_run_case (lib/kunit/test.c:430) 
kern :warn : [  111.103574] ? __pfx_kunit_generic_run_threadfn_adapter (lib/kunit/try-catch.c:26) 
kern :warn : [  111.103705] kunit_generic_run_threadfn_adapter (lib/kunit/try-catch.c:31) 
kern :warn : [  111.103823] kthread (kernel/kthread.c:389) 
kern :warn : [  111.103907] ? __pfx_kthread (kernel/kthread.c:342) 
kern :warn : [  111.103997] ret_from_fork (arch/x86/kernel/process.c:153) 
kern :warn : [  111.104085] ? __pfx_kthread (kernel/kthread.c:342) 
kern :warn : [  111.104175] ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
kern  :warn  : [  111.104272]  </TASK>
kern  :warn  : [  111.104334] ---[ end trace 0000000000000000 ]---
kern  :info  : [  111.116715]     ok 4 drm_test_framebuffer_free
kern  :info  : [  111.124711]     ok 5 drm_test_framebuffer_init


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241017/202410171515.c79582d2-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

