Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD63A105FC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 12:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A27E10E1E1;
	Tue, 14 Jan 2025 11:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAyl4ZgS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DB210E1E1;
 Tue, 14 Jan 2025 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736855704; x=1768391704;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QYU5e+Z99etEwbXB1ZY3YkagKwf2PCYeOvNRML0rPR0=;
 b=RAyl4ZgSPYUIWFaPjlRrc12fSlhsBSMbYKM/ii784rwD4cX8Ba1rrnpa
 sVO07WXnsqSANBNOmQDV1Wt+stq14EEIBjXnc2ux0egVjHO6kbAWAODLG
 UW3Xfffg8Ox8DwgAjhT1D7vkbnfKHS08oJcZJfGfvUamlNDZTlbVIV2U+
 uEUy6dEcuVRx5lPJpSdBlzD9plCQbWEwS6ryF1gGauar0Uyj5qnLbO3DP
 m/wLmxgdKV1NCDBKiVOTV1iRGy6/+P6l6K956GoEVK3Igt+F+b9hdxS/3
 xmOEdmTY9nAsVK74UmykEICZFI4QqU5IMMrhmDOaA2Hu6WpMCL5KUTSoF Q==;
X-CSE-ConnectionGUID: e/QPylhwTq2ryacxMgN8ug==
X-CSE-MsgGUID: BSZA1QTtRZOh9ADyyVuwbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37374603"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="37374603"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 03:55:04 -0800
X-CSE-ConnectionGUID: sfnoVZUQSX2V6LWbtS8UqA==
X-CSE-MsgGUID: Z+K4K0kiRLqIGl5yhzBMaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109926229"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 03:55:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 03:55:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 03:55:03 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 03:55:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvq+wd1DDrO/dLBFV9z1lpaQU14gAelFdTdBFLkSpYEwW5dKobZXBW5urpfJY+7xvCR+qpqBDuMclSVIG0PL8ZdGgCmzEVGJAECw1pl+T8ip6ik5qI28VZz3cHSSDxInKcPAv3z2g3iHf28B32MdZWn9VveG8hiEEVWN+RAyoFMNOpPC2ayOd2rKm3OuF7Q//ybaNfDQCOOkMKta/MK2N09XGzVmeo6heszd3pqiL+H/cxCpcPFSrwM9Gdw94arIJjGHItXw/ktcBCTUAsGlb3cw2OxwoLgkJLInDwlvTyO1jnlkxsYWMjyT8v8Rz3Gm8ZqDWsvPtNdosYa+FOyP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QjK/FOBk5Cq7FiL6uSmyouDP7MQQCReYVHfLk2s82s=;
 b=VK8lSy5OdWM3eANw5t6DjKFjHRhOnHSvTxlBqYO3LSuUkt5oHpmbgrgAYlClfsGOLle8srXMXZ1wXXKCU9ybOboHbzTePz5MViLY8b4BQnjT+3sw4ql3+mYOI6BpcQ+4Pcloyy+R+quvOdMw0aXxJMXtVMhZ2gwsdmgeeqqy1zQmo/ixUQthx4UJz3kZmx5RIkCmJeqbtu9VOGMvXhKZIkbjPzSPrD2lohIFy0mhkbleqPI/Tnz+hgRcpj5BJ2UJPkl+AiRfp9O6/UCaQhmlmAOVbL8fZxfNvu06uZivGneGstXVrrlgIGVYeyI7Ciy1/G7I2stuTjSK3JbCufqhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 by MW3PR11MB4618.namprd11.prod.outlook.com (2603:10b6:303:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.19; Tue, 14 Jan
 2025 11:55:00 +0000
Received: from PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e]) by PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e%6]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 11:55:00 +0000
Date: Tue, 14 Jan 2025 11:54:29 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
Subject: Re: [PATCH v2] drm/i915/gt: Ensure irqs' status does not change with
 spin_unlock
Message-ID: <ogyiwunxk4a6cpz2cd3r72i55f2njbbhyfslvhicvp4chxcfx6@xcbozdbwafnt>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <5fnb3l7s5hr3yfehkpvf4jgcunm6qclxagvssdobvfxbwtjiyc@jzko7kb7svud>
 <d65088a7-1ffd-4433-afbe-f4447b90e5b4@ursulin.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <d65088a7-1ffd-4433-afbe-f4447b90e5b4@ursulin.net>
