Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42164AF6686
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 02:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3745E10E7B8;
	Thu,  3 Jul 2025 00:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYdKaMjF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281CC10E7B4;
 Thu,  3 Jul 2025 00:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751501598; x=1783037598;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6RU9r3Z/MQ+9hPcTFiZ8qvonRM51+MG1A6xiiilzOng=;
 b=nYdKaMjFhcK9HVyr18hUVqzdPjd954lW6Beyfh/KiFacJNRaKtBUisKV
 LEd7czMnGwBAmI9gJXoMsZHyt/VD792jJvRx37E+5tvbZSUK+lyYJVFCO
 sRSfkuu4fiO1+LEoVzQmfdxqJXOwglHrqW9klr4/+WFBwfAs1fKxHyYvJ
 x0VmJ7KdhyHAvXvH4WdblYGaxFp5v71IsAYG6eXPBqSkgrpl3OTgZD2qx
 m4bnDWIsDnvO2Dp0CcKRCsDCwuQeVBIA28RqjIGn3dSNHjqJBl5RwU4yl
 kRED3zutixW6luzGH+wrcQsCBki5iNE+GpIjgBAz86KiySVAMBXMtsQxz A==;
X-CSE-ConnectionGUID: HlRRWZzgSBCCelVgghr9Tg==
X-CSE-MsgGUID: 5eefQTZhT++SQuhj/qxhug==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71387904"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="71387904"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 17:13:18 -0700
X-CSE-ConnectionGUID: ZKMjPTqbSIKYuZSbSXwyFw==
X-CSE-MsgGUID: YoLkR6eoRM6wMJGxPpiN5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154966510"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 17:13:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 17:13:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 17:13:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 17:13:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vmt0iuz7koGTu+0GSCuVFCTbl6R+egyE1O3E5SBvi3ZrprcuqKfKzv5pxEGFpyiYKzAXuIV1S4ywTgFD0hgs/FC+IbIKHs+mXKVJ/RMTFFAMOyj5jVS8jeOYz31sJTizNZi+o59lcO5meAuQH0WQA2tk3v0kxIC4zuVLA9SkjkVNWXIPShVDreeIslFlYeGsFIC84L9Qf5C3xKdg2z4NvYiHdqZ+/OlAa4Eb9QOLqnJjv5q3cnis9rd2cyhO2Uz5APxbDr8SNTrsrz5Yzl6ar5yB38+ckA39YUzquCoNwofxFthhNQz/aE3yAKTJh8H9t58Ugmz/ITjBhytjiubuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9IIv4aQf9tCPhRiBY0NtqIauK3HYfNQzRQ8Wnu3vJE=;
 b=TrNn9Tp4jelgbvZ0rEpyV2eqAmAz46szxvnRGT5H1TXhXTlrGMnoqB1KPGS6/wYa6VpBPStDvvrH9wkNgSM49AIaKUvK7Knm5alzX3LLnieDGvXG1tTreElkXFB3XDuJArTEbxShYI3SThyC0RUWSI0xls+lpNov8tIhaVFqqIeDhoO2t0nUifXQWHzBU+dtzkgsLxK6qoiE6KCBeSrglrehE3SCrmX8mjjWw5BHr9JeZbn4lkT0KBO7EQIJX5ROfz1RVCAcNOMgCbG7C7JLxDUZimtIPaT+FVYP8xtUxk8PCq7+yG3/KokjQmC6t+KWdhyiWf+EbZkG2ZIM18mNrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 00:13:02 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Thu, 3 Jul 2025
 00:13:02 +0000
