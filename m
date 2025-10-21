Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE18BF9124
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8038910E641;
	Tue, 21 Oct 2025 22:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQ6zUn6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E3B10E64D;
 Tue, 21 Oct 2025 22:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086535; x=1792622535;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=E1nBb6zXqQQFeE9p4ZNhWFKd2whKpQv/GHLJbNFcvcc=;
 b=mQ6zUn6C+vrwOJcP/Wq3l620nSSb0UknE7fJ9YsM9QNuGeXNyZlZ0Gu4
 jNhedJC3CsJyA6ZmTgGKcu0dLNEfaSwIextnulcCYzsQULo5C8cb+Oz5t
 tWX/waM7Sj+r7IPq1lakbnesQs4wylmcRyevmLe3orztR/KPm3gvzkjAn
 hrPHXdyyRXMrKRHR7OkIZqu3wcV4Di0gCO0ENA/llMMjrgXW2lJTTorNz
 5m2W+X4mh2C1b84l5QgGHF09SEKE7iAVhF/ybeoBGKFtL25/PLJKEF34j
 mwkU81+02fOq/SKbckmEO0POzZZAdSrOFi18vbljiD32oW/NyZOJbJFGA A==;
X-CSE-ConnectionGUID: rH/dHvkqQK2DO+iHedIjfA==
X-CSE-MsgGUID: aYwKSMv5SQyBYXzl8oWlIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63121743"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63121743"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:14 -0700
X-CSE-ConnectionGUID: qV9YcWJ/R9mdAYtmW5YYgg==
X-CSE-MsgGUID: i1kEBw3STmSZTuCN/WVCNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="184110577"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:42:13 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArhQd1gVU63aD61LKSLN0o75AuvbkIYwWWIPhuEQutFry6rhJFGMu11aC48P6FDuj0tmbIn2z16+p4cfFTNf+mzHa3L0uealv49QY51zeHmbvq08s9kK3oweDA1YUAIwy/8lAK1lQ7v+t0gyoha4Uo6x7mAN8IjqVlxm+XEE9lYrVcxRiMwd7GHiuTmtK7JTcbt35t5UJrDxlTep3UoAiiVLQtME2j1ykc/UPWBG6+loJ4tdYoK8pU4DV2ESH6j8zjbGGa86R5OXbCOFDU6TiKhh7WprnFFi597xRq0GvPxwRcuxB+OdHZQTrR8PDHq64jYgG0NR7+wLCwL5jhnETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo3kb6XkosWB4XK6Q8gV4THfJSNIdogVDhZjq16G2Fs=;
 b=lTWktgvpb92cCOPw+PD5S7KUJPOsX3g24zpLajEdNnaaT6PsKPc5u5BV4gaDAANdSLsXNBUmcA6UCd2YCrz9n4dceMwKKRi3oLyhbir5+6yUyJNvHJQA7kkn1MRtiCkfaVPw4vOa4H2O8Yq1BIyFVGbq5nMZvTpW+rnVOwGsDGdmUAq9TxPqesrbmpMTND0oR+9Lb+Ci6g/fhNb5Ye2Hol0bnq7aN73FiA5ZmgBIEB/voUXZitZ+WhoOiYSbHcyDnUE6yjN7JZX/SiV9LvOacyCjskl3XWZVZYNYqNAvAvY6DR8PSA5WddfuPlryMddKgzIQZ/Ebs8vG76tSAuC/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB6619.namprd11.prod.outlook.com (2603:10b6:303:1eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 22:42:10 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:42:10 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 00/26] vfio/xe: Add driver variant for Xe VF migration
