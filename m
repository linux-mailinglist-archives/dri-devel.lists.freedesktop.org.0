Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50094D9CF
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 03:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F03C10EA51;
	Sat, 10 Aug 2024 01:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5sJfF+c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582E610EA51
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 01:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723253391; x=1754789391;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kXnXfiWjh0v9Q1CB0mZkk5oRmxfSm/orkXmhgUGwBRU=;
 b=J5sJfF+cbNMT8dE06W3u4GLXZtrt74SDyq0zRq2tVNB/NNsrvDJH6mVH
 Y5suM4L17ty6OArE3/4HnYEFgjQWeREwgiJ9Yqb0a0CtRfG6tcC/TQv5k
 OO81sMtV7ngQ7+EeNyppFNvL2HtmmPyrrgMGo8H1xTLM8ZJ65r+ZFp3+0
 tNO9iybD610bhD4UDMaopxznOfv8C+a10daWLqtn5FpUO06vti3zvTDoW
 dXEaKwUN0+47vfwJG4fwvnnMo02JhZZ/DbW/dtsBG5dR1eNko586Ckbcc
 6P6/gTAWwnudY+jJHW5Z9DemvuT76m7q7REfIfCE1tm/C3yOOVCbVBppG g==;
X-CSE-ConnectionGUID: IBIBDzK8SY+N0L0AqtXfcg==
X-CSE-MsgGUID: CN9gbJw6S8yeNj7jLr5Bxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="38947014"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="38947014"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:29:50 -0700
X-CSE-ConnectionGUID: FB2AdJuwTtubSPdBMnVUEw==
X-CSE-MsgGUID: /BEQ4SQHTsGNDTriuMYD2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="57620867"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 18:29:49 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 18:29:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 18:29:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 18:29:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVa/YwSoY+k9529LpAW3fUKEMu3ygkYKzZcjAYHkuGi3gtT4ZBLRzQT3aoCC4XAsebz88tkUijoh3A8ZnQMWmCKvyfP6aqS5BR2b4YVukmD51nxdaFJpw0Yh8CrOt+PkiFuTIfiXHwyVFyTkDqIfZmI4cSbiSbDsOqoNBYNCroer5cetTIIdiYxKXnfZfZpMWNklynbnRO/dU4p4j8uYH/037+EQDyar+sEY8Wz87ePpq5Imo8CB4yIP/UHb8947y1mPsNzZKaiqsJltyl75gD6wbHHkcI2/4+GXSJgIt+WAHItGHS/R4+TCbNP7KN9tBoBN5O1AI+QefRMpNahYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXnXfiWjh0v9Q1CB0mZkk5oRmxfSm/orkXmhgUGwBRU=;
 b=CJrFva8lJhqfuXIE0Y/A7JjwmU88/xIiLfXEbTWoWIWxFxm+uFTlYYA1v7X4V2daxBED0gZ8XkdxRLJcA/GiUHc2RRUvWCPeidzAsxag6r6fUlty8dTWJqJMX/xJuvZ8h2xO5bkkHgqpRDx20BHMCpIWrsba7jmCQyFerZk7eZ6aqDxo72X9iTw/nX9wg8ZBWErdFBKbH/EVJHbIuSXmCnhvgGRVd4YFIrWnoeYJhWx4bTgXEDcJVbvHse26wUl9CdMyv9sUu25Fx2kFw8x5eOsknh69aUFh4JDfa9T0OxjiWqEeXUZCzWYS11VXSUv4iDUq924WvzBBncuT1WaMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH0PR11MB5299.namprd11.prod.outlook.com (2603:10b6:610:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Sat, 10 Aug
 2024 01:29:47 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.7828.023; Sat, 10 Aug 2024
 01:29:47 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v2 2/4] udmabuf: change folios array from kmalloc to
 kvmalloc
Thread-Topic: [PATCH v2 2/4] udmabuf: change folios array from kmalloc to
 kvmalloc
