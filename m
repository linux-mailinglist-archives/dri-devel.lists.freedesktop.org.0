Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F48AEA9C0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 00:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A178310E920;
	Thu, 26 Jun 2025 22:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEzC7kFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1D310E913;
 Thu, 26 Jun 2025 22:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750977559; x=1782513559;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sUtl6ViKC722j7+PCO+uNtwLTRQr2XrJIKD3fgHtpjo=;
 b=DEzC7kFUv2BeipnrDzKxRQRldN+ayXQxmoo6Q2X96fyF+Grfgtjj7RjT
 sPEBSjq9sGItTzPAzcmdvOVuhCNu2ASTkXMZo3wN6iE2Px9NmLY2t/7UF
 YWORPz5dogtsxXGOcwk3wDAOaBgqvTNHayOz8nuiKxi3Qc0RfvMwaWlkk
 NFi+E7u+1rVAlegj66T+w+xF+fIqT5/1nYacrUej08XPtR7X2nBr7ml89
 5VRtQ0Qpwnpfd9xWTmIDgyFegAQINfCYYT69AkWq0ZkjKKBr9Rt0SGcRW
 4Q+mDbXFRlE7sJ36ASMKaNaKGXlaNMuAG3tB4gpwzHF5QxtOANG3uu6+l g==;
