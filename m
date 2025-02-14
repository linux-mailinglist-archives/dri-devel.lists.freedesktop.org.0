Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF34A35AD9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 10:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66B810EC32;
	Fri, 14 Feb 2025 09:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WneuPq0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275EE10E273;
 Fri, 14 Feb 2025 09:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739526773; x=1771062773;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HTbo4HV+6umoeLRmk1rlPPN3tC7+HoC+PgloXILpGsE=;
 b=WneuPq0KT2cFJ0731U8VQFa1dvcq9tTR6EujTjLJKKedQhlyiL9q+tL+
 AtPA4HcDrcnYC7sGck4P37WKE2Dtbhwd0xf4FbH6wAnycR+mLd+NIN7xC
 YwLyo10rQIe65GO4my6qbwoqfwSss/2v6nZsvBj71vReBBU7hDehU2aJO
 XmtWUgXuX97Hj6kppzOnqJOk6Xzvx1rkMucyckBshze1hte87IVS71FLD
 dL2Zh7gQQPphfSeL6WhFE0MzeEAsLGfmZqy/bW4OLOjevfHclXD8caLmM
 FpOzUN4YJ+S+wwY2g+MLw4SJtuPf6HoAXWJ7n92b3An8V0ThrqZytabB5 A==;
X-CSE-ConnectionGUID: JqCj+BG7T4iEnZdt/JfYMA==
X-CSE-MsgGUID: 4wZnVqafSlqoOV2yuwXVmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40415674"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40415674"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:52:53 -0800
X-CSE-ConnectionGUID: RrDqdqkwQt6eUD5LbwjL6g==
X-CSE-MsgGUID: RJydR5EQTsKzDLwABdvHPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117543540"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 01:52:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 01:52:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 01:52:51 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 01:52:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6C3mCPnpepTkqQ0xMcbVvp8FDz6eHE9aYNSnlVqykGb8JfKu8+RPPrE0eXUMtX6Nxvid3k+3gGcXeAzWFLhCjfA52bwQSL+Ynhirl9iSWXWL+lpyMAqKoI+o2ZOvc3iP+Jzr9CHSWZYDdzSWbfjHvyqCkswhP6WlY+qUO+MFJjqJ240mJcuHtb3S0CDtEos8v21P4/e8PLYehVKX8nkEXo8BYET9Q1ZT+adeXFFH/sWbn/V4wjTkdVV4TPK4At6ZWQ59feUWe03DHo30IsRp9bzWEIv0QE/b+qypvlNeNSRxGxbElYpZoPoweYmbxgAPlltkH/FgTFj12VHL0X/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmfM5ujNT6t0SQEl3IkGtBQ6V2Hu/pl1vAAx3SS19kI=;
 b=EHXJ6XyoWw7U4TryCFzrMb25MCQnoH7Kj66gwyU247OEdQhmNzvWt1kB5GM+nc+66HhbmpGUW2ZWVUtPZZOb60BL5g9xLkOJWSwoUgT7oY821+pAJSIu//EyzrHVIwrXmHPFZ4vvDd7da54hRH0lPM07mrXxwAa7EQBbXrE98zgFH9fmV2JEQSZoqbi4hBex4E+tMLRxVCkLoOSYP9dWS4EjrdYN/u32kVJu2Yf76l8cJDIGnpY/5hIRo7PkOL8MG8vXHy8bHDF6BZH72wNkq9ouJm8KtIzp+8rXEpDxscNwALgOipLr/jqvp0h4jB7Gx9lKqBMFZ/I1GZRTlyw39w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8211.namprd11.prod.outlook.com (2603:10b6:610:15f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 09:52:36 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 09:52:36 +0000
