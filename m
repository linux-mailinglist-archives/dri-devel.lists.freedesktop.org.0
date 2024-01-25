Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7F183B910
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 06:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA96E10F4D1;
	Thu, 25 Jan 2024 05:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A9F10F4D1;
 Thu, 25 Jan 2024 05:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706160333; x=1737696333;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n6qKTeSCzAB8TWLklxEbp7FluxrG3tk8mRHUFlDZr3I=;
 b=mzVGVzLEdfvPyHkVY9OdFK4wxqyR4gBwJAIVADJcL4ii/HtDFWFH3D+u
 7UMixzARh0rkRsG4S3ThA28HBFFHJ6VOlSv/dNzUEwfZ6tQedcZ1elzXe
 wnazI7YlPOJv/iTfmk5J+x9JggcvqbBVjlAI+CB8EbS8oUJmtAH1IT0jQ
 3cEdz6oSh+YiwRVBlUT1zFZk9bM/1pttf7oQXpnsQ5wLvxcZFKihRkk0Y
 hhq8FKmsXeXRTIDaA6LH9MoarrYIZ+xcGRL4RaCYDR/WW3/HHCS2KK608
 qEHNGeIylTdIcOQvEGXVrHLuF/zouOAijZOBe/8LgIxI7OSSRNkP2tcdN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="433217568"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="433217568"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 21:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909887079"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="909887079"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 21:25:31 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 21:25:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 21:25:30 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 21:25:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4XsH/vAHKFQ+o1t4+NZRuSL/GUNZPs93MNTxvFT9iycCo0vUWj6LK2qDAHy7Q+MXp0jViYNqZxBjAIPLkfODxo/EH57iKYc7VTfQyuHyZn8aenbYhdXF2TXBu1LmXbaQJcgxaY/HGbxtw/ptTSlEfPvdAk6SYVBMN5eQq63WVGjVvAvzzcQmiNBeQ7jpolxemxvfRedzXkXmmUgAyQN72NGGhutCScBaBud2ygtyT8qcg5UPq+6gI22LTVXi6tEOLkM+8TMOlb+ZXBHrBcgmKr3lUaJiUj/va6J8hVnMCa+D/ihY5/BbamhO7tIR1ypJTrgo5RuQGNKesy8sfpweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6qKTeSCzAB8TWLklxEbp7FluxrG3tk8mRHUFlDZr3I=;
 b=fYZx/UErKxUXDGS/c5NaB6AD/gaLEzpz/O0SdSSYbw65StfNikpV4GeDFNkRpu5Hl1NKxKVlkbHk3oITVk+l/blgRnlreMTD/9b8n6OU/3ALo9rjK1c65rIeHSyvA8JGMJtGrPUWh30zeGjh3CNmmRR+QNkrDQse6BKxvIxrnekfalFpbJkOp4UqoZlT8fEDOn8pO9xZ72XxqqTfZM1grb+q6oLKRUte1Jn7RMEdZsKxSuv2GqIyPO+7fvmQRi9xarICSgP7/1hKDpPK5QS2ZHtfLsYfyJz9muOD6o3/2Ydjs4MSQ1NV64TGN6U4T0Y/oIqqeN4sru+IowUKJgJ+9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SJ0PR11MB4909.namprd11.prod.outlook.com (2603:10b6:a03:2af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 05:25:28 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de%5]) with mapi id 15.20.7202.035; Thu, 25 Jan 2024
 05:25:28 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: David Airlie <airlied@redhat.com>