Thread-Index: AQHa5udGKhZLHRqBDEmKKYNs7PX4S7IeGGTg
Date: Sat, 10 Aug 2024 01:29:46 +0000
Message-ID: <IA0PR11MB7185DFA89A4A2058F4B336DBF8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240805032550.3912454-1-link@vivo.com>
 <20240805032550.3912454-3-link@vivo.com>
In-Reply-To: <20240805032550.3912454-3-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH0PR11MB5299:EE_
x-ms-office365-filtering-correlation-id: 4b25d8a6-f1e8-4ed0-428c-08dcb8dbeba3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UGVzWmljNk5FV2x2Sjh0cUw1ZGZmR3lnMDV4TDVvWW4yZUg3SlQvVUQ5UjIr?=
 =?utf-8?B?aTl0dlN5M0lLTm1SaHVvbkJkMXhyUW1hMytDQW1Ja2Qzb3NqcFZZYS8vS2hM?=
 =?utf-8?B?VGZSWGlZdnB4VFhUQ09ZQU55T1VSMkJ0akhnVE1Jb2RlVjduZ2p3R1ZrblFJ?=
 =?utf-8?B?VkNUcWZkMEJxOE9KRGJCSXBucEw4S0NMb0oxaWpJcmFGK3FoNHo0b0NEL1NG?=
 =?utf-8?B?V2QxOGtHcWtYNzBVSHFDRnlOU1pXVkpPaS9NcDYzQlUyZkFYeDZjR1V6dkxs?=
 =?utf-8?B?TU5qTFkwMG1EcDBpMkJXL090K2JEcHNJeUhJQjVqSld5TDRjVms4UmhyaE5E?=
 =?utf-8?B?S25odTlxMVlhY293b205TUxVY3VMdnhBU2tta1pOeTNQMkp4QlVtSm9VZlJa?=
 =?utf-8?B?dUxYTU1yazlBS1FiTHVNd2t4ME81VWVIaHNRckxsUkVNWDdSWTRtSWlxcEdn?=
 =?utf-8?B?VitmWEJOeDYxNGlkRHhaNnRxanJ2VXFNNURMbjg1OTBiOGlaRHlDWEk1L3hK?=
 =?utf-8?B?SWdPM1BVT011MEc3OExIS0FtZ3V1TEV3QkNUSmZXZ1RQeXJPb3UyUmVJNUpC?=
 =?utf-8?B?bndOSjVlV1k5bjNTa2FZamVNOW82aStqRXhaSG9NeFZwSWRXSkpyaDRtSzFa?=
 =?utf-8?B?UjFEdWdhbDBGUGdId3dPaGFKM1Y0MWl5SGFrU29iQVh6MXc1ZjVsRG03cmRt?=
 =?utf-8?B?MWZwUGpPNlhwNlc2akRhdjczaVpteWxzKys2cDR3VjFzL29SZUtqaXZhSlZ2?=
 =?utf-8?B?Q3JxVmpmVFlOTWNMKzZwSzU4NEJybWhkb0I5QVRHYkZzTkZ4T1VNcW4rTzFT?=
 =?utf-8?B?UUtjWXdEdTd4RG5RaFBKajVhK3NhWkdDUWxlcFArM2x4NDBDUVpmTVA3RjlM?=
 =?utf-8?B?NGRyQTlJMkp3OWlzdHFIRElGSllKWDFWU3dXNks2WlZWeUg5aGUxckI3U3g0?=
 =?utf-8?B?OWFiMmkxcGNMbmpwMVpTNWNWN2pUSEtoTGFtU0Z3RzlaWHZmS2VELzhJOG9n?=
 =?utf-8?B?Z0dBR0I5ZyttWjJtMEtHbXBJbmt1YUN2TGZIdnMraFRXSUJGdVlid0tHcVhE?=
 =?utf-8?B?em9KaVM0NUU5SGh3VUlZQ2p1TWErSG1MU1RBMmh5eEh4aFk5QUpwa3I4K2dQ?=
 =?utf-8?B?TEg4SVRoYk1HSExDcC93dkJBcm5ER3Q5VTh0K0lKVUxEc2FUVExEdzNUU3VL?=
 =?utf-8?B?ZklnM1c2WkFuYnlIaEIwWkVnV3NjWWx4TU1HakhodDNFUE45SzVzTjYxcnhm?=
 =?utf-8?B?Q0tCT1kycmQ4dEJLTVVuRWw5TkZydU9EakZOVE9hM0l5bGQvVWpuSVhmWW1z?=
 =?utf-8?B?dTQ2Qy9NT2dLanRBSmJuL2RaSHpoZklJdUZyd2w5RXE5aE53cGpsbkJwNURz?=
 =?utf-8?B?cUVOWHg3dWcvbkpLM0E2ZXJXRVA2YmxUbjVEUG44bTdsMHJ6dWU1TDNDZGN6?=
 =?utf-8?B?NTNkNm1YMmV3M0lLcUI0bFNxTUd0bmc1anNScDJYUU1pbmYvSHVod05RZjBk?=
 =?utf-8?B?Zk85T0puWjk1YVhvSDJZaENjZWdvQWd1OGJtRUxZblU1cGNQUmF2SDM3Rktk?=
 =?utf-8?B?S2g2bGNxR2I3enVmcHZmUUw2ZlBPb3lNTUZtRUJwUkNURVZacnJ5bHdkUHBW?=
 =?utf-8?B?Y2hXL2ZkRDE3VkRUOExkRW8rNzRuYWZVa1lCZ2tMNW5UMUN6b3d2YXRLZ3Bp?=
 =?utf-8?B?aWM4eHlnTXpUcFZYWlpoWHRNSG0xZHV5ay83SGxEZ1laNGlqWENwakRZSWN6?=
 =?utf-8?B?bzRMV0hia0JsQlI5MVFabTJ3OTlsWThEOHl4ZkpTcnBkcTNtK2tiSXovMlJJ?=
 =?utf-8?B?Q1ZFQnE1bEZidDc1VHhmcWZFK0xDVGdRcnNwZ0VvZXVPb3p3dlFyVHJkK2F0?=
 =?utf-8?B?bnRwWXZjcjZPNEN4S2tGaHo4YUNXZHhXV2RINmtVUGg1aGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDRZZllXVFJvZlB3akFvS0lJWStGUy84VGx3L0w5VnNmNElOek50UE9lZWsw?=
 =?utf-8?B?UVRHUUZFYW1DQThZTnE1dzd6NzFGOVNidytMV01xaVpCUjFCVDZORW9aOFJ0?=
 =?utf-8?B?NlFNaVMyeXhkdXVncmFGRktYUGtvUU42SUNvWVJvbFlGWUZKUnlTYjgrVkhX?=
 =?utf-8?B?WVZlNlkrbXY4S0NiVHNPdGVrK3Q3TWhLY2dCOHQ1WEU5MHNPTFFjdEhMdVM1?=
 =?utf-8?B?aWhlVithdlBzUUVSUUdCR1FpYVdyckpFZE42QzFKdUN4RUxnOTROblZhWnNV?=
 =?utf-8?B?YUtOOUxURktmSnMvbWEydnRVYnk5d3daSm1mSk5SeXNvNWJ5V0xudGVPN2Jr?=
 =?utf-8?B?cmwxVlZoTXg0eFdJOTJ6cDBiUC9FeG44aCt0R3phMGdXMHFoSGV0U0xWTGRq?=
 =?utf-8?B?eDE1MG9QanI5T3dTMXlBaTJQZi9FaW0zOVU3amxneThqTEY0bjFBdUpLVHF6?=
 =?utf-8?B?UC9qN3BBTm84amowNGRpMnV0VHI3NVJpQ21SNCtjNElZWmhqMGlzU3pqMEFT?=
 =?utf-8?B?ZEhFSDRlRWo3TFhOMmxVd1VSZFNVWGd6TE9ndmtzTGZhVFRJS1VDanRrWFV1?=
 =?utf-8?B?MnVJNkZmU05MVk5LQWpBZXZDai9mQXJzdTMzOWdOV2svL2FoMnBOWklQOW9z?=
 =?utf-8?B?SWFGSjhpRWdDYVhINFRrakUrNW1kUGZ2dUY4aVZQeVNYMTZMdVI4dWpDMWJz?=
 =?utf-8?B?a2RIVStwZjMrVUs2UlhVeE41L1I2ZVBVSjRFS0ZseUxkMm93emdKZ3lEYVVX?=
 =?utf-8?B?d3hETjNpRHJ0eGpZN2Frd1d4bEtZQ0FVZGRVSVRaTXhWMGFXRUlFbUQrbStS?=
 =?utf-8?B?UVBWYW52ZG41bzZITFo5c2NzaHc1d1VacXBCSXhoYmh4MXQza1YxM21mekU5?=
 =?utf-8?B?ZWN6VmJlWXpabkNnY1lHbnJVdGprMHpxMVhwTDhPWWoxUTFHanVXUCtNNFJH?=
 =?utf-8?B?OCt2ODBTVU94VWUya25mTnd0ajZIZ2hZd1NQck42VUlMU05CcW9EZ2YzRW9W?=
 =?utf-8?B?cUE1dmhzLzk3amhnWWh1dkd2Rng1akVjbnVrV251NVVNWkJWRENjdS9HL1VM?=
 =?utf-8?B?c2c5c015WkJzZEFKcWkycW90SVFHaUUvWTVBV2xxMHBvckxRRzFvK2NRSExI?=
 =?utf-8?B?MzY3L0dFRXpXY3RlMWlBZEozcFhpZUZOSjNQeFNacVhnM1pEZXhwdjJHKzJ0?=
 =?utf-8?B?UnhuaHR5RVV6YjU0MTRqeER3SFFPNmljZE9jSGJVQ3A2eWJYYm1lZGEzcnJL?=
 =?utf-8?B?bm10QzhNbVlpdVBEZVhwQWRYV2tUcHQ0QjlkemxBU28rdDZ3c3lvUDlVdU9s?=
 =?utf-8?B?cVA4UzE5ckY1VmdyTHl2cGN0MUFDNTNlN0tYamxOYUJKNlFTNHpZSHBqOTN5?=
 =?utf-8?B?cTJCbmR0cnAwRmozYzI2V2hxOUJkQnBFbWtBWFpPQ2N5YVBHQklNNmxrbWFC?=
 =?utf-8?B?elhQWmkvVUpDZVdCVHZraVU2Z1o4TUZ4ZWI5VVJ5WnhUODdvejk4aXZzN1Fl?=
 =?utf-8?B?ZnM3MURiY0UrNGgvUlNtNFplN3dLbzJGd0lGcWMwL25NMVZCWXBSWlQxTDFD?=
 =?utf-8?B?NStlQmNqSnJVSGF1T1hYN0UrbGJoZnFlaHgxeUw4MFZ5S1U1bHlRRzRuN0U4?=
 =?utf-8?B?MUthY3NiTGVtZXBCaDdQS3ArWDRoakxOMlZqYnF2L1pmVDJSRXJJbGEvbExh?=
 =?utf-8?B?a3ZIaWwvaGVpOTFSd2k1T08rQldmK05vaDlmaXkrUTErMGhEcCtaWHhXUVZ1?=
 =?utf-8?B?N2FBMnhIRnRsK01UeUsvd0tGN1kxNUJ0bVlxTmF5MkhlZFp0bDgzNmhUVURN?=
 =?utf-8?B?cHFSZHhkNHJ4NkVGQ2pUZHVWSW03L2o2ME1vODZwa2NYanA0bjY1TEdUbU5M?=
 =?utf-8?B?L0R4V05DaHQ2WEI2YlA3MUJxdFZOZnNGOGplbExueURvb2VIK05oTEw1akVQ?=
 =?utf-8?B?MTRWZk9aTE1lZEVubXcxby92eGNzcE1ZQjBJSW1XS0twcVhBM09SS1JDa0Vn?=
 =?utf-8?B?aTBIUXdCSkt0Z1REdXhZUFV2bkhhVWg3SERjNHJLOTlQWDJYejRCNC8wbWRV?=
 =?utf-8?B?OXVMUzlQOHhlVlVHckJwY3dUUFM3a2xZb1dFWDlFRmxGZWFPbENIZ1JaZ0E2?=
 =?utf-8?Q?4Yr2S9XElaTOAjQE6cmQzQFMK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b25d8a6-f1e8-4ed0-428c-08dcb8dbeba3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 01:29:46.9838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oIe1PxEvJRyHBAdaCqr3+q+BCe5f5c9y6z284SGa6uJAp4UWg2O0OzgHmsBKvYmwyY7bGNYzmnBmKyGaYvK2I1qn2xfLO1FHeZZY/g6RDU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5299
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