Message-ID: <d5c12476-d9e0-40a9-85c2-bb5444abd71a@intel.com>
Date: Wed, 2 Jul 2025 17:12:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] drm/xe/xe_late_bind_fw: Introduce debug fs node
 to disable late binding
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250702165216.557074-1-badal.nilawar@intel.com>
 <20250702165216.557074-9-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250702165216.557074-9-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f353d29-a364-4a92-bbec-08ddb9c6600e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2F1dXNrZ2hpaTZveXdNbUI3QU5BZ0VubHdzSkNTdHZ4c0lrQVhCdlpXcXM0?=
 =?utf-8?B?d3FaTkRRMXUxT2Ryck1zd2lPTUN4cmNFOG9EVXdRL2ZCTXVEdkVqQVpnMEJU?=
 =?utf-8?B?SzFJZTl3Z1JyVTdicXI2Q0MyNGtBc2FNWEFTUDJtZWlYbUhTeDYzVFlJSFZm?=
 =?utf-8?B?MTdlMmdOVXo2bWI3cGVLQlpCTTFJMUhpUWp4djZhdi8yTTA3YjRGUnM5WVE1?=
 =?utf-8?B?U2ZFQjFqeG43d2U4bStPakVzbVdvdHE3M0FKSENJMndkUlZsaXZ1dXo2Z2tZ?=
 =?utf-8?B?WG43YUc0emppQWlEVHVFRDc3b1dka1lUQWJoZnVUS2RhR1FjNW0zMGxSNGha?=
 =?utf-8?B?RFZiUnBKaW5jaEIwL01raWowdUprclRPTDVYWm1vTVp4MXRQYm9YbHdOLzc0?=
 =?utf-8?B?TzhBZm1WTEJzL3pReGoreE15a0gvdGh0T1U5aWw0ZXRCZXFxd04wMHpveGxr?=
 =?utf-8?B?VTVrR1A1Um9sZVlGelVqeDVnOEIrUTdkRWIxdzlVL3liK1hTaXZYNFk2NURy?=
 =?utf-8?B?UnhiTnllRStLVG42WExJRFFEUmFURVRaZ25IN2xhayswcWZ3T1AwVFlOSktV?=
 =?utf-8?B?TWhvZndrUSt0YVgvQkhDdEFza3hEL1lzS29aNEF1eksrbStwMytYUlRsVTFT?=
 =?utf-8?B?SVU1dGtQeFVqbzQwdEpCejFBK2xWSTExUkVEeVFzSlIycnNBRXFFK0hqYlpJ?=
 =?utf-8?B?ZFcrTmVFUHk4eGJmakhDcUtaSWl2NEQ4eHNBTWU0NjJvRnFzVGgwbnEwOHAv?=
 =?utf-8?B?TUFIRmI0eXZpVFZxR0lyaHhMUnFBcjROcnQyMmZOc2M2TTQ5OVROMTZqTU5F?=
 =?utf-8?B?VVhjWkMyNlZSUW9RcUdRVDhubVNEOWl6MnVsMkZIc3pqbzJPNmptb2VsbzRW?=
 =?utf-8?B?TlBIRjl4V3MzQk5QTmlURXNmaDlmRzdRU2c0TlIreFdCM0NwT2V2dXl5MytO?=
 =?utf-8?B?VEhiajI0andBaHB4U21ISHptbUpoY0ozYjNNcVVWZXhHZTFKNWo4d05LOTRC?=
 =?utf-8?B?dmo3bC9obVlMN1hjeVg0NHkyUTliYVppTkdEL1dLeUY5U3R2Qk9vSUFmcWNj?=
 =?utf-8?B?cWVCL2o3Vjd0MHUvUkoxY20xZ3BVRFgzRzJGQXhVajBtUW5RWkR0SUYxM2xT?=
 =?utf-8?B?NVk2Qm93bUZVRWFpTTR3TDBOSnlrdVhtSE9UM21PSEI5MHFFN3NnSG1lcEhP?=
 =?utf-8?B?WnRmR0pYOFhBekRnQUFtU3FkeDhsKzBiYk5rSUNyWG1mOUxwMVVmcW9maEIy?=
 =?utf-8?B?MEg2SGpaenBqOTBCMFBidHJjOWJNRzdwMUxMeEY1bkRhejdUL0FvRGYvd09i?=
 =?utf-8?B?Nkk3ZXNZYkRQVWFDNXhlbFdkTEJxcmhWcFVCQ1dndzhYSkp5WTJDd1lMdVg0?=
 =?utf-8?B?MmdDdHcrSk9zYzJxK05iUDZjR3k5VWJjdlU5R1NGenNzVGdPTm9MUDFHMTJp?=
 =?utf-8?B?MWVqdjV5SlFFdWxtaU05WkdBdVY2dHZyelJoSXJjRlFFdys1cHBHSlBYZ1M4?=
 =?utf-8?B?RHlPM2wxaGJqRjRoS2NPV3gzRlEwdEVQSVFVbjI0a0svbjVmNmQwSGpIaHFl?=
 =?utf-8?B?ZFNobWRXN25PNTU3dERkMmhtYktMSlhNODk5L0VnWm1DRzg3bHc4RFpoRytI?=
 =?utf-8?B?eXpTS3U2NXFQT3dUY20yQmdhWVFmSnkweDBnRkhJN0lLQUFXWWtxNkx2OS92?=
 =?utf-8?B?ZWJoVEh6RUM4S3Q1WXozVDlZTVFoRDZaRGtGYU1QYlVqSlc0MDlhL2lSVXhp?=
 =?utf-8?B?Mm9rSTJkVGhyRWdtVnAwOSt1blloNEowanNGc01LY2xzUzl3OW1YZGhDaHRo?=
 =?utf-8?B?KzlWOTdXVmRNRTh4T05WSVdCQ3hyRkpueXFqeWE4UFh1Q3BTSjRPR2hOY1lJ?=
 =?utf-8?B?eXNVNWlrZEU0T0tFR2lEK09YejhiMnBCWmJFQmtLdkFzeHdhVlhjMlNCeCtQ?=
 =?utf-8?Q?vViugmFSuAw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVRlMG4rV0h2ZnZzM01UTHlIZ2Mrd0dYb0tWUlAxNzlKaXM5K2RsWkhnUXF2?=
 =?utf-8?B?ME8wbmJzZUYxSk9wTk91bzhNTlBPRWM3YlJVeHk2WVZtVlZidnpZdGs2TDEw?=
 =?utf-8?B?b0VLV3puQmo1V3ZadFJyM3lHRmR0RUN3YnNIY3VsaSsvc0ZibjZMVkY3cVc2?=
 =?utf-8?B?TFQ0YWhWV2RIQmNsY0lqaWVqY05ZVG4wN1kyNmlEV0k0Q28vZWRBcGRQTnps?=
 =?utf-8?B?S1E4SndaN0dSYjA4OHJxUmkzQlNMNjhSUGFZUWE1Ri8wenZPVUIzaHR3U1VV?=
 =?utf-8?B?OGVNRGlVSTFjRXpBNE9HYWFzQ2RPL2RyNGRuTkhQbnRJVWhoUGc0SVp3MGs1?=
 =?utf-8?B?R1FoNDgwU09GVENTTzhzLzdjRndxMjN4ekc2S3Jla2VJUWZyN01EcldDZ3dn?=
 =?utf-8?B?aE9GbTh0dnI5MWR5enN5YTFVbHcrK3UydUx6Yy93Rnc1R1ZRY3lhNlN1c3Vz?=
 =?utf-8?B?bzdPdEg4KzB1OUNYdit6YzRLbHZZUDhkNWZTVWZnWEJQakRYVkV2MUVBMkFU?=
 =?utf-8?B?VWwwaG9qU0VPcVYxSXB4NzRVYzdVbWJoaVcvSk1ra3M2WDJmK1A2RmJwQnJQ?=
 =?utf-8?B?Q0dzZjJTVXF0dGdFWnZxdXN5TkdvYjV0Q0NFcDJYYm5aMlBwS3gwemFETHJC?=
 =?utf-8?B?NlJVNmtISW1ScjVuWjJKTW5UQTVmSjRzZ2FKTm8rakczT3BNZmo2RUZtRDdp?=
 =?utf-8?B?RkhrY3ZjTXFMc2ljMmpOWld4TXg3aGh4ZzdKZGd6SENOSlFRY08zOUQzZlNh?=
 =?utf-8?B?MTZuTW1Lekh3WFBDM2hNbzVBcDVBajNJMnpqdEZNWUFwNHlrNlExM3VSWmhF?=
 =?utf-8?B?eXZyejB3QUVVblg5OWlTd0NaU3ExRUNNa29jQzhJdlM5bmIvNkJML1hIRWxU?=
 =?utf-8?B?b0Vab2xicDdHRzZGRXZHMklBVjlpa3BxVys2Ukl3UW04YVRwNE1xZEV5QXBH?=
 =?utf-8?B?dkFHYnN0TmQ1T2lLeDFoZHBKNWthTlBiZlRjRzUvTlIwUDJIb3F1cnVVLzZV?=
 =?utf-8?B?aGhnZmxmTUlkUWNWZ3BKYStTOFh0VTloMmZxNkUyOXZxdHNwM2pabzdQUDd4?=
 =?utf-8?B?UDloSFg1N0xIUVRBcjVOanBmMnJvc1dGVmNFYWtDd053TnlqUitMVWhFVzNC?=
 =?utf-8?B?S0hjMUpKTmJ6Mk8wOVpBYTNPK3ZSWGdCRWYyNDY2eENZcnN6WnFBY2V6R1JJ?=
 =?utf-8?B?QjVPQ29HVUpkMVhFcW5Pb0FGc0Y0ZmlNdkZoM3U2a1VXT2dCWWtqbnBndDRp?=
 =?utf-8?B?OURDSzNYSkFoVHJlV3Y0MER2WXpBVlBOeVJ5QlRxRWsyckpTcGxHNlZDTEJF?=
 =?utf-8?B?dmh2VFIzVGdwa2tjRHBTaVd3ckNCQXBwMVBQV2crS3FVSTFqeHphRVh1bktP?=
 =?utf-8?B?NkxwTlloZkYvUzQwNVM0R2xQY1dvcFlEUlZjNmFRcGNmZm1teXdvdWE4Wmlv?=
 =?utf-8?B?Mjl1T2ViV09IcFlySkVWV0hyWUF1ZGl3cWRYYmNhRUUyVE4yVnBBTHlISGwr?=
 =?utf-8?B?aHV2OUlqQ2pjTzJjTDhvcHkwTm9BS0VkUHBpR3hMTUZPenFleVlkMnRhUC85?=
 =?utf-8?B?WTBNRU4xU0lFcXFrS1ZKWjUzSUVoK1RweTJSYlRxMHJvM0Q4eGJIQkVlWlhs?=
 =?utf-8?B?VFhrc2dDeXpSOUY4R3VQVGd2VG1SVlE4Yld0Y2hzNi80S0RGNGdwT3Zhaklv?=
 =?utf-8?B?d1UvcFFxSGpudTk1MUQ1c045OGEvRlhENkZlbE9nMUVUaWd1OHBlM1IveWJC?=
 =?utf-8?B?ZVRZR1ZVVWhEZVFZcjU4ZUc3cGM5bXBHRDhlN0t1VjV2Z0JVQ0NhWWhoR0Jm?=
 =?utf-8?B?bmFNakIzSGp4UGNQWG43bEVvR0RaNW1NVmdJbVh2NDFaTGJSSlViR0tQdmRr?=
 =?utf-8?B?cEllN0dQbUhiNzQ5NU5JU1dNTkQvNno0K04vb0FlNXVWVUJYcDk4QnhpQjE1?=
 =?utf-8?B?NzBtNURpd25VZVoyQWNRZTBIU3I0RmQzMHRVZExOVzF4VFBoTHZFOUN2QWRx?=
 =?utf-8?B?TjlLdnJsNFFkMFhYcEZUZVUzdC81N0QvZXVPTXpCRWxUdytTVWtKcXZJb2FB?=
 =?utf-8?B?MHRkNHBwemYwWFp4K0RzOGFGMVpvTUxmK3oxMWN4Ny9teTVUbGxFanZKakRa?=
 =?utf-8?B?NDF0S0hlL00zN0p3aXVJS3pNZ3lacnpVdGRqcmRWcVBxZXV2ZHBoSkRGdXB4?=
 =?utf-8?Q?29hMvpUDnH1km5u/uZAyqQc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f353d29-a364-4a92-bbec-08ddb9c6600e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:13:02.5122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vE3680CBYIGMjiQ8DFjutrO7JWqhyS1JzwPhUB4abOjqsyN1YzYqA2rh9O3zDTFhk3IwgnVC5TcrQexLVz6BYeAVmWuA++ERW8DY0GREe5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
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



