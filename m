Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03ABA049C8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 20:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CE210E22B;
	Tue,  7 Jan 2025 19:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZioEMgfX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A351C10E22B;
 Tue,  7 Jan 2025 19:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736276504; x=1767812504;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=uMYY8ADtTE/9c+MCUSS1szrAlnaqIE7bsErnMeh4SEs=;
 b=ZioEMgfXei/3JQTxBztjyodM9U4o0tmjM7MmYy78vuQMGSMKE0I7fsQC
 ZCgKPj7GQuL0Lb0/jseE+d3jvPs4oiouy4E4NBzsO6FChGqBFRRK0JBXj
 5uJOyCX2lJGXf3EU6JS1JR8Pl6rjaFouGqnLBHC/nuYaKtz0IdE50zqcO
 2iwmJk5E6s3KQkmZ0a8qcQ/4mT2FqItUoFHMz+XSov6znbMZ3Zjai2tuO
 qMfPGsL+CwA7tv6E6lTH1n6iM2JpXARfntE7UOnuJn4KPCuVDgumKsgMZ
 pIQbPJ2Ebwn4x8d2TvXiTb2vPXnlwTwZJYMREmzsukZ3/qgx9/BMnoKwH w==;
X-CSE-ConnectionGUID: 8hODdafvTCuGBynE7l90pQ==
X-CSE-MsgGUID: VwJl6Gv6Q4mUMdIBu49BYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36374696"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36374696"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 11:01:42 -0800
X-CSE-ConnectionGUID: wp7lwfG+SgyPKt1D/iJEWQ==
X-CSE-MsgGUID: XOEvC3SyRJazXBlsriPd9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="103346476"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 11:01:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 11:01:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 11:01:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 11:01:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikIFhZYjMKCXERLIpdMFhJIN/OXrYJpFItGj/mfYWITQpHNwC2BR0VIoSP52YROhomf4eoOX+4t2N1ED+NdnqqUqEQqXUVrIPwBQzjyAlWfdZ64RW9xTHGE7mEeSSS1QxVDuQ1NdlRvlEVHrC2W3wKZWA7aKkSSbgZEvlptwpdj7LYlKApE5fFZ6+X38vIfihqgWYlBdENapL5BnkCotUMVpgHxOtJ4T1r46TrtgL6vAqUxUZmE0/W1aKMxsEq6t12niyBZ4fY9mWgkUcivhkSyGT8x+I+LNsu7Rfox/Hl7D/9MEagDgXA45MDbiU/bW71eMthIMEhoP8LlVHkxBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysgccZVnN3X/+bhxD1bzWNDx18Es31ebRpky3b0m1m8=;
 b=ozca9Syyu7ULt9CzBgezJESaCTljhHOYgdRibMXRpXueJaHO2YcDlTsm7kOB5csRR8TAXhyixhFoNEovLrzre0r9xeanxwPlkpRb6sXFsIJMm6+esML+qOqnbTiPA/C+mEzKO4AHv/7yerBn/TnKWimo4G6jGfz8Pdag6h2RbTSQMzhQqerlJwATCfFykoYw1hCrC3/Aig/OWa4JsCA5mCJewXRXh33iK6QZlVlSb6bQM3/PM5XNkRKb0gXNH56I9r5rHv16ENoyEmVHXmu3vtt2GgMTkxakSqEX+OCZ9qYKgk9dbYBHpHk1wLN5+ECo53/cl6vEVHpmXC+3JM5f4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Tue, 7 Jan
 2025 19:01:09 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 19:01:08 +0000
