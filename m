Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7DAF94B7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 15:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF81B10EA4A;
	Fri,  4 Jul 2025 13:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxYWosjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E57510EA4A;
 Fri,  4 Jul 2025 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751637200; x=1783173200;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9g336zqDKS2EJE8kauiDKrMdbUtyUXxvCA+opYiF+Mw=;
 b=dxYWosjKXJvgHFNLc14IvWmnzJfOhrfwVKwmtBzMBpIld1EaZu9khO87
 oCFt4jRD9pwutbvXCa9xAS8iJCNr8C9675Poz3zP7RkOIwtGunoPH5X/Y
 vvWLlZztkr4G2E7dd5QQ4s/Q23HPDU6qqcWdv8YKsHpeWsHR2tMGN0+Zo
 O5hNqCinHBwujXmKBc7Dp+l+Y4uVuZ7mYZeQYFc62TCIwyChkujdGVaPg
 UC5kySl62pfksDrj24XxUyUtdIvsstsh3yXUt9U/80GpkMs7+Xh4OqLyO
 5lc452U0petvPnFY0dtSsqp39YW253fQe9G4yU1zaYa6k0EXotOMBuEKa A==;
X-CSE-ConnectionGUID: urWzXF2ZTA6OUrgBs3yqNA==
X-CSE-MsgGUID: vpkfLR1bRzeqht6sPAhOjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="41598427"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="41598427"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 06:53:20 -0700
X-CSE-ConnectionGUID: nDktGm8XQs+v2lBf4Cq8ow==
X-CSE-MsgGUID: AOStZwmAS6ye0374bAnK8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="154778941"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 06:53:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 06:53:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 06:53:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.73) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 06:53:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2/ttRSvBJfk+GeQ0JADjMtInzWNzBE6JZoGdeSTYWTqwD8ljQNay7pwS6Dq+I9d9VOgApewLeOIg0i0WTnCaaLM/OUoIUzxRmvbkAfa45AKEtuEeg4JSu8p9/LaSyQRSye88cvKyu3oTXwKPam7eLYeX84cF/0AtJ2G9qxOw79P6JBuLKpM80Hu2lYli7ZExNkwQ/uIgiWCpWuE2dq6DbP+JpLOVDf43Q4fSShtpTqiW3eYJOvBESareEiBfBsgRgeBiHln+6CZV4bBYupXC1MCgc6J8p7LdBVhxN5qCTiLXkav2+nz6xqeEFgLD9YdriKPBvZPHqpLquSs94qcow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyi/JAz8HZCA5OEoouZHQYsgmdBnaT1Ouff8TiSXeyA=;
 b=D4mSPvFZXskNLANYXrEyjFuT81LmkuA5lfm58oEUXpQJaUdK5RozDVfZ9PhiG3PoUXrOH+B1LJL7P2kaQg23vN7QTGgAkY2X1HUpo0vpNtgXSmUX4L8sRjJA2JIwfg5UY7XSM9oy6OxPREoerNBu6MaidBQ+GqZn7+TCww8fXTO0i8RTN1nU4sbyI8B0OIYdeBAF+aOMlAj26ItEhSyGkO/H12AkaZMXCTr2q8EmhfyMJE1Wci33PveXJMP/BUNlE0W9tabPXrRL79P7DTFedSAAgwnnJNXYAIqOvpv1axGs0Zjs+RfqE5HkHGQiYiJY8sIIHjiMy91CVhnd6BO8ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM3PPF90FB92BE6.namprd11.prod.outlook.com (2603:10b6:f:fc00::f38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Fri, 4 Jul
 2025 13:52:58 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8880.021; Fri, 4 Jul 2025
 13:52:57 +0000
Date: Fri, 4 Jul 2025 15:52:46 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: Matthew Brost <matthew.brost@intel.com>, <linux-mm@kvack.org>,
 <akpm@linux-foundation.org>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, Karol Herbst <kherbst@redhat.com>, "Lyude
 Paul" <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Shuah Khan
 <shuah@kernel.org>, David Hildenbrand <david@redhat.com>, Barry Song
 <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, "Ryan
 Roberts" <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>, "Peter
 Xu" <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>, Alistair Popple
 <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
Subject: Re: [RFC 00/11] THP support for zone device pages
Message-ID: <aGfcrmyj5soCZCDx@fdugast-desk>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <Z8oq10LQBGnqpjQl@lstrano-desk.jf.intel.com>
 <6a8d6234-9d45-40b0-9038-e09f1084b229@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a8d6234-9d45-40b0-9038-e09f1084b229@nvidia.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0287.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::22) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM3PPF90FB92BE6:EE_