X-CSE-ConnectionGUID: Y5KynbZyTYuZhokUWZQ3cg==
X-CSE-MsgGUID: AbL5TdQYTB6PrPWYRYQLZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57072426"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="57072426"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 15:39:19 -0700
X-CSE-ConnectionGUID: BU/yp1bcRQeWvBirUPXZcg==
X-CSE-MsgGUID: 6eLHdEUKSOG5Of8+B0NDbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="153144704"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 15:39:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 15:39:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 15:39:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 15:38:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1e/QcoAT4YErnF0afJMSNjburieMkq9EUo1GRwnY6KyjUWLCkudiOYHeJSg+58cRMmFjb/3YGuUGQEBVJTVUfZBmR0nmrsVWyY0TlxcJRLWIRU//Da4KaqIoAYxaR6JaFjkTdo/Kszxb52oO9xxPS+mHzh1aiXEuLYQCw0ZpOvmfsHXpyjdinR0FMjcU2PPb8ivnAtv0dKe8Fwg6TbiJFGuSWp+RPe5zALd3ZjRhRsmsQudua9ZgrQtU1yGnh0eWmhFIjA70hk7uOa3SrIEaYkQbqzeaQl+pvbyRui3s6C6/aOlY+jiPQoaoVjvf163BL39SAQerrB7evfTEz6fqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qwf2JlZix92bpmLhm7PZvKHbExYLh6BvgyLyjILhfd4=;
 b=de7+hwDmMOunMxTzQgkVCmXZ9CmtIMAamsT1iHsEKa30posijmxVyqpuUQKW/nxwPIXH2bXGbTiqcpz4QoAq64Ptdu4jNCYeBARhzz3zGowl6jSY+OsamKbCsXO8Ev+pG5KHRNPQTs1QXr8487Qw29VA2ksuTEkiLywoMMzZsDzhunhXYo5fJzY6vLJTWx6AD+pvQ/Vz5JwjZtVqQd/ySlEk/u+HCORtRilFEHnl071LEIxNylPdn3ZUFkTWvx1uyepeKWMbsdmQwVGTh3W89rhujwwPYBtROnC9Vbl9ZvFdwWwRmUvd5eS/Ku5qzDTS/uFTCN1ylDVDMhlqkX/nYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB5996.namprd11.prod.outlook.com (2603:10b6:8:5f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 22:38:23 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Thu, 26 Jun 2025
 22:38:23 +0000
Message-ID: <c159aa47-1e7c-4cb9-b544-89955100bfb8@intel.com>
Date: Thu, 26 Jun 2025 15:38:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>,
 <gregkh@linuxfoundation.org>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-6-badal.nilawar@intel.com> <aF2CQ_VAT6PSh9Lk@intel.com>
 <e392779f-a205-4085-8663-4cfbbab4bd82@intel.com> <aF3Accq8A4zm9Dii@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aF3Accq8A4zm9Dii@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL6PEPF0001641B.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 510381d2-448b-4ca9-b912-08ddb5022864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2tJYjJiYkxTZVNMQ3VUT2k5Vk8xdzVQc1AwdXluN2dscXZlRHNscVdsdzNj?=
 =?utf-8?B?d0tQRXd6d01YQXg1QWVmWXozNXorNDRaOHFYMjdYeG82Rm9lcE81NEF1aExZ?=
 =?utf-8?B?U0JRWWRJaU1KaFdSZitxYmRXdXhZaktEWmZVSzV2VlEvTWRXc1FvVHgwdGNS?=
 =?utf-8?B?OU5yQTduU2MrY095cXhWMUhRSURPVlhrcEZFejVUSDFGQ2dYbUQzR0dKLzIx?=
 =?utf-8?B?akNVcUsrRXlKR1BiZ3NDTnpFcy9aUStlNTBmREhFdFh1WXJ0UnlWL0k5Uisw?=
 =?utf-8?B?cXhobUVIVk5FbDBxWDJLM0VSNUZWNllaclZJKzE3S1laNStleVVNUTYrYTEw?=
 =?utf-8?B?bTBJcGhFdVIwSUt2OU0xSkRsc3NJQ1hFWlh6UUphVC94b0JBTk1jTDRtRTFh?=
 =?utf-8?B?aEo4VXYrTE1hM2VlU044dnh4bklvNmNvM0ZlK1ZlNUxUWUxFc24vTWxyZGFk?=
 =?utf-8?B?aVdGZHZVRStwZFlIKy82Q3hyVzNCanRBSHNCbkVlRSszZWRIaXlTd1h5VGJs?=
 =?utf-8?B?ZW1aNVZqNTRIVGJlNFg0ZXBkeUlPZ0NwZENmV0JZckduSzQ3L2NKbmgxcjRw?=
 =?utf-8?B?VkRvcmx2bkptejQ3MjlaVXVZK3hxWXVWU0ZBVXpoSzkzcEtPdXVWaDBHWVly?=
 =?utf-8?B?SDhEU0hQa2N1ekJ4YzBxeGFySWdLOWpiWXJVd0FRbGxqN243KzdCN2h1UzQ1?=
 =?utf-8?B?VnI3ZmlIQjI5emlMd2hldnRyek4rY2R4L2gwU1JaR2hRaEc0dVJDZ1crWVhF?=
 =?utf-8?B?Zk5WUmdHSzFPZHZQMUR5ZzJqSmJjZFNtc3puTHVBTmxRdnkvMVhlODh3Mjk1?=
 =?utf-8?B?WDh4emNkVjlyOXlONVMxdVluTHoyUjk4aS9uN2tQR1dLL3JIT3hBNWs2UUZ4?=
 =?utf-8?B?bFJtSVgrMTU1SHZ5Vk81Z29DeXAzZ2dRdjlTN0xRaUIzakxYaFZqOW5haVRY?=
 =?utf-8?B?cGRlRkNucHNlbThsSGZFVFpKRmhlczRKUjhwdlhscjdCTysvdkZDcWVnTmNi?=
 =?utf-8?B?N0VYdTRvYktDczJDVWJqWmtDT3g0WklEWWxWRlVxT3Zxa2lUR2N2N01jTlRr?=
 =?utf-8?B?M0tYdWtUUFFnb09pTS9OeTRaZlZYK0VjTTFTSlhhRWFyZVE0MDdVUUQyQXlo?=
 =?utf-8?B?dW9sQ1dySEo5eUFFZTMwL2RZSExxRXEyQUxTZlJNdDJSZWROWjlBM1pmR2pn?=
 =?utf-8?B?K0JpUmcyTVI0RnZCVVJublAvQU9RNnYwc3ZLVFhIaURlUXpOb1hvamZYRmFu?=
 =?utf-8?B?NHNkQU9kOWVEb1hZT3EzaWZBd3cycFI2Q0ViRWdLYkhTcE1mbzg5S1ZpY2sw?=
 =?utf-8?B?M1h3Zmg2MkNmZ1hjSlZoY2ROaTErRjRZeTdPVFVxajFiVmJoMWJQYzUxWjBU?=
 =?utf-8?B?dWQ2ellwYjdJUUl6SU1Ub0o0bFZVUmNjOWpwdTl1UnFzWitiRjQ1UlJVUnJG?=
 =?utf-8?B?eWVlNjFyU002Y2hEb2FmTkRyQVNVaFJ1Sjk3MjYyN2FNb0dNa2V2NVAyYzh0?=
 =?utf-8?B?TTlhbkJsRUhlbGFIMDJtZmFieGRxbjhuN2FCMUpGSVcra3BhN05VR0M2YXo5?=
 =?utf-8?B?WXhLYkdEeU92U052UWtBckUzNjY3aTVkKy9NeCtpK0cvU2ZjZDkxVDZqRTA5?=
 =?utf-8?B?d2JhREFWODNtS0kzWDVTK2czVERzUGVqdVF0MTdHSDZGRGdYY2Nlbmx4RGFQ?=
 =?utf-8?B?OHIyTk5FT2piQUNubWx1MkdDZHQrcnIxbVcrYlYrUVgvcEcxUmlpVHVtb2F1?=
 =?utf-8?B?bWpDYno1dmhnNDBPZFdlOThKRXdHcVp4MkhzZTBXN1gvMzZOb1QyajIxck15?=
 =?utf-8?B?Z3k0ZXFlN0l4SnI0eDlGL29MdkRDREJMekxmZG1pNDVGaTlzNjVFbXBTdDl0?=
 =?utf-8?B?dFNBNDAweThzOWdXL0xudmZUUmFjYzJkdXVLeXBoempvb2VRRXNrc3EzTWh5?=
 =?utf-8?Q?Ndr3dM/J6h4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlViTG12RFFKdE14aCtBMnFoWGFydFZzSktKQ09la2I4UGJkM1dsbnN3bEdw?=
 =?utf-8?B?QTNtbnBaNTNKMWhwdmFmK0NxSlZrUEo0S1IrOTB0OStjK2RVVGpTS2VSZXhT?=
 =?utf-8?B?UWxwY2FudlpPV29sZjU1SWR3eFI1cyt1MkZPQytjbjIwcDF0eE9rSHl4dmFz?=
 =?utf-8?B?TkJnK3YzVFBhUG9iVWNpalhVdFJIVUJmZ3pWOFBsdmRYeUw5QW1EUzZyMGx6?=
 =?utf-8?B?WS9iQ1RobUQzQjkrUGxCY1JTY0lwdWE1ZjRocXNINktUempnMWNLYTNkM3hL?=
 =?utf-8?B?R3hVWTV5MEMyWm5MZU4xTDVPVlhZUlVQbkxTM0Q2dlZyNTNpVmVGeEVrV2Zr?=
 =?utf-8?B?cGNka1hCRjhYQ053Njc5WUZZTkpVR25xU0N3WGJueDRqVFhIVDNzdnp5WHox?=
 =?utf-8?B?dkttMzhUK1BBcTNpa1Bla1d3L1lNNHlacm91a2wxWWU2Z1grbDdZSlNRZVFm?=
 =?utf-8?B?V000RVRtZ1VIZjNmalg0YjV6bmlSQjJxLzZEZXVvQWRlUDJQRzBhcE9uOGVu?=
 =?utf-8?B?ZGVGMmg1WlpZVUxvTTAvYWNBbXpSZ3pLMUhwYnFIZEV0U2pvN3l1T1R6Z3lM?=
 =?utf-8?B?aEcycVJDVkM2SHJFTkMyQkdEaHNVNmRGM3ZmcmpFQTZsV3VwYnFBN0pVNCt5?=
 =?utf-8?B?WHhvT010U3ptMW5aQWJvNUw1Y3djd3NBUGhiMTNTNTlOcldqRC9zTnRrcFBx?=
 =?utf-8?B?WW94cjhlbHRlbm1PYVFsZ2dvWnBaRmkxTXRqS000WGZCNDNCeHA4SXo0ci96?=
 =?utf-8?B?QzByb1BKOThFVkFDSjRCNVJKbjdnaVZpUFV1N1VaRW9hVTExanM5RnpHQ2tw?=
 =?utf-8?B?TVE1b0FUVVdOSVVibHQvRHUrOGovdENrY3ZOQ1pHUHlWSXFFWEVTVEVMd1VJ?=
 =?utf-8?B?MWE1a3BMQTcxdFViNFAzMGVVSzYvYklIeEY1UGxBVU42SzN2emtlZTlOOEts?=
 =?utf-8?B?aHlVS0NlYTlONzlZUFJjMm5UeWpKZFQ1Tk96S0RRemlsc3RmTVNkRVRJMytH?=
 =?utf-8?B?Sm1pL2ZZTlhMV3RqWmV4TC90T0YvaEkxbU9GZjZST0p2ci90bTZnaXl6dExW?=
 =?utf-8?B?TnkxZDZ2ZmI5dlgxY1Zta2ZSeDMxL3V3OXdBNm4zZTc0QjQ0S3Nnakd3ZjRO?=
 =?utf-8?B?eStoUEhxUmFPaGNGMXVWM0Z4aUtMU0owWHdtM0VEYlRveWtMNzB4MXlzK0JX?=
 =?utf-8?B?TS9FRXRnYS9wRWl5N3FSL1FMNWFqSHJZUTI0QmFkcjhaUGpBUDVOSDBJMzZD?=
 =?utf-8?B?ZnJ1eWpRYnlieVdCY1UxZUVkbGRrK20zb3NsM1I1TG52cTlwSWd0c01Zb2lS?=
 =?utf-8?B?Y09mdTJCYjZianVGbFNDMHFOYlA4Qkp0Y05FdHJkcC96UUpwQmFjMWlreXZW?=
 =?utf-8?B?M0JMZWYveFdmWXVIcElBd2xDT2x5K1AzeHNpTWxsR1ZHcXhNQmt3WCsrbmNK?=
 =?utf-8?B?WVk2NnZxaWtnOWd0a2g5ejJpdURrOEU0Nm53Y1BYNmdxaHBsTXkyWDZGUmdo?=
 =?utf-8?B?T1BhWVNpREpUQ3FUM0ZXclhKSE9LZnBLSTYwclBoZFQzNmlhaTc0cWh3ejg5?=
 =?utf-8?B?QzlCbXhXRndIZDdJYzhoS0ZRN0M0TEFCZVhrYytobUluN0V4UUlMK24vNTEy?=
 =?utf-8?B?eHpZdXRxOWIwRlpuY2xJSXgraEtEZGhpOHZaU0E0WUlEODFtZnBjaFZzb3dF?=
 =?utf-8?B?cXJncE81aUdWNnRlNUl1NllaQ1plVFFPOStERUJrejlHc2JXTGtUZ285cVNx?=
 =?utf-8?B?MnpWc1AvZThxeDhNYTVyWFBQTk5aczdHWjVDUTc5RDZPTXZVUGx4WitJWEVE?=
 =?utf-8?B?UFAzQ05YTmkzY0NocTZIdnVnR2NNbllzN3ZXclovMnJHWWkybkFpYUlJdmhL?=
 =?utf-8?B?U1NtMXNvWmJtdVFlcGRDRkhuSUNTSk1Tb1VRNjdEaG52UUZLV2FzQWZYa2dP?=
 =?utf-8?B?U0Z0WFFZSWxPZEZieGRxdHMyMC9VeVRYbGhvdExWeTFBUDFpVE43QWpMakJR?=
 =?utf-8?B?TUh0T212eXM5aklpR2Y0TGpYUGxKNmRSQTZuVVU2bE4wZFlodlFOOElkKyt6?=
 =?utf-8?B?elFhQ0RvaUYzZHlOdGpTM0gwZ1FQMXFvUW9mWXZMb3VhckNmYk9YV29sN0pH?=
 =?utf-8?B?QlM5dDBZb2JneGJVbERmYTBHMjZiZC9TeU0rNVVINHkxWjFjcTNiUDRwUk5E?=
 =?utf-8?Q?x8J2fMKbPRFX1VxPsd0MVW4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 510381d2-448b-4ca9-b912-08ddb5022864
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 22:38:23.0868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwBxi6kTm6YNJnUKL7RME2R0x+sfXlxrI3DVBEYzLK/CPfOmiNqvPO1nNCDrZisoXSsr0eIXvF6lFqGXjeqYhpWF6kg1QHocu9B/z4/F8Io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5996
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



On 6/26/2025 2:49 PM, Rodrigo Vivi wrote:
> On Thu, Jun 26, 2025 at 02:27:50PM -0700, Daniele Ceraolo Spurio wrote:
>>
>> On 6/26/2025 10:24 AM, Rodrigo Vivi wrote:
>>> On Wed, Jun 25, 2025 at 10:30:10PM +0530, Badal Nilawar wrote:
>>>> Load late binding firmware
>>>>
>>>> v2:
>>>>    - s/EAGAIN/EBUSY/
>>>>    - Flush worker in suspend and driver unload (Daniele)
>>>> v3:
>>>>    - Use retry interval of 6s, in steps of 200ms, to allow
>>>>      other OS components release MEI CL handle (Sasha)
>>>> v4:
>>>>    - return -ENODEV if component not added (Daniele)
>>>>    - parse and print status returned by csc
>>>>    - Use xe_pm_get_if_in_active (Daniele)
>>> The worker is considered outer bound and it is safe
>>> to use xe_pm_runtime_get which takes the reference
>>> and resume synchronously.
>>>
>>> Otherwise, if using get_if_active you need to reschedule
>>> the work or you lose your job.
>> The issue is that the next patch adds code to re-queue the work from the rpm
>> resume path, so if we do a sync resume here the worker will re-queue itself
>> immediately when not needed.
> ops, I had forgotten about that case, I'm sorry.
>
>> Also, when the re-queued work runs it might end
>> up doing another sync resume and re-queuing itself once more.
> I believe it might be worse than that and even hang. This is the right
> case for the if_active indeed. But we need to ensure that we will
> always have an outer bound for that.
>
>> However, in
>> the next patch we do also have a flush of the work in the rpm_suspend path,
>> so maybe the worker running when we are rpm suspended is not actually a
>> possible case?
> that's the kaboom case!
>
>> Also, thinking about this more, that re-queuing on rpm resume only happens
>> if d3cold is allowed, so when d3cold is not allowed we do want to proceed
>> here we can actually reach here when rpm suspended.
> no, when d3cold is not allowed we don't want to re-flash the fw.
> We just skip and move forward.

My concern was about the first time we attempt the load in the d3cold 
disabled scenario. If we've somehow managed to rpm suspend between 
queuing the work for the first time and the work actually running, 
skipping the flashing would mean the binary is not actually ever loaded. 
Not sure if that's a case we can hit though.

Daniele

>
> My bad, sorry for the noise and please keep the if_active variant in here.
>
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_late_bind_fw.c       | 149 ++++++++++++++++++++-
>>>>    drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
>>>>    drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   7 +
>>>>    3 files changed, 156 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>>> index 32d1436e7191..52243063d98a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>>> @@ -16,6 +16,20 @@
>>>>    #include "xe_late_bind_fw.h"
>>>>    #include "xe_pcode.h"
>>>>    #include "xe_pcode_api.h"
>>>> +#include "xe_pm.h"
>>>> +
>>>> +/*
>>>> + * The component should load quite quickly in most cases, but it could take
>>>> + * a bit. Using a very big timeout just to cover the worst case scenario
>>>> + */
>>>> +#define LB_INIT_TIMEOUT_MS 20000
>>>> +
>>>> +/*
>>>> + * Retry interval set to 6 seconds, in steps of 200 ms, to allow time for
>>>> + * other OS components to release the MEI CL handle
>>>> + */
>>>> +#define LB_FW_LOAD_RETRY_MAXCOUNT 30
>>>> +#define LB_FW_LOAD_RETRY_PAUSE_MS 200
>>>>    static const u32 fw_id_to_type[] = {
>>>>    		[XE_LB_FW_FAN_CONTROL] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
>>>> @@ -31,6 +45,30 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>>>>    	return container_of(late_bind, struct xe_device, late_bind);
>>>>    }
>>>> +static const char *xe_late_bind_parse_status(uint32_t status)
>>>> +{
>>>> +	switch (status) {
>>>> +	case CSC_LATE_BINDING_STATUS_SUCCESS:
>>>> +		return "success";
>>>> +	case CSC_LATE_BINDING_STATUS_4ID_MISMATCH:
>>>> +		return "4Id Mismatch";
>>>> +	case CSC_LATE_BINDING_STATUS_ARB_FAILURE:
>>>> +		return "ARB Failure";
>>>> +	case CSC_LATE_BINDING_STATUS_GENERAL_ERROR:
>>>> +		return "General Error";
>>>> +	case CSC_LATE_BINDING_STATUS_INVALID_PARAMS:
>>>> +		return "Invalid Params";
>>>> +	case CSC_LATE_BINDING_STATUS_INVALID_SIGNATURE:
>>>> +		return "Invalid Signature";
>>>> +	case CSC_LATE_BINDING_STATUS_INVALID_PAYLOAD:
>>>> +		return "Invalid Payload";
>>>> +	case CSC_LATE_BINDING_STATUS_TIMEOUT:
>>>> +		return "Timeout";
>>>> +	default:
>>>> +		return "Unknown error";
>>>> +	}
>>>> +}
>>>> +
>>>>    static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>>>>    {
>>>>    	struct xe_device *xe = late_bind_to_xe(late_bind);
>>>> @@ -44,6 +82,93 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>>>>    		return 0;
>>>>    }
>>>> +static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
>>>> +{
>>>> +	struct xe_device *xe = late_bind_to_xe(late_bind);
>>>> +	struct xe_late_bind_fw *lbfw;
>>>> +	int fw_id;
>>>> +
>>>> +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>>>> +		lbfw = &late_bind->late_bind_fw[fw_id];
>>>> +		if (lbfw->valid && late_bind->wq) {
>>>> +			drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
>>>> +				fw_id_to_name[lbfw->id]);
>>>> +			flush_work(&lbfw->work);
>>>> +		}
>>>> +	}
>>>> +}
>>>> +
>>>> +static void xe_late_bind_work(struct work_struct *work)
>>>> +{
>>>> +	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
>>>> +	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
>>>> +						      late_bind_fw[lbfw->id]);
>>>> +	struct xe_device *xe = late_bind_to_xe(late_bind);
>>>> +	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
>>>> +	int ret;
>>>> +	int slept;
>>>> +
>>>> +	/* we can queue this before the component is bound */
>>>> +	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
>>>> +		if (late_bind->component.ops)
>>>> +			break;
>>>> +		msleep(100);
>>>> +	}
>>>> +
>>>> +	if (!xe_pm_runtime_get_if_active(xe))
>>>> +		return;
>>>> +
>>>> +	mutex_lock(&late_bind->mutex);
>>>> +
>>>> +	if (!late_bind->component.ops) {
>>>> +		drm_err(&xe->drm, "Late bind component not bound\n");
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
>>>> +
>>>> +	do {
>>>> +		ret = late_bind->component.ops->push_config(late_bind->component.mei_dev,
>>>> +							    lbfw->type, lbfw->flags,
>>>> +							    lbfw->payload, lbfw->payload_size);
>>>> +		if (!ret)
>>>> +			break;
>>>> +		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
>>>> +	} while (--retry && ret == -EBUSY);
>>>> +
>>>> +	if (!ret) {
>>>> +		drm_dbg(&xe->drm, "Load %s firmware successful\n",
>>>> +			fw_id_to_name[lbfw->id]);
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	if (ret > 0)
>> nit: here you can just do "else if" and drop the goto.
>>
>> Daniele
>>
>>>> +		drm_err(&xe->drm, "Load %s firmware failed with err %d, %s\n",
>>>> +			fw_id_to_name[lbfw->id], ret, xe_late_bind_parse_status(ret));
>>>> +	else
>>>> +		drm_err(&xe->drm, "Load %s firmware failed with err %d",
>>>> +			fw_id_to_name[lbfw->id], ret);
>>>> +out:
>>>> +	mutex_unlock(&late_bind->mutex);
>>>> +	xe_pm_runtime_put(xe);
>>>> +}
>>>> +
>>>> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>>>> +{
>>>> +	struct xe_late_bind_fw *lbfw;
>>>> +	int fw_id;
>>>> +
>>>> +	if (!late_bind->component_added)
>>>> +		return -ENODEV;
>>>> +
>>>> +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>>>> +		lbfw = &late_bind->late_bind_fw[fw_id];
>>>> +		if (lbfw->valid)
>>>> +			queue_work(late_bind->wq, &lbfw->work);
>>>> +	}
>>>> +	return 0;
>>>> +}
>>>> +
>>>>    static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>>>>    {
>>>>    	struct xe_device *xe = late_bind_to_xe(late_bind);
>>>> @@ -99,6 +224,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>>>>    	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>>>>    	release_firmware(fw);
>>>> +	INIT_WORK(&lb_fw->work, xe_late_bind_work);
>>>>    	lb_fw->valid = true;
>>>>    	return 0;
>>>> @@ -109,11 +235,16 @@ static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>>>>    	int ret;
>>>>    	int fw_id;
>>>> +	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
>>>> +	if (!late_bind->wq)
>>>> +		return -ENOMEM;
>>>> +
>>>>    	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>>>>    		ret = __xe_late_bind_fw_init(late_bind, fw_id);
>>>>    		if (ret)
>>>>    			return ret;
>>>>    	}
>>>> +
>>>>    	return 0;
>>>>    }
>>>> @@ -137,6 +268,8 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
>>>>    	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>>>>    	struct xe_late_bind *late_bind = &xe->late_bind;
>>>> +	xe_late_bind_wait_for_worker_completion(late_bind);
>>>> +
>>>>    	mutex_lock(&late_bind->mutex);
>>>>    	late_bind->component.ops = NULL;
>>>>    	mutex_unlock(&late_bind->mutex);
>>>> @@ -152,7 +285,15 @@ static void xe_late_bind_remove(void *arg)
>>>>    	struct xe_late_bind *late_bind = arg;
>>>>    	struct xe_device *xe = late_bind_to_xe(late_bind);
>>>> +	xe_late_bind_wait_for_worker_completion(late_bind);
>>>> +
>>>> +	late_bind->component_added = false;
>>>> +
>>>>    	component_del(xe->drm.dev, &xe_late_bind_component_ops);
>>>> +	if (late_bind->wq) {
>>>> +		destroy_workqueue(late_bind->wq);
>>>> +		late_bind->wq = NULL;
>>>> +	}
>>>>    	mutex_destroy(&late_bind->mutex);
>>>>    }
>>>> @@ -183,9 +324,15 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>>>>    		return err;
>>>>    	}
>>>> +	late_bind->component_added = true;
>>>> +
>>>>    	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
>>>>    	if (err)
>>>>    		return err;
>>>> -	return xe_late_bind_fw_init(late_bind);
>>>> +	err = xe_late_bind_fw_init(late_bind);
>>>> +	if (err)
>>>> +		return err;
>>>> +
>>>> +	return xe_late_bind_fw_load(late_bind);
>>>>    }
>>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>>>> index 4c73571c3e62..28d56ed2bfdc 100644
>>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>>>> @@ -11,5 +11,6 @@
>>>>    struct xe_late_bind;
>>>>    int xe_late_bind_init(struct xe_late_bind *late_bind);
>>>> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>>> index 93abf4c51789..f119a75f4c9c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>>> @@ -9,6 +9,7 @@
>>>>    #include <linux/iosys-map.h>
>>>>    #include <linux/mutex.h>
>>>>    #include <linux/types.h>
>>>> +#include <linux/workqueue.h>
>>>>    #define MAX_PAYLOAD_SIZE SZ_4K
>>>> @@ -38,6 +39,8 @@ struct xe_late_bind_fw {
>>>>    	u8  *payload;
>>>>    	/** @late_bind_fw.payload_size: late binding blob payload_size */
>>>>    	size_t payload_size;
>>>> +	/** @late_bind_fw.work: worker to upload latebind blob */
>>>> +	struct work_struct work;
>>>>    };
>>>>    /**
>>>> @@ -64,6 +67,10 @@ struct xe_late_bind {
>>>>    	struct mutex mutex;
>>>>    	/** @late_bind.late_bind_fw: late binding firmware array */
>>>>    	struct xe_late_bind_fw late_bind_fw[XE_LB_FW_MAX_ID];
>>>> +	/** @late_bind.wq: workqueue to submit request to download late bind blob */
>>>> +	struct workqueue_struct *wq;
>>>> +	/** @late_bind.component_added: whether the component has been added */
>>>> +	bool component_added;
>>>>    };
>>>>    #endif
>>>> -- 
>>>> 2.34.1
>>>>

