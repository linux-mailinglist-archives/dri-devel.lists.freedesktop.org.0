Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673B4A374B7
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 15:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BB610E236;
	Sun, 16 Feb 2025 14:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7wUdMUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D66D10E21E;
 Sun, 16 Feb 2025 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739716341; x=1771252341;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6PPDLraUSNLi7nSPTwBjKkaiHAAJEz9aQhI1RSTOKHc=;
 b=T7wUdMUMWoR2RXGOM3biJpOWq1yyJCts2V7QrL4A+967wfvE9EcKAcUR
 3IQ1pmCIAem2JLBy2GcCYhuTYRIWjc0OZXRosj/RvPB5wpV+WntbDR3La
 bKNwIQAgVzgjZyJ1jijkzWpGCIBBzucW4vlyHZL7DJhF/Ok/XA3uSVbWc
 saf4g4iW4imKqs6eHisa1DT9bWjGNUh9vEZ3BNJxQzstfPYAoRMr7jgL/
 l/KrpTZHnexkM2g3Wu0sYBeiZzOODHjCDV33hrq8S3xUTr8LGao7UnHTa
 je7N/qGtcDclZvdMPZOEvAacYv3PkfEa2oUstMWmJOWA914hS/yRxdEqR g==;
X-CSE-ConnectionGUID: 6Q7coGTtSraqXocr0tXi7Q==
X-CSE-MsgGUID: s3kKIzhwTxuSjmwVfRqXNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40677505"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; d="scan'208";a="40677505"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 06:32:20 -0800
X-CSE-ConnectionGUID: wqRZ7LrNTuG/U0qkStdnQQ==
X-CSE-MsgGUID: mRIngdxASIuIs8UmLeJUtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; d="scan'208";a="113850627"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 06:32:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Sun, 16 Feb 2025 06:32:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 16 Feb 2025 06:32:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Feb 2025 06:32:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxywo1kWkoTl4O+HbW7bYUxi24eWPUxSG/w8T703zP3wVLUNFONEKstYaoShq9D3JDifPNoMqG4DxXfEBB7OQ7d8/8dtbhSZeGFA4I6gVgzuVzREoPV6BQLtUEmV86lDMJTIysIm1W9nhreeNTAtfP/ON/uRWq7Ei8zllswydi6L0E53s2hkh3J/Xrv0sxv7wYh66/rMLkZ9lKdVBzxYRQYfY8L0RSFqJ5cotZREA/VVquQahwYhFsRRyd9h2ss/LDgYYLgU3Uou8MyoNlu7uwhkee+AnaAAmXn6Y3zUiEPYJR8OOMV4UuG3cloa7/JIpzfvB+qaRAkKt+oME8THNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpRbEjNdWLnVaTYIeTesmIKzRTITxWW7uA0JD++6KLs=;
 b=OU/BgIF7lcy5FPi8Ji/WxDHWTId2EdHumg2qiXF7JbINiCxdLbUmJypp9sSppFbzC38y9Zt2gVXkwyK/pa0YCmy/TUCDFcsRKUlQPo+8CzR/uyzZJp8oOkm9rCc1MBuqurU2dadF5uTJEB6LaSOECCls7inQOXrWHLvgiPIgvcx09CapkLapUlOd8EP10Jgr7Pkce4UAiKC1HOqbbKj8aR0XoTmWW6NzYR/LcTjRMXEUSEJZfZFnVex9qk+MmrOoajyEzrHZNG2y/1oNMAmffuiU1gMqfzn+Qp4aOZc5HeCbs0TQrT3H9VX/zwybYFsU89Lk5fNcV/daGN1YMCy+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by PH0PR11MB5127.namprd11.prod.outlook.com (2603:10b6:510:3c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Sun, 16 Feb
 2025 14:32:16 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%3]) with mapi id 15.20.8445.013; Sun, 16 Feb 2025
 14:32:15 +0000