X-MS-Office365-Filtering-Correlation-Id: fcca05b2-cdd5-4441-d240-08ddbb021536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QytMQzczSHJ5dTZQTXViUHpaYkR2WU1vazBnTU94NnFleUY4TFhIUGJXdG1M?=
 =?utf-8?B?bUdlT2V3bUhZVXBEWEg1ZklqSHo3YmpqcjMxdFM1YnExN09EcUVkNkprSFpi?=
 =?utf-8?B?blhVZXlxYmNHdFZrei9oWGhCbHg3UXBaYzF4emx4a0NqY2lpY1pHRjBZNml5?=
 =?utf-8?B?c0xSUVFzb2ZiTTdMZklUbFlpRjRUcXpEcEo2eHBEeTVIRFJNay8yK2ZhRXNS?=
 =?utf-8?B?WW96cEVFSVJLNDRBVWZuTURQN3VvRXZkenRVbUlzWmY0VmRsUTFjR1J3a3o2?=
 =?utf-8?B?TSs5OTBXVWtMSHJOZldld0krMTV1VjkxUUZiblNIWW9OZFdReWNmU3g3dUUv?=
 =?utf-8?B?TDArcWd3QkJiL09RNmtFcnhGRDFTRmJDT2hSTVYxRy8rVHlnU3pUVmFEWXFq?=
 =?utf-8?B?WDdZN3NFNmc2QVUzVjFMTmlvRzRVdUcrUHJpc2VRT0tETGFyNW8zMzFaMyts?=
 =?utf-8?B?MlFRc3ROUkw4SittUlBoaEVaVXhzdEs5K0F3ZnQ0RzBoeHp6V2xWRVd3c2hO?=
 =?utf-8?B?K2Fsc1FBQ1dvbFIzR2E3TEtnWWQ2Vks2VkhrR1EwRWhid2gxSEhhcGE2VUpz?=
 =?utf-8?B?eG1uWnI2Zmx4VDYxdVp4S3Z5WnlUNEhjQzdKMWszWmNjWlpMZXNHQllmdlhU?=
 =?utf-8?B?bUNZOEpQamhROUU5QUF1SHM1MmNXbSs0aERmb3pyY3VHODdXcXNoK1NXRTZa?=
 =?utf-8?B?VlNRUTE5UlQ0ai9ibUNNU3o2NDZOSlY5ZENZMFBpUW0rYjFZTk10RmJpRVpx?=
 =?utf-8?B?TzA0ODZxTWpxUGlScnpleVhTNnIvUTNseHZwVTlMVWt1d0tsNVJpWlAzZll2?=
 =?utf-8?B?QUtmdTdBYkpZWkp2OWMxQnloWHBBekVSbkpOUHJWWUlUQnV4OVJ4eWpxVW9M?=
 =?utf-8?B?aEorRFhxN1RiZkd2TjYxUkE3VkhDaS9rNDRQYWZCWFlPOXczWmpsYUsrOHVU?=
 =?utf-8?B?aTREOFpESTgwdWNybEx2YXJhWU4xYkhpWVFwWCs5Zm0wZ3ZHWVl0dWh3bFJY?=
 =?utf-8?B?c0Z0S3NCay9TVFVPOWpVVFYwL3BxbStZTGFycVhrQ0tZU0t1Y3RRalFwU0h1?=
 =?utf-8?B?UWZvQ1ZjY3JnUVYzMmVmNmZwNmhtMFJrMjVhb01YY1ZCZFo4Z2V4Tm5XdGZD?=
 =?utf-8?B?aGphTWhXVE54VzJ2ckxsZDZ3NHB0d2g1akRWcWZVekhOaUJ0N0ZGWVR2TjVy?=
 =?utf-8?B?NHhWNVN6SnQ2TFRCbTgzT1RKa29VeHJIZXdLVkVkUXdSeWdXT1JWRHJXUjFB?=
 =?utf-8?B?TG0vdlRNNWpVOVRJcmdibHpDMGtwaitvNkpuUGtZZ0FzQnlSRGczdUoweU1I?=
 =?utf-8?B?RmRsN3UvbWdzV0hHVHJFUDZ3OUxrang0YTRzVk54Ui9iVG1OZjNhVnpYWVB0?=
 =?utf-8?B?bGxvR1U5d0pEVkN1MWZkWE5JMWZoK0ZEQkQrSkZFdVYyY0hlSm1CdnlOQnh6?=
 =?utf-8?B?OGQ3TmFqWUs4S2EwQUhQV084OGs5bS9xVHdmR3FKZzdvUUVVb0lsM3M1d0Zi?=
 =?utf-8?B?ZHVHTmZQQ1hQN2RQd2F3cGYzc3pzandqVENUa1ZXbjArZGUyVjhWZHUzS3Vw?=
 =?utf-8?B?bWhrTTZYTXlQa083SnNpZ2xUbnYwOElRM3M4SytWalpKTkxwcVNiTzlhc2xU?=
 =?utf-8?B?djRJKzhXS2FEdEpWSElaVEFlQWJ2akRKaWJ2SENETkdadzZLQk9IWXk1bFhv?=
 =?utf-8?B?SFVDVHowNXVlUWJSWmtjanFUSkJ5QWs4M2ZydjJ6R1hWZHg5OTAzdWs0ZVdM?=
 =?utf-8?B?Z1ZZUUtaN3AwdGtCRjlkUENtM1k3bTNIT0VpVmpoYjZkdzhzRERtWGVLMUpV?=
 =?utf-8?Q?23dmWYPdw2hZRv3oAvIXsoJSufAf4c5MWvpy0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzIxVVBlVm9Nc0lBMUNibFp3MGMzRHlnSUhMYWlDQzJhUVRRUUdmbnZhYXFG?=
 =?utf-8?B?bFZmSHJrTXpjQmZCS3h2SXBGMXpTazl4SlJSWEVJa1FHKytwYzBQNmswMTF2?=
 =?utf-8?B?M2UweTRBb2EyTkw3b1Y1ZU5DSGF3ODBGYXYzZDFhVEFIRGVoWU03MldBaHlU?=
 =?utf-8?B?TWlQVzBLdi9kc0VneWJnM1Q2VTdPRENKS2kveWFORlozV1J1cERWNzE1Mmhj?=
 =?utf-8?B?amQwYW9ieXNoUnZncVFmdHJQaG9DUlg3Y0htSjdMSFl1SFF1REMvV1RWOXQ5?=
 =?utf-8?B?dmUxU21ybXJpeEVXeG1EVWpadHJGNUgvdVhBR1JJMlNCSWpFdFNZeGtiUXpY?=
 =?utf-8?B?YlJxUWp0MjlESTl4STUyam4zQVZlUGhmNW5iK1NhNEM0cVhwSG9wL1BrM3Y3?=
 =?utf-8?B?ZktyT1VnWWhZdStWbWI5T1pCSU82ZTkwQTRLY1prZkFweGZwajdWbzY2TVhq?=
 =?utf-8?B?b0dSamtJYnFXT3FUMDQ0MzAzZWxFVzVmK0JyZjJNZ0p5aGNzOERuU2RtYmZT?=
 =?utf-8?B?MDA2KzY2UDhESlNXQVh3OFZuTUtZSkRJdzZNQlFPK0pYVnl2U1U2ZFlGelF3?=
 =?utf-8?B?amtzRnhJM21xbWVFdmpRcC9DVUFvV1dLaFZOQ1VxVHZmT3l6THQ4bnFnTHZU?=
 =?utf-8?B?aGJ1dGE3RGNkVG5xRlNkbisxR3JTbVlrOThQSmZoSG0xRThudHY1SU0xUXJl?=
 =?utf-8?B?ejhsdGQxREpDNzVCbzA4NUkzM2ZlNFB5ZTI1cWEwZklBYzhFRTl0am1HRExW?=
 =?utf-8?B?Y3BEUTlabjBhYlNzeWNOdExLa0p2RCsybU9UWFM0ZzRXN0RkL2NqOE45Wk4y?=
 =?utf-8?B?RFZsOVJtWEZCdncyc3lweGl5U0dNU3NXY1U2azhhbGZBYmVhZUYrbUo5cEVQ?=
 =?utf-8?B?RjRTMEowaStKdUpIdHVoTEVmb0pjRkYxaXdnMzI4NmNNdk5rcWtuUk1FRWFp?=
 =?utf-8?B?ZVA1SXlwY2xIeEgyYk5pVEhPem8rQTVocEdRSDhIQVVYTWhmNTYzZnVzVFZP?=
 =?utf-8?B?YTdxM2FHL2d6WmFMbmkxUVplVlNxOGp0YTJIZDhuUUFLNHQ1YUczNXQwNDE5?=
 =?utf-8?B?eXQxM0toK1ZiWUNRTjZKek5YRFJ3VWNuczVUSE9qeXdyd2d0TzFoUkxSTFBS?=
 =?utf-8?B?aUlpSWp0MkJISTZBalN4L2w1dzY5U3JTell4TnJIa2d4WFpiVUZ2YnpCU3ZR?=
 =?utf-8?B?MVhkazZJblE2bmdPZ0pudDRtQThneEV3ZjBLRUVnMU5ZZjZKU2ZzWGtuYnRu?=
 =?utf-8?B?Ti9HbkNmUHFvbkdQQ2VNcUd0d2V5NlFPRVZtOWF3WWZGd1R4Zk1IemNqS2FI?=
 =?utf-8?B?TGxwUXIveis1NXljRVNDV2kyMUR4TmpGWUlTQ0lxa29TQ2lnNVpSc1BZZTk1?=
 =?utf-8?B?NFlsaTRLa3prZlpFQ2hlSVNTa2xWMDBWUjFoWVJrYkRCRUdqVHBwMWJhZktK?=
 =?utf-8?B?ZlM2T1FxNVY4SjErNXdnOEVCb05KU29pNC9oTERDSFlEYTBIanRWbmg1ZEJx?=
 =?utf-8?B?ZzhyWHJRSWZqZ1FtMDMyRmdnZWJaVElEUGRpckF1MExoQTF1c3VwMzVwMnpv?=
 =?utf-8?B?cVBuYkg4RGxyaFZhVzVOV051a3NVdUMyV1B6SXhCMVFNUzN0SWV4UVl4OWlt?=
 =?utf-8?B?dXYxMFpOZlUySDNyM1lIcFd3OVVHa2JMWTJ1VERpQ3JKK3ZPSzFnWWhlNHpv?=
 =?utf-8?B?NzEydks1S09pdm1BVVRIeSt4cDBHSmswc0xXa0MrVWROcWcrQnhPelRvM0Jh?=
 =?utf-8?B?ZFB5ZnpCSWszL0pXaXc3OWh3MG5XbG92NUVlNm15aXZodnlMWU96N1BPS08v?=
 =?utf-8?B?dHlBb1BZR2FuZUgyUStJVmx2RStCd3pTeGpQN2hMZ0FQRVkycWY5ajBnRGI5?=
 =?utf-8?B?czU3YUV1NXlvNnpzTjNUdS9pNFRaUWhhNWR6SnBnSFZvQlNJOXNqQ0pRTkM3?=
 =?utf-8?B?ZWtVQy9rdE9HZmQ4SGUvcytqb09PYkR5eHhZb1hDN0tLcFVSQzZWR3ZoV0wz?=
 =?utf-8?B?Uk9Vak0xVmFZejNUaHBPVS9vNXl0bklVTUYvbGJUbjBKbHd0cktrWXU2aHAv?=
 =?utf-8?B?WFJuelBYK2pQeHdYWjJCU1plTlpIRVB4bHRETkFUU0x0elJIeEVVd1djY3FR?=
 =?utf-8?B?ZnUzSFNGSnRsUHhzM3prSm5pMHBFWjUwWlBSRVdqSnRaYk9YTnhTcFB6WERj?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcca05b2-cdd5-4441-d240-08ddbb021536
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 13:52:57.8723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MmsMM+IxpeqJ1R/Sqv8hKwtRCcttF6pm4XKvl2yTQkOXSMFb4KNblZRXkxHUTxdEDXXjZnyuocUi789NfT7gECUVh+YvuZUjgOyEd0CbalY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF90FB92BE6
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

