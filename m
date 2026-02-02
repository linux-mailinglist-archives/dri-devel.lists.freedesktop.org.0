Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAjDIgyJgGnO9wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:22:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C867ECB929
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EACF10E23B;
	Mon,  2 Feb 2026 11:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IvI5v6T/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013017.outbound.protection.outlook.com
 [40.93.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290FA10E23B;
 Mon,  2 Feb 2026 11:22:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QovrM+uTpwqaCjkk0ZXU15ERZj/Uwzk9vVWgFYhB5VDAzeNXs5CbNk2u1iis99ij4KnoSQ/DnK6S5N5YXx60SQkdfQXVVtRnn77/xVApZ+VttfD2KWqQY+DtBZ2x/QpRWrBwP6ObcS/cS3CKBI8Hdu5R0NT+GrYuICRMO1n42oA1MPXhlGp3V3NJv87Q17sm8svQudTymTmtEGutC++eHAtmP9InFjlqYURF+vQMt6F4hwBBh+RnmmC8WwPgPldQQA3hIROQj9h+VTRgp7Wyby5S1BgOKP7KJ1XOO6C8Y5sUIiXHJ6VisoG1xZDx5GHW18vHnuQn+MY3JAPemb67tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTbb3sQtohKQa/i6WnDSIpzkk/XXcuVQDXdcK0/qC6I=;
 b=cR1P3A9IFN6CDjQG7zCeFb4wpOFenBWZ7zB2buf737DepcysD2dP12IozUEjIyY/RaLnxdQy1Qa0clrlVoVHzW345sAPy5fqhepirEAEgWr1CwQURAn0duqO++bdF5NEOV3MtOQllIGhfgci+GYULQyZJvoDyxdFt3KmwavAoBU0xmaDdNYJHko5pXcZbVey38+mAa2+RUGYLr6rEi5hAHzcSI6VBUNPbU6RrxhrLBDQRdniz1d5t0qL/q84E5F3UR83/zI4tjOQSv+jVS2KCa00DOSA+4opph/UtFFdxfyoAc1MpKJ9O8AqIqdHB8tckaFPFyZRILD7qw4buPiB0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTbb3sQtohKQa/i6WnDSIpzkk/XXcuVQDXdcK0/qC6I=;
 b=IvI5v6T/8pIajHSFciYSFWEDS5OJm3UstwXxX4yCMBwSWisYRYF4w83j3LFiYTrA+0ySOcUE1Y3W50F6cnul3swasod5gNYrcl/d/LdHm3ARj+VC2ZiBmO0/t4GdcMDw72Mlu2M6qHsEErx2g+l66RNUYldUod2eFh6DWWXAvtqdydMItcEi3zX0Prsbf9ZDmJRshpk9bXIMkrU5FcM89yxoYDiTew49MORvmeaDflzbGHvhSxY39wNvC/A/TkdRVSiMduQ6zfS9kFlnOvjpnI/RamDaiuhryErYWqu6zWyOiHM73/5RbS4x/cxn1DJE1eRsd8pIj0ZrafpXvAFbtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DM6PR12MB4417.namprd12.prod.outlook.com (2603:10b6:5:2a4::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 11:22:43 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:22:42 +0000
Date: Mon, 2 Feb 2026 22:22:37 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
 intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>, 
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 linux-mm@kvack.org, 
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-ID: <ewowxagab6ej5xldwsewfvg4wgpmelps2dgqj7efmcnhks4nqg@nqdhfedzlvjb>
References: <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
 <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
 <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
 <aX+oUorOWPt1xbgw@lstrano-desk.jf.intel.com>
 <81b9ffa6-7624-4ab0-89b7-5502bc6c711a@nvidia.com>
 <aX/AgHAZ7Tl4iOua@lstrano-desk.jf.intel.com>
 <lbqqmohxpeynsrunbdyvod2fm4tinzq5coueh2mq6weubste5x@y4f5weqvwszg>
 <f48e3d818c6e20d6ea7a7fbd6b1741f25df17a78.camel@linux.intel.com>
 <ymg5yawktqtw7vfgt77iciqzxhjlsnqrwnjx3xmkflbjqbmq5s@jcxzcymqq2af>
 <d8c02e59a4cdd2d02b41aa5ce8dcd36a94fbba86.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8c02e59a4cdd2d02b41aa5ce8dcd36a94fbba86.camel@linux.intel.com>
X-ClientProxiedBy: SY5P282CA0067.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::18) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DM6PR12MB4417:EE_
X-MS-Office365-Filtering-Correlation-Id: d66bd7b3-7005-4606-9d9d-08de624d61b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU1WSEVmajNxUWtXZUpDbWh3Y3RkWDhnMDNjY2JXaWgvajQzMUlMcDZZNWVU?=
 =?utf-8?B?VU8vbmM4ZVY0RDZKcUNwMDVDN24wR2FsUnE1eC9ZM05FVHArd1dReER5bTRn?=
 =?utf-8?B?a1ZmRkZ6eWV0WmRSNXZxRW01ellLV3VDN0pESm1MY3hFZG5wOFgxZURZemxB?=
 =?utf-8?B?TVJzYU5XTWl4Nll6ZkRLSDk2TFBpcnFSOVZQOGNOTWR1WUNVdm1mRks0YUs5?=
 =?utf-8?B?Wmw4RlhJeThSNzZJalV5TEhqZk42cGFuUUZGS3lMQlZkNHhkZFc1OFFnZU5T?=
 =?utf-8?B?aUNNdW52UDFzTXoxUGRNS1d2R0JWaHFHNEpCb3JYSTlnbHBVYS9NQndvbmox?=
 =?utf-8?B?NXMwbW0xMWRtRm5GOXlQTFlvME9wTUJMbUM0N25YSk5JNWo2QzlIRmFiUXM1?=
 =?utf-8?B?aS9Qa04zdjkvY1J6WGhPQkx0UkEwandFRGNMRnRvYUh1aFBJOFU5bHpsNVBT?=
 =?utf-8?B?SElNd3gzMnQwd2NSekFPcEVySytHQjFYeGFDUFVaLzRhL3R5TC9vTnFYeFky?=
 =?utf-8?B?UE9kMVFLLy9lSW5SaVpDVEpGS2YrYXZYcXdWMDk3YWdDSldJQTh0YnpmakZa?=
 =?utf-8?B?SHJ0SGYxK1BZU1EwTmgvSjdZS0l2OEt4QmdtZWJNUTNSV1Z4RkpxNWVnZXBC?=
 =?utf-8?B?RWsyYmNyVTJwcU1HMzZjV1ArTzJSblVTN29NbmwvcDZBSzRFaGh3RGVaWHBn?=
 =?utf-8?B?MUEwVnZxYnZ1MWlpUzE3VDc0a1V1TW1WbHdJUzFFcitvTndhUDNOZGIyTzRj?=
 =?utf-8?B?N1J3ZFNPYU1XbTZ6NkVDUU9JT1pKeXBmZGtHOUNnK0lLeWZsK0wwc1pRRUZC?=
 =?utf-8?B?L1B3ODR3bW4xcTl5QXBaSy9qTDRMeFgyMHkzV29RekhwYmg0NkEzRzNsbG9j?=
 =?utf-8?B?UU84SkNSYXg1NUtxRjd3QW9YaGxIZHlMSFM2aytKWDh5Nit5dE5obXZrRzFm?=
 =?utf-8?B?WDh4ZmJNeHBjeFN3SDdNMWhYQ2szM1lSVGFGRHQwL1ZwUlRreTU4bSs4ZE5t?=
 =?utf-8?B?UEt4SHdsSkUyc3drY0MxRWZOYjkzWVluek1oMzlNc2FuN1FZOXlMc2YwYUpo?=
 =?utf-8?B?aWdCTm1WTGROdDdDTGJIYXJDRmFwWWxRbHd2VEw4VlpsWlNFeVgwYks5VVNH?=
 =?utf-8?B?TWk1VFVCWlMyOGw3em43OHdCRUY1R2hWNUhwbmd2TklRZk5pZ2pLSXAvdVYw?=
 =?utf-8?B?WmdKb3lrYjNDYkhPaE03RWdOYVF5aGlaR0FoeERqVmt2ZWdBa0Jpb3NXbVpH?=
 =?utf-8?B?bkNXa0Y0aDU4b3VZUXFWNWp0dVVpalZLMWxUNk9pbEd6cjFuYzIyeHZTVmdt?=
 =?utf-8?B?ZlM2ZGo4bGIvS2R4MGc4UDZES3hYMW5tdC9CRGI0UEJ4cE9kVUdISVV5WTIw?=
 =?utf-8?B?WERzdmUwRjN3czA0V29OSlJtZmVlRUVwV3l4YnRIZDQxb1ZCdWViTjkvRnJQ?=
 =?utf-8?B?WENYN0ZPQTd1RUoxTDZJWk9Kb1NqQzMyNHZMeGl2ZGlOUStIaERtN2NLY2FL?=
 =?utf-8?B?S3BheFR3WklPSFI3WFpwRC95VnR3UE10eFhFd2ovVHdoS2tFRnlvOTV0K3Nx?=
 =?utf-8?B?R3Zra0JEUkRZelhmMVZQNENNakpTNEZUVzhZakordTNva1VhaW0rVCttMFFP?=
 =?utf-8?B?MGpMY0pTSFJvMFY0MWZaVmYwWHM0dStYUzNOeWF6WnpIRVJBam5GUm1uR1k1?=
 =?utf-8?B?ZU4xREVDblZUdWRZdnBDSWJGTEVoNklBaVZ0UXNPTXlQRzY5TC8zeXMvNHFI?=
 =?utf-8?B?SDNMN1RsRHVObCtNa0E1QWpmZDNOVCtQeFpmcWZlV0t5MndYMnFrMnNFZWFp?=
 =?utf-8?B?NmhDaXNaTHpaclZySllkVjRtSk53bldES1dKWTVUUVRQcDd0a3lrVThJVW11?=
 =?utf-8?B?eXdmQlcyczhZZkRYL1Z0VGYzdG8xTGpXd29HZnQxWGU4NUhHc1hzSmxIV2p2?=
 =?utf-8?B?QmlweTZJY0lCK3BWemdRV0tpOThQd28rK2dZWUJ0REVicXBMeWh5akxjdTF4?=
 =?utf-8?B?Q3EyaHQ5VTBOOTFlWUpHTUJjZTZxUlk1RVJMRkVOTzAwTkMvcEp0SVl6YVJZ?=
 =?utf-8?B?YzM3cS82bEJCMjlnZWFLc0hnQUt0ME9WbWxyZmNxR01Gc2VYNXVvbUp4cEY1?=
 =?utf-8?B?L1ZXcWxaWkJ3Y3lWV0VrQmJsVERXeWE1elZWWVllZW81eW1aZHNxWmo0Q21U?=
 =?utf-8?Q?b77BfqZIJ0UN3o0CBiKC95M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzRrYVUzZkYxUlpuUUtlY29CUS9rV0Vpb21QbktWeVcvdDhqTy9VV2RBcit4?=
 =?utf-8?B?T1d4ZUUzUG40VUl3ZXNKcnVIeTlKOFNaZlk5NkdtMDFOeEpyUnJyeHJWRmlk?=
 =?utf-8?B?TW5uL1VlRFFuWFFPc2hxeGxMcEpBcGpqMW9YSGx2dWwvMGh5VXU5TlVycUh6?=
 =?utf-8?B?L0h0R3R6RDFTOUdkaFE1Y1Y1U1VZV2llb2tQQ3p5SUxCSEhYWUJFUVhRcWZ5?=
 =?utf-8?B?cG43YUVxSURQYmhIUHNVVFgrMUhURjJhVCtDQnFramRIbER5Q2tHMW9iUFY1?=
 =?utf-8?B?Nnd3Mm1rQ2k4ZDJ0eGRQZVN6c1h1SGRRYzJHQjRjVkFqSmlIamsreUxFQXVP?=
 =?utf-8?B?bys4SWVDcU9BRE9xNExLWDlCVnBMeFpMTU94SE1wTEZUbENKL3ZrbVkyRTUv?=
 =?utf-8?B?UndBcm1KM2djTFo0MDhKck9YYitkRWJCbWorWkRBOEJVTEptWlJtSzlRVXVL?=
 =?utf-8?B?NjhGdmswZjl2OXErK1IwWVBzZWtIaHg3aUtqdjZ2WkhRbVdhK3FMRUxqRURN?=
 =?utf-8?B?dkpJbDNtdGtvNHRQUXZVMkdmbUtGU0ZBd1RMVjR3K3NreTFxWE5YZE5BNCt6?=
 =?utf-8?B?OXFSY2M4OXNMQitNdzhTNzl6b0VURUhMMEY4SmxzU010L0Q5MHl3UE9BSXdr?=
 =?utf-8?B?YlZ5TUFyc0dSYkp4RVlSZk1HbG4xNGZrckZxM2daRVRDcGJiUnoySkhBUzRa?=
 =?utf-8?B?MVlwYVFGL1BFNWFwTHlteUdoSitmUHU3aE94OGdlbHFaSnhoT2FFbWU3TGJ4?=
 =?utf-8?B?bFN3dXlscmpFNnEzcENHNkdhMVp1WVE4a1huT3VBQlBtd25wOHhnODRvSzNt?=
 =?utf-8?B?ZkRKck1VcWpOTmtuOWN6WkYwaDZIaTFoMktuNk1QejhXMHU5bUcyU01wVU0z?=
 =?utf-8?B?VjYrSUJjTC9SU3hScnl6ckdXa1pkUzQxZTZqYW80UUpHLzlPeXdEekp3WEtp?=
 =?utf-8?B?b3ZrV1R1U3RBVEFsZzdubmpwS0FBZWU0WHBNZzdWcU1McSswM3UrK045UUFr?=
 =?utf-8?B?a29ucjZXNEc4Wmk1Q2ZjNndFUmJwWjc1dnFtcXZpY1VEVVdiOWhJRkg0K3lO?=
 =?utf-8?B?YmxQRHhSOVozK0RtTFlBaVY2Z1JORzR3b3hEbzhNS2ZiWHptS0hlZW82MnN1?=
 =?utf-8?B?MWQ2OC9IR1BvTjhiUW83cHlWT2VMNUF2VEwrOUZnRkNIeWlhZmpKWWJBODJq?=
 =?utf-8?B?cVR3eHFQRFlpS3dxQUxpSVNTeVgrd09PR0NYR3RiNG1FL3ZPM1l4Ty9sdVZL?=
 =?utf-8?B?a2UraEYxRnBxcnp1WFpNK3ZxRTJsUkRyUm9CUFllTG9iTFB0bk5mdDEzcDY3?=
 =?utf-8?B?MVpsbGE0OXJqWkFqNGFxbjh3U2s5Z1BsU2ZaU2JxN0FOTVlTQmRnTjBLbnJt?=
 =?utf-8?B?cGJITWFIL3RSVkMzdEE3SEUzTVl4UTBMTHZWc25ZNTUyNzl2N0Q0ZTFZYkxF?=
 =?utf-8?B?bjZ1L0p6YTdHNWEwVFBDN0VYMEtaUFBNRmtkc3NLNUNpSmlTQXROeFVWM2Ev?=
 =?utf-8?B?d3J3OWNPakVOMldvVEZQYmVJdjB6emMvRHBaTlhwcFZiSzBudWo4b01JdGMw?=
 =?utf-8?B?M29nUTAxdVJ3VldZcnVFYlNzNFZlcFhtYll4OTh5M3FES0JxQWNtTTdPWXdi?=
 =?utf-8?B?OUNPSUx2WVppNWc5bXMvYWYzWjI5SHcyL3hnd0ttWXJkSGJYbnp2Y0VpWlND?=
 =?utf-8?B?Y3lOOStSWGNjSjBmbEhxUVBTb00wcVU2Q0hEVjdrVXRPNkhYa0xWSjUrdXA5?=
 =?utf-8?B?UW4rQnRDN1ZuLy84cWM5UW9temNCKzlZQno2UXFwTlpGRzhzN041cG5UeDBO?=
 =?utf-8?B?RnduMy9CeDhXbDZxZDZkY0xWMmpkT01KT0ZMeVcvWHVENEwySzkxVHp1UC9n?=
 =?utf-8?B?YjUrajBNYUd0dDhVdHo2U1ovTG8zTWJjYktDdEF0bWM1MXJYWm1ONjkzVUNJ?=
 =?utf-8?B?QWtDQU95Wk16L2lOZFptWXMxb0ZUUExwSnJRa3J4MzJPNkNxaFR3Wjd4M0tO?=
 =?utf-8?B?Z0ZvZndhT1YvcHZ6aGtEQXJlelhWRURqQ2dka045WExtLysxc2ptY1RYSENI?=
 =?utf-8?B?UUl4SDBmL0xpQkJzWTN3Q1VhVExibmQwbEFrN2IrV2J4R1AwNXJ2RzFKN2Ix?=
 =?utf-8?B?bXpVaTM1TEJiejR4MnVGd3FEOFJ6NGVTSmgrVERuckxWbENoa1FvVGVxYmd3?=
 =?utf-8?B?SlpqVXVBZlptZmlDY05QRUZMVTZZbXEzdUVhUndDeUhINnpHbXBMM3NuaTNW?=
 =?utf-8?B?RGswMnl6cGs1bSswd3Z1bHBOZk5lU1I5NjRYSWJFdzJQOHo4bzJTQVdVajBk?=
 =?utf-8?B?ZklmVGk2aWV1VVRmb1BPV1JqNkFSbmxhRC9OM2sxbTF2YTVCeDR6UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d66bd7b3-7005-4606-9d9d-08de624d61b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:22:42.7552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2gqAoA1v6I2KrmI1WO8QCMyStEQfbDUTMZo06vVrW6dtDmQgxUyPy2zvd+f3yNkrkuRvcw39f/XGW/jV/cOIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4417
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apopple@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: C867ECB929
X-Rspamd-Action: no action

On 2026-02-02 at 21:41 +1100, Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote...
> On Mon, 2026-02-02 at 21:25 +1100, Alistair Popple wrote:
> > On 2026-02-02 at 20:30 +1100, Thomas Hellström
> > <thomas.hellstrom@linux.intel.com> wrote...
> > > Hi,
> > > 
> > > On Mon, 2026-02-02 at 11:10 +1100, Alistair Popple wrote:
> > > > On 2026-02-02 at 08:07 +1100, Matthew Brost
> > > > <matthew.brost@intel.com>
> > > > wrote...
> > > > > On Sun, Feb 01, 2026 at 12:48:33PM -0800, John Hubbard wrote:
> > > > > > On 2/1/26 11:24 AM, Matthew Brost wrote:
> > > > > > > On Sat, Jan 31, 2026 at 01:42:20PM -0800, John Hubbard
> > > > > > > wrote:
> > > > > > > > On 1/31/26 11:00 AM, Matthew Brost wrote:
> > > > > > > > > On Sat, Jan 31, 2026 at 01:57:21PM +0100, Thomas
> > > > > > > > > Hellström
> > > > > > > > > wrote:
> > > > > > > > > > On Fri, 2026-01-30 at 19:01 -0800, John Hubbard
> > > > > > > > > > wrote:
> > > > > > > > > > > On 1/30/26 10:00 AM, Andrew Morton wrote:
> > > > > > > > > > > > On Fri, 30 Jan 2026 15:45:29 +0100 Thomas
> > > > > > > > > > > > Hellström
> > > > > > > > > > > > wrote:
> > > > > > > > > > > ...
> > > > > > > > > I’m not convinced the folio refcount has any bearing if
> > > > > > > > > we
> > > > > > > > > can take a
> > > > > > > > > sleeping lock in do_swap_page, but perhaps I’m missing
> > > > > > > > > something.
> > > > 
> > > > I think the point of the trylock vs. lock is that if you can't
> > > > immediately
> > > > lock the page then it's an indication the page is undergoing a
> > > > migration.
> > > > In other words there's no point waiting for the lock and then
> > > > trying
> > > > to call
> > > > migrate_to_ram() as the page will have already moved by the time
> > > > you
> > > > acquire
> > > > the lock. Of course that just means you spin faulting until the
> > > > page
> > > > finally
> > > > migrates.
> > > > 
> > > > If I'm understanding the problem it sounds like we just want to
> > > > sleep
> > > > until the
> > > > migration is complete, ie. same as the migration entry path. We
> > > > don't
> > > > have a
> > > > device_private_entry_wait() function, but I don't think we need
> > > > one,
> > > > see below.
> > > > 
> > > > > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > > > > index da360a6eb8a4..1e7ccc4a1a6c 100644
> > > > > > > --- a/mm/memory.c
> > > > > > > +++ b/mm/memory.c
> > > > > > > @@ -4652,6 +4652,8 @@ vm_fault_t do_swap_page(struct
> > > > > > > vm_fault
> > > > > > > *vmf)
> > > > > > >                          vmf->page =
> > > > > > > softleaf_to_page(entry);
> > > > > > >                          ret =
> > > > > > > remove_device_exclusive_entry(vmf);
> > > > > > >                  } else if
> > > > > > > (softleaf_is_device_private(entry))
> > > > > > > {
> > > > > > > +                       struct dev_pagemap *pgmap;
> > > > > > > +
> > > > > > >                          if (vmf->flags &
> > > > > > > FAULT_FLAG_VMA_LOCK)
> > > > > > > {
> > > > > > >                                  /*
> > > > > > >                                   * migrate_to_ram is not
> > > > > > > yet
> > > > > > > ready to operate
> > > > > > > @@ -4670,21 +4672,15 @@ vm_fault_t do_swap_page(struct
> > > > > > > vm_fault
> > > > > > > *vmf)
> > > > > > >                                                         
> > > > > > > vmf-
> > > > > > > > orig_pte)))
> > > > > > >                                  goto unlock;
> > > > > > > 
> > > > > > > -                       /*
> > > > > > > -                        * Get a page reference while we
> > > > > > > know
> > > > > > > the page can't be
> > > > > > > -                        * freed.
> > > > > > > -                        */
> > > > > > > -                       if (trylock_page(vmf->page)) {
> > > > > > > -                               struct dev_pagemap *pgmap;
> > > > > > > -
> > > > > > > -                               get_page(vmf->page);
> > > > 
> > > > At this point we:
> > > > 1. Know the page needs to migrate
> > > > 2. Have the page locked
> > > > 3. Have a reference on the page
> > > > 4. Have the PTL locked
> > > > 
> > > > Or in other words we have everything we need to install a
> > > > migration
> > > > entry,
> > > > so why not just do that? This thread would then proceed into
> > > > migrate_to_ram()
> > > > having already done migrate_vma_collect_pmd() for the faulting
> > > > page
> > > > and any
> > > > other threads would just sleep in the wait on migration entry
> > > > path
> > > > until the
> > > > migration is complete, avoiding the livelock problem the trylock
> > > > was
> > > > introduced
> > > > for in 1afaeb8293c9a.
> > > > 
> > > >  - Alistair
> > > > 
> > > > > > 
> > > 
> > > There will always be a small time between when the page is locked
> > > and
> > > when we can install a migration entry. If the page only has a
> > > single
> > > mapcount, then the PTL lock is held during this time so the issue
> > > does
> > > not occur. But for multiple map-counts we need to release the PTL
> > > lock
> > > in migration to run try_to_migrate(), and before that, the migrate
> > > code
> > > is running lru_add_drain_all() and gets stuck.
> > 
> > Oh right, my solution would be fine for the single mapping case but I
> > hadn't
> > fully thought through the implications of other threads accessing
> > this for
> > multiple map-counts. Agree it doesn't solve anything there (the rest
> > of the
> > threads would still spin on the trylock).
> > 
> > Still we could use a similar solution for waiting on device-private
> > entries as
> > we do for migration entries. Instead of spinning on the trylock (ie.
> > PG_locked)
> > we could just wait on it to become unlocked if it's already locked.
> > Would
> > something like the below completely untested code work? (obviously
> > this is a bit
> > of hack, to do it properly you'd want to do more than just remove the
> > check from
> > migration_entry_wait)
> 
> Well I guess there could be failed migration where something is
> aborting the migration even after a page is locked. Also we must unlock
> the PTL lock before waiting otherwise we could deadlock.

Yes, this is exactly what the migration entry wait code does. And if there's a
failed migration, no problem, you just retry. That's not a deadlock unless the
migration never succeeds and then your stuffed anyway.

> I believe a robust solution would be to take a folio reference and do a
> sleeping lock like John's example. Then to assert that a folio pin-
> count, not ref-count is required to pin a device-private folio. That
> would eliminate the problem of the refcount held while locking blocking
> migration. It looks like that's fully consistent with 

Waiting on a migration entry like in my example below is exactly the same as
sleeping on the page lock other than it just waits for the page to be unlocked
rather than trying to lock it.

Internally migration_entry_wait_on_locked() is just an open-coded version
of folio_lock() which deals with dropping the PTL and that works without a page
refcount.

So I don't understand how this solution isn't robust? It requires no funniness
with refcounts and works practically the same as a sleeping lock.

 - Alistair

> https://docs.kernel.org/core-api/pin_user_pages.html
> 
> Then as general improvements we should fully unmap pages before calling
> lru_add_drain_all() as MBrost suggest and finally, to be more nice to
> the system in the common cases, add a cond_resched() to
> hmm_range_fault().
> 
> Thanks,
> Thomas
> 
> 
> 
> > 
> > ---
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 2a55edc48a65..3e5e205ee279 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4678,10 +4678,10 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >  				pte_unmap_unlock(vmf->pte, vmf-
> > >ptl);
> >  				pgmap = page_pgmap(vmf->page);
> >  				ret = pgmap->ops-
> > >migrate_to_ram(vmf);
> > -				unlock_page(vmf->page);
> >  				put_page(vmf->page);
> >  			} else {
> > -				pte_unmap_unlock(vmf->pte, vmf-
> > >ptl);
> > +				migration_entry_wait(vma->vm_mm,
> > vmf->pmd,
> > +						     vmf->address);
> >  			}
> >  		} else if (softleaf_is_hwpoison(entry)) {
> >  			ret = VM_FAULT_HWPOISON;
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index 5169f9717f60..b676daf0f4e8 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -496,8 +496,6 @@ void migration_entry_wait(struct mm_struct *mm,
> > pmd_t *pmd,
> >  		goto out;
> >  
> >  	entry = softleaf_from_pte(pte);
> > -	if (!softleaf_is_migration(entry))
> > -		goto out;
> >  
> >  	migration_entry_wait_on_locked(entry, ptl);
> >  	return;
