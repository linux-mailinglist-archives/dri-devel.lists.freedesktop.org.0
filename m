Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C8EC406DD
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B980F10EAED;
	Fri,  7 Nov 2025 14:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7Ktygd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A654F10EAEA;
 Fri,  7 Nov 2025 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762527091; x=1794063091;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+eQQvhm2Jh61GN0LQb6lu+Z+aVIH/QqKxAQMEzWHzc4=;
 b=Y7Ktygd4AVDxO/4om1FzBL9y10FZ71jh8sEtYAWCstiodg6sKsJpK8qr
 RYiifK1P8c7unTq4uExQprQYHVXSXayXw1EBmIf71eStovnaRIWXKxMBc
 C3A+ZLODefdS7qucZ54YqaO5CO4Yc+JqVg27+zukd63LUcOe5LZreT/CN
 wKHivZWTm4mjKLCJxey6k3ydqBW4udm30mNnFLG0YP2PQ/I5klWWA0NGo
 sutIc5uKZyq9NtXkU5numdrUh40ETcE88VkJWEP97PSSeJJU82IPRbkOw
 uBRN7/7d9CKZjqp0wTl60Gn3BOgxGsm5a6/y691zzGJF54v8ic1oCDHxU A==;
X-CSE-ConnectionGUID: n3emNon/QC+I5LCB3Q9kmA==
X-CSE-MsgGUID: Fba5zPx/SUGAsGH79m0ksg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="76028150"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="76028150"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 06:51:30 -0800
X-CSE-ConnectionGUID: U2lgqwZ3Tyq52wSDE+oCNQ==
X-CSE-MsgGUID: 0gk0jD/TQeugP0Na/PhXjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193082353"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 06:51:30 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 06:51:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 06:51:29 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 06:51:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6b8lSOeatwU6vow44iv+uOFFXxVMPzplTm9S22SDvsoA8Pd32FEwHpgT3J4waBF9vzzLWPkl2ddDXtrJfEePzmkuwNItXB9BLXRVQo/+nqtaonYly71Cn94kjF11ZCN3YLq7CYAYAoyHdesQ+QAwtvxv5MLdwAAorkdid3W9Eq9IuiWsfCJTPpt6/7r3FgQiqZzo7YI6mGC3KCWTJQRrIBblhoF+HYRgBgmhy/3Fwu+A3HiZPefq73z/xJTgucmK+DQGAY65fu10wiW2iq3zqK+0urfaxbBPZFTgaHhOR1gs7CZsGeJH9zxFHD04HYFeZ640NUA/wwvBmsO1uSX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eQQvhm2Jh61GN0LQb6lu+Z+aVIH/QqKxAQMEzWHzc4=;
 b=HF13emKKCoSr9Wsf1llaxrzmodxvrcNqza20R5VEegcZT7xCCJC7PxQ1SNRH/PQKwM8MbqcjZot2YMqbPOO90SQq7VUnlP/KOhceNQB/XfNRZUoyipwDr9L+2FTtRzl2gblT5nUzh+NpOEnEfhALfxxUIgbMXguVXPwAqUyDinsRNmNWDAo6KwCHXewKPnc9KVSRjsUbcPP6/NtK+0tlK01XKUB/sWKuBDCjtL26t4fn5jOGhQbSCBvNWGi+RCsvrbLkywe8zNgUpK8k3xdEr5k++8zZXevI6M5eVP3k8AU3NUvqp4TPllXiMSlshrPoJNddhs+YNdnmIhRG2/v+4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7210.namprd11.prod.outlook.com (2603:10b6:208:440::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 14:51:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 14:51:26 +0000
Date: Fri, 7 Nov 2025 08:51:21 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 27/28] drm/intel/bmg: Allow device ID usage with
 single-argument macros