Hi,

On Fri, Mar 07, 2025 at 10:20:30AM +1100, Balbir Singh wrote:
> On 3/7/25 10:08, Matthew Brost wrote:
> > On Thu, Mar 06, 2025 at 03:42:28PM +1100, Balbir Singh wrote:
> > 
> > This is an exciting series to see. As of today, we have just merged this
> > series into the DRM subsystem / Xe [2], which adds very basic SVM
> > support. One of the performance bottlenecks we quickly identified was
> > the lack of THP for device pages—I believe our profiling showed that 96%
> > of the time spent on 2M page GPU faults was within the migrate_vma_*
> > functions. Presumably, this will help significantly.
> > 
> > We will likely attempt to pull this code into GPU SVM / Xe fairly soon.
> > I believe we will encounter a conflict since [2] includes these patches
> > [3] [4], but we should be able to resolve that. These patches might make
> > it into the 6.15 PR — TBD but I can get back to you on that.
> > 
> > I have one question—does this series contain all the required core MM
> > changes for us to give it a try? That is, do I need to include any other
> > code from the list to test this out?
> > 
> 
> Thank you, the patches are built on top of mm-everything-2025-03-04-05-51, which
> includes changes by Alistair to fix fs/dax reference counting and changes
> By Zi Yan (folio split changes), the series builds on top of those, but the
> patches are not dependent on the folio split changes, IIRC
> 
> Please do report bugs/issues that you come across.
> 
> Balbir
> 