Date: Wed, 22 Oct 2025 00:41:07 +0200
Message-ID: <20251021224133.577765-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: b6661d9d-ba1b-47fd-8748-08de10f31240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzRrSUZCV3hyZmx0ZjVIMHpCdjNZZC91L25OaGFqV3NscFdDbjJpVmw1RDl6?=
 =?utf-8?B?U1pjNURBNDB3UUsyWXpSUTZvcS94NElPMmR6Y0NwZVl4bjFiS1doaVN5QUZF?=
 =?utf-8?B?UERZREV1OC95YW0xQXBRc2I2ckp4YjRBblZYSVZUN1ZDUlgvMldIMlJmdXYv?=
 =?utf-8?B?UTlRZ0QyOG8zdUdaZTcvTGp2eW8rWmo2TFZKNkdDOHRjcTFWbDltbE5GNldu?=
 =?utf-8?B?Z2lnYm5RSWVkUGRrTkRnU2VLNlFhZTF0ZTRIWTllQy92TjhsL29kNFJIekhp?=
 =?utf-8?B?VlUvSEttOFdUM0ZHV3NtNEpHdGt0dDJSTGZUMGovSnBVZmNiZlFldEJZVnVB?=
 =?utf-8?B?cnRhM3ZGTVlsSWFWRlUzU0hwMVJqVityOFZta2NuZ2svSFBMTDc1eUJzSjFz?=
 =?utf-8?B?L2MvWGNQSlUvekJBd01ENlN5RGYvNkZ2MGF2RTU4cXQyYjJTdUtIUm42OEpm?=
 =?utf-8?B?SUx4UmJvY3F3ak5lL2pWaTIxQnp5K1cxeHNVcmNyQkxlZlR1NVpYN3kwalFq?=
 =?utf-8?B?NUtEUWF2V3Y1V2xXSlV6dUc4T0NCNVFKU01CWjFnanNrWmtXNlErMUo0RG9H?=
 =?utf-8?B?alRpSE1KLzZ1cFRVR1ZTekFrcjJ3SkVVMDdoTk1FVnJRbVZOYWdCTUZqQnpv?=
 =?utf-8?B?VjA4Z3M0YVc1WWJtVGNmTUNOWWYxdDN4Q0p0OXZOMlVEQ2hSWlFkOThIYzRI?=
 =?utf-8?B?NHBhbXVWOEw0UktONVF4UWh4T2JLV2Erb0doMjVuaUp4aWhLUjdsNCtDY2FD?=
 =?utf-8?B?MDVzMmZhN05GQjJsck5INEdpdE41cmtXS3Q2TmJCYUIvNUpoeUJybHdOUjd2?=
 =?utf-8?B?R0I5OFJ1Tit1ZkFuV04zZ2RjcHV6dWRVK3RRUjFUQlJxT2NnUGR0Q295UlZl?=
 =?utf-8?B?RnhMaE8wRkVNdEdWRGQ4NExwdEpxU2RWdmpoSkdGOXZXVDNkcWxGSlNRajRx?=
 =?utf-8?B?Myt3M1RqSUtFRjZFVm9vRDUrU29ieHZFTVhwSWFHbHRkZE1rbkhBYzhnS3Bu?=
 =?utf-8?B?QVlhY1Nsb1dNNmVaZWdabit0bGFXVnhZekE1WG1ieFkrK1BxSnRpZjNUYmtE?=
 =?utf-8?B?eEZWdGJ2SlBTZHhXaFozV05Ic01DMGhsMHJQVG0waEoxMWhIVm9nYitmOWFR?=
 =?utf-8?B?cXE0MFZhb3ZwZWxKZHo4bzNuQmhodmVXdlVVR1hkTEpsUFdXcmovZzdrUlJQ?=
 =?utf-8?B?ck5rSDVwb0xlOGpiVGFNZU9ydzBYcEZqY0hQcytaRThVSHdMKytYRGZEbk9y?=
 =?utf-8?B?QWhndDJXYXdqdEpBYlRZUDRTNENzTllnemk4ZXpmK3ViM3R0L0NKWVU3eUVM?=
 =?utf-8?B?dDBxL0YwRFM0R2k4ejI1ZmJ3c3RRSEt2dEloMWlaK1ZRaGJOQ21EK1ZJcVla?=
 =?utf-8?B?aFdUMWFIU0dYeEUrT3NXMnprZzVLUE5OMXhMVDdNNHN3SXdxZzF0N0pXYTBH?=
 =?utf-8?B?Ym81YW5NRmFtajZ5REhTTGRBdDBOdmdmd2phTWNUaU9oZXdxWDM2QnMyWlNv?=
 =?utf-8?B?dkVaTUx6Y1EvZHM3SjJtUCtnQ3g2UEpsMDZ1VnNWTmg0UmJaT0U2Tnp0NFJM?=
 =?utf-8?B?dDlQMW5lcnNSSTBtc3NwTURXSm8vNUlZRm1nVUdWdzI0UFJZMDRUUlQxY2RX?=
 =?utf-8?B?dHZyZkNCREJWZHJ2Mllzc0liN05zM3Q3ZnJiajNJcitjcUtOUVpTYlZKQW1X?=
 =?utf-8?B?Tmp3T0xLUVc1cUFBSDZzdHJXZWdPaDA1Uk12R2FOL1BQNlgvWDFySjFjaVl1?=
 =?utf-8?B?ZnJ3ejdmWVl6MHBmMWZjS0hjU1Jsb1YzcEhmbkIzeVJwM3M4M202SE4wekVs?=
 =?utf-8?B?aWo2S2daNFBBeXZqWVV4Tkh0aXRuem9aUUhyUXlUZmFVQlZsa2lFT1lQOGgv?=
 =?utf-8?B?V0pGRHhqU2l6dmdvU2VWTjliYTRERVoxcnY4UnlHUWRleC9PMFZGMjNiWmd6?=
 =?utf-8?B?ODAvRVBST3JkWlRMUGlPZlZSMEI2VDIxNzArcFphclZhd09EdWM2bmlmNkRo?=
 =?utf-8?Q?Ip6LsfpyK2BSSA5x7HG6++6fwlX44I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGx0UHAvQmUzY2tVYS84N3plQlVZT2dIK0EweHlQT0ZocmRhNXZ6dXhGMkpV?=
 =?utf-8?B?QTNlZG5jZlNTZlFkTTFUcmU5VjNHU2Z3R3V2WVZPVWoya2J4QkNrOGNZSVh3?=
 =?utf-8?B?a0ZSS0tvOXRNU2tNMitVMGRNYnVtNWtIRWZSeHhVU0pXTjNHNW1KS1pmNVBr?=
 =?utf-8?B?SWltdVhTdmY1Ry9VMWpqOGZjVEZWOHZpSkJjOHN0SXpHa0YxVHhsdDhJd05N?=
 =?utf-8?B?SjQyajhPNzNnaUZVOWZjTlVaeHp3RHM4V2t0bmdsKzNWYjFLY0k5QlB1QlR2?=
 =?utf-8?B?TTFUOHNOYk85QXhMSzhmbEs1cWhQRnlkSE1VTmdiZ09uTktNMHRZTVFKb2ZT?=
 =?utf-8?B?dy91dnIwa213Tm1VVDhpVkJYUC9YTGxBekN2QmFPbllVYUpFanFZYWczeEE4?=
 =?utf-8?B?aURuZW1FT3Y1ZFFlL1prYTRmdXhDcFVRU2VZTi9wUnFhVmV0YjdqTHg3TVZk?=
 =?utf-8?B?RkJHbzVLY3ZxN2J1clVJL1ZHcnUzSFQzazJtNDVQWVgyWGo4YWpWTmI2aG5F?=
 =?utf-8?B?N2Vnb3pDYlV4T2ZKU2hWb0F6T1FOaUw5WGdWZEs1MWI3eHhnSEJ3RnFMOGZs?=
 =?utf-8?B?SFgxVDhQcmZ0U0dObm9TV3FOVEw3UlF0eDIxd0JkeGhDT3VydG1xdzJ3SkMz?=
 =?utf-8?B?ZXB2dCs3MHFhNVR0WTRTYS8xNkJFU0RpbkZYb1IwQlptM05YaFFGTzROd1J3?=
 =?utf-8?B?UHlDM3hEY0xLTkRKaUlYeERIMXI5U0xDYTBDUk1JQmF6UjNjSWdGUHE1ZDhN?=
 =?utf-8?B?SkV6MjIzc1JxZlI5cmgzWmNYWHZSQkZPemQwK2daakNSdmEweFBTOEtSOEN6?=
 =?utf-8?B?L0pmOHdzdXlZSGRUSk0yU3RENXlUVGtCSUVVWWprQTZXSjF0bXhudlZHTnJ4?=
 =?utf-8?B?bWM2dDExZ1Q4UDJFYy9VaER3YUpPZjFwUU1IZFVLQXNRTFhUT2ZNbVAwOEV0?=
 =?utf-8?B?SUJOaEtPMkx6dVVCczdNQ3craXd6WVJ6MHF3ZlRKc3ZEQmRJNXIzZjlPR3pB?=
 =?utf-8?B?c3dHTjVTQWtHRVRiMUFUelpBQkROc1BLa3l1c1hsOHkyTmZrSGF1ckRBbEo5?=
 =?utf-8?B?RmdXSVgrUXJuSDI2NHRxYVVjMjdQVXhMSmc5R1AzY3kvYmwyUDJDQ1NWNDJi?=
 =?utf-8?B?cDBISUVDRGwzRVd1a3h0VHg2T2V4ZDExN21HVXcwRkFlc25yaVphL1NIRHUr?=
 =?utf-8?B?aGZGUlY1akRyTWpDcmxCSncyZHkzaUpnRTIzSGJmdCsrRVJjZDRQT3JoNmxz?=
 =?utf-8?B?SWh0UjNqelRiNGNlaDhRL1lmTk1PVEphcUdyUHVsckR2R3lFNTNoSElJS0Js?=
 =?utf-8?B?OXJ5WTM2Z0E3aFB3eEhLc3RRd1ArR0VCVW9FQjJhSWdZcjVPMHQvQmE3ZVRt?=
 =?utf-8?B?dEgxc0hkaTE3VUFLemZlc2hHcHR1VWtlR1BWK29WNzdkUllaMkh3cmZ2NXV0?=
 =?utf-8?B?R0J0bXRtZHA3allzZWlEbERjeUxIQXhwTzBlWlBHK25xTnpQNzc3ekJxbE1W?=
 =?utf-8?B?N1UxYk9RZXplbTAxRExNOUlDeS84ZHlMRURWN24zdTBIcjNMKzRLaStTMjRR?=
 =?utf-8?B?aHJ6bTkwc29OR2pLK0VVWlNSNDN0eERxK2dLUldyZEFhYXdYZHI3WHZZZ3B2?=
 =?utf-8?B?ZW9abjJUWWxrSTZKbXh4QTBaRTlFc09HUkRWSjBjcjZZM3pvb0toTldMWFVz?=
 =?utf-8?B?ekRQdlN5Z3QwRjE0UUVJYnVFSjk4aUJ3SXZHL1BtMDc1NHJKWnkyM2N0d3dB?=
 =?utf-8?B?S1o5VDU2UXlWb2g1QVRLMUNtbWVUakk1SFFEVjNnaFBYOVdvcHhSMEU0SWta?=
 =?utf-8?B?V3h6NFRUVEEyVm5kRDJvRWVzVjNIL2gvSGg1eWlLdjZrZXhaZStmWFJnTkZs?=
 =?utf-8?B?UXVHVFdOQStadlF0U3grMldFNUhQSGZHazl4UWdrTWdyQUxPNCt2Mzd5Z0pZ?=
 =?utf-8?B?cXNWeUxTbVdTUXJTNENTMHU3eTloS3V5OURBUTVBRWVPZ3ZJOUNFVEZtUUQ2?=
 =?utf-8?B?eFJwbnA4QUFhQVpvUENGZkljMC93V1NJVFdqdXc5cjJ6UVhZOUk3Vk1xZWRy?=
 =?utf-8?B?SnJLOEQxcnZpSDFQRHV2SUo0Z0Q0bVUzU0lZMnVjbi9FK0FKaXFvNG93b2xJ?=
 =?utf-8?B?MGVSVlFndVo2a05SMTFmcUNoeVd4OFB5ZmduSStscy8ydUZuVFNnTXR6UEp3?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6661d9d-ba1b-47fd-8748-08de10f31240
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:42:10.4070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAlHdc/IVRFCDny9/r++OnhYofvRnxAMXUAvh3olixyCUiLYYDNzgzcFC+IbaRyYSm2+eSo6CE1pvDZU+NhnsL7OZxcGcWSEv7/eSXleeJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6619
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