Message-ID: <157c5990-41d0-4af8-917a-db59a8b157e1@intel.com>
Date: Sun, 16 Feb 2025 20:02:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v8,06/14] drm/i915/histogram: Add support for histogram
To: Arun R Murthy <arun.r.murthy@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <suraj.kandpal@intel.com>, <dmitry.baryshkov@linaro.org>
References: <20250128-dpst-v8-6-871b94d777f8@intel.com>
Content-Language: en-US
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20250128-dpst-v8-6-871b94d777f8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To PH0PR11MB4806.namprd11.prod.outlook.com
 (2603:10b6:510:31::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4806:EE_|PH0PR11MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2764a3-8e60-4d18-3dcb-08dd4e96b50e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WU9TelBFRlZNS09aOU9ZbVRSWU9tTXZZajU0ZjI2V3EvUDlueHhQSWgvYVNU?=
 =?utf-8?B?aDBIV2JGSHgzdjdSQVdhWTA0NHYySFNNTFlQM25uSm5wUzIrbldxSUIzVVJK?=
 =?utf-8?B?Qjg5MmFuVGNCZ3pTWjZwWjd0SXpGWFhtSkJiMStJeTJmMVJ2RnpKcjgrdjIz?=
 =?utf-8?B?aGU4Z2dmT3NRTTQwZ0V5L0FFbEw3K3ZSZHNXQXJLSGVGQzVZcmQrLzBQUjV0?=
 =?utf-8?B?dTY3eitZd0ZkcHczVXllQlpDcjZUOFB3WFo0NDhMbTI5bktIM1p4dlJJNFBP?=
 =?utf-8?B?NnJiNy9uWVJqdTU0RTNUSzFJR01xc1ZkTklXK2JSSUlwNDErQzB0MjJubjN6?=
 =?utf-8?B?bWkrdlQxNy9BT0Z2eVZqMm5JQ0dCbEJIb1ZWbStKcDJTazR0WXBBY21VeFFl?=
 =?utf-8?B?dkt3b2RCWDFrejM1RGt3VEZQbHVyMVZEcGJuSlJzNHA5UVlQQ3hNZENrSkFZ?=
 =?utf-8?B?UFZuMDlCOS9TYlIzeUtCaWtTYjY4QVpRVkJXR1BYYVh2N1pFeHhqQVdpd0NP?=
 =?utf-8?B?L3BoTVhyZlJ4NXM0WHZXYTc4c2xyOU1ObzdPdXF2TDhOME1pZEt5NFRXajBK?=
 =?utf-8?B?NlFZcE44R3plKzIyaWlOSVllOVpMMHo3WTV2QnowVmJUM1ZNZ0lNL0FKRUMv?=
 =?utf-8?B?OWxnNVJaRmpYZWU3SEZHQzdZMGZQaTJOa3lHUDMrYkNhMU1STTRyTEZTSkJz?=
 =?utf-8?B?UnJqRVkwTVFxVDdjZG5jOXBrYzJyRVl6N3p5aDJDbytqTUNOQnU3c3h6aHNi?=
 =?utf-8?B?N3V0WmFHS2l6eVNTampsNFE3UEtaY29MQ01GZi9SM1ZSdDc1OER2cHBYbGNu?=
 =?utf-8?B?b01YMkt1QUp5bVk4MVk3d1VmT2JpYjZlbVBZdGFVM2VXR1B2N0dVUk5Wd25x?=
 =?utf-8?B?NndSZGFrUG5sQ29tUjFJdGJ1akFqRlVXc1BQK0ozYVh5V0Nib2NWM2xrRjNi?=
 =?utf-8?B?bmNiNTQ5LzVueFB0cDN6QVE5bDR2L0U1OTJ3TTFlWTRvMllKelBkaXR5bEpF?=
 =?utf-8?B?RkJqTWErbTZFM1p3Uk9SMWlBV3dUbE1xRnlpWTZtdndjSmgwei84SE5rMjVa?=
 =?utf-8?B?dFhieDR3b3Zhb0NlM0tzOEhnVHd6dHlUWS83TkNLWW1EVURiUjVRdjc3TWZr?=
 =?utf-8?B?SGdNRjJQMWtQRUpyQnZCK3FFcjN4T20xOW1WVmN3aVVHMW5xeE9CUEpOdVYw?=
 =?utf-8?B?NHQzZTVPNGw5amdldXYrM3duMjY5anc3c2krMUlTWjhtdnU3K3Rodnd0blJO?=
 =?utf-8?B?QmRSWDJHVDZtSXBPeWVpdkhxa0U5M0Fza29pYWZDcys0RTZYR1lEcDZ4am14?=
 =?utf-8?B?M1l4aVZPbUlLVjNEcjZzVUtXQXM5R3JQVXk4NXhPWEZTeU4wcmd4RGR2bDlU?=
 =?utf-8?B?eVcrY0ZyK1BGUmN0WVRFYlh1REp5dzZMckZLWUdZRXNzeHZPZTZURVJoY05i?=
 =?utf-8?B?S2JaREJMNnpYcHFVK2R5b0RrcjJnSU5WcTJVTngydGtzQVJFY0V0MERHQnhT?=
 =?utf-8?B?S1VyQjE3cDJlMlloN0RGa0xYbVF6bTErSlFiOVdLMGQ1U09razc4dTZCWkJp?=
 =?utf-8?B?NTlZZTZNMWczZGd4MFpiRWg5bGpiT3BpMXFHRUZHazNjM1JQZ0hmam8xKyto?=
 =?utf-8?B?eGg4R2lCUjVJb3FHK0pIS2FINWpYZ3F0Q0NucElDdVlHMVZ3K2Qya0tTT3VM?=
 =?utf-8?B?eEpzOU00MUxpN01ZckxYSCsvNDJoV3lpb3BaRnZ3STFzbUFoZ2ZMYnBtS3ha?=
 =?utf-8?B?QTc0Rkd1bUVHQW9NK2Y0WXJ5bTlpaUs5b05TRVRxSTFUelhvVnpCakVZOGhT?=
 =?utf-8?B?TFduS0pCWWV5MUx1VEt5N3FuK0lYUW92dE5HQUxZMFBSeWYrSFZlSjRFSHFz?=
 =?utf-8?Q?8roEqZAtsVfLi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVM3YkhQVTczS1J4dkxLKy9melNac0d0Y3VtRGNXS01KT0RURk9mSWx0djE5?=
 =?utf-8?B?SmdxZWlaUDRZdG56OXIrcWV5aHBWOUVRaC9hY3AwWXdBSEl5dWduNXVRKzdL?=
 =?utf-8?B?WlJoQVFEbHhsb1VLVFNJMXJHeDZJanBMbi9sUGRYYytJNEdFQi80WTVQS1kz?=
 =?utf-8?B?b2xjYXNieTdwQnNCZWRwRVhwenpyWkdQWFBSQ1BxSGUzRjhubXBKZ1NZVjJq?=
 =?utf-8?B?ckZDQmNkSjBuZDBqdGhJVGFGTktuRE9nckFhVWthbko3cENWdGJZVjh3eGo1?=
 =?utf-8?B?a0J1aXZCV0lJL1VHUmtpdEQ0ZVBtenhjc2VQZzdCb2NPSlBIVUFZNUxMQ2xB?=
 =?utf-8?B?L1Y3WDR2UEFFakZIekdYYkxoK3A2MDQ4NEZJOE84SlZMbUQ3cC9hRFJCMHVZ?=
 =?utf-8?B?SmZINXZWSm9McGs1bUpUOGt2U2NHV2JCNExWSGRCNEZrdTNROU5UbFNHNWRy?=
 =?utf-8?B?S1V5UFVDdUZjM2twOExHWGZKTTBQSVhnb1UxZHRZa1JObFFSUjV6MGhZWlM1?=
 =?utf-8?B?dnovbjJtL0Vwa1lqYUo4TFczcGlFazd2UzArRlRqbEhJM3FjczZzS1NxN3B0?=
 =?utf-8?B?dWIwVGhpVnJBWm9ERk1EYnlTWDZSdEFkVE8xTVkrNUdtQll3VStKZ0s2V0RF?=
 =?utf-8?B?ODMzNFpvVTJUZGluQ3ZUQjJvV0FuTDl1WmVaMCtBZzhBQVk3d1dtbFdaTEF6?=
 =?utf-8?B?dThaYjhiSUwzOENmanlIQ042anFMeWVRb01TNWJqUHQ4VjJRWFdNLzcvdGNs?=
 =?utf-8?B?bWV4TnB6Ry9xRGsrTEtXZGIwYXZrVW1PSTR4dFpkdkhIZlRDdk50MkswNjd0?=
 =?utf-8?B?bUc3cjZXRTl2SmgwUXh4aHlEdy9SUWtIYk5SUnpPTHUyZFA2TjFETndtVDBT?=
 =?utf-8?B?aWx3elVvTEg4bE4zZ1dZRk5KZ09nWXdFeEJWRWlUWVhIOUVZNEVZQWlqSW9K?=
 =?utf-8?B?Nnc5elVsK0oyRjFsOXp6QzlWemxzTEJLOWh6enFSWkpseURDek1jTy9EMGl0?=
 =?utf-8?B?cWgrVForSUNVYmdOdEJGNU9UdWx5UHVZNFNSYzVFbnlnejlocXBEbTRDNnln?=
 =?utf-8?B?UWswcnlPVEllMmlYWkxLUXdVUzNreWhhNnczdy9idnp3S2hXa1paMzdQVE0y?=
 =?utf-8?B?cnRqRHhWQ3o0SEVQQ3h4RExabWFseEREYWtIekNuL1JrOWRkRDl1TkVLNlBl?=
 =?utf-8?B?T0dJNGgxWW1uUVJqSGJHT2hBeUVqbXdEOUhXcTVXRW1HTmZLaWpCMUZ3NkQ1?=
 =?utf-8?B?OU5Ic1l4OEhEQy9xeWZYYTFnZVE4aE0veGg4d1gwVURleHFKOEpWMTcxQWtO?=
 =?utf-8?B?bXRhM01WaUlIRisyT0tNeUVWY043cjJ4dVhFTDVSc2V1Y3dkVHhLVU1iMHhs?=
 =?utf-8?B?OWNNRW1SaFZaa0t5OVNaRnNMVldoK2JjV3N3MFV3R3BmSzlkUm45SjhLdkVE?=
 =?utf-8?B?Tm1aY0xaOVViclZLckxqQjdkY0syNG5RSkRiRlNkSVJ6MmQxQTFFWkRnMjl2?=
 =?utf-8?B?em1TTVpXZXdERXFEY0FLczZpNDR1T2FRVWJiWktPUGNPRHpOb3J5S3FER2h1?=
 =?utf-8?B?c1Bsa1pGVVo3N2lBRnR3NVlNUGtEd2pXTWtvN2k0WWpVTWJWbS82S1d5RnhP?=
 =?utf-8?B?U2ljK1N2V0hQdTNWZUJLVXV2VmRwZFhGNjFMcExWZGpMaEx5UXpHYXJ1ckJk?=
 =?utf-8?B?ajhlN0JLdldLd251eStxSFRPWXp2TkxoMGk2S2xOeDlOc1pvNkpMUmFucUJD?=
 =?utf-8?B?ZXFNYTNRMjQ1MnNZK1dLL05HdG5TRkFmS1dha1BkcHcya3hMMUlYR2d6MlVy?=
 =?utf-8?B?T2tsaUY4MXFEWWRnM0N1M05PUW1yRDJsMHdSbUVONE05K0xkd3FsaDE0NkFV?=
 =?utf-8?B?YlZSejJxdDQwTEQ4MXAvNjA0OEV2Yk50QXo4c0orQmtEY2Zhc00rUlJzdjBl?=
 =?utf-8?B?U2x3WG5RKzg0TUU1NlFNQkNidGlrUS83dUk5eFBPT0tjKy8rWklzWERpVTI2?=
 =?utf-8?B?SDVwSG5md216UHZrRnlxMjlIakpYRHA2ZEVVdnlxUGwrSDlXSmNRS2lobjE4?=
 =?utf-8?B?RCt3aTVNMkV0Vk9NT0RBQVhmYzcySlFzZ1poQTg5TDZzdmZrY0xrUnhVRmlR?=
 =?utf-8?B?N09oWDQ0bFN1V0VFNTI0dXhJMW4vRzlYZ1VOREUzbmF5QVkwUEo5c3JCMGNm?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2764a3-8e60-4d18-3dcb-08dd4e96b50e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2025 14:32:15.2732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTcyD4tNm0icNEwyBzmHaYxgab81vACyF236rabU3AOFCGA0Ql0b7Lbxpwazv+XsdV0bhRYRhVxqxr2lld3uePeOYx+mfO3TmiXo40Wq1rI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5127
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

Hi Arun,

On 1/28/2025 9:21 PM, Arun R Murthy wrote:
> Statistics is generated from the image frame that is coming to display
> and an event is sent to user after reading this histogram data.
> 
> v2: forward declaration in header file along with error handling (Jani)
> v3: Replaced i915 with intel_display (Suraj)
> v4: Removed dithering enable/disable (Vandita)
>      New patch for histogram register definitions (Suraj)
> v5: IET LUT pgm follow the seq in spec and removed change to TC at end
>      (Suraj)
> v8: Retained only the Histogram part and move IET LUT to a different
>      patch.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                      |   1 +
>   drivers/gpu/drm/i915/display/intel_display_types.h |   2 +
>   drivers/gpu/drm/i915/display/intel_histogram.c     | 157 +++++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_histogram.h     |  48 +++++++
>   4 files changed, 208 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 4caa8e30bc98387d45212fbc7cea8b38687bd0d5..f993b19174ba79c0bcc34994619937be7d2797ed 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -270,6 +270,7 @@ i915-y += \
>   	display/intel_hdcp.o \
>   	display/intel_hdcp_gsc.o \
>   	display/intel_hdcp_gsc_message.o \
> +	display/intel_histogram.o \
>   	display/intel_hotplug.o \
>   	display/intel_hotplug_irq.o \
>   	display/intel_hti.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index cb51b7936f9338caaf14b1c6f7bbcc4327da4ef1..761fefed9376439c0ee5d346e8110a219ad0a586 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1434,6 +1434,8 @@ struct intel_crtc {
>   	/* for loading single buffered registers during vblank */
>   	struct pm_qos_request vblank_pm_qos;
>   
> +	struct intel_histogram *histogram;
> +
>   #ifdef CONFIG_DEBUG_FS
>   	struct intel_pipe_crc pipe_crc;
>   #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..26eae8f40d0bf642546d583546782e22d5cefa9c
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "i915_reg.h"
> +#include "i915_drv.h"
> +#include "intel_de.h"
> +#include "intel_display.h"
> +#include "intel_display_types.h"
> +#include "intel_histogram.h"
> +#include "intel_histogram_regs.h"
> +
> +/* 3.0% of the pipe's current pixel count, hw does x4 */
> +#define HISTOGRAM_GUARDBAND_THRESHOLD_DEFAULT 300
> +/* Precision factor for threshold guardband */
> +#define HISTOGRAM_GUARDBAND_PRECISION_FACTOR 10000
> +#define HISTOGRAM_DEFAULT_GUARDBAND_DELAY 0x04
> +
> +int intel_histogram_atomic_check(struct intel_crtc *intel_crtc)
> +{
> +	struct intel_histogram *histogram = intel_crtc->histogram;
> +
> +	/* TODO: Restrictions for enabling histogram */
> +	histogram->can_enable = true;
> +
> +	return 0;
> +}
> +
> +static int intel_histogram_enable(struct intel_crtc *intel_crtc, u8 mode)
> +{
> +	struct intel_display *display = to_intel_display(intel_crtc);
> +	struct intel_histogram *histogram = intel_crtc->histogram;
> +	int pipe = intel_crtc->pipe;
> +	u64 res;
> +	u32 gbandthreshold;
> +
> +	if (!histogram || !histogram->can_enable)
> +		return -EINVAL;
> +
> +	if (histogram->enable)
> +		return 0;
> +
> +	 /* enable histogram, clear DPST_CTL bin reg func select to TC */
> +	intel_de_rmw(display, DPST_CTL(pipe),
> +		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_IE_HIST_EN |
> +		     DPST_CTL_HIST_MODE | DPST_CTL_IE_TABLE_VALUE_FORMAT |
> +		     DPST_CTL_ENHANCEMENT_MODE_MASK | DPST_CTL_IE_MODI_TABLE_EN,
> +		     ((mode == DRM_MODE_HISTOGRAM_HSV_MAX_RGB) ?
> +		      DPST_CTL_BIN_REG_FUNC_TC : 0) | DPST_CTL_IE_HIST_EN |
> +		     DPST_CTL_HIST_MODE_HSV |
> +		     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC |
> +		     DPST_CTL_EN_MULTIPLICATIVE | DPST_CTL_IE_MODI_TABLE_EN);
> +
> +	/* Re-Visit: check if wait for one vblank is required */
> +	drm_crtc_wait_one_vblank(&intel_crtc->base);
> +
> +	/* TODO: Program GuardBand Threshold needs to be moved to modeset path */
> +	res = (intel_crtc->config->hw.adjusted_mode.vtotal *
> +	       intel_crtc->config->hw.adjusted_mode.htotal);
> +
> +	gbandthreshold = (res *	HISTOGRAM_GUARDBAND_THRESHOLD_DEFAULT) /
> +			  HISTOGRAM_GUARDBAND_PRECISION_FACTOR;
> +
> +	/* Enable histogram interrupt mode */
> +	intel_de_rmw(display, DPST_GUARD(pipe),
> +		     DPST_GUARD_THRESHOLD_GB_MASK |
> +		     DPST_GUARD_INTERRUPT_DELAY_MASK | DPST_GUARD_HIST_INT_EN,
> +		     DPST_GUARD_THRESHOLD_GB(gbandthreshold) |
> +		     DPST_GUARD_INTERRUPT_DELAY(HISTOGRAM_DEFAULT_GUARDBAND_DELAY) |
> +		     DPST_GUARD_HIST_INT_EN);
> +
> +	/* Clear pending interrupts has to be done on separate write */
> +	intel_de_rmw(display, DPST_GUARD(pipe),
> +		     DPST_GUARD_HIST_EVENT_STATUS, 1);
> +
> +	histogram->enable = true;
> +
> +	return 0;
> +}
> +
> +static void intel_histogram_disable(struct intel_crtc *intel_crtc)
> +{
> +	struct intel_display *display = to_intel_display(intel_crtc);
> +	struct intel_histogram *histogram = intel_crtc->histogram;
> +	int pipe = intel_crtc->pipe;
> +
> +	if (!histogram)
> +		return;
> +
> +	/* If already disabled return */
> +	if (histogram->enable)

It should be !histogram->enable right?

Thanks,
Thasleem

> +		return;
> +
> +	/* Clear pending interrupts and disable interrupts */
> +	intel_de_rmw(display, DPST_GUARD(pipe),
> +		     DPST_GUARD_HIST_INT_EN | DPST_GUARD_HIST_EVENT_STATUS, 0);
> +
> +	/* disable DPST_CTL Histogram mode */
> +	intel_de_rmw(display, DPST_CTL(pipe),
> +		     DPST_CTL_IE_HIST_EN, 0);
> +
> +	histogram->enable = false;
> +}
> +
> +int intel_histogram_update(struct intel_crtc *intel_crtc,
> +			   struct drm_histogram_config *config)
> +{
> +	struct intel_display *display = to_intel_display(intel_crtc);
> +
> +	if (config->enable) {
> +		if (config->hist_mode != DRM_MODE_HISTOGRAM_HSV_MAX_RGB) {
> +			drm_err(display->drm,
> +				"Only max(RGB) mode is supported for histogram\n");
> +			return -EINVAL;
> +		}
> +		return intel_histogram_enable(intel_crtc, config->hist_mode);
> +	}
> +
> +	intel_histogram_disable(intel_crtc);
> +	return 0;
> +}
> +
> +void intel_histogram_finish(struct intel_crtc *intel_crtc)
> +{
> +	struct intel_histogram *histogram = intel_crtc->histogram;
> +
> +	kfree(histogram);
> +}
> +
> +int intel_histogram_init(struct intel_crtc *crtc)
> +{
> +	struct intel_histogram *histogram;
> +	struct drm_histogram_caps *histogram_caps;
> +
> +	/* Allocate histogram internal struct */
> +	histogram = kzalloc(sizeof(*histogram), GFP_KERNEL);
> +	if (!histogram)
> +		return -ENOMEM;
> +	histogram_caps = kzalloc(sizeof(*histogram_caps), GFP_KERNEL);
> +	if (!histogram_caps)
> +		return -ENOMEM;
> +
> +	histogram_caps->histogram_mode = DRM_MODE_HISTOGRAM_HSV_MAX_RGB;
> +	histogram_caps->bins_count = HISTOGRAM_BIN_COUNT;
> +
> +	crtc->histogram = histogram;
> +	histogram->crtc = crtc;
> +	histogram->can_enable = false;
> +	histogram->caps = histogram_caps;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.h b/drivers/gpu/drm/i915/display/intel_histogram.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..5ea19ef2d3ecadf1ac159a784f51278fdde593de
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.h
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_HISTOGRAM_H__
> +#define __INTEL_HISTOGRAM_H__
> +
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +struct delayed_work;
> +struct drm_property_blob;
> +struct drm_histogram_config;
> +struct drm_histogram_caps;
> +struct intel_crtc;
> +
> +#define HISTOGRAM_BIN_COUNT                    32
> +
> +struct intel_histogram {
> +	struct drm_histogram_caps *caps;
> +	struct intel_crtc *crtc;
> +	struct delayed_work work;
> +	bool enable;
> +	bool can_enable;
> +	u32 bin_data[HISTOGRAM_BIN_COUNT];
> +};
> +
> +enum intel_global_hist_status {
> +	INTEL_HISTOGRAM_ENABLE,
> +	INTEL_HISTOGRAM_DISABLE,
> +};
> +
> +enum intel_global_histogram {
> +	INTEL_HISTOGRAM,
> +};
> +
> +enum intel_global_hist_lut {
> +	INTEL_HISTOGRAM_PIXEL_FACTOR,
> +};
> +
> +int intel_histogram_atomic_check(struct intel_crtc *intel_crtc);
> +int intel_histogram_update(struct intel_crtc *intel_crtc,
> +			   struct drm_histogram_config *config);
> +int intel_histogram_init(struct intel_crtc *intel_crtc);
> +void intel_histogram_finish(struct intel_crtc *intel_crtc);
> +
> +#endif /* __INTEL_HISTOGRAM_H__ */

