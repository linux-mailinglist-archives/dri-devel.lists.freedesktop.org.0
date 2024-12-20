Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4E69F99C5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 19:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CB110F02D;
	Fri, 20 Dec 2024 18:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XokWVY+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AB310E07A;
 Fri, 20 Dec 2024 18:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734720656; x=1766256656;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LotUSbEFEsSPHftrTKtfOQeJPxAKp9OnG5lKSYLX54k=;
 b=XokWVY+9DMOP7Fmjw2pf4EEZDPL23qZmHeflnPMftI79dovNwtkpvGfh
 Z+hW2RquCs6Sg8g9BvT5Ae9OVUykqaQ0JlJqNbpSA4gppGFZ5lBl7p+t2
 gHqjkydhT0WTpZ5DaoTOdIBkr5rJ5jAOwtunAlZ1yKLX4VrpqyZwLoMtm
 /PCBQMaJDpMRKQDu/TC836g53wJeBolAObFHAxiL04ILDhm0j2tJobwt7
 46CmSQflXg2jUcf6YHChTbkTuxC41cUcixrQ8CtgGmbrPXGooXxFoJsp9
 15vr/j5V3PIy6cJmCDZQ0W9RgfTq8BZlMmn0h70XIHb/X9f82OCQLMUk8 w==;
X-CSE-ConnectionGUID: MrlqdOVOTJWpmCeHh0bP7Q==
X-CSE-MsgGUID: mcCngokZSiahaZq4zGT7BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34992101"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="34992101"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:50:55 -0800
X-CSE-ConnectionGUID: 6VdxtoxkSEaqRGdPzwyIQw==
X-CSE-MsgGUID: VQ+8Ca8zR6ShSjnTh72img==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98358546"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 10:50:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 10:50:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 10:50:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 10:50:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ek61ijHjfJ2KdCc3T2qNTnJ46uX4qpwKeTLDcgegjgUrduelS9jnwoLAPxxGm4AuqMVYjuYVVhKikK19ahDk/JFYFeoRW7COEHz7W1L487bZVNejKbCHMNWMt5kb7bS7XnwW68Ti+BkTCDGxShFqTL7YXbUcBIYH6sVlE8WJ5XWvAhVmMYVeY2TX8t0Wzumg/oKkmWTqoLFkbZnJn95JEcP0dd7uyLaYNzZSeSbwnA26jBDBr2DeFHinbGk5IxnXXfI7sc+63I3rO9VeaNL5mriW6k1NNxlnhSdLct9ijCq05AX+lX5Gb70y4K3P1IBJsmB/EASxlSC8H0d3Nx66xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2hrQ6tEQrD2+Cv2xEKy9gMr04wW5HeReLsWBYHbTaM=;
 b=qAJpWA9Bdv02grEVWJtp8kXyjwU93RkCH4OulYuE+l82JYJwIrmJt+SjpLbKwcE6nLvfANaKPh+go+P/hOpNbg9+xt//AXMCHRAsYrLl8IlPsMazRBs2Hd1TxT2KHfHNjewX7DWaaWWQYSejTWkA1Tc6Vr9Vij0z7os09+25/YhsbjLDZe1tH3gXSv49ygsBUHJh2ovmhTdhNIlq1nmsWj+fyCC+YHBeXGt3idXsFlVyxr4yOvGlHy6XiskewnswrZ4v07T0nnsraSKSvdubBX6bkXQCXBXj09ExwtvcolcF1gUvRPH+GETTIjG1qYnFXtm3UT/TUDsSTVh5Oim9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 18:50:17 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 18:50:17 +0000