This is a second round of patches introducing support for Xe SR-IOV VF
migration.
I appreciate all of the review feedback and I hope I was able to address
all of the requested changes.
Outside of the usual small tweaks, one thing that stands out and sends
some ripples through the series is the reorganization of PF state
machine. Other important things to note is the addition of one patch,
that removes the need to use Xe Kconfig debug flag in order to use
migration.

Cover letter from the previous revision:

Xe is a DRM driver supporting Intel GPUs and for SR-IOV capable
devices, it enables the creation of SR-IOV VFs.
This series adds xe-vfio-pci driver variant that interacts with Xe
driver to control VF device state and read/write migration data,
allowing it to extend regular vfio-pci functionality with VFIO migration
capability.
The driver doesn't expose PRE_COPY support, as currently supported
hardware lacks the capability to track dirty pages.

While Xe driver already had the capability to manage VF device state,
management of migration data was something that needed to be implemented
and constitutes the majority of the series.

The migration data is processed asynchronously by the Xe driver, and is
organized into multiple migration data packet types representing the
hardware interfaces of the device (GGTT / MMIO / GuC FW / VRAM).
Since the VRAM can potentially be larger than available system memory,
it is copied in multiple chunks. The metadata needed for migration
compatibility decisions is added as part of descriptor packet (currently
limited to PCI device ID / revision).
Xe driver abstracts away the internals of packet processing and takes
care of tracking the position within individual packets.
The API exported to VFIO is similar to API exported by VFIO to
userspace, a simple .read()/.write().

