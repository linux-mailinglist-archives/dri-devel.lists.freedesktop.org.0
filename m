Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F532A5DFBA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 16:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA89110E2F3;
	Wed, 12 Mar 2025 15:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuPJPeVG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AFB10E2C5;
 Wed, 12 Mar 2025 15:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741792014; x=1773328014;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RikaeuQAI5nmgeMDi4GGaLG8s5Hxkz1VZ0SJ7uhupbM=;
 b=NuPJPeVGo9vH5zEZSwCb/YacWaHgomYRe1qtCzKkTuCrzWaAWFFssyVm
 f5xxOR2Yb6Qzf1KIAmMXks73FMNl5l4ntUhUpoR5r5lHRLJQzsU4pYc8b
 Jb1E5/7vgg2jrX0obPvYDROd1sVlhk8ByX1TOxCRURnyftlihEV/wXEdZ
 o50Pm+ky5rR8TIBhRywaBuKwcAkMcEVZwFXYnnQJvY6BgX/FDNgHcPL/z
 GY2fakRWvcVshF2jMrA/BUwV+id+yCTsFjxy9hbi/x5cix58A9cFx0jn0
 and0We9zWVELjr/HUSLcAwLPj122SeHTevOcfqRtA4APWdPssusze86hW w==;
X-CSE-ConnectionGUID: shr1ROXcQLGjwFVf+9p4AA==
X-CSE-MsgGUID: zo2J0kAdRKOPXe00PRD3sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="30459046"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="30459046"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 08:06:51 -0700
X-CSE-ConnectionGUID: tWREvQaNRxSk23WBMRpPLQ==
X-CSE-MsgGUID: Aydj/25QR0GCOkGjkAIfsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="157836700"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2025 08:06:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 08:06:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 08:06:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 08:06:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sx4n+VxGTBMjAfqZqsCFAvfXPsnW1jwU5+1Xe/925ChxudWd+WJVElLGqCNh60Ix8dYDAIFu9sAZrI+GRpYmWOecefIX9R1jyv7+w0djoco8vZ7jToTk+V7i+ilKkEG+xEw2JFr+olejcuXH8Ds5eWQam9KUGGOf6O4/Am1gEPCTcO/Dcmov9ClUsCCY7utmo9xDOuDdHTPNF0mG5zErXvGyIZdQ8/LMBq9plmvK6zlLgwGeGZhcV7ONQDF68hfPUdBl3lyqGubY2BOk/I6tAZJi40mTcjLOnHkirw3uBYps4RUqGKjAD7+PgR430olGeBxfEGOXGzPpgFSRig919w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUnE488cPShh0q9S1h5gsQD88u3TMBDsCqUQmMiuA2E=;
 b=FcwfRFNHQWnPJEf363yPFTftlJxvY8CAJd2RUAE0rjfYagjsr1wSIRESCQMCuDGAiWp4FD/7ZXqxSXxPgEkLccyaQS1OTwMA0yq6jyRZTF6Mj8dKfULrFWDk6YWtzgiEM3L3lICKPp/QWLSFz48ZO0owYklBiDcUHafjBE3Fo4WzKx0KtWSb8F4+Lz2v4MWIfpa0O8UgbNBaGq0SOy9dVp49QQdHH9Mo42Is7e26BpnEtOg1nSPl8zeuLMioDNlRXcYWecwDKVP/o9VWYx7v/abw8AyFvMu8cXGeuf0+8kgXX7F/jpQTYnadGtbIVMezuH9DvLe/lhVe5DyS/VqVgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by DS0PR11MB8761.namprd11.prod.outlook.com (2603:10b6:8:1a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 15:06:32 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 15:06:31 +0000
Date: Wed, 12 Mar 2025 16:06:15 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alan Previn <alan.previn.teres.alexis@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4] drm/i915: Fix harmful driver register/unregister
 asymmetry
