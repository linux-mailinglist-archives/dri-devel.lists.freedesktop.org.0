Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO8DIWA5l2l2vwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:25:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2845A160A54
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA4510E720;
	Thu, 19 Feb 2026 16:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OueyrYhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010008.outbound.protection.outlook.com [52.101.46.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231D510E714;
 Thu, 19 Feb 2026 16:24:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtGgGxFLu2D/dP/plHhVFESkhVPH97ph4OEvSoCy/yUB70xPrBMY273sP0ELSAMVJVtg5oGrlwpx5CTvNdbLWttLQdQ04Zq4NMsTtv7dP8ZKLN9cs8pLs/BuRH9kbNrJaVROiqOlAFgOskkqboFwS1mfv8KZd9AHK/dN2TOqwLaZ9XWCYeB0DpQ10wOz0L8PfUW7H2vjPsVq51TRs1CsHLNJVZvwU9KvVvxHxmnI7RgNWxcxvIiSLUFS/pPzmF/e8A/nE9xhCPqa1F5G4CfAG5HTEmUpj9WA21aNbQeJc38QFU6sP81i6rHt9aYmaAJLmXWLI5s39Ni+OJnuxEs9iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOSoqZ1qaxu9zFhlDEAldEy+HJ9alJaXw2L1CW7xazE=;
 b=WDn4TDhk2SSazcESmWxs1+fHOiMJLBK2+QxWPyewDPc6GgfFEy5vmGpnm5KohC6LTpevyDewsq4+VQQV2HjpQkBHea/Z9HUz1Zl0/nOoE4fC+PaznjtyD33MjERRO2iCN2cCwjYtEUgJ3Aed/h/ZxBf/kbKw43ZZgSFTv3MYJJVa3aRcpNSfMGnIn0AopfJYjID5m4vQ6ifoXrSYsmclg7NsEGLad2SXt2/U+8yW107AHaCE+1jTy+thBp7DNmfJYKxei8z1unGS/ert2pIiypD5fFwZbCbHtY9PJpLP50N+kVTrrLSmBRr4+5IGKT2PuS4v9TGFh7cUUt3k3FW2IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOSoqZ1qaxu9zFhlDEAldEy+HJ9alJaXw2L1CW7xazE=;
 b=OueyrYhUl28DtYH//pPNnpofyB79t95yREGt6CFlXP6CaqyFOalVqEIEbTxUsP1TIwFoF5EtNGrJd5IMZxaGXXPkloW+1Z8xfa8XbFZ6wiLvGJIwF1j+FIAx2iKewuO3UeMa9FMnIKf8LbRDP2zyBRj7YW31AU5DY2rQaQqWJxPe1qrbIdByVMe8cknoRc0beD5arFdLWkhvSe3e2HznppsQx7tXb4RGJzr52fk6x3yUrJVrQMCUfnVKj5qYEK86Ma6GvlEq3Xngv3FjB5FRh3Uz36jsHmnY7QcSBig62DEe8EH4Xf+dEBm2GUiRsw7BUOOspT000yAONa8Dj2wRPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 16:24:53 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 16:24:53 +0000
Message-ID: <d185c532-0265-426c-99f8-aac8d2080bce@nvidia.com>
Date: Thu, 19 Feb 2026 11:24:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/8] gpu: Fix uninitialized buddy for built-in drivers
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dave Airlie
 <airlied@redhat.com>, Koen Koning <koen.koning@linux.intel.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, intel-xe@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-4-joelagnelf@nvidia.com>
 <DGIUUFLC31D5.2OZBF5FWQJWMZ@kernel.org>
 <f0ef5d7f715d2f15829171b5dd23ae05@nvidia.com>
