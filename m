Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A8AB161BF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 15:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4056A10E69F;
	Wed, 30 Jul 2025 13:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqnpNqQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7A110E0C5;
 Wed, 30 Jul 2025 13:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753883196; x=1785419196;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gReCjCXYy80SzIn2muorlZHGjGwHRIltTQQjSWV10cg=;
 b=LqnpNqQziBEniQzeOsX9BT3tbrvzL60dcGmGTCIQ1A5k9O0Ze3UzcpJQ
 iDB+JtghMutDqiMP25ok7P37F8lSrHplkK2tqA5m5w0/wo79akNTwAC2T
 SIbjZvpHxRoEhC4octMNEss4I0MQbUWyJbn2Y65oLCVXVmhghUi91m4iY
 mKsx3Slz2HPhDtBp3CMtVSvIgs9AFtbi/va0xowyhmkLEd71/82e7beZz
 skwmimO70lyK8QGlyIcDOOIQmbZjKwiFbmXhOEYffHND6Rx05LRjHZQ8r
 X8eXJGL0IPL9dccxmbLvCIUy9Lz1PpsKsn+cmbneH8C3pmTbUdhvCnQk3 w==;
X-CSE-ConnectionGUID: 42yj5jraTf+mnQnJ3PbdDQ==
X-CSE-MsgGUID: Drr95+YvS5GubfcJdFXjDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56149424"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56149424"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 06:46:36 -0700
X-CSE-ConnectionGUID: uMXYj/WmQC6qyZd2vEtmMQ==
X-CSE-MsgGUID: bDs0rfzNSwKtHXFgjd8nfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163331887"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 06:46:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 06:46:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 06:46:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 06:46:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGVBhuKkRPuF0WWsZVRLeDX5S7Qu9hSJr/s5qT0zGb1rImdYLNA/ETu0JZupHsbXIY6cUX+Lpv+IXm/fH/z0erR2K0QM8F+/xH3mIDm7/b7Wi7Yop7PFHmOo1fqhDdakgB1pzKqpT2wOhX//R/CEjig2bPYrBK+0qgoDXkRaSe0uFIjNNzsKOEpdWYbfFOgvjG2GeZvwzhf519KAqnAa6HFBF63qv0YzAQPVAku6dy+K2dZ2GahmCcSdbeqWpPygxfu3wKJm135uyLJOdbaepezoC/XtF5wKmtege5DjakMPd7SKdSVcrwB1nqcDTUtCVd4SIFghDk2U2kBZOBdLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lfzZiqEzXc60CbThEla/Wnhn3azp1vdSrJv7a0ElQk=;
 b=cUP2Ge2BcFj3Lhg8hX73ne4uDxFi9u5SwN7CH8TNZAp+Yw+aIKOEc5hb2xOY7fWarSIPkwJ81rVcn0dpPGYmivtUtEa1C1VAUtysPs7ez73QS19y4QmceENQhQdLep5HqKQ9RNR++uRLx1sasu/fXti30Om6oqALVegWWCA1XRBuv4Q4NCyi+M9ihJ0jIIzEjz1+H5cYimaMcRxoyHPROrPObp+M4SK7jQjJm7680f/VTkN4HWaeEcUSIH5lX0oGlu6VceSZMbWT03z/UJdLZCW+ik38i2LUECwPnEcHxsw/HrOmQhu64gDwp1u7bySIqeTs5sLM99VFVnlHChwMQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB6622.namprd11.prod.outlook.com (2603:10b6:a03:478::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 13:45:52 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 13:45:52 +0000
Message-ID: <4c389dd3-e428-4b6f-beec-67bf5a91de97@intel.com>
Date: Wed, 30 Jul 2025 19:15:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm: Define user readable error codes for atomic
 ioctl
To: Biju Das <biju.das.jz@bp.renesas.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "naveen1.kumar@intel.com"
 <naveen1.kumar@intel.com>, "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "uma.shankar@intel.com" <uma.shankar@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>
References: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
 <20250730-atomic-v2-1-cc02ce0263dd@intel.com>
 <TY3PR01MB113461B465C7F642E7DE1A70C8624A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <TY3PR01MB113461B465C7F642E7DE1A70C8624A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::33) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SJ0PR11MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 7658226e-b5c5-4fbd-c651-08ddcf6f65f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGFQUk0zMlZXOWFuNVo0OC91c2lET08xNm91VXoremNaMitqeTlnM2pkcTJj?=
 =?utf-8?B?NmNFL0dpbS9HVE1aWERJcEZBaTQxTTUzY0h0Z3RZUEkzYTNnbFNlV3pkWTdG?=
 =?utf-8?B?dmhsam1kT2NJcjlQTVBTc1c1MzN1eEVQS3FWS3dmWHdBcU54ZU5pb0JQd2hv?=
 =?utf-8?B?Z1M3d1ZiWncrMzAxZlpKN0lOUE5FZ0IwQmIvbGZYdW1jN1BBZE5JMGhKeW5L?=
 =?utf-8?B?REhWSlNQZnV2a3p1NmpjaW4yYUdveXprSCtHMjdRUzNKcWhpWkxCNHFvRXpX?=
 =?utf-8?B?bWdDVGhaODU3YXBQVGE4d29lemlzZ1ZvSjdaaGN0a3QyMU84Y3dqTjBZdkh2?=
 =?utf-8?B?NzNHZXBuS1A4VCtBd1lvcWkwQkMyZERxczBZRFVtTXY3elNYVWZDbU5USTFE?=
 =?utf-8?B?Zm1KbDNJTlpWYXpvNVJOWUR0eHhFUWJBaWFySytBcGd5ZzlGWDJnemlrRnRY?=
 =?utf-8?B?NEQ2VFFYcEZYWjg5a1FveHZJbGllTHArMm56Y0lvZU5uT1cwRU5JL0kwZyti?=
 =?utf-8?B?QVc3RkhJL3VreG5jSDlGZjZYT0dINjBoa25hbXlEcnJIRnJyWFdSS2VXSXAz?=
 =?utf-8?B?Q2hoODd5SkVJb0QvYmFmWWk5NkI3bjlpcS9XMUgxM2E1a1F0QkxCOXc4TFFX?=
 =?utf-8?B?aWUyQlQwbXFkOExYWStLMTY4eXlDUzdpNThKQ29xYXdjaEZ1Mm8rOFpwZWtq?=
 =?utf-8?B?WVpqSVZ1QzdKS2tZSTJtOWMreTdvNmUvK0c3MG9aUGdvMS9WRTBYYmVMeTUv?=
 =?utf-8?B?QTRTNm9xVzRqeDhsWWV3ckZGSHFka0IySmg0Wk1PSkVJeGViYmdvemRuNnNq?=
 =?utf-8?B?Mk9ySWttcnJPcCtMSWlaYUgzVmszM1VKOHdWaUVHZzZNbjk4U2NXbmpHZFhE?=
 =?utf-8?B?OUlNcmhRaTFFbDhZbzZRSm04YTYxanJWSFFWVWh1U05nRGhWQTdMNzFpbFVk?=
 =?utf-8?B?aFl1UHNCdXVKeGJmQk91TmU0T0VwT2Q4WUxCcHExdEZkaTFJdGZrVm1XWDV5?=
 =?utf-8?B?ZlRHMVdwU0RwNzhsRFR2bERVRFVoMXZDSUpySzZjSktlNC9TNlZMYWxwc2xE?=
 =?utf-8?B?NXNOL3AwMkNZbExSanFST1NpQysxN2RwaHV2VzhrUER0Z05KQ241SCtKbktS?=
 =?utf-8?B?QUhsQkwxMnJFOG02elhrV3VIU1Z5VkJxa3crQnIzS1NCRWlOY3Q1WnRZZ0FV?=
 =?utf-8?B?Z3Fnc2s1M1B3d1JlWHpEam1xdVN3dXBZaFZ0Z1FWbWlHMlBuOW94dkQxUVda?=
 =?utf-8?B?THdLQnRWMk04cEpnS05jenNvdVVLSEFwOTBwS056d2xRU0ROa0Fickptd3hz?=
 =?utf-8?B?bjRZYkdoWlJFVWl6Y0ZlbXc0a2RoOXVqaTM0UHJDNUhoOWU4VDgrUUtxcEky?=
 =?utf-8?B?b1V4c1JFcWRsSm41WVNiRmFGcWZxNHdQWS9GNUVzN1NTeWlpeFFZb1F5TDNw?=
 =?utf-8?B?MjRQekw3ZjBjMFFvbkNnMm9JeE5HT2JHUFZLRlFMNnladENaMEREdDZ2UDRz?=
 =?utf-8?B?bEo5MmJEekRaMUdKZjNGQm84NjYwVEQ2YWU4WHpRdnBnQkxpSjN5aDlLdUpJ?=
 =?utf-8?B?SXVzWEVzazg0Sy9LNGQ0ZE9Xd0JmMEJPZWpkYWJRWTN2Z3QrT1dMK0Y4WUZJ?=
 =?utf-8?B?OEllRTBXNHZTTHkrVk55clVJVzMzTTR6b1FkWDlGdkg2UFlBNXB1ckRPMUFh?=
 =?utf-8?B?RDRsZWNoOGhQTGlxS0hKZFY5RzNPbXF4Z0Y2OGtDVjVhcnZ1RHM4RkE0UDNO?=
 =?utf-8?B?U1d5MDRWekRPZTliN21vVW05dEZVSTVISlNOWExGQVY0c0Y5NkFZNkJQMTBh?=
 =?utf-8?B?cnFJOE03QVlUa3ZwdHlOSkpudjFIdVRQZWxOYm9tSHlQOXhiekpNWlFuY2pS?=
 =?utf-8?B?d0EwMVFmWlRnNk9MRm5TN0FKOWx2RWZLcGVUZ0kvdmMzaG5lRkdDVlFkRHRW?=
 =?utf-8?Q?n+gAH2uwJZc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wlptbi9LaXF6aU1SY0VMOHdMQ1N1b1RuMlRFaUNpcXd5OGw1T0ltWVUvdGRa?=
 =?utf-8?B?NWVpTjlrSjNGSUxzYWVCbzVkS2FFLzg5TXl3dUJPVmk5aTRDY0ZlQUdGZk5V?=
 =?utf-8?B?OFcrR1ZkWS9mTzJFT1JJblM1MnlqR2JjbGJzY0syY1M2VUk2MEgxREsyVFAz?=
 =?utf-8?B?ZGRTRkw5QUdMYUlhSVBBc0hLVHk0SWlSa3ZzWDVpclA2NEZlUTA5NHJXNURU?=
 =?utf-8?B?bG1UVkM0N0ZpeENaQ2lyV1VSOStoZjlITkF0WURRcllDc2kyR0dtdEoxL2FX?=
 =?utf-8?B?WDE0ekQrekxHazVRWHdMMmxZYkc0SkhLcU1PeVJ3anFkOXNlTGVwWnZEVHpM?=
 =?utf-8?B?cGFZLy9LajROd2g2cG1aY05ESDFCcFpFZUQvZG9HdmhwYUc1Nno3T1p3K1oz?=
 =?utf-8?B?WE1ZemJmbFVWcDlKNk1UUUl2dFFjejFHdDJ0Q2VnWUpEVUFUOFFjTytYQlZq?=
 =?utf-8?B?VWN2L205ckNSaGp2NDMrN0J2eld0d3hsS1lxU0M5NWZuTk5lQmpKL05aZ2FD?=
 =?utf-8?B?dmdDRXBRakN5YXZzZjhvWXA5cUFGTnRQMnFSeVhqTDlaK0hjS0VrNFFLcHlH?=
 =?utf-8?B?QXF2TXFHaWNqcWpoL0FuWW5JNDc2SGc0cFZqUDg4cDd1NVcralZjTEo0N2hH?=
 =?utf-8?B?VC95c01zdmRzdEpBMU12RWMxam5oS2ZnUFpRSk1uN2Z5TXl6N1BjczgwTlBQ?=
 =?utf-8?B?Ujlsem53TDNITDJvWHpHV2VqTjI1RFd5ck9GQTYwTHN0UmR5SWxpRWs1aXZQ?=
 =?utf-8?B?Qjc4c0oyNmwvanc0SExLanFHb2JXb2JTcjlXRXhPM3UxeDBpY1FlclVHMDFq?=
 =?utf-8?B?dVhzQ05iSFVHNzRvcXZIQmkweXFTQklNWU9kTG45Zlh2SUY1Z2lpYVBzajJn?=
 =?utf-8?B?MTBLeFpnZWh6R1cxQlNnQ1l1S29pU3I4c2NkSXdnZ1hkVDkwanE1SDhRSTNG?=
 =?utf-8?B?eTdWSEtGUU8rckJ0TWFEc1I1djVjbGRKVVhFS2x2eVdsdnFScExXMURLdnRz?=
 =?utf-8?B?WVluNFUwU2x1TVVZMUdDWXNGckNWYnVpYnYwVTR4aDlmMUlYb3U4SnpodkZk?=
 =?utf-8?B?NWYxSGJCYTdtWVpkVWh6TTRMZkVKUWlGVjJYTGduMkhvZllaTHhYYi9yTWxu?=
 =?utf-8?B?Y1I4REdpQm1pSUlPa2N6c1dZb1hML1R6SXJYLzJsQ3dEM1lwc0x3Z0ZEQUFF?=
 =?utf-8?B?ejZqVVhsZWVmblRHem9DZzlOcXh0aW9rYmpvencvUjl3OWFYai8vcEdLVnAx?=
 =?utf-8?B?N3hPUWR2RVJpcFpDMExuNm5vMmtGemZoaHhpeS9kTUhqOGorMlZkSUFMa2FS?=
 =?utf-8?B?dGlvM2pJRVNVbW40R2NMaDhwbUwrajhqejZ1NmtwNG5OaXJ1UkFuQkl1aGxt?=
 =?utf-8?B?bnk4Ris0bGVvZ1lnano1V2VCV1g5dktvYThMa21qaVVsNVBoOG1qN2JDQWhW?=
 =?utf-8?B?MmVtcGVCRXJXbysrSVBuUUkvSFk2N3Znb3d2Tll2M0ZhWi9NbnFSUTUwTlVi?=
 =?utf-8?B?WDhFUnk1QzdMNmEzZHo1cnNoNERCenU1VUJRNTdmb2ZiZ1FsM2oySTJ2ZkU2?=
 =?utf-8?B?d2NzRWhFZGM0WWdoenlmVjJkMmJFb0ptVWxkbE9wSmZYOCtHdUx4U21zQnVa?=
 =?utf-8?B?WVdmek1QQmh0NVM4UFpPSHhkRjdpbUE3NUUrZnFvWVdpR2NFM2lMckdKdHRG?=
 =?utf-8?B?NTdXRVA4VjA5dWprcXhTbUJoQ3Y4VkFSZFBINjc1RXV6dC9kc29vb0gzYzFK?=
 =?utf-8?B?aXV0eklaUUlhaEtVR3Y2U2pwVnpibVcrSkJsQWtFd1MzaUdoaGs5RDhEOWM5?=
 =?utf-8?B?c2VvdE9seGwyYkxoSC91cG9YZld6Y01oNyt3SGxQVFJ3ZXFUdFdWSytoOTA0?=
 =?utf-8?B?VFRONjFTZitwUUJweWEyUURySXBOUitTUkdhdG93a2RzRFJpa0pIaVFIelJ4?=
 =?utf-8?B?NlhjQXorZ2hIbitGTzBPcnRiNlEzMzUrTGxrUXkxM3J6NDZ3aUs4ZmdOSXlo?=
 =?utf-8?B?MlhyWDlnbEhFbVJpVkxiOU1XTWVobXh4R2VoVjhmbjVreHVEZGpMczE3U0hB?=
 =?utf-8?B?cjcwVThoM0FZSW94R1pTaEdjYk8wejExcElrYTdPQjg2c0xTS1dUVzFVUGFm?=
 =?utf-8?Q?QdVevgEizKZWTHyW/P7ilDo4x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7658226e-b5c5-4fbd-c651-08ddcf6f65f9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 13:45:51.9409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MipuQxwrOjkuMkFB1UvOrI4daAGBswVh9QezrTZ6lGTHeBw4wDJzkNu6FyOVNkQ1hr0R69FBm/879v8jIn4ucw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6622
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