Message-ID: <aa8fd567-7065-470e-af7c-d3910487d5b0@intel.com>
Date: Sat, 21 Dec 2024 00:20:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/30] drm/xe: Add unbind to SVM garbage collector
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <20241217233348.3519726-16-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241217233348.3519726-16-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::35) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SN7PR11MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd1ff27-7d3a-47d8-02e6-08dd21272520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHdQMDMzNER4cnMwR1cxVENzQ0t1OFRXZkExQUEwNVM0QWxUOW55Ny9xUTFD?=
 =?utf-8?B?MGlvTW03SXhjRGhpMFdCVWkzQzA2clBLalJiT1VBZ3djVXVYZldVWXNUenhJ?=
 =?utf-8?B?Tm1DQnBDUHNDdVdzU1ZNUjBJYVFoU0wwTTlmYm0rK015WlF5Y1ZpbTAvQzlq?=
 =?utf-8?B?RWFJT0J0SGxxZ3VXWG5JN1U2M2o2N1BnYlpZMDgxaGk5Z0hwditBaUF1bmxE?=
 =?utf-8?B?dXQ1NUh0Q1lrNFBZTWUzOFdsSm56ZXZDMGlyL3BvU1YxTGRldmxodVlDV2ZB?=
 =?utf-8?B?ekZjQ2VHY2ZkK1VEdkpxaWtPdzB0NHcrOG9KMlVuUG9aaUFKNnp0dzFPQk9V?=
 =?utf-8?B?QTY1V3AzTkxTMER5ZERRc2M0bEd5MFFsM2t4U2ZJTjMvdG9tYmJVYmFnajZ1?=
 =?utf-8?B?MzlzV2U1NWlXZ1hJU0YzMGRaaDRycTU5MTFLMHFOVHJvVWY2WHJWdVYwaUF2?=
 =?utf-8?B?K0x3L0lOVXlydlM0b0RHTVk0UTl5cEl2QWVCMVJiQ0tHYlhabkpubWM0RzZa?=
 =?utf-8?B?OThjN1ByMEdMY0QwZ1R2UlUrZGgyT3YxdzVNL3J0ZXNYNTRseUpGWldONjdt?=
 =?utf-8?B?bDdTKzBhcWhybVAxb3hzSkl2MG8zaVNnRnlza2JIbk5ac2lBK1RMczJ0bW0x?=
 =?utf-8?B?TVVBTWpka2JzL2pidmdlZkk2UExQTHJtZlprWjV3R1ErVHYrZ2N5VjNONmtq?=
 =?utf-8?B?VmhTRUZKdU5HaWFjT21IaXNKZVRWTnd3a0czWktla2U4TkNDeUxPbTRUUEx6?=
 =?utf-8?B?WHRRWk1qZStNcTFiM2x6ajF4VnBKYnM0R1ZsNDR0b2tZR3lLUHFkL2swWlpG?=
 =?utf-8?B?TzR1WXArdU84OERkZWNzUEVVSFEwcXpqU29LbTVZcmFmdmxiQ2wyWU1CdWp0?=
 =?utf-8?B?emplMFc0bkNlZitwNHNuUzdHUy9KSnMrWjhWZkJVeHBLYkdsSlduRzJjUlA1?=
 =?utf-8?B?VEZVT0FOaWg4d3Jra3Y2ai9seGhaTWVoSEZnalVVQ1o4UnNrMHBUSU5FbndP?=
 =?utf-8?B?eXV4T3hOTjk0UVlnb3pSK0Z5WFZDSmRKQ1dLazEyZC9YRnFHWm9NaVVLL1Uv?=
 =?utf-8?B?YThBOVVoRWpoNEM5eVo2anY5dm1SdXVPRWwrZ011NjIydWhXK3hMMUl2eVFQ?=
 =?utf-8?B?dVd4T01NYkpXQmFZa3JSc1doOGRHWGNKZFhldGgwT2lnZ2lWaWZHWVh6eG9r?=
 =?utf-8?B?RmJVR01Na3hzY055TithVU0vTUVURnR4MDluK0M2d1plZ0tFU3Ftc20vSWVI?=
 =?utf-8?B?aFFXbE1KRWxGNDcvMVRRM25Rak5GVXE2M3d6Ui9OQU5sbWJjY296NFRCWEJr?=
 =?utf-8?B?cWtxQXBSYUJFQzNsL0l0RklsbXhLakk4THVoOXBVc3pjUGpaNXNUZkxrU3Zl?=
 =?utf-8?B?bGpScU1kVDh5TFVtcVU3cGpQKzc3aVpjUzZsQWVUT3k5Z1hGMmo4WEU1VmM3?=
 =?utf-8?B?Z2N4M29KMm90V09MMG1Md1JGRlNnTWhEUUFwZm9vU3ArWVZoUUFrb2dFZllM?=
 =?utf-8?B?eGE0eDU4RmZETUFKWnVsenkxZlVGaW1sRTVhRGZ3bm1TT0QwOUUxRldvb3dB?=
 =?utf-8?B?S1hvUXhnaEZjdmpTeHYxR2wzMUN5MVJ1eFZKNjNPYVRadHJNVm9TZHdJWWox?=
 =?utf-8?B?RkRLaTMvRzk0Slc5Ui9WUVVsS1N0KzlOVUQ3TmQzaWhDbVZ5U2NTeVBzSUk2?=
 =?utf-8?B?TkNRVzRWWlhVcFNVcEFzcGFqNTZLYUhTZDlBTU9SWWJ3T2R6NXJvNFZxZEFy?=
 =?utf-8?B?S0thTzZIVitvMHJTTC9yc0VlTXB5aXF5VzVTSFliWVY0V0N6cHAxNzhlY0dj?=
 =?utf-8?B?aXlnelh4aExJRW1JN2k1MjljOVNCeVgyWnRxZjNqWWZvby9FQW1mdEV5RnJh?=
 =?utf-8?Q?+rFJRt9YrAaqp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q05oT0ZRdHorUDE5QVJBUFpFUEt1VUdUMDVOT212WlFvcnFoYzUxV0ptaDRE?=
 =?utf-8?B?K0VDbkxYN0RxZlNJVGFmemdOQVdSa1E2YnhMeGliOVRDL0VLcGhtaU5rWDJl?=
 =?utf-8?B?SlBzNHp4WnFHUUFoSVl2WTliV3RLZkVHOEVqMXRDQTlEQ0ZNZ1BUQncrVzRU?=
 =?utf-8?B?bUJHY1QxZkVNSytqakVpSlRtQ2h0dzM4T2RzMlRjYjJ1YlRUTUZiMmkvNVhs?=
 =?utf-8?B?bkh5L1ZZL05GY0NiMk1xRmdNQmp4OGxyd1FaeldYZC9LbmpQZkw1QWJEUzVj?=
 =?utf-8?B?cklmUncvN2dYUVNWb0h3TjFobnRQWlBBeERNSXlFYzluYkRDbG5kYmplSHdY?=
 =?utf-8?B?QnZTNHhFa1VtUmxBeFU2K1V3VVpZSmVlV2RCN2FsZXNpUnF3VFIzSzBIaE1y?=
 =?utf-8?B?eUR2SUVWVW9JZ3RpMkVxRFppTmJ3M2ttdWpQZTloT01HSm9tM2ZwdnJjRkRE?=
 =?utf-8?B?a2Y2N1J3T2lhN3BjZmxHajFKc1MvWUlVZUJYOHBYQWZuNWZ0c2wxODdVb2Jh?=
 =?utf-8?B?OUhieXhTamc2dkwraUczQ3FwTjZOcEljQnBuTU1pZXd3K3Iva2dQWFJqaU41?=
 =?utf-8?B?cDhGcFVrVXF0Z0ttSWh6MlJQWHZudXJOcTNYeDB3Zm1FMlJXR3VOVEZaYkI2?=
 =?utf-8?B?NUVNV0tRT2NDckg5aklFWTBaN01tL0RCOThJaGpKRHhxS1lpcG1aQm5XaDVL?=
 =?utf-8?B?Wm1CM2YwWW0zV2hvRTlLVXppcXM3T0Vnc0VMbWNRVHBCUk01NXRFU2JQTHlT?=
 =?utf-8?B?eDQxci9YdlNXZ3JjemxIbWxKbHRHRDRUcGtMNkRjN1gzUTJ3RkJKT010bFRH?=
 =?utf-8?B?TTZZQXpESUxkRzlCVXI1MGlxVGZreTdxeE9EazNKaytwQVYxVnVwYTBqUlJp?=
 =?utf-8?B?ZEYzS0E3VjNUSnJRZ0RyaTQrVFdNa3ZVS2ZwL2dXWk5FUS9uRmFTbXhLeG1y?=
 =?utf-8?B?cWRnbGQ5MGhTa2dQd3NzK2ZMYW85cU16bTRUQWp3NHJESWpGTWQ3U2xkMU5U?=
 =?utf-8?B?SnZtR1Z1MFNLbjA4OElGcDJKd0NqUzVyRDk0UC9mWVZEenFEUU04dXVYQmpW?=
 =?utf-8?B?WjBJZTlGSjJCZmI3Zyt2RGFQVVRtTjhTancza2kyekNuaURYR1VlcitBWldu?=
 =?utf-8?B?WWwyR2NGR3FwVExZakxJem9walRHbFlGQVJWVDNXendyVC9TWTlyRGx6Y1RT?=
 =?utf-8?B?eHIveXBNQ1UyM2gwZHkrT3IyWlBJZXpmUElkL2pIUzkzaXdGUXFMbWc1d2VB?=
 =?utf-8?B?SGVTOXRNWW1JK08yaVFZc21iMEtDTkx5VnRqSnIxUkNzVXZXcFBKMk42OUVH?=
 =?utf-8?B?UWNjTHA1YXB2dFZ6dzhDbmJ5QldpMGdIamxjQ0YzRk80WHpyZTN1QnNFMi8w?=
 =?utf-8?B?THRYMUFUbHYzZFFYU2EzU0pTNFNDNXJKalFISngvbTJIUGtuUHpVM0llUkcx?=
 =?utf-8?B?cWJGRXNjSDlXTHFkeng5blhtbnZNRFhtVkp1ZjRyd0pPa0lBcld1OGRRcW9W?=
 =?utf-8?B?aUc4SzQ2dW1tTXhFRFFPL0ZwVGtSTFF2WFdDSlJDcHZLYnl2NWVUWVl5aVlq?=
 =?utf-8?B?a2NGY1hxVmtibjZZelBkN1ZubDZOVTlnUjAxWGlCZUQ0TnQ0d1BqKzBkbXF1?=
 =?utf-8?B?KzhiaWpPYTRRQTlBQUUyOURjaUtqbGZSNEhkTjcxR0d3N1ZGdUZJYUNQZjNs?=
 =?utf-8?B?eXM1bDdhd21CTHVGM1pxUG0vdHRDd0YrWkZtaXRKenFMOS9EbS9aY0U0Ym5k?=
 =?utf-8?B?TUp5RWlkT3NucGlFYjhURzVIeU02TjVNbG1iZjloNllVaWNmbUZGcmhmM1Bj?=
 =?utf-8?B?THVuMVpqRHdtc2FKaEN2TkRzeFV6aWpvcW1KTXZsOFRrTjhBczFrUlhHcU80?=
 =?utf-8?B?SVhwMzZoZXVyMzdkQnU4WkNwL0lQZ3RmT0dlUWU2d1graUlmNFJKTHd2WFp2?=
 =?utf-8?B?em9tRmJScEhGNUZ3bmpNYTNMS3pseVh6eXI4aFp3RnY3NnA4Sm9pU1pNcllB?=
 =?utf-8?B?V1M4SGFsZDEvWW44aW1PL1JTOWQ0RHlPR0RMQlM1NEUrRWlWYVJuTmQ0Zk5I?=
 =?utf-8?B?cm9IUG5hT3ZLdkpoT1daQmpqSXZiQmhneW1EemRHS09LM2xhWmF3VUlURloy?=
 =?utf-8?B?QVVRaDhsMzVsUkJiSHJhRXFYSk8wSFpFRHgvZzFSR2dsOWhHWnduaUQ5cjBD?=
 =?utf-8?Q?dj5KU93Cgk3bqncdL7kAsEQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd1ff27-7d3a-47d8-02e6-08dd21272520
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 18:50:16.9829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSqo9Nd7boG3e4yp1OJQ/iSSmU2I8qybyRmRElX2cqC37SfRau2Cb4BXH6JBRNdMhq5qs6butbBs2XrBpKWsEabhEmeE4uB8nVs8/h8VgMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
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



