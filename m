Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C9DA4B89A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 08:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083AB10E351;
	Mon,  3 Mar 2025 07:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/hixDIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D82710E351;
 Mon,  3 Mar 2025 07:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740988469; x=1772524469;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Blc2DgRNU0xq9QKjsr7yDgDoiHqcYhbZhfby9DRbOwo=;
 b=C/hixDInmADwdqDf/EEXw+ces3e+BObwpgQrRViQ8lJVORDiIZeklMCi
 DFhUgJ95P/xt0osH8wfzq3Zkzv7C3qcWEnHs6lw9CVodh0jIVUP5wjMrK
 lyRRkFbsv2YesxTKsMkOgdQ1M/kZo/DVOZbCZwY1QVAHietujr607fkio
 WHebIuR+xdSok/uJAA7Ud7lAsBuDyc0n7UWgTwJ4kt40wCaO/euhdfEH6
 f7QWyDagKnov+auTPJHup5IDmtoyeP76UPk/SuJDR0A6N7oBXDAyJVbSy
 IEYhOHLjdKhLZWdfnHaTteVEq/qMtMlEoIi2swJRCOOBji/P1g2mJWyQD g==;
X-CSE-ConnectionGUID: X9nzyjTORX6Qcs5CgUhK2Q==
X-CSE-MsgGUID: rVIjiFa1RKiP0920MdVFRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="53241984"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="53241984"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 23:54:29 -0800
X-CSE-ConnectionGUID: dAYL00pPTdqzPgNQgkogsg==
X-CSE-MsgGUID: k3pltcEHSEOZiaDPX8nSkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="122530310"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Mar 2025 23:54:27 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Mar 2025 23:54:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Mar 2025 23:54:27 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Mar 2025 23:54:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpAp1uGA+lNSs6JiAADjPgXbgLApehVwza4lseHBnaX0IhPOXLyY+a4Kyyek/ktkJEO/ggU8kJJ5egL5Yf8K5C29LamNQXzvx0X6ngU5GkF10PzknOaAfeG0mbNq6VQubNl0eukReliVuzdy5P0s7VHrnf2LdxIKpKB4OzzC2IYYWMyJVSYYNrFawWXehex+XNNDnGvCgXy2yy0hG7MqNe9j3EYFlC8KTFi/RlkN1w9VuYn94M2vEn/ydalDVf0UdMmVL6B0oolJncDc387I46OTR/cW/k4ycdis+I0uAXVdJTRzUwQlfppA1i8yMlgLMsXaji17HaWUcpYSpuRQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KUJV51pGMpIUJb/tLJfm/Pg9XN3goAgwwSddVu7qY4=;
 b=H67fHiSXLK9ye4S7Ky8zm1saasIMFwDo9RMQmLr0EvpqAVZUpo9dV/U11QCsgtRbopCD5YfsnJAhGNfHbcujWf/raPgJTaPrlDlLgX75mQ2INqQXnp+/SGAnwMVlHwYQKkjdFNLRrRsYNdJtfj3SUZdDZBZLY0tofxOWBbxqW8SFqT1U/sW9CI6UuXYcgDg2debkrTwCYWbZwcqo/9AExwD6MYPlULBHbqG/IOemjOQb6JilH+vU2D0QujO/roGR9Z2rzGVYUKbTkLSiMSTRQLN3QnCeMxc4c4cU09JKcr4PLh0c8ARnWrfKmhS5QuLj/WKp7FhBN3ygDFslqXYTCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 07:54:24 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 07:54:24 +0000