Note that some of the VF resources are not virtualized (e.g. GGTT - the
GFX device global virtual address space). This means that the VF driver
needs to be aware that migration has occurred in order to properly
relocate (patching or reemiting data that contains references to GGTT
addresses) before resuming operation.
The code to handle that is already present in upstream Linux and in
production VF drivers for other OSes.

v1 -> v2:
* Do not require debug flag to support migration on PTL/BMG
* Fix PCI class match on VFIO side
* Reorganized PF Control state machine (Michał Wajdeczko)
* Kerneldoc tidying (Michał Wajdeczko)
* Return NULL instead of -ENODATA for produce/consume (Michał Wajdeczko)
* guc_buf s/sync/sync_read (Matt Brost)
* Squash patch 03 (Matt Brost)
* Assert on PM ref instead of taking it (Matt Brost)
* Remove CCS completely (Matt Brost)
* Return ptr on guc_buf_sync_read (Michał Wajdeczko)
* Define default guc_buf size (Michał Wajdeczko)
* Drop CONFIG_PCI_IOV=n stubs where not needed (Michał Wajdeczko)
* And other, more minor changes

Lukasz Laguna (2):
  drm/xe/pf: Add helper to retrieve VF's LMEM object
  drm/xe/migrate: Add function to copy of VRAM data in chunks