Message-ID: <bqek2zam4zle4ilp3fcce4tnkocqdj7vfczvpswr6sswjbn3kr@a6pmh5uofyf3>
References: <20250311200550.637383-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250311200550.637383-2-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: VI1PR04CA0058.eurprd04.prod.outlook.com
 (2603:10a6:802:2::29) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|DS0PR11MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: b6568606-219d-4b24-f325-08dd61777904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVE0YVdqZXVRM2haRUtQRWtQdkMrMXlyQTVzTTZZYU5GOHJXdjIwdktZblBa?=
 =?utf-8?B?S1g3QkdNMU9zVXN0Vmt4ZiswanRsbVkwMU52VGtlcWl2bWFQUUJqQWxVTS9L?=
 =?utf-8?B?WGlJc3VhOGtLY0Nkcm90S1BnKzEwUTMvYXMvSVJhanI2d1JzRVFMcDg0UTFj?=
 =?utf-8?B?Y1BqZ2lUanJVb0FLOFhXUzFQbWhzbDlvS2UxUzV4WFM3K2wxSVpQcERXMU9J?=
 =?utf-8?B?Vm9HVGZFQzVtVmpaeS9RZXVhMmhiTXo4a1NoTlhZVFh2UEhRZm0zODB1bllS?=
 =?utf-8?B?bzl2WlZRU2dLM3IxTWtZRnlXTTYzdlA0U3BtVisxSFBIK3VXOEdmbzRmWWdQ?=
 =?utf-8?B?MHlsOEhDSk5RbzR3ZTBhMW4xOUlQdGpvcVR0V0kxRlNUNG1PQ0pXUktobDJu?=
 =?utf-8?B?YUVsSHpMNjgzakF6bnJ4cG1YUk9RVzhseGRUQ0hOc3Yxb3BUeENEUi9yYjJ0?=
 =?utf-8?B?aDdTNVBRRzJQN2Z6TGNiYytOMHBoY3N0UnJZS3FHZmwzbjZFaitOT1R6cDZj?=
 =?utf-8?B?OHJtUjFmNlNrdmUwcVB3K014a3V4STRrRHFYeER2aFhpc0pNTWs5WlZoSlNs?=
 =?utf-8?B?bC9NRUhta1VFaXpxQ3EzMmM0U2JLRzVNT1lSM3V5QXorOGJOWUFKNWFpUjFD?=
 =?utf-8?B?VjZ3NjJ6clpkeG82R2FxWDZPSzMvL1BMRGllZC9nWTJmVWh1VW4rWnNDN0N1?=
 =?utf-8?B?d1U4VnhpeS83VE84NVhCRTdGVENJMzg0dEF2bnRGMEkwZVBSbDFtTWROQVdy?=
 =?utf-8?B?VXgxUlpvdUwvdGJIRVo5bGFIalhSYXJhL3hiUEFLa3R5TVJMQXgxR29pVTNE?=
 =?utf-8?B?Rzg1LzZZMFlHODF5YVRaU2ZweGhVdzhpM1pwSWZFenFZWHp0SlFzdDc0OGRN?=
 =?utf-8?B?WnFGdGVtbGUzM0pQYlgyd2pjYjVhcnN6MzZPdTRIVjVSbWZwNzZ0eHE1RDFP?=
 =?utf-8?B?T09OeTNGNzBvV0ZPRjV6ZmljZzdUNndNNGVDNmpyZHlxSTN1VjFwZ1FCbGd3?=
 =?utf-8?B?Yy9yaCtzbC9jUFZHU3VuOUJHbzd4U08zcW5idzdxem0zSWI5OVR3OEdwQk1I?=
 =?utf-8?B?d3hub0xtbTZRRWRsd2plb0lNWlhWL2N1LytCTllhcFVtTENxek9ZWGNhc1Rr?=
 =?utf-8?B?TU9yZnhuTEdENXlsUHg1MmdkcWVVOXNma3dQb1lNbVhJU3c4bTVNSXk1eUQ5?=
 =?utf-8?B?anVzdWw5MVRETFJXb2Z0L0hrY1Q4eVFEZjNiUUplNTdiU0RQNTVrdFgzaVhQ?=
 =?utf-8?B?MlVlZkJ2ZnF6WkFYMUlESnpIL1AwZFJ3MlQrSU5OTmNSTEd6b0hvTGVBbS92?=
 =?utf-8?B?K29xT2tsNTNuTHlsc2JSVWFITEJCL3lYclYrdU94dFFrZFlVN2lxS29sMXh0?=
 =?utf-8?B?MUgrb1dBNlFRZ1JlekVkUGxvMEVXZGZtZEk4L1ErWnU2dlc3UldHTDFDVmty?=
 =?utf-8?B?QkhPY2E0QitjQndXdk5Wd0YrRkJ3Uk9HbnFwMUVReWJjeTM1WWJxdU1EY1RZ?=
 =?utf-8?B?bkd0WFZ6ZzZMb2k3d1JlRmx4RXVXeGgweWEvVWNrSU5lSDNiZXR5aFNjNWNB?=
 =?utf-8?B?VFNrSkM4Z2Y1YXN5MTg0L0VDWitCUGZqdnRxN2RpZ0tjekNMTWFJdDBJTmdi?=
 =?utf-8?B?MmR6N2E3aENXSldaQkpweUVjVVJTRWlyWlk3UTdZc1FHbTVTSVIwcHBTM0d2?=
 =?utf-8?B?SmcwZndDYmNyQWo2QUpvZHA5dE1VdkFrN3kyaFN3SUQ5SmhJekxjMzdIN1lP?=
 =?utf-8?B?bTVGdTBHSzNHMllFcjRXR2RZYWtUcWZnWWU4T3gxRm84Mys3Q0ZiYW9KcDll?=
 =?utf-8?B?SXk2YlpTN0I2SHNtSXAwdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDJJY25teWwzOG96OWM1VVE1SkV4aVJPTU44bksvOXZiKzU2RkdlVkcvd1pP?=
 =?utf-8?B?WFhudU56Z1JZdjRBaU5uY1ZvU2l1SktHM216L2d0b2MrYkdma0dHYncrOGo2?=
 =?utf-8?B?L0xJSWJJYVlPU0ZDSHZlWEdnWDJCTXhvcGdkdE9MbmRoRmkyMlZTUXIxeCt6?=
 =?utf-8?B?QkpJYmNJZjg2QW91SGIxTDRMbUZwVk1TQWEzVG1GT0hsbzRwU0RXeWh5bXdw?=
 =?utf-8?B?cmg3RmYvR2xId0JXaHlEdVJ1WHZnNjVveVBNcFpJbjEycTlRa2diUTVkc1JG?=
 =?utf-8?B?UTJ3SWhqWkc4eEp4VnJIT1RWS0cyTGxDSnhmZVJmNXZ5eFpYSDRtS254NmF0?=
 =?utf-8?B?NmMvNUVlb1lZdzJ4Q240bm5OTjhCMXlPWUlPUWNNaHRBVVBGNXg0b1d2cEg4?=
 =?utf-8?B?Y0FBUDNVNkRiVDBsbzF0VWIvK0RuL1dHbGFhdjV4dFgyRVE1emltK0FRd3Jk?=
 =?utf-8?B?TUx4UzlFZXdEOG50MDgyTVJoVGpjbEZUek9YNnA0VVNZKzJtc3hRNVBXQ1gx?=
 =?utf-8?B?TGZQTHhPY2pZSk5FMG40MlJzNFdYVjI2M3V2c21rbWdtaWRVTm9qcGk0ams0?=
 =?utf-8?B?OXhlV0lRYlRUZ0pYdnJqN1RnTUxjZnZKQ1A5YURzellwOWpiaDhVaWdNWUpH?=
 =?utf-8?B?a2wxU1ZMYmgzVzhPcVNMV3BEc0hMYnUrVVdEQ2dkSHM0YUU2QkJMWVFLRFdH?=
 =?utf-8?B?dU5uUnNqWGt2c2VKci8wa2ZHTWdmbFlaM20vQU9TQUVoQ2Q4T3dLZnpHUDhR?=
 =?utf-8?B?cVRxY0FhaXdZbi8xeks0TVFVRHNoRFNlZHFEL2hIalFWKzZNRGgra3dyRzVM?=
 =?utf-8?B?SW1la3daa3FvWitxUDN4NFYvcjFDc0VmWTg2bkRKbWE0MllGVGR3ZExVK1k1?=
 =?utf-8?B?ZVN2dmt0Zm93ZVNPN0M0dklIYlpnSjNPakIyZUp2eEl0MFVCOEZJNHp1bVFu?=
 =?utf-8?B?UnpWNGgxdHJpckQ2cjU3OFNBb080c0wza3R5TjNmTnF6OXIwendJNUdVU0JW?=
 =?utf-8?B?SFJ3U09IWnFHL0tVTFFXYkZNY2Z4TDlhMkxxOEZTcG1jVHJndVhxZ2ZtS2g4?=
 =?utf-8?B?Y1RaNGp0aUd4RWxiQUF4QTRiYXhFNG1ZRW9hSjZESjBiQ1JnQ2hjMjlFSXRE?=
 =?utf-8?B?R3NycXpMZ0JxZEo2ZmowcEF6QVk1c2pPUnBycEJxRmNwdDRRZjZqYyt5T3V4?=
 =?utf-8?B?djFPU0lEWjhlSGZHcHMvVU9wY2hRdklzUi83K3hVTDZDWCszQ3dxVDJvaFBa?=
 =?utf-8?B?a0hqT2YyUXBrNmVtL2VLZHhqNis0N0t3RzBISjhmbERNOE0rYS81VmNDVHkv?=
 =?utf-8?B?UWhaUVp5UkRqUkdLL2ZmM0RvSDd0czBFM2FsbndndTlzL25DeTRwaHB4OHpl?=
 =?utf-8?B?UmVkcmtNWTRTV2NWaE03bUF5VHpMb2pzb09QS3BkUmtRNUd5eEd2aVpMRWVY?=
 =?utf-8?B?OFJyVHIwblhzcWhOb2VrTWM5NWJYOUpsSjB5c1hhZS9oeXU2eEVTRW5OUG5W?=
 =?utf-8?B?bnJZb3gzNWJ0TTlkRG5mdjBXQU5OQi90VSs2aHB1a3Zpd0toUHVoRit3dTQw?=
 =?utf-8?B?Z25WekxxVlZQQWU1dXhuU3lwQUlNcmJtTVBYSlducTFwY2MrYitpY2xtbitT?=
 =?utf-8?B?QXZVU2JHUDNnNFkxV1FvNTd1bHNIRU1YQzBEYjJiekNOYys5MVl2eVQ2Zkxz?=
 =?utf-8?B?ZG10UDgzOGNxdEFZalVUYllBbEJkRXZkeHg4QVIzOHNBTElJWjA0UDVVUUtJ?=
 =?utf-8?B?WnpERE9YbHNVNVFUSFdTcmNEY2hrN252SVArcjdETXFLSGRWT240anB2ckUz?=
 =?utf-8?B?SCtYUEs5aElqdFMxR3h0SXd0TVd3RW15U0F4SDdnczdoV0RSU2N3OHJiMmZn?=
 =?utf-8?B?YmNXckJGdjRDaUxjVVU1TUFscFVzK3FGY01QVWlYL1ZzNEpHT1QvVFdhRFp2?=
 =?utf-8?B?L0Z1OUYyQ0oyNC9zdmM5WG1IOFYxTHJGUmZkZzVrQnRLNzN2ZzhFNk9xYnh2?=
 =?utf-8?B?UHZOYlJkM1VjOXU0MEpkS1c2UE9QOTl5YzFTeDlxbWd2dHpBcFZCYVVabVFu?=
 =?utf-8?B?NE1lT2dNY2FNZjNBYjYvdE5oanVpSmhPNkp4RWF6ZS9mbThreGZlR205RTAz?=
 =?utf-8?B?R2pKYUhRUjJjcFBVRVRmME1pbTl2SUpURWpjcnJuaEVoWkVCeWJrUmVTMXJa?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6568606-219d-4b24-f325-08dd61777904
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 15:06:31.8923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLwyvz2JtwNikL2oqDH9eccZiMqE+k8ptfShnViIH8EWqpEfE520Ao7nmtpoyqnwwK2QQehUFEzFu6bVYdv4Jj5VbcyWlqaphlvzQOnPSlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8761
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