Thanks for sharing. We used your series to experimentally enable THP migration
of zone device pages in DRM GPU SVM and Xe. Here is an early draft [1] rebased
on 6.16-rc1. It is still hacky but I wanted to share some findings/questions:
- Is there an updated version of your series?
- In hmm_vma_walk_pmd(), when the device private pages are owned by the caller,
  is it needed to fault them in or could execution just continue in order to
  handle the PMD?
- When __drm_gpusvm_migrate_to_ram() is called from the CPU fault handler, the
  faulting folio is already locked when reaching migrate_vma_collect_huge_pmd()
  so folio_trylock() fails, which leads to skipping collection. As this case
  seems valid, collection should probably be skipped only when the folio is not
  the faulting folio.
- Something seems odd with the folio ref count in folio_migrate_mapping(), it
  does not match the expected count in our runs. This is not root caused yet.
- The expectation for HMM internals is speedups as it should find one single
  THP versus 512 devices pages previously. However we noticed slowdowns, for
  example in hmm_range_fault(), which increase drm_gpusvm_range_get_pages()
  execution time. We are investigating why this happens as this can be caused
  by leftover hacks in my patches but is the above expectation correct? Have
  you also observed such side effects?

Thanks,
Francois

[1] https://gitlab.freedesktop.org/ifdu/kernel/-/tree/svm-thp-device