SGkgSHVhbiwNCg0KPiANCj4gV2hlbiBQQUdFX1NJWkUgNDA5NiwgTUFYX1BBR0VfT1JERVIgMTAs
IDY0Yml0IG1hY2hpbmUsDQo+IHBhZ2VfYWxsb2Mgb25seSBzdXBwb3J0IDRNQi4NCj4gSWYgYWJv
dmUgdGhpcywgdHJpZ2dlciB0aGlzIHdhcm4gYW5kIHJldHVybiBOVUxMLg0KPiANCj4gdWRtYWJ1
ZiBjYW4gY2hhbmdlIHNpemUgbGltaXQsIGlmIGNoYW5nZSBpdCB0byAzMDcyKDNHQiksIGFuZCB0
aGVuIGFsbG9jDQo+IDNHQiB1ZG1hYnVmLCB3aWxsIGZhaWwgY3JlYXRlLg0KPiANCj4gWyA0MDgw
Ljg3NjU4MV0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+IFsgNDA4MC44
NzY4NDNdIFdBUk5JTkc6IENQVTogMyBQSUQ6IDIwMTUgYXQgbW0vcGFnZV9hbGxvYy5jOjQ1NTYN
Cj4gX19hbGxvY19wYWdlcysweDJjOC8weDM1MA0KPiBbIDQwODAuODc4ODM5XSBSSVA6IDAwMTA6
X19hbGxvY19wYWdlcysweDJjOC8weDM1MA0KPiBbIDQwODAuODc5NDcwXSBDYWxsIFRyYWNlOg0K
PiBbIDQwODAuODc5NDczXSAgPFRBU0s+DQo+IFsgNDA4MC44Nzk0NzNdICA/IF9fYWxsb2NfcGFn
ZXMrMHgyYzgvMHgzNTANCj4gWyA0MDgwLjg3OTQ3NV0gID8gX193YXJuLmNvbGQrMHg4ZS8weGU4
DQo+IFsgNDA4MC44ODA2NDddICA/IF9fYWxsb2NfcGFnZXMrMHgyYzgvMHgzNTANCj4gWyA0MDgw
Ljg4MDkwOV0gID8gcmVwb3J0X2J1ZysweGZmLzB4MTQwDQo+IFsgNDA4MC44ODExNzVdICA/IGhh
bmRsZV9idWcrMHgzYy8weDgwDQo+IFsgNDA4MC44ODE1NTZdICA/IGV4Y19pbnZhbGlkX29wKzB4
MTcvMHg3MA0KPiBbIDQwODAuODgxNTU5XSAgPyBhc21fZXhjX2ludmFsaWRfb3ArMHgxYS8weDIw
DQo+IFsgNDA4MC44ODIwNzddICA/IHVkbWFidWZfY3JlYXRlKzB4MTMxLzB4NDAwDQo+IA0KPiBC
ZWNhdXNlIE1BWF9QQUdFX09SREVSLCBrbWFsbG9jIGNhbiBtYXggYWxsb2MgNDA5NiAqICgxIDw8
IDEwKSwgNE1CDQo+IG1lbW9yeSwgZWFjaCBhcnJheSBlbnRyeSBpcyBwb2ludGVyKDhieXRlKSwg
c28gY2FuIHNhdmUgNTI0Mjg4IHBhZ2VzKDJHQikuDQo+IA0KPiBGdXJ0aGVyIG1vcmUsIGNvc3Rs
eSBvcmRlcihvcmRlciAzKSBtYXkgbm90IGJlIGd1YXJhbnRlZWQgdGhhdCBpdCBjYW4gYmUNCj4g
YXBwbGllZCBmb3IsIGR1ZSB0byBmcmFnbWVudGF0aW9uLg0KPiANCj4gVGhpcyBwYXRjaCBjaGFu
Z2UgdWRtYWJ1ZiBhcnJheSB1c2Uga3ZtYWxsb2NfYXJyYXksIHRoaXMgY2FuIGZhbGxiYWNrDQo+
IGFsbG9jIGludG8gdm1hbGxvYywgd2hpY2ggY2FuIGd1YXJhbnRlZSBhbGxvY2F0aW9uIGZvciBh
bnkgc2l6ZSBhbmQgZG9lcw0KPiBub3QgYWZmZWN0IHRoZSBwZXJmb3JtYW5jZSBvZiBrbWFsbG9j
IGFsbG9jYXRpb25zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSHVhbiBZYW5nIDxsaW5rQHZpdm8u
Y29tPg0KPiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgfCAyNiArKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEz
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVm
LmMgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jDQo+IGluZGV4IDQ3NTI2OGQ0ZWJiMS4uYWYy
MzkxY2VhMGJmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jDQo+ICsr
KyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMNCj4gQEAgLTczLDcgKzczLDcgQEAgc3RhdGlj
IGludCB2bWFwX3VkbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1Ziwgc3RydWN0DQo+IGlvc3lzX21h
cCAqbWFwKQ0KPiANCj4gIAlkbWFfcmVzdl9hc3NlcnRfaGVsZChidWYtPnJlc3YpOw0KPiANCj4g
LQlwYWdlcyA9IGttYWxsb2NfYXJyYXkodWJ1Zi0+cGFnZWNvdW50LCBzaXplb2YoKnBhZ2VzKSwN
Cj4gR0ZQX0tFUk5FTCk7DQo+ICsJcGFnZXMgPSBrdm1hbGxvY19hcnJheSh1YnVmLT5wYWdlY291
bnQsIHNpemVvZigqcGFnZXMpLA0KPiBHRlBfS0VSTkVMKTsNCj4gIAlpZiAoIXBhZ2VzKQ0KPiAg
CQlyZXR1cm4gLUVOT01FTTsNCj4gDQo+IEBAIC04MSw3ICs4MSw3IEBAIHN0YXRpYyBpbnQgdm1h
cF91ZG1hYnVmKHN0cnVjdCBkbWFfYnVmICpidWYsIHN0cnVjdA0KPiBpb3N5c19tYXAgKm1hcCkN
Cj4gIAkJcGFnZXNbcGddID0gJnVidWYtPmZvbGlvc1twZ10tPnBhZ2U7DQo+IA0KPiAgCXZhZGRy
ID0gdm1fbWFwX3JhbShwYWdlcywgdWJ1Zi0+cGFnZWNvdW50LCAtMSk7DQo+IC0Ja2ZyZWUocGFn
ZXMpOw0KPiArCWt2ZnJlZShwYWdlcyk7DQo+ICAJaWYgKCF2YWRkcikNCj4gIAkJcmV0dXJuIC1F
SU5WQUw7DQo+IA0KPiBAQCAtMTg5LDggKzE4OSw4IEBAIHN0YXRpYyB2b2lkIHJlbGVhc2VfdWRt
YWJ1ZihzdHJ1Y3QgZG1hX2J1ZiAqYnVmKQ0KPiAgCQlwdXRfc2dfdGFibGUoZGV2LCB1YnVmLT5z
ZywgRE1BX0JJRElSRUNUSU9OQUwpOw0KPiANCj4gIAl1bnBpbl9hbGxfZm9saW9zKCZ1YnVmLT51
bnBpbl9saXN0KTsNCj4gLQlrZnJlZSh1YnVmLT5vZmZzZXRzKTsNCj4gLQlrZnJlZSh1YnVmLT5m
b2xpb3MpOw0KPiArCWt2ZnJlZSh1YnVmLT5vZmZzZXRzKTsNCj4gKwlrdmZyZWUodWJ1Zi0+Zm9s
aW9zKTsNCj4gIAlrZnJlZSh1YnVmKTsNCj4gIH0NCj4gDQo+IEBAIC0zMTUsMTQgKzMxNSwxNCBA
QCBzdGF0aWMgbG9uZyB1ZG1hYnVmX2NyZWF0ZShzdHJ1Y3QgbWlzY2RldmljZQ0KPiAqZGV2aWNl
LA0KPiAgCWlmICghdWJ1Zi0+cGFnZWNvdW50KQ0KPiAgCQlnb3RvIGVycjsNCj4gDQo+IC0JdWJ1
Zi0+Zm9saW9zID0ga21hbGxvY19hcnJheSh1YnVmLT5wYWdlY291bnQsIHNpemVvZigqdWJ1Zi0+
Zm9saW9zKSwNCj4gLQkJCQkgICAgR0ZQX0tFUk5FTCk7DQo+ICsJdWJ1Zi0+Zm9saW9zID0ga3Zt
YWxsb2NfYXJyYXkodWJ1Zi0+cGFnZWNvdW50LCBzaXplb2YoKnVidWYtDQo+ID5mb2xpb3MpLA0K
PiArCQkJCSAgICAgIEdGUF9LRVJORUwpOw0KPiAgCWlmICghdWJ1Zi0+Zm9saW9zKSB7DQo+ICAJ
CXJldCA9IC1FTk9NRU07DQo+ICAJCWdvdG8gZXJyOw0KPiAgCX0NCj4gLQl1YnVmLT5vZmZzZXRz
ID0ga2NhbGxvYyh1YnVmLT5wYWdlY291bnQsIHNpemVvZigqdWJ1Zi0+b2Zmc2V0cyksDQo+IC0J
CQkJR0ZQX0tFUk5FTCk7DQo+ICsJdWJ1Zi0+b2Zmc2V0cyA9DQo+ICsJCWt2Y2FsbG9jKHVidWYt
PnBhZ2Vjb3VudCwgc2l6ZW9mKCp1YnVmLT5vZmZzZXRzKSwNCk5vIHN0cm9uZyBvcGluaW9uLCBi
dXQgSSdkIHByZWZlciB0byBrZWVwIHRoZSBrdmNhbGxvYyBvbiB0aGUgc2FtZSBsaW5lLg0KUmVn
YXJkbGVzcywNCg0KQWNrZWQtYnk6IFZpdmVrIEthc2lyZWRkeSA8dml2ZWsua2FzaXJlZGR5QGlu
dGVsLmNvbT4NCg0KPiBHRlBfS0VSTkVMKTsNCj4gIAlpZiAoIXVidWYtPm9mZnNldHMpIHsNCj4g
IAkJcmV0ID0gLUVOT01FTTsNCj4gIAkJZ290byBlcnI7DQo+IEBAIC0zMzYsNyArMzM2LDcgQEAg
c3RhdGljIGxvbmcgdWRtYWJ1Zl9jcmVhdGUoc3RydWN0IG1pc2NkZXZpY2UNCj4gKmRldmljZSwN
Cj4gIAkJCWdvdG8gZXJyOw0KPiANCj4gIAkJcGdjbnQgPSBsaXN0W2ldLnNpemUgPj4gUEFHRV9T
SElGVDsNCj4gLQkJZm9saW9zID0ga21hbGxvY19hcnJheShwZ2NudCwgc2l6ZW9mKCpmb2xpb3Mp
LCBHRlBfS0VSTkVMKTsNCj4gKwkJZm9saW9zID0ga3ZtYWxsb2NfYXJyYXkocGdjbnQsIHNpemVv
ZigqZm9saW9zKSwgR0ZQX0tFUk5FTCk7DQo+ICAJCWlmICghZm9saW9zKSB7DQo+ICAJCQlyZXQg
PSAtRU5PTUVNOw0KPiAgCQkJZ290byBlcnI7DQo+IEBAIC0zNDYsNyArMzQ2LDcgQEAgc3RhdGlj
IGxvbmcgdWRtYWJ1Zl9jcmVhdGUoc3RydWN0IG1pc2NkZXZpY2UNCj4gKmRldmljZSwNCj4gIAkJ
cmV0ID0gbWVtZmRfcGluX2ZvbGlvcyhtZW1mZCwgbGlzdFtpXS5vZmZzZXQsIGVuZCwNCj4gIAkJ
CQkgICAgICAgZm9saW9zLCBwZ2NudCwgJnBnb2ZmKTsNCj4gIAkJaWYgKHJldCA8PSAwKSB7DQo+
IC0JCQlrZnJlZShmb2xpb3MpOw0KPiArCQkJa3ZmcmVlKGZvbGlvcyk7DQo+ICAJCQlpZiAoIXJl
dCkNCj4gIAkJCQlyZXQgPSAtRUlOVkFMOw0KPiAgCQkJZ290byBlcnI7DQo+IEBAIC0zNzUsNyAr
Mzc1LDcgQEAgc3RhdGljIGxvbmcgdWRtYWJ1Zl9jcmVhdGUoc3RydWN0IG1pc2NkZXZpY2UNCj4g
KmRldmljZSwNCj4gIAkJCX0NCj4gIAkJfQ0KPiANCj4gLQkJa2ZyZWUoZm9saW9zKTsNCj4gKwkJ
a3ZmcmVlKGZvbGlvcyk7DQo+ICAJCWZwdXQobWVtZmQpOw0KPiAgCQltZW1mZCA9IE5VTEw7DQo+
ICAJfQ0KPiBAQCAtMzkxLDggKzM5MSw4IEBAIHN0YXRpYyBsb25nIHVkbWFidWZfY3JlYXRlKHN0
cnVjdCBtaXNjZGV2aWNlDQo+ICpkZXZpY2UsDQo+ICAJaWYgKG1lbWZkKQ0KPiAgCQlmcHV0KG1l
bWZkKTsNCj4gIAl1bnBpbl9hbGxfZm9saW9zKCZ1YnVmLT51bnBpbl9saXN0KTsNCj4gLQlrZnJl
ZSh1YnVmLT5vZmZzZXRzKTsNCj4gLQlrZnJlZSh1YnVmLT5mb2xpb3MpOw0KPiArCWt2ZnJlZSh1
YnVmLT5vZmZzZXRzKTsNCj4gKwlrdmZyZWUodWJ1Zi0+Zm9saW9zKTsNCj4gIAlrZnJlZSh1YnVm
KTsNCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiAtLQ0KPiAyLjQ1LjINCg0K
