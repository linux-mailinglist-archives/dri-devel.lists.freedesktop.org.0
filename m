Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FDC52D429
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 15:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1640411A6A6;
	Thu, 19 May 2022 13:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C7011A696;
 Thu, 19 May 2022 13:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652967409; x=1684503409;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BvsV2GboHj4BCStISH0uwBsqwhe7NCSTIZF8te34fQ8=;
 b=YfAQ0hOa0EkZ36J8NviT3er9gguWhkcJeHmIVVLzEHMQ18aZPN3GgSBH
 8XVfAVs2eMrwoEouWgaRp43UbQiacNH07OBc4DgPrdG7ruBJvi+AJo5aC
 rp5hfBaIrovea3TkTcQOyBSC77qql8v1ID2rzKHbDti/Enj9riCr6vv9n
 yLLN6U4qs7m74krdvH2DH2vw+osaJEtNRSCgkuO1nidAKQtwGBSiJ/tAI
 /L//7RgPrAyMmom10SB/YLiZ5sam1phyIknyGOfBUxUtNcXt63okBEFvQ
 b7vcR7DwRRlqkKGGRvWAwk3Zx4WwvJ6Dhq8fqhiY1wu2SdgjEbE1csfVL g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="269793327"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="269793327"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 06:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="817978089"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 19 May 2022 06:36:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 06:36:48 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 06:36:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 06:36:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 06:36:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jtwj2Z6myqkIrC2ViL/zdTNHfBYpruOUceW6K1gxGjfItPHVpRn9350aDlY+mg8k4aDofne7pMrykL14gDSsXS9Vg+XKX5Bhb8p4+5knZ3dAeUi91FzfI4aUpeU+kMa2uDsLdLtWvCGd3j9iU2dbMk5r2LyWwWGOj3ZI0TmKMNZ7/Kg+G2khdJzB7+yog0rtgsSCPy5p4SZ2WbEJdzKGxIRQsDWtHbdgkL+X+iTJFb45MIucaQrEAgk/ZU+Sdnc6J71LIsKs6+8GL6A258S7ZKUsKaOgmowdsefQ4zvUGZy1QWMYr6GhMpFFRhV8i0DOJnZGhInG1pVCNP7j0ozT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvsV2GboHj4BCStISH0uwBsqwhe7NCSTIZF8te34fQ8=;
 b=HMr+eJ6yFDIE0Djy/aEfhEXGca9oLXBCE2vCX0iCjfE4xaM3w1dhrnoXoOoN1HByOxiaNWiOb/DfhqLWa6qaEJmT0d7P9hsDY6CJmF8wPsT61b9Qqadhy5YZNE+B+N/Rfy68IwNZ2XZTHRuVl3zAJP/tZ21lYjMIeoJ3k03VoE/iWZvICXTwYn2Vuvh84XiRgHty3TCS6nwxHpwZD9YthMze2H7LwCpRhX9Z/asxuoLi40nTpVaxh8tcxX/lUBiBqMfqr75FJjipbqE1adJIjOTfDJNRC0fkK0c/AMuYNCy2P6Gz4BLlkAacojM2wHF0gs2Eey54TE1aVUpVsKujrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15; Thu, 19 May
 2022 13:36:45 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::2df3:4862:e431:2f20]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::2df3:4862:e431:2f20%5]) with mapi id 15.20.5250.020; Thu, 19 May 2022
 13:36:45 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 04/11] drm/ttm: move default BO destructor into VMWGFX
Thread-Topic: [PATCH 04/11] drm/ttm: move default BO destructor into VMWGFX
Thread-Index: AQHYa2aVqSO0ePN1+EyRUYzEGvyXQq0l9jWAgAA6jnA=
Date: Thu, 19 May 2022 13:36:45 +0000
Message-ID: <DM5PR11MB1324DCAE7CD6B1F16920B5B5C1D09@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220519095508.115203-1-christian.koenig@amd.com>
 <20220519095508.115203-5-christian.koenig@amd.com>