On 7/2/2025 9:52 AM, Badal Nilawar wrote:
> Introduce a debug filesystem node to disable late binding fw reload
> during the system or runtime resume. This is intended for situations
> where the late binding fw needs to be loaded from user mode,
> perticularly for validation purpose.
> Note that xe kmd doesn't participate in late binding flow from user
> space. Binary loaded from the userspace will be lost upon entering to
> D3 cold hence user space app need to handle this situation.
>
> v2:
>    - s/(uval == 1) ? true : false/!!uval/ (Daniele)
> v3:
>    - Refine the commit message (Daniele)
>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_debugfs.c            | 41 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       |  3 ++
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 ++
>   3 files changed, 46 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..d1f6f556efa2 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -226,6 +226,44 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
>   	.write = atomic_svm_timeslice_ms_set,
>   };
>   
> +static ssize_t disable_late_binding_show(struct file *f, char __user *ubuf,
> +					 size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_late_bind *late_bind = &xe->late_bind;
> +	char buf[32];
> +	int len;
> +
> +	len = scnprintf(buf, sizeof(buf), "%d\n", late_bind->disable);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
> +					size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_late_bind *late_bind = &xe->late_bind;
> +	u32 uval;
> +	ssize_t ret;
> +
> +	ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
> +	if (ret)
> +		return ret;
> +
> +	if (uval > 1)
> +		return -EINVAL;
> +
> +	late_bind->disable = !!uval;
> +	return size;
> +}
> +
> +static const struct file_operations disable_late_binding_fops = {
> +	.owner = THIS_MODULE,
> +	.read = disable_late_binding_show,
> +	.write = disable_late_binding_set,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -249,6 +287,9 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
>   			    &atomic_svm_timeslice_ms_fops);
>   
> +	debugfs_create_file("disable_late_binding", 0600, root, xe,
> +			    &disable_late_binding_fops);
> +
>   	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>   		man = ttm_manager_type(bdev, mem_type);
>   
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 3fb84d2f0a76..f6acf535bebc 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -158,6 +158,9 @@ int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>   	if (!late_bind->component_added)
>   		return -ENODEV;
>   
> +	if (late_bind->disable)
> +		return 0;
> +
>   	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>   		lbfw = &late_bind->late_bind_fw[fw_id];
>   		if (lbfw->payload) {
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index 0ed98f236f2a..9a7fd07bf122 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -67,6 +67,8 @@ struct xe_late_bind {
>   	struct workqueue_struct *wq;
>   	/** @late_bind.component_added: whether the component has been added */
>   	bool component_added;
> +	/** @late_bind.disable to block late binding reload during pm resume flow*/
> +	bool disable;
>   };
>   
>   #endif

