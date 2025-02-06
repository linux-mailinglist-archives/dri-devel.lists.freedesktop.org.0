Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118C2A2B366
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 21:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2434D10E939;
	Thu,  6 Feb 2025 20:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0ihRhuz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA1910E939;
 Thu,  6 Feb 2025 20:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738873917; x=1770409917;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OOFVAjVgpD22wkbv09YrXnBP4u+5jgjQ7UmlXia0b6o=;
 b=n0ihRhuzA87CHM15kHEyGucsF3VCqChddFhBIwsKnvCEGQJJAQq/Jdkt
 xldYOLolC4YXNzcKMY8Q8qtpreMgXoxh2PC5gC/+XT9ceXvyNjamMSo/u
 cKHDD4DV2WIakikppN7+zOPOmFCfnbSNVx7oO0qOwuNie4fim5J74x8hT
 epNzwToMgA3fGoewUyVcuVP9iXTJ+EKnzOA4nN0eSKrCCzhlgXKDY9RXQ
 31OtAMxcF5degEI0pUNKdSoNHCph5MLHlnVChqeF+qhS2112UoklCoegN
 gq5JrI+a97pPYdHfx09ybPWgYbI+XRx9qMfQ7CLIqbJRQ6EtTBYNFgzVE g==;
X-CSE-ConnectionGUID: bmtJZuA4Qt68iYsPT2sfGQ==
X-CSE-MsgGUID: 28uWQ0uSRBeM8cHR/oObkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39407240"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="39407240"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 12:31:56 -0800
X-CSE-ConnectionGUID: kQq7GhdTT7SsyM2OYKi4xg==
X-CSE-MsgGUID: uDw2cmdQQfCBFJTfRjPY+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142202020"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 12:31:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 12:31:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 12:31:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 12:31:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8SQRYm4EKWEthNIildFb71Joli7XZLWqx43EeLfrYodRJHo+TWIEiwKxGKlEQS5CBEkkjdYjV/UqqnrI9RW8J9yHRlcFMZrwkeJS/ELzPLDP1uj5tQQKDWlLHGT42gT8QGXNquvN2Y91oKd/nx6tTW6lmxfNmh21010vjmeIQCvf96gOKfVYmK4R+7odTKn/iCZWBolIWugrrqztc5uhV8mEYDvmkm3JBSWv48sj2tB+bvyZNAqcFqxldhcv8ZKbo78/KuJOTNMY6OLbrxrGV0tI9HKxDlE4T9SedHJy7YDhHnrou+mlujtkuAJLXqhxGZHmknYO9myU6A0mznEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyRKSOYYodFNuVmyu2DfhvgKojzH8Y9V7Trm/nfb3Lw=;
 b=f8zWfT2aVl6qLvQaHhXNbf6+PjUhgCqvoQ2ujkbHxcLa6L3iNG5qMwLy9Ge2lDYG+d+MhcGWP7uWb8/Dby/LVjcT2t3pBLim8BakK9X5B2UJacqQ8ksAL+WPo390Zh1Fs2SVHgSLohOPP28vJiwBbRoCloLDi3scN2gfNjXm30m6bJMLBzYjKBuQkYVxCaPsvaftlbNPR+mUx6ZLlvX8lSzZs3W5cf3NmLT4AF1yqGAli8IOLNOUA3c6vGxrbrMXTSozUjiDXIukz8dVgO0k66GHkGZSztsRXDPqG+u9jsS9ed582HHLG0DhQm7Ay2EadJXiFYfpF9tEyv/fEDXy5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SN7PR11MB7976.namprd11.prod.outlook.com (2603:10b6:806:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.13; Thu, 6 Feb
 2025 20:31:50 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 20:31:50 +0000
Date: Thu, 6 Feb 2025 15:31:44 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
CC: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "tursulin@ursulin.net"
 <tursulin@ursulin.net>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: Compile error on "error: =?utf-8?Q?cal?=
 =?utf-8?B?bCB0byDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydF81ODHigJkgZGVjbGFyZWQg?=
 =?utf-8?Q?with_attribute_error=3A_clamp=28=29_low_limi?= =?utf-8?Q?t?=
 dsc_min_bpc * 3 greater than high limit dsc_max_bpc * 3"
Message-ID: <Z6UcMPGQ7HiwHEPj@intel.com>
References: <CY8PR11MB7134D2D3BD641BE58310EF0189F62@CY8PR11MB7134.namprd11.prod.outlook.com>
 <01316a42-bcc0-4255-8750-3c5e8329161f@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01316a42-bcc0-4255-8750-3c5e8329161f@intel.com>
X-ClientProxiedBy: MW4PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:303:16d::9) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SN7PR11MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: b86513b5-8a01-4d00-5ada-08dd46ed48b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODlJU0pvQlpVUWhKdnpLd0UrRlBoTFl2alhwRVNmSXhseWJkNUtxclFEZjVC?=
 =?utf-8?B?YU5GQ2tJZEdRb0J1U005TThnYkRleFAzeGdtVnZxUXdZcldkZFFMb3d3M1FO?=
 =?utf-8?B?MzVqbHZidE4yWXB6SDZUck14bDZFU2hRcVd0ckl5akR3dVByY1FFZFFUOGdz?=
 =?utf-8?B?NXhkb1dTckIzd3JOVXR6WktRak12R2F2aG1NUHlKaWxjSDRBMjV3UFI3UFAv?=
 =?utf-8?B?TmJ2Wk9MVk5OOVRyL2M2bm1OamFOSWNXMnBnZkdObGFLQmJDWnkxQ0ZmL0hQ?=
 =?utf-8?B?NGdRTzJFcEY2b2hxMzFoSlJpNkd0Tk5wZWpkblh5dTVHWkU5MmpQT2NjUE8z?=
 =?utf-8?B?S0FYUCt1ME1Jd0FoN0Y4empCZXkwcHNoK2hYMXB2eTJJMU9hTlVLZmhxWkV6?=
 =?utf-8?B?S25OKzZ6YzlEekd5RWtzRnFCeGRSRU16UzZTQ1NnVGFPVjVreEJOR2lRQ0Jm?=
 =?utf-8?B?YWxmL0UxZGlNWEw1ckw2NG91dTRidWtDRWlzczNuSmlLZGRWUU1Jb2ZrRFlF?=
 =?utf-8?B?Y2xMZEVGN05sUXM4a2Y5eDAwWGJ4OWlMU0w4MTZualdjRDh2bWc0NEg3ZGVH?=
 =?utf-8?B?LzdOQ1ZsbXFsV3pFZDVoeXRLb3FVTzlESnNYTWNPRDdkN0lzbFB1ODFKWWox?=
 =?utf-8?B?bnlFK1paRnZ4bnJFV01EWEJydkpmcGx3Tld6T0UraytxRk9lZXpPU2NNdVh3?=
 =?utf-8?B?YkhndHJ4NndGSFB2K2pGQmNaeXc1d2ovNlpvZVVBN1ZMbUQzRVkxbmd1YlRs?=
 =?utf-8?B?SUw2ejFOR3FER3J6MUJVc0EySE9oZC9MVXR0OHp2QmljSjVrazJFbGs0TXJF?=
 =?utf-8?B?UnlBUGZqZFp4bk5EYUEzR2gyVDdROG50MVhtak9zRWt4RzJZRlBRY3dSRmlw?=
 =?utf-8?B?NC9NMnlLVWJXR0g3TFBiS2dZU2xHRWRKTnMzMGlkU2svdHZFZ3hYSS90b1VY?=
 =?utf-8?B?eFFraEl1aHNpN2xaWkllSm15d3Jwblk5akJYVVl0Nnh5VmpCWWJJNVM2SUVx?=
 =?utf-8?B?SHFkbVlrbnpiM1JDdDUzS1JKOVdDRTdkUzVrNys3S2VOdDNCbFF1WHArNTMr?=
 =?utf-8?B?U2VkVDhrZ0s3WFlOMWxVVVN2MHd0WUp3c0luVmtEanpUcDZnb3V0aHQ2UEJ5?=
 =?utf-8?B?aGdqQ2FkL0M5VDloYk9BT2ZBdkw3UDV6TE4yRjRlOTBqZmJFcFByampBanlJ?=
 =?utf-8?B?SWU1aVJtN3JEZ2RFc2JHQ0VmdFY0OG12Wm8wNUlqSHg4OXluekErdXN1K3pH?=
 =?utf-8?B?OFJNemRKY0FkRW9yTlBWakRTN3BRUjJmNXdzVUkzVWNoOTc0VWcxSFNkVGRC?=
 =?utf-8?B?b21ubFg2SUtPQ3VGZEN5anNWNkp3TFZJU0d6akxpeWdOSHQ2Qkw1bDcva3NT?=
 =?utf-8?B?ZWU2a2hiK09WUEI4Mi9mTVViNEtLcVFGckl0QTBJd2w2anRvdVBuVmVnRHgz?=
 =?utf-8?B?bnBzejExZU4zSURRMkd6YkVaUGVIc1EvdjFCSXRUTnNOSTlldEFVZlUxdGh1?=
 =?utf-8?B?cTlEem9jTG4rcmlYQnk0dE1iWFhIcTJjVjh2R3JTZ0pLU0YrSTBDd2lvQ3ls?=
 =?utf-8?B?U3FGTHZzWWU5NEJSVUQwMENZUjljQzdVWWJBZUtBaVdWdFVpZ3dtWVlrRnly?=
 =?utf-8?B?aDZpV1NhSUhyU3NkMEwxZnN6bDMvV0pwNzNqci8xQTR4YThWdXRoQjcyWHlM?=
 =?utf-8?B?WTBiWVZFaHJQRmRGSGc1ZHh4RmZyNVZlamFkeXZnMzhpZG5nb3Z6eFkwOHVn?=
 =?utf-8?Q?rcd4ibF/JMg/2wd1rQ6P82QKi4kwuwZwLkeJpoZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3ZFbnJYVzNMM2d6eU1QVU1nWEN3T05DY1prVEVKVzg1R1ptL1o0SzlNdVVY?=
 =?utf-8?B?NjlHNlA0Z20vSnJCQlErRFpjTDVYbG90RVJJbE4xL29aOGxjRVFZUE5PZWVH?=
 =?utf-8?B?NzFzN2VCd1BsaFNzZitwTnFQZEROVFU4QVNUQTVhTUNBV2NyQ2RCTldNRmZw?=
 =?utf-8?B?NzNhU2h0MXFURXNpZFBBeGtRdUNmZDRwWWZwSVF6K054ek44Y002ZGtScWpp?=
 =?utf-8?B?MzBSU3JkazVMaEQ3ci9jK1pudlZ3VzNOd2h6WnFHa2tlaU5iWWozZGhKdlZv?=
 =?utf-8?B?MW1tR2JjZDdrYmxxaHhyemViRXovdHQxeXBmRVZaalMzeGcvRzlIWFNlZEVs?=
 =?utf-8?B?VUpSemd0b0hGZC8wUXk4ckE1MDVPOTFMM2ViTjArckhyQVAvQ013UDVwOXdH?=
 =?utf-8?B?RFVESHduNnE0d1U4bmNzRUZTQ0xRaFZOQmtnc3cxOUIrWEpHbXNibWlqZzFq?=
 =?utf-8?B?QjhTUVBZTVk0cTFxaFZrZ2duVHR1WmRkVWhYRFBpSU8reGlyK29Vb0lEaDJs?=
 =?utf-8?B?TlFiQkhlRHdkNXBhMmJlMUczelBoN3AxVWVJbnRxdnZoYkFqSHR5dlR3SHcv?=
 =?utf-8?B?VlhNamkwUHJLemhsaUdSNU5XS2JGRmplT3BMZENqSEV1Y1l6Q1VHNTFtRlpz?=
 =?utf-8?B?QmdyRWRrNGpSMGZ5MWJjQnhkZ3NDeWVsRmNXSDAxeGVZNW9ZUGxYZUNJNUlw?=
 =?utf-8?B?K250WWoxS2x3Y2pPWWxiSjRQZ3Y1MkkrSHRaMmZ0SkhsNlpxc1pUUW0xSFdQ?=
 =?utf-8?B?YjI3RnNSUzlqc0JMamI2dFV0WmgxN2dLclE0T2VBMUxNZEJvM2Y3NTNxWTNj?=
 =?utf-8?B?b0NJeWFORnRIaUpJais1QzdMVklreUFRamxIMWNjZ2Q2dkUyY2FRRGg5VU5s?=
 =?utf-8?B?K0tqQ29nTEpMZWxxcEVHUmhkV0owcnZCeURCaGlqWStsMFAxWDlEclVRbDg5?=
 =?utf-8?B?Q3kzNURQSkxUOFVkUzZZTDhmVW9SY3hpNkVRcTRielN6T212MDhFTkdnY25v?=
 =?utf-8?B?citrblFjTFJRdTBaTUZ6azl3MUNaQmZHNzA5MHVMc25yamhDZVEwWWZhTFE5?=
 =?utf-8?B?M0Q1YjBtaHUwazZMTHFRUkR6WmNhaEhYVEUreEU3aitNRGpQbjJhQVBMNU9q?=
 =?utf-8?B?NU5zQVdNZ0hlVExZNWpHbUVhRi9aS01QeHdoWmNLeVlPYlpTQ2xyMEFzSUtC?=
 =?utf-8?B?OE9HVE8vN3dNcGh5MUdQMSs4bnpGSlNOUVdaZ1cxVXhKcXJhczlvc1lpOGxF?=
 =?utf-8?B?YVI5ckQxTVV5MEZaR2drL2wvcElrWDVDZjd6WGc0Zm9wQ2owaU11OU5zQlFN?=
 =?utf-8?B?dmFwa3VPcVNmQUlsSXJwQzJCWDFYUS8vT1drbkxzcWZ2SVFFOUlxNGEzOEdQ?=
 =?utf-8?B?Wmh1VXVIMnQwdE04V1U0WFJubThzb212V043am82amxkWHZxTjYrMkNvbkN5?=
 =?utf-8?B?S09SN2VCVGNENHhkd0tZSFh5bUswdVBnaGtuQ3g3MXRXcjIvOXN1Y2x5My9N?=
 =?utf-8?B?eU9yL2J1OE9acGxVeG51TUxpMnBWWlNRdUt0MTZXVjFtbkYxWG9OK1lZbDRY?=
 =?utf-8?B?UzZSWmx1Z3Y1bHB5SFMrdmlxVEdBWENzTk9Lbjl4djlkeE0yU3J2U1lvT3dC?=
 =?utf-8?B?YWs1NDB2N3BLeGIvUTFvMEUrWU9adGc0bWFKWkM3SXNDbVBhUTErNmNreThp?=
 =?utf-8?B?MlhZb09yUlRwQ0J6MUhScGNERjlnZm1pekNlcUlONng1anBmSDhFSnduRTRr?=
 =?utf-8?B?UGg4a1U0cE9DVllMMTFxcTB4SGpFVEoxOG41N05EQTEweTRGalMrUW1jZG1w?=
 =?utf-8?B?cU5KalN3d29GeVIxS1M5WGkrZmppck82aWpobjdBSmhiQVc3RThtMnNQQmhs?=
 =?utf-8?B?VXoxb0YvR3Vya2hkSWhMdExaSXJKY1E3T2dvVzNoRnNXS09UZ3NsRnl4Qit4?=
 =?utf-8?B?b1preEpjcE53ekhSZ3B3M0hXVW1tMGhtTFkrZ1BFUjQ5bGJYcmZXNU4rNWtv?=
 =?utf-8?B?RzdOSnNkOUZaYjkvK0JKTy93bHVLeWJqUFdZbXpxaFk5NWlsY3VsQlJpUmtR?=
 =?utf-8?B?U1E2M09vbU9kQjU3ZGNwL0hHQjJIT1l2eWhHOUJtbVlFaFVPZjBQbjAyTUd1?=
 =?utf-8?B?Zi9Lcll1N2V3ZUZPU3YrTmlEeFlEZXZOSEVQNDZyZlRMNW50a3VXK3pObFRF?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b86513b5-8a01-4d00-5ada-08dd46ed48b5
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 20:31:49.9438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DN6PbRLfplZP5eTeARexYleq8iiotWWjFBvo9TU7k0P9AZ9OO+lo0+oExdBrXHg2ld7v+sFg1mc52PD914AhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7976
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

