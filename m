Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD89CA467BD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E41F10E96E;
	Wed, 26 Feb 2025 17:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7gK+W6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8685910E96C;
 Wed, 26 Feb 2025 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740590197; x=1772126197;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=844tWVq5KwJlvd589c8TgLiNcL9lSjPaS6HZuHqCqtc=;
 b=Q7gK+W6FCJ4oTlog5/ppuwDpgxddWhz1kzVDB42PVsqPSsS9iOSmikVJ
 jlQcb0bHKRKuKbGotJUTDtQp/ytJ2cWr80MvrmuM3EeFN82xikAvfJASM
 UZyPZY9M0XrNVErZNqkMlQmZ9rjnlAaisZxBYsC1B7OdRay6nTB9O4DwD
 Eb7FcB5np4cufCVggF1aFkPkERKM7BsAm0FAfJLFX4jZf3kzD2yL4Vf0z
 ddC7XENL+4p3r0lG9YR1N7Y/6rbVfP9ytRVCwp8C4biw5Xmeg0QaK9N/c
 1tJ5Z3LOIJPvTPcIOXKI1nRJxVQopgOo4LlL0g+VKrYFKVFDgo1V9amAm w==;
X-CSE-ConnectionGUID: GitpnS9tQDyuvr5msevYyg==
X-CSE-MsgGUID: XkfWDZ9DS0eDB9IHG0xUJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44275694"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="44275694"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 09:16:36 -0800
X-CSE-ConnectionGUID: +CmXpyLyRO6qi1a/TFU+Wg==
X-CSE-MsgGUID: NCWCboi/QsWGkiT6dkE5Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="121705454"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2025 09:16:36 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Feb 2025 09:16:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Feb 2025 09:16:35 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 09:16:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dt1cwpP3DuwnSfAdD5OObViIQXZR9mPPgvYIIjNCE85gUCRD2BXUDnP+bZOUVTXdQqC/DFnl9e9MUBhzsNOS5GTxP5r99jIvAeuKYlddFtbXVdM34IPpUaYgHlsbyZUPC+xwb0YLlikwZUGwZeAv6jXyPvsZAzVxzfDu9tyVM1lXgNVqvgLTswe5q246Q78/RVXdr4sj04zL+1gd4QYxxe1rktbQDq+vdIfevi0EBcofHZ+Dy5jHHXaKWP8jWnm33xHGyjFyy0eExaTu1HpxB7uiWxz5OWXWc4HN5xONfFDkW1jUt4g4zrLvQdMTyvrgF54FMqsClam2iVomGz2Ffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMArG23yj6CydmF+EKTOut8mx0XMkLSI0qlMyb/IcfA=;
 b=q1Hlk9NEClC+fJqYYGerPutALx/1sD+KDZLDkNrd4QbCCVbrQmzGmUWfrQUtfkkiaYQQJBkr2d6DRB7C1/+K71c2c8rjPdekAArET+Qf7CzkQAdBWnrMjtALbw3dJeo2jXvMxmSkPfLK7To3f9ZG/rjxnsiI/sWcuVdms9SHMt7X+BaY1kcquxxFrmDkkaJ64A3BQP6jJA3S7xfUb7Vl/HSlfkWrggGMwJNBPS1RnzPBlp9z/7zjGDxw6B8mhC8hQtWAWn75xcUrzC5RrsYltgMKz2JDeGG23jNHLceVzdceyW7SBVaPvFA4fxpgs0JM62UFk88zr5D+b19o5wkFpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Wed, 26 Feb
 2025 17:16:33 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 17:16:33 +0000