On 2025-03-11 at 21:04:56 GMT, Janusz Krzysztofik wrote:
> Starting with commit ec3e00b4ee27 ("drm/i915: stop registering if
> drm_dev_register() fails"), we return from i915_driver_register()
> immediately if drm_dev_register() fails, skipping remaining registration
> steps, and continue only with remaining probe steps.  However, the
> _unregister() counterpart called at driver remove knows nothing about that
> skip and executes reverts of all those steps, with some of those reverts
> possibly added or modified later.  As a consequence, a number of kernel
> warnings that taint the kernel are triggered:
> 
> <3> [525.823143] i915 0000:00:02.0: [drm] *ERROR* Failed to register driver for
> userspace access!
> ...
> <4> [525.831069] ------------[ cut here ]------------
> <4> [525.831071] i915 0000:00:02.0: [drm] drm_WARN_ON(power_domains->init_wakere
> f)
> <4> [525.831095] WARNING: CPU: 6 PID: 3440 at drivers/gpu/drm/i915/display/intel
> _display_power.c:2074 intel_power_domains_disable+0xc2/0xd0 [i915]
> ...
> <4> [525.831328] CPU: 6 UID: 0 PID: 3440 Comm: i915_module_loa Tainted: G     U
>             6.14.0-rc1-CI_DRM_16076-g7a632b6798b6+ #1
> ...
> <4> [525.831334] RIP: 0010:intel_power_domains_disable+0xc2/0xd0 [i915]
> ...
> <4> [525.831483] Call Trace:
> <4> [525.831484]  <TASK>
> ...
> <4> [525.831943]  i915_driver_remove+0x4b/0x140 [i915]
> <4> [525.832028]  i915_pci_remove+0x1e/0x40 [i915]
> <4> [525.832099]  pci_device_remove+0x3e/0xb0
> <4> [525.832103]  device_remove+0x40/0x80
> <4> [525.832107]  device_release_driver_internal+0x215/0x280
> ...
> <4> [525.947666] ------------[ cut here ]------------
> <4> [525.947669] kobject: '(null)' (ffff88814f62a218): is not initialized, yet kobject_put() is being called.
> <4> [525.947707] WARNING: CPU: 6 PID: 3440 at lib/kobject.c:734 kobject_put+0xe4/0x200
> ...
> <4> [525.947875] RIP: 0010:kobject_put+0xe4/0x200
> ...
> <4> [525.947909] Call Trace:
> <4> [525.947911]  <TASK>
> ...
> <4> [525.947963]  intel_gt_sysfs_unregister+0x25/0x40 [i915]
> <4> [525.948133]  intel_gt_driver_unregister+0x14/0x80 [i915]
> <4> [525.948291]  i915_driver_remove+0x6c/0x140 [i915]
> <4> [525.948411]  i915_pci_remove+0x1e/0x40 [i915]
> ...
> <4> [526.441186] ------------[ cut here ]------------
> <4> [526.441191] kernfs: can not remove 'error', no directory
> <4> [526.441211] WARNING: CPU: 1 PID: 3440 at fs/kernfs/dir.c:1684 kernfs_remove_by_name_ns+0xbc/0xc0
> ...
> <4> [526.441536] RIP: 0010:kernfs_remove_by_name_ns+0xbc/0xc0
> ...
> <4> [526.441578] Call Trace:
> <4> [526.441581]  <TASK>
> ...
> <4> [526.441686]  sysfs_remove_bin_file+0x17/0x30
> <4> [526.441691]  i915_gpu_error_sysfs_teardown+0x1d/0x30 [i915]
> <4> [526.442226]  i915_teardown_sysfs+0x1c/0x60 [i915]
> <4> [526.442369]  i915_driver_remove+0x9d/0x140 [i915]
> <4> [526.442473]  i915_pci_remove+0x1e/0x40 [i915]
> ...
> <4> [526.685700] ------------[ cut here ]------------
> <4> [526.685706] i915 0000:00:02.0: [drm] i915 raw-wakerefs=1 wakelocks=1 on cle
> anup
> <4> [526.685734] WARNING: CPU: 1 PID: 3440 at drivers/gpu/drm/i915/intel_runtime
> _pm.c:443 intel_runtime_pm_driver_release+0x75/0x90 [i915]
> ...
> <4> [526.686090] RIP: 0010:intel_runtime_pm_driver_release+0x75/0x90 [i915]
> ...
> <4> [526.686294] Call Trace:
> <4> [526.686296]  <TASK>
> ...
> <4> [526.687025]  i915_driver_release+0x7e/0xb0 [i915]
> <4> [526.687243]  drm_dev_put.part.0+0x47/0x90
> <4> [526.687250]  devm_drm_dev_init_release+0x13/0x30
> <4> [526.687255]  devm_action_release+0x12/0x30
> <4> [526.687261]  release_nodes+0x3a/0x120
> <4> [526.687268]  devres_release_all+0x97/0xe0
> <4> [526.687277]  device_unbind_cleanup+0x12/0x80
> <4> [526.687282]  device_release_driver_internal+0x23a/0x280
> ...
> 
> A call to intel_power_domains_disable() was already there.  It triggers
> the drm_WARN_ON() when it finds a reference to a wakeref taken on device
> probe and not released after device register failure.  That wakeref is
> then left held forever once its handle gets lost overwritten with another
> wakeref, hence the WARN() called from intel_runtime_pm_driver_release().
> 
> The WARN() triggered by kernfs_remove_by_name_ns() from
> i915_teardown_sysfs()->i915_gpu_error_sysfs_teardown(), formerly
> i915_teardown_error_capture(), was also there when the return was added.
> 
> A call to intel_gt_sysfs_unregister() that triggers the WARN() from
> kobject_put() was added to intel_gt_driver_unregister() with commit
> 69d6bf5c3754ff ("drm/i915/gt: Fix memory leaks in per-gt sysfs").
> 
> Fix the asymmetry by failing the driver probe on device registration
> failure and going through rewind paths.
> 
> For that to work as expected, we apparently need to start the rewind path
> of i915_driver_register() with drm_dev_unregister(), even if
> drm_dev_register() returned an error.
> 
> Also, in rewind path of the i915_driver_probe() we need to clean up PXP
> initialization before it's safe to call other hardware cleanup routines.
> The intel_pxp_init() without a corresponding cleanup was added to
> i915_driver_probe() with commit f67986b0119c04 ("drm/i915/pxp: Promote pxp
> subsystem to top-level of i915").
> 
> v4: Switch to taking an error rewind path on device registration failure
>     (Krzysztof, Lucas).
> v3: Based on Andi's commitment on introducing a flag, try to address
>     Jani's "must find another way" by finding a better place and name for
>     the flag (in hope that's what Jani had on mind),
>   - split into a series of patches and limit the scope of the first (this)
>     one to a minimum of omitting conditionally only those unregister
>     (sub)steps that trigger kernel warnings when not registered.
> v2: Check in _unregister whether the drm_dev_register has succeeded and
>     skip some of the _unregister() steps. (Andi)
> 
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10047
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_driver.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index ce3cc93ea211b..dcf723da8d409 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -622,11 +622,11 @@ static void i915_driver_hw_remove(struct drm_i915_private *dev_priv)
>   * Perform any steps necessary to make the driver available via kernel
>   * internal or userspace interfaces.
>   */
> -static void i915_driver_register(struct drm_i915_private *dev_priv)
> +static int i915_driver_register(struct drm_i915_private *dev_priv)
>  {
>  	struct intel_display *display = &dev_priv->display;
>  	struct intel_gt *gt;
> -	unsigned int i;
> +	unsigned int i, ret;

drm_dev_register() returns int, i915_driver_probe() expects int from
from the functions it calls (including this one), and this one is
defined as static int, so dropping the unsigned keyword for ret feels
more appropriate.

>  
>  	i915_gem_driver_register(dev_priv);
>  	i915_pmu_register(dev_priv);
> @@ -634,10 +634,12 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
>  	intel_vgpu_register(dev_priv);
>  
>  	/* Reveal our presence to userspace */
> -	if (drm_dev_register(&dev_priv->drm, 0)) {
> -		drm_err(&dev_priv->drm,
> -			"Failed to register driver for userspace access!\n");
> -		return;
> +	ret = drm_dev_register(&dev_priv->drm, 0);
> +	if (ret) {
> +		drm_dev_unregister(&dev_priv->drm);
> +		i915_pmu_unregister(dev_priv);
> +		i915_gem_driver_unregister(dev_priv);
> +		return ret;
>  	}
>  

I'd keep the "Failed to register driver for userspace access" error
message.

Thanks
Krzysztof

>  	i915_debugfs_register(dev_priv);
> @@ -660,6 +662,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
>  
>  	if (i915_switcheroo_register(dev_priv))
>  		drm_err(&dev_priv->drm, "Failed to register vga switcheroo!\n");
> +
> +	return 0;
>  }
>  
>  /**
> @@ -834,7 +838,9 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (ret)
>  		goto out_cleanup_gem;
>  
> -	i915_driver_register(i915);
> +	ret = i915_driver_register(i915);
> +	if (ret)
> +		goto out_cleanup_pxp;
>  
>  	enable_rpm_wakeref_asserts(&i915->runtime_pm);
>  
> @@ -844,6 +850,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	return 0;
>  
> +out_cleanup_pxp:
> +	intel_pxp_fini(i915);
>  out_cleanup_gem:
>  	i915_gem_suspend(i915);
>  	i915_gem_driver_remove(i915);
> -- 
> 2.48.1
> 