Message-ID: <3b4c67ca-6f01-45cd-aaac-ea2f6154b01f@intel.com>
Date: Mon, 3 Mar 2025 13:24:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <suraj.kandpal@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com> <20250217120808.708b9b4d@eldfell>
 <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
 <r62gomdqvh3sotz4v5zxrewkfcd6iqnzxcvwbe5e6rmtwcz5r3@z23mgdullqxz>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <r62gomdqvh3sotz4v5zxrewkfcd6iqnzxcvwbe5e6rmtwcz5r3@z23mgdullqxz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|MW4PR11MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a758ff-ebbc-4a4d-f295-08dd5a289d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1RpdStiazlzbmczSTk3QUx4cUtGYXNneXFiSGpUU0lxSDZBcW9PaGJma3hX?=
 =?utf-8?B?eG1qd3RXMUFOWm41K0NPYnF4SUtNNEx5ZDFTL1Z1OWV2TEE3QkhXK25PVVY0?=
 =?utf-8?B?ZklHU3hIOEV4WktCYXZsand4aldwMWZQQXFyQWZQM0VURWRDU0E4SDdSaVU4?=
 =?utf-8?B?blZxcjAybjUzbWE5elFvbFhqK0dTVnVQZEF6M1Nxd0dUcjROcS9hdnZ1aTcv?=
 =?utf-8?B?TGtZTTU0eVpWT2NoVElJN1Bwb1hoRk9tTmFMM0hDV21POTdFSnhhMzFXc3BO?=
 =?utf-8?B?RFRwVGxmVllLZTVUK0I2YUhDbS9zNU05VFpSMjdlVXpKTmkxeTZUS2FNZlZE?=
 =?utf-8?B?QytNUnJVZ1ViaEJDbmpMdXA4eVNDdUdveXlRcGNiZE8vUzdMOTZCY2xCeWwr?=
 =?utf-8?B?NUdqTGFHVklXYXltVXpWSHlGV2M4cVd5T0lIV2tvd2VFelBKMTM3L2VkNXM3?=
 =?utf-8?B?ZzVxM3llU0EzNUpISzFkUmJlMGZvOTdmVTJ4WUFpQWNCS0s0ODhPeVJyc1Y2?=
 =?utf-8?B?WlBYTWpTWHJZVXBydWl5RUt1TGljT255QkVwK0UxY1l6dGhuUlQwYmZHNmFp?=
 =?utf-8?B?blNqYUFLUW5qT0ZUemF3b0NubnhwejBRZytjVmI5cUJHZEZQTW5LZE1MNXNC?=
 =?utf-8?B?SGhtb3JIK3hBWUY1RnRad2tmRjhjWit4VWIxellCSTZWd1B1UzlGZHdEckZl?=
 =?utf-8?B?VUxqYlRhTVBxU2RVTDhLb0VZcE9BZTB1NzBiZ3AzeHJGMXJoaFlvVU9xVDF5?=
 =?utf-8?B?SzZ3WGtGOTUxVU5URjJodzFUYlE2SlgweSt5YjRqdm1vbmZId2NWbytNekxo?=
 =?utf-8?B?SXdOV3hUM1V1Yitlc1dsTTg5bkowRXBZbkJxRFVnczhRWHNTeU9adjJGUVZh?=
 =?utf-8?B?YVBUWWg0SDR1NmNsZ0pYeHYrSitLaDBnRzN1UmN3QmFHbHFBRmFlL3JnN01v?=
 =?utf-8?B?akp5WThQUGUxQ2FOaEhjcFBYVDNtWjl1NFo2N1BRK3k5OG5DRUFxeDJXeGVY?=
 =?utf-8?B?T1paak9SU3lLd09pYklvODFKcTVaVWRYYUhqV0Z6em10QklBeEpOVXJlYnd6?=
 =?utf-8?B?c1dGeEtkU2svWGZPcmxLTjdEaUFYLzRKb29WY0k5NXJrVTVpSHB4MzVtVkE2?=
 =?utf-8?B?b0dGb3Fjb1o2UGFDQkZvbTRuMms3RVoreWpsN3krdzB0TWpWTWkzMHZ0OXpr?=
 =?utf-8?B?UzZYZ0o5S1VGT2YyK09nb3JIa00yMm9LYzVpNmFRTGh4VXNmRUN4S29Va2d6?=
 =?utf-8?B?QU5wcDloaVgxZkVScEJGQmFUS0VkbjV5WmhRekttclVMWTFJdkE4OERMN21a?=
 =?utf-8?B?dktaRlRpNmxjQ0JZM3NyYy9DRUlPTVdMRm94TEZWaExiWFBVOXVqWFQrRmNk?=
 =?utf-8?B?VUlVK01sUUxjcXVxbEo0S09SRGU0NzBDS1JBQkdUQW5YaEErS051UzhlUEVK?=
 =?utf-8?B?MEg4aEI4TDVkL0VwOUhoUm5QNzB6b2hsdGRBM1BzRzRwTGc3UWNHNGl1YlpK?=
 =?utf-8?B?TXI2SXdDa2IzZFRZeEVBM25EYlY5bmwwd2hOaU5qZDdGa3FiWlV6NmJnZWxI?=
 =?utf-8?B?RGR0Qm16T21WbXNYaFpoazNHNGdDbStDL0ZkbnBoVnM2YWVqd2FETEFIcDd5?=
 =?utf-8?B?NGpjYnluc01XdjVlSWJneEZuK253dUtNa051UVVRYkdHTUdzdk51VXJzYXIr?=
 =?utf-8?B?QUI3WG9OT1BBTVQwMW0ySnlXT3puaDJWZDFxaFdzdHVyYm0vbXF1OWF6L1VI?=
 =?utf-8?B?Y0p5U2M2b3pxYkNNZG93c2xuYnI4RFZnd29kemVHRmVYYmZUV1Jjb1pqMGFE?=
 =?utf-8?B?d3ArOUhIMmdMa3lZem1tSEZzTTB4bGFUdE9CZ0hrcFVaYVFiZVZLcVp0WWFB?=
 =?utf-8?Q?jOfiWLAGVDbYc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGdaNzNtYW1hNkdTZGJqU05wMWRRTHV1c0krZWpDREM2Um1WT3k5NVFFY2lD?=
 =?utf-8?B?bXpXUkRoMVlyb2ZRRmZ4MWJCSkswZU9nYXZnWTQ5dUg4bFFZbis4MFZyck9v?=
 =?utf-8?B?aFQvTnZDYVV2MmQ0dTkzT21mRUpkSzFjekU0Nms5MnZGRXdXaUY5Zm1VbWVr?=
 =?utf-8?B?bUdqWU44M1BCOWtFK0FvQXY3VVFHV2hmZ3hVWmN1bDI3TEpQYS8zaXMwektx?=
 =?utf-8?B?L01kWm9PSTdxRWF5WFN5TDh5U3ludDBOd0JOZkF0VmxpUzdEUjJJRkxDczJC?=
 =?utf-8?B?QjhWS2gzSnVwbUdyODVEcGZZak0wZFFMV0JVZUp4U0h4aWdDRi8xS2laWENN?=
 =?utf-8?B?NERzQTM1S2pjR2JFUjNXL3FCaDFUM20wZ2hxTVJaWGlPa3JVVmhydFpzSHBU?=
 =?utf-8?B?VmhPcVBZa3JRck5vZTdqazYyamw0N0t6YVVtdjdCSTN1dE5DUzJLSER4Vk10?=
 =?utf-8?B?LytYc0FibWNqR0xHUU9kNksxamFlSkcyc3dOMVVueGwrK0lnM0hwNWd5YjJH?=
 =?utf-8?B?RXdpM252bWdTdGhUdTRIU2hSQ0lCb0FEK3NYRTFtZ25nRitlOU9DdTBIRS9x?=
 =?utf-8?B?cnpLdk9XOWI1aXB3MnE4cFBuMjhUMm5jMjRjNHB3dHA1bkd1bUhEajlDUVRJ?=
 =?utf-8?B?SVA0dEtMS24xUysyT1E1cXZaMUNSQWdnTE1qdVQ0MEtLRG5obGU2cGlwTzlZ?=
 =?utf-8?B?aXFxVGZvYWNnTWhXV2RLdjl4NjVHNnNMYkowajVCd1Zvc3JXRWJIZ3psaWRH?=
 =?utf-8?B?bGZuMkNzbDlQOGVidkV4T0lyTVcvWS9SVExWTmZFbnkyUUc1U1pKL0JlMnJT?=
 =?utf-8?B?MlMxRHZ3cUdaVC9jSWx0clg2VlBjTGRacitkc2FicGdMQkczcFcxWW1KZVFz?=
 =?utf-8?B?encxQ3lES1JnamNSYUZaQ2UwT2piemlKbzFkYjdhSUprTTloQjZkajdyUXlE?=
 =?utf-8?B?RzBJNWNnNXBqYXBic0N2dUV0dVJJclpnM1FRNzNLN2ZIQTZCT0s0QWxhMHls?=
 =?utf-8?B?VGI2U2kxRi9LVDFLcWZSVzU4c0gvRElrQTBSZ0ZqZDJWUEdCZ3NWaExvZ1Zk?=
 =?utf-8?B?UElROGVFdmg1NlRWcnBPZ1VnMU0rVUpkcXdYQlJqb1hHTkNqdUYxODVsQXpY?=
 =?utf-8?B?UlhKVjFpdEdOZ1BqUkdlOVRxeTZmUzdocmJhWE1lWGFMLzhDdU1SOURKU2pz?=
 =?utf-8?B?R0dRR3h4dDkwT281SFZZTERneGRIWVpMWWkyYU9GeDVEanVpOGk5enpZZk1P?=
 =?utf-8?B?MEl5cFNxY1RGaHMvVWFFendZMHROZFNZa1dyWDJwZW8rUDdiNUxVZjdRcDds?=
 =?utf-8?B?YXByazllVlE4aXk0REczYlBjQW5OcUhCemhjZDhBdUhBYXdWVDF1ZGVkVlht?=
 =?utf-8?B?NEF0MzhOa3J1MFByMUhmbHV5S3NVZyt5aGhZYjV0U1JRbU1iK3VLbW01VUZn?=
 =?utf-8?B?dlg0Qk81ekRBK2NHbWlkY3BXYXM3a1pxRUFaWXdhV3JpOERrZlRKNUNVYmx3?=
 =?utf-8?B?ZFZLay9sc3BUNnZhUE11aE9ZMnQzT0FBMUZEa1ZQUytqQ05tMmhIcTZ2bEpm?=
 =?utf-8?B?cXk4eWoweFRSaGRpVnU0RDhYWnVNOExwYjJleU1OT1g4R1lXNXpjcWNucUVP?=
 =?utf-8?B?MUg3TDFrK1BGaXRCSDdEejd2WnJ4MmN3emxYKzk5blVNM09LNzQ1a1VRMWhy?=
 =?utf-8?B?ME1PYWpCMU5UMm01aTZBTVE2dlB3dzV2K2pwbmdHbjU3bVp6MktUOFBsSHZp?=
 =?utf-8?B?TmlsU2s1VWw2Z21xczJCdzd4M3M3T1c1UUY3TXovL0JsczU1SDNmZDBiaHQr?=
 =?utf-8?B?Z0hUcnlrSTQ2QWtGUjIxQmZnY2VpQkJTcnpKZGRQSVhHTWt5aGN1U1lGRW04?=
 =?utf-8?B?dkUxK0VrZEs0aExIUm9TeHZhUmk1TVZsa2hqR3BlZXkwRzkxT2dxb201b0V5?=
 =?utf-8?B?T3RSbS9Yd1YwQWVLUjBSNHVMaTM2cnI4N09yQUhvQWdUSVVhVXB6QVBrV2pB?=
 =?utf-8?B?TVpvVlFKSHdlR3BrVVdjRmNZTG5NRmU5V1BpNFRic0w3bktQcm5NdHA4aXg1?=
 =?utf-8?B?YW5ydUNoZ25JMUk4d3dvdkhaWHVDc1hSQ2VOUzNxeFczbjl2dGxlc1FBa0Rt?=
 =?utf-8?B?SjUrU0gySHczN242bE5WYUsvWDIvU0d0SVdFcTNLWmxJUG16Z1J5bUdjaGo3?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a758ff-ebbc-4a4d-f295-08dd5a289d14
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 07:54:23.9944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOAE0337/LT231G+ltj0Q+IoJSBuUOxyP+jtxxoJDWn/dal4xKn3Cua4aS5O7hAiXNDm2/VA/ICwdA5qMacyOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
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

