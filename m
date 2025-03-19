Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73151A699DE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 20:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C0610E57B;
	Wed, 19 Mar 2025 19:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhPhaIag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F30A10E35D;
 Wed, 19 Mar 2025 19:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742414365; x=1773950365;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ocWa5Y4xQ6OtQrzk9rolGDHt/DNQxuEA5ufhccxBq/s=;
 b=XhPhaIagR7cS1HzmyVYEZlvhQ/crZFYp2NVgEh6rhjaE6RR48VVBTFwr
 wNNgTNuRP8HULSp4hikcXPZ6Y5aveDmLwgyX8w/kSVZUYRtRVami//gXU
 D5YYYQJ8scs9qRXUkCm2J14KDIzNKpI7x5XY8cPRan/Cg73mvxswxs048
 LYA8KIdHJ8I9YzlQFVwlPem7/j6n/epsVzqwn4kTE/DJbB32lolYYOugw
 KXGH++pGL5mJgN1IKWmnvrPfoyv2tebuuxrlYtW+fjiwJDKBOi8asP4nz
 GpHMQZaYkaB76fVREOLjnnoXwX198QJFqGeDDbW2+tfHmHYFQBWYLXN7N g==;
X-CSE-ConnectionGUID: Vklae+gSSy6RqxQQPAgBfQ==
X-CSE-MsgGUID: fj3MAhNHRDK/KNK58OZLPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43515277"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43515277"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 12:59:22 -0700
X-CSE-ConnectionGUID: xCC9hVsOR067ZYcclxJVgg==
X-CSE-MsgGUID: gBon6GwzQnOLJou+6WbQxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="127585428"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 12:59:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Mar 2025 12:59:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 12:59:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 12:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KH8xeHkB+V93uxPMWfWDp3mvEJVaSbcd6sbr/Ek7gtD5/HvNzVbg4IGwrtJesFuS3n+7ian5gcrnq7GylSpPEQ1y8GZkZuJyQwHN8BIvot3lbmaBh6WZ/LTBODnlLWsjIyCjjbUFwePxyE2rQmowTdEGhH90rtj18+L//eD+kSBHzsGAiQ/BiRYe+upH1RnrbZHLN8HNztCeKcjanZ+3W4nBtgFZPx21HDfAJp8F+akQdI9YGL+spgmrXXE9alRz8H3EO4ygGhgjP/QRT4RFM7s8nReAk+snzIH2LffsGF1ilVmXWAzkGdKoFjnUEEymmTKV8mrShhM8KREAckGJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BidWoIdHFU+yRmlZZN/pr6+f6GMoU/DN2ELu3xbIcV0=;
 b=dAICBNxJ7oNEJVeXoVfoj8bTCat7psiR1e8VKRXwlTyiBOf6rfsc4ehfM3NLGDNONXrgawHxZX25A3VherFHiuPIb9228/9cKPH4O6esRg6UbSvmYvfcUku0uXJdOtf5N+ySJeLuEJTQAcCaHO97epGiK913Uy8wPlV+Utnt3mtSKLidaOROuQbSHtL2KuMfgIfLcT8hW3cPGTA1GzmHNdNBxkVAOtcpn7glAgv+TNGaj59JegB1sVxsRJgvrWZCU6OXcHLdY69NKWSsnp2yuCMCAaGdCI59jZSpSO5npod1sUEw4q2E/1H3joUTmIbsKq4j2sYJTP1+RZlQHTKgHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by PH7PR11MB7550.namprd11.prod.outlook.com (2603:10b6:510:27d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 19 Mar
 2025 19:59:18 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%3]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 19:59:18 +0000
Message-ID: <4f6e669c-5d80-4bf9-a7ab-eac8c0ce8000@intel.com>
Date: Wed, 19 Mar 2025 12:59:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <shuicheng.lin@intel.com>, <dri-devel@lists.freedesktop.org>,
 <Michal.Wajdeczko@intel.com>, <michal.mrozek@intel.com>
References: <20250318171146.78571-1-jonathan.cavitt@intel.com>
 <20250318171146.78571-4-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Jianxun Zhang <jianxun.zhang@intel.com>