Message-ID: <257fdde2-cfa8-40b1-b3c3-a530ea6d0e41@intel.com>
Date: Fri, 14 Feb 2025 15:22:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/32] drm/xe/bo: Introduce xe_bo_put_async
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-6-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250213021112.1228481-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b6197b-f87b-4e94-bb1f-08dd4cdd4f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnVnanV0dVpmZjJJd2sybURmdU9lK0lSWU85K3A5UU1iUDR0N1FuRDRBajFZ?=
 =?utf-8?B?b09zWTB6TjEwaW5nRzU5WkdEcHQ0WnM5WkNLa29DSG1hMVF3MDl4VHF1aWpt?=
 =?utf-8?B?cHVUOElMZDViT29BdkpiOG1tamhTdFdUSEZGdDZKSUZFVlBCbzhWbGxFZHgx?=
 =?utf-8?B?Kzl6cXhlTXJ5R2hWQVU2MDBxeDdpYVBLRlErMFNXUXZ6WVVPWGNzUUJpeExP?=
 =?utf-8?B?bHBzNmNkTmZidThOT2w2eGpUazZzVVpUSFp4bHVVYWZjUW1kSER3MEl2L01o?=
 =?utf-8?B?L2Y1blBRbTlEWVRCN29TREZ4RlNEcFU4MUdCajFyYlR0S1lHRHQ0N09FVW04?=
 =?utf-8?B?dTBKL3FmYmFSZTB1aTladlVYQUpwYWtYNU8rYTJ1S0twRzE5WlI2dVpaZ2Nu?=
 =?utf-8?B?RWxBdFFOZkM3Qld1bEdIMXRUMmRKU3lxbEFtQUZoVGdoUktHWE8yZTNXcXVE?=
 =?utf-8?B?YUJ4NEcyUzNIajdlM01IajFXbERScDdCdjZ2cC9Bb3RpZGVqK1VTQnVDbUtw?=
 =?utf-8?B?MDdsNTl1OVFiWDB4U0JjdXBqTkJJd2hCUzF2YlZOTURWYXo4b3dBcUZwV3BC?=
 =?utf-8?B?NFg3MzhtR2VoY0Z0RWcwblE5OU9pSS9FQkM2MS9DRU4rbHlWOWk4VkhKNktQ?=
 =?utf-8?B?cDZCSnB6SzRaZHFmMWx6YmVyeTdpc3R5Q1JpdDhyOENyRlh4UXo2Z1BGa2xy?=
 =?utf-8?B?Kzd2VGMrS01iZEhWRXZzbzZENi9uSHkrUStVZ2Rpc2ZVeXd4M1l4cFFRV0po?=
 =?utf-8?B?SWl5VlVDM3pIdU9OVkxTN2hHOHFGSWNHVWVId29xZFlrSHF5OWZCa0gwTGZv?=
 =?utf-8?B?bVpldTBnRmx6OSs2SHpoVmJyckR6TnRiUXN2WjY2ZVV1cHMyeFMzWlZ5WmNw?=
 =?utf-8?B?eStRb0Ixc0hOVGIwMjJIZ3cwU0xVT09BUWEvTStWS3dMVlJYeUMxVklwZEFr?=
 =?utf-8?B?amYrVXEyOGkvVjQ0aXFudDhvbm9MKzB4Tk1CRFpVcHo1SHN3RFd4R1FSZVNx?=
 =?utf-8?B?NWhSQWxxMUxqbUxJUG92MGd5eVpMY0RZR3RVYThkb3VjbWVjUUdPTlgvdWR2?=
 =?utf-8?B?UGlPL1M2L0oyaWVXNmdqbjNOYnF6akZRb3l0ZXYxTmluZTdNY0VpK2dCZjVF?=
 =?utf-8?B?MTY4NzdBNlFSODUyUGJnTEJobE9jbDZIWUxSTVRUcVBrRENkVCtyUGQ4NGZm?=
 =?utf-8?B?WGZsQXBhZUVDZmttd2JFMkRwZEpSMG1ZNng1RnB2WEFGNjJ5MDd1b1huVldE?=
 =?utf-8?B?QzA4eUkwWnV2OHZYdWlUaG5zb2pVZzlYZ2o1bVFDcFNUeHZTWGRqWnB2R1Z1?=
 =?utf-8?B?c3JiRTRTRi9idkFzTld3UWtac0J5M1ZrQ093Vmp5Tm5wWnBUZXQxcjBZcUpt?=
 =?utf-8?B?VU04MEg1TE9nb1pDa09ZSm9kR292VWVuRWl6WXpRL2M5OUtVRFc5c1BQcmhY?=
 =?utf-8?B?QlpJTjd2WkZpWnpqOXczbndldm5yUGRJZlN2eHQvOFVaZ0wwSERTREoyN3Nn?=
 =?utf-8?B?QmdYOWswNC9kY0xXakY0cXVlMzRhUmZPOXRIa3NLdWt2N21XNklHdHRjbzl3?=
 =?utf-8?B?WFVuQ1dGelUwWDJMVjhYaVlEMDJYU3Q3VkZLcWtLWktSOU9KOFdVSTgrcUNU?=
 =?utf-8?B?eUFUV1l0OEFsZ29XRmZKRGo0VjllSmNSRDVHRmJXZkRTOW1xR3BWbnhRdDdQ?=
 =?utf-8?B?cW41c0dLOEh1b0tiRjdhbCtkZGdoUGZ3b3duYTVqV0VVY29BOWpZWkE1cXEv?=
 =?utf-8?B?NUkxVEZlYk9jN2JUYkQwclZOV0ZlTlBJbS90bm9WRll6VGpUTE0wWU9xNGM0?=
 =?utf-8?B?aHo0bXdPZ2o0OFJGWGdxendjMEdlblNCMU5qVnF0VHFSYUtQSW9wV0Fqek5x?=
 =?utf-8?Q?nnrGNtNWt9FkL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG9QR21yRk9BUXhLOEdYcmk1RURnazJtWHp4V1JLNlV0bW9HK1libnJXYVNQ?=
 =?utf-8?B?YVE2eFpDSjRtL3JlMmlDSzZ4VXViZm5WOGZYNU1Oc1pmTXJZR25oSklqc2tj?=
 =?utf-8?B?UVNXWlZDaGVzRlFGZHZya2ZrRDExYm1iOUlSQU4yaUFYT0pxdkdTYjQyRE8y?=
 =?utf-8?B?UHIxdDFnSlpYTExidDRrSDEwcGQ2SUlpWW5IR09EUWZFMlRQdWVDRXdMbTJr?=
 =?utf-8?B?TXFWenh6SXlxNzlYcDY3WUpCb2d3MFlKT1JMREE5T2IyR0xHK29DZHJLZUxM?=
 =?utf-8?B?SnM1M1o3ZnEyZzhRaDFmdnVsNGd6c1RMRzBSeExqTVhGaUtNTi9nZlRSV0ZE?=
 =?utf-8?B?Z0htTEd4UGhqVWdoUTduZmF2UEtpK0ZlWk9OWWZyUDlrSkcxV0NnTEtUWWJM?=
 =?utf-8?B?TnRNYWpDQnFOeXdHM0pQYkN2OXd5T0lvY0oyZTNabmVBV2R4RVlMMjExeDd0?=
 =?utf-8?B?aUREcWwyOVd5OTlWWi80Z2lkZVR6UEFKbWR6M3FWWDZnNGhrZXJIei9TeWh4?=
 =?utf-8?B?clVPR3hDYTA0YTNDN0xadXh0UVFzaEVaYlVwN1V0WmhIQUxkWWwwcDBBRzR5?=
 =?utf-8?B?L3VlRVpYdWhoRVRsSjhkaUthQlJKNUJ1UUJzc01LVzBPWDZGV0hlanJoQ3JT?=
 =?utf-8?B?RWk1N2F1RTdNc3dDU2hLbDQvdTNjczh3aDNWMFlHTE9aSVpTMDhscXJHc1BD?=
 =?utf-8?B?djZPcFNTdmtyWFE1bEE3c1NQZmRkdWJYTEdERXkzczhYL3Zkd2lsSXlzYnEy?=
 =?utf-8?B?Q0FuMW4wNjVTVVFKNFoxSkZjYjRFYVNQbXVNdmNjYjdnOUFwRkc3ZmJLY3h4?=
 =?utf-8?B?ZDFKWm1ZYU5GVWdXYjcwS0cxWHdLcTg0ZzNLM0MxMnVSNlJRSzZ4VlBMNWho?=
 =?utf-8?B?TGVLcG1ZcFRrTGxUNXhSNC9jajlvcTlVOTM5VGdBS0JDNXp3ZGFXdm1wa3pT?=
 =?utf-8?B?L3ZxZXl5MnpoSTYzM0s4OWpCU01iMHg1UkFKc3ZhVytSWGNaNmR2VUhyK3Qw?=
 =?utf-8?B?OVdMOVZadVh0TWdlMGFCVW1KdWhELzRiZWZWamdqQjZrQjZLVzF4WUsrWmhr?=
 =?utf-8?B?THRIakc3UXFhSThIbW9WUWRsMlZCb3AvV2hPZ3lzeEJabnVuWmRyY3g4ZW4y?=
 =?utf-8?B?RXZ5bnZyM1VTajlLY21jcFdCSHdpUU0veHB3VzlFbEl2NVh2SlBibSt4TkRn?=
 =?utf-8?B?dTFSaEh2VWZQdkJsQmZVMVhZdm8xZGhldkJTazVoaHpyZUtyUXNQc3U0YTB2?=
 =?utf-8?B?aVlGeU9BQmdReFZrK2RLNm44NlpzY1IzTFVhanZxUm44M2VYSDh1VVJ1NlRq?=
 =?utf-8?B?cDBla2xaekVGUEwrMVF4a003OXI5eFFJdWx0WGllQkxGVGFFMDl2MmYraXEw?=
 =?utf-8?B?RXM3UzFNR1IvbnE0ekNpYkZ2RDFiNmtIMFJGZHhnSEFYNmIyWGRLNGJ5bU1J?=
 =?utf-8?B?cjNoZzBBcWt4UXYxbG5oK3ZUckpISVdFMFQ4MXBHRnEremFkYTFwSFo2bjdE?=
 =?utf-8?B?eUVLVTdkaTFEZmRYQUt1ci8xaDd1U0dXcEZRdkZ2Smk3OS9jMU5veXVYUHJP?=
 =?utf-8?B?K1g3QUhKZHE2VDhKWjdtNnd2VS9nbzBVU0MyclRLczBsaHVUSlNvNkJnamVh?=
 =?utf-8?B?bGI3dmZBZFFFcjROcDg2TVc1Tyt5UGF1ajFZUUIzUm9WcWs3YlFONDhNKzVR?=
 =?utf-8?B?dWd1WmowaDRWSEQ4YTBINDY1VW1xNlNQUmYwSU9FMGJBaTRMNkpBTXVRN2Zn?=
 =?utf-8?B?K0w4YnJ1TkFZVUg4Q3pzTGF5TEF5eFdHbjg4RzVIeTUxY1VjSW16ZHc1SDBx?=
 =?utf-8?B?Q2s0L0RnN3Y2Z1ZzZ3lDVlZSa2xFeFNiMGxkVGhoNDFkVWtHWlZScGd0cUF6?=
 =?utf-8?B?Y1l3b2RTempubkZiaUpWSXZ2cU9hM0htcGxKeXVQYzJJYTFEZTRHc3hNZVdn?=
 =?utf-8?B?RGRjN01uQkNSZ29xRzdqZFlTbUxlc1V6TmIxM3Y1YzBhWXVJNHhWUUhrenRu?=
 =?utf-8?B?TmJPclV0ZzZVU2Z5MHE0K20xaFE5UjJFTm9kMTNnWnZYZE43VU9wb0xCbTha?=
 =?utf-8?B?N1NuL3pUc3MzelM5RkRMZzBsZFRsZXBYZHNaSWRvWTFUQkwyN1VBcjNRdmZn?=
 =?utf-8?B?dnY2emZ3YldXOS9JNmIvZnQwMzc3WHY4S000alovTGlxalRYeXJoZW0xQ2FV?=
 =?utf-8?Q?Lw3nxhRPI8sauuBHPLsfN6w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b6197b-f87b-4e94-bb1f-08dd4cdd4f67
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 09:52:36.3049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwooJs8L7s7y5aYvIQ3vxwgE8jx7VfhHexhxOE/pysxMofqI16E+ddqWwGh+cOZINjNSMg8UX4a9lC7wrYEbuZOcuicwgvF5yS7YaKTP2aM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8211
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