On 18-12-2024 05:03, Matthew Brost wrote:
> Add unbind to SVM garbage collector. To facilitate add unbind support
> function to VM layer which unbinds a SVM range. Also teach PY layer to
> understand unbinds of SVM ranges.
> 
> v3:
>   - s/INVALID_VMA/XE_INVALID_VMA (Thomas)
>   - Kernel doc (Thomas)
>   - New GPU SVM range structure (Thomas)
>   - s/DRM_GPUVA_OP_USER/DRM_GPUVA_OP_DRIVER (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c       | 84 ++++++++++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_svm.c      |  9 +++-
>   drivers/gpu/drm/xe/xe_vm.c       | 83 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.h       |  2 +
>   drivers/gpu/drm/xe/xe_vm_types.h | 12 ++++-
>   5 files changed, 172 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 6924f3ebfe3a..9c90dfc81fbe 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -957,10 +957,16 @@ static void xe_pt_cancel_bind(struct xe_vma *vma,
>   	}
>   }
>   
> +#define XE_INVALID_VMA	((struct xe_vma *)(0xdeaddeadull))
> +
>   static void xe_pt_commit_locks_assert(struct xe_vma *vma)
>   {
> -	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_vm *vm;
>   
> +	if (vma == XE_INVALID_VMA)
> +		return;
> +
> +	vm = xe_vma_vm(vma);
>   	lockdep_assert_held(&vm->lock);
>   
>   	if (!xe_vma_has_no_bo(vma))
> @@ -986,7 +992,8 @@ static void xe_pt_commit(struct xe_vma *vma,
>   		for (j = 0; j < entries[i].qwords; j++) {
>   			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
>   
> -			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags, deferred);
> +			xe_pt_destroy(oldpte, (vma == XE_INVALID_VMA) ? 0 :
> +				      xe_vma_vm(vma)->flags, deferred);
>   		}
>   	}
>   }
> @@ -1419,6 +1426,9 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>   	list_for_each_entry(op, &vops->list, link) {
>   		struct xe_svm_range *range = op->map_range.range;
>   
> +		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> +			continue;
> +
>   		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>   		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>   
> @@ -1616,7 +1626,9 @@ static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
>    * xe_pt_stage_unbind() - Build page-table update structures for an unbind
>    * operation
>    * @tile: The tile we're unbinding for.
> + * @vm: The vm
>    * @vma: The vma we're unbinding.
> + * @range: The range we're unbinding.
>    * @entries: Caller-provided storage for the update structures.
>    *
>    * Builds page-table update structures for an unbind operation. The function
> @@ -1626,9 +1638,14 @@ static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
>    *
>    * Return: The number of entries used.
>    */
> -static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
> +static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
> +				       struct xe_vm *vm,
> +				       struct xe_vma *vma,
> +				       struct xe_svm_range *range,
>   				       struct xe_vm_pgtable_update *entries)
>   {
> +	u64 start = range ? range->base.itree.start : xe_vma_start(vma);
> +	u64 end = range ? range->base.itree.last + 1 : xe_vma_end(vma);
>   	struct xe_pt_stage_unbind_walk xe_walk = {
>   		.base = {
>   			.ops = &xe_pt_stage_unbind_ops,
> @@ -1636,14 +1653,14 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
>   			.max_level = XE_PT_HIGHEST_LEVEL,
>   		},
>   		.tile = tile,
> -		.modified_start = xe_vma_start(vma),
> -		.modified_end = xe_vma_end(vma),
> +		.modified_start = start,
> +		.modified_end = end,
>   		.wupd.entries = entries,
>   	};
> -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> +	struct xe_pt *pt = vm->pt_root[tile->id];
>   
> -	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
> -				xe_vma_end(vma), &xe_walk.base);
> +	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
> +				&xe_walk.base);
>   
>   	return xe_walk.wupd.num_used_entries;
>   }
> @@ -1885,13 +1902,6 @@ static int unbind_op_prepare(struct xe_tile *tile,
>   	       "Preparing unbind, with range [%llx...%llx)\n",
>   	       xe_vma_start(vma), xe_vma_end(vma) - 1);
>   
> -	/*
> -	 * Wait for invalidation to complete. Can corrupt internal page table
> -	 * state if an invalidation is running while preparing an unbind.
> -	 */
> -	if (xe_vma_is_userptr(vma) && xe_vm_in_fault_mode(xe_vma_vm(vma)))
> -		mmu_interval_read_begin(&to_userptr_vma(vma)->userptr.notifier);
> -
>   	pt_op->vma = vma;
>   	pt_op->bind = false;
>   	pt_op->rebind = false;
> @@ -1900,7 +1910,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
>   	if (err)
>   		return err;
>   
> -	pt_op->num_entries = xe_pt_stage_unbind(tile, vma, pt_op->entries);
> +	pt_op->num_entries = xe_pt_stage_unbind(tile, xe_vma_vm(vma),
> +						vma, NULL, pt_op->entries);
>   
>   	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
>   				pt_op->num_entries, false);
> @@ -1915,6 +1926,42 @@ static int unbind_op_prepare(struct xe_tile *tile,
>   	return 0;
>   }
>   
> +static int unbind_range_prepare(struct xe_vm *vm,
> +				struct xe_tile *tile,
> +				struct xe_vm_pgtable_update_ops *pt_update_ops,
> +				struct xe_svm_range *range)
> +{
> +	u32 current_op = pt_update_ops->current_op;
> +	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> +
> +	if (!(range->tile_present & BIT(tile->id)))
> +		return 0;
> +
> +	vm_dbg(&vm->xe->drm,
> +	       "Preparing unbind, with range [%lx...%lx)\n",
> +	       range->base.itree.start, range->base.itree.last);
> +
> +	pt_op->vma = XE_INVALID_VMA;
> +	pt_op->bind = false;
> +	pt_op->rebind = false;
> +
> +	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL, range,
> +						pt_op->entries);
> +
> +	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> +				pt_op->num_entries, false);
> +	xe_pt_update_ops_rfence_interval(pt_update_ops, range->base.itree.start,
> +					 range->base.itree.last + 1);
> +	++pt_update_ops->current_op;
> +	pt_update_ops->needs_svm_lock = true;
> +	pt_update_ops->needs_invalidation = true;
> +
> +	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
> +				    pt_op->num_entries);
> +
> +	return 0;
> +}
> +
>   static int op_prepare(struct xe_vm *vm,
>   		      struct xe_tile *tile,
>   		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> @@ -1982,6 +2029,9 @@ static int op_prepare(struct xe_vm *vm,
>   			err = bind_range_prepare(vm, tile, pt_update_ops,
>   						 op->map_range.vma,
>   						 op->map_range.range);
> +		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
> +			err = unbind_range_prepare(vm, tile, pt_update_ops,
> +						   op->unmap_range.range);
>   		}
>   		break;
>   	default:
> @@ -2171,6 +2221,8 @@ static void op_commit(struct xe_vm *vm,
>   		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
>   			op->map_range.range->tile_present |= BIT(tile->id);
>   			op->map_range.range->tile_invalidated &= ~BIT(tile->id);
> +		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
> +			op->unmap_range.range->tile_present &= ~BIT(tile->id);
>   		}
>   		break;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 32b1581b1ad0..58fbe1b65e8b 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -216,7 +216,14 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>   static int __xe_svm_garbage_collector(struct xe_vm *vm,
>   				      struct xe_svm_range *range)
>   {
> -	/* TODO: Do unbind */
> +	struct dma_fence *fence;
> +
> +	xe_vm_lock(vm, false);
> +	fence = xe_vm_range_unbind(vm, range);
> +	xe_vm_unlock(vm);
> +	if (IS_ERR(fence))
> +		return PTR_ERR(fence);
> +	dma_fence_put(fence);
>   
>   	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 12e5e562c5e1..20ea099664af 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -984,6 +984,89 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>   	return fence;
>   }
>   
> +static void xe_vm_populate_range_unbind(struct xe_vma_op *op,
> +					struct xe_svm_range *range)
> +{
> +	INIT_LIST_HEAD(&op->link);
> +	op->tile_mask = range->tile_present;
> +	op->base.op = DRM_GPUVA_OP_DRIVER;
> +	op->subop = XE_VMA_SUBOP_UNMAP_RANGE;
> +	op->unmap_range.range = range;
> +}
> +
> +static int
> +xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
> +			   struct xe_svm_range *range)
> +{
> +	struct xe_vma_op *op;
> +
> +	op = kzalloc(sizeof(*op), GFP_KERNEL);
> +	if (!op)
> +		return -ENOMEM;
> +
> +	xe_vm_populate_range_unbind(op, range);
> +	list_add_tail(&op->link, &vops->list);
> +	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vm_range_unbind() - VM range unbind
> + * @vm: The VM which the range belongs to.
> + * @range: SVM range to rebind.
> + *
> + * Unbind SVM range removing the GPU page tables for the range.
> + *
> + * Return: dma fence for unbind to signal completion on succees, ERR_PTR on
> + * failure
> + */
> +struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> +				     struct xe_svm_range *range)
> +{
> +	struct dma_fence *fence = NULL;
> +	struct xe_vma_ops vops;
> +	struct xe_vma_op *op, *next_op;
> +	struct xe_tile *tile;
> +	u8 id;
> +	int err;
> +
> +	lockdep_assert_held(&vm->lock);
> +	xe_vm_assert_held(vm);
> +	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> +
> +	if (!range->tile_present)
> +		return dma_fence_get_stub();
> +
> +	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> +	for_each_tile(tile, vm->xe, id) {
> +		vops.pt_update_ops[id].wait_vm_bookkeep = true;
> +		vops.pt_update_ops[tile->id].q =
> +			xe_tile_migrate_exec_queue(tile);
> +	}
> +
> +	err = xe_vm_ops_add_range_unbind(&vops, range);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	err = xe_vma_ops_alloc(&vops, false);
> +	if (err) {
> +		fence = ERR_PTR(err);
> +		goto free_ops;
> +	}
> +
> +	fence = ops_execute(vm, &vops);
> +
> +free_ops:
> +	list_for_each_entry_safe(op, next_op, &vops.list, link) {
> +		list_del(&op->link);
> +		kfree(op);
> +	}
> +	xe_vma_ops_fini(&vops);
> +
> +	return fence;
> +}
> +
>   static void xe_vma_free(struct xe_vma *vma)
>   {
>   	if (xe_vma_is_userptr(vma))
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index a82fe743bbe0..3b6316dd9fd6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -221,6 +221,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>   				     struct xe_vma *vma,
>   				     struct xe_svm_range *range,
>   				     u8 tile_mask);
> +struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> +				     struct xe_svm_range *range);
>   
>   int xe_vm_invalidate_vma(struct xe_vma *vma);
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 576316729249..19576ac095e7 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -361,6 +361,12 @@ struct xe_vma_op_map_range {
>   	struct xe_svm_range *range;
>   };
>   
> +/** struct xe_vma_op_unmap_range - VMA unmap range operation */
> +struct xe_vma_op_unmap_range {
> +	/** @range: SVM range to unmap */
> +	struct xe_svm_range *range;
> +};
> +
>   /** enum xe_vma_op_flags - flags for VMA operation */
>   enum xe_vma_op_flags {
>   	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> @@ -375,6 +381,8 @@ enum xe_vma_op_flags {
>   enum xe_vma_subop {
>   	/** @XE_VMA_SUBOP_MAP_RANGE: Map range */
>   	XE_VMA_SUBOP_MAP_RANGE,
> +	/** @XE_VMA_SUBOP_UNMAP_RANGE: Unmap range */
> +	XE_VMA_SUBOP_UNMAP_RANGE,
>   };
>   
>   /** struct xe_vma_op - VMA operation */
> @@ -397,8 +405,10 @@ struct xe_vma_op {
>   		struct xe_vma_op_remap remap;
>   		/** @prefetch: VMA prefetch operation specific data */
>   		struct xe_vma_op_prefetch prefetch;
> -		/** @map: VMA map range operation specific data */
> +		/** @map_range: VMA map range operation specific data */
>   		struct xe_vma_op_map_range map_range;
> +		/** @unmap_range: VMA unmap range operation specific data */
> +		struct xe_vma_op_map_range unmap_range;

:%s/xe_vma_op_map_range unmap_range/xe_vma_op_unmap_range  unmap_range/
>   	};
>   };
>   