Michał Winiarski (24):
  drm/xe/pf: Remove GuC version check for migration support
  drm/xe: Move migration support to device-level struct
  drm/xe/pf: Add save/restore control state stubs and connect to debugfs
  drm/xe/pf: Add data structures and handlers for migration rings
  drm/xe/pf: Add helpers for migration data allocation / free
  drm/xe/pf: Add support for encap/decap of bitstream to/from packet
  drm/xe/pf: Add minimalistic migration descriptor
  drm/xe/pf: Expose VF migration data size over debugfs
  drm/xe: Add sa/guc_buf_cache sync interface
  drm/xe: Allow the caller to pass guc_buf_cache size
  drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF
    migration
  drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
  drm/xe/pf: Don't save GuC VF migration data on pause
  drm/xe/pf: Switch VF migration GuC save/restore to struct migration
    data
  drm/xe/pf: Handle GuC migration data as part of PF control
  drm/xe/pf: Add helpers for VF GGTT migration data handling
  drm/xe/pf: Handle GGTT migration data as part of PF control
  drm/xe/pf: Add helpers for VF MMIO migration data handling
  drm/xe/pf: Handle MMIO migration data as part of PF control
  drm/xe/pf: Handle VRAM migration data as part of PF control
  drm/xe/pf: Add wait helper for VF FLR
  drm/xe/pf: Enable SR-IOV VF migration for PTL and BMG
  drm/xe/pf: Export helpers for VFIO
  vfio/xe: Add vendor-specific vfio_pci driver for Intel graphics

 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |   2 +-
 drivers/gpu/drm/xe/xe_device.h                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_ggtt.c                  | 100 ++
 drivers/gpu/drm/xe/xe_ggtt.h                  |   3 +
 drivers/gpu/drm/xe/xe_ggtt_types.h            |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |  88 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h           |   6 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  75 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   6 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 595 ++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   8 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  36 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  47 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 933 ++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  47 +-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  30 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   5 +-
 drivers/gpu/drm/xe/xe_guc.c                   |  14 +-
 drivers/gpu/drm/xe/xe_guc_buf.c               |  19 +-
 drivers/gpu/drm/xe/xe_guc_buf.h               |   5 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 134 ++-
 drivers/gpu/drm/xe/xe_migrate.h               |   8 +
 drivers/gpu/drm/xe/xe_pci.c                   |   8 +-
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_sa.c                    |  21 +
 drivers/gpu/drm/xe/xe_sa.h                    |   1 +
 drivers/gpu/drm/xe/xe_sriov_migration_data.c  | 540 ++++++++++
 drivers/gpu/drm/xe/xe_sriov_migration_data.h  |  38 +
 drivers/gpu/drm/xe/xe_sriov_pf.c              |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      | 128 +++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 102 ++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 276 ++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  24 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  67 ++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   9 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c            | 296 ++++++
 drivers/vfio/pci/Kconfig                      |   2 +
 drivers/vfio/pci/Makefile                     |   2 +
 drivers/vfio/pci/xe/Kconfig                   |  12 +
 drivers/vfio/pci/xe/Makefile                  |   3 +
 drivers/vfio/pci/xe/main.c                    | 470 +++++++++
 include/drm/intel/xe_sriov_vfio.h             |  28 +
 46 files changed, 3892 insertions(+), 327 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_migration_data.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_migration_data.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h

-- 
2.50.1

