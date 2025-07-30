Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759FBB15FC7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 13:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E36E10E0C3;
	Wed, 30 Jul 2025 11:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FnMK+p7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F14D10E0C3;
 Wed, 30 Jul 2025 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753876112; x=1785412112;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/e8HDw74u+51Lg6oYoKMNZ88e66zEYSNMctVqGs78bQ=;
 b=FnMK+p7wrblTq+YzKj6Yez1XBzMz6A4uvIg4ZeS3E/FaKUP7gYCGX5CS
 UXo4KXxyjueruMoi/hmMNA+sO5SkBShaSGwCisKcTAWOY9F3sbKrnwNiF
 +dzaml/z1DoyOzJEOHb/+0HwErkPi1NBRsqQ7kgeJnclUCsqsP2/1EGS1
 9wTv/77H3UcaWENi4eMZ2FEV1pBHjYqmBCEqC+3O834AkHEG52QOriDLv
 4GXWSyth18ZeAUusW9Y9ySfAMayCjshnABMQfy8khkhhUbCCwpE4FWVqw
 Z9Xn0s+tVemmIoXX0UnMhOSiVKjHZFDbOS0MDlLjI86db4Tj/n4IZFMmA g==;
X-CSE-ConnectionGUID: JVPNbhjhR9CwnIF70FfeEQ==
X-CSE-MsgGUID: lMoBCzT5Qr+IueLWbtntGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56105256"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56105256"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 04:48:31 -0700
X-CSE-ConnectionGUID: 0z8VCdrLS2qSfCNLktVGDA==
X-CSE-MsgGUID: FMx/w6EQSAazvwDusJqTIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="168272495"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 04:48:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 04:48:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 04:48:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 04:48:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAqLzP0BHuxh2LnDUvUPoYaBx2eZ3og1wDQyVQ1DkIL0dYcRA/Tj/IGqJcgc6kVDG8FGGVhpaWpyyo//fdVvn5eqcglwdkaHrNFj2VMgCtIrqnGskCIXNrRbxR1+Y529a7M5qg25qFcyoqAeSrZOESnhyn9RPpqA9m6qV15U1caU1bJNgGq61JyC/yVVLBwSmLGjkmUYFciRi1D7EniFov3MBV6OPdkU/z7R8wqoqWehKYTC2s0pxr0BhWIYZZEt3MUGo6TCmajJ2do1rhIUEGlpezK0dNLCINKHL+XJTnSiU5Ocs4fwAyfTUs2tWvNNG5z63hfoC2rt0jGXdUM9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5/vhQOcB9Y3kjU6OEYn//PhQxvEAuLQDLYzDC2ROSc=;
 b=WK+g+gAd8dIwBEK3XzWuYNX5IuH9dM4fhmnqAfk90j856xJej17bbr3UJ1wqRrYABti/FMLg9n5cLGsDCXmZrKJo1lCnDF/F8iKnIxssR679sRqH9JJM5PFwW2yjpMXBRwBBEJoo/WMqC+lfDmTjv+u/hGEqDXsilwMLHBws6gVDEE/WmHrE0EkSuPo3KKr7bJUIxwCSi5JIV0071vImWUqhn6fC6/7FwHw7VP57i2C6SDmizYaOmMDwZamQOLh1mWkn/31kIVrXYN5D8YDmU1F2MQgB782rQ7Nr0C3n+fdi0QyDhp5Temn3rSEEsbtxoWHqQnHQ9pOimBZbjO8x0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BL3PR11MB6484.namprd11.prod.outlook.com (2603:10b6:208:3bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Wed, 30 Jul
 2025 11:47:34 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8964.023; Wed, 30 Jul 2025
 11:47:33 +0000
Message-ID: <8ae33696-f49c-41cf-97a9-ea9a405d05be@intel.com>
Date: Wed, 30 Jul 2025 17:17:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/xe/xe_late_bind_fw: Introducing xe_late_bind_fw
To: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
 <20250710150831.3018674-14-rodrigo.vivi@intel.com>
 <6edjvu7hnzq7rzmr4dybfxderiwfozlvdbptho2z7sgkhy5eka@jndenohiutrc>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <6edjvu7hnzq7rzmr4dybfxderiwfozlvdbptho2z7sgkhy5eka@jndenohiutrc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BL3PR11MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c0e59c-adbc-4ede-3aa0-08ddcf5edf63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUdpUmhaRmh6MWxEc2kvQkc0Zm8wZ0Z2MlVBSVBUZ3RicVlxUmJHaGovOFIx?=
 =?utf-8?B?VnZwNFNLLy9kL2xwNHdOSHJIY0QwTG5pRktaNmNCVFovUXk5OEZXQTkzR3BH?=
 =?utf-8?B?akc2S0tXeEtNZnJ5SkdJVzlFSWkxMFhUUTArNTlyMnBDK1NZK3NRSG9aUm9i?=
 =?utf-8?B?Q1UvMVROZkZCbUJKWnovdzlSN1VUeDBxUDlHNklNdkNpMUduNmliZ2xaNUJK?=
 =?utf-8?B?bmZsdTQzTmtLQTBDVDgxbVBvWkVuS3RMQ3A0Vys4YlM0ZWJhNkVHQ1hFeEpU?=
 =?utf-8?B?SVhvbGtWS3dtQXpxT2JsdU9CdTZYUmxiS3Jva2xYRTQvaWZKMUhDN0NsY1E3?=
 =?utf-8?B?VGl2VkN6NW8veHVNTGlXek1GRHZ5M0ovNmlHWkhLVkxBMnZmMlBkenE4UU5Y?=
 =?utf-8?B?bHJFb1VJMVNsbmZtc0lKNmtKV2VjV25KNjBlanlONGV1RHhtWEZRajV1ajhL?=
 =?utf-8?B?ZGFwalZTTjBIeXNJUXRaWnVoQmJvL2wvUlZxS3lsV0xRRDBsSXJpNVF6MUNW?=
 =?utf-8?B?UVJTRXkwYmNUejM0L1ladjVLeTUyK0Vpek5iOXhjT1BqalhqNE1NcnE1SWY3?=
 =?utf-8?B?ZnRDM09TMHRvS1VWQkxBWGRMMmg4Z3JoSVdYMnRtUFpuOUl1aXdGSG02bkRq?=
 =?utf-8?B?a09rMmt3K0Rlc0Q3YTFpQ3B3WDBweGdHVkFGdE1ETFZJc2pWbHFwT2FQcHRR?=
 =?utf-8?B?cVlZWTBQb2RCMWxvdHYxY1NUNUoySS9Fd2FFZUcvbllhRTZIQjdKcUJ6OWg1?=
 =?utf-8?B?d29lc3Z2cmVXbkVuODNta3ZUcUlCMEpWaGtrOTMxbUVjN0IrcmhrVXRNYjVI?=
 =?utf-8?B?WGpaaVBSY0dDSk9sM29NOHp2dzl6N0Fhc0g0QXJPZXo1MjA3djJ6VjNpS3Jm?=
 =?utf-8?B?dkE1dDBLMWt1TXlzT2kwT1llbWpJbFBlbXNJMVFFT3VlZmxEVlAwcUhtdWIv?=
 =?utf-8?B?ekdoVFd4NlBOaU5UbVRBa1c2M2lKNHZEZXl0U0VvOEYrWWgweHBuY3hJaGRw?=
 =?utf-8?B?SU53bXExZHpGRCtablV4cFVTZkVOZjhjYVdZMGFQL1JGdDl3ZTY0MExueUlM?=
 =?utf-8?B?bFphazZ0SXd1WmJla0piK0hKbXBoSFNESk15U1RzVDJJcGhwZ0dGa3FiZEd0?=
 =?utf-8?B?RVhybnVWMFZaTGpleGphWVphMDVTN2l3YWtpWitDaE5kckJxUUx1SmIweFR1?=
 =?utf-8?B?aTJtS0YyQXU4VVJlRUcwVXg3a2ppZXdyTDVwSjI3RnU0STJ4cFhFcDgvaHls?=
 =?utf-8?B?aWd4aFhMRVRhd3Z0UE90eDFWZkY2Z21BbkFKWlR6elhOSytFUXpMUUhMWmpW?=
 =?utf-8?B?a2VnaVQ2My84Q2V3L2d2UzA3bStmSGFETzFmOEFCS01sWmJTZXMydVJpR1ph?=
 =?utf-8?B?Q3B6NUFjTmJIZ01hQ1pJU3ozM09iYVhwdzhrdXZSRCs0STd2Z2lkVml2KzNx?=
 =?utf-8?B?ZEpoeUlOc0FNbmZpaDlBOUJKelV0VHh6WW82ZzJpNFBvcU1nVmtuUm14MkJB?=
 =?utf-8?B?Uzd5a1pNNHV6UVdXYzhDNTYzdWVLbzE5cDFja1ZtSjgrMGVsWG85YVZCRzll?=
 =?utf-8?B?MDJjWWRweUZOc2R4NlhiTmg5QktORDFWbCtQT0FyeDNjTmJjdmtuaUNiOHNG?=
 =?utf-8?B?dVBscXRBZ3lLRi9DOGc3a1F4dGhrQmo4bng4V3FOeFUydDhCQk82Y21VUEZZ?=
 =?utf-8?B?aWp6cjZQdStiQXdjbGc2bWp1ZjRhcnlNcUtVUnRKQXdiaGc3MXpzUVlqdzI0?=
 =?utf-8?B?ZUl3QUw0UU1ubU1ReXZWMjhodDBCMEM3Z1FCNnliY3AwNnRGcGlXSk1UZ2ZT?=
 =?utf-8?B?ekhEY1BJWXdpWDNJYVBCRTZpK281czZBbzh6UmpSdFRENmE3YTFWZzlSbkRL?=
 =?utf-8?B?UGZVSC9ick5LcUhDbHlzYjBVWGNsUTdDVUZqZVhsYnZ1KzRqU0RNOGVlRytX?=
 =?utf-8?Q?/BPI2XXm00A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzg5ZGRBYVliTHNBd3NlRmhFcFZEVUV6cWhpYnBLeGhkbmFTNHdWMXNYUGFt?=
 =?utf-8?B?QlYxZ3BFbTdpSFVLYU5UeG00ay9vUi9UK2dUWGszYVZSazE3Q1Z6clBQYmJj?=
 =?utf-8?B?bkZ3WlVudnIrTHRsb3dJUWVSMWRTempLVklueUNPUXNzWFhIcjgwRWE0c1U3?=
 =?utf-8?B?d1EwSjBjbnNvd1hGa09mWTc0S3RlZTlCYmw3Qml0YU1wT3N2RHYxc2NsN3BP?=
 =?utf-8?B?dDhnZUZKWXAvRDNQNno0Y2RJT1JKa3lVbm5IY1BXY3dLVnpHajQyU0FMUGtP?=
 =?utf-8?B?SUhySHd0S2MydHpuMHB5QU1GQXYvUGZFZ0lEMlZ3ejJEVkZZTWVnNGZUS0Vh?=
 =?utf-8?B?NTVDSEZRY0xhWjgyUFVaMHFWL1VCOEtSUFBMOWYvMk9OV2hTQWZFTllITHJL?=
 =?utf-8?B?OHcrekJHSE1sbkFlM2RxYjEySVlCTzl5ZGRXZTdmL2dpTWYyazM0NGptMmJN?=
 =?utf-8?B?eEd6SmEzdHJkTldObUttZWFocDdDTFBjaEFKQVowQnVDOUo0ejZxY2RRaUg2?=
 =?utf-8?B?d2VHWFZEMlNuVitMQXVXVWdLekxjYnNTd0dPYTdwQlB5ZUlFYjRZR0tXZlhm?=
 =?utf-8?B?Tlp6b3g1bGI1dWxsUWZBR3BDTVBpTTNiRjA0enFxNDhudk55RFgycFBQNzUw?=
 =?utf-8?B?VGh4RkM5ejdUS3JkV2F2RENPZzcyV3BJZjZ1a1FFTUpYNXJOZlA4SEw5Tzdl?=
 =?utf-8?B?WGVNTzNGQktPaEJJY3VpcFFPbFhjRTk5allML0RDTnBBenBoTXdQK1RFRHg3?=
 =?utf-8?B?SHR0SkhEOCsvSWVNSUZhSU1LT2psZkVkTWN2UnphRVhMd1A4a3dDbVpzU256?=
 =?utf-8?B?R1BWVUozaGdqWm12cWxKOFFQWmx4OHM4OS9qTTBJQnM5dDJ6cFJkQ1Eycmhh?=
 =?utf-8?B?VWJBTllNOWFHMlNWcjM0bmsyczYzYkYvcCtiYVozeHp4V2JmaTBJRG5yc1pm?=
 =?utf-8?B?Snc0YXU5azBsc2tIYUxwU2ZERks2MVlaZHMycEZTeHFoa3NEeTNZZk8xMnQx?=
 =?utf-8?B?RzBKYU0rUkp2K3UzU3lFRXh5K010SldMUER5SEo5VkpDVW94ZTE2WnNrQ2xO?=
 =?utf-8?B?ZFN3eTZ1bWJuN1d4bmlXb3RUVWhOWjlyVXBULzVOWDRYU0ZHMU5JZEpaeEYz?=
 =?utf-8?B?ZUxPMU5sMllrQ1NWcnNiZFhnaGdFUm52eGJWRzVlU3VDQjU2KzFidEdCN2JC?=
 =?utf-8?B?S3BzeDNtQ0FiQnd0ajZDdUo2b2thc25Wckk2d3VhdVE1L3kzRmQ4TnBsekM1?=
 =?utf-8?B?UlY3QlVFb3A0UWlFakxJOXBSOFZSeGNZYVBFTlNUV2FUOU5Bd0tVQkg0NFl6?=
 =?utf-8?B?RUlrR2hNV2pDYVNhckpIMzdLRFpkREFGWENjUUs1WXVYODQxMEZINmM2enZx?=
 =?utf-8?B?b1kvQ1g0THRDYnc3R1MrS2NRS2I5bC9ua3VrbkJZaHp6NThWQUpHb0tkeWxo?=
 =?utf-8?B?RDFiY3F3QlYvRVFTak9URnUraHUvN3ZuSUZCY1NZRHZPSERINzRzcnZ5Yndy?=
 =?utf-8?B?UExwUWhSQVY4WHdKbklIbTFNeFROa05rUjAwd2ZMUFhNbUQ0bEV4NmZMMXJr?=
 =?utf-8?B?SmJFVHozQldzUUo2Vmlvemt5WVpQVDRhSUpjUEp1TFJVYXZzZk1Kc0U2Z3NR?=
 =?utf-8?B?a2JFZ21QRi80QzBDWk4xcWZ3a2ZhN2svQzFVNVptOHI5d2dpSkNvTGFYZVVS?=
 =?utf-8?B?WURxOXVMMGtuWmhONzdqeFAwd3R1ZTI1MDVIckZ0ZWNYb1hUT0UxRDJ5THZI?=
 =?utf-8?B?aEhCZko5NlNoc1poVmRSK0RQR0g4WVpBVUNqdDNLWmtXQlFQbkp6eVBlZzIr?=
 =?utf-8?B?bkgyM3BlcENnS2JEQVNhQVZOMitjZ1UveXlzQ0JjVHhzMjhONlhybXBkRW80?=
 =?utf-8?B?dVNuOUhJblI1WndoOTFCY01aOGpCSTMrNDQ3RGczd25nWjZiYUZyWnZwYTRy?=
 =?utf-8?B?YzBsVXFFcDJ0YTA1OG52ZGV5aENKakNTenpnK1FGM2lOTUcrL0lDQjM0MXYw?=
 =?utf-8?B?cXhFdUJHVkxvRUprZmVUL2h2eCtCOHdBOE44aDVUekNsRTlTV2k1RGNzRksw?=
 =?utf-8?B?VjVJRlM4cGxubTdrTUd1c3JYSm9KLzVwT0tjcmdERWdsNGJLd1RkajRjZ1Fl?=
 =?utf-8?B?TmE5ZUxNaitoaUdCZ0lhSTlEQU5zcFhicVVWcXdBTUs3M3liZmdhSnNCcUs0?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c0e59c-adbc-4ede-3aa0-08ddcf5edf63
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 11:47:33.9495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RT3CpKGphXgqUAWlx3isknFRx9gTQOPxSHeCbLJ7CuMN5129XrQcHZ1rRDuoGkMgSZj4hudxb05pjZ497Uo5MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6484
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


On 26-07-2025 03:08, Lucas De Marchi wrote:
> On Thu, Jul 10, 2025 at 11:08:34AM -0400, Rodrigo Vivi wrote:
>> From: Badal Nilawar <badal.nilawar@intel.com>
>>
>> Introducing xe_late_bind_fw to enable firmware loading for the devices,
>
> here and in the subject: no gerund, please.
Sure.
>
>> such as the fan controller, during the driver probe. Typically,
>> firmware for such devices are part of IFWI flash image but can be
>> replaced at probe after OEM tuning.
>> This patch binds mei late binding component to enable firmware loading.
>>
>> v2:
>> - Add devm_add_action_or_reset to remove the component (Daniele)
>> - Add INTEL_MEI_GSC check in xe_late_bind_init() (Daniele)
>> v3:
>> - Fail driver probe if late bind initialization fails,
>>   add has_late_bind flag (Daniele)
>> v4:
>> - %S/I915_COMPONENT_LATE_BIND/INTEL_COMPONENT_LATE_BIND/
>> v6:
>> - rebased
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>> drivers/gpu/drm/xe/Makefile                |  1 +
>> drivers/gpu/drm/xe/xe_device.c             |  5 ++
>> drivers/gpu/drm/xe/xe_device_types.h       |  6 ++
>> drivers/gpu/drm/xe/xe_late_bind_fw.c       | 84 ++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_late_bind_fw.h       | 15 ++++
>> drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 33 +++++++++
>> drivers/gpu/drm/xe/xe_pci.c                |  2 +
>> drivers/gpu/drm/xe/xe_pci_types.h          |  1 +
>> 8 files changed, 147 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
>> create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
>> create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 1d97e5b63f4e..97e2b1368a6e 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -76,6 +76,7 @@ xe-y += xe_bb.o \
>>     xe_hw_fence.o \
>>     xe_irq.o \
>>     xe_lrc.o \
>> +    xe_late_bind_fw.o \
>
> almost there, but still not sorted as it should be
It seems the rebase messed up the order—it was correctly placed in the 
previous revision. I’ll fix it.
>
>>     xe_migrate.o \
>>     xe_mmio.o \
>>     xe_mocs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 0b73cb72bad1..cb595bae5f55 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -44,6 +44,7 @@
>> #include "xe_hw_engine_group.h"
>> #include "xe_hwmon.h"
>> #include "xe_irq.h"
>> +#include "xe_late_bind_fw.h"
>> #include "xe_mmio.h"
>> #include "xe_module.h"
>> #include "xe_nvm.h"
>> @@ -866,6 +867,10 @@ int xe_device_probe(struct xe_device *xe)
>>     if (err)
>>         return err;
>>
>> +    err = xe_late_bind_init(&xe->late_bind);
>> +    if (err && err != -ENODEV)
>
> let's not be creative in xe_device_probe(). Boring is good.
>
> All the other parts in this function handle ENODEV internally. It's up
> to them to decide if ENODEV -> return 0, not here.
sure, will update accordingly.
>
>
>> +        return err;
>> +
>>     err = xe_oa_init(xe);
>>     if (err)
>>         return err;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 78c4acafd268..a8891833f980 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -16,6 +16,7 @@
>> #include "xe_devcoredump_types.h"
>> #include "xe_heci_gsc.h"
>> #include "xe_lmtt_types.h"
>> +#include "xe_late_bind_fw_types.h"
>
> should be sorted
Sure.
>
>> #include "xe_memirq_types.h"
>> #include "xe_oa_types.h"
>> #include "xe_platform_types.h"
>> @@ -325,6 +326,8 @@ struct xe_device {
>>         u8 has_heci_cscfi:1;
>>         /** @info.has_heci_gscfi: device has heci gscfi */
>>         u8 has_heci_gscfi:1;
>> +        /** @info.has_late_bind: Device has firmware late binding 
>> support */
>> +        u8 has_late_bind:1;
>>         /** @info.has_llc: Device has a shared CPU+GPU last level 
>> cache */
>>         u8 has_llc:1;
>>         /** @info.has_mbx_power_limits: Device has support to manage 
>> power limits using
>> @@ -557,6 +560,9 @@ struct xe_device {
>>     /** @nvm: discrete graphics non-volatile memory */
>>     struct intel_dg_nvm_dev *nvm;
>>
>> +    /** @late_bind: xe mei late bind interface */
>> +    struct xe_late_bind late_bind;
>> +
>>     /** @oa: oa observation subsystem */
>>     struct xe_oa oa;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> new file mode 100644
>> index 000000000000..152f3e58de94
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -0,0 +1,84 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <linux/component.h>
>> +#include <linux/delay.h>
>> +
>> +#include <drm/drm_managed.h>
>> +#include <drm/intel/i915_component.h>
>> +#include <drm/intel/intel_lb_mei_interface.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_late_bind_fw.h"
>> +
>> +static struct xe_device *
>> +late_bind_to_xe(struct xe_late_bind *late_bind)
>> +{
>> +    return container_of(late_bind, struct xe_device, late_bind);
>> +}
>> +
>> +static int xe_late_bind_component_bind(struct device *xe_kdev,
>> +                       struct device *mei_kdev, void *data)
>> +{
>> +    struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>> +    struct xe_late_bind *late_bind = &xe->late_bind;
>> +
>> +    late_bind->component.ops = data;
>> +    late_bind->component.mei_dev = mei_kdev;
>> +
>> +    return 0;
>> +}
>> +
>> +static void xe_late_bind_component_unbind(struct device *xe_kdev,
>> +                      struct device *mei_kdev, void *data)
>> +{
>> +    struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>> +    struct xe_late_bind *late_bind = &xe->late_bind;
>> +
>> +    late_bind->component.ops = NULL;
>> +}
>> +
>> +static const struct component_ops xe_late_bind_component_ops = {
>> +    .bind   = xe_late_bind_component_bind,
>> +    .unbind = xe_late_bind_component_unbind,
>> +};
>> +
>> +static void xe_late_bind_remove(void *arg)
>> +{
>> +    struct xe_late_bind *late_bind = arg;
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +
>> +    component_del(xe->drm.dev, &xe_late_bind_component_ops);
>> +}
>> +
>> +/**
>> + * xe_late_bind_init() - add xe mei late binding component
>> + * @late_bind: pointer to late bind structure.
>> + *
>> + * Return: 0 if the initialization was successful, a negative errno 
>> otherwise.
>> + */
>> +int xe_late_bind_init(struct xe_late_bind *late_bind)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    int err;
>> +
>> +    if (!xe->info.has_late_bind)
>> +        return 0;
>> +
>> +    if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND) || 
>> !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
>> +        drm_info(&xe->drm, "Can't init xe mei late bind missing mei 
>> component\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    err = component_add_typed(xe->drm.dev, &xe_late_bind_component_ops,
>> +                  INTEL_COMPONENT_LB);
>> +    if (err < 0) {
>> +        drm_info(&xe->drm, "Failed to add mei late bind component 
>> (%pe)\n", ERR_PTR(err));
>> +        return err;
>
> if you are going to return an error to stop the probe, then make this a
> drm_err()
Sure.
>
>> +    }
>> +
>> +    return devm_add_action_or_reset(xe->drm.dev, 
>> xe_late_bind_remove, late_bind);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> new file mode 100644
>> index 000000000000..4c73571c3e62
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_LATE_BIND_FW_H_
>> +#define _XE_LATE_BIND_FW_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_late_bind;
>> +
>> +int xe_late_bind_init(struct xe_late_bind *late_bind);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> new file mode 100644
>> index 000000000000..f79e5aefed94
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_LATE_BIND_TYPES_H_
>> +#define _XE_LATE_BIND_TYPES_H_
>> +
>> +#include <linux/iosys-map.h>
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>> +
>> +/**
>> + * struct xe_late_bind_component - Late Binding services component
>> + * @mei_dev: device that provide Late Binding service.
>> + * @ops: Ops implemented by Late Binding driver, used by Xe driver.
>> + *
>> + * Communication between Xe and MEI drivers for Late Binding services
>> + */
>> +struct xe_late_bind_component {
>> +    struct device *mei_dev;
>> +    const struct late_bind_component_ops *ops;
>> +};
>> +
>> +/**
>> + * struct xe_late_bind
>> + */
>> +struct xe_late_bind {
>> +    /** @component: struct for communication with mei component */
>> +    struct xe_late_bind_component component;
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index ffd6ad569b7c..69b8ead9ca59 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -332,6 +332,7 @@ static const struct xe_device_desc bmg_desc = {
>>     .has_gsc_nvm = 1,
>>     .has_heci_cscfi = 1,
>>     .max_gt_per_tile = 2,
>> +    .has_late_bind = true,
>
> again, boring is good: all the has_xxxx flags should be sorted
> together.

Looks like the re-base affected this part as well. It was correctly 
grouped in the previous revision — I’ll fix this.

Thanks,
Badal

>
> Lucas De Marchi
>
>>     .needs_scratch = true,
>> };
>>
>> @@ -578,6 +579,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>     xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>>     xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>>     xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>> +    xe->info.has_late_bind = desc->has_late_bind;
>>     xe->info.has_llc = desc->has_llc;
>>     xe->info.has_pxp = desc->has_pxp;
>>     xe->info.has_sriov = desc->has_sriov;
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h 
>> b/drivers/gpu/drm/xe/xe_pci_types.h
>> index 4de6f69ed975..51a607d323fb 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -39,6 +39,7 @@ struct xe_device_desc {
>>     u8 has_gsc_nvm:1;
>>     u8 has_heci_gscfi:1;
>>     u8 has_heci_cscfi:1;
>> +    u8 has_late_bind:1;
>>     u8 has_llc:1;
>>     u8 has_mbx_power_limits:1;
>>     u8 has_pxp:1;
>> -- 
>> 2.49.0
>>