On 20-02-2025 21:56, Dmitry Baryshkov wrote:
> On Tue, Feb 18, 2025 at 11:13:39AM +0530, Murthy, Arun R wrote:
>> On 17-02-2025 15:38, Pekka Paalanen wrote:
>>> Hi Arun,
>>>
>>> this whole series seems to be missing all the UAPI docs for the DRM
>>> ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
>>> replacement for them, I would assume both are a requirement.
>>>
>>> Without the ReST docs it is really difficult to see how this new UAPI
>>> should be used.
>> Hi Pekka,
>> I also realized later on this. Will add this in my next patchset.
>>> On Tue, 28 Jan 2025 21:21:07 +0530
>>> Arun R Murthy <arun.r.murthy@intel.com> wrote:
>>>
>>>> Display Histogram is an array of bins and can be generated in many ways
>>>> referred to as modes.
>>>> Ex: HSV max(RGB), Wighted RGB etc.
>>>>
>>>> Understanding the histogram data format(Ex: HSV max(RGB))
>>>> Histogram is just the pixel count.
>>>> For a maximum resolution of 10k (10240 x 4320 = 44236800)
>>>> 25 bits should be sufficient to represent this along with a buffer of 7
>>>> bits(future use) u32 is being considered.
>>>> max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant 5
>>>> bits, hence 32 bins.
>>>> Below mentioned algorithm illustrates the histogram generation in
>>>> hardware.
>>>>
>>>> hist[32] = {0};
>>>> for (i = 0; i < resolution; i++) {
>>>> 	bin = max(RGB[i]);
>>>> 	bin = bin >> 3;	/* consider the most significant bits */
>>>> 	hist[bin]++;
>>>> }
>>>> If the entire image is Red color then max(255,0,0) is 255 so the pixel
>>>> count of each pixels will be placed in the last bin. Hence except
>>>> hist[31] all other bins will have a value zero.
>>>> Generated histogram in this case would be hist[32] = {0,0,....44236800}
>>>>
>>>> Description of the structures, properties defined are documented in the
>>>> header file include/uapi/drm/drm_mode.h
>>>>
>>>> v8: Added doc for HDR planes, removed reserved variables (Dmitry)
>>>>
>>>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>>>> ---
>>>>    include/uapi/drm/drm_mode.h | 65 +++++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 65 insertions(+)
>>>>
>>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>>> index c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..b8b7b18843ae7224263a9c61b20ac6cbf5df69e9 100644
>>>> --- a/include/uapi/drm/drm_mode.h
>>>> +++ b/include/uapi/drm/drm_mode.h
>>>> @@ -1355,6 +1355,71 @@ struct drm_mode_closefb {
>>>>    	__u32 pad;
>>>>    };
>>>> +/**
>>>> + * enum drm_mode_histogram
>>>> + *
>>>> + * @DRM_MODE_HISTOGRAM_HSV_MAX_RGB:
>>>> + * Maximum resolution at present 10k, 10240x4320 = 44236800
>>>> + * can be denoted in 25bits. With an additional 7 bits in buffer each bin
>>>> + * can be a u32 value.
>>>> + * For SDL, Maximum value of max(RGB) is 255, so max 255 bins.
>>> I assume s/SDL/SDR/.
>> Yes, sorry TYPO
>>> This assumption seems false. SDR can be also 10-bit and probably even
>>> more.
>> Yes but in practice majority of them being 8-bit. So have considered 8-bit
>> for illustration purpose only.
>> The design itself should accommodate 10-bit as well.
>>>> + * If the most significant 5 bits are considered, then bins = 2^5
>>>> + * will be 32 bins.
>>>> + * For HDR, maximum value of max(RGB) is 65535, so max 65535 bins.
>>> Does this mean that the histogram is computed on the pixel values
>>> emitted to the cable? What if the cable format is YUV?
>> Yes, again the illustration over here is max(RGB) used for histogram
>> generation.
>> If YUV is used or weighted RGB is used for histogram generation then the
>> mode will have to change and accordingly the data for that mode.
>>>> + * For illustration consider a full RED image of 10k resolution considering all
>>>> + * 8 bits histogram would look like hist[255] = {0,0,....44236800} with SDR
>>>> + * plane similarly with HDR the same would look like hist[65535] =
>>>> + * {0,0,0,....44236800}
>>> This SDR vs. HDR is a false dichotomy. I presume the meaningful
>>> difference is bits-per-channel, not the dynamic range.
>>>
>>> It would be good to have the pseudocode snippet here instead of the
>>> commit message. The commit message should not contain any UAPI notes
>>> that are not in the UAPI docs. OTOH, repeating UAPI docs in the commit
>>> message is probably not very useful, as the more interesting questions
>>> are why this exists and what it can be used for.
>> I have the pseudocode in the cover letter of this patchset.
>>>> + */
>>>> +enum drm_mode_histogram {
>>>> +	DRM_MODE_HISTOGRAM_HSV_MAX_RGB = 0x01,
>>> What does the HSV stand for?
>>>
>>> When talking about pixel values, my first impression is
>>> hue-saturation-value. But there are no hue-saturation-value
>>> computations at all?
>> The computation will have to be done by the user in the library.
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_histogram_caps
>>>> + *
>>>> + * @histogram_mode: histogram generation modes, defined in the
>>>> + *		    enum drm_mode_histogram
>>>> + * @bins_count: number of bins for a chosen histogram mode. For illustration
>>>> + *		refer the above defined histogram mode.
>>>> + */
>>>> +struct drm_histogram_caps {
>>>> +	__u32 histogram_mode;
>>>> +	__u32 bins_count;
>>>> +};
>>> Patch 3 says:
>>>
>>> + * Property HISTOGRAM_CAPS is a blob pointing to the struct drm_histogram_caps
>>> + * Description of the structure is in include/uapi/drm/drm_mode.h
>>>
>>> This is a read-only property, right?
>>>
>>> The blob contains one struct drm_histogram_caps. What if more than one
>>> mode is supported?
>> Multiple modes can be ORed. User will have to choose one of them depending
>> on the algorithm that he is developing/using.
> No. Modes can not be ORed. The structure can be applicable to a single
> mode (e.g. user settings) or to a multiple modes (e.g. caps).
I meant the same. KMD can support multiple modes and when setting the 
config only one among the supported mode will have to be choosen by the 
user.

Sorry if I created some confusion over here.

Thanks and Regards,
Arun R Murthy
--------------------

> So when the struct describes a single mode, it should be just that
> mode, enumerated linearly, starting from 0.  When you have a struct
> which can actually be related to several modes, it should have a value
> of BIT(DRM_MODE_HISTOGRAM_foo) | BIT(DRM_MODE_HISTOGRAM_bar).
>
>