Date: Tue, 7 Jan 2025 14:01:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <Z31579j3V3XCPFaK@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:303:b4::26) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|DS0PR11MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: 68362fb3-d54f-464e-aec9-08dd2f4da4f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?W+3x1hWpRehp2dMY3VKeoLeTcocMkiws3d2mywjPp89EqgABNAOq2P41CE?=
 =?iso-8859-1?Q?DOBzI7OXOPgZdA+2kqeERV+4oYcKZM6kZC0Yo/78hs40v6U1QnzPFT6OH4?=
 =?iso-8859-1?Q?J6GVXpNplpHv5D6rmpcCcC5ajiwj7svLDPJedim4Z2JinTubqXIPxxH24J?=
 =?iso-8859-1?Q?YgiHVou+HtCADh/niB2PL0ZXdLs/W80oH5rY0wrD8M4LIn/tsHC8DMViLh?=
 =?iso-8859-1?Q?y2smnVimma9tJagvxhPZ89paS2KeqjcZM7eHodxmK1GED864hgmQwBqsnk?=
 =?iso-8859-1?Q?CJUZYDLb6URmLVdTVXh640/xS9z2T9uuz0FoM2J50CNBEmQcmn/fVHN/LU?=
 =?iso-8859-1?Q?PHG4ZZTDDExzQJIPv5LaQc9zq7hbWv4TJgHW78e6eqThvqm9WklfimTGXe?=
 =?iso-8859-1?Q?ds1ny/LVM7S55FA10ciNuFyBMosV5mD1quzUxTs8YXwjeb7vTDmKcVF3Aa?=
 =?iso-8859-1?Q?bhtlz+XhIMupimK354XEP1UGprICndMNE+w6N+kNt2Q0MlEzu2acfYufEg?=
 =?iso-8859-1?Q?ebojupTCwwb5tVzIUu4n8Xvrbh6epvlBW3QdPoQPhPES6djr5DiL9Adtp+?=
 =?iso-8859-1?Q?x7nTIhRLvcnduPMFsGdyr+BqPCJ7NT+yEPKUc6s++XiRD27BIt6x1dlgBx?=
 =?iso-8859-1?Q?ga/vljx4njUkP3H94qaKLyDbPS6Qc9y+FmsVnyA8x/1BuqKAS52lPmdvyz?=
 =?iso-8859-1?Q?dT0QtHjA/CBDajBbiGlSZDkm+qUPvNSw+o5Xyn/LQyJ8sJTPe14/PJ1MNe?=
 =?iso-8859-1?Q?TFNGLx7ASZFoXrb0S5FGb8Z3FgkL/kfFhF+Fw1ALZz0mXPHF2uk/VeOHrw?=
 =?iso-8859-1?Q?7Q33vfSJRQq5icHH5qNGtvBCNLz7F6xaeAgAXPoyEFCphG7AyAL/1fz4G/?=
 =?iso-8859-1?Q?jKzisQdn8fodQmR+87kABTCo69uggg4kuTRvxzBkLgXCCT80W9PGGveYAM?=
 =?iso-8859-1?Q?LIBJn6rvthDVGneoRogK98RxwbVwbXb38JbUa+6v7u/467vUgMbTS/Hpix?=
 =?iso-8859-1?Q?jsaYgkguXrN1iSEoU/FD2cTAnoG/re5FjXx2fa9JKtbUAODq36GhqPSneU?=
 =?iso-8859-1?Q?rfd5gFnhcNqs23XVuDPxuNFswalExEg4y5DuqJannNmo/QiVIncaP9TE1n?=
 =?iso-8859-1?Q?+gQfLGhYkJDKwW7oIPkW79BW4AwPx7fYcPDMOFIHH0wgVuTQPlZqLZFzLp?=
 =?iso-8859-1?Q?Y/NteWPz5uzrvxEb/dp36ZcUiD5G/yjmvbVukZEAzDNWvOQgGHBBOlqqo8?=
 =?iso-8859-1?Q?spQSlOpm4oW6YE/4AVgc2xPn4b3n/4nWDHZjzMPmiRd+c4MvjrR5Uze6V/?=
 =?iso-8859-1?Q?ayYPEKUYekynensFZewc1Qpywk2yv+jGCWy2aSKZSGvtyzFftkFSMGxnq5?=
 =?iso-8859-1?Q?vKOQtSXUpOmCB5ru8biTTChai+nI6Atg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DOHkVRu5uuGMOFH+2uDz8NZ+NyNmI/VPZgYug8tmcYodjOI9jwJGbj6u/s?=
 =?iso-8859-1?Q?IZEnL7tplVT8o6Xrj9PwF61NK2bv3eYn69WynP52w7H6WcYhMbDANfQLgL?=
 =?iso-8859-1?Q?OPKzHoTDXCt3XwNvFfb5naUVP8rhdrqK8aQX8NrRILz7/Ujv1SXVjRdGJT?=
 =?iso-8859-1?Q?MBGWIn0uWjbArZJTR2RdCbTbmoXODCrRbUPpxPYHLR6CtO/wVk8rJivwBL?=
 =?iso-8859-1?Q?aWgndUcKlFGBa0fZzHVR7Gnb1eXRULMiR/MkcRzQFipGxroXhY7uDTNV6H?=
 =?iso-8859-1?Q?zFtN9BSGC41wGzhmGeXLbhxmhXa4oIsghzoh3A0fVmquBD55uHE7aMn/xU?=
 =?iso-8859-1?Q?siJeeM/zXZ35Vi8rTAoM2nGHeKZL+snevuxFLxO2JTzLZUjv8fJtSnEaTP?=
 =?iso-8859-1?Q?7VBzeYrlRU3Um2wk699p90X3VGbRSNmlv4+rPZUDn+leeWRJyksLf88akC?=
 =?iso-8859-1?Q?sevjRQpen8p1BMD39mzsanHW98NFxa1RGlqrfiq0o4Pph2ZpETZELHt2wb?=
 =?iso-8859-1?Q?B+XT6eg9kCyLyxUOYcthuDpM0sdx0CqIfMw9yseY2k5/7Xq93YDhJjgO9P?=
 =?iso-8859-1?Q?wRjbdrcXfoXbiZailDEfE8tX0S7DZHR+4VPJd6UjjhBXAOKmUcq5heuiju?=
 =?iso-8859-1?Q?zaEz4kaM4gKQAuAsBHFemU3xcVB5qYUkedyX/cCS6zdaib60OQBJjobTYh?=
 =?iso-8859-1?Q?98NYQ6JTThVTGiu/sGolRMFyP4WW5lqB0sCsh2jxP82xkEZzjA9NJ0j5y/?=
 =?iso-8859-1?Q?GDhNMmb3wLTs9JJDATsSbz3rfAzdkLajlllESM8t6exu17X0A+mxoX4ID4?=
 =?iso-8859-1?Q?mOfIvoZjY+w6dikkbE8zACdmR/Tr8tldEZl5r7ETWGavvVtGoByVSs564r?=
 =?iso-8859-1?Q?wmwKG1Zsoaz0oc8Ahfi24z6fprz4qUt71bDQfkJc3vyTQ+DNnLaWdG+75l?=
 =?iso-8859-1?Q?UPu7yk9VEvK6iSIXg9ZUzOtrWz1ZkiWtgR7xtqTkgjs+Qp+A3yEm8L7Kys?=
 =?iso-8859-1?Q?tBUnACA6tm4s9UEkXUZXpkP1WDya9cfObSYQ8v/I5baNb2cUCA4rRsTprN?=
 =?iso-8859-1?Q?R+5OQlPEFpyW5gC/t+3weuJ987KN5afjIDKFhhtwRbd6lvtbTkzRd+DYOQ?=
 =?iso-8859-1?Q?RiuXU5vRUYarSwmuGChYGrDCfrMafrq+P7INIC8Bu2wUjtsAoCuEVmAfvl?=
 =?iso-8859-1?Q?I4sRRsJTfWnvfBSo/WGUJ6MwEDheupH0icJw1Ei1ZlwxwQ2xVFAq9lGZrI?=
 =?iso-8859-1?Q?ameITrOxs8cCcuY0nWtsfzW7YlmVPNGJDuD9ANL1pUlbiJ91uYaqgHd0/q?=
 =?iso-8859-1?Q?ppQQfQ8wx/uFf43xkUBSUOQqjy1cqMrBG9P8v8zLNUYZpxSedlVqiv88Qd?=
 =?iso-8859-1?Q?2//zJSaCVp01hqutNo3wH27yFDoXH1IegyOGCEIUiKSG3sabBNsOMdyEjN?=
 =?iso-8859-1?Q?4RfxuBzZ7mj/uRHZjxWRfVsK+eJXf/31fgwVSGqoFJ07XGQf/ooDedqZPx?=
 =?iso-8859-1?Q?KQ7ryKjhnret5ALD+SBBnnKc918g+YhT5AAc5QvlUJgpIIxtnifBRCMy38?=
 =?iso-8859-1?Q?37L3+7FY2I4N3CiqgNuArUWxrrhZYRO2lbBOa3nypl2cwyxjJ83bHime/V?=
 =?iso-8859-1?Q?jsbeYqjEPSl63qnpykxlfKzg9c1uP2D9sJyhR+JfYu654BXyQFLGfplQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68362fb3-d54f-464e-aec9-08dd2f4da4f0
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 19:01:08.5139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfHg5Upt57xfWFbE+MNpbZfOik9kGP+n6IPBP3EZrmyWQcO1LkymHeFv6txM5gWXCNzMjv1Gu7UqDiD/ybHKnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
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