X-ClientProxiedBy: ZR0P278CA0182.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::15) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5064:EE_|MW3PR11MB4618:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ed5883-903e-472b-820a-08dd34923a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjVWNE91V3ZnQ29yUFhTZXMwM2ZDYTlqRUNSR0g2Y3Fldmtpdk5BbGxISkJW?=
 =?utf-8?B?aHFnczJnajJJdVVBSHlYcGNaaXViWktTVmorZVdjaHJ3TGJKZjgweTdWM0s2?=
 =?utf-8?B?RHRZcW02eWRlcUFxQWozZE41cmx0a0JxUDJ4UVVITEZaSGR5eTEvRlh1VEJ6?=
 =?utf-8?B?WkNOVWJSZG5iUWdxMldGQmg0cElEcEV5YThvU3RjSitnMWhWemdrZ1Bua0RK?=
 =?utf-8?B?bmpTR2VzUmw3NSsxNFFQQkFOWEQxdkFFTGZWclZTaU9JM1pkeitPcHNqWHpl?=
 =?utf-8?B?ZkdFQXpRTHlkQlg1ZHZ6NXY1WHhXRDZ0cGZPZndxRkdhbWYrb0o0MVRrVno5?=
 =?utf-8?B?Ukw4c0kwaURWZnN1SDRkRVlNVStYbHJWQk4wdjluNWMzekFGTjNiYVo2Zjk0?=
 =?utf-8?B?Vzk2Ny96MTd1QTB4QUxpV25WcXA5NVFoWE91ckJCUUJVaDhxVlZvVGVRYlZu?=
 =?utf-8?B?YnEwV0lFNUMzVThwUUdWS2k3U0NzUUFEWTNFYlVwbDZUOFh3SktxcVFmNWF4?=
 =?utf-8?B?RVE5Z0swVXlKSnVnV2RLeWRnMHl3T3daMTlrejliVzhRcjBGL0kvaGJ5M3JP?=
 =?utf-8?B?aW8ySGtpY3JXek9uZGNVRWt0SVp2OHh2d25rRExuNVZEcmJXdGVVb1d3UnZs?=
 =?utf-8?B?NnlpMVgzbmp3dVdjTXhmVEFOdWoyM29EVXBCQjlKWXRVRXRZYXI3TWpWVXR3?=
 =?utf-8?B?V0xyRWFoUVJ4czA2eiswZE1OMlY2azM2YmRnUDh1b2tYblAxWmtOMmsvTmdv?=
 =?utf-8?B?SkQ0YVBoQkRNL2hnd0pCby8wcTgxN05rRy9wOElTU1d0cjkwdjNPekwycjlH?=
 =?utf-8?B?ZTNtYUFMN2Nrcm9jSzU0SStWcEZub21xa1ZMQmM3TDZWN09Fbk1yVVE4czBL?=
 =?utf-8?B?WVd0c2VaOXBqNlF1UTRCUFo2bGowaUZrdGhKOE8wZHVvU1JYOFJacUp2bWpQ?=
 =?utf-8?B?aDg1YXAzaDBBZnNxbmkyMUlycTZsV1krcVdqY1EyZzdmcTlLckF3Slorcnlk?=
 =?utf-8?B?cFlObCtnemNsUDg5ZWgzdUJpT3d3OUhlN3RrUms2bVhjajZCRDU3djhWZkdI?=
 =?utf-8?B?c1hyMURFQTEvMGs0bnlzUVl5SUJ6ZVBOR2JLdGoxZVpLZlBTS1Zla25UUTF2?=
 =?utf-8?B?cHVteEtQQllqVHlsK1NLUTRjN1JPTTVzcmkxcG5uakVZbnJDZlkwWHB1VWQw?=
 =?utf-8?B?QWRPbTN3VGFqaFRhcGRFUFBXbGNNQ3VRQW1kM3NGYWtBYXpTektvQjZMSXg4?=
 =?utf-8?B?TnNIVlZJcXpiN0prMFk0OGg2Y29uaTl5VElVZi9tZUxCU1QxaEYybE5Pc1FL?=
 =?utf-8?B?allrTUdDSTUvZ3lEYlFQZ2NNcjdoN3BEUGNCa0orWEZnei9qUkl1bHJmeWdh?=
 =?utf-8?B?VlNBV1RrV3ZIU0tCMDdkTGlEM0h2SGZWSnB4ODhVditTQzdKYUlhaFhINlQz?=
 =?utf-8?B?U3dNVzkxWmswZnAwYUJOeWJ2ekhjM2N3NlhzWm1HRUF1TmtYN3R1alhWTlln?=
 =?utf-8?B?Y3hUV2VBSDk2RHk0ZGt6TTQ3TkdKWWk1UXZtSVRibnZFNUsyTTBLbGN3SGN6?=
 =?utf-8?B?ckFNSXFHM3JQTjQwT2NoaHp6OWN4RnpDSjhGUm1WT1o4ZUlDaUxUbG9Yak1j?=
 =?utf-8?B?VEZsTENrM1krOXZLWmMrZnkxQnUyZkt1MDZZcTljbGl4c0MrV2J2bGZ2OEpj?=
 =?utf-8?B?M2xzMXc1U1NsVjhZb0ZFT1Q2ODlLQ1pUSmVySUpjMFlEbjdwQURFRzM1R29R?=
 =?utf-8?B?Vkl6cGEzaTBSNEZDY2VVOTgrb2gzN3FSNUhkQlF6WEszUDBjMXQyQmtFbXNz?=
 =?utf-8?B?bUJydElMbGVyeHBrSjRJemFOT25GbkpPaFBnUnVIL2FGdWtoNFBUMmtiRkQ4?=
 =?utf-8?B?aHBwaVJXbUhmS2lSWEdxVVRpQlZmRmpBVmNDM0I5eTRMOTdycHNCUWVRaFA1?=
 =?utf-8?Q?5geqH2VOa/Xp5rA9NTQCsmwOasJka8WY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5064.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUt5S1JHb2EzT1dYMXRXYjI2eVlTNU1meTZ5cVlTVE1JNEt4eDdsSmxRa1d4?=
 =?utf-8?B?NmZ6MTBrZGg2OFRoeXc0ZXJCbmxZaHBpRm83Rk82WGR5MEtWM1p1TWZkZUhL?=
 =?utf-8?B?SDNxS1JOQ1crQUw3eWI1RklMVlU1SCsrOHo2d1g2RzNXVFBOM2RZaFNXdWZK?=
 =?utf-8?B?U3Ntb2xEald2blF0VE1XNE5ibUt6NVJZci83U2ZLK1R2NGZ4OS8rNyt1cmUx?=
 =?utf-8?B?dnBoNWlDcGZTZFNuN0g1TzYvRlJZRzlRbjJrS1BKY3ZZMXk5S09xQ0hZOXZF?=
 =?utf-8?B?OTRNNW83L3JiZGlSU2pITDhzL2tXZU9EWDhyVDVSaURwaTAzNjVUQ1lxWnRT?=
 =?utf-8?B?b01NcVJtSXZjMm9DMCtZMDRsMUdWdnhTVi9iNWI3Y3UxTGlsVjFESlFKNklM?=
 =?utf-8?B?MUVvRHBFMGlYbEd2a2xUVDd6bmdvSW42SG9QRlpId0Q1Zk9udDJVbE5DVDlN?=
 =?utf-8?B?OFFuYmhFc3g0VXBnNUFqZ0xHTldnL0lmdFErR0JHSmVDMzZhM013aVJqVm9h?=
 =?utf-8?B?Z01NS2wrSXVwNXBWUnBIRHFUdU8wVlZ0RXlCY2RRb09xTHY3ZTNYZnFpVHJ3?=
 =?utf-8?B?UFkrSEdnUlF5Vlp6YW85TXpFVnpPT0JudE9DNGxvcWE1aUZxSTMwcFQrNFMy?=
 =?utf-8?B?aEdzWHJNcW4vZ0pHSUR3Q21yalFNZnA3TWpTOWttOStXVTU3V1ZMYVBRcGZy?=
 =?utf-8?B?NithN1F3RFVTTkZ2YkFjY1BRN0NvRUFDK2JSdmlodGhYbkgzOXpJQ203a2Jp?=
 =?utf-8?B?NHEzNnU5NEFZaGwxMEE0enpxNkdYM1VnL3lpaVdYTk5qYUEvMXhMYWx0M3BD?=
 =?utf-8?B?MWFLY3R1V05VQTM5bHlpcDFtR1Vsako2UW9ValhyVURxTCtFZW5XaUc3S2dn?=
 =?utf-8?B?Z2luUFYyUkx4WGRQZHBWMWZSencwVWRRTGNaREJFUzBrM0czM0ZxREVQb1Ro?=
 =?utf-8?B?MGpJVWVSb0g2WGF3Ny92cExqblpwRTF6OXM4Z0NaK2VSeXVyMmlqNjZnVVI5?=
 =?utf-8?B?enI2Z2ZHNlZ0T3FnNTI5SUVMeTJxdW1Ic3ZjRFFhQ3pUMDBoa29JRzBUV3U4?=
 =?utf-8?B?blVlWkNIZStveHE3TFFIOE5sc0ZvWHRvcTU1bFBkRmh5ZDhiemlweGJhalhI?=
 =?utf-8?B?ZlBUS2VTZDkzTzFwU1BTRXQ1MWhmNHVxUEdUYTdMRmE3MWJSUThiWHZVcmtJ?=
 =?utf-8?B?NlptSkQvNlRrYW11N1ZhaDAxNXdjQ1kvNnk3U0hCNVNsUE1obi9DZVYxOUhG?=
 =?utf-8?B?bUxhMGU0RG5qTTlhZm5KeENFWkxWSmlWa241aUlDSFJwZzRJZFg5cTN0bDV2?=
 =?utf-8?B?ZEZ3YUFDVVdxQXMrQ3BVenZmTHZtQkpybk5HQmlCZzFWWU41Qi9OZGNYdzgw?=
 =?utf-8?B?TENEd3lwRDE5VDk1VU0zTFJrbm9qalhReDRsMjNQWnBwVzlady9MMmNWZXpS?=
 =?utf-8?B?bVdTRERwZklOM2JsSlZJQmxTOW9SRHRqVXV5SWdoc0pIYWZOODgzVmkrV1Nq?=
 =?utf-8?B?eVN4SmlVOFYvVG9vZWJwelZPY0VMTG5FMnZUZzY3bVRocE1ac1RSVHhRU09B?=
 =?utf-8?B?QmQ0M1IycUtNTkpOLzVBNVZRTTRXVjFhcmhpSUVnOHpPNDNxTFIwajFJZDRL?=
 =?utf-8?B?YnBoR1NrdGF0VnR3RnVoV2kwNkF5K1d2em9seGxVQVUweFFqNjZaRWlEMWt4?=
 =?utf-8?B?c0U3aGgrZEI3S1EzRnJNK3RoT0FxalZsZGhFNmx6WTk4L0l2UytaNEVkSUdG?=
 =?utf-8?B?aTBxdW1KSXRNaHdUNVpnTlR3RXl5eUI1MytvNEJhUllRbklNOG8xT1kyWEw4?=
 =?utf-8?B?Tkp1anEzajBoRWp1ZjRDSlFXS0YvZkduc3A0UWVJY3p6VUUvSVhjOWpHQVFZ?=
 =?utf-8?B?SG1DR3g3b05NWjRPNTBQMkhHcTNLTzg4M2QzTEg0RVAwYkRkektiOWp1Q25k?=
 =?utf-8?B?Q0xMNHNZZ25ZNnAyaTdTRytRTW9HY0doYU14bkpmdjk1S0pOM25tN2J1Y05w?=
 =?utf-8?B?b0tOMDhhdVlXTm9HSGlJL3Z3MENrL1AvamN0dWFQMEhuUldVZkRsb0E0WUdh?=
 =?utf-8?B?NCtmMERKS1dFTWNtQ2ZNQzZYQm5wVkpleGNrVEs1c0JRaVJEY2FEVkNBL3Bm?=
 =?utf-8?B?M2F5N1pLMGZpRFRnNGFzamtnR2RmTWt3Vk5VNklkc1VFaXdjOTBSaStqbk1U?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ed5883-903e-472b-820a-08dd34923a00
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 11:54:59.8333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUp/Dsc3dj00TajSaiomvHTR7R49mhf8Doorp4x2lssS2ztLoFoW+JfukP1EqTOTqa4COqgng6d4PCONyEz7e1XPooLmhjSGpMMt0yXbbIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4618
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