On Thu, Feb 06, 2025 at 09:43:54PM +0530, Nautiyal, Ankit K wrote:
> 
> On 2/6/2025 1:34 PM, Zhuo, Qiuxu wrote:
> > Hi,
> > 
> > I got the compile error as below.
> > My GCC is: gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
> > kernel: v6.14-rc1
> 
> Hi Qiuxu,
> 
> Thanks for the mail.
> 
> Fix was sent and merged in drm-intel-next : https://cgit.freedesktop.org/drm/drm-intel/commit/?h=drm-intel-next&id=a67221b5eb8d59fb7e1f0df3ef9945b6a0f32cca

Which is queued to be in 6.14-rc2

> 
> Regards,
> 
> Ankit
> 
> 
> > 
> > --- compile error log ---
> > 
> >    CC      drivers/gpu/drm/i915/display/intel_dp.o
> > In file included from <command-line>:0:0:
> > In function ‘intel_dp_dsc_compute_pipe_bpp_limits.isra.77’,
> >      inlined from ‘intel_dp_compute_config_limits’ at drivers/gpu/drm/i915/display/intel_dp.c:2547:3:
> > ././include/linux/compiler_types.h:542:38: error: call to ‘__compiletime_assert_581’ declared with attribute error: clamp() low limit dsc_min_bpc * 3 greater than high limit dsc_max_bpc * 3
> >    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >                                        ^
> > ././include/linux/compiler_types.h:523:4: note: in definition of macro ‘__compiletime_assert’
> >      prefix ## suffix();    \
> >      ^~~~~~
> > ././include/linux/compiler_types.h:542:2: note: in expansion of macro ‘_compiletime_assert’
> >    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >    ^~~~~~~~~~~~~~~~~~~
> > ./include/linux/build_bug.h:39:37: note: in expansion of macro ‘compiletime_assert’
> >   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
> >                                       ^~~~~~~~~~~~~~~~~~
> > ./include/linux/minmax.h:188:2: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
> >    BUILD_BUG_ON_MSG(statically_true(ulo > uhi),    \
> >    ^~~~~~~~~~~~~~~~
> > ./include/linux/minmax.h:195:2: note: in expansion of macro ‘__clamp_once’
> >    __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
> >    ^~~~~~~~~~~~
> > ./include/linux/minmax.h:206:28: note: in expansion of macro ‘__careful_clamp’
> >   #define clamp(val, lo, hi) __careful_clamp(__auto_type, val, lo, hi)
> >                              ^~~~~~~~~~~~~~~
> > drivers/gpu/drm/i915/display/intel_dp.c:2506:25: note: in expansion of macro ‘clamp’
> >    limits->pipe.max_bpp = clamp(limits->pipe.max_bpp, dsc_min_bpc * 3, dsc_max_bpc * 3);
> >                           ^~~~~
> > drivers/gpu/drm/xe/Makefile:165: recipe for target 'drivers/gpu/drm/xe/i915-display/intel_dp.o' failed
> > 