Subject: RE: Making drm_gpuvm work across gpu devices
Thread-Topic: Making drm_gpuvm work across gpu devices
Thread-Index: AQHaTas285rAdrskSkySwbywxZaZP7DnPvcAgAA/1GCAASXNAIABD1nQgAALZoCAADri4A==
Date: Thu, 25 Jan 2024 05:25:28 +0000
Message-ID: <SA1PR11MB69918735BCF8BE99182BA3E8927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <SA1PR11MB699106F7114DF265A6E0964D927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAMwc25rZinyFDMmvPftWwnstOQSJJR01y1X8UkDUBTLgCAZ34Q@mail.gmail.com>
In-Reply-To: <CAMwc25rZinyFDMmvPftWwnstOQSJJR01y1X8UkDUBTLgCAZ34Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SJ0PR11MB4909:EE_
x-ms-office365-filtering-correlation-id: 4beaaedd-d2ae-42ab-f522-08dc1d660ada
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vh4RWDBezpPcdqPlX7GQC2gZhiSG8ULg8SiSVTLSBP+WppmmGvWfp4CTlSj9MDQ+BYuYkqXE2q+JrZj4HyNAYqhLO5qSsaygmSVJ1rrOwbPe9LctlWa3nhwY0BeHBlMm3bwsmjPWQZpD19J8VNoR/WkVtZn68RN0mDs3emCOno+mxYz0UVVNwI9ofCiqvYHCvQOT9qCvGUFrqhbg77a7NVmoVEA/MihGiXUQs69/K/zLbIjFIxX5meu58+SMnAY8KDY56OJW/9w/IbwLTmqMz26f8j6v1rzOwpCe1hKPegjRPwyII4ldzjYWsvrEEX0iDOUlRcfE8MV8KinpO+RogBUbt1/5s4s73xc4f89ZbWO52Qj+r1zCY0+MCNhTDhpENa516HG34mnr5KvDYz+97oSkI/JxSORpkJPw/CEDZyiCLe4L0EYsTA1k/N/h0T71cG99DeTCwZYGG+Udfgr5ij0K4ETzbU9Z7v84bD82yJfp6RVQ3RyOO3OFEtHyWVtJUmNgt/1+Vk+TdHvmVQk8mSgEm6e6kmdNiK3E8FlJAIhDTypgDL8cd3dYeeojMKzQR/D0xNNA4/j6p6VIrI6EDyUicbFKGXg1CedxiFiZd5s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(55016003)(53546011)(6506007)(7696005)(9686003)(83380400001)(66574015)(4326008)(8676002)(8936002)(966005)(66946007)(52536014)(478600001)(71200400001)(66446008)(316002)(66476007)(66556008)(76116006)(6916009)(54906003)(64756008)(86362001)(122000001)(82960400001)(38100700002)(38070700009)(5660300002)(41300700001)(33656002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1BST1VFWFBlK2hCMVJYTEE3eHNtUEt3T3paQmcyaFFKTk5JdERGZlY3c1Yz?=
 =?utf-8?B?dmYrQWNaYW1CK0VwKzkvcFNDQlJ6M3N4VGhPdS93NDZ1M2cyMXFhS3lNY3BG?=
 =?utf-8?B?b21jcUFLMDgwNXA5SVJteVppb09zeXpaaTYxcDhOOVVQbzI4VFNreEhNTVlN?=
 =?utf-8?B?M3h6TzlwN1RTaitacFYxRDdSdFBKL1M0Y2pXUHl6TGM0MmJ1NmtLRjk0UHJq?=
 =?utf-8?B?NTNoWWN5NFVrb281bHF3dUk2dlB5WG5BV0R2Y3NEMHE4OTA5SlljRXc0aVJQ?=
 =?utf-8?B?c2NUOFNXTFRsU1VCR1lseEQwUnNGdGp2ZlZKaCthT1RHeEJqSlVVN1dQT0s1?=
 =?utf-8?B?S3NXSGlSV0M3cDY1VTBXQWJDRUY4aUxVT1dGNmtaMnd3V0tERlJYUGNvZlcw?=
 =?utf-8?B?aGd6eC9YeWVrV2FxcmlVOXEwQk81aEE5NFZJeTFCVGpWbE9tMUxqT0JLN1Y4?=
 =?utf-8?B?TUxoTFlabVN4dDFJd0Z3aEVmNlJaZ2NVQ3h2b3lZRUQ3NG5tMGpXWW5ER0d3?=
 =?utf-8?B?Nld0MTIxZnc3NUUxL0ZTSmRFRmxGc2pOUVhST0k3M3c5L3hiVGowVUFqVzVs?=
 =?utf-8?B?bzJ4a21ZL3VXVXM2eUhPc3oybGVzMnJzS0xpV0JJTkkwbjV5WGxIajdOTjBC?=
 =?utf-8?B?MEVENFFIYWdsQTRpQ3p5dG5WZDF6RjBkQnNTZjk3cEZWcUh5WEt4SDRyejdB?=
 =?utf-8?B?bStnMFJCYitqOUhyODB3TjNoUkhrWHJFOVA5TTZOamlMSWMxa2VpZUJyeWk5?=
 =?utf-8?B?YzVvamt1SUNtdmkxOWdBVjBkdnEyMUpoOTlvZHlJZVQyWTV4L0R0Y2RpMXJZ?=
 =?utf-8?B?YkU1Wkc1a09JNlMzSFA4TUtyb1pwalZpbkZxMC9DVmpJWUNXQjlmWUMvM093?=
 =?utf-8?B?UHRDRjdsSGZrMnFQVXBQTEJXYUtsblJmeXUyc0Q2RCtWdXJaZlV2TnM2bi9h?=
 =?utf-8?B?MnlyUTlUYkRJbzNCYjBrVFdvNWlvZWloRmNSTER6elZVM01odXlaanRMeFdq?=
 =?utf-8?B?d3FkVHdaQjRrNnR2QWh6cjJvR0RCWXBlWE54Q2lMZEk2OWVQVkVxd1dGTzFr?=
 =?utf-8?B?VkpvdFB4cTZROWI1cTl3TWI2a0hwYjVocDVBYW5YMGpkN0w3a3RWZFJ6bWRN?=
 =?utf-8?B?bnI4b1dST1l5N3pWRHZNcnNCQUVKT0duS0cxTWozcktWV3FQWUlXb043RmJq?=
 =?utf-8?B?T3ZVSWtmQUwxTHhTRnJlTkYrRWdWMnFOblZuME5GdDZ5SDVtUGZ6RHBGR25z?=
 =?utf-8?B?WFRYSFZWTUMrazF1RE8rakJCc0hRcWh2Zzl5MEJxdXZnYXlHUlRBSHcrQlpY?=
 =?utf-8?B?OXNlT2FzSlZvdVIrRTdVVjIzRFBrb1l0QmJDWGN2bERYQ0ROdlAydmYxcnVv?=
 =?utf-8?B?QnliYWZoTFNydU9nM2JHczFpN0d6N0lDRWpyNHNiSTkvN01vMmJwelUrZlY3?=
 =?utf-8?B?cXkvS1dydkY1VGNtK1JRUEkvaU9WSDY0NnduWWs1SGJPYkFyMVRUNWo5NDln?=
 =?utf-8?B?WnYwcHFxQTdjOHI2aUFsemt4b1p5WDlPTmN5NDVyU0RCUWxYaEJTNHgzU091?=
 =?utf-8?B?NjBFcWJ2blE3M0lZaGZwZG8xQzFvQ0xHcXRRd2kyeEo1UGZjRDdUenFJbFRD?=
 =?utf-8?B?UFRYem83U1ZqaE0rNm9KTlFjbm1BMWE2WkJIRjBrUkFqVktsejdqU21CMy9O?=
 =?utf-8?B?c0FkdHEyeXRGMzRvVkdTekdpdEZCditLa3J6RVZKeUJuSVdqRFZqQ0ZJM25F?=
 =?utf-8?B?RlNoVXBJblgzeHRIVml3QWQ1K0dObjNXSThaQjh2NWxaSitrR3RCTERMZFVl?=
 =?utf-8?B?eXFiMGJFOWFHdExydlk5YmM2cE9OUDZVSGNCZWlkWngvdEViMHAvQk1VR1p2?=
 =?utf-8?B?bjNMazRMcUlVQzd2OUxFajNhcHRJd1RBd25EL20zUnhXT3NmWHRNaVlTRWRw?=
 =?utf-8?B?Y01xcG9GZ1NYNmxtU0pRVlRGYTdQeDdiV1ZKU01BYWNTRndjd09qUDFrM1Zr?=
 =?utf-8?B?cXNweGNVYWFUS1JnTjZJdXdOTS85b0gwSjRLRjh5enFsN21GSHovZ2I4VlIx?=
 =?utf-8?B?QThkcUo0NFZuYllSN3VDTnc2aUhieEVpV1V3TlBvYUVwNUNqN1RvRUhmRTJn?=
 =?utf-8?Q?d77k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4beaaedd-d2ae-42ab-f522-08dc1d660ada
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 05:25:28.5457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sX4aIEHarWgKQ1PbtLndIAzCRR4Abuw/CyLk0oL1nx3xDEeb4aMfElq7GGZJyPyrdZjepazUxhKmR5f/76nTNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4909
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Winiarski, Michal" <michal.winiarski@intel.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>, "Shah, Ankur N" <ankur.n.shah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Bommu, 
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwNCg0KTGV0IG1lIHN0ZXAgYmFjay4gV2hlbiBJIHdyb3RlICIgc2hhcmVkIHZpcnR1
YWwgYWRkcmVzcyBzcGFjZSBiL3QgY3B1IGFuZCBhbGwgZ3B1IGRldmljZXMgaXMgYSBoYXJkIHJl
cXVpcmVtZW50IGZvciBvdXIgc3lzdGVtIGFsbG9jYXRvciBkZXNpZ24iLCBJIG1lYW50IHRoaXMg
aXMgbm90IG9ubHkgSW50ZWwncyBkZXNpZ24gcmVxdWlyZW1lbnQuIFJhdGhlciB0aGlzIGlzIGEg
Y29tbW9uIHJlcXVpcmVtZW50IGZvciBib3RoIEludGVsLCBBTUQgYW5kIE52aWRpYS4gVGFrZSBh
IGxvb2sgYXQgY3VkYSBkcml2ZXIgQVBJIGRlZmluaXRpb24gb2YgY3VNZW1BbGxvY01hbmFnZWQg
KHNlYXJjaCB0aGlzIEFQSSBvbiBodHRwczovL2RvY3MubnZpZGlhLmNvbS9jdWRhL2N1ZGEtZHJp
dmVyLWFwaS9ncm91cF9fQ1VEQV9fTUVNLmh0bWwjZ3JvdXBfX0NVREFfX01FTSksIGl0IHNhaWQ6
IA0KDQoiVGhlIHBvaW50ZXIgaXMgdmFsaWQgb24gdGhlIENQVSBhbmQgb24gYWxsIEdQVXMgaW4g
dGhlIHN5c3RlbSB0aGF0IHN1cHBvcnQgbWFuYWdlZCBtZW1vcnkuIg0KDQpUaGlzIG1lYW5zIHRo
ZSBwcm9ncmFtIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBpcyBzaGFyZWQgYi90IENQVSBhbmQgYWxs
IEdQVSBkZXZpY2VzIG9uIHRoZSBzeXN0ZW0uIFRoZSBzeXN0ZW0gYWxsb2NhdG9yIHdlIGFyZSBk
aXNjdXNzaW5nIGlzIGp1c3Qgb25lIHN0ZXAgYWR2YW5jZWQgdGhhbiBjdU1lbUFsbG9jTWFuYWdl
ZDogaXQgYWxsb3dzIG1hbGxvYydlZCBtZW1vcnkgdG8gYmUgc2hhcmVkIGIvdCBDUFUgYW5kIGFs
bCBHUFUgZGV2aWNlcy4NCg0KSSBob3BlIHdlIGFsbCBhZ3JlZSB3aXRoIHRoaXMgcG9pbnQuDQoN
CldpdGggdGhhdCwgSSBhZ3JlZSB3aXRoIENocmlzdGlhbiB0aGF0IGluIGttZCB3ZSBzaG91bGQg
bWFrZSBkcml2ZXIgY29kZSBwZXItZGV2aWNlIGJhc2VkIGluc3RlYWQgb2YgbWFuYWdpbmcgYWxs
IGRldmljZXMgaW4gb25lIGRyaXZlciBpbnN0YW5jZS4gT3VyIHN5c3RlbSBhbGxvY2F0b3IgKGFu
ZCBnZW5lcmFsbHkgeGVrbWQpZGVzaWduIGZvbGxvd3MgdGhpcyBydWxlOiB3ZSBtYWtlIHhlX3Zt
IHBlciBkZXZpY2UgYmFzZWQgLSBvbmUgZGV2aWNlIGlzICpub3QqIGF3YXJlIG9mIG90aGVyIGRl
dmljZSdzIGFkZHJlc3Mgc3BhY2UsIGFzIEkgZXhwbGFpbmVkIGluIHByZXZpb3VzIGVtYWlsLiBJ
IHN0YXJ0ZWQgdGhpcyBlbWFpbCBzZWVraW5nIGEgb25lIGRybV9ncHV2bSBpbnN0YW5jZSB0byBj
b3ZlciBhbGwgR1BVIGRldmljZXMuIEkgZ2F2ZSB1cCB0aGlzIGFwcHJvYWNoIChhdCBsZWFzdCBm
b3Igbm93KSBwZXIgRGFuaWxvIGFuZCBDaHJpc3RpYW4ncyBmZWVkYmFjazogV2Ugd2lsbCBjb250
aW51ZSB0byBoYXZlIHBlciBkZXZpY2UgYmFzZWQgZHJtX2dwdXZtLiBJIGhvcGUgdGhpcyBpcyBh
bGlnbmVkIHdpdGggQ2hyaXN0aWFuIGJ1dCBJIHdpbGwgaGF2ZSB0byB3YWl0IGZvciBDaHJpc3Rp
YW4ncyByZXBseSB0byBteSBwcmV2aW91cyBlbWFpbC4NCg0KSSBob3BlIHRoaXMgY2xhcmlmeSB0
aGluZyBhIGxpdHRsZS4NCg0KUmVnYXJkcywNCk9hayANCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIERhdmlkDQo+IEFpcmxpZQ0KPiBTZW50OiBXZWRuZXNk
YXksIEphbnVhcnkgMjQsIDIwMjQgODoyNSBQTQ0KPiBUbzogWmVuZywgT2FrIDxvYWsuemVuZ0Bp
bnRlbC5jb20+DQo+IENjOiBHaGltaXJheSwgSGltYWwgUHJhc2FkIDxoaW1hbC5wcmFzYWQuZ2hp
bWlyYXlAaW50ZWwuY29tPjsNCj4gVGhvbWFzLkhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb207IFdp
bmlhcnNraSwgTWljaGFsDQo+IDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT47IEZlbGl4IEt1
ZWhsaW5nIDxmZWxpeC5rdWVobGluZ0BhbWQuY29tPjsgV2VsdHksDQo+IEJyaWFuIDxicmlhbi53
ZWx0eUBpbnRlbC5jb20+OyBTaGFoLCBBbmt1ciBOIDxhbmt1ci5uLnNoYWhAaW50ZWwuY29tPjsg
ZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgR3VwdGEsIHNhdXJhYmhnDQo+IDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+
OyBEYW5pbG8gS3J1bW1yaWNoIDxkYWtyQHJlZGhhdC5jb20+OyBEYW5pZWwNCj4gVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+OyBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+
OyBCb21tdSwNCj4gS3Jpc2huYWlhaCA8a3Jpc2huYWlhaC5ib21tdUBpbnRlbC5jb20+OyBWaXNo
d2FuYXRoYXB1cmEsIE5pcmFuamFuYQ0KPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRl
bC5jb20+OyBDaHJpc3RpYW4gS8O2bmlnDQo+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBNYWtpbmcgZHJtX2dwdXZtIHdvcmsgYWNyb3NzIGdwdSBkZXZpY2VzDQo+
IA0KPiA+DQo+ID4NCj4gPiBGb3IgdXMsIFhla21kIGRvZXNuJ3QgbmVlZCB0byBrbm93IGl0IGlz
IHJ1bm5pbmcgdW5kZXIgYmFyZSBtZXRhbCBvcg0KPiB2aXJ0dWFsaXplZCBlbnZpcm9ubWVudC4g
WGVrbWQgaXMgYWx3YXlzIGEgZ3Vlc3QgZHJpdmVyLiBBbGwgdGhlIHZpcnR1YWwgYWRkcmVzcw0K
PiB1c2VkIGluIHhla21kIGlzIGd1ZXN0IHZpcnR1YWwgYWRkcmVzcy4gRm9yIFNWTSwgd2UgcmVx
dWlyZSBhbGwgdGhlIFZGIGRldmljZXMNCj4gc2hhcmUgb25lIHNpbmdsZSBzaGFyZWQgYWRkcmVz
cyBzcGFjZSB3aXRoIGd1ZXN0IENQVSBwcm9ncmFtLiBTbyBhbGwgdGhlIGRlc2lnbg0KPiB3b3Jr
cyBpbiBiYXJlIG1ldGFsIGVudmlyb25tZW50IGNhbiBhdXRvbWF0aWNhbGx5IHdvcmsgdW5kZXIg
dmlydHVhbGl6ZWQNCj4gZW52aXJvbm1lbnQuICtAU2hhaCwgQW5rdXIgTiArQFdpbmlhcnNraSwg
TWljaGFsIHRvIGJhY2t1cCBtZSBpZiBJIGFtIHdyb25nLg0KPiA+DQo+ID4NCj4gPg0KPiA+IEFn
YWluLCBzaGFyZWQgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGIvdCBjcHUgYW5kIGFsbCBncHUgZGV2
aWNlcyBpcyBhIGhhcmQNCj4gcmVxdWlyZW1lbnQgZm9yIG91ciBzeXN0ZW0gYWxsb2NhdG9yIGRl
c2lnbiAod2hpY2ggbWVhbnMgbWFsbG9j4oCZZWQgbWVtb3J5LA0KPiBjcHUgc3RhY2sgdmFyaWFi
bGVzLCBnbG9iYWxzIGNhbiBiZSBkaXJlY3RseSB1c2VkIGluIGdwdSBwcm9ncmFtLiBTYW1lDQo+
IHJlcXVpcmVtZW50IGFzIGtmZCBTVk0gZGVzaWduKS4gVGhpcyB3YXMgYWxpZ25lZCB3aXRoIG91
ciB1c2VyIHNwYWNlIHNvZnR3YXJlDQo+IHN0YWNrLg0KPiANCj4gSnVzdCB0byBtYWtlIGEgdmVy
eSBnZW5lcmFsIHBvaW50IGhlcmUgKEknbSBob3BpbmcgeW91IGxpc3RlbiB0bw0KPiBDaHJpc3Rp
YW4gYSBiaXQgbW9yZSBhbmQgaG9waW5nIGhlIHJlcGxpZXMgaW4gbW9yZSBkZXRhaWwpLCBidXQg
anVzdA0KPiBiZWNhdXNlIHlvdSBoYXZlIGEgc3lzdGVtIGFsbG9jYXRvciBkZXNpZ24gZG9uZSwg
aXQgZG9lc24ndCBpbiBhbnkgd2F5DQo+IGVuZm9yY2UgdGhlIHJlcXVpcmVtZW50cyBvbiB0aGUg
a2VybmVsIGRyaXZlciB0byBhY2NlcHQgdGhhdCBkZXNpZ24uDQo+IEJhZCBzeXN0ZW0gZGVzaWdu
IHNob3VsZCBiZSBwdXNoZWQgYmFjayBvbiwgbm90IGVuZm9yY2VkIGluDQo+IGltcGxlbWVudGF0
aW9uIHN0YWdlcy4gSXQncyBhIHRyYXAgSW50ZWwgZmFsbHMgaW50byByZWd1bGFybHkgc2luY2UN
Cj4gdGhleSBzYXkgd2VsbCB3ZSBhbHJlYWR5IGFncmVlZCB0aGlzIGRlc2lnbiB3aXRoIHRoZSB1
c2Vyc3BhY2UgdGVhbQ0KPiBhbmQgd2UgY2FuJ3QgY2hhbmdlIGl0IG5vdy4gVGhpcyBpc24ndCBh
Y2NlcHRhYmxlLiBEZXNpZ24gaW5jbHVkZXMNCj4gdXBzdHJlYW0gZGlzY3Vzc2lvbiBhbmQgZmVl
ZGJhY2ssIGlmIHlvdSBzYXkgbWlzZGVzaWduZWQgdGhlIHN5c3RlbQ0KPiBhbGxvY2F0b3IgKGFu
ZCBJJ20gbm90IHNheWluZyB5b3UgZGVmaW5pdGVseSBoYXZlKSwgYW5kIHRoaXMgaXMNCj4gcHVz
aGluZyBiYWNrIG9uIHRoYXQsIHRoZW4geW91IGhhdmUgdG8gZ28gZml4IHlvdXIgc3lzdGVtDQo+
IGFyY2hpdGVjdHVyZS4NCj4gDQo+IEtGRCB3YXMgYW4gZXhwZXJpbWVudCBsaWtlIHRoaXMsIEkg
cHVzaGVkIGJhY2sgb24gQU1EIGF0IHRoZSBzdGFydA0KPiBzYXlpbmcgaXQgd2FzIGxpa2VseSBh
IGJhZCBwbGFuLCB3ZSBsZXQgaXQgZ28gYW5kIGdvdCBhIGxvdCBvZg0KPiBleHBlcmllbmNlIGlu
IHdoeSBpdCB3YXMgYSBiYWQgZGVzaWduLg0KPiANCj4gRGF2ZS4NCg0K