On 13-02-2025 07:40, Matthew Brost wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> Introduce xe_bo_put_async to put a bo where the context is such that
> the bo destructor can't run due to lockdep problems or atomic context.
> 
> If the put is the final put, freeing will be done from a work item.
> 
> v5:
>   - Kerenl doc for xe_bo_put_async (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c           | 25 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_bo.h           | 19 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device.c       |  3 +++
>   drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
>   4 files changed, 55 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cd1c693c0b62..a2a924b531e5 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2644,6 +2644,31 @@ void xe_bo_put_commit(struct llist_head *deferred)
>   		drm_gem_object_free(&bo->ttm.base.refcount);
>   }
>   
> +static void xe_bo_dev_work_func(struct work_struct *work)
> +{
> +	struct xe_bo_dev *bo_dev = container_of(work, typeof(*bo_dev), async_free);
> +
> +	xe_bo_put_commit(&bo_dev->async_list);
> +}
> +
> +/**
> + * xe_bo_dev_init() - Initialize BO dev to manage async BO freeing
> + * @bo_dev: The BO dev structure
> + */
> +void xe_bo_dev_init(struct xe_bo_dev *bo_dev)
> +{
> +	INIT_WORK(&bo_dev->async_free, xe_bo_dev_work_func);
> +}
> +
> +/**
> + * xe_bo_dev_fini() - Finalize BO dev managing async BO freeing
> + * @bo_dev: The BO dev structure
> + */
> +void xe_bo_dev_fini(struct xe_bo_dev *bo_dev)
> +{
> +	flush_work(&bo_dev->async_free);
> +}
> +
>   void xe_bo_put(struct xe_bo *bo)
>   {
>   	struct xe_tile *tile;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index f09b9315721b..9dfec438d1c7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -322,6 +322,25 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
>   
>   void xe_bo_put_commit(struct llist_head *deferred);
>   
> +/**
> + * xe_bo_put_async() - Put BO async
> + * @bo: The bo to put.
> + *
> + * Put BO async, the final put is deferred to a worker to exit an IRQ context.
> + */
> +static inline void
> +xe_bo_put_async(struct xe_bo *bo)
> +{
> +	struct xe_bo_dev *bo_device = &xe_bo_device(bo)->bo_device;
> +
> +	if (xe_bo_put_deferred(bo, &bo_device->async_list))
> +		schedule_work(&bo_device->async_free);
> +}
> +
> +void xe_bo_dev_init(struct xe_bo_dev *bo_device);
> +
> +void xe_bo_dev_fini(struct xe_bo_dev *bo_device);
> +
>   struct sg_table *xe_bo_sg(struct xe_bo *bo);
>   
>   /*
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 36d7ffb3b4d9..756099e870cd 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -388,6 +388,8 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>   {
>   	struct xe_device *xe = to_xe_device(dev);
>   
> +	xe_bo_dev_fini(&xe->bo_device);
> +
>   	if (xe->preempt_fence_wq)
>   		destroy_workqueue(xe->preempt_fence_wq);
>   
> @@ -425,6 +427,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   	if (WARN_ON(err))
>   		goto err;
>   
> +	xe_bo_dev_init(&xe->bo_device);
>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
>   	if (err)
>   		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 833c29fed3a3..6a41f608a7a1 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -525,6 +525,14 @@ struct xe_device {
>   		int mode;
>   	} wedged;
>   
> +	/** @bo_device: Struct to control async free of BOs */
> +	struct xe_bo_dev {
> +		/** @async_free: Free worker */
> +		struct work_struct async_free;
> +		/** @async_list: List of BOs to be freed */
> +		struct llist_head async_list;
> +	} bo_device;

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> +
>   	/** @pmu: performance monitoring unit */
>   	struct xe_pmu pmu;
>   