Hi Tvrtko,

> On 14/01/2025 09:00, Krzysztof Karas wrote:
> > spin_unlock() function enables irqs regardless of their state
> 
> It doesn't, you confuse spin_unlock with spin_unlock_irq.
> 
> > before spin_lock() was called. This might result in an interrupt
> > while holding a lock further down in the execution, as seen in
> > GitLab issue #13399.
> > 
> > Try to remedy the problem by saving irq state before spin lock
> > acquisition.
> 
> Please check guc_lrc_desc_unpin(). It gets called from the
> destroyed_worker_func as  hinted by lockdep in 13399. There is a plain
> spin_lock() in there (in contradiction with itself). Fixing that one may be
> all that is needed to fix this correctly.
> 
> If that turns out right then also:
> 
> Fixes: 2f2cc53b5fe7 ("drm/i915/guc: Close deregister-context race against
> CT-loss")
> Cc: <stable@vger.kernel.org> # v6.9+
Thanks for explaining. I'll try that out then.

Krzysztof

> 
> Regards,
> 
> Tvrtko
> 
> > 
> > v2: add irqs' state save/restore calls to all locks/unlocks in
> >   signal_irq_work() execution (Maciej)
> > 
> > Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> > ---
> > This issue is hit rarely on CI and I was not able to reproduce
> > it locally. There might be more places where we should save and
> > restore irq state, so I am not adding "Closes" label for the
> > issue yet.
> > 
> >   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   | 21 ++++++++++++-------
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  5 +++--
> >   2 files changed, 16 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> > index cc866773ba6f..dd5542726b41 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> > @@ -53,13 +53,15 @@ static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
> >   static void intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
> >   {
> > +	unsigned long flags;
> > +
> >   	if (!b->irq_engine)
> >   		return;
> > -	spin_lock(&b->irq_lock);
> > +	spin_lock_irqsave(&b->irq_lock, flags);
> >   	if (!b->irq_armed)
> >   		__intel_breadcrumbs_arm_irq(b);
> > -	spin_unlock(&b->irq_lock);
> > +	spin_unlock_irqrestore(&b->irq_lock, flags);
> >   }
> >   static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
> > @@ -76,10 +78,12 @@ static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
> >   static void intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
> >   {
> > -	spin_lock(&b->irq_lock);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&b->irq_lock, flags);
> >   	if (b->irq_armed)
> >   		__intel_breadcrumbs_disarm_irq(b);
> > -	spin_unlock(&b->irq_lock);
> > +	spin_unlock_irqrestore(&b->irq_lock, flags);
> >   }
> >   static void add_signaling_context(struct intel_breadcrumbs *b,
> > @@ -173,6 +177,7 @@ static void signal_irq_work(struct irq_work *work)
> >   	const ktime_t timestamp = ktime_get();
> >   	struct llist_node *signal, *sn;
> >   	struct intel_context *ce;
> > +	unsigned long flags;
> >   	signal = NULL;
> >   	if (unlikely(!llist_empty(&b->signaled_requests)))
> > @@ -226,10 +231,10 @@ static void signal_irq_work(struct irq_work *work)
> >   			 * spinlock as the callback chain may end up adding
> >   			 * more signalers to the same context or engine.
> >   			 */
> > -			spin_lock(&ce->signal_lock);
> > +			spin_lock_irqsave(&ce->signal_lock, flags);
> >   			list_del_rcu(&rq->signal_link);
> >   			release = remove_signaling_context(b, ce);
> > -			spin_unlock(&ce->signal_lock);
> > +			spin_unlock_irqrestore(&ce->signal_lock, flags);
> >   			if (release) {
> >   				if (intel_timeline_is_last(ce->timeline, rq))
> >   					add_retire(b, ce->timeline);
> > @@ -254,11 +259,11 @@ static void signal_irq_work(struct irq_work *work)
> >   		if (rq->engine->sched_engine->retire_inflight_request_prio)
> >   			rq->engine->sched_engine->retire_inflight_request_prio(rq);
> > -		spin_lock(&rq->lock);
> > +		spin_lock_irqsave(&rq->lock, flags);
> >   		list_replace(&rq->fence.cb_list, &cb_list);
> >   		__dma_fence_signal__timestamp(&rq->fence, timestamp);
> >   		__dma_fence_signal__notify(&rq->fence, &cb_list);
> > -		spin_unlock(&rq->lock);
> > +		spin_unlock_irqrestore(&rq->lock, flags);
> >   		i915_request_put(rq);
> >   	}
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 12f1ba7ca9c1..e9102f7246f5 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -4338,10 +4338,11 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
> >   static void guc_retire_inflight_request_prio(struct i915_request *rq)
> >   {
> >   	struct intel_context *ce = request_to_scheduling_context(rq);
> > +	unsigned long flags;
> > -	spin_lock(&ce->guc_state.lock);
> > +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> >   	guc_prio_fini(rq, ce);
> > -	spin_unlock(&ce->guc_state.lock);
> > +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> >   }
> >   static void sanitize_hwsp(struct intel_engine_cs *engine)