Hi Sima and Dave,

Here goes the last Xe PR towards 6.14.

It is important to highlight that this has a Revert that
fixes a regression that was part of my previous pull request:
- Revert some changes that break a mesa debug tool.

Other than that a quiet and small round.

Thanks,
Rodrigo.

drm-xe-next-2025-01-07:
UAPI Changes:
- OA new property: 'unblock after N reports' (Ashutosh)

i915 display Changes:
- UHBR rates for Thunderbolt (Kahola)

Driver Changes:
- IRQ related fixes and improvements (Ilia)
 - Revert some changes that break a mesa debug tool (John)
 - Fix migration issues (Nirmoy)
 - Enable GuC's WA_DUAL_QUEUE for newer platforms (Daniele)
 - Move shrink test out of xe_bo (Nirmoy)
 - SRIOV PF: Use correct function to check LMEM provisioning (Michal)
 - Fix a false-positive "Missing outer runtime PM protection" warning (Rodrigo)
 - Make GSCCS disabling message less alarming (Daniele)
 - Fix DG1 power gate sequence (Rodrigo)
 - Xe files fixes (Lucas)
 - Fix a potential TP_printk UAF (Thomas)
 - OA Fixes (Umesh)
 - Fix tlb invalidation when wedging (Lucas)
 - Documentation fix (Lucas)