On 30-07-2025 16:52, Biju Das wrote:
> Hi Arun,
>
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Arun R Murthy
>> Sent: 30 July 2025 11:17
>> Subject: [PATCH v2 1/4] drm: Define user readable error codes for atomic ioctl
>>
>> There can be multiple reasons for a failure in atomic_ioctl. Most often in these error conditions -
>> EINVAL is returned. User/Compositor would have to blindly take a call on failure of this ioctl so as
>> to use ALLOW_MODESET or any. It would be good if user/compositor gets a readable error code on failure
>> so they can take proper corrections in the next commit.
>> The struct drm_mode_atomic is being passed by the user/compositor which holds the properties for
>> modeset/flip. Reusing the same struct for returning the error code in case of failure can save by
>> creating a new uapi/interface for returning the error code.
>> The element 'reserved' in the struct drm_mode_atomic is used for returning the user readable error
>> code.Its a 64bit variable and should suffice 64 error codes that should be sufficient.
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   include/uapi/drm/drm_mode.h | 40 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h index
>> a122bea2559387576150236e3a88f99c24ad3138..87e8f623bfaaab09135be104db04996f0be4dcb4 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -1157,6 +1157,46 @@ struct drm_mode_destroy_dumb {
>>   		DRM_MODE_ATOMIC_NONBLOCK |\
>>   		DRM_MODE_ATOMIC_ALLOW_MODESET)
>>
>> +/* atomic not set in the drm_file */
>> +#define DRM_MODE_ATOMIC_CAP_NOT_ENABLED			BIT(0)
>> +/* atomic flag passed not in DRM_MODE_ATOMIC_FLAGS list */
>> +#define DRM_MODE_ATOMIC_INVALID_FLAG			BIT(1)
>> +/* DRM_MODE_PAGE_FLIP_LEGACY not supported with atomic ioctl  */
>> +#define DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC			BIT(2)
>> +/* flip event with atomic check only not supported */
>> +#define DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY	BIT(3)
>> +/* atomic property change requested need full crtc modeset */
>> +#define DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET		BIT(4)
>> +/* atomic property change requested has impact on all connected crtc */
>> +#define DRM_MODE_ATOMIC_NEED_FULL_MODESET		BIT(5)
>> +/* async flip supported on only primary plane */
>> +#define DRM_MODE_ATOMIC_ASYNC_NOT_PRIMARY		BIT(6)
>> +/* modifier not supported by async flip */
>> +#define DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED	BIT(7)
>> +/* async flip with pipe joiner not allowed */
>> +#define DRM_MODE_ATOMIC_ASYNC_PIPEJOINER_NOTALLOWED	BIT(8)
> For consistency, NOTALLOWED->NOT_ALLOWED ??

Sure, will get it correct!

Thanks and Regards,
Arun R Murthy
--------------------