In-Reply-To: <20220519095508.115203-5-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 666c0b79-3fed-4669-8dfe-08da399c9e19
x-ms-traffictypediagnostic: BY5PR11MB4241:EE_
x-microsoft-antispam-prvs: <BY5PR11MB4241C66AFA71DD4C897FF941C1D09@BY5PR11MB4241.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4ltYob96i4HULK+8YwRBba+ExWucyytxu/Jd0r41mDUZ/upqzDkAFC+WbKC+5Pm3K7StLAZ3BmSPIZuznLupr0DwtTPXb/nKfX3crXmqcEOKGyGoaKbiBEsi8eQ0NPe28+WOuEl4qXY3jzuVxxvqUy6gAW4MSbbFp2t+ffw5v6DNPKW9KNcKNC41F+Tt0N3Pvnx2H0If0+V0BCBweuBI1klE04IKnML93s0/yZn/UbyK5uE3HRMz3ogYB+VZkSgwh3KJCX2DhefN39SduIPMDYHK0kMcu3rUVtTpV7/ApHqzZr0ZFmOpw02nmdzXNJnS4oXkN28LN6DUckcQ8Zl2B/51sIlFocyCitjGGdFxRSXA87ceQ9DASFEwLha9WQtTebQ8L4DhIkG/eVIf0EMzdkAxa6WiknkTa8Vmt01oHAmqnRAZb+r5wpL6KIo6BoTxz7xc0CPFIO+WfGz9R/kXg7Cr9A1R72GL2+iJBnpEnsV20nLVBEEuAQmSWMeXpVAR4zbYjIAIrFPxLHCICkUVwdikfUbFjZgsopGpXYrjoL2/WHVKor+GQzLC5ORpnzUu/46e4B9h9mPcPk42J8tEu0vcs2oJUqAW3Ym5yi96A73m6ez4Z4KxQC0FY+MYptpj3X0gVa8YP+TH6JegM539tmO9jbf+p6nyWVAPR8t3KnwOFNO1E3LtowUjfLjK1q/6v2KXzvk4BE12a2ODr1GL5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(66574015)(71200400001)(82960400001)(54906003)(83380400001)(7696005)(110136005)(6506007)(33656002)(2906002)(9686003)(26005)(66446008)(52536014)(66476007)(76116006)(66946007)(66556008)(86362001)(5660300002)(122000001)(4326008)(38100700002)(8676002)(64756008)(508600001)(38070700005)(186003)(8936002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTY4RTJVbWhUUnYzc0VoRU1pc2NGdXh0Z1p6VFVsZGdSU3dYdE50dTZQdlBj?=
 =?utf-8?B?TVhhK2ZFMEhBL0NTbG1SNjIwRFI4L1QxSXV5WXBHU0V6dGUxWGp1MXZMMGVk?=
 =?utf-8?B?VDFrRmdncVROT1hOZFcvZG9tNWNtU2s5N0I4SU1xazlSOS9nc1haY0tVYmlo?=
 =?utf-8?B?V1ozRUgvb1pPNk9rdmM2RUxubmlUY0ZDWkhqVlhMdDBaN3FQRDJnVXV4QzBp?=
 =?utf-8?B?UXZKekorbkFsSndvNEppcVhvRk9tbWc1M2Vmc2dqMHY5OWduTERJdHcrNEY5?=
 =?utf-8?B?MDdGWkI5bzFyRjZjM0x4NWxyWmlGNGFrdnBvbU92UHBtYnRWQTdGZXdlUlNQ?=
 =?utf-8?B?SWFnSm5XTk5DRWh5TEU1VktiR2w5c0xJV2FZa2doaWNETlBZajVBK01EeDFL?=
 =?utf-8?B?bUZ2dC9HbE5sVmxDbEVpRTlIenVwYmVHdmREVGZCME5IdXhYdFJ6OG5vZURz?=
 =?utf-8?B?NnA4OHR1OW1Ed2JxUjRZdUdhU3MrQ3g3aGNZb1YwNnRTKzQwTWZESERTeTBZ?=
 =?utf-8?B?UnZkT0M4MGR6ZWxBandvd3M2Y3pPM2ZkMkVTa3hhZWVLTE1ZRHJrVUpkeTlx?=
 =?utf-8?B?UVF5dlNHbWpuVmc1aG5GL0Y5NzkvUnkwcjZwaldxb1RYUHlXNWpPNXdCRkpx?=
 =?utf-8?B?clhJNW5UZElxQTFqYlUvV2hYZ3lSYW85TzdsTjk0Ri9XbVZLZXV2M2l0RW1U?=
 =?utf-8?B?T1VlYUFvUDBIdW5vRThOU1pJUUY4aW9QMHl6VFJJdWM5ZjA3RUs4SElvQzgx?=
 =?utf-8?B?UDQxenhmZmlVSXF5VjF4RzRiL1grZkh2aW8yWTc2Zy9zZ3h4dU04dEhaL3kw?=
 =?utf-8?B?UUFCZmt2LzhqSFV3TFA1TGFVNVBwU01vZHU0SlNFczZGUW5URnJjZittTjdz?=
 =?utf-8?B?VXBXeTBhZUg3VEt0ZHZaelFjOVNWbFIwKzdBcGpIR1lkb1UzZmFtUWVpU0pa?=
 =?utf-8?B?TUUyRTVLLytxYzZDZkdjR3FPRmlEajhsWjJxdXVzMmppdUVMaEhHVGUwSWwr?=
 =?utf-8?B?YysrRWM5REFkRm9jM1d1Rkh3cng3S1N6b0liYTBJK3lhRkMrNGxiSUo0Z1FJ?=
 =?utf-8?B?ZUh3SlFJbEJQM3d3NEFuZ2twaTB2cS9zUTN4WldmVjQ0b0Y4dGM4R0JjTVM3?=
 =?utf-8?B?S3d2N0w5cTdqbzUrNjgrNkJ6MnRTUW1WczJuWHFWc0hnQ2IvQ3pyWGk5ckNr?=
 =?utf-8?B?dWIwVG81Q2VESHJpY2RSbGdwVktiVUUvMHdIbWxrdWhHUU0yeWxCMTlUYkhs?=
 =?utf-8?B?Um5YeXZ3b1BkNENZWjNPZ252U0I0aXdZeW9yRkxDaWVVdE5hQVFVSUxrbXZz?=
 =?utf-8?B?OTRoUGNwQ2lTRTc5MC90alVCMWFWQmNyTHZPVUk4NldMd0JRUFFzUG4venBz?=
 =?utf-8?B?TWtlaS9NNTc2YXhnTGJWcnMyUmtIWWtkYzF1dENEV3h2RDhrU2RtRmtadDNp?=
 =?utf-8?B?UUZybkw0dkxHQkVUdWtqRDgycDhiWHBnd1I3RnFaUURRdjhlK0p5ZitMTnFl?=
 =?utf-8?B?MGx6S0R2aEIzT21kdFljVUxxV1h0MDRUbDd2SFl1UUdEbDBpM1F2Y09DVWJE?=
 =?utf-8?B?eGlFM0ozbjlVdkJPb29GWFN0UGZ3R01CSWNCbCtvekFnVzhBN3hvK1JVbVZv?=
 =?utf-8?B?Z0Y1Y3lNMnozRXRuSVpQS3RObXFzTm5sOE9QMkI2SWxTOHJKRml5V1BVUGdB?=
 =?utf-8?B?OHliMDdBL1ZsOVNtVmhuK1RObnlCLzlaa21rdnpjUjBzRzd6SWU5ZnZORzNQ?=
 =?utf-8?B?bHVoUGpTZEx6MTlRUDJ5RytJTkw0bklTT3FPUkpHQ2xvazJEcm1FSG4wMjk5?=
 =?utf-8?B?QlFraTBKT1c1dzBZNXZQWUdoVDRjZ2p2NDhheTB5dVl0OFlyTHVXYVZ5Y3BN?=
 =?utf-8?B?dlNFYkhVeS9ueTZRNXF4enMwUjRkREY4TE9OMm5GMHpQaTB5bkRKeVg3dzlC?=
 =?utf-8?B?em1XemNwTnJxQlR2WFVvQ0FYNVBBLzRpbS9jM3phMWpYbCsyeU9Ga2ljM3RC?=
 =?utf-8?B?R050Z3dKMTVzUTJrVE8wOW0xbmVHUUY3ejVmWXNlbk1QdnJxRzM0TndPeGJ4?=
 =?utf-8?B?Q3RjaHpud25VaEVZOWtSdWZWT0xTNVBJNmE0OVpBMllxbjJPSEFyK0U1WE5G?=
 =?utf-8?B?MlZKdnRQdVU4OVIwNTQzdnVxbmZJVjZSM1BXTEp2Sy9OMUZwam9WRnFDT1BW?=
 =?utf-8?B?Qk9HdW93NThlNTlCRWFZelA3MnhHTVFvc2xMRHJvQkhJTldGcUVnbkVaOEFl?=
 =?utf-8?B?M0ZHRFdvR1p6K3grRE5sK0R3ZGtnYU8xb1d2T241cFoxYnhzM09YaGtvWUc0?=
 =?utf-8?B?dXpnY1lpdStmQmUzMHJjSnIrdnBUSkNGWkl0NldSVjVyUFpzdUx2TEZkT2RF?=
 =?utf-8?Q?W8s/Io2LRXcWVXfY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666c0b79-3fed-4669-8dfe-08da399c9e19
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 13:36:45.6034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mCnb7Sgw5m3zaIq2X5Qy+yN6zJRmBiNrzH3V0FTTTV1e+2fLYeD826OkMN6Yw2b/x2l1MBQ9k+O/dOwvCqZB8Ofi8s/MiYaGntZ51/tMpKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4241
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
Cc: "matthew.william.auld@gmail.com" <matthew.william.auld@gmail.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBUaHVyc2RheSwgTWF5IDE5LCAyMDIyIDU6NTUgQU0NCj5UbzogaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBtYXR0aGV3LndpbGxpYW0uYXVsZEBnbWFp
bC5jb207IENocmlzdGlhbiBLw7ZuaWcNCj48Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6IFtQQVRDSCAwNC8xMV0gZHJt
L3R0bTogbW92ZSBkZWZhdWx0IEJPIGRlc3RydWN0b3IgaW50byBWTVdHRlgNCj4NCj5JdCdzIHRo
ZSBvbmx5IGRyaXZlciB1c2luZyB0aGlzLg0KPg0KPlNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4tLS0NCj4gZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfYm8uYyB8IDMgKysrDQo+IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykNCj4NCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8u
Yw0KPmIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uYw0KPmluZGV4IDg1YTY2MDE0
YzJiNi4uYzRmMzc2ZDVlMWQwIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2JvLmMNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5jDQo+
QEAgLTQ2Miw2ICs0NjIsOSBAQCBpbnQgdm13X2JvX2NyZWF0ZShzdHJ1Y3Qgdm13X3ByaXZhdGUg
KnZtdywNCj4gCQlyZXR1cm4gLUVOT01FTTsNCj4gCX0NCj4NCj4rCWlmICghYm9fZnJlZSkNCj4r
CQlib19mcmVlID0gdm13X2JvX2RlZmF1bHRfZGVzdHJveTsNCj4rDQoNCnZtd19ib19pbml0IGhh
cyBhIFdBUk5fT04gaWYgdGhpcyBpcyBOVUxMLg0KDQpBbHNvLCBhbGwgb2YgdGhlIGNhbGxlcnMg
dXNlIHZtd19ib19ib19mcmVlKCkgb3Igdm13X2dlbV9kZXN0cm95KCkuDQoNCkJvdGggb2YgdGhv
c2UgdW5tYXAsIHJlbGVhc2UgYW5kIHRoZW4gZnJlZSB0aGUgb2JqZWN0Lg0KDQpJdCBkb2Vzbid0
IGxvb2sgbGlrZSB2bXdfYm9fZGVmYXVsdF9kZXN0cm95IGRvZXMgdGhpcyB3b3JrLg0KDQpJcyB0
aGlzIHRoZSByaWdodCAiZGVmYXVsdCIgcGF0aD8gIE9yIHNob3VsZCB0aGUgV0FSTl9PTiBiZSB1
c2VkIHRvIGNoZWNrDQpmb3IgdGhpcz8NCg0KTQ0KDQo+IAlyZXQgPSB2bXdfYm9faW5pdCh2bXcs
ICpwX2JvLCBzaXplLA0KPiAJCQkgIHBsYWNlbWVudCwgaW50ZXJydXB0aWJsZSwgcGluLA0KPiAJ
CQkgIGJvX2ZyZWUpOw0KPi0tDQo+Mi4yNS4xDQoNCg==