The following changes since commit 4d79a1266d4cc3c967bc8823502466cad1ac8514:

  drm/xe: Make irq enabled flag atomic (2024-12-11 13:20:53 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-01-07

for you to fetch changes up to 6acea03f98f5d0028cae1d9d4c60914bfdfb6d27:

  drm/xe: Remove "graphics tile" from kernel doc (2025-01-03 12:43:02 -0800)

----------------------------------------------------------------
UAPI Changes:
- OA new property: 'unblock after N reports' (Ashutosh)

i915 display Changes:
- UHBR rates for Thunderbolt (Kahola)

Driver Changes:
- IRQ related fixes and improvements (Ilia)
 - Revert some changes that break a mesa debug tool (John)
 - Fix migration issues (Nirmoy)
 - Enable GuC's WA_DUAL_QUEUE for newer platforms (Daniele)
 - Move shrink test out of xe_bo (Nirmoy)
 - SRIOV PF: Use correct function to check LMEM provisioning (Michal)
 - Fix a false-positive "Missing outer runtime PM protection" warning (Rodrigo)
 - Make GSCCS disabling message less alarming (Daniele)
 - Fix DG1 power gate sequence (Rodrigo)
 - Xe files fixes (Lucas)
 - Fix a potential TP_printk UAF (Thomas)
 - OA Fixes (Umesh)
 - Fix tlb invalidation when wedging (Lucas)
 - Documentation fix (Lucas)

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/xe/oa/uapi: Expose an unblock after N reports OA property

Daniele Ceraolo Spurio (2):
      drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
      drm/xe/gsc: Make GSCCS disabling message less alarming

Ilia Levi (3):
      drm/xe/irq: Separate MSI and MSI-X flows
      drm/xe: Initial MSI-X support for HW engines
      drm/xe/irq: Manage MSI-X interrupts allocation

John Harrison (1):
      drm/xe: Revert some changes that break a mesa debug tool

José Roberto de Souza (2):
      drm/xe: Force write completion of MI_STORE_DATA_IMM
      Revert "drm/xe: Force write completion of MI_STORE_DATA_IMM"

Lucas De Marchi (4):
      drm/xe: Fix fault on fd close after unbind
      drm/xe: Use q->xef for accessing xe file
      drm/xe: Fix tlb invalidation when wedging
      drm/xe: Remove "graphics tile" from kernel doc

Michal Wajdeczko (1):
      drm/xe/pf: Use correct function to check LMEM provisioning

Mika Kahola (1):
      drm/i915/display: UHBR rates for Thunderbolt

Nirmoy Das (3):
      drm/xe: Use non-interruptible wait when moving BO to system
      drm/xe: Wait for migration job before unmapping pages
      drm/xe/tests: Move shrink test out of xe_bo

Rodrigo Vivi (2):
      drm/xe/pm: Also avoid missing outer rpm warning on system suspend
      drm/xe/dg1: Fix power gate sequence.

Thomas Hellström (1):
      drm/xe/tracing: Fix a potential TP_printk UAF

Umesh Nerlige Ramappa (2):
      xe/oa: Fix query mode of operation for OAR/OAC
      xe/oa: Drop the unused logic to parse context image

 drivers/gpu/drm/i915/display/intel_cx0_phy.c      |  39 ++-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h |   4 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h          |   3 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h           |   3 +
 drivers/gpu/drm/xe/tests/xe_bo.c                  |  16 +-
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c       |   2 +
 drivers/gpu/drm/xe/xe_bo.c                        |  12 +-
 drivers/gpu/drm/xe/xe_devcoredump.c               |  15 +-
 drivers/gpu/drm/xe/xe_device.c                    |   4 +-
 drivers/gpu/drm/xe/xe_device.h                    |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h              |   8 +
 drivers/gpu/drm/xe/xe_exec_queue.c                |  23 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h          |   4 +-
 drivers/gpu/drm/xe/xe_execlist.c                  |  10 +-
 drivers/gpu/drm/xe/xe_gt.c                        |   8 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                   |  10 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c        |   2 +-
 drivers/gpu/drm/xe/xe_gt_stats.c                  |   4 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c       |  16 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h       |   3 +-
 drivers/gpu/drm/xe/xe_guc.c                       |  30 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                 |   9 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h           |   2 +-
 drivers/gpu/drm/xe/xe_hw_fence_types.h            |   2 +-
 drivers/gpu/drm/xe/xe_irq.c                       | 323 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_irq.h                       |   8 +
 drivers/gpu/drm/xe/xe_lrc.c                       |  24 +-
 drivers/gpu/drm/xe/xe_lrc.h                       |   2 +-
 drivers/gpu/drm/xe/xe_oa.c                        | 252 +++++------------
 drivers/gpu/drm/xe/xe_oa_types.h                  |   6 +-
 drivers/gpu/drm/xe/xe_pm.c                        |   4 +-
 drivers/gpu/drm/xe/xe_query.c                     |   3 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                  |   5 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h           |   2 +
 drivers/gpu/drm/xe/xe_trace_bo.h                  |  12 +-
 include/uapi/drm/xe_drm.h                         |   7 +
 36 files changed, 594 insertions(+), 286 deletions(-)