Message-ID: <5841180d-6a84-4d2e-8cda-554047126351@intel.com>
Date: Wed, 26 Feb 2025 22:46:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 27/32] drm/xe: Add SVM VRAM migration
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
 <20250225044311.3178695-28-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250225044311.3178695-28-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH0PR11MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da62dd2-599c-4732-0c0a-08dd5689512b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjZpUVdmMmNrT2Q0Yy9WY3BKZVhGL2g4WHFZMnlYNmNxUDRJU0R2eldkc0Iz?=
 =?utf-8?B?MnB6N1NERG5lc1JTd3dkT3AzMzZjRDBzaFZsZkpQSFF3bWo0OFc5NXNDTXR3?=
 =?utf-8?B?SWYyMFVYTE82d0tkNnlMa3pFNWtveXhJOXI3RERJcHFwUzV2SnYrUHdIOUlm?=
 =?utf-8?B?emN5QlVhQ2NxTlZVMms3cGE1bnhadzQ4blMxaDl0VUNhc0FSWkJFRG92b2Mv?=
 =?utf-8?B?SGhQM2x4MHlhMHRFM1JkWSt0WUpjWk1ObjhnL0JwTXgydFFTSmh3Uy9zRHNa?=
 =?utf-8?B?cEt4bGwvOFYrVXpqdWd1RVV2M050UG1SREI4TGhxSzBRVmZKN25UdjFlMnpz?=
 =?utf-8?B?VS9Zc25Lejl1eU5mSWw1dVcyTGVlOXdEYlRuWDNiTjhFaUpERWVRUDhvYi95?=
 =?utf-8?B?SDY0MDhueWNLZE9QS3l1aHBscFk0V0czSTVFWGtxdEhOL2ZPZGJDUDhlZzBX?=
 =?utf-8?B?NlJKYVVjcjczNDFTNmNIWFpXSUlCd3FHS3ZFSlFWemRTQXdvQzk0TjNqY3d5?=
 =?utf-8?B?VFlDOFpDaFVPK3I1Qm1KNGVYQUFXMmVVUlNhQVd4RG1SeWIreFQxeGxlREg0?=
 =?utf-8?B?VVRNZkZRVEJHenJ5OVk2bnZYVjhSY1o3RzlNZlFYR2dGajd4bEVzcHY3NHJL?=
 =?utf-8?B?dklQeXViYzRGakRnNnlpNlR1M1ZRZjNSR2lnVVozUWRvbnhGQkQyTEJWQU5X?=
 =?utf-8?B?dFdmaW1lN2N6MWpadXZRWU02M1FEZjV6bkthZDh4QnQvcUJaelQyMHpMTkpN?=
 =?utf-8?B?VlNBYlBJU0ExV3Y5UFY2Zmd0TUQzN3Nsd3hGRkJVNDlhdjZnMmtjM1JlRG03?=
 =?utf-8?B?eVltbmJZZm93em9JQ3BJMXM0dEFSWGhFdWE1S3ZUc3RHY0Y3MjZycWR1Yjl6?=
 =?utf-8?B?L2VCUTQvaGgyZjFlekoxTzJpUTlCUFRCUzFJVS91b0tORE1kWkZ3SmkzNEJE?=
 =?utf-8?B?aHBRMjRsQlcxMmhQQ2hmdmRBM0diNG5UUDI4d3V6Vy9nKzBSS25ldjZTY3l5?=
 =?utf-8?B?eUFUQXRUeERtZ3QvcjM3T1B3MDlWcVRkY2poZGk2R2IxcUtSdjFtUGFERUZP?=
 =?utf-8?B?OXExRDI2RG1ralBFTld5dHkwdU0rSHVqeVBFakN2NlpuSjM0ZE92ZDJpcEFr?=
 =?utf-8?B?Q3RBYm1wcGZsZnVXVi9rcjJQRGo5ckJiWkxCUDFiVEx6RkxLZlJ3czJlK3lj?=
 =?utf-8?B?SS9zU0U3ZkxmTlBpR0FoUXU1ZVdJWVNmQ2Znd3ZkTWlwdVh6VHRTd2l2NzhY?=
 =?utf-8?B?Snc2eks5RHJrbHRiQkk1V1V5Vm5iQlBzYUtjeVc4NnYvbFFMVXBLV1BBZzNL?=
 =?utf-8?B?SnZiWWtWL2cvRzFxeUFkN0pndmJaYy9tY2FMOG9PeU5xRkozbFBIaFpmb2tx?=
 =?utf-8?B?b25EK0FNWUNCNHZrS0dTdWVJL2dUQWtLVTlTZiszckVPS2haaGx5a2dPa2Fl?=
 =?utf-8?B?dzBBeWc2Vi9LQU1uekl2VjRva2w0a0w3STh5SDVuQjErQ1hMbkJnRm03b3ox?=
 =?utf-8?B?cmlESmhWNDRGZjNGbE84ZUc3UDlqSFJrK0FkZUNaK0dxaXllR3hCbkFEZlNP?=
 =?utf-8?B?ZG9acVczUHRCWWI2RnRxektrZC9RZEpkUVVWdjFzcXpmNUZibm9tVllsc0NE?=
 =?utf-8?B?QUU0Y0E2TmlwRXNiMDZGRVR2UXpQYlRTUWV1cWVLRlMveENTWXpFeHBQQnF5?=
 =?utf-8?B?KzVRbWJFdnNwa3I4ZS95UUdVeDBJTkE5ZVBBYUNIaEsvSHJINlNndDZqSE9a?=
 =?utf-8?B?ZVRPZTlRalhqVmk4aHNXcGRneFB4c2FrYmgvaXJpTWFIZmNTTEN3WWpuK3JR?=
 =?utf-8?B?ZENrWEdQdDlTUWV5ajR1UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHRZRGlkZWQ3Rm5TWjM5SDR2eEwrc0o0anFRTlR4MVJEeFkyb3h6NnBlMEpD?=
 =?utf-8?B?QnQyUXVYU1hIL0xsL0pITVc3dHU2ZDNsY3RVOVQvM1RTbU1IVFp0L0RMNXhG?=
 =?utf-8?B?Zk5Od1Q2THFiMjZqanRtYStwNS9iWG9ST1lrekZwUTlDREZZSXZ1LzhiQW91?=
 =?utf-8?B?Wm9xdmQxVkJwQlNteE9aWjZrVEVyK09ZdTFLdjVZcjFvVWRra1VqcVpNR1pH?=
 =?utf-8?B?K3VseURVOUdsSERBRzJVd0NmY21iVnlwN1JDR3ZzVkprakltOE9TeWdVTWY3?=
 =?utf-8?B?N1paWHYzQmR0VHJxbmwwQXZvMXZQRFFNQkxQZXR0MlQ5YzBpYzg0Mmc3WEFy?=
 =?utf-8?B?dGJ3MnRDZlkvdTZRRU53dUpwU28vbzhsZ0pzWjhIUmwvbE5qRjRoTVRUeXdK?=
 =?utf-8?B?Z3lvZHpTV09jUnlSRTJrdzZXOG5mZzdmamwvc09ZZG9iOTN5SWhicFBXazQ2?=
 =?utf-8?B?Sy9rNG4yZHhjVEpGWVQzczRSa1JRZkxpekFPUkNvN0dKNTRHeXVuMGZZaEJt?=
 =?utf-8?B?WG9GRG9Db2xkS1NrM08xcWV4M3EyZ2ZZVU5pRml2dGMxRUwyQTRoNUZBdGRY?=
 =?utf-8?B?eFNFcGQ4NWZYeE1aRm1rczdLSkd1NGdHZVYzN25PZjBWK0YrWlNFa2pOTVdW?=
 =?utf-8?B?UlBuZ3NTbXpvWGtpMnRYSWlralkwdFlQcVN1a2E4TE4zTTEyUDhRUXQ1L1pT?=
 =?utf-8?B?bElyS3ZEcEMvaHFJbUZtUkxlN0NaL3prdWwvcTlVMTdlVHNrMzRwQTBIUTR2?=
 =?utf-8?B?WCtWckdSMUk0OTdPMmN5VXF5Wjk4SGY3M1hqY1dGMkI4Y1FoL2ZuRXk2MWFo?=
 =?utf-8?B?Vks2SEx3MnRPelZyTWJuSTVtYXdtdS9CODU1WTFrSTdJb1kyNytiZFd3N3BH?=
 =?utf-8?B?UkNUTjNOdVU3MmF5MWM5YkVPaXlOcUxaUzMwekQ0UUNNUk84VDdqbllwQXlq?=
 =?utf-8?B?VnBrK1JGdXlsZ0RubEhKNHhNbHllb3VHNjFib04wWE9xVnpCcjIvU0s4bzJT?=
 =?utf-8?B?T05HVDJvaXY4eGJ5MkZKUmJNaXRtUk5VWTRaWXpiVzdEYnNUWUhEZmpMRXRo?=
 =?utf-8?B?azRPakUvNk5tWVlnc3JMQk5YU05QTlJFUGRjNzVYOG1xeEdDakJQbUlDMmN4?=
 =?utf-8?B?MFV1KzdLSHd0TXNkZVFzZnV5bm43dEUxK0hoZGgxNDY1b1p4S0ZpdVl6U3lD?=
 =?utf-8?B?dDA1WnpRdDRnSnU5QjZjM0k1MTN2MUM1VlZQdDJSbC9lNCtwc1FoS2ZzRWdm?=
 =?utf-8?B?cHJaM3o2K3hyZGIyNkdKNW1zV0FuZnNWWVhNMkRTZEkwQ2o3aDBwRGM5cTBS?=
 =?utf-8?B?TGdXSnR6WGU5VXRXeVQ0RDZqU1kwR056TVA1NXVFTlcvaVQ4cUlkQ29vWVhn?=
 =?utf-8?B?cnE0QXR1SUw2UGRqNExFQ2VGRWdma05uL3BIZ2crWkZ6ZFRrZktKZ2VFTi80?=
 =?utf-8?B?czExZmZpRksvMWl0TWl2RVQ4VVViVDRXcnZKMUVuUVErYTlPZHFITEJaSUgv?=
 =?utf-8?B?NmNvMWVpODc3aFc3bXNYQTZ6TXNqZHk5cWlYQjdxdFdMZE1hdWJkL0tZaUFa?=
 =?utf-8?B?VEs1RkFlS0NmRk1Td3lGdmJvdlJmYjlrZG9QdXVYMEhibXBYdkwvdVNGT0ZB?=
 =?utf-8?B?ajdZQ3pqL2Z6R2hGSm9ibnQ1V3JyTWkwS3c2VHkrL0JyLzJoN0pMNkZTWFFh?=
 =?utf-8?B?K2llRURXUENTb0Y4Z2tuQkpsZHhFZzNvY2dkOW5IY2JLbXRFcTdHZTZpcTUx?=
 =?utf-8?B?clBHWVZLNFFUU1Y1UDh6cWVNZUN3NU14Q1JvYWMweW5lTUt0WnJvck5PMUlI?=
 =?utf-8?B?QVprdzR2Vks0VS9jQndiS2pnMDFrOGRGUFBJWlVCR2xUUnk0dEN0SWVFWG5H?=
 =?utf-8?B?bWNENGF6TzRQQUMvbEtOLytqMkV4TFFubGJ0Rk1LcFhkek5DUXZzT1ZaN1Fm?=
 =?utf-8?B?VDFYZ1M0RjBtUE83c0ZnbFlMYkFYZXU1Lzh4NDUvMWN4OEI1cXdUNThYNkRJ?=
 =?utf-8?B?eXNMK29KV0lSeGVEMVJGZ2RtL1dkWGtrSWdNWTdFdmo2UHdGQm5RdUxWMndm?=
 =?utf-8?B?Z2QyWjVhck0rV255QWt5eUl3bE9lVGc0OWYvRFNSRkpzUkxsOGs2K0ZvM0ZS?=
 =?utf-8?B?dnowMFF3cDU4YTFJQlMrUmZjYThsbnBxTERuWjBTcDBWc0dsU3FZS0cvaW9o?=
 =?utf-8?Q?pLGujd7nP11kJjSHJoGgzkk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da62dd2-599c-4732-0c0a-08dd5689512b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 17:16:33.2043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrhYp2NPOWfvO07j2+x6jM+oP+kYRfGllpqZJ2uC6mzgEEyXLlyKq0fgIKHiykCjEzP/k4mt7wySkZp1VqYNdQ9zSFo57ezkWlcBRdnKeRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
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