In-Reply-To: <20250318171146.78571-4-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0008.prod.exchangelabs.com (2603:10b6:a02:80::21)
 To CH3PR11MB8707.namprd11.prod.outlook.com
 (2603:10b6:610:1bf::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8707:EE_|PH7PR11MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 0626293c-7521-48e8-2bc1-08dd67208871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzVyV21aZE5sY0hWdGN5ZVFSd01zTGl4cUJTcFdLVG5sMEgwbTl0KzlueFJI?=
 =?utf-8?B?WWpvRUhEN2NTQ3lrb3Jkb3FnU29yQk11NlNjdEcya2pydW1MS1pEQVB2K2h6?=
 =?utf-8?B?dDE0R3ZSNnRyV0NhMVZhM3hseHFsRDBqMndlMmlQY3BBMGlBNXRYV1MrOUpi?=
 =?utf-8?B?Nld5Z2U0REdpaC9aamJzNWVwcEpzT2FYQXUxR2w1Y3l0NHkzMEtzZWtjWHg5?=
 =?utf-8?B?ZnQwYVVjQmRyV0tjMUdrL0RUallZK1ozL293N0hIdnNBdzJianJMcUdBaXlo?=
 =?utf-8?B?VncxamxaSWxNUXhOYnR4cnNodU5sOWhWQ085RkhUUjFDelFOVFI5TG5aQy9j?=
 =?utf-8?B?eUJQR0R6QjNXT29ybWo5bWZIYTVLTThSOHJldlZna2hmbkRCZTZuN1N4cmVl?=
 =?utf-8?B?LzdKTGV2OUlMNy9zRlFBTmZTTW5Oc0hFTlkrTmRBUnN6Mk1wOFpJYkVmeFQy?=
 =?utf-8?B?TFNRLzFqUlZ3TDd5Q01MVWNaRUw3SDI2VnRvdUpCQlFNWi9GenRwY3o0bDVj?=
 =?utf-8?B?NXpYS1I1ZW5UMnFORHFiM1liK2QvSWdrTUNwZ1l1M3hhUnlsYUVNS3YxVUFv?=
 =?utf-8?B?bXllL2FpWDV4MEdIN3dhaVVUMnJGb29LUjkrQWNVbjZOY3JOOENHczZablNK?=
 =?utf-8?B?T0dJKzNJR0RmS3lmSmtKOVJwUkxjY3A1eUd5MFhaa09OUzZqVFBBY1M1NFJv?=
 =?utf-8?B?dkQzYWtzN0pnUHc5RnpnZCtPM3d3bTNaY05mQUpMbm1mdy9aVHk5QUoyMDZE?=
 =?utf-8?B?VEw0bzB0SUUrb0xqdWdmOU1KN0ZJUjJtenF2ZXZLakkwbzBrSFEydm54enlJ?=
 =?utf-8?B?dUdqTzBoaFloUnNrTUgxdDdBM3lLbXBuUER4bVYrUGxRdEZObHdBTFBlN0FN?=
 =?utf-8?B?ZGtEaTJlUkR2WDUrQnVJTnU2S0JBZi9xSmcyNnFOZ05TQlNNMzdlK1E3ZHpT?=
 =?utf-8?B?dkc4Q0FYVVJDZnlxckVoR2R2b2tWZ0xYZ2tMRWZJNGVDVFVpQ3dMRU1SSUMx?=
 =?utf-8?B?dmpXUS9HaXRaZUJ0Wm1uSkJkMXdaVmFqcENlandpT1ppa2IyRG1VSDZqSVVP?=
 =?utf-8?B?NWczMzZnTXNBVStkMWxNNURZLzlsMCs4TFA4YWpUejAvN3BSWkY1bWZtMWdS?=
 =?utf-8?B?WWduekR0dFhZa0RBeEpiQkhtYWNmcVhOOXJlM0tvN0x1cVlJQ044RUNoZEFR?=
 =?utf-8?B?OUdGaUcyOUJhYWR0VU9PVzVKMzdVVnB3OHgwbUthdlBsTldjcjZ1dEs4U2tT?=
 =?utf-8?B?eEtpbmZML0NnT09RZVBHVENKWkc3U3hoRk05dDErUEhRaXVkYXA1QzhoY3RK?=
 =?utf-8?B?NGhWTWNMa2pZQ3RUUU5KbTRjYXlDOU56TTBoZkJzSHNOcldoRTdiaFgzVmZ1?=
 =?utf-8?B?RktPcXlCTHZWRFJYa3hycUhYSFg2d0xHY1NJWVZ3ODh5dHNlYjFoeml6a20v?=
 =?utf-8?B?dGVOazRWSzVPcDhpVjVkYnJmYmZ1K1o5NExKekdITk9Ba1kyaE9ZY1pxWEN6?=
 =?utf-8?B?d0s4dThSV2tsVkVEYlduV05FeXFONVVrTUNhamJnSkVLZUlZbFM4REdUL1lJ?=
 =?utf-8?B?aGhjTmJkRC9ldHkycHUvZ2J5M0c3QXhxY3FWcnBiVGs5bXF0ZlpxQUZYZlVB?=
 =?utf-8?B?SVN0OG53NmdzMUU3ZkNpZnZKZjBQZW9tZWdiS3o4N2MyM3N0UnkwWjFIdlZq?=
 =?utf-8?B?VEJNdktJSWFBWGVwV3I5aG5tejloMmJGNjN0RGRya2xaY1RuRXQ5TVREYjBw?=
 =?utf-8?B?eWV5cFJKa1ZMcFBQWWplUWo3cG5qZXM2eUtUejQyZy9LNXBIQ09IbW03ZTd6?=
 =?utf-8?B?NFVkS0pZWjl6U3hwRWpBQk5ZN1ZjZ25raFJTT2E4OUlqcENjT2RQc01qdzR0?=
 =?utf-8?Q?UQi7/gUfxgW8u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlJZdnlJeEpWY3I5YTV1WkFORzJZYjNwbEhtL1p0bXJJMGZLY1dxQUVaRGVq?=
 =?utf-8?B?N3hwckxZM0lGVHhvU2tjdjE1TjcrNElqMkNoWjhFOGpvSmZndEdEa3BGVFlU?=
 =?utf-8?B?UGJEWk9jRGNSUnVwdFZiZHJvMk96YXByRVVRVitEWjFFWmZRMERML1hlaWZ1?=
 =?utf-8?B?eUtWc21kNUNneU1CRXgvOTl5S0hqM0VDWlV1WEFXa1o2b3RNMkFKWWZGcXB0?=
 =?utf-8?B?K3cvQndzV0huYVdGQ3JrT3pyR1kwN0dtZ0RjRWg1RlhCa1dxbmh3NWhjbW5D?=
 =?utf-8?B?OEFaVmZVMkZQRTA0OUF1OFJOcHNxYzQyb283ajNGeHFtZjloQlptTlpiSmlR?=
 =?utf-8?B?VDF5czNRVnpYcmZwL2xmTytFQUw2T0dBUEFZNlNlUlIzdCtDamkxYjQ2NjhB?=
 =?utf-8?B?UU51ZHFyTEZoU05rZzJST3BmQzdabHhTOHZ2UUF5dTFQbWV2UnNpV3A0UjZY?=
 =?utf-8?B?cnpic1RUZGliRWJlYkZzT2k4ZlZFTE5VejNIL0ZnWWxNeUNRZXdWT3VQZWpS?=
 =?utf-8?B?NmcxU0xjRXF5cjFKV2FvbnZDZk5uOTJtWDVKRW1CZUxPODRYekpleGhZSkdw?=
 =?utf-8?B?RFlZc2IxVm1hODBQZnJEOFpzbGtoREFYSDhYYzJRdHVMOWpLeHJLTmdiam9N?=
 =?utf-8?B?MGU5YjQxZWpmdW85NS9FSXdMcjBNRXNsaDFrcDdncXBZUGFUOUN2dE1ZSFlv?=
 =?utf-8?B?K3BWTTZiZVdZQ0pEeTB1c1JST0JySnNFdXg4WCtDVnlSWHgyS2srVTdpNzVK?=
 =?utf-8?B?Zk1tKzZKbzdhaFpjZTlIbGc3dXdHNEZIV2RMZHVKajZpeWNxK3BwUU1EUytm?=
 =?utf-8?B?Q1dTQitoUjVrNGY4K3g0eUU5UDJhRGpsKytETlBqOXFkb0FldUVBS2ZWajZu?=
 =?utf-8?B?K2hJUDh6Yk1QNnR5T0VOeDFoeHZFTlRyMktEMGNXNU1qYnl6VWJGL1gzZ3hX?=
 =?utf-8?B?OGdUTTZlVitZSUQxbU5MZmpoYkNxbTNVRU5RRlBoYy9GYjZXMVFUQ0NTdGhv?=
 =?utf-8?B?ZlQzY3hxMzVlYm01dHRkNndSK2hja1BkeGdJNk94R2lGbWtTblV1VmV4RFZ2?=
 =?utf-8?B?U21aWXpJN1hHbVpCd0pOUmlVa1dQUW41SHMxTjJoclA3UmROb2VGamd3bERE?=
 =?utf-8?B?VHhmSEtsbncyMDdFeXFaVWhTY2pFOURFUGZGTjB4UTk4NGtFQ2I5TTBCMWhY?=
 =?utf-8?B?R2tqU1ViN1hidkJFSDR0QUZTN3NEMjB6ZXAwbDRHZVBabWgvKzc0MGx6WGQr?=
 =?utf-8?B?VEhZc3U3SWVSaEY3K043c1pKYzhBeWY4dExyTEZIZ0FRTkozcGdxVXZjMUpp?=
 =?utf-8?B?bmhtYkN5MWcvcmtrZ3RWTWUrbkkwTVpjdzVNV2xSMUdZQnZzMncxTjVsbXdn?=
 =?utf-8?B?T3J0Mk9TSkZXbFd5RFBHbCtaaW1vbEZTZUhTczdrQUsxcm5sVHNXQ1ZFdWRF?=
 =?utf-8?B?Zm1yWm1lSUJoQVJuRmJYTVpQVDBBOUFBM0dHQTJuTUdzeFlXaEtpdklpeDB0?=
 =?utf-8?B?UGpwZGkxbzRGci9BV29sQjI4VE5ZNkdVY1dMRzFlL2xVOFRScEJxTkxjQnB3?=
 =?utf-8?B?QzlValpkMktVY3N3Q1B2UnZDR1JjUGFZd0hreWxBUHNud0ZuOFpFcEpONkhn?=
 =?utf-8?B?clBTcXVVRTVja1U2TDA2UnlnQXRhcjJhcWlvaWJNdFVWRzhwNGx5TU85b1ZM?=
 =?utf-8?B?VDEzZTdQQ0c5UlR2WVpJdWdZSm11Z3BDZzVnbUtZY1p4djE4dXo1YzNpL2Zv?=
 =?utf-8?B?emVhVVZJYlBWWlZ3bEdQc0l5UDlWZWl1QWkvallONFZ3VTVZWTJEUDRuSWdL?=
 =?utf-8?B?akV2SU1rMkVrNXNsYmg4NHNselZkNVpQVktzY29EZFpKLy94K1JrUGhIYW1Y?=
 =?utf-8?B?NCtVTUlLRUNJVkJ2eTNEc05qaCtZTWpSTy9uZWdUYjRMdW0zT3E3YUxtRzd6?=
 =?utf-8?B?Z2RwTlo5ODJEdGhwMTFWbjFFWDk5U2ErWEVUcVNISlRJTjdZS3RmWmNFbjVo?=
 =?utf-8?B?VEdTNE56aWp1eFNzdnJaOUJoR3dkK01TeFl0VVQxWHBYTDVsMzd0eC9ueThQ?=
 =?utf-8?B?eDMrcDJpN3YybWRuTEZIazkwT1FZTnNad3F6MGN2UHBBZ0RMWktZTmlobHZz?=
 =?utf-8?B?eUZwWlc5cnJaM3RPc2hOaFQ0WXhSZlJaZDlTYVJRdTRMRFJUQkFLOHc1eTZ0?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0626293c-7521-48e8-2bc1-08dd67208871
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 19:59:18.4563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYDEzAhQl+UiQ74Rn59YENiFoT0StLzWxVaOGfv3cFzp8JL51W79Tj72NaiYGnzxjb07A8xsKvAPwFlnezgVbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7550
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



On 3/18/25 10:11, Jonathan Cavitt wrote:
> Add initial declarations for the drm_xe_vm_get_property ioctl.
> 
> v2:
> - Expand kernel docs for drm_xe_vm_get_property (Jianxun)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 80 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 80 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 616916985e3f..ef335471653e 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -81,6 +81,7 @@ extern "C" {
>    *  - &DRM_IOCTL_XE_EXEC
>    *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>    *  - &DRM_IOCTL_XE_OBSERVATION
> + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
>    */
>   
>   /*
> @@ -102,6 +103,7 @@ extern "C" {
>   #define DRM_XE_EXEC			0x09
>   #define DRM_XE_WAIT_USER_FENCE		0x0a
>   #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_VM_GET_PROPERTY		0x0c
>   
>   /* Must be kept compact -- no holes */
>   
> @@ -117,6 +119,7 @@ extern "C" {
>   #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>   #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>   #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> +#define DRM_IOCTL_XE_VM_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
>   
>   /**
>    * DOC: Xe IOCTL Extensions
> @@ -1189,6 +1192,83 @@ struct drm_xe_vm_bind {
>   	__u64 reserved[2];
>   };
>   
> +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FAULTS */
> +struct xe_vm_fault {
> +	/** @address: Address of the fault */
> +	__u64 address;
> +#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT		0
Just a question, VK_DEVICE_FAULT_ADDRESS_TYPE_NONE_EXT in Vulkan spec 
specifies the address of the fault does not describe a page fault, or an 
instruction address. Does this NONE type in KMD mean the same thing?
> +#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT	1
> +#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT	2
> +	/** @address_type: Type of address access that resulted in fault */
> +	__u32 address_type;
> +	/** @address_precision: Precision of faulted address */
> +	__u32 address_precision;
> +	/** @fault_level: fault level of the fault */
> +	__u8 fault_level;
> +	/** @engine_class: class of engine fault was reported on */
> +	__u8 engine_class;
> +	/** @engine_instance: instance of engine fault was reported on */
> +	__u8 engine_instance;
> +	/** @pad: MBZ */
> +	__u8 pad[5];
> +	/** @reserved: MBZ */
> +	__u64 reserved[3];
> +};
> +
> +/**
> + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
> + *
> + * The user provides a VM and a property to query among DRM_XE_VM_GET_PROPERTY_*,
> + * and sets the values in the vm_id and property members, respectively.  This
> + * determines both the VM to get the property of, as well as the property to
> + * report.
> + *
> + * If size is set to 0, the driver fills it with the required size for the
> + * requested property.  The user is expected here to allocate memory for the
> + * property structure and to provide a pointer to the allocated memory using the
> + * data member.  For some properties, this may be zero, in which case, the
> + * value of the property will be saved to the value member and size will remain
> + * zero on return.
> + *
> + * If size is not zero, then the IOCTL will attempt to copy the requested
> + * property into the data member.
> + *
> + * The IOCTL will return -ENOENT if the VM could not be identified from the
> + * provided VM ID, or -EINVAL if the IOCTL fails for any other reason, such as
> + * providing an invalid size for the given property or if the property data
> + * could not be copied to the memory allocated to the data member.
> + *
> + * The property member can be:
> + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
> + */
> +struct drm_xe_vm_get_property {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: The ID of the VM to query the properties of */
> +	__u32 vm_id;
> +
> +#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
> +	/** @property: property to get */
> +	__u32 property;
> +
> +	/** @size: Size to allocate for @data */
> +	__u32 size;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	union {
> +		/** @data: Pointer to user-defined array of flexible size and type */
> +		__u64 data;
> +		/** @value: Return value for scalar queries */
> +		__u64 value;
> +	};
> +
> +	/** @reserved: MBZ */
> +	__u64 reserved[3];
> +};
> +
>   /**
>    * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>    *

