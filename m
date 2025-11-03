Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0744BC2DE8D
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 20:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1C510E468;
	Mon,  3 Nov 2025 19:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UA/BBle/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB93910E459;
 Mon,  3 Nov 2025 19:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762198342; x=1793734342;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZsFWOY28vGpC9dF91R8Yi1Dr2/ZVfwX1z+BMydolG0g=;
 b=UA/BBle/N6wfrMM16tdYbSpf+0tK0b4nZKAV8G4MK7gzUo1z1tB7OL7l
 eShiMdyMnS7ay8C4CYixasDUisnw6XPFyoqkcNMWQPgMZCxzz3jVP2AMB
 6uvokD/Ch8XZPtfdZ02o/RpBu+KUr/sqPCSOBA+lsg6pkyf4Rxp0TYU4n
 xi59zP5LXL36g871PRO4BSCbxo0s4emsNT24oIp1osuqSUlZmFk7PC8Af
 re+XKt8A6qPoLllawNSLrYjWRB/uREUmDWQo7d3jqTUTGzVcwkgdhoMAd
 c5mciufVcUVoNqttMIcIbONbKH8nzA9jnsE7qVkNOtzMBzQnbdoGdZ1GV A==;
X-CSE-ConnectionGUID: vd69KTSGRlWt2OBM50+AMg==
X-CSE-MsgGUID: O5XYQipCQniKN4oxnI49mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68121935"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68121935"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 11:32:21 -0800
X-CSE-ConnectionGUID: koSFyQw1R1mUooTX//yRMQ==
X-CSE-MsgGUID: KFcPLwD6TrOCinKP/ZbvsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187099928"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 11:32:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 11:32:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 11:32:21 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 11:32:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwhQevs8MUf4gngz6rH+DCYbNVsvtXrvEmTu1wbo1HkRAONskz6bZR2MknkBDVZo75yxAF8ha0+bUceKS0BhxVtGAqjBf7cNDvdhakmH/+QHty2mjJwwb7bI+WX3KIQQSY01kgvorw6Q5aGZ4JVJn5kAgmrJxWQsDN7FG5c4qB4v8seqC9zb2c23c6Vf3LmhzJdWG7uyR5KkLyxtA5CpV+NbEroSaLlqT7S6+w1Cx/4TzBNhsGkddYuNlbBhlBBjecSe51Tujk4FUDHlkOFG/p7XDsm2e44lQNY7n3QLeQrZfLntjLgVdbH3Dvwa0yj09XldSkeuL9ZWLbNdanlrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoI4QPUEgCcmwiYosWxgv69YogCRyOHox96ix8V/OAI=;
 b=kYT2OkwEBVcPqb0TO8L+X/J6Mlhtt4/ngMMYoXO6kk72mUvcbJhshDAFnB/rfV0CQPPvz+R4z1W70IwEzBkcPgt6kYIf2B/bbLXbPhfWE1ugJAhKyGXJnNMXXOmKkZwoaXbNImhS4xBSrRXYJP+/KH7pUH6yP4ACTaZQtE8m1Qgo8NneydGBba9ajWSbci/9bU9prFIlp690ba1jlZZqrlfX6ERO6zUwcnMIkzfTeeTpCXxGJLlEd2AmwAQ+RTUhKuk17oOyaIGNlpLZj+LeHYba3ksBEni+vAnKxzHfpk9skWwNORjHKUFFUjCGxi4z3TR7nG5j8vhb/64ZlB7ayg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8860.namprd11.prod.outlook.com (2603:10b6:806:468::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 19:32:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 19:32:18 +0000
Date: Mon, 3 Nov 2025 11:32:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <phasta@kernel.org>, <alexdeucher@gmail.com>, <simona.vetter@ffwll.ch>,
 <tursulin@ursulin.net>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: Re: Independence for dma_fences!
Message-ID: <aQkDPwjMn6ESYX97@lstrano-desk.jf.intel.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <15b2f86e8d6cb1df93edf73001fda2c378926016.camel@mailbox.org>
 <c5ee86a8-3c6d-462b-b435-e25e8a925bde@amd.com>
 <0e7f3ab50a2c30f193491bb82f97004150b99772.camel@mailbox.org>
 <2da2077c-4226-4ba4-8935-e7e15e6b9765@amd.com>
 <aQJ+08BFLtmsM8LQ@lstrano-desk.jf.intel.com>
 <6739aebe-45eb-44a5-a539-209fc3ed809b@amd.com>
 <aQT1lpZJwQmWXGBt@lstrano-desk.jf.intel.com>
 <2f8a4b6b-4b9e-480b-8ea0-35e9293d0b85@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f8a4b6b-4b9e-480b-8ea0-35e9293d0b85@amd.com>
X-ClientProxiedBy: BYAPR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:a03:100::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: e8cd761f-a6d6-475d-0d1a-08de1b0fb335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rk9GWlBOM3U0SkcrWTlPYloxM3N2Z3pQckVLSzM0YjQwaDY4akJDM2VXaHkx?=
 =?utf-8?B?Q1U1QUd4MXhIU1pTc0NmOG5yRmdnSmR2dWwzaXBQTEJQcm5iSVVZR3NXd25k?=
 =?utf-8?B?QkYyS3RXUEh3aEw4SnAzejZJWlpveU1SYytSZmtTaE5OTUdPOWlnbmszUVZp?=
 =?utf-8?B?Ni9iMmxpcExkWEp1T0JsRXJJVmtRQ2RTcTFGZ1c5dWcxdHdPUGhRaC9uMnVm?=
 =?utf-8?B?WWJaS0U0TEVWODlGcmxjczZudis2a1NleU54bmxpM1pwUElWbDVrWmxmcGlC?=
 =?utf-8?B?NzZvaFZxck55TGh3SEF6OEs1RjVuRVppRjZwOElqaXJXVmFTMitwRDBEODNX?=
 =?utf-8?B?NzVNQTBnNFh0NFlrSnYyQy92YTR1U2FMUkV3SDd3QWNxbTJNcUdVYkw0V2hx?=
 =?utf-8?B?clg0dzZkeDRlVVJDVEkzdjZ2azRUN2k3Z2czOFM3QmIxM1VCVU54ZGhQVkZh?=
 =?utf-8?B?U1ZSQUkzQldzRGNhUkFyVTM4ZGlpRVhzVThTVzU2Q0NTZlcxaDlZVG9Kbis0?=
 =?utf-8?B?dTFBdFJueDdlVUxLR0xmMTUrYmpXcGcwZDU5NkJwYnVlZ0Q5UldzUVZ6TldX?=
 =?utf-8?B?ME9FVE9udVZWcnA0bUpGdXFjWnBoUnlFQktYa3ZHdHptd2V5SDMvVUM5UXRN?=
 =?utf-8?B?OFM3UWhYRFVzTFpzWmJGZ0pwVDk5bENFYUNvNjlLQkN0RkhVTVZMUWtleWFy?=
 =?utf-8?B?cUNoNHY0bjlldmpaTmYxY3hMTDBiUzl1RnN4NFQ1bTNKSjFMNXVFV214TnJD?=
 =?utf-8?B?WjlSaUFjVTlaM2RhcHBETFJIL3FZRVZ1bHphTmIxekxvdElwSE1NNlZoV0dq?=
 =?utf-8?B?YXVmajBDT29CeVZiM1JET2ZYUHJsUHUxdTI1SFlHaHlZVi9HWjgxaVpMODZJ?=
 =?utf-8?B?R1pJNVB2cWpnYUpQUmhJSGxVdVNualhwbEdadnBQMnlSK2gzVTJqS3htOW9R?=
 =?utf-8?B?ZklGM3JoZUJidW5TMjBXN0x4ZnMwMWZ2TjlWckRVNEx2YmdjeVdqQlErNGpG?=
 =?utf-8?B?MC9PVFIvUmczTitrUTQramNOWmUzMk40aFp2NGRtRFdtZ1JSeHI1R1oxK3JD?=
 =?utf-8?B?ZDlGbW9yVHg0UXlsaUtFdlFSR0pFNWJ1eXp5S2ZUZW1BMTBQL05ucU15Snc0?=
 =?utf-8?B?RHVOOXg1Qzh2L245eUJwV3Q5czZ3QnV2c0RtZ0pKMjJ6bFVkaGdaMHBqdHJx?=
 =?utf-8?B?dXI4Z1h6djlCWGZncWlINjFpc1UydGtQZUFoOU5EK25LMXN0K29XRnV6d3Zs?=
 =?utf-8?B?Z2dKamF3ajZ6dmY1THNlTEs1blJkQXRvNzF3bHdvRU9mZDJwRUFaTG0wRWFR?=
 =?utf-8?B?RVhHcHRzaTJZYzJZamp4M2wwaDhBSmRIOGxhYU82U29YMzBERzNhQlBMbnZy?=
 =?utf-8?B?bkdnZFUvMVg0eDRMUUZSUWJacXFtMTRSOWJhVTVMSW1nY1dUYmtZK1dpT1l3?=
 =?utf-8?B?ck9KVjhKaFVGdGlibXd1Yk50REs4LzU0Vk9lSUwxTWxiQmZYeVB2Wms1dm9O?=
 =?utf-8?B?WUlyZEdKaTBXZThhOFZvVFA3YTg1Vk9LL1hMQjc2MmhMVktUS1FFa0dpb2lS?=
 =?utf-8?B?T2lOQjJWbnpRd1psaGx3SXZZN2hURzd2blR1dzNRNkpOV0NKeVdCT2wxaEFq?=
 =?utf-8?B?Y1Rud3NWT0l2VGhEcVdqSjVTcEI4b1Nrdy9PKzFrbGFPR1FxUTdsVFZjcExs?=
 =?utf-8?B?M0JqdWFJME5ONTczRzJXNWdiWlFoU081VkF6V0VvTU44Vk0yWGY0dzlmUzZK?=
 =?utf-8?B?RXVLRkx0Yzl3d2NRWjdUUlNlVGtSUU9OeE1vbmxXRkhBNUxHNlRNRFJXYm9p?=
 =?utf-8?B?NU1lb1ZQTnU5TUhpYkdXUFQzbXptT2N1QyszNkdVWjhyV1BBL1R3eTNLc0or?=
 =?utf-8?B?cCtha0xZWjlLaUFUL3JZQ3grS25WOW1lclZ5TWlsa2pPNGxiM2I0MGNNbGZ1?=
 =?utf-8?Q?siU7oJ9iAoYLd01/6xpVh1Ggh8tXvEZC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEhVN0ZQUEZ5TDJqaEIySnRLQ3RHd1FKbXJDaU5wLzF6OFE2SktIZjl0UWIr?=
 =?utf-8?B?L1M2ZlFObDhXblRRMWJQMU1lTUdEbUI0Y3FXQ0E4U1dCU2xCZnE3bkxwY05v?=
 =?utf-8?B?Tlo5NURYanlxV0JiakhaV0syVklHMlFkcXVoMENEZk1ZNXl6M2RXRWFRRk5N?=
 =?utf-8?B?RmQ5aWdpZFI4K2dHV1ZKV2FzNG5oZFFHUnAxVWVydUMwQzlYME8vRGhVZi94?=
 =?utf-8?B?MHgwZ2xGRERUWHhydlJHeUdwOGVMaDM0bjlYY0YwM3RubUg0M1NsaFRqTlYy?=
 =?utf-8?B?cy9pc3dIYW9NZHE4Zm1TbGliSWpWb2NxMWwyTExwR3l5ZkVmMDJLcldkU21J?=
 =?utf-8?B?eStHRUo5a2VCYlhsa3g4enVuYzNMN0JFSi9qRDNnQk5iK24wNzViWmNpaE51?=
 =?utf-8?B?Vis2MEw0U1huT1RYSi82eTBZL0hYd1JrN0NnMHFtbXNVaWptR2kzOTZQb05Y?=
 =?utf-8?B?a3ZZVDg5V29KczBZd0ZVd0tMRFdWYVJTMVplbFBYaUVjeWtncWlGdkNhcCtm?=
 =?utf-8?B?M1dRdlZaQ1RpZmQ0R0lzajJDdUtiMzdkV1czb0ZFNDF5dXdiMkpqZ1MycHY4?=
 =?utf-8?B?elBHNVJNSmxkUGxWRm5NN0VpWit5dmErdkNXMEFPY0R1ejJEVWJGeTMvdXFM?=
 =?utf-8?B?c2ZlV09EWFJVVjZRdU1MUi9pMnJhODVLc0M4M01haC9KVFNWejEvU3ppNWVt?=
 =?utf-8?B?MUFncFl0Q0lkRHluS2RlbzJLZjdJb09Jd1NYZVAwUnRrOHdsVnEzVE95WjBB?=
 =?utf-8?B?TFNDanhHM3J1M3EwR3ZBbFhmTlU5R0txNFNkYUExOGZUelVWUmwwbFJWZUtt?=
 =?utf-8?B?MWZMV055enFxTkxVQlBqbmFVSXRSOURoUTN2MFhWZUl6dnRVZXRkendudlIw?=
 =?utf-8?B?NWRrbWE2Z2w5Q1ZjMXVaSG1EbTJDKzJJVFhickFlRHdPV1FJZUlnYzkrYXRW?=
 =?utf-8?B?TVZyR1RRTFBUZmJhYTVQL05DbzRReWRiOFczWGtPcEpXTnZmZVowek14YTFC?=
 =?utf-8?B?d0N6dk1DQ3lGeE16K0VMN1FXUGJ3UHlkS0FaSnUwNWcxWFgyUjZDZlBWTTJr?=
 =?utf-8?B?Z3V2dzBaZXFidkU1cjAvWlBacTgwdiswZkNwbmcvbnp3Y1ZWaU1FY2gvZStQ?=
 =?utf-8?B?czBTZFNwMXlxTHBEUlJUOXF6SHhNNjdQQUhyYlAvOEdvemxRY3UrNGMzSklB?=
 =?utf-8?B?TGtmMDdxQ0lQOHNaMWdjNDhQT1RXdWRLeWRNckxnam12blJmSmo0Z3VFdnNk?=
 =?utf-8?B?YU9PS0doS0EzdmcxVTNSaHBlWWY4RVZiOUI5N1RKSXNDdXZOVnNGWkdsQjBI?=
 =?utf-8?B?bVJVbERja0dkdDlPeXFheWU5L2YrWWppc1ZYcEpSR0hxdFNoTDc4YXc2SW1Q?=
 =?utf-8?B?bkYwMDNORlo2ODhwQ3J1b1FkTHVyWXFlSkpLMWFnRkxYOHE1eVd6ak5qQWZV?=
 =?utf-8?B?Tk1KRkZsM2FHRkMvY3Q1Ni9oTVhJWUJFSDBaVm5rQ3h1c0E2dDZ1bmZDUU1p?=
 =?utf-8?B?dkdGdnY0MUhhUTkwRXRhM0duRHBEWnpSclpQUnZHenByeERXWFd1ckN0M3dB?=
 =?utf-8?B?VGRvM0dJV1ZBNHF5eUg5YjlzUTdRak1uMjh0VCs2eE9DbUFvT3FnaTh4MVcy?=
 =?utf-8?B?WStQeUwxRFVDSWVtUkQvNy9rWmF5UG9DMCtseDJiTGhoR0lueGQ0WmZRdjJa?=
 =?utf-8?B?MHFobFk5S2hYcVZyUW5yaEV6MGduT0RtMDNORXFxcndNMEF5UVdDaEZuTkc4?=
 =?utf-8?B?elpMQjNaNUJrc0NXRGJISW1iNEM0YWhEN2puZHJ0Y0hsQ094b3NEVU9HdXRk?=
 =?utf-8?B?V3JDQ1ZBNE1Qd3RYYTFjaVpSL3J4ZWptUSszYy9PeWgrSUJERHBqQlJZZVdi?=
 =?utf-8?B?NkpBM25yMFA1Zk1ucWtucmhjdi9FVDI1dEFyZkNyMnJaWjRwMWczSHhhMS9R?=
 =?utf-8?B?eDBKNHd2TitMeFN5TFpGQ1ZkNDBOaFp0RnpCMGZwcERxZW1HVUlSR3QweDF5?=
 =?utf-8?B?akFrSFEyRGhmcDN2SEpFK2twekpjMmNDdmJrdk8reVZuNnNSeGNnTDdnbkda?=
 =?utf-8?B?WjFpTy9XK1pVRUoxMTdBK3hVNklKVDFSbGt6bURpUXcrcmtCTm14YkJKbjM0?=
 =?utf-8?B?RVJvWVdqZVRzOVZzYlpRMU1FK3YvSWM5dE9uU2FaYUcreWRYS1JMK1FPb2pu?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cd761f-a6d6-475d-0d1a-08de1b0fb335
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 19:32:18.4329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXSiCw9MErvFNdHv0VCARJdK1XHUarywzssCokzT+ewgq6HsmQqlhc+P5HuKA88FBGu6Tr0OzIxnL0Y1mJYrmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8860
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

On Mon, Nov 03, 2025 at 12:43:32PM +0100, Christian König wrote:
> On 10/31/25 18:44, Matthew Brost wrote:
> >>> Not to derail the conversation, but I noticed that dma-fence-arrays can,
> >>> in fact, signal out of order. The issue lies in dma-fence-cb, which
> >>> signals the fence using irq_queue_work. Internally, irq_queue_work uses
> >>> llist, a LIFO structure. So, if two dma-fence-arrays have all their
> >>> fences signaled from a thread, the IRQ work that signals each individual
> >>> dma-fence-array will execute out of order.
> >>>
> >>> We should probably fix this.
> >>
> >> No we don't. That's what I'm trying to point out all the time.
> >>
> >> The original idea of sharing the lock was to guarantee that fence signal in order, but that never worked correct even for driver fences.
> >>
> >> The background is the optimization we do in the signaling fast path. E.g. when dma_fence_is_signaled() is called.
> >>
> > 
> > Ah, yes—I see this now. I was operating under the assumption that fences
> > on a timeline must signal in order, but that’s not actually true. What
> > is true is that if a fence later on a timeline signals, all prior fences
> > are complete (i.e., the underlying hardware condition is met, even if
> > the software hasn’t signaled them yet).
> > 
> > Could we document this somewhere in the dma-fence kernel docs? I can
> > take a stab at writing it up if you'd like. This is a fairly confusing
> > aspect of dma-fence behavior.
> 
> We do have some hints in the documentation about that, but nothing which clearly says "don't expect fences submitted in the order A,B,C to also signal in order A,B,C unless signaling of each is enabled".
> 
> Were could we add something like that?

Yea, let me take a shot at writing something up.

Matt

> 
> Christian.
> 
> > 
> > Matt