Message-ID: <gzyqk3aihcic6l6i5rzgup3xbbhl7e5nzzdcgig3so3o2x7cyh@up4sodo4yz4b>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
 <20251105151027.540712-28-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105151027.540712-28-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 372c287b-e77c-471b-8b2c-08de1e0d2023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWFnbzBOMTZ0T1lDU1RwK2djNkZWWExDUmRBdURibklGM25ndlhCQmVZZjll?=
 =?utf-8?B?b1hvMXBEbjhmV3VDMHZGclo1R0paOWM0dkM1aFFEMzdUelhMWEc2ZEt5aC9T?=
 =?utf-8?B?OUE3Tzd0amxMTkQrQTdoU1RtUFdVMDhpYmtRbXNwRHJnc3NSMGNoam9KRUwz?=
 =?utf-8?B?NjNZVmN0d3ZBWDROaFhCOEtZM0JiWi9tcnlYdjNoTzdONFVVU01TTERBd2pK?=
 =?utf-8?B?dWtSOGpkVFBSeHpXZnQwOEtNMDhNSUVwdUJmUFpWbEFmRldlTVFpako2cHpB?=
 =?utf-8?B?L05YVVRhQkpvQysrTmc4MEZvSjRCNjllOUlLTFFKdmRLN1lzYjYrOTRxYk9J?=
 =?utf-8?B?VUc2THgzVVFFY2ZuU1RNYTh0SmZsbVNGNVpoSlFIbC8xVk1SNGl3ZHdXY2ll?=
 =?utf-8?B?OGlDbWllendyOVlVL2h2a1R1dHpEc1Rta0xGazUwTXJ0UXk4MGRRdnhiNlFm?=
 =?utf-8?B?THc5MkJkZXFWdG8yNWN3L0xEK0RWd3BKcnhJVXo3RTB1U1ozVm4vek15M2tl?=
 =?utf-8?B?UVFRb2xjdkZIbDlLdjk1Zm1WQk9RKzUxSDlSdGJkZDREZ00zdTloUDM1Rlk5?=
 =?utf-8?B?RFhnTzYrUHk2dTQ3bStQWi9NQ1FkVCt3emZkZnNpV2tZSDMxbzlNQXlWRitq?=
 =?utf-8?B?dWR5SFNhZUh3YTVrS25mL1pyWUpJQzR1b2lScFVUZ3NTOC9lMDByQWh3Tnlj?=
 =?utf-8?B?dWJRV1daaDhETmJOazN6T2pBQmZwSW1PZlNON3hjV1dQRDQ3WUtEdVFBM29s?=
 =?utf-8?B?MWdHQUU0ZklmS3ZCWDVoL0twVU8ySWVaM2JIdW1rWmxHdnpXV2NnRkZhN2Nz?=
 =?utf-8?B?dDRUNzQ2RXFobkxVYklDTFB3bGRWVlhrUEdGRWtBTDZ5OGRZVUlJaWVLMEZw?=
 =?utf-8?B?MURDc1BKQS9NRCtNNjZ6UVpneHd3Q1BKcGQ2eHg4Qm1nMnAza01qNnFLaWtJ?=
 =?utf-8?B?SlJQZk02Umx5eS9JYnNhcVY0N01KeWFXdVVLM2s2WXZqU2V2aURlcWVEWm9R?=
 =?utf-8?B?QythK0RabUx4TlhvcENMZVVxd2J2UUJlYWtqS3diZEZyWDA0ODRxdlF0MEk3?=
 =?utf-8?B?VXk4SmxmZ2l5NjRqU3ByQ28vOXN3UHI0MjQ5dFdBMUJ4ZU9iVkhnbTlWU01F?=
 =?utf-8?B?SnB2Qi80NEd4OXdvYytmNDdyaklDKzF4elRNVHFzZis0VCtCQzZhNnZzbWg0?=
 =?utf-8?B?SzJUUFU5RFhsL2ROcnJMak5OTEVwRW8vd0dVMXVDcTR6ME9IMDBlalZpUjJ2?=
 =?utf-8?B?VUs4MVMyZndMOSt0RU9DNlgxMnRzQ0dRYUpsOUp5ODlJRSt1d3ZqK2F6TEFF?=
 =?utf-8?B?QWNuOGViQUNlOVJHMnpOM2t3Mk81RHpIOURMN3ZYcld1TUVqaFhVdGxKb2ox?=
 =?utf-8?B?Y3YxajczMXBjTDl3VFhKak1rZDNGcU14Y1d6a2FNeVYwU1FEZ2x3ZnJub1dK?=
 =?utf-8?B?M0JIOTdNZktYb29paVZPNTBRUmxOaXhuTnpOTlh2eVNvQmEyV0lLZ0JHWUJu?=
 =?utf-8?B?OFRrTDVlM2k1dXlzMEhsOXMyZ3pnTlQ0TCswQkJhYUpZL0V3QmRuckZYZjBu?=
 =?utf-8?B?SmoyL2pYdGJaMVlUUHFNYzlFOVNtWm1VSkkwUFNnWUFlRlpxcXhKNkpNZDJE?=
 =?utf-8?B?Q3cyVzBFYVRhQ3p2RmtoZk92QjdTT2FaN2tsT2ZjWEh4TmgrZmN6QXJiOGVK?=
 =?utf-8?B?NmRHRlNwUTA5OTU0T2VwWnQvV04xaFNoQWttejVDQ283TXBGUUlib3RDeW8w?=
 =?utf-8?B?amU0c2JSSWRMa25acDNkZ2hOa2tDSEFaOHkwSThxYVNTZTdIdjd6ZGtxaVJi?=
 =?utf-8?B?UlRtRGZBUGs3dFU3azFXWC9aZDhMN0tuT0VEejYwMXN3cmpXeWQ5enNNdTY1?=
 =?utf-8?B?T2NoNFlYVmRBd3BTRThrNkIxTVp4MGFtL0pYalRXTnl4MURuRFlyTGRjVndL?=
 =?utf-8?Q?Ke9I2Z66HgQApBMZvHxPf9q4tuZ+K4Vv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzZzSUlzdDM4SlNUa3ViTkhJclBUUzZWV3MzQ1lPOHZOVHlaN0l3UG1ac0RN?=
 =?utf-8?B?d0c1S2pzT2xmUWZjWW1UUzYrV1dYVlF4QkFCWnh6NGdRWTY2c01Ic29qVXpT?=
 =?utf-8?B?ZitqUHJ2RllOZmFIc3dIdlhtemZTNlVJQnhzeFB0UjAyWGhiRVdJZTBmYXBS?=
 =?utf-8?B?VGMvUG92TGRrd1pQV1BrbTlvL1J4QWZ0QmFhTUxtTkkwUzNsVVcydDg3VHBr?=
 =?utf-8?B?bmNRN3YrZkJ0a0hOU0h4UEZHMnJHWmhFWjlvQXordnpjdHRKUGFmWi9yTEFG?=
 =?utf-8?B?ZENPa3c5S2o1KzdCa3p4NDBHcEpEQVV6UHFTTUVHYXZNSE5OdVM2R0ZROW1j?=
 =?utf-8?B?T2xqNDlweVpYTnozcklOVldLMjYrV1ZEdjFkQjdNQkplMlRwWVpNRVY5M3lz?=
 =?utf-8?B?aGlpOWVNSHJ5ZDRTTm1wZWNoZVBtT3NRWmMrcGwyRUN4b1E2QXAvUlI1VHc4?=
 =?utf-8?B?SmZVWU0weU1NMjdzM2VJeitqUDhzdTlYdDY3bUFmL0ZETVB6VldCM25FZEd3?=
 =?utf-8?B?VWxKUVRPdGFkblBNQ1U0M2dSdy8vdnJTZndsUGF3YVlSa0J0SUYyaEdFVGZo?=
 =?utf-8?B?SDU2MXg0amZMZnNRWUd5YzVJRDlUeVh6Y0xwejNtYTgxZnRRaG9QZnIrZDky?=
 =?utf-8?B?bmNZS3JaanVLMXpKZzJMSUFnRXExQTVhMEFyME5INUdqSzJBTDc3THNWa2Mr?=
 =?utf-8?B?blNnUWhmajdDUDk0WUtucGEwZjZiaDJkUFpiNTNPdFdNWUV5eVMxRVBhU2tK?=
 =?utf-8?B?THNWbWU3UXBjMTYxUC82TUdIaUtPcnRXbFJHSDByM1pzWERDMjdKOXhnZ3Nq?=
 =?utf-8?B?QmxLSkwzUGhZb1J4aHhjZmUybnJiRURMdkZyRWg4WEdtSEl1ZDJyL1ZSMzJG?=
 =?utf-8?B?MnJGaStBRzl6ZXZIL25jeGhQTTRFTEl0c3FpLzJ0dUFkOGZGYjVKcHo1d2ZP?=
 =?utf-8?B?YkxORTEwQm9tL0lYRTVIYi9BUkx0czVQdG5ocU5QalcyWnBlYzBwaTM3dHhE?=
 =?utf-8?B?YlErSGg0N3BRelVqRnlkTzZ2OWtSMGgvZUxWSmFNQWlickVGSUVrZ2IzVHgx?=
 =?utf-8?B?TUdmSTU3WG5QYVBhSmlRc29NMk5CclEwa1BjREgzWGZLemV1aHdlU0JvRlZW?=
 =?utf-8?B?M3NId1ZMa0hIeDBQUmdZYVQ5OTQwVFBvYWVGd0QxeEZFcTJnb2kyUXpMOVlu?=
 =?utf-8?B?YkJtREptL3BIM21lSHAxV1RpNmtwN2VBVW81bSs0emdMTWR2c0tqNEtZOFg5?=
 =?utf-8?B?NjFWY0F3L285R1pXOEhRWXlnMEdXVlZBZmxNMDdIMm9OVXdlWjVFWWpEVDFp?=
 =?utf-8?B?dnpyazNVaktDY2NqbHlNc1JZL2l5cjNYdXJ3OWtDOUd2d1ZHRWRLQlh5eDBQ?=
 =?utf-8?B?aHFocllubFVFZitCZUl5Q3g2eFdyN2VwYWxoQ1Ntc3NncFlmakVUQ1lQMDhP?=
 =?utf-8?B?U0t3RHRnc2tqNDdDZVRQZ1FSVEZDczhwNTVQcktvS2RpemRNQ1RXOFE2YnRa?=
 =?utf-8?B?TTVKUTg2YStBSU1hM3VQRlBwVlI3LzNqS3crMHlxai9ic0N4RlJNenYwYVQ4?=
 =?utf-8?B?RFRhek9RREdSbjhPMDh3ZDVLK3pMYkQ5alFPaDRMbStTMFlOcHhFQWJwbGYx?=
 =?utf-8?B?SWk1bHhZdWp2NUpUd2R0RzUvK0ZVQ0ZYSUNBUnp6NDNmSXZadHpZRG9LR2RX?=
 =?utf-8?B?RWdKdWRIRWMxcjRmRXZ4QkpMMHpHOHRWRDAyWG81TFNmbXVHcU5NV1VYTm1u?=
 =?utf-8?B?bFk5UGlNdmp4RWpXT0ZLNzRibzJvWVRteGU2bXlVeko3bGZ6aFFEZ2k2QUVU?=
 =?utf-8?B?c3I1SmhETGVrQXhQVUFVdjJqVGVzeHFzNzhOQ3lQNnhoOFA5Z2ZwQzZVTmxp?=
 =?utf-8?B?VnVqNnNMekFyMUZRaHNKVnNsWXR5VDE5WFRTTnl0QWNDb1ZlTHM3cHA5aUVv?=
 =?utf-8?B?aTFLM2lLVjZUN21EVzNJdXBKUlJpcUhFckxtYkx5ZTF4c05VKytMWnhsVnJ2?=
 =?utf-8?B?WXJrcG9VcjRISFJya2RoaTh2UUNxcFMrd0dCTjVLQkFMVzFITHpPUnlQdXpl?=
 =?utf-8?B?VDRYUzI1UU5aZnNiTlM2aWxOdGw0a2wrZS9IY1JSaHJ0b2VZYkNIaU9mNUNl?=
 =?utf-8?B?bllUUFVMKzVxaEdoeHBiWUVNdS9pSjRYdUlOK0ZsOVYxalhNZDJPN3hyRll1?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 372c287b-e77c-471b-8b2c-08de1e0d2023
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 14:51:26.4934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zW3/Dw9dSidfH5p1jJvkKvBJ8C89Co0gMWFNQPByyN+5m/bt35o9Sjk3oTsknn911ID8NMiyPcJGUyflNcGrrei18veOezj9NMfbPcmd/FU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7210
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

On Wed, Nov 05, 2025 at 04:10:25PM +0100, Michał Winiarski wrote:
>When INTEL_BMG_G21_IDS were added as a subplatform, token concatenation
>operator usage was omitted, making INTEL_BMG_IDS not usable with
>single-argument macros.
>Fix that by adding the missing operator.
>
>Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Fixes: 78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