On 25-02-2025 10:13, Matthew Brost wrote:
> Migration is implemented with range granularity, with VRAM backing being
> a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
> TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> SVM range is migrated to SRAM, the TTM BO is destroyed).
> 
> The design choice for using TTM BO for VRAM backing store, as opposed to
> direct buddy allocation, is as follows:
> 
> - DRM buddy allocations are not at page granularity, offering no
>    advantage over a BO.
> - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
>    evict each other).
> - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
>    require a dma-resv.
> - Likely allocation size is 2M which makes of size of BO (872)
>    acceptable per allocation (872 / 2M == .0004158).
> 
> With this, using TTM BO for VRAM backing store seems to be an obvious
> choice as it allows leveraging of the TTM eviction code.
> 
> Current migration policy is migrate any SVM range greater than or equal
> to 64k once.
> 
> [1] https://patchwork.freedesktop.org/series/133643/
> 
> v2:
>   - Rebase on latest GPU SVM
>   - Retry page fault on get pages returning mixed allocation
>   - Use drm_gpusvm_devmem
> v3:
>   - Use new BO flags
>   - New range structure (Thomas)
>   - Hide migration behind Kconfig
>   - Kernel doc (Thomas)
>   - Use check_pages_threshold
> v4:
>   - Don't evict partial unmaps in garbage collector (Thomas)
>   - Use %pe to print errors (Thomas)
>   - Use %p to print pointers (Thomas)
> v5:
>   - Use range size helper (Thomas)
>   - Make BO external (Thomas)
>   - Set tile to NULL for BO creation (Thomas)
>   - Drop BO mirror flag (Thomas)
>   - Hold BO dma-resv lock across migration (Auld, Thomas)
> v6:
>   - s/drm_info/drm_dbg (Thomas)
>   - s/migrated/skip_migrate (Himal)
>   - Better debug message on VRAM migration failure (Himal)
>   - Drop return BO from VRAM allocation function (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_svm.c | 97 +++++++++++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_svm.h |  5 ++
>   2 files changed, 98 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index cb3567b561be..d8ff7fc708ee 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -32,6 +32,11 @@ static unsigned long xe_svm_range_end(struct xe_svm_range *range)
>   	return drm_gpusvm_range_end(&range->base);
>   }
>   
> +static unsigned long xe_svm_range_size(struct xe_svm_range *range)
> +{
> +	return drm_gpusvm_range_size(&range->base);
> +}
> +
>   static void *xe_svm_devm_owner(struct xe_device *xe)
>   {
>   	return xe;
> @@ -508,7 +513,6 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
>   	return 0;
>   }
>   
> -__maybe_unused
>   static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
>   	.devmem_release = xe_svm_devmem_release,
>   	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
> @@ -588,6 +592,62 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>   	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
>   }
>   
> +static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> +{
> +	return &tile->mem.vram;
> +}
> +
> +static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +			     struct xe_svm_range *range,
> +			     const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct mm_struct *mm = vm->svm.gpusvm.mm;
> +	struct xe_vram_region *vr = tile_to_vr(tile);
> +	struct drm_buddy_block *block;
> +	struct list_head *blocks;
> +	struct xe_bo *bo;
> +	ktime_t end = 0;
> +	int err;
> +
> +	if (!mmget_not_zero(mm))
> +		return -EFAULT;
> +	mmap_read_lock(mm);
> +
> +retry:
> +	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
> +				 xe_svm_range_size(range),
> +				 ttm_bo_type_device,
> +				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		if (xe_vm_validate_should_retry(NULL, err, &end))
> +			goto retry;
> +		goto unlock;
> +	}
> +
> +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> +			       vm->xe->drm.dev, mm,
> +			       &gpusvm_devmem_ops,
> +			       &tile->mem.vram.dpagemap,
> +			       xe_svm_range_size(range));
> +
> +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> +	list_for_each_entry(block, blocks, link)
> +		block->private = vr;
> +
> +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
> +					   &bo->devmem_allocation, ctx);
> +	xe_bo_unlock(bo);
> +	if (err)
> +		xe_bo_put(bo);	/* Creation ref */
> +
> +unlock:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +
> +	return err;
> +}
> +
>   /**
>    * xe_svm_handle_pagefault() - SVM handle page fault
>    * @vm: The VM.
> @@ -596,7 +656,8 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>    * @fault_addr: The GPU fault address.
>    * @atomic: The fault atomic access bit.
>    *
> - * Create GPU bindings for a SVM page fault.
> + * Create GPU bindings for a SVM page fault. Optionally migrate to device
> + * memory.
>    *
>    * Return: 0 on success, negative error code on error.
>    */
> @@ -604,7 +665,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   			    struct xe_tile *tile, u64 fault_addr,
>   			    bool atomic)
>   {
> -	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
> +	struct drm_gpusvm_ctx ctx = {
> +		.read_only = xe_vma_read_only(vma),
> +		.devmem_possible = IS_DGFX(vm->xe) &&
> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> +	};
>   	struct xe_svm_range *range;
>   	struct drm_gpusvm_range *r;
>   	struct drm_exec exec;
> @@ -631,9 +698,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	if (xe_svm_range_is_valid(range, tile))
>   		return 0;
>   
> +	/* XXX: Add migration policy, for now migrate range once */
> +	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
> +	    xe_svm_range_size(range) >= SZ_64K) {
> +		range->skip_migrate = true;
> +
> +		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> +		if (err) {
> +			drm_dbg(&vm->xe->drm,
> +				"VRAM allocation failed, falling back to "
> +				"retrying fault, asid=%u, errno %pe\n",
> +				vm->usm.asid, ERR_PTR(err));
> +			goto retry;
> +		}
> +	}
> +
>   	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> -	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have changed */
> +	/* Corner where CPU mappings have changed */
> +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> +		if (err == -EOPNOTSUPP)
> +			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> +		drm_dbg(&vm->xe->drm,
> +			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
> +			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>   		goto retry;
> +	}
>   	if (err)
>   		goto err_out;
>   
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 49c35e9ec183..5d4eeb2d34ce 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -35,6 +35,11 @@ struct xe_svm_range {
>   	 * range. Protected by GPU SVM notifier lock.
>   	 */
>   	u8 tile_invalidated;
> +	/**
> +	 * @skip_migrate: Skip migration to VRAM, protected by GPU fault handler
> +	 * locking.
> +	 */
> +	u8 skip_migrate	:1;
>   };
>   
>   #if IS_ENABLED(CONFIG_DRM_GPUSVM)