Content-Language: en-US
In-Reply-To: <f0ef5d7f715d2f15829171b5dd23ae05@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:208:256::9) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 2806e201-52a9-432f-bc7d-08de6fd36955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXhMVjBHcWNrdXlLS0pPU0dCeG94bitKZHVmT1hyV3Bvb01vanNKTkhOd00v?=
 =?utf-8?B?dWxydThpT3RiMDY0ZUpaZU5OeTBoZVpiS28vVkNINEJMMHBLbTZlUnpzSU5a?=
 =?utf-8?B?STEwT1VJVDR5RkkvcCtkcEFJUk8rTHZKelVEa0VJSUlGaktiQ0ZCWU9ta28z?=
 =?utf-8?B?b3lMdnBZYUc0UzRlR3hNVEZHMGFXUzRCY2ZuTWRiYXhEeEVhZjBjamJiTCtz?=
 =?utf-8?B?eFhOM3F4ZGhFbzJuSXZVckhYdndJQ1hmcHpESEh5NWZ2RE5oVHpWVk51bDI4?=
 =?utf-8?B?MzZIME12N0RlZ3Fsb0gwVjBLZEJsckE4OXZacVhtdnl2QTcxMXQxc1JBdHFi?=
 =?utf-8?B?K3VZeUY2aWE0dkJFS0ltUnh5YTZNV0w5d25UQkRUNWVxTTgrM3ZQVmx0ZVVa?=
 =?utf-8?B?aG9WQXg2SmtSaGMxS0tlMWU0ZFF6NG5JZlJpdk5hMmxxYVlZYnpEMHozOW5q?=
 =?utf-8?B?cHg4Zys3YTJvYUEzYTlQSXAzRmZPZ0dzQUhvNm02VVYvRFcrZEI4ZENIcVA4?=
 =?utf-8?B?czB2bWhYaW9Kc2J4R05TQnp3U2o2ekgvcDNLbzQ4d0RPdDBkQ3JHLzU1Q3pN?=
 =?utf-8?B?ZVYrVUFnYmJXbVFYYzFUZmw3QmM1VnFGcHF0ZzUxdy9ES2dnTEsrWm5VcEdi?=
 =?utf-8?B?cWVQUVU1MmZkWkJ0ajZuZDBZZDl6aTB1UWVoNnZRcjdhL3BzR3puZXJLNTRO?=
 =?utf-8?B?TUVUZUZ2Q0d0TnpLZTQzdXlWcm5INVBjVUIrQlA1OVBnMml0WE1sQmwwdk1z?=
 =?utf-8?B?dXhyb1VzVEVDSndqcmVMUFRDWmlyQThvaG1SclI5d1lWbE9WNXpJc3VWU05S?=
 =?utf-8?B?NnZpOXE3bDZnRUJocktOWms0M0czT3locVcySEk5NHpwT3VmVE1Wc3BXU3Rh?=
 =?utf-8?B?eUVKYnR0SGxyOTdKZ1BvZHVjL0p1NUpPdkxpU1pCZ2R3aFBYcE9lTXA3aGVn?=
 =?utf-8?B?NlVQTnQ1WEplNWpSdDVtK1lOWXRTUWtLb3VEZFh5d3B0RUFrUDFXV0J0RmE3?=
 =?utf-8?B?NWl2ejFlQTZKSjNvcUU3ZE1Sd01QNHFjSFlQZWVwdis4YnowREd1NStzSzly?=
 =?utf-8?B?S1RoU294V3FUR3I3YWY3aVZOblJMcFFYMTdaWjRwcWtIV1hpR1pWLy9lZHBD?=
 =?utf-8?B?WTZ3a2NnVU42bWYxRlgrQUJkN0lPNDVTYUcwYUZEM1VibFh5dEtWeDNyc1pt?=
 =?utf-8?B?NmJ2azl1elc3THIwd3VnNGg0QmVBZXZ5eWlzZ0M5RW0xU3kvcHFvVEpjUU9R?=
 =?utf-8?B?Tm1zNk45VFRlQWRwbzNHaTVSUVlobmgzTVBoOEVudmt0TDdFbCsyV0NrRXVN?=
 =?utf-8?B?S25NaWZCRzVNSE4rVEZIYWlWemswK0lpeGJUVGk4a3J4Njg3NzM2M1JZY00y?=
 =?utf-8?B?VjAwY3YrWWJ3N09oZU52U21rdnpIWVN3TnM2RWFRdWpRRXBGRlg0bzlrMFpH?=
 =?utf-8?B?TFJYUUpVOHljWjFES2ROODRrclRuZk45Mm9FOXFrdlRqWXBCM3RJQ01FSlE5?=
 =?utf-8?B?cy9GbmRMcVE5cDVybkZid0JmUlZIVi9HamRYKzRETEJNTWU4K3Z2aVRwaFpi?=
 =?utf-8?B?VlJ6NHcyOHFKSGpUa0JKMWgyQlFiSyt4d1psQU5oQzViUkRUcndXUnBZaWNS?=
 =?utf-8?B?WG9jZlJldTZDaWYvVXN1b3UvMm9hcUV5S1lqbDhrd1FhR1p1TVcxY1l5QU8x?=
 =?utf-8?B?emM0SDBKeWZXOHR6cFdHT09uSEZwOWpPOXl3aVpTcnQ1RDVWWlRGWkVkZkxP?=
 =?utf-8?B?NzdaOHR4Y2RjeXF2UVdISE1HNldBUzJ6SFp1TE0zTmFoVHk5VXpaeWxFSHVa?=
 =?utf-8?B?bVk5aVZrYVZ5R1lvYWtyakZ2c0hPRFcxaXk2WGxvOE5yTlowVTZ3TWVuV1Zn?=
 =?utf-8?B?RVF1TkhCTS9DTjNJcjhDcVpJcUh0NmNtdWIwWDIvcm83bmZvU2htZ2ZzMmtw?=
 =?utf-8?B?V2N3TUtUK01US1R1OHZ2UWgyS2hkL2RVcllnaVNuOHdheGVlRkNVRnNXNjhP?=
 =?utf-8?B?TWtJeEk2U05saFFUbnZPNHBmMU1LZzE3a0VSZUZPSzQvT3pydlh0MkpaSnJS?=
 =?utf-8?B?OE9seXEzUkRZZU8wWVNYaWNuK2FZdllUeVpaSDRnTlkvMGtKNzNwRHBFYlQ0?=
 =?utf-8?Q?FIr8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE5SZzl4RjRkc1FhN0hWSkQrYUFwTVljd0Q3Y1l4UXFob3dabkt0c0V2YWlm?=
 =?utf-8?B?MER5QmsvcTUwaDhJN0MvLzBMc0VyQVI4TzdSRlBsR1RQNDgzNWhNMU5xNlNx?=
 =?utf-8?B?S2k2aFpQOFcxd01UOWhvbTFZYUNaMTVPQW43aHpjMkIzREd0bU9TMm85RVpy?=
 =?utf-8?B?WE9qK3hXQnhHeE9UbGtPd0hhT3ZhTDFobC9rOVhPWUtsL2pjUVd2dFdaZ2My?=
 =?utf-8?B?d2lISmRlcjRiZzd4RXdlamlIT1VRTjNhcElPbFNWbVBWVUZFaUpyUXFKbHhz?=
 =?utf-8?B?OGpyTGhkVFd5L1dWYlFmelZoTFJKZEpMSVJ4QTVMd2xSNk5IdUVFVmUvYWU5?=
 =?utf-8?B?bFhBWktSdFZsQ2hSbFF6eE1kaHFWNzE2c0NQaVg2eWRxWTYxTGlWcTd0Y3VU?=
 =?utf-8?B?eUZ1dVgrWUpJaUo3UnQzS0Z0Z3FROWRiTzk4OWtCcjlQVlo2VGp4RFE1bXFJ?=
 =?utf-8?B?dnZQeUN6c0pyYitZMUxxdy9raktKTk9nSXJXUmg2c0dCVWwrSHplU0FIUWhL?=
 =?utf-8?B?RXZ4em00MEZkQm5OUHVyWTc3SXd0S1oxRFhuaTk5QTErWVY5dDRsOW1KdXpE?=
 =?utf-8?B?UFF1c0JodEpVaklZcjc4TWlESDdaalh1NkJ3UnRBaXpKYlhUVEJSKzY5eDFo?=
 =?utf-8?B?QkJFWVFHcnRwUVBRd2ZGekhkaGRwSjNPUEVlcW1xdDZTa0JmS0N4OUptQlg5?=
 =?utf-8?B?VlVxRUtaVmlaemNHZGZCdU5yUFRSb3FsdGduQUlScmZUOERFVmZ1clYxRjI1?=
 =?utf-8?B?TEovS1JXNUw5ZnlMdGZsZTdkRUg3NXl0MWlCcFkydGtLQ0NwRnpwcHJGRzdX?=
 =?utf-8?B?TUVKSkNBVk9ZVUlOK2NQYXhBTFhpQU82NWc1Uk5zV1lzVXNjTVd1ZUY2WHJY?=
 =?utf-8?B?ZU9MTDVsSUVhMGY0bHFtajBESFkvWlJJY25ya29aYkhoajg4SEZHanc3aEJv?=
 =?utf-8?B?UFVMTnVEUGxDbmYvMllhdi8yalNhTzJPUTczdDlRejIrNjJxM2MxNnh1cUhR?=
 =?utf-8?B?eW54ME1wUzlXQzZwVjI3V0V1eHNMeXA3aktFRjlQbGNxMitqU3hzQy9jL0JE?=
 =?utf-8?B?eVFVaGt0bk56UmYyeGFDRnUyWS9jVUpTNThwaDA3REVXNGlJWVluc01telZU?=
 =?utf-8?B?elBadElhcFI2M2IxbDZHRnZSOCt3V3lYWEZ3S3FxY3JsVlVva2lucnpLMUZq?=
 =?utf-8?B?QWg1OFpKZW45NHBrK2cvTmZldzNXaENFMzBidjFncEJMSTMzWGFHLzhvaUlT?=
 =?utf-8?B?WEk5NWVucVB1ejA2OFl6dUVabEJWOGFheHJ2Q2ZGdnV2eWZzR1N1eTVkMXp6?=
 =?utf-8?B?TDhxWk9pR3ZRTUJ1dUoxMlF4QVFNRUZsczdhYW05NFZPSzRhd1BDcWlTa0I5?=
 =?utf-8?B?b00yYmpwUGpIQm1wTm1rR3RZV1NUOWVIYkF2emQrSE1kWkZLZGZ5TGoxNFl4?=
 =?utf-8?B?dVVwL0dZNUhDZDJ0K0NZT3NtVUlBbWJFRUpvNlBOeFhvWWl4a1VTQTJIeFVs?=
 =?utf-8?B?QlNWZFZaemNGRjRjbmJIMzlESW1mMzhjTFZLbmFxWFF6enBXZksxNDZiOGgw?=
 =?utf-8?B?dldxaWcwVktsTXBxUUdvNmxFZGlTSElrdGs1WWZJZm5UTTVDSTUxZTc1NUNn?=
 =?utf-8?B?SktlZkIyNEV2eDlGZEVwcDhLRE5EZnJMa3hDM2swdEVRcDlHaHBlNTIzdkF0?=
 =?utf-8?B?dEVSTFI3SlMyQUErWFc0WXNtRzJjckw4VTk3SGIwNTZ5N2NoL2VNc2ZHSXVo?=
 =?utf-8?B?aTRtME8yZXFzeHptTGFFSHNVQjZ5TlJpaW8wcGM5UEs3MXVGVjh5Snc0RjB5?=
 =?utf-8?B?YkFoQnE5UStmVHpGWWRPaC9hNG1lMHVCOTIrdldtekw2cXF4Z0xZYmNyUmtE?=
 =?utf-8?B?akIwWEZDYUZnQmtsOTltQXJiNzU0TExXKzRxanFzbTRVaDRsc283V1lKUUUz?=
 =?utf-8?B?dHdYVmt0Q1NPTW9paEdPQ0lMK0xOS0F4Rm1DcWMyeFJheFdMZjlEVGZOLzRz?=
 =?utf-8?B?MkpDbXRNdXYvem1SNDV1cjRCd21ob3NXQ0hiTkNlUzZ4bmN4SmozUW9LVHRp?=
 =?utf-8?B?MHdnV2EreGlwRFQvWmwrK2dFWDBGYmhyUjZZVWIxeUlyaG5BWmRwZGJoM0pJ?=
 =?utf-8?B?ZjR5eVpRZTdXN3cxeDU5c3dGRVphaDVXUE41NXBDTG9RWTdIYWxUK1NhY1Ri?=
 =?utf-8?B?eXZ5dTFtMGR5U3U5dWJ4QkVpbDBrb3JFY2Q5L01EZ0k2ZWc1blE5emdnZFNU?=
 =?utf-8?B?ZTl6cEM0QjZVWGRlbHM4dEs3SmlTRHh1V3RRUDJKb0FIUSthRFFTUUN1Z3Vx?=
 =?utf-8?B?ZTdmL3lOR3ZHL0ZmZmUrSFVCMUs1L3ZtUFVBRkg0WHlBbHlGeUlUdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2806e201-52a9-432f-bc7d-08de6fd36955
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 16:24:53.1043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /l8Hyf4pw6J3IZ2ldJKZK3x7IGwQTo8o3Z5JkKyoFq4nxO7zxQdIDIPu6BSi/q1DvajOtfJP0S5SeYSAXMYl+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 2845A160A54
X-Rspamd-Action: no action



On 2/19/2026 10:31 AM, Joel Fernandes wrote:
> On Thu, Feb 19, 2026 at 11:09:42AM +0100, Danilo Krummrich wrote:
>>> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
>>
>> This Fixes: tag seems wrong. How is this code move related to this problem?
>>
>> This should rather be:
>>
>> Fixes: 6387a3c4b0c4 ("drm: move the buddy allocator from i915 into common drm")
> 
> You're right, the bug existed since the original move to common drm.
> Will update the Fixes tag.
> 
>> Also, please add:
>>
>> Cc: stable@vger.kernel.org
> 
> Will add.
> 
>> I also think this patch should be sent separately and go through drm-misc-fixes.
> 
> Agreed. I'll pull this patch out of the series and send it separately
> targeting drm-misc-fixes.
> 
I just saw that Koen will send it separately so I'll let him handle it. In
future postings, I will put both this fix and earlier 2 patches (part one and
two of the move) with prefix [cherry-pick], since the only reason I am carrying
them is because it is a dependency that is not yet in torvalds/master branch.

I should have made that clear. Thanks,

--
Joel Fernandes

